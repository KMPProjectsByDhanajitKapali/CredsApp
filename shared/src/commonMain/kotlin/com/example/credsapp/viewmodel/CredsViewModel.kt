package com.example.credsapp.viewmodel

import com.example.kmm.core.coroutines.AppCoroutineDispatchers
import com.example.kmm.core.viewmodel.BaseViewModel

class CredsViewModel(
    appCoroutineDispatchers: AppCoroutineDispatchers
): BaseViewModel<ICredsViewModel.UIState, ICredsViewModel.UIEvent, ICredsViewModel.Action>(
    dispatchers = appCoroutineDispatchers,
    initialState = ICredsViewModel.UIState.Loading
)  {
    override val TAG: String
        get() = "CredsViewModel"

    override fun add(action: ICredsViewModel.Action) {
        when (action) {
            ICredsViewModel.Action.SearchStarted -> {

            }

            ICredsViewModel.Action.SearchCanceled -> {

            }

            is ICredsViewModel.Action.SearchForText -> {


            }
        }
    }

}