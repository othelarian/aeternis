package inc.othy.aeternity.fragments

import android.content.Context
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import inc.othy.aeternity.R

class ListFragment : Fragment() {
    private var listener: onListFIL? = null

    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        return inflater.inflate(R.layout.fragment_list, container, false)
    }

    fun onButtonPressed() {
        listener?.onListInteraction()
    }

    override fun onAttach(context: Context) {
        super.onAttach(context)
        if (context is onListFIL) { listener = context }
        else { throw RuntimeException("$context must implement OnWelcomeFIL") }
    }

    override fun onDetach() {
        super.onDetach()
        listener = null
    }

    interface onListFIL {
        fun onListInteraction()
    }
}
