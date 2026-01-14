Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0603A346E46;
	Wed, 14 Jan 2026 11:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768388924; cv=none; b=JfNvm73Wo43GS6f+zd8s4wPB9ieNaj6kSGAy/9QZf4Zp+c5pn0mDkoLi6y/j8gWOoKWwgZpNWzLZPTtVe1e2c8JyvG9F0dbx9kkkkA9hOW15nbF70BimtfGOwfBGOr2SSCzJAa+DizHJ1Zdmfc3A0rWOEdiMN2WTVJB8I1M7ASg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768388924; c=relaxed/simple;
	bh=FcqSMDLeekQM0zrHdiDnYsV/sCNO47UF6H+ApnIYfcU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgSCmxk2r/8Xi6Rw+qqmdkDcCfd1FFe2x1awThiQm6dMDEdlQQoyg8TeRaeWjzTMHpxjqgJd9vy4Pctu3HuZE4h8vjdEA4phNZfpMBA3a2sMXV0i1HB9NdxIL+IUjAR0vAXFNzKEZkBAn5aJKtT/Etxcl8HGOwpn0UqJstb1jbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=GiBc1R7R; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="GiBc1R7R"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=n6OivGIbizTbZ2sN/lJk2AWuNpugDad/rENmDjWCUDE=; b=GiBc1R7R8X1aiqT6R3fmluUbLL
	3qTGayr04Dyhaj/o9jHWLpghf44tVKHppvm9l4Y39N4gg8LOvuS2e5Jg5Fe8cuy9ZUTZhvb8jSuUs
	hGJCdzxb55GADPsczHk7F/VraP0H6qwV/R7usu/ac+fPtmK0LTvtm3BOUsm67ItuPZhAKxKAPUKkV
	mFl69vvyMFD8606s3vQA4QUv5cCCLO6CjMaKH0P1vTWleVEb1OCxUBCSjoIy3r7GR+CF4g4i3BXrC
	M2BDWykTJ4V4d5v/Uj5MFwrkr/V74Hm4pVRqSmyI7ZA4im6UcqDf3SUp0kgI3k72YDKXkeXUy4xuy
	fTPPtYYg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfyjm-000000065zR-1Nr2;
	Wed, 14 Jan 2026 11:08:30 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D19713005AA; Wed, 14 Jan 2026 12:08:28 +0100 (CET)
Date: Wed, 14 Jan 2026 12:08:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>
Subject: Re: kernel/futex/core.c:505:38: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <20260114110828.GE830229@noisy.programming.kicks-ass.net>
References: <202601131901.j7WJ9OeZ-lkp@intel.com>
 <20260113115946.L49jwJMx@linutronix.de>
 <20260113121040.GC831050@noisy.programming.kicks-ass.net>
 <20260113173708.HMfBY0wF@linutronix.de>
 <20260113193919.GA810197@noisy.programming.kicks-ass.net>
 <20260114093517.NIa6_vRS@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260114093517.NIa6_vRS@linutronix.de>

On Wed, Jan 14, 2026 at 10:35:17AM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-01-13 20:39:19 [+0100], Peter Zijlstra wrote:
> > tip/locking/core removes all the sparse lock annotations in favour of
> > clang-22 tcsan.
> 
> So this is what salvation looks like? 

:-)

This seems to build for me. It is the bare basic conversion, without
making use of the fancy __guarded_by() stuff for variables.

---
diff --git a/kernel/futex/Makefile b/kernel/futex/Makefile
index b77188d1fa07..9242110a32e2 100644
--- a/kernel/futex/Makefile
+++ b/kernel/futex/Makefile
@@ -1,3 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
+CONTEXT_ANALYSIS_core.o := y
+CONTEXT_ANALYSIS_syscalls.o := y
+CONTEXT_ANALYSIS_pi.o := y
+CONTEXT_ANALYSIS_requeue.o := y
+CONTEXT_ANALYSIS_waitwake.o := y
+
 obj-y += core.o syscalls.o pi.o requeue.o waitwake.o
diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index cf7e610eac42..36fe2add982b 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -864,7 +864,6 @@ void __futex_unqueue(struct futex_q *q)
 
 /* The key must be already stored in q->key. */
 void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb)
-	__acquires(&hb->lock)
 {
 	/*
 	 * Increment the counter before taking the lock so that
@@ -879,10 +878,10 @@ void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb)
 	q->lock_ptr = &hb->lock;
 
 	spin_lock(&hb->lock);
+	__acquire_ctx_lock(q->lock_ptr);
 }
 
 void futex_q_unlock(struct futex_hash_bucket *hb)
-	__releases(&hb->lock)
 {
 	futex_hb_waiters_dec(hb);
 	spin_unlock(&hb->lock);
@@ -1443,12 +1442,15 @@ static void futex_cleanup(struct task_struct *tsk)
 void futex_exit_recursive(struct task_struct *tsk)
 {
 	/* If the state is FUTEX_STATE_EXITING then futex_exit_mutex is held */
-	if (tsk->futex_state == FUTEX_STATE_EXITING)
+	if (tsk->futex_state == FUTEX_STATE_EXITING) {
+		lockdep_assert_held(&tsk->futex_exit_mutex);
 		mutex_unlock(&tsk->futex_exit_mutex);
+	}
 	tsk->futex_state = FUTEX_STATE_DEAD;
 }
 
 static void futex_cleanup_begin(struct task_struct *tsk)
+	__acquires(&tsk->futex_exit_mutex)
 {
 	/*
 	 * Prevent various race issues against a concurrent incoming waiter
@@ -1475,6 +1477,7 @@ static void futex_cleanup_begin(struct task_struct *tsk)
 }
 
 static void futex_cleanup_end(struct task_struct *tsk, int state)
+	__releases(&tsk->futex_exit_mutex)
 {
 	/*
 	 * Lockless store. The only side effect is that an observer might
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 30c2afa03889..7f0944683e43 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -217,7 +217,7 @@ enum futex_access {
 
 extern int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
 			 enum futex_access rw);
-extern void futex_q_lockptr_lock(struct futex_q *q);
+extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
 extern struct hrtimer_sleeper *
 futex_setup_timer(ktime_t *time, struct hrtimer_sleeper *timeout,
 		  int flags, u64 range_ns);
@@ -311,9 +311,11 @@ extern int futex_unqueue(struct futex_q *q);
 static inline void futex_queue(struct futex_q *q, struct futex_hash_bucket *hb,
 			       struct task_struct *task)
 	__releases(&hb->lock)
+	__releases(q->lock_ptr)
 {
 	__futex_queue(q, hb, task);
 	spin_unlock(&hb->lock);
+	__release_ctx_lock(q->lock_ptr);
 }
 
 extern void futex_unqueue_pi(struct futex_q *q);
@@ -358,9 +360,12 @@ static inline int futex_hb_waiters_pending(struct futex_hash_bucket *hb)
 #endif
 }
 
-extern void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb);
-extern void futex_q_unlock(struct futex_hash_bucket *hb);
+extern void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb)
+	__acquires(&hb->lock)
+	__acquires(q->lock_ptr);
 
+extern void futex_q_unlock(struct futex_hash_bucket *hb)
+	__releases(&hb->lock);
 
 extern int futex_lock_pi_atomic(u32 __user *uaddr, struct futex_hash_bucket *hb,
 				union futex_key *key,
@@ -379,6 +384,9 @@ extern int fixup_pi_owner(u32 __user *uaddr, struct futex_q *q, int locked);
  */
 static inline void
 double_lock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb2)
+	__acquires(&hb1->lock)
+	__acquires(&hb2->lock)
+	__no_context_analysis
 {
 	if (hb1 > hb2)
 		swap(hb1, hb2);
@@ -390,10 +398,16 @@ double_lock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb2)
 
 static inline void
 double_unlock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb2)
