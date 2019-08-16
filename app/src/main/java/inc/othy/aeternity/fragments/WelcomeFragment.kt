package inc.othy.aeternity.fragments

import android.content.Context
import android.os.Bundle
import android.util.Log
import android.view.LayoutInflater
import android.view.View
import android.view.View.GONE
import android.view.View.VISIBLE
import android.view.ViewGroup
import android.widget.LinearLayout
import androidx.fragment.app.Fragment
import inc.othy.aeternity.R

class WelcomeFragment : Fragment() {
    private var listener: OnWelcomeFIL? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //
        //
    }

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.fragment_welcome, container, false)
        view.findViewById<LinearLayout>(R.id.welcome_first_layout).visibility = VISIBLE
        view.findViewById<LinearLayout>(R.id.welcome_activation_layout).visibility = GONE
        view.findViewById<LinearLayout>(R.id.welcome_configure_layout).visibility = GONE
        return view
    }

    fun onButtonPressed() {
        listener?.onWelcomeInteraction()
    }

    override fun onAttach(context: Context) {
        super.onAttach(context)
        if (context is OnWelcomeFIL) { listener = context }
        else { throw RuntimeException("$context must implement OnWelcomeFIL") }
    }

    override fun onDetach() {
        super.onDetach()
        listener = null
    }

    interface OnWelcomeFIL {
        fun onWelcomeInteraction()
    }
}
