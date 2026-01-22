Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC8037D112
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 18:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769106692; cv=none; b=d2Q8SQIBEf3B/8D+8GAxwSVbM7BxIO4cWBIQuS5crrhHgJ3zw5y5PMmPbUBJb6zq6LbW6axLRhOWiQSYl/5y60qMrMQQPwdudhyIAVmDgz5ABNz6l+G9cg1LJl9sJQy89ECXfn8Cb/n0C/QbqAfRz0V4cpPgKGKFD4ObMRSfbsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769106692; c=relaxed/simple;
	bh=V/YWVCkksI3r+GuGClBoLZVL9TzMOkDP/a4rG8gzipY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MXkEeLhv+BQan7EZXANFzdEFXcAr4NiSydU207YTeeOS0FrlFKZkn5atqEMp0LfqdX89iE2b187K4viZl4mvwQzZ4Lpm9yjOQhOMhLULGk0oaQpIIF1Hcq8zkvJHkXmPzJZhH1NGjDFHNuLDjOA4xu280WPWxvysvjdapcRP/yY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RFvikP3l; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RFvikP3l"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47edd6111b4so14688815e9.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jan 2026 10:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769106675; x=1769711475; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sHcGMjkyTHznibSHVyswUIfEQEbbN74bslm02im2fbg=;
        b=RFvikP3lVsPRrcRFaRAjVm6qhkluuyvoDD+/8fWKsWITJZzR08zzGiDq81aaP1f2sB
         ja3C1yWy0z+j5fz+kGZ0/6wUnMD9N57+KQIVhA5pC1N9XZ2aPZvKr2bGjLDWMJrly6N3
         1JSm8xzng0dRnmAGN3bhkhut6odh7Yhry/Y8jPwTqZfZ5YlSgdKuc/WRd8oj/DjiB8tp
         +6Ct/bSa0LSxIUslmemEs8gGPC9NoklEhjEx3R7MjHGlk8C/t1sGaDeo8ssp1r3nAp1T
         PQ0mQBtfn/3UMosdQYczZWIsVjynYU3KoQfr6Ln6qrMkbndlBwAloHyY2RU0MYTwTyXk
         notw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769106675; x=1769711475;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sHcGMjkyTHznibSHVyswUIfEQEbbN74bslm02im2fbg=;
        b=SxvjYDzQPsWkLpq6SanyYmmaaKyGb1bJb3FL8qmsy92Vz+7ljx88omr2yJuw81IPYk
         v0B8knE69S+mjjGkJryh7iCb5vXgO5TUfs482UYcN9VUMdYhfOtRBu4xEVBfSXg+Nkzt
         pAqaAuvHfWBmEC0bOen2DqaYIdIs2ibz+81hkvjKyWsv57lGCbRVy5MMn8pP6r6q064C
         mAV5g1SOoqXZWTa10CdGO9V3cT8R44A8jfx6lhKu6IvLV20kLIaPqfnAZgaSPBcvGI10
         /BV9G3P35TxwqdKYN0KvHRMmaR3RBQ82ju4hr4h/XFlxc0ZQLIzBo6mDpk2ZyEl1Dj6W
         haxw==
X-Forwarded-Encrypted: i=1; AJvYcCVlr4TGuKXUYPiWYjyRYARIjQ1L2DkEzPttuEjib0C5wq8IIuzPhhXp2cDd/i4+BaoslJy+2hHXkMUFyCxH@lists.linux.dev
X-Gm-Message-State: AOJu0YxtT4Wu8z73//ru0qZi1X2wAdiJkv7VjNbgZaQ6W5Ourfr6Zy2d
	5wc1wfVzrQNjfR5QqK9dDy88hRrlPk0vuR7U5YqlPrGblzDT88seXKawuw7NxqbE/A==
X-Gm-Gg: AZuq6aLDj17MkxhQYMPnVm+cT0mc2b+vysCc2+2lq+NwMy6OdjRSMJWqi8XEenzz8WW
	mQ9KfYuFxTmD14/nQnCwxJAxR0w2hz/QB4BKgNewLQfWA09j4mCaySkl3nkAi6kEHcUPUrk4IYM
	Rs94/QxhYaGcGnq+Cs33iqWsXj1kqtEIgBgBATNVNi7iZxL6aJjoO8yJB5XTh2rZOwPPXI/ymkk
	qDrwrOjby1YyuqsLJZIKyI0zy2fjvboFczjQirZ2PiIRhGgJ1CVMgoi+8oLHrAUJrSOKGJdJXy9
	onia8uZQDZOoiwjtiEjGrTFx8XEfSRZSE9oDAOrNgWe3GsqqAHVkVADBqlre3MT1RL2fjwDfudX
	J6/paANmR4n4LqXaCydeecsLxpjcHo+xb3CYZFLrSA6GupP0GhWD3l5tQIs+P+kFJODQBCJIhME
	/xFDjyWopZtCSOnU58qjQg3RF5EHr2CRKECenmsIvEC26u6fDkUaQF0YG1
