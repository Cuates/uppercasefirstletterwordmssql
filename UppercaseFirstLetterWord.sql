-- =============================================
--       File: UppercaseFirstLetterWord
--    Created: 07/19/2020
--    Updated: 07/19/2020
-- Programmer: Cuates
--  Update By: Cuates
--    Purpose: Uppercase first letter of a word
-- =============================================
CREATE FUNCTION [dbo].[UppercaseFirstLetterWord]
(
  -- Parameters
  @InputString nvarchar(max) = null
)
RETURNS nvarchar(max)
AS
BEGIN
  -- URLs
  -- http://www.sql-server-helper.com/functions/initcap.aspx
  -- https://stackoverflow.com/questions/55054/what-s-the-best-way-to-capitalise-the-first-letter-of-each-word-in-a-string-in-s

  -- Declare variables
  declare @curPos int
  declare @curChar char(1)
  declare @prevChar char(1)
  declare @stringResult nvarchar(max)

  -- Set variables
  set @stringResult = lower(@InputString)
  set @curPos = 1

  -- Loop through user defined string
  while @curPos <= len(@InputString)
    begin
      -- Set variable with sub string of character
      set @curChar = substring(@InputString, @curPos, 1)

      -- Set previous character to variable
      set @prevChar =
      case
        -- Check if current position is 1
        when @curPos = 1
          then
            -- Set previous character to blank space
            ' '
        else
          -- Else set variable to the previous character
          substring(@InputString, @curPos - 1, 1)
      end

      -- Check if the previous character is any of the defined characters
      if @prevChar in (' ')--, ';', ':', '!', '?', ',', '.', '_', '-', '/', '&', '''', '(')
        begin
          -- Set variable with an uppercase letter of the new word
          set @stringResult = stuff(@stringResult, @curPos, 1, upper(@curChar))
        end

      -- Increment current position
      set @curPos += 1
    end

    -- Return string result
    return @stringResult
END