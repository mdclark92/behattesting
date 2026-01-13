@local @local_ltiusage
Feature: Testing view_ltiusage in local_ltiusage
  As an admin
  I need to view existing tools

  Background:
    Given the following "mod_lti > tool types" exist:
      | name            | description        | baseurl                                   | coursevisible | state |
      | Teaching Tool 1 | Tool 1 description | /mod/lti/tests/fixtures/tool_provider.php | 1             | 1     |
      | Teaching Tool 2 | Tool 2 description | /mod/lti/tests/fixtures/tool_provider.php | 2             | 1     |
    And the following "courses" exist:
      | fullname | shortname | category | enablecompletion | showcompletionconditions |
      | Course 1 | C1        | 0        | 1                | 1                        |
    And the following "activities" exist:
      | activity | name          | course | idnumber | completion | completionview | completionusegrade |
      | lti      | Music history | C1     | lti1     | 2          | 1              | 1                  |
    And I log in as "admin"
    And I navigate to "Plugins > local plugins > LTI Usage" in site administration

    @javascript
    Scenario: View LTI Usage.
    Then I should see "Music history"