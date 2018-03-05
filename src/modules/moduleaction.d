module webd.modules.moduleaction;

interface IModuleAction { }

final class ModuleAction(T) : IModuleAction
{
    private:
    /// The associated delegate.
    void delegate(T) _delegate;

    /// The associated function pointer.
    void function(T) _functionPointer;

    public:
    /**
    *   Creates a new module action.
    *   Params:
    *       d = The delegate.
    */
    this(void delegate(T) d)
    {
        _delegate = d;
    }

    /**
    *   Creates a new module action.
    *   Params:
    *       f = The function pointer..
    */
    this(void function(T) f)
    {
        _functionPointer = f;
    }

    /**
    *   Operator overload for using the wrapper as a call.
    */
    void opCall(T args)
    {
        if (_delegate)
        {
          _delegate(args);
        }
        else if (_functionPointer)
        {
          _functionPointer(args);
        }
    }
}
