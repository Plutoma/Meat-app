Feature: Evaluating a Weka classifier
  In order to get information about the preformance of a classifier
  I want to evaluate it

  Scenario Outline: Use a classifier on a data instance and evaluate it
    Given the unsupervised Weka classifier "<classifier>"
    Then I want to set options "<options>" for it
    And I want to set the dataset parsed from "<file>"
    And I want to print a summary for the dataset
    And I want to set the class index for attribute with index "<index>"
    And I want to instantiate the classifier for my use
    And I want to cross validate the classifier
    And I want to get the summary of the evaluation
    And I want to get the class details of the evaluation
