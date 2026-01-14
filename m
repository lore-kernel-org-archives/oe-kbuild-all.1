Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3462D0618;
	Wed, 14 Jan 2026 12:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768393005; cv=none; b=Oo+A5iouInkbGSm5YDby3HzlY4FXK4FeMK9Zat5TzsIppiKmL583ZTCt1ip4CDAZHsUWa3vl9+M8saQWRPgP44W8gQm30uMQrATaNjU0g8z35IKX212RyamOy8PD0aDMcP4Xa83Hqbp0Yq5jdnYe4lYjEU2OArxbbw49R/L7g1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768393005; c=relaxed/simple;
	bh=ldIhBKXZa5qtox4KyRXMQdsDqrgmGONrN3SwM4N6V6g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gprFxKVot2peEOdSeWXOPUkN1ibF1m5AcWZju495lxbq9TBZ3PBXT9ZfPeRkXlZs37XZbZp/viqXe8rIsWA0sIHt853nzIm0YWe1gNB7e6HPu4QkZ7PdZ61U6JtGBfor5/WrJvn6fCZ+16cxmemWpo6dujYj/X1VIZrcMrvTrnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=sDgP2YhP; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="sDgP2YhP"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5yGBK3wZ++g8dYkzX6PdM8TQ1tBZHs6z4zyI7Pi6xzg=; b=sDgP2YhPebYDZicMrw8JVsC63X
	EZKKSugEB2nqVPnb/BtWnGXXyVQzp7lhhCTfBzh5XBa/NoGFJ7ehRt4eIcx96loiz132CIPIABVc/
	PRRVrh4E+PCtwbe7Vz8vrprR/+nU9SdRNIi0JiTDNhIFSg5GnaxdLZEpw54X6WvHSLIfuZUjtLvtD
	mHy+Eh0nSioeKUw6Licr2gBTIkeMRJbXY1DQKNZp2h63AG07C6ykSgISf1Yzk3FJFW69bOUjkv6Ai
	QrQOfqu/SvU691FP/gOuRkxhLFWTRqH339l+tidgbQXJ/I/cr4aq0iOsAm7lz4WY2472b5/R9rANS
	AWPcJJNg==;
Received: from 2001-1c00-8d85-5700-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d85:5700:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfznj-00000006Ana-1OsC;
	Wed, 14 Jan 2026 12:16:39 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 280E43030EB; Wed, 14 Jan 2026 13:16:28 +0100 (CET)
Date: Wed, 14 Jan 2026 13:16:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Marco Elver <elver@google.com>
Subject: Re: kernel/futex/core.c:505:38: sparse: sparse: cast removes address
 space '__user' of expression
Message-ID: <20260114121628.GB830755@noisy.programming.kicks-ass.net>
References: <202601131901.j7WJ9OeZ-lkp@intel.com>
 <20260113115946.L49jwJMx@linutronix.de>
 <20260113121040.GC831050@noisy.programming.kicks-ass.net>
 <20260113173708.HMfBY0wF@linutronix.de>
 <20260113193919.GA810197@noisy.programming.kicks-ass.net>
 <20260114093517.NIa6_vRS@linutronix.de>
 <20260114110828.GE830229@noisy.programming.kicks-ass.net>
 <20260114120923.cYZJMtmF@linutronix.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260114120923.cYZJMtmF@linutronix.de>

On Wed, Jan 14, 2026 at 01:09:23PM +0100, Sebastian Andrzej Siewior wrote:
> On 2026-01-14 12:08:28 [+0100], Peter Zijlstra wrote:
> > On Wed, Jan 14, 2026 at 10:35:17AM +0100, Sebastian Andrzej Siewior wrote:
> > > On 2026-01-13 20:39:19 [+0100], Peter Zijlstra wrote:
> > > > tip/locking/core removes all the sparse lock annotations in favour of
> > > > clang-22 tcsan.
> > > 
> > > So this is what salvation looks like? 
> > 
> > :-)
> > 
> > This seems to build for me. It is the bare basic conversion, without
> > making use of the fancy __guarded_by() stuff for variables.
> > 
> > ---
> > diff --git a/kernel/futex/Makefile b/kernel/futex/Makefile
> > index b77188d1fa07..9242110a32e2 100644
> > --- a/kernel/futex/Makefile
> > +++ b/kernel/futex/Makefile
> > @@ -1,3 +1,9 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  
> > +CONTEXT_ANALYSIS_core.o := y
> > +CONTEXT_ANALYSIS_syscalls.o := y
> > +CONTEXT_ANALYSIS_pi.o := y
> > +CONTEXT_ANALYSIS_requeue.o := y
> > +CONTEXT_ANALYSIS_waitwake.o := y
> 
> You could just do 'CONTEXT_ANALYSIS := y' since everything else works,
> too. Can confirm.