+	__releases(&hb1->lock)
+	__releases(&hb2->lock)
+	__no_context_analysis
 {
+	lockdep_assert_held(&hb1->lock);
 	spin_unlock(&hb1->lock);
-	if (hb1 != hb2)
+	if (hb1 != hb2) {
+		lockdep_assert_held(&hb2->lock);
 		spin_unlock(&hb2->lock);
+	}
 }
 
 /* syscalls */
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index dacb2330f1fb..80b3b92dadf4 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -614,6 +614,8 @@ int futex_lock_pi_atomic(u32 __user *uaddr, struct futex_hash_bucket *hb,
 static int wake_futex_pi(u32 __user *uaddr, u32 uval,
 			 struct futex_pi_state *pi_state,
 			 struct rt_mutex_waiter *top_waiter)
+	__must_hold(&pi_state->pi_mutex.wait_lock)
+	__releases(&pi_state->pi_mutex.wait_lock)
 {
 	struct task_struct *new_owner;
 	bool postunlock = false;
@@ -670,6 +672,8 @@ static int wake_futex_pi(u32 __user *uaddr, u32 uval,
 
 static int __fixup_pi_state_owner(u32 __user *uaddr, struct futex_q *q,
 				  struct task_struct *argowner)
+	__must_hold(&q->pi_state->pi_mutex.wait_lock)
+	__must_hold(q->lock_ptr)
 {
 	struct futex_pi_state *pi_state = q->pi_state;
 	struct task_struct *oldowner, *newowner;
@@ -966,6 +970,7 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flags, ktime_t *time, int tryl
 				 * - EAGAIN: The user space value changed.
 				 */
 				futex_q_unlock(hb);
+				__release_ctx_lock(q.lock_ptr);
 				/*
 				 * Handle the case where the owner is in the middle of
 				 * exiting. Wait for the exit to complete otherwise
@@ -1090,6 +1095,7 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flags, ktime_t *time, int tryl
 		if (res)
 			ret = (res < 0) ? res : 0;
 
+		__release_ctx_lock(&hb->lock);
 		futex_unqueue_pi(&q);
 		spin_unlock(q.lock_ptr);
 		if (q.drop_hb_ref) {
@@ -1101,10 +1107,12 @@ int futex_lock_pi(u32 __user *uaddr, unsigned int flags, ktime_t *time, int tryl
 
 out_unlock_put_key:
 		futex_q_unlock(hb);
+		__release_ctx_lock(q.lock_ptr);
 		goto out;
 
 uaddr_faulted:
 		futex_q_unlock(hb);
+		__release_ctx_lock(q.lock_ptr);
 
 		ret = fault_in_user_writeable(uaddr);
 		if (ret)
diff --git a/kernel/futex/waitwake.c b/kernel/futex/waitwake.c
index 1c2dd03f11ec..09b636cbc3d0 100644
--- a/kernel/futex/waitwake.c
+++ b/kernel/futex/waitwake.c
@@ -462,6 +462,7 @@ int futex_wait_multiple_setup(struct futex_vector *vs, int count, int *woken)
 			}
 
 			futex_q_unlock(hb);
+			__release_ctx_lock(q->lock_ptr);
 		}
 		__set_current_state(TASK_RUNNING);
 
@@ -628,6 +629,7 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
 
 		if (ret) {
 			futex_q_unlock(hb);
+			__release_ctx_lock(q->lock_ptr);
 
 			ret = get_user(uval, uaddr);
 			if (ret)
@@ -641,11 +643,13 @@ int futex_wait_setup(u32 __user *uaddr, u32 val, unsigned int flags,
 
 		if (uval != val) {
 			futex_q_unlock(hb);
+			__release_ctx_lock(q->lock_ptr);
 			return -EWOULDBLOCK;
 		}
 
 		if (key2 && futex_match(&q->key, key2)) {
 			futex_q_unlock(hb);
+			__release_ctx_lock(q->lock_ptr);
 			return -EINVAL;
 		}
 
