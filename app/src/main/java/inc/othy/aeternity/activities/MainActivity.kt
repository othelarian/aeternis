package inc.othy.aeternity.activities

import android.os.Bundle
import android.util.Log
import androidx.appcompat.app.AppCompatActivity
import androidx.fragment.app.Fragment
import androidx.navigation.NavController
import androidx.navigation.findNavController
import inc.othy.aeternity.R
import inc.othy.aeternity.fragments.ListFragment
import inc.othy.aeternity.fragments.WelcomeFragment

class MainActivity : AppCompatActivity()
    , WelcomeFragment.OnWelcomeFIL
    , ListFragment.onListFIL {

    var navController: NavController? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        navController = findNavController(R.id.fragment)
        navController?.navigate(R.id.welcome)
        //
        //
    }

    override fun onStart() {
        super.onStart()
        //
        //val currDestination = navController?.currentDestination
        //currDestination?.
        //
    }

    override fun onWelcomeInteraction() {
        //
        //
    }

    override fun onListInteraction() {
        //
        //
    }
}
