defmodule Screenshotter.CleanerTest do
  use ExUnit.Case, async: true
  import Screenshotter.Cleaner, only: [run: 1]
  @screenshot_dir Application.get_env(:screenshotter, :screenshot_dir)

  #All create an image and then remove it
  @moduletag :remove_screenshot

  test "#run" do
    screenshot_path = "#{@screenshot_dir}/random_file.png"
    File.touch!(screenshot_path)

    run(screenshot_path)
    assert File.exists?(screenshot_path) == false
  end
end
