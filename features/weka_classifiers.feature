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
    | Trees::RandomForest  |
    | Functions::Logistic  |
    | Rules::DecisionTable |
    | Meta::LogitBoost     |


  Scenario Outline: Use a classifier on a data instance
    Given the unsupervised Weka classifier "<classifier>"
    Then I want to set options "<options>" for it
    And I want to set the dataset parsed from "<file>"
    And I want to print a summary for the dataset
    And I want to set the class index for attribute with index "<index>"
    And I want to instantiate the classifier for my use
    And I want to cross validate the classifier
    And I want to get the summary of the evaluation
    And I want to get the class details of the evaluation
    And I want to get the cumulative margin distribution of the evaluation
    And I want to get the precision of the evaluation with the class index
    And I want to get the 