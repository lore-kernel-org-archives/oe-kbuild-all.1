Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACDCA2EE5F5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 14:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769179067; cv=none; b=RQ4+gIKHeKxTn0zM1ooBPtVTJwrYedXTB+TGvWeQnc4Mdm/Fhl3e+/mmg9YbDoRLOBV1gcVaRCSDKwkVlhPQrSjkrjClRpvDZRWXxrM242u+Y8z1Rn5j9DCFCXMpNZuJamJY7+NHchj/Us9suoKqIoefSfGUxS8pkZvw5afAgGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769179067; c=relaxed/simple;
	bh=o1vMmLZ66fIssfyBDLNRcJQTuxvG1xbC0Drk2o05BEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPE7nVqlOD4nvc1Deu46rXocU72g+ySqbT+mtJDfeK89cb/CaqGBDYiSAWpsTtYEV9za8YxPDuseifss7zJScqg+qsoefrReanjTA/GrcWPZgf0OU4LYVzNAQS00ahqOSLmDjRlbz6wZvvRDDP5PZCjAOoRMES70FmNn9QsdUG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1/kkjyhH; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1/kkjyhH"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-4359108fd24so1409764f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jan 2026 06:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769179064; x=1769783864; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xKI6kmYleBCyvsuGizqBVIqQyhxDcyw49CGspR/o9ZI=;
        b=1/kkjyhHp1zekz6BUfcQnBy4OAi6oz1dpE9EvppOesFJE8IYp4W3xSYKT7Oi6G6geq
         OA3PfuA0YIrmijgm4Ol4Iis7F1j5t4zMyQjn4JgZAxBkRjdUCeuT9n8d5LjQKAr5pVVm
         a9WSsgTNNEqL7z+VI4ghCkX3JN5vM6ZXcaQnBKyHhtcnfoJv3npIzQoZ86tr1kX2fOkG
         Mb2p/N/ONJ9ycptmYoppnbLCe3lDGyMabucCFhUTT6Rh6FqJNWb+jAdbOlz9i/PKRGgA
         UgBvuvAbnfmTYsYWFabpnPWbwxZQe5+bKCXRyGnmnVOW6db4vEHPxQOhcml23eJS87AW
         VXCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769179064; x=1769783864;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xKI6kmYleBCyvsuGizqBVIqQyhxDcyw49CGspR/o9ZI=;
        b=gQ7Zz4YtRpTz4xFFVQzfGj2VzkrI1P9izJ2h1EfVVhEceZty6qRWZa42KUjP28RUxz
         qmUFh0hlRqG1cAjJ5gKk+hdT5dHGZ2EnNjdqT0A8xze96GyEADDRz8rv0bUpqxM5KMdd
         i+A3k94A0uSUxPlXSc+ue3/BFpjzjJGkSUQgjaxf3ucQSO0+pCPjlc/X8KSntJucKxfT
         VOVC8b3YHTXXyOIIJwxRPQafQ9cy4lKV2YusGOgvc+ZdmuuXXGIvafLjKTlo6MlWustL
         bdnn+7Yxhw6q+nXogWy4S1daERsh+y3h7Z0TsHSYwh+BzySZ16BvDQF25V0QWNDF7r1+
         4Xgw==
X-Forwarded-Encrypted: i=1; AJvYcCWU5pt5bz7GwByzhm2ZhVEP+o8urfwkkq+wNmTRRN2DSnznioEa0TBOMfMyD/cXE3aXzXXqSDfQ9TyOLzI9@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9Ws7GrbedFuIW0AKWiinZgbaQAlV9Zm7KDS29Yj5Exgz/J7lK
	anS5wwFXV2cnb/JimeXdYHtuaArIloslkn0UMw6vrUKN0dXYyBHKl/cOUHfVlH+DCA==
