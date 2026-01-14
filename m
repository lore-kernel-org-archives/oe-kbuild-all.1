Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4EE395D83
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jan 2026 12:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768392568; cv=none; b=VFUwR7GDJbSdFKIlls0p+lUtLIjYCVYTlUxkCZtqiHFI7K1FSqlUG6bCJo6uy8RPSitVpmKlHvuV151bM24KzvF0cw+S+9Sq6bbQTluWXI9zanDvKTbTNUTc6/dnWqoDyildLKns1jcoIYit/2ejUApbDRxLA2uYoaILoS7teXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768392568; c=relaxed/simple;
	bh=XLdQK5pFWeYBnpGZQnDgwL/dtD0HyZLTCC/jUcfxJjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SBKRotcC+jJHm2sVD6BlquckX/nZBEMKGpxntmJBQQt+tG9wf3fOMLrFo5ztsmXmdEHrmAgQgkX0FN9JE16JMzMCwTeCBR0YfQ5GgmS/vBjEyQbLIUMFd19EuPZUPg1b9MUvrKrLSEquxeDmK7Bb9wI7wMpEZCWYvRYOuaYU6yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=QaA5w/Z5; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Gvm0l/kT; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="QaA5w/Z5";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Gvm0l/kT"
Date: Wed, 14 Jan 2026 13:09:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768392564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2fdENGMOXS879QI6Jlwpo+HBasRqxNj0hr4ikdF05Y=;
	b=QaA5w/Z5wx8pYy0X1BkFk+9g9SOgvz2YGzPxsEiszZPJv1G4M6ii/evuPtO1Xw5OMlSqWj
	l1tz5NtU35TSef87a+2S1DafSEcOuUdffhBSxoe03VcQ+T5G4uJa/WWtnOj2LERYJHpswN
	udeOIM+7qaiqtcBMCortHLNhU1/3Vsdrwr/KfiAs80jL0/g6ky+vhonUBnFZqPkDV7Xt7a
	VsdM3v9moyeKCCgZ8JQaSETfBoY5x4CDuDoyPJPl7TJ+Yw1Nk3y3tzYlfnPI4zYJaTBnaz
	bT8gSaWF5xREMQq7H9rP5oAaGaLbD4RMF8XGFWV2ZOxubZluLoyAmuKc98eRAg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768392564;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q2fdENGMOXS879QI6Jlwpo+HBasRqxNj0hr4ikdF05Y=;
	b=Gvm0l/kTxaoKY37xY4OHh+RXoZhoafGPJYsv9w4IHdoJ8hDQfMgoQlyO+Sg5WJzHu8oxRF
	YjMSrLcRWn6Mf+Cg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>
Subject: Re: kernel/futex/core.c:505:38: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <20260114120923.cYZJMtmF@linutronix.de>
References: <202601131901.j7WJ9OeZ-lkp@intel.com>
 <20260113115946.L49jwJMx@linutronix.de>
 <20260113121040.GC831050@noisy.programming.kicks-ass.net>
 <20260113173708.HMfBY0wF@linutronix.de>
 <20260113193919.GA810197@noisy.programming.kicks-ass.net>
 <20260114093517.NIa6_vRS@linutronix.de>
 <20260114110828.GE830229@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260114110828.GE830229@noisy.programming.kicks-ass.net>

On 2026-01-14 12:08:28 [+0100], Peter Zijlstra wrote:
> On Wed, Jan 14, 2026 at 10:35:17AM +0100, Sebastian Andrzej Siewior wrote:
> > On 2026-01-13 20:39:19 [+0100], Peter Zijlstra wrote:
> > > tip/locking/core removes all the sparse lock annotations in favour of
> > > clang-22 tcsan.
> >=20
> > So this is what salvation looks like?=20
>=20
> :-)
>=20
> This seems to build for me. It is the bare basic conversion, without
> making use of the fancy __guarded_by() stuff for variables.
>=20
> ---
> diff --git a/kernel/futex/Makefile b/kernel/futex/Makefile
> index b77188d1fa07..9242110a32e2 100644
> --- a/kernel/futex/Makefile
> +++ b/kernel/futex/Makefile
> @@ -1,3 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
> +CONTEXT_ANALYSIS_core.o :=3D y
> +CONTEXT_ANALYSIS_syscalls.o :=3D y
> +CONTEXT_ANALYSIS_pi.o :=3D y
> +CONTEXT_ANALYSIS_requeue.o :=3D y
> +CONTEXT_ANALYSIS_waitwake.o :=3D y

