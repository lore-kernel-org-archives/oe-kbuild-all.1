Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 295DD3876DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 09:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768383322; cv=none; b=YU1ZruNPt9+eF4FR3AIa/okzZnIw4gYSsq+iNFYbTp0egGaR+H4i6NhE0QO0RrmY4Er1lv/60iw9c6AB7RA30J1MpaI/n6ImadBENuURUzCoNTk/H4kNQGHl/xh7jnyvSyW+J9+WGkieJEaG+QQaEahGDXRSvk0fAB7N0fUMA+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768383322; c=relaxed/simple;
	bh=8WX5ebI/nrjoOHSHCPGxwF9r8KML0SuqGFPnA1jahiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qc3rd4x8T7GmDZdDA7/RlXwGoHro4slh35AlLRj00OVDWl8MpwszV8S1HFAugsqCoeCweA3XAi6fPJV7QHtmL/3ZMInUxVEtS6RJ7+btyXjfVGq66WSeksHtpBVjSAvtIWm+cPmREpQV9YcCgSZS1oXwi6Wquv6OosdPmbiMdzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PnPm25c7; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lS/SX5F0; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PnPm25c7";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lS/SX5F0"
Date: Wed, 14 Jan 2026 10:35:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768383319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4EkfUbKPEge0nNxSsXaGkgoPRBCqUEmSGULv/l3Sjk=;
	b=PnPm25c7lvaoq6SdNO7X/Lnj/m38/MEDfZ+DT4nh5QvtwkUXBqqEW1oxbEWOYRlgT7gutg
	7nuxt9BxXORLJQTo5g84MTZyJym72SKPR4Kor8+051/evQGaq3MjPFw4xN/HBIlqol86of
	/jElRszP4p70bzdRre164yW3JkT7dP6vs3qhPazmwpsCB4WfvPZ0oKCSkJlpRHmCMjHUBY
	0fjWdQnH6vIiO3DRKQt6yKliKO8ObEYIItpN8DD4VKnIU+UB/N2KaoLKtGLLsPYElc8mks
	zwSDWfaD2lwW8gwNg1yS5iLwM08qFym8/Wwjb1npfCoUdYo0oGUE6GP2yqXGiQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768383319;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T4EkfUbKPEge0nNxSsXaGkgoPRBCqUEmSGULv/l3Sjk=;
	b=lS/SX5F0U3w8ZDD3k0LglN06MmWJxYlQU/LMMaDX3v644PH5n0Ec0iiWsw4gVQ2ftrjAiY
	6UAmki3qrCDOlyDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>
Subject: Re: kernel/futex/core.c:505:38: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <20260114093517.NIa6_vRS@linutronix.de>
References: <202601131901.j7WJ9OeZ-lkp@intel.com>
 <20260113115946.L49jwJMx@linutronix.de>
 <20260113121040.GC831050@noisy.programming.kicks-ass.net>
 <20260113173708.HMfBY0wF@linutronix.de>
 <20260113193919.GA810197@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260113193919.GA810197@noisy.programming.kicks-ass.net>

On 2026-01-13 20:39:19 [+0100], Peter Zijlstra wrote:
> tip/locking/core removes all the sparse lock annotations in favour of
> clang-22 tcsan.

So this is what salvation looks like? With

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index cf7e610eac429..b9e6be1c30179 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -965,6 +965,7 @@ int futex_unqueue(struct futex_q *q)
 }
=20
 void futex_q_lockptr_lock(struct futex_q *q)
+	__acquires(q->lock_ptr)
 {
 	spinlock_t *lock_ptr;
=20
@@ -1443,12 +1444,15 @@ static void futex_cleanup(struct task_struct *tsk)
 void futex_exit_recursive(struct task_struct *tsk)
 {
 	/* If the state is FUTEX_STATE_EXITING then futex_exit_mutex is held */
-	if (tsk->futex_state =3D=3D FUTEX_STATE_EXITING)
+	if (tsk->futex_state =3D=3D FUTEX_STATE_EXITING) {
+		lockdep_assert_held(&tsk->futex_exit_mutex);
 		mutex_unlock(&tsk->futex_exit_mutex);
+	}
 	tsk->futex_state =3D FUTEX_STATE_DEAD;
 }
=20
 static void futex_cleanup_begin(struct task_struct *tsk)
+	__acquires(&tsk->futex_exit_mutex)
 {
 	/*
 	 * Prevent various race issues against a concurrent incoming waiter
@@ -1475,6 +1479,7 @@ static void futex_cleanup_begin(struct task_struct *t=
sk)
 }
=20
 static void futex_cleanup_end(struct task_struct *tsk, int state)
+	__releases(&tsk->futex_exit_mutex)
 {
 	/*
 	 * Lockless store. The only side effect is that an observer might
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 30c2afa038890..423989ffa5e91 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -379,6 +379,7 @@ extern int fixup_pi_owner(u32 __user *uaddr, struct fut=
ex_q *q, int locked);
  */
 static inline void
 double_lock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb=
2)
+	__cond_acquires(true, &hb2->lock)
 {
 	if (hb1 > hb2)
 		swap(hb1, hb2);
@@ -391,9 +392,12 @@ double_lock_hb(struct futex_hash_bucket *hb1, struct f=
utex_hash_bucket *hb2)
 static inline void
 double_unlock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *=
hb2)
 {
+	lockdep_assert_held(&hb1->lock);
 	spin_unlock(&hb1->lock);
-	if (hb1 !=3D hb2)
+	if (hb1 !=3D hb2) {
+		lockdep_assert_held(&hb2->lock);
 		spin_unlock(&hb2->lock);
+	}
 }
=20
 /* syscalls */
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index dacb2330f1fbc..e45ad40b59550 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -621,6 +621,7 @@ static int wake_futex_pi(u32 __user *uaddr, u32 uval,
 	u32 curval, newval;
 	int ret =3D 0;
=20
+	lockdep_assert_held(&pi_state->pi_mutex.wait_lock);
 	new_owner =3D top_waiter->task;
=20
 	/*

I managed to pass core.c But then started looking at pi.c I run into
this:

| kernel/futex/pi.c:706:7: error: expecting raw_spinlock 'q->pi_state->pi_m=
utex.wait_lock' to be held at start of each loop
|      [-Werror,-Wthread-safety-analysis]
|  706 |         if (!argowner) {
|      |              ^
| kernel/futex/pi.c:811:2: note: raw_spinlock acquired here
|  811 |         raw_spin_lock_irq(&pi_state->pi_mutex.wait_lock);
|      |         ^
| include/linux/spinlock.h:275:34: note: expanded from macro 'raw_spin_lock=
_irq'
|  275 | #define raw_spin_lock_irq(lock)         _raw_spin_lock_irq(lock)
|      |                                         ^
| kernel/futex/pi.c:792:2: error: releasing raw_spinlock 'q->pi_state->pi_m=
utex.wait_lock' that was not held
|      [-Werror,-Wthread-safety-analysis]
|  792 |         raw_spin_unlock_irq(&pi_state->pi_mutex.wait_lock);

it can be told from the context that waitlock is held at start of each
loop. It is just that unlock+lock combo after handle_err: that breaks
llvm.
cond_acquires() works and lockdep_assert_held() is taken into account
which is an improvement over sparse. For futex_cleanup_begin()/_end() it
seems to lose the context for futex_exit_mutex but this is all local=E2=80=
=A6

Sebastian