X-Gm-Gg: AZuq6aLvOIPkjZsQTWQk7JvEKK8NFg+ipXdFE28H8pFUL+ILLgWyLOL3TXAfpeph/CM
	VaAQtvmxUfoN8in/JXdsiHUfPCKlAl2LSmYPqLvKCodWJ7drNWVbWDj4bPScWmk/0DfUDAKx2cS
	gci1IV/xTThmSdiD0YKTvnNeaBSei/OVu/C9xeQ+0MedVQcEDY90hd2Rw1V+lWCLUa84tLVnC9s
	KHzLKFPP0jnaRV49lDbUwtcEHFoxehGYJkZmwudxwK0/nSQBJXoavN5Sz+dqBIP/DKqbsAKMG5g
	PCzI/eEFRrqPuONWjBxPttQ5TFk1mPQUndk0ik7e7jkCiAT8qge+1G7kRtIuPdVSCJJvoJ2jOp1
	qMkKETJvW1Hs5CPn8P4EareV3l0L5ywYWyMMDrnqWrIgsk3de3EJWt2DOSRWo1b1g2ELG33LgQc
	WKKyRMYHPpXhWw6ExbjI8XV+Qck7OKpXqNXip0rCeAPAPOwDr+
X-Received: by 2002:a5d:64c8:0:b0:430:f3ab:56a1 with SMTP id ffacd0b85a97d-435b9668bf7mr2998149f8f.42.1769179063785;
        Fri, 23 Jan 2026 06:37:43 -0800 (PST)
Received: from elver.google.com ([2a00:79e0:2834:9:f5e4:d97b:d6a2:97ac])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1f7474csm7323514f8f.37.2026.01.23.06.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 06:37:43 -0800 (PST)
Date: Fri, 23 Jan 2026 15:37:37 +0100
From: Marco Elver <elver@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, Will Deacon <will@kernel.org>
Subject: Re: [peterz-queue:locking/core 10/10] kernel/futex/core.c:982:1:
 warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the
 end of function
Message-ID: <aXOHsWg8xd2qAwyr@elver.google.com>
References: <202601221040.TeM0ihff-lkp@intel.com>
 <20260122091600.GE171111@noisy.programming.kicks-ass.net>
 <aXJs7Hi90iOIoeMM@elver.google.com>
 <20260123085555.GG171111@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123085555.GG171111@noisy.programming.kicks-ass.net>
User-Agent: Mutt/2.2.13 (2024-03-09)

On Fri, Jan 23, 2026 at 09:55AM +0100, Peter Zijlstra wrote:
> On Thu, Jan 22, 2026 at 07:31:08PM +0100, Marco Elver wrote:
> > +Cc Will
> > 
> > On Thu, Jan 22, 2026 at 10:16AM +0100, Peter Zijlstra wrote:
> > > On Thu, Jan 22, 2026 at 10:30:28AM +0800, kernel test robot wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git locking/core
> > > > head:   33d9e7fdf9c17417347d1f06ddebaf25f21ab62a
> > > > commit: 33d9e7fdf9c17417347d1f06ddebaf25f21ab62a [10/10] futex: Convert to compiler context analysis
> > > > config: arm64-randconfig-001-20260122 (https://download.01.org/0day-ci/archive/20260122/202601221040.TeM0ihff-lkp@intel.com/config)
> > > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> > > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260122/202601221040.TeM0ihff-lkp@intel.com/reproduce)
> > > > 
> > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202601221040.TeM0ihff-lkp@intel.com/
> > > > 
> > > > All warnings (new ones prefixed by >>):
> > > > 
> > > > >> kernel/futex/core.c:982:1: warning: spinlock 'atomic ? __u.__val : q->lock_ptr' is still held at the end of function [-Wthread-safety-analysis]
> > > >      982 | }
> > > >          | ^
> > > >    kernel/futex/core.c:976:2: note: spinlock acquired here
> > > >      976 |         spin_lock(lock_ptr);
> > > >          |         ^
> > > > >> kernel/futex/core.c:982:1: warning: expecting spinlock 'q->lock_ptr' to be held at the end of function [-Wthread-safety-analysis]
> > > >      982 | }
> > > >          | ^
> > > >    kernel/futex/core.c:966:6: note: spinlock acquired here
> > > >      966 | void futex_q_lockptr_lock(struct futex_q *q)
> > > >          |      ^
> > > >    2 warnings generated.
> > > 
> > > Urgh, this is the arm64 READ_ONCE() confusing the thing. It can't see
> > > through that mess and realize: lockptr == q->lock_ptr.
> > > 
> > > Marco, any suggestion how to best fix that?
> > 
> > I have a tentative solution:
> > 
> > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > index 78beceec10cd..75265012ff2d 100644
> > --- a/arch/arm64/include/asm/rwonce.h
> > +++ b/arch/arm64/include/asm/rwonce.h
> > @@ -31,9 +31,8 @@
> >   */
> >  #define __READ_ONCE(x)							\
> >  ({									\
> > -	typeof(&(x)) __x = &(x);					\
> > -	int atomic = 1;							\
> > -	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
> > +	typeof(&(x)) __x = &(x), *__xp = &__x;				\
> > +	union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;		\
> >  	switch (sizeof(x)) {						\
> >  	case 1:								\
> >  		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
> > @@ -56,9 +55,10 @@
> >  			: "Q" (*__x) : "memory");			\
> >  		break;							\
> >  	default:							\
> > -		atomic = 0;						\
> > +		__u.__val = (*(volatile typeof(__x))__x);		\
> >  	}								\
> > -	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
> > +	*__xp = &__u.__val;						\
> > +	*__x;								\
> >  })
> >  
> >  #endif	/* !BUILD_VDSO */
> > 
> > This works because the compiler doesn't analyze alias reassignment
> > through pointer-to-alias within the same function. An alternative is to
> > do the alias reassignment via an __always_inline function that takes the
> > alias as a const pointer, and then cast the const away and do the
> > assignment. But I think the above is cleaner. Only compile-tested.
> 
> Oh clever! I suppose it does help if you know how the compiler works :-)

