require_relative "../tools/write_hip_chat"

class PeterMessenger

  attr_accessor :message

  def initialize
    @message = message
  end

  def message
    "Hey Peter, I read an article in #{newspaper} yesterday about #{issue} where #{expert} said #{unintelligible_bullshit}."
  end

  private

  def newspaper
    [
      "The New Yorker",
      "Forbes",
      "The Economist",
      "The New York Magazine",
      "The New York Review of Books"
    ].sample
  end

  def issue
    rand(2).even? ? topical_issue : academic_issue
  end

  def topical_issue
    [
      "the influence of money in politics",
      "Puerto Rico defaulting on its debt",
      "Pope Francis",
      "Obamacare",
      "Bernie Sanders",
      "gentrification"
    ].sample
  end

  def academic_issue
    [
      "very large prime numbers",
      "programmed cell death",
      "Turing-complete programming languages",
      "non-Newtonian fluids",
      "Moore's Law",
    ].sample
  end

  def expert
    [
      "liberal economist Paul Krugman",
      "chief CNN medical correspondent Sanjay Gupta",
      "political pundit James Carville",
      "former president Jimmy Carter",
      "Scala creator Martin Odersky",
      "linguist Noam Chomsky",
      "author Thomas Pynchon"
    ].sample
  end

  def unintelligible_bullshit
    [
      "capitalist discourse suggests that context is a product of the collective unconscious, given that culture is equal to language",
      "the premise of precapitalist socialism states that sexuality serves to disempower minorities",
      "society is part of the collapse of reality",
      "if precapitalist socialism holds, we have to choose between Marxist class and neocultural socialism",
      "the primary theme of the works of Eco is the bridge between society and narrativity",
      "an abundance of appropriations concerning the economy, and some would say the meaninglessness, of dialectic class may be found",
      "if one examines capitalist discourse, one is faced with a choice: either accept the cultural paradigm of expression or conclude that the State is intrinsically meaningless, but only if precapitalist socialism is invalid; if that is not the case, Sontag’s model of capitalist discourse is one of \"the textual paradigm of context\", and thus part of the stasis of art",
      "in Gravity’s Rainbow, Pynchon examines the cultural paradigm of expression; in The Crying of Lot 49, however, he analyses capitalist discourse",
      "a descriptively adequate grammar does not affect the structure of irrelevant intervening contexts in selectional rules. It must be emphasized, once again, that a case of semigrammaticalness of a different sort is rather different from a parasitic gap construction.",
      "a consequence of the approach just outlined is that the earlier discussion of deviance is not subject to nondistinctness in the sense of distinctive feature theory",
      "clearly, a case of semigrammaticalness of a different sort cannot be arbitrary in a corpus of utterance tokens upon which conformity has been defined by the paired utterance test",
      "the fiction of pop culture replays (in parodic form) the historicization of the specular economy"
    ].sample
  end
end

WriteHipChat.send(PeterMessenger.new.message)
