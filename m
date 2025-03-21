Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED4D22D7A0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Mar 2025 17:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742578516; cv=none; b=YaR/Af8e/h3UJvpgCrGol0y/twXNzMvaMkuudNDCUYAssUkDY+uNJYXCgFtH+sYbfg0cBoBV9kOPZu7MqoGyMTVNFfq5DEbLJCH7D0bpY88FxOqunzesRwYzzwhC2akOfCrP4vdWTRE+LEQPXZ7MzC6VpK24VdOtIBQlHHL7K2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742578516; c=relaxed/simple;
	bh=mWOQCkfyfRI0jrR8Dyme91ZfzCL1+R1uGQYWZ2jLbIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C2aorIwe92XdBirAgaNItrj0gIuVW20DPGC4pPaXyg6eDHTRqAnnzdzMsPlIjj6tXPO3urOEHLW+blmlztooyyL4mmBWHLCsNWhgJ/gR4puu+HqkRLXU7do23XJCZ7OuB3fJ8T5oWXylWNvFEhrAt8VUHkv8pz30Lm3qfTqnRUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcBhRv36; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcBhRv36"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1A2DC4CEE3;
	Fri, 21 Mar 2025 17:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742578514;
	bh=mWOQCkfyfRI0jrR8Dyme91ZfzCL1+R1uGQYWZ2jLbIc=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=gcBhRv36Vi4sWK19G9VFDsxtz1SFfBWWUOzOv58HnZ8PgZEMNGYzPPojZjl4+rchn
	 lXCl0BDU6HQAR/dDvOps1qJkv5VUPtSeW6mHOsvs1si5N7zmFfiL+ssZXN9GzfQW1N
	 MJTfikjz0uk2HW7IYNHjH22OaHuupYOiboCOWAs+9uZV4rNT1SOnNzTY5Gc5+eInEz
	 iSz6HBZrynsuX2xy268mHpBQcdO+N4Co6tr9qX3MT6EEma23oExcgxkrhCFxAnk6u2
	 roMFtLuqLcQIAVJIpojl3N9Ros68OaGrTQCg+sZIe+OgHtCUHabQ+dBmfKw7Ar40SK
	 fHKnDsNogv9gw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 4DC94CE075E; Fri, 21 Mar 2025 10:35:14 -0700 (PDT)
Date: Fri, 21 Mar 2025 10:35:14 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 42/42] include/linux/ratelimit.h:44:33: error:
 incompatible type for argument 1 of '_raw_spin_lock_irqsave'
Message-ID: <43cc9db7-4bac-46dd-9dda-27066fbcd02c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202503211321.hs5OjZIa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202503211321.hs5OjZIa-lkp@intel.com>

On Fri, Mar 21, 2025 at 01:37:40PM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev
> head:   eb8edf55ec5fb6db81f970bb09e9aefa17fc49f4
> commit: eb8edf55ec5fb6db81f970bb09e9aefa17fc49f4 [42/42] squash! drm/amd/pm: Avoid open-coded use of ratelimit_state structure's ->missed field
> config: arc-randconfig-002-20250321 (https://download.01.org/0day-ci/archive/20250321/202503211321.hs5OjZIa-lkp@intel.com/config)
> compiler: arc-linux-gcc (GCC) 11.5.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250321/202503211321.hs5OjZIa-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202503211321.hs5OjZIa-lkp@intel.com/

Good catch, fixing with attribution, and thank you for your testing efforts!

							Thanx, Paul

> All errors (new ones prefixed by >>):
> 
>    In file included from include/linux/sched.h:2186,
>                     from arch/arc/kernel/asm-offsets.c:6:
>    include/linux/ratelimit.h: In function 'ratelimit_state_reset_interval':
> >> include/linux/ratelimit.h:44:33: error: incompatible type for argument 1 of '_raw_spin_lock_irqsave'
>       44 |         raw_spin_lock_irqsave(rs->lock, flags);
>          |                               ~~^~~~~~
>          |                                 |
>          |                                 raw_spinlock_t {aka struct raw_spinlock}
>    include/linux/spinlock.h:244:48: note: in definition of macro 'raw_spin_lock_irqsave'
>      244 |                 flags = _raw_spin_lock_irqsave(lock);   \
>          |                                                ^~~~
>    In file included from include/linux/spinlock.h:312,
>                     from include/linux/sched.h:2186,
>                     from arch/arc/kernel/asm-offsets.c:6:
>    include/linux/spinlock_api_smp.h:32:65: note: expected 'raw_spinlock_t *' {aka 'struct raw_spinlock *'} but argument is of type 'raw_spinlock_t' {aka 'struct raw_spinlock'}
>       32 | unsigned long __lockfunc _raw_spin_lock_irqsave(raw_spinlock_t *lock)
>          |                                                 ~~~~~~~~~~~~~~~~^~~~
>    make[3]: *** [scripts/Makefile.build:102: arch/arc/kernel/asm-offsets.s] Error 1 shuffle=16458656
>    make[3]: Target 'prepare' not remade because of errors.
>    make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=16458656
>    make[2]: Target 'prepare' not remade because of errors.
>    make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=16458656
>    make[1]: Target 'prepare' not remade because of errors.
>    make: *** [Makefile:251: __sub-make] Error 2 shuffle=16458656
>    make: Target 'prepare' not remade because of errors.
> 
> 
> vim +/_raw_spin_lock_irqsave +44 include/linux/ratelimit.h
> 
>     39	
>     40	static inline void ratelimit_state_reset_interval(struct ratelimit_state *rs, int interval_init)
>     41	{
>     42		unsigned long flags;
>     43	
>   > 44		raw_spin_lock_irqsave(rs->lock, flags);
>     45		rs->interval = interval_init;
>     46		rs->begin = 0;
>     47		rs->printed = 0;
>     48		ratelimit_state_reset_miss(rs);
>     49		raw_spin_unlock_irqrestore(&rs->lock, flags);
>     50	}
>     51	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
