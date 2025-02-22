Feature: Answering a quiz question with multiple choice

  Background:
    Given a question "What countries are in Europe?"
    * with answers:
      | Italy   | * | And where is it? |
      | France  | * | You wish!        |
      | Morocco |   | Almost :D        |
      | Spain   | * | Manana!          |
    * which displays only incorrect answer explanations
    * which displays all answer explanations
    * with explanation "Italy, France, and Spain are in Europe. Morocco is in Africa."
    * saved and bookmarked as "Europe"

  Scenario Outline: Answers are considered correct only if
    - all correct answers are selected, and,
    - no incorrect answer is selected.
    When I take question "Europe"
    And I answer "<answer>"
    Then I see feedback "<feedback>"
    And I see the question explanation
    Examples:
      | answer                        | feedback   |
      | Italy                         | Incorrect! |
      | Italy, France                 | Incorrect! |
      | Italy, France, Morocco        | Incorrect! |
      | Italy, France, Spain          | Correct!   |
      | Italy, France, Morocco, Spain | Incorrect! |

  Scenario:
    When I take question "Europe"
    And I answer "France, Morocco, Spain"
    Then I see the answer explanations for answers
      | answer  | explanation      |
      | Italy   | And where is it? |
      | France  | You wish!        |
      | Morocco | Almost :D        |
      | Spain   | Manana!          |
    And I see the question explanation

  Scenario:
    When I take question "Europe"
    And I answer "France, Italy, Spain"
    Then I see the answer explanations for answers
      | answer  | explanation      |
      | Italy   | And where is it? |
      | France  | You wish!        |
      | Morocco | Almost :D        |
      | Spain   | Manana!          |
    And I see the question explanation
