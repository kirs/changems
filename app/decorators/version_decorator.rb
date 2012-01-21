class VersionDecorator < ApplicationDecorator
  decorates :version

  def link_string
    number.gsub('.', '_')
  end

  def release_notes
    @rendered_release_notes ||= render_release_notes.html_safe
  end

  private

  def render_release_notes
    if version.file_extention =~ /md|mkdn?|mdown|markdown/
      Redcarpet::Markdown.new(Redcarpet::Render::HTML.new).render(version.release_notes)
    else # Assume plaintext
      "<pre>#{version.release_notes}</pre>"
    end
  end
end
