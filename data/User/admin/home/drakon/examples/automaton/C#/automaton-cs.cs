// Autogenerated with DRAKON Editor 1.31
using System;
using System.Collections.Generic;
using System.Text;

namespace AutomatonTest {

// Look: these constants are used in the BabyFrog state machine
public class Frog {
	public const int Food = 20;
	public const int Sleep = 10;
}

public interface IMachine
{
	object OnMessage(int messageType, char c);
	void Shutdown();
}	

public enum TokenType
{
	None,
	Identifier,
	Number,
	Operator
}

public class Token
{
	public readonly String Text;
	public readonly TokenType Type;
	public Token(string text, TokenType type)
	{
		Text = text;
		Type = type;
	}
	public override string ToString()
	{
		return String.Format("{0} {1}", Text, Type);
	}
}

public class Lexer {

	private static readonly List<string> LongOperators = new List<string>
		{ "==", "<=", ">=", "!=", "&&", "||" };
	private static readonly bool[] OperatorChars = new bool[255];
	
	


    public partial class LexerMachine
        : IMachine
    {
        // Currently built token
        internal readonly StringBuilder Buffer = new StringBuilder();
        // Current list of tokens.
        internal readonly List<Token> Tokens = new List<Token>();

        public enum StateNames {
            Destroyed,
            Idle,
            Identifier,
            Number,
            Operator
        }

        private StateNames _state = StateNames.Idle;

        public StateNames State {
            get { return _state; }
            internal set { _state = value; }
        }

        public const int DigitMessage = 1;
        public const int LetterMessage = 2;
        public const int OperatorMessage = 3;
        public const int WhitespaceMessage = 4;
        public const int dummyMessage = 5;

        public object OnMessage(int messageType, char c) {
            switch (messageType) {
                case DigitMessage:
                    return Digit(c);
                case LetterMessage:
                    return Letter(c);
                case OperatorMessage:
                    return Operator(c);
                case WhitespaceMessage:
                    return Whitespace(c);
                case dummyMessage:
                    return dummy(c);
                default:
                    return null;
            }
        }

        public object Digit(char c) {
            switch (State) {
                case StateNames.Idle:
                    return Idle_Digit(c);
                case StateNames.Identifier:
                    return Identifier_Digit(c);
                case StateNames.Number:
                    return Number_Digit(c);
                case StateNames.Operator:
                    return Operator_Digit(c);
                default:
                    return null;
            }
        }

        public object Letter(char c) {
            switch (State) {
                case StateNames.Idle:
                    return Idle_Letter(c);
                case StateNames.Identifier:
                    return Identifier_Letter(c);
                case StateNames.Number:
                    return Number_Letter(c);
                case StateNames.Operator:
                    return Operator_Letter(c);
                default:
                    return null;
            }
        }

        public object Operator(char c) {
            switch (State) {
                case StateNames.Idle:
                    return Idle_Operator(c);
                case StateNames.Identifier:
                    return Identifier_Operator(c);
                case StateNames.Number:
                    return Number_Operator(c);
                case StateNames.Operator:
                    return Operator_Operator(c);
                default:
                    return null;
            }
        }

        public object Whitespace(char c) {
            switch (State) {
                case StateNames.Idle:
                    return Idle_Whitespace(c);
                case StateNames.Identifier:
                    return Identifier_Whitespace(c);
                case StateNames.Number:
                    return Number_Whitespace(c);
                case StateNames.Operator:
                    return Operator_Whitespace(c);
                default:
                    return null;
            }
        }

        public object dummy(char c) {
            switch (State) {
                case StateNames.Idle:
                case StateNames.Identifier:
                case StateNames.Number:
                    return Number_dummy(c);
                case StateNames.Operator:
                default:
                    return null;
            }
        }

        private object Idle_Whitespace(char c) {
            // item 216
            State = StateNames.Idle;
            return null;
        }

        private object Idle_Letter(char c) {
            // item 237
            AddChar(this, c);
            // item 240
            State = StateNames.Identifier;
            return null;
        }

        private object Idle_Digit(char c) {
            // item 238
            AddChar(this, c);
            // item 241
            State = StateNames.Number;
            return null;
        }

        private object Idle_Operator(char c) {
            // item 239
            AddChar(this, c);
            // item 242
            State = StateNames.Operator;
            return null;
        }

        private object Identifier_Whitespace(char c) {
            // item 258
            CreateIdentifier(this);
            // item 224
            State = StateNames.Idle;
            return null;
        }

        private object Identifier_Letter(char c) {
            // item 252
            AddChar(this, c);
            // item 255
            State = StateNames.Identifier;
            return null;
        }

        private object Identifier_Digit(char c) {
            // item 253
            AddChar(this, c);
            // item 256
            State = StateNames.Identifier;
            return null;
        }

        private object Identifier_Operator(char c) {
            // item 259
            CreateIdentifier(this);
            // item 254
            AddChar(this, c);
            // item 257
            State = StateNames.Operator;
            return null;
        }

        private object Number_Whitespace(char c) {
            // item 275
            CreateNumber(this);
            // item 227
            State = StateNames.Idle;
            return null;
        }

        private object Number_Letter(char c) {
            // item 269
            AddChar(this, c);
            // item 272
            State = StateNames.Number;
            return null;
        }

        private object Number_Digit(char c) {
            // item 270
            AddChar(this, c);
            // item 273
            State = StateNames.Number;
            return null;
        }

        private object Number_Operator(char c) {
            // item 276
            CreateNumber(this);
            // item 271
            AddChar(this, c);
            // item 274
            State = StateNames.Operator;
            return null;
        }

        private object Number_dummy(char c) {
            // item 274
            State = StateNames.Operator;
            return null;
        }

        private object Operator_Whitespace(char c) {
            // item 292
            CreateOperator(this);
            // item 219
            State = StateNames.Idle;
            return null;
        }

        private object Operator_Letter(char c) {
            // item 293
            CreateOperator(this);
            // item 286
            AddChar(this, c);
            // item 289
            State = StateNames.Identifier;
            return null;
        }

        private object Operator_Digit(char c) {
            // item 294
            CreateOperator(this);
            // item 287
            AddChar(this, c);
            // item 290
            State = StateNames.Number;
            return null;
        }

        private object Operator_Operator(char c) {
            // item 295
            if (TryMakeLongOperator(this, c)) {
                // item 298
                State = StateNames.Idle;
                return null;
            } else {
                // item 299
                CreateOperator(this);
                // item 288
                AddChar(this, c);
                // item 291
                State = StateNames.Operator;
                return null;
            }
        }

        public void Shutdown() {
            if (State == StateNames.Destroyed) {
                return;
            }
            State = StateNames.Destroyed;
            
        }
    }