Latest version:


diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
index 78beceec10cd..1927bfe87695 100644
--- a/arch/arm64/include/asm/rwonce.h
+++ b/arch/arm64/include/asm/rwonce.h
@@ -31,9 +31,8 @@
  */
 #define __READ_ONCE(x)							\
 ({									\
-	typeof(&(x)) __x = &(x);					\
-	int atomic = 1;							\
-	union { __unqual_scalar_typeof(*__x) __val; char __c[1]; } __u;	\
+	TYPEOF_UNQUAL(x) *__x = (typeof(__x))&(x), **__xp = &__x;	\
+	union { typeof(*__x) __val; char __c[1]; } __u;			\
 	switch (sizeof(x)) {						\
 	case 1:								\
 		asm volatile(__LOAD_RCPC(b, %w0, %1)			\
@@ -56,9 +55,10 @@
 			: "Q" (*__x) : "memory");			\
 		break;							\
 	default:							\
-		atomic = 0;						\
+		__u.__val = (*(volatile typeof(x) *)__x);		\
 	}								\
-	atomic ? (typeof(*__x))__u.__val : (*(volatile typeof(__x))__x);\
+	*__xp = &__u.__val;						\
+	(typeof(x))*__x;						\
 })
 
 #endif	/* !BUILD_VDSO */


Because the previous one was not stripping volatile and we'd end up
reading things twice. This is more annoying than I thought, maybe I'll
go back to a version that produces equivalent binaries. This version
seems to be strictly reducing instructions (across ~100 functions or
so), but not sure why or if that's correct.

> I was thinking that perhaps it makes sense to invest in a 'directive'
> where we can explicitly hand alias information to the compiler.
> 
> Consider:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/tree/kernel/locking/rtmutex.c?h=locking/core&id=a31a1351e9ec9df7a72ea4877a8e53a9c02e8641#n1259
> 
> 		rtm = container_of(lock, struct rt_mutex, rtmutex);
> 		__assume_ctx_lock(&rtm->rtmutex.wait_lock);
> 		res = __ww_mutex_add_waiter(waiter, rtm, ww_ctx, wake_q);
> 
> Here there is a similar issue, where container_of() wrecks things. It
> cannot tell that rtm->rtmutex == lock and hence its idea of
> lock->wait_lock gets 'confused'.
> 
> I hack around it with that __assume_ctx_lock() and I suppose that works,
> but perhaps it makes sense to be able to tell the compiler that yes,
> these things are the actual same thing. Perhaps it will even improve
> code-gen, like in your example.

There is __builtin_assume, but I'd refrain from using that to tell the
compiler things that may not be true anymore in future. But
ThreadSafetyAnalysis's alias analysis ignores all that anyway because
its alias analysis is detached from the rest of the compiler.

Unclear how feasible it is to add a TSA-only builtin to do that. I think
in many cases we can actually use __returns_ctx_lock to create aliases,
but in the container_of cases I haven't yet figured out a way to do
that.
