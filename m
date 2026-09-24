Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A74D9374E7A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 03:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790220321; cv=none; b=s+JeSckVQ3+A+ugBUK8MxLztRVq4gxVpGrJ+QsZhjUt3qbITjA9wYow3en0EJaNL2wwKOeSF5MNQ2+8jstnifD0qmxRYF6L8yGoflEY5z7NRGD7QOY2lVEHm8f5Fj2+9p98vuLMn6IaCWrOBkf8G8eYGsgfKCirDR0NUzu7Yx+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790220321; c=relaxed/simple;
	bh=e/na6R718GhKfZ2B2Ywy2Q64h7x0PTProt4F5pbT1qk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mo1i0yfuqTOE92dg8p/I7zWO2Puvc4RVM85/PRy2aY/pdj9zLmeRqrnrKHeUCaR5OhIWsU+befQFTHRGrHnPStUFlsFrBr5puhwxSYy+EUF+/qMmv5rkEdGOu4rAhyE91aojMWEut2mKyv2ynXn9nxlqq3fxNI9yGllDPM5S4TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NX0I14DM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NX0I14DM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A3211F000FF;
	Thu, 24 Sep 2026 03:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790220319;
	bh=FJJlTwzqrLPJg3rOblTSvdzqgZE4tK+X95ca9jID+v8=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To;
	b=NX0I14DMObJF4TheVMZToaBEJZgGDZHYNLorNIz/hDXBufpPW5jIdl9rpPBJrOx2C
	 YxLu7KdMW5ymcZyxPaHTjLaAI0PKpV1sAh3wyB/mE5PyGaiimg+mHEs+YdccLZlUUB
	 gxNI+ESmMFClIqCZ34IxnfL2BnzijnraLz7VerURvKLkA6fKthO3Wvl49z3F5zTTOl
	 ztan96tJJ6QVOQBT8qmPl6EbaB8uVk5P4OX7r0sez1ablgFJ8rQfYSOqmT2E3vOKh/
	 XL1zuJXJTplf6/MiwoS6+K3uqwFqEPqB6JsJsiPlfd0bgVAey2ji9EDt00Mhdmxdtg
	 achHPPvZhlgsA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 0271CCE0836; Wed, 23 Sep 2026 20:25:19 -0700 (PDT)
Date: Wed, 23 Sep 2026 20:25:18 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Vineet Gupta <vgupta@kernel.org>
Cc: Bradley Morgan <brads@mainlining.org>,
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-snps-arc@lists.infradead.org
Subject: Re: [paulmckrcu:cmpxchg2.2026.09.22a 25/28]
 arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_'
Message-ID: <15fb5b50-6687-4ddf-97a3-d860d733464c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202609240539.AkulvjVe-lkp@intel.com>
 <1849D2CD-4FCF-41BE-86D2-B4DDCF59D20B@mainlining.org>
 <9e7b3428-d462-4551-8aa8-258d10f90b96@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9e7b3428-d462-4551-8aa8-258d10f90b96@kernel.org>