    public partial class Fragile
    {
        

        public enum StateNames {
            Destroyed,
            Working
        }

        private StateNames _state = StateNames.Working;

        public StateNames State {
            get { return _state; }
            internal set { _state = value; }
        }

        public const int helloMessage = 1;

        public object OnMessage(int messageType, int msg) {
            switch (messageType) {
                case helloMessage:
                    return hello(msg);
                default:
                    return null;
            }
        }

        public object hello(int msg) {
            switch (State) {
                case StateNames.Working:
                    return Working_hello(msg);
                default:
                    return null;
            }
        }

        private object Working_hello(int msg) {
            // item 552
            Console.WriteLine("oh dear...");
            // item 542
            Shutdown();
            return null;
        }

        private object Working_default(int msg) {
            // item 551
            State = StateNames.Working;
            return null;
        }

        public void Shutdown() {
            if (State == StateNames.Destroyed) {
                return;
            }
            State = StateNames.Destroyed;
            // item 553
            Console.WriteLine("Fragile: Cleaning up");
        }
    }

    public static List<Token> Lex(string text) {
        // item 310
        Init();
        var lexer = new LexerMachine();
        foreach (char c in text) {
            // item 315
            if ((c == '_') || (Char.IsLetter(c))) {
                // item 323
                lexer.Letter(c);
            } else {
                // item 320
                if (Char.IsDigit(c)) {
                    // item 324
                    lexer.Digit(c);
                } else {
                    // item 325
                    if (IsOperator(c)) {
                        // item 328
                        lexer.Operator(c);
                    } else {
                        // item 329
                        lexer.Whitespace(' ');
                    }
                }
            }
        }
        // item 314
        lexer.Whitespace(' ');
        // item 313
        return lexer.Tokens;
    }

    public static List<Token> LexWeak(string text) {
        // item 475
        Init();
        var lexer = new LexerMachine();
        foreach (char c in text) {
            // item 480
            if ((c == '_') || (Char.IsLetter(c))) {
                // item 488
                lexer.OnMessage(
                	LexerMachine.LetterMessage,
                	c
                );
            } else {
                // item 485
                if (Char.IsDigit(c)) {
                    // item 495
                    lexer.OnMessage(
                    	LexerMachine.DigitMessage,
                    	c
                    );
                } else {
                    // item 490
                    if (IsOperator(c)) {
                        // item 496
                        lexer.OnMessage(
                        	LexerMachine.OperatorMessage,
                        	c
                        );
                    } else {
                        // item 497
                        lexer.OnMessage(
                        	LexerMachine.WhitespaceMessage,
                        	' '
                        );
                    }
                }
            }
        }
        // item 498
        lexer.OnMessage(
        	LexerMachine.WhitespaceMessage,
        	' '
        );
        // item 478
        return lexer.Tokens;
    }