You could just do 'CONTEXT_ANALYSIS :=3D y' since everything else works,
too. Can confirm.

=E2=80=A6
> --- a/kernel/futex/core.c
> +++ b/kernel/futex/core.c
> @@ -879,10 +878,10 @@ void futex_q_lock(struct futex_q *q, struct futex_h=
ash_bucket *hb)
>  	q->lock_ptr =3D &hb->lock;
> =20
>  	spin_lock(&hb->lock);
> +	__acquire_ctx_lock(q->lock_ptr);

so it sees hb->lock and we fake q->lock_ptr. Okay.

>  static void futex_cleanup_begin(struct task_struct *tsk)
> +	__acquires(&tsk->futex_exit_mutex)

so this is needed even if it sees the whole context.

> --- a/kernel/futex/futex.h
> +++ b/kernel/futex/futex.h
> @@ -217,7 +217,7 @@ enum futex_access {
> =20
>  extern int get_futex_key(u32 __user *uaddr, unsigned int flags, union fu=
tex_key *key,
>  			 enum futex_access rw);
> -extern void futex_q_lockptr_lock(struct futex_q *q);
> +extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_p=
tr);
>  extern struct hrtimer_sleeper *
>  futex_setup_timer(ktime_t *time, struct hrtimer_sleeper *timeout,
>  		  int flags, u64 range_ns);
> @@ -311,9 +311,11 @@ extern int futex_unqueue(struct futex_q *q);
>  static inline void futex_queue(struct futex_q *q, struct futex_hash_buck=
et *hb,
>  			       struct task_struct *task)
>  	__releases(&hb->lock)
> +	__releases(q->lock_ptr)
>  {
>  	__futex_queue(q, hb, task);
>  	spin_unlock(&hb->lock);
> +	__release_ctx_lock(q->lock_ptr);

so we need both. I then misunderstood the concept.
The function attribute is for other functions to learn and
__release_ctx_lock() for the current context?

>  }
> =20
> @@ -379,6 +384,9 @@ extern int fixup_pi_owner(u32 __user *uaddr, struct f=
utex_q *q, int locked);
>   */
>  static inline void
>  double_lock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *=
hb2)
> +	__acquires(&hb1->lock)
> +	__acquires(&hb2->lock)
> +	__no_context_analysis

so I was proud of my conditional thingy and the lockdep part but you use
whatever is there ;)
It certainly makes sense since logically both locks are acquired but is
kind of hard to explain.

> --- a/kernel/futex/pi.c
> +++ b/kernel/futex/pi.c
> @@ -614,6 +614,8 @@ int futex_lock_pi_atomic(u32 __user *uaddr, struct fu=
tex_hash_bucket *hb,
>  static int wake_futex_pi(u32 __user *uaddr, u32 uval,
>  			 struct futex_pi_state *pi_state,
>  			 struct rt_mutex_waiter *top_waiter)
> +	__must_hold(&pi_state->pi_mutex.wait_lock)
> +	__releases(&pi_state->pi_mutex.wait_lock)

So need to tell that wait_lock must be held by the caller and it will be
released because that latter is not expected even if the flow would
match it.

>  {
>  	struct task_struct *new_owner;
>  	bool postunlock =3D false;
> @@ -670,6 +672,8 @@ static int wake_futex_pi(u32 __user *uaddr, u32 uval,
> =20
>  static int __fixup_pi_state_owner(u32 __user *uaddr, struct futex_q *q,
>  				  struct task_struct *argowner)
> +	__must_hold(&q->pi_state->pi_mutex.wait_lock)
> +	__must_hold(q->lock_ptr)

So that was the trick and llvm does not need to deal with unlock+lock
even if it is obvious from the flow.

Okay thank you. I go grab some food and then cry then a bit in the corner=
=E2=80=A6

Sebastian
