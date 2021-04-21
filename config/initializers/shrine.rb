require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/memory"

Cloudinary.config(
cloud_name: ENV['dbvtiagbj'],
api_key:    ENV['179144836251857'],
api_secret: ENV['psP0l_diTxygwN_ze31xMESR810'],
)


Shrine.storages = {
cache: Shrine::Storage::Cloudinary.new(prefix: "cache"), # for direct uploads
store: Shrine::Storage::Cloudinary.new(prefix: "rails_uploads"),
}

if  Rails.env.test?
  Shrine.storages = {
    cache: Shrine::Storage::Memory.new,
    store: Shrine::Storage::Memory.new,
  }
else
 Shrine.storages = {
   cache: Shrine::Storage::FileSystem.new("public", prefix:     "uploads/cache"), # temporary
   store: Shrine::Storage::FileSystem.new("public", prefix: "uploads"),       # permanent
 }
end
Shrine.plugin :activerecord    # loads Active Record integration
Shrine.plugin :cached_attachment_data # enables retaining cached file across form redisplays
Shrine.plugin :restore_cached_data  # extracts metadata for assigned cached files
Shrine.plugin :validation_helpers
Shrine.plugin :validation