Feature: Using a Weka classifier
  In order to classify an instance data
  I want to use a Weka classifier

  Scenario Outline: Understand options and usage
    Given the Weka "<classifier>" classifier
    Then I want to print a "description"
    And I want to print an options list

  Examples: Classifiers
    | classifier           |
    | Bayes::NaiveBayes    |
    | Lazy::KStar          |
    | Trees::RandomFor