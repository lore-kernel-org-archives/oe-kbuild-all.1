Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A72235292C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 17:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768325833; cv=none; b=FZlWS10kvtMKFFhFGZZb2W0J14NE/RVR5K4Ua9x5Gf1jP+z71r2JgNlRSc5UCLIkMGlF7W3TMdFBFnCZGeiuTLe7Mq3Ikj5AkYH6N0UAMCoSYV6oVCXUdkCA+0N2iTxWXZdMOps/tRH4eqv3QJCcvHRDTujqX6mv+L9Y0wBAsN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768325833; c=relaxed/simple;
	bh=Ld4Jn61VdcZeP8PY6XuXZoV9sXC76lbAh4O5X0GMSUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucr1u9AM37kxvxE1dhign+NuNi+vbVC30UVH/oc7clgsO79Px/W5fs4bymP64x0s+ouncebGFfGNONR6pPpMgYWlwhkpNeGXuGS5p1DS7FFyHWVJygnJq8VVS7xLHvarG0KL5RRyY/6hyVFBspAbl58N6mmIr6M1pbmH0lZExcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OIoToTVN; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0qp0nOlw; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OIoToTVN";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0qp0nOlw"
Date: Tue, 13 Jan 2026 18:37:08 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768325829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ef18KFE0hVlNY0ybnes0hIsI75xpE/CByJDj4OoqBcg=;
	b=OIoToTVNNbi+4JmivIdGgVAgpeONXD1sNpKs7PUXAsT/AspFlqv8PEVt/E5e2NQFBPGOsT
	W1LTRoXuqIZtAFYxV/zpLQufxEeRZe8ypcthubEDpsD4aRH3LEBuL2XfbkA4EHkMu6vq82
	uCJU3Ev00botPhIby7tprBnGTOZbsJeHr2AFPMnDwXv1uN6j55C2/A/3jWD+tPRznVAoCf
	1KNm7N+En68zoEGZoIUXEeXGrUYeq4Kt0Rwbdzyem+KvBGTnkXi46bAwqgj2CeOOXEQEfc
	qJyIEfdqZ+w5gwnnDItiQIjzT5gsmAYkyGfakYzgvpM92ybOyVkjfrFU2VuSiw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768325829;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ef18KFE0hVlNY0ybnes0hIsI75xpE/CByJDj4OoqBcg=;
	b=0qp0nOlwV0QAk8Z/vVPHPCnnHyPfuIWHr0Fhgfe6PN/h7eZ2c0w14XJd++T3r+C/VNyeLw
	ffvkAaD9ZzvZ17CQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: kernel/futex/core.c:505:38: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <20260113173708.HMfBY0wF@linutronix.de>
References: <202601131901.j7WJ9OeZ-lkp@intel.com>
 <20260113115946.L49jwJMx@linutronix.de>
 <20260113121040.GC831050@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260113121040.GC831050@noisy.programming.kicks-ass.net>

On 2026-01-13 13:10:40 [+0100], Peter Zijlstra wrote:
> Its here and a few lines down with the same thing I think. The cast is
> to get byte pointer math, instead of u32 sized pointer math. Both the
> original uaddr and naddr have the __user thing on, but that intermediate
> cast trips it up.
> 
> Does this work?

Yes. It removes the __user thing warning which leaves us with
| kernel/futex/requeue.c:692:9: warning: context imbalance in 'futex_requeue' - different lock contexts for basic block
| kernel/futex/requeue.c:841:25: warning: context imbalance in 'futex_wait_requeue_pi' - unexpected unlock
| kernel/futex/pi.c:663:9: warning: context imbalance in 'wake_futex_pi' - unexpected unlock
| kernel/futex/pi.c:791:9: warning: context imbalance in '__fixup_pi_state_owner' - unexpected unlock
| kernel/futex/pi.c:1093:17: warning: context imbalance in 'futex_lock_pi' - unexpected unlock
| kernel/futex/pi.c:1132:5: warning: context imbalance in 'futex_unlock_pi' - different lock contexts for basic block
| kernel/futex/waitwake.c:275:41: warning: context imbalance in 'futex_wake_op' - different lock contexts for basic block
| kernel/futex/waitwake.c:460:44: warning: context imbalance in 'futex_wait_multiple_setup' - unexpected unlock
| kernel/futex/waitwake.c:660:28: warning: context imbalance in 'futex_wait_setup' - unexpected unlock
| kernel/futex/core.c:979:9: warning: context imbalance in 'futex_q_lockptr_lock' - wrong count at exit

With the following I get it down to:

| kernel/futex/waitwake.c:275:41: warning: context imbalance in 'futex_wake_op' - different lock contexts for basic block
| kernel/futex/requeue.c:692:9: warning: context imbalance in 'futex_requeue' - different lock contexts for basic block
double_lock_hb() + double_unlock_hb()

| kernel/futex/pi.c:792:9: warning: context imbalance in '__fixup_pi_state_owner' - unexpected unlock
raw_spin_unlock_irq(&pi_state->pi_mutex.wait_lock) + lock in a label.

which I give up on. I remember you said once that llvm will get support
for it so we can bury sparse but I don't remember if it was __user or
the lock lock annotation. Any all of these are "old".

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 3961d256c79c4..6911d60fc5815 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -965,6 +965,7 @@ int futex_unqueue(struct futex_q *q)
 }
 
 void futex_q_lockptr_lock(struct futex_q *q)
+	__acquires(q->lock_ptr)
 {
 	spinlock_t *lock_ptr;
 
diff --git a/kernel/futex/futex.h b/kernel/futex/futex.h
index 99595742c9941..1eba1a7a80efd 100644
--- a/kernel/futex/futex.h
+++ b/kernel/futex/futex.h
@@ -217,7 +217,7 @@ enum futex_access {
 
 extern int get_futex_key(void __user *uaddr, unsigned int flags, union futex_key *key,
 			 enum futex_access rw);
-extern void futex_q_lockptr_lock(struct futex_q *q);
+extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
 extern struct hrtimer_sleeper *
 futex_setup_timer(ktime_t *time, struct hrtimer_sleeper *timeout,
 		  int flags, u64 range_ns);
@@ -358,8 +358,8 @@ static inline int futex_hb_waiters_pending(struct futex_hash_bucket *hb)
 #endif
 }
 
-extern void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb);
-extern void futex_q_unlock(struct futex_hash_bucket *hb);
+extern void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb) __acquires(&hb->lock);
+extern void futex_q_unlock(struct futex_hash_bucket *hb) __releases(&hb->lock);
 
 
 extern int futex_lock_pi_atomic(u32 __user *uaddr, struct futex_hash_bucket *hb,
diff --git a/kernel/futex/pi.c b/kernel/futex/pi.c
index dacb2330f1fbc..6a93a5eb5a0ab 100644
--- a/kernel/futex/pi.c
+++ b/kernel/futex/pi.c
@@ -614,6 +614,7 @@ int futex_lock_pi_atomic(u32 __user *uaddr, struct futex_hash_bucket *hb,
 static int wake_futex_pi(u32 __user *uaddr, u32 uval,
 			 struct futex_pi_state *pi_state,
 			 struct rt_mutex_waiter *top_waiter)
+	__releases(q->lock_ptr)
 {
 	struct task_struct *new_owner;
 	bool postunlock = false;