On Wed, Sep 23, 2026 at 03:23:47PM -0700, Vineet Gupta wrote:
> On 9/23/26 14:13, Bradley Morgan wrote:
> > On 23 September 2026 22:12:09 BST, kernel test robot <lkp@intel.com> wrote:
> > > tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
> > > head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
> > > commit: b6d4f6af38f85e7948fd64f9bf09cbb858b4dade [25/28] ARC: Emulate two-byte cmpxchg
> > > config: arc-randconfig-1001-20260924 (https://download.01.org/0day-ci/archive/20260924/202609240539.AkulvjVe-lkp@intel.com/config)
> > > compiler: arc-linux-gcc (GCC) 14.3.0
> > > reproduce (this is a W=1 build):
> > > (https://download.01.org/0day-ci/archive/20260924/202609240539.AkulvjVe-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new
> > > version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes:
> > > https://lore.kernel.org/oe-kbuild-all/202609240539.AkulvjVe-lkp@intel.com/
> > > 
> > > All warnings (new ones prefixed by >>):
> > > 
> > >    In file included from arch/arc/include/asm/atomic.h:13,
> > >                     from include/linux/atomic.h:7,
> > >                     from include/asm-generic/bitops/lock.h:5,
> > >                     from arch/arc/include/asm/bitops.h:190,
> > >                     from include/linux/bitops.h:67,
> > >                     from include/linux/log2.h:12,
> > >                     from kernel/bounds.c:14:
> > >    include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg':
> > >    arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
> > >       80 |         if (_prev_ == _o_)                                              \
> > >          |                       ^~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
> > >     2026 |         return raw_cmpxchg(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~
> > >    arch/arc/include/asm/cmpxchg.h:80:23: note: each undeclared identifier is reported only once for each function it appears in
> > >       80 |         if (_prev_ == _o_)                                              \
> > >          |                       ^~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
> > >     2026 |         return raw_cmpxchg(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~
> > >    arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
> > >       81 |                 *_p_ = _n_;                                             \
> > >          |                        ^~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
> > >     2026 |         return raw_cmpxchg(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~
> > > > > arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_'
> > > [-Wunused-variable]
> > >       71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
> > >          |                       ^~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
> > >     2026 |         return raw_cmpxchg(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~
> > > > > arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_'
> > > [-Wunused-variable]
> > >       70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
> > >          |                       ^~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:55:21: note: in expansion of macro 'arch_cmpxchg'
> > >       55 | #define raw_cmpxchg arch_cmpxchg
> > >          |                     ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2026:16: note: in expansion of macro 'raw_cmpxchg'
> > >     2026 |         return raw_cmpxchg(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_acquire':
> > >    arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
> > >       80 |         if (_prev_ == _o_)                                              \
> > >          |                       ^~~
> > >    include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
> > >       70 | #define raw_cmpxchg_acquire arch_cmpxchg
> > >          |                             ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
> > >     2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~~~~~~~~~
> > >    arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
> > >       81 |                 *_p_ = _n_;                                             \
> > >          |                        ^~~
> > >    include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
> > >       70 | #define raw_cmpxchg_acquire arch_cmpxchg
> > >          |                             ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
> > >     2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~~~~~~~~~
> > > > > arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_'
> > > [-Wunused-variable]
> > >       71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
> > >          |                       ^~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
> > >       70 | #define raw_cmpxchg_acquire arch_cmpxchg
> > >          |                             ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
> > >     2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~~~~~~~~~
> > > > > arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_'
> > > [-Wunused-variable]
> > >       70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
> > >          |                       ^~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:70:29: note: in expansion of macro 'arch_cmpxchg'
> > >       70 | #define raw_cmpxchg_acquire arch_cmpxchg
> > >          |                             ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2055:16: note: in expansion of macro 'raw_cmpxchg_acquire'
> > >     2055 |         return raw_cmpxchg_acquire(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_release':
> > >    arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
> > >       80 |         if (_prev_ == _o_)                                              \
> > >          |                       ^~~
> > >    include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> > >       82 | #define raw_cmpxchg_release arch_cmpxchg
> > >          |                             ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
> > >     2083 |         return raw_cmpxchg_release(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~~~~~~~~~
> > >    arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
> > >       81 |                 *_p_ = _n_;                                             \
> > >          |                        ^~~
> > >    include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> > >       82 | #define raw_cmpxchg_release arch_cmpxchg
> > >          |                             ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
> > >     2083 |         return raw_cmpxchg_release(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~~~~~~~~~
> > > > > arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_'
> > > [-Wunused-variable]
> > >       71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
> > >          |                       ^~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> > >       82 | #define raw_cmpxchg_release arch_cmpxchg
> > >          |                             ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
> > >     2083 |         return raw_cmpxchg_release(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~~~~~~~~~
> > > > > arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_'
> > > [-Wunused-variable]
> > >       70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
> > >          |                       ^~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:82:29: note: in expansion of macro 'arch_cmpxchg'
> > >       82 | #define raw_cmpxchg_release arch_cmpxchg
> > >          |                             ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2083:16: note: in expansion of macro 'raw_cmpxchg_release'
> > >     2083 |         return raw_cmpxchg_release(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h: In function 'raw_atomic_cmpxchg_relaxed':
> > >    arch/arc/include/asm/cmpxchg.h:80:23: error: '_o_' undeclared (first use in this function); did you mean '_p_'?
> > >       80 |         if (_prev_ == _o_)                                              \
> > >          |                       ^~~
> > >    include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
> > >       91 | #define raw_cmpxchg_relaxed arch_cmpxchg
> > >          |                             ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
> > >     2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~~~~~~~~~
> > >    arch/arc/include/asm/cmpxchg.h:81:24: error: '_n_' undeclared (first use in this function); did you mean '_p_'?
> > >       81 |                 *_p_ = _n_;                                             \
> > >          |                        ^~~
> > >    include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
> > >       91 | #define raw_cmpxchg_relaxed arch_cmpxchg
> > >          |                             ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
> > >     2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~~~~~~~~~
> > > > > arch/arc/include/asm/cmpxchg.h:71:23: warning: unused variable '_new_'
> > > [-Wunused-variable]
> > >       71 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
> > >          |                       ^~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
> > >       91 | #define raw_cmpxchg_relaxed arch_cmpxchg
> > >          |                             ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
> > >     2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~~~~~~~~~
> > > > > arch/arc/include/asm/cmpxchg.h:70:23: warning: unused variable '_old_'
> > > [-Wunused-variable]
> > >       70 |         unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));              \
> > >          |                       ^~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:91:29: note: in expansion of macro 'arch_cmpxchg'
> > >       91 | #define raw_cmpxchg_relaxed arch_cmpxchg
> > >          |                             ^~~~~~~~~~~~
> > >    include/linux/atomic/atomic-arch-fallback.h:2108:16: note: in expansion of macro 'raw_cmpxchg_relaxed'
> > >     2108 |         return raw_cmpxchg_relaxed(&v->counter, old, new);
> > >          |                ^~~~~~~~~~~~~~~~~~~
> > >    make[3]: *** [scripts/Makefile.build:185: kernel/bounds.s] Error 1 shuffle=1050985161
> > >    make[3]: Target 'prepare' not remade because of errors.
> > >    make[2]: *** [Makefile:1425: prepare0] Error 2 shuffle=1050985161
> > >    make[2]: Target 'prepare' not remade because of errors.
> > >    make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1050985161
> > >    make[1]: Target 'prepare' not remade because of errors.
> > >    make: *** [Makefile:248: __sub-make] Error 2 shuffle=1050985161
> > >    make: Target 'prepare' not remade because of errors.
> > > 
> > > 
> > > vim +/_new_ +71 arch/arc/include/asm/cmpxchg.h
> > > 
> > >     66	
> > >     67	#define arch_cmpxchg(ptr, old, new)				        \
> > >     68	({									\
> > >     69		volatile __typeof__(ptr) _p_ = (ptr);				\
> > >   > 70		unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));		\
> > >   > 71		unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));		\
> > >     72		__typeof__(*(ptr)) _prev_;					\
> > >     73		unsigned long __flags;						\
> > >     74										\
> > >     75		/*								\
> > >     76		 * spin lock/unlock provide the needed smp_mb() before/after	\
> > >     77		 */								\
> > >     78		atomic_ops_lock(__flags);					\
> > >     79		_prev_ = *_p_;							\
> > >     80		if (_prev_ == _o_)						\
> > >     81			*_p_ = _n_;						\
> > >     82		atomic_ops_unlock(__flags);					\
> > >     83		_prev_;								\
> > >     84	})
> > >     85	
> > > 
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> > Apparently nobody uses arc
> 
> Yes the development has slowed down compared to five years ago, but its not
> dead, if anything it is still my hobby project, like so many other things
> open source and you repeating this hurts.
> 
> You stumbled onto a real issue: typeof ptr vs. *ptr which unmasked an
> existing shortcoming.
> @Paul can you please apply this in your tree and rebase the series on top.
> If not I can send this fix to Linus urgently, but it will cause some
> collisions.

Thank you, Vineet!

Just to make sure I understand, I apply this patch, then Bradley sends
me an updated version of his patch, which I apply on top of yours.

Just double-checking.  ;-)

							Thanx, Paul

> ---------->
> From f3e2402f62bebfa9f1ad21e23d1663a0a3e5a58d Mon Sep 17 00:00:00 2001
> From: Vineet Gupta <vgupta@kernel.org>
> Date: Wed, 23 Sep 2026 15:01:38 -0700
> Subject: [PATCH] ARC: arch_cmpxchg_relaxed to use size of pointed type not
>  pointer
> 
> Bradley spotted this snafu when working on two-byte cmpxchg emulation.
> He originally folded this fix into his series but the fix itself
> uncovered a pre-existing issue, missing arch_atomic64_cmpxchg_relaxed
> which just needed to be wired up.
> 
> Fixes: e188f3330a13 ("ARC: cmpxchg/xchg: rewrite as macros to make type
> safe")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes:
> https://lore.kernel.org/oe-kbuild-all/202609240539.AkulvjVe-lkp@intel.com/
> Suggested-by: Bradley Morgan <brads@mainlining.org>
> Signed-off-by: Vineet Gupta <vgupta@kernel.org>
> ---
>  arch/arc/include/asm/atomic64-arcv2.h | 6 ++++++
>  arch/arc/include/asm/cmpxchg.h        | 4 ++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arc/include/asm/atomic64-arcv2.h
> b/arch/arc/include/asm/atomic64-arcv2.h
> index 73080a664369..1ca4a1047fb3 100644
> --- a/arch/arc/include/asm/atomic64-arcv2.h
> +++ b/arch/arc/include/asm/atomic64-arcv2.h
> @@ -156,6 +156,12 @@ static inline u64 __arch_cmpxchg64_relaxed(volatile
> void *ptr, u64 old, u64 new)
>  }
>  #define arch_cmpxchg64_relaxed __arch_cmpxchg64_relaxed
> 
> +static inline s64 arch_atomic64_cmpxchg_relaxed(atomic64_t *v, s64 old, s64
> new)
> +{
> +    return arch_cmpxchg64_relaxed(&v->counter, old, new);
> +}
> +#define arch_atomic64_cmpxchg_relaxed arch_atomic64_cmpxchg_relaxed
> +
>  static inline s64 arch_atomic64_xchg(atomic64_t *ptr, s64 new)
>  {
>      s64 prev;
> diff --git a/arch/arc/include/asm/cmpxchg.h b/arch/arc/include/asm/cmpxchg.h
> index 76f43db0890f..66b3743c9400 100644
> --- a/arch/arc/include/asm/cmpxchg.h
> +++ b/arch/arc/include/asm/cmpxchg.h
> @@ -46,7 +46,7 @@
>      __typeof__(*(ptr)) _n_ = (new);                    \
>      __typeof__(*(ptr)) _prev_;                    \
>                                      \
> -    switch(sizeof((_p_))) {                        \
> +    switch (sizeof(*(_p_))) {                        \
>      case 1:                                \
>          _prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8
> *__force)_p_, (uintptr_t)_o_, (uintptr_t)_n_);    \
>          break;                            \
> @@ -102,7 +102,7 @@
>      __typeof__(ptr) _p_ = (ptr);                    \
>      __typeof__(*(ptr)) _val_ = (val);                \
>                                      \
> -    switch(sizeof(*(_p_))) {                    \
> +    switch (sizeof(*(_p_))) {                    \
>      case 4:                                \
>          _val_ = __arch_xchg(_p_, _val_);            \
>          break;                            \
> -- 
> 2.53.0
> 