Ah indeed. Clearly I copy/pasted the wrong example.

> …
> > --- a/kernel/futex/core.c
> > +++ b/kernel/futex/core.c
> > @@ -879,10 +878,10 @@ void futex_q_lock(struct futex_q *q, struct futex_hash_bucket *hb)
> >  	q->lock_ptr = &hb->lock;
> >  
> >  	spin_lock(&hb->lock);
> > +	__acquire_ctx_lock(q->lock_ptr);
> 
> so it sees hb->lock and we fake q->lock_ptr. Okay.

Yeah, the thing doesn't understand q->lock_ptr is an alias of hb->lock
and gets totally confused.

> >  static void futex_cleanup_begin(struct task_struct *tsk)
> > +	__acquires(&tsk->futex_exit_mutex)
> 
> so this is needed even if it sees the whole context.

Yeah, no inter-procedural analysis.

> > --- a/kernel/futex/futex.h
> > +++ b/kernel/futex/futex.h
> > @@ -217,7 +217,7 @@ enum futex_access {
> >  
> >  extern int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
> >  			 enum futex_access rw);
> > -extern void futex_q_lockptr_lock(struct futex_q *q);
> > +extern void futex_q_lockptr_lock(struct futex_q *q) __acquires(q->lock_ptr);
> >  extern struct hrtimer_sleeper *
> >  futex_setup_timer(ktime_t *time, struct hrtimer_sleeper *timeout,
> >  		  int flags, u64 range_ns);
> > @@ -311,9 +311,11 @@ extern int futex_unqueue(struct futex_q *q);
> >  static inline void futex_queue(struct futex_q *q, struct futex_hash_bucket *hb,
> >  			       struct task_struct *task)
> >  	__releases(&hb->lock)
> > +	__releases(q->lock_ptr)
> >  {
> >  	__futex_queue(q, hb, task);
> >  	spin_unlock(&hb->lock);
> > +	__release_ctx_lock(q->lock_ptr);
> 
> so we need both. I then misunderstood the concept.
> The function attribute is for other functions to learn and
> __release_ctx_lock() for the current context?

The __releases() attribute is for others but also verified against self
as a post-condition. And then yes, __release_ctx_lock() makes it true
for self.

> >  }
> >  
> > @@ -379,6 +384,9 @@ extern int fixup_pi_owner(u32 __user *uaddr, struct futex_q *q, int locked);
> >   */
> >  static inline void
> >  double_lock_hb(struct futex_hash_bucket *hb1, struct futex_hash_bucket *hb2)
> > +	__acquires(&hb1->lock)
> > +	__acquires(&hb2->lock)
> > +	__no_context_analysis
> 
> so I was proud of my conditional thingy and the lockdep part but you use
> whatever is there ;)
> It certainly makes sense since logically both locks are acquired but is
> kind of hard to explain.

Right. I went back and forth a bit, but I figured this one was
conceptually cleaner.

> > --- a/kernel/futex/pi.c
> > +++ b/kernel/futex/pi.c
> > @@ -614,6 +614,8 @@ int futex_lock_pi_atomic(u32 __user *uaddr, struct futex_hash_bucket *hb,
> >  static int wake_futex_pi(u32 __user *uaddr, u32 uval,
> >  			 struct futex_pi_state *pi_state,
> >  			 struct rt_mutex_waiter *top_waiter)
> > +	__must_hold(&pi_state->pi_mutex.wait_lock)
> > +	__releases(&pi_state->pi_mutex.wait_lock)
> 
> So need to tell that wait_lock must be held by the caller and it will be
> released because that latter is not expected even if the flow would
> match it.
> 
> >  {
> >  	struct task_struct *new_owner;
> >  	bool postunlock = false;
> > @@ -670,6 +672,8 @@ static int wake_futex_pi(u32 __user *uaddr, u32 uval,
> >  
> >  static int __fixup_pi_state_owner(u32 __user *uaddr, struct futex_q *q,
> >  				  struct task_struct *argowner)
> > +	__must_hold(&q->pi_state->pi_mutex.wait_lock)
> > +	__must_hold(q->lock_ptr)
> 
> So that was the trick and llvm does not need to deal with unlock+lock
> even if it is obvious from the flow.

Right, so by stating the lock is held on entry and exit, the unlock+lock
becomes a valid pattern and is no longer complained about.

> Okay thank you. I go grab some food and then cry then a bit in the corner…

:-)
