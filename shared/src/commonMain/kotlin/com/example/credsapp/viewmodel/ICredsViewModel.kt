package com.example.credsapp.viewmodel

import com.example.credsapp.model.CreditDebitModel
import com.example.credsapp.model.ListType
import com.example.kmm.core.viewmodel.IFlowViewModel

interface ICredsViewModel<S, E, A>: IFlowViewModel<S, E, A> {

    sealed class UIState {
        object Loading : UIState()
        data class Initialized(
            val credList: List<CreditDebitModel>,
            val selectedListType: ListType,
            val presentedList: List<CreditDebitModel>,
            val isSearching: Boolean,
            val searchString: String
        ): UIState()
    }

    sealed class UIEvent {
        data class IsSearching(val status: Boolean): UIEvent()
    }

    sealed class Action {
        object SearchStarted: Action()

        object  SearchCanceled: Action()

        data class SearchForText(val text: String): Action()
    }
}