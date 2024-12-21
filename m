Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4361DFD8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Dec 2024 18:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734805030; cv=none; b=IvNjSnwz7X5xXO6zW3hrxdPAiZSVRlLrhP8CFcnScphB01FMUAJC9Ds9XGDag5MBcGOBd+Akz+6yVZo3EB1AYKDEzJad1AisVf1oY3eZyOqggeIIfEty9zVTceNcye8cvPXwS73jV6j3jvO9MMI+k/wNpRa5iW6QGAESUz66ZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734805030; c=relaxed/simple;
	bh=ckNv6dI7UyPvEYzmNR7amcc7GrbWSraf4tu3Xan55jQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPdYnlA8CrqnzWNt1YkiJEzk06ITZpGTcFvpI+uihtmAJGh2nHP6GY2YkWe62v5pyM+e8FWSrqpjw41glUwA4TAaRbHmninYyS+nC+H7AMxyaa5Tmcq0ymC99XgfNUJ3y7mhOYbuVupAY37Y7HD9cmK+LYSznH7sT83SZFGwYsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eStMfEKn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eStMfEKn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B9CC4CECE;
	Sat, 21 Dec 2024 18:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734805029;
	bh=ckNv6dI7UyPvEYzmNR7amcc7GrbWSraf4tu3Xan55jQ=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=eStMfEKn4sRtnoKI2swUiEznkEWDTtJ3NMhhOYOXu7+e6QTTXespOPz+ZvEwom4zU
	 O2GY2mh7xSu2pMVwhYXc8klzZa5ZqeGngzBUcGKHdZ5NwtyP/mwyKZEf6OYI6cx4QP
	 iwUEZYCgbaSxt/tpAKPACpSYLlFhGSY+GOQ3w4ZO7Xt6N+4hvbbd08lenkoK+frIjD
	 5jN1W26ULfYI8O5Dn428KSwrt5QqpEZh3I3CghbNGxAED4m5VVWDTVW0N7lpIeQgRu
	 xAfrw/Q3V6sliqXLltPIf14G1cpFH1XbdrG7ZCBZacWZRWpuuwg9kWm1N2YBYs8P7I
	 ZBHYQxkfJKzjw==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 62255CE0BC4; Sat, 21 Dec 2024 10:17:09 -0800 (PST)
Date: Sat, 21 Dec 2024 10:17:09 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev 28/32] kernel/rcu/srcutree.c:795:25: error:
 passing argument 1 of 'atomic_long_inc' from incompatible pointer type
Message-ID: <33b5b94a-ca3c-4248-b2a6-147c805dfdc4@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202412220101.64Tr3TwV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202412220101.64Tr3TwV-lkp@intel.com>

On Sun, Dec 22, 2024 at 02:03:25AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev
> head:   61a0b92b3a3cfef69e3848806e51d1b99a9e9406
> commit: 62986fee7c7a83cb091dca361bcb1ea1b40d4ec4 [28/32] srcu: Pull ->srcu_{un,}lock_count into a new srcu_ctr structure
> config: sparc-randconfig-002-20241221 (https://download.01.org/0day-ci/archive/20241222/202412220101.64Tr3TwV-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412220101.64Tr3TwV-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202412220101.64Tr3TwV-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    kernel/rcu/srcutree.c: In function '__srcu_read_lock_nmisafe':
>    kernel/rcu/srcutree.c:779:56: error: expected ')' before ']' token
>      779 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_locks]);
>          |                        ~                               ^
>          |                                                        )

Good catch!  I will fix this on my next rebase with attribution.

							Thanx, Paul

>    kernel/rcu/srcutree.c:779:56: error: expected ';' before ']' token
>      779 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_locks]);
>          |                                                        ^
>          |                                                        ;
>    kernel/rcu/srcutree.c:779:56: error: expected statement before ']' token
>    kernel/rcu/srcutree.c:779:57: error: expected statement before ')' token
>      779 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_locks]);
>          |                                                         ^
>    kernel/rcu/srcutree.c: In function '__srcu_read_unlock_nmisafe':
> >> kernel/rcu/srcutree.c:795:25: error: passing argument 1 of 'atomic_long_inc' from incompatible pointer type [-Wincompatible-pointer-types]
>      795 |         atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_unlocks.counter);
>          |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>          |                         |
>          |                         s64 * {aka long long int *}
>    In file included from include/linux/atomic.h:82,
>                     from include/asm-generic/bitops/lock.h:5,
>                     from arch/sparc/include/asm/bitops_64.h:52,
>                     from arch/sparc/include/asm/bitops.h:5,
>                     from include/linux/bitops.h:68,
>                     from include/linux/thread_info.h:27,
>                     from arch/sparc/include/asm/current.h:15,
>                     from include/linux/mutex.h:14,
>                     from kernel/rcu/srcutree.c:19:
>    include/linux/atomic/atomic-instrumented.h:3589:32: note: expected 'atomic_long_t *' {aka 'atomic64_t *'} but argument is of type 's64 *' {aka 'long long int *'}
>     3589 | atomic_long_inc(atomic_long_t *v)
>          |                 ~~~~~~~~~~~~~~~^
> 
> 
> vim +/atomic_long_inc +795 kernel/rcu/srcutree.c
> 
>    784	
>    785	/*
>    786	 * Removes the count for the old reader from the appropriate per-CPU
>    787	 * element of the srcu_struct.  Note that this may well be a different
>    788	 * CPU than that which was incremented by the corresponding srcu_read_lock().
>    789	 */
>    790	void __srcu_read_unlock_nmisafe(struct srcu_struct *ssp, int idx)
>    791	{
>    792		struct srcu_data *sdp = raw_cpu_ptr(ssp->sda);
>    793	
>    794		smp_mb__before_atomic(); /* C */  /* Avoid leaking the critical section. */
>  > 795		atomic_long_inc(&sdp->srcu_ctrs[idx].srcu_unlocks.counter);
>    796	}
>    797	EXPORT_SYMBOL_GPL(__srcu_read_unlock_nmisafe);
>    798	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