    public static void Main() {
        // item 161
        string text = "foo.Bar(34 / 4-(18+m * 3));";
        Console.WriteLine("Text:\n{0}", text);
        // item 207
        Console.WriteLine();
        Console.WriteLine("Strongly-typed state machine test");
        Console.WriteLine("Tokens:");
        // item 457
        List<Token> tokens = Lex(text);
        foreach (Token token in tokens) {
            // item 206
            Console.WriteLine(token);
        }
        // item 467
        Console.WriteLine();
        Console.WriteLine("Weakly-typed state machine test");
        Console.WriteLine("Tokens:");
        // item 468
        List<Token> tokens2 = LexWeak(text);
        foreach (Token token2 in tokens2) {
            // item 466
            Console.WriteLine(token2);
        }
        // item 532
        var frog = new BabyFrog();
        // item 533
        Console.WriteLine("The baby frog says:");
        Console.Write(frog.State.ToString() + "/Sleep: ");
        Console.WriteLine(frog.Sleep(0));
        Console.Write(frog.State.ToString() + "/Food: ");
        Console.WriteLine(frog.Food(0));
        Console.Write(frog.State.ToString() + "/Food: ");
        Console.WriteLine(frog.Food(0));
        Console.Write(frog.State.ToString() + "/Sleep: ");
        Console.WriteLine(frog.Sleep(0));
        // item 554
        var frag = new Fragile();
        // item 555
        frag.hello(0);
        // item 557
        Console.WriteLine("No shutdown below");
        // item 556
        frag.Shutdown();
    }

    private static void AddChar(LexerMachine lexer, char c) {
        // item 120
        lexer.Buffer.Append(c);
    }

    private static void CreateIdentifier(LexerMachine lexer) {
        // item 126
        CreateToken(lexer, TokenType.Identifier);
    }

    private static void CreateNumber(LexerMachine lexer) {
        // item 142
        CreateToken(lexer, TokenType.Number);
    }

    private static void CreateOperator(LexerMachine lexer) {
        // item 148
        CreateToken(lexer, TokenType.Operator);
    }

    private static void CreateToken(LexerMachine lexer, TokenType type) {
        // item 132
        if (lexer.Buffer.Length == 0) {
            
        } else {
            // item 135
            string text = lexer.Buffer.ToString();
            lexer.Buffer.Length = 0;
            // item 136
            Token token = new Token(text, type);
            lexer.Tokens.Add(token);
        }
    }

    private static void Init() {
        // item 203
        OperatorChars['!'] = true;
        OperatorChars['='] = true;
        OperatorChars['<'] = true;
        OperatorChars['>'] = true;
        OperatorChars['-'] = true;
        OperatorChars['+'] = true;
        OperatorChars['/'] = true;
        OperatorChars['\\'] = true;
        OperatorChars['*'] = true;
        OperatorChars['%'] = true;
        OperatorChars['('] = true;
        OperatorChars[')'] = true;
        OperatorChars['['] = true;
        OperatorChars[']'] = true;
        OperatorChars['{'] = true;
        OperatorChars['}'] = true;
        OperatorChars[':'] = true;
        OperatorChars['.'] = true;
        OperatorChars[';'] = true;
        OperatorChars[','] = true;
        OperatorChars['^'] = true;
        OperatorChars['|'] = true;
        OperatorChars['&'] = true;
        OperatorChars['"'] = true;
        OperatorChars['\''] = true;
    }

    private static bool IsOperator(char c) {
        // item 194
        if (c >= OperatorChars.Length) {
            // item 197
            return false;
        } else {
            // item 193
            return OperatorChars[c];
        }
    }

    private static bool TryMakeLongOperator(LexerMachine lexer, char c) {
        // item 154
        char previous = lexer.Buffer[0];
        char[] chars = { previous, c };
        string text = new String(chars);
        // item 155
        if (LongOperators.Contains(text)) {
            // item 158
            lexer.Buffer.Length = 0;
            Token token = new Token(text, TokenType.Operator);
            lexer.Tokens.Add(token);
            // item 159
            return true;
        } else {
            // item 160
            return false;
        }
    }
}
}
