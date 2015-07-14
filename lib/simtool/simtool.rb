module Simtool
  class Photo
    EXTENSIONS = ['.jpg', '.jpeg', '.tiff', '.png']

    attr_accessor :developer_dir
    attr_accessor :simctl
    attr_accessor :devices
    attr_accessor :device_id

    attr_accessor :failed_to_import
    attr_accessor :import_count

    def initialize
      setup
    end

    def setup
      self.developer_dir = `xcode-select -p`.chomp
      self.simctl = File.join(developer_dir, 'Platforms/iPhoneSimulator.platform/Developer/usr/bin/simctl')
      self.get_devices
      self.detect_booted_device
    end

    def get_devices
      self.devices = `#{simctl} list devices`.split("\n")
    end

    def detect_booted_device
      booted = self.devices.find {|e| e.include? '(Booted)' }
      match = Regexp.new(/\((.+?)\)/).match(booted)
      self.device_id = match[1]
    end

    def add file
      if EXTENSIONS.any? {|e| file.downcase.end_with? e }
        photos = [file]
      else
        photos = EXTENSIONS.inject([]) {|s, e| s + Dir[File.expand_path(File.join(file, "*#{e}"))]}
      end
      add_photos photos
    end

    def add_photos files=[]
      import_count = 0
      failed_to_import = []
      files.each do |e|
        cmd = "#{simctl} addphoto #{device_id} #{e}"
        output = `#{cmd}`
        if $?.success?
          import_count += 1
        else
          failed_to_import << e
        end
      end
    end

    def self.add file
      @photo ||= new
      @photo.add file
    end
  end
end
