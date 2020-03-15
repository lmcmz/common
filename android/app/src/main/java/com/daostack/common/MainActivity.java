package com.daostack.common;

import android.os.Bundle;
import android.os.PersistableBundle;

import com.facebook.react.ReactActivity;

import androidx.annotation.Nullable;
import com.google.firebase.analytics.FirebaseAnalytics;

public class MainActivity extends ReactActivity {

  private FirebaseAnalytics mFirebaseAnalytics;

  /**
   * Returns the name of the main component registered from JavaScript. This is used to schedule
   * rendering of the component.
   */
  @Override
  protected String getMainComponentName() {
    return "common";
  }

  @Override
  public void onCreate(@Nullable Bundle savedInstanceState, @Nullable PersistableBundle persistentState) {
    super.onCreate(savedInstanceState, persistentState);

    mFirebaseAnalytics = FirebaseAnalytics.getInstance(this);

  }
}