X-Received: by 2002:a05:600c:83c5:b0:477:7bca:8b2b with SMTP id 5b1f17b1804b1-4804c95e234mr9651355e9.15.1769106674888;
        Thu, 22 Jan 2026 10:31:14 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:bb08:c2:8cd9:1733])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48047028928sm130174555e9.2.2026.01.22.10.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 10:31:14 -0800 (PST)
Date: Thu, 22 Jan 2026 19:31:08 +0100
From: Marco Elver <elver@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>
Subject: Re: [peterz-queue:locking/core 10/10] kernel/futex/core.c:982:1:
 warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the
 end of function
Message-ID: <aXJs7Hi90iOIoeMM@elver.google.com>
References: <202601221040.TeM0ihff-lkp@intel.com>
 <20260122091600.GE171111@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260122091600.GE171111@noisy.programming.kicks-ass.net>
User-Agent: Mutt/2.2.13 (2024-03-09)

+Cc Will

On Thu, Jan 22, 2026 at 10:16AM +0100, Peter Zijlstra wrote:
> On Thu, Jan 22, 2026 at 10:30:28AM +0800, kernel test robot wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
> > head:   33d9e7fdf9c17417347d1f06ddebaf25f21ab62a
> > commit: 33d9e7fdf9c17417347d1f06ddebaf25f21ab62a [10/10] futex: Convert to compiler context analysis
> > config: arm64-randconfig-001-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221040.TeM0ihff-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221040.TeM0ihff-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> >      982 | }
> >          | ^
> >    kernel/futex/core.c:976:2: note: spinlock acquired here
> >      976 |         spin_lock(lock_ptr);
> >          |         ^
> > >> kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> >      982 | }
> >          | ^
> >    kernel/futex/core.c:966:6: note: spinlock acquired here
> >      966 | void futex_q_lockptr_lock(struct futex_q *q)
> >          |      ^
> >    2 warnings generated.
> 
> Urgh, this is the arm64 READ_ONCE() confusing the thing. It can't see
> through that mess and realize: lockptr == q->lock_ptr.
> 
> Marco, any suggestion how to best fix that?

I have a tentative solution:

diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 78beceec10cd..75265012ff2d 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -31,9 +31,8 @@
  */
 #define __READ_ONCE(x)							\
 ({									\
-	typeof(&(x)) __x = &(x);					\
-	int atomic = 1;							\
-	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
+	typeof(&(x)) __x = &(x), *__xp = &__x;				\
+	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -56,9 +55,10 @@
 			: "Q" (*__x) : "memory");			\
 		break;							\
 	default:							\
-		atomic = 0;						\
+		__u.__val = (*(volatile typeof(__x))__x);		\
 	}								\
-	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
+	*__xp = &__u.__val;						\
+	*__x;								\
 })
 
 #endif	/* !BUILD_VDSO */

This works because the compiler doesn't analyze alias reassignment
through pointer-to-alias within the same function. An alternative is to
do the alias reassignment via an __always_inline function that takes the
alias as a const pointer, and then cast the const away and do the
assignment. But I think the above is cleaner. Only compile-tested.

It also gets rid of the "atomic" flag, and switches to TYPEOF_UNQUAL
which fixes a latent bug where __unqual_scalar_typeof was applied to a
const non-integer variable that is less than 8 bytes, resulting in __val
being "const" itself (likely benign).

Before:

  File: vmlinux
  Size: 59628672  	Blocks: 116472     IO Block: 4096   regular file

After:

  File: vmlinux
  Size: 59563056  	Blocks: 116336     IO Block: 4096   regular file

So this claims we're saving space. But the couple functions I inspected
that use READ_ONCE were identical. I need to double-check the asm, see
where the differences are and if we're actually producing better code,
and write a commit message that makes sense.
