Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B111F8F14
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Jan 2025 21:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736371435; cv=none; b=Gig/kfIO4JP/KdTFYuyGilaiFfEUPMx3EEU0n9e3Plo41xJSRjW5LlsWambykXtyP10LkE3qwUOobkGaIrTB4RHdoeZZl8Skt10THnLNUWxK4WtwKco1oYbYMtl7nh/fGYOxTmBejwJrpvNQFjjiEx0sXIdghxYHdkcD0pjeJcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736371435; c=relaxed/simple;
	bh=A1xzJmHOxmBHiyP4EOQxA4R4g7jeLKaFbiXrj/knr2o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mUpcNozzlGKk0dv4a8g/aGGd/BtLW3kSF3goBFkIUU6guRb9ofqhq/FgKJ0AQGOL93xe2XQRttd/M3QJHWkGoGT8/Nt0baqVprL1W4ZgE21TJeRCMXLw3NeaFrAyQAMBmij+EnWjDT0HuIqm0fYfrKiA+gpOpeRtk1r3025zatQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NtZMk5DZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NtZMk5DZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DAB8C4CED3;
	Wed,  8 Jan 2025 21:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736371435;
	bh=A1xzJmHOxmBHiyP4EOQxA4R4g7jeLKaFbiXrj/knr2o=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=NtZMk5DZlWxzpyPfFB8/u7WMUJd+kjFBHcO4jlJ6Kt9eAdpZY4WAamAkQI2lvSu+8
	 ZBf/G9YpasEX78X6NuUJpeF0BbiCXYKykuEcMSdAUmLIjg5+Z1CRkayqZkMbuddtfd
	 SHjPPDZX8vTMy717eVeB8XvNRek8rM8kzT7R+VEmvjlfmou4IbVEWc8VYswbsPS6kh
	 YoevlIMNwdQp7EUH1E5erH9U8uvXGdvcBN0Xl/8LyVCjMqucqu1QHUfoDO/L+mqy9J
	 WABG8AGonvw5KyAJFZLjKtqrobujUq5Fh9JiXs2IZHOuQO/VBx626BFnfXfZsYSFBk
	 3yAH6FrfKrdSQ==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id D5650CE10F9; Wed,  8 Jan 2025 13:23:54 -0800 (PST)
Date: Wed, 8 Jan 2025 13:23:54 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2024.12.31a 21/29] kernel/rcu/srcutree.c:778:26:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <8461d8a5-eef2-4492-abd8-3709da533c1c@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202501090502.9qIoaG7H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501090502.9qIoaG7H-lkp@intel.com>

On Thu, Jan 09, 2025 at 05:11:44AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2024.12.31a
> head:   adaa614a85924c685533b2cc28dea7969f33c562
> commit: 17de1a67bd96dd8010947686f82e795a24d81078 [21/29] srcu: Make SRCU readers use ->srcu_ctrs for counter selection
> config: powerpc-randconfig-r112-20250109 (https://download.01.org/0day-ci/archive/20250109/202501090502.9qIoaG7H-lkp@intel.com/config)
> compiler: powerpc-linux-gcc (GCC) 14.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250109/202501090502.9qIoaG7H-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501090502.9qIoaG7H-lkp@intel.com/
> 
> sparse warnings: (new ones prefixed by >>)
> >> kernel/rcu/srcutree.c:778:26: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct atomic_t [usertype] *v @@     got struct atomic_t [noderef] __percpu * @@
>    kernel/rcu/srcutree.c:778:26: sparse:     expected struct atomic_t [usertype] *v
>    kernel/rcu/srcutree.c:778:26: sparse:     got struct atomic_t [noderef] __percpu *
>    kernel/rcu/srcutree.c:372:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_sdp_contention' - wrong count at exit
>    kernel/rcu/srcutree.c:390:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_ssp_contention' - wrong count at exit
>    kernel/rcu/srcutree.c:1002:9: sparse: sparse: context imbalance in 'srcu_funnel_exp_start' - unexpected unlock
>    kernel/rcu/srcutree.c:1091:9: sparse: sparse: context imbalance in 'srcu_funnel_gp_start' - unexpected unlock
>    kernel/rcu/srcutree.c:1330:9: sparse: sparse: context imbalance in 'srcu_gp_start_if_needed' - unexpected unlock

This commit has not been one of my better efforts.  I have a replacement
that fixes a number of bugs, though there is at least one more than I
know of.

It will get there, and in the meantime, thank you for your testing!!!

							Thanx, Paul

> vim +778 kernel/rcu/srcutree.c
> 
>    768	
>    769	/*
>    770	 * Counts the new reader in the appropriate per-CPU element of the
>    771	 * srcu_struct, but in an NMI-safe manner using RMW atomics.
>    772	 * Returns an index that must be passed to the matching srcu_read_unlock().
>    773	 */
>    774	int __srcu_read_lock_nmisafe(struct srcu_struct *ssp)
>    775	{
>    776		struct srcu_ctr __percpu *scp = READ_ONCE(ssp->srcu_ctrp);
>    777	
>  > 778		atomic_long_inc(&scp->srcu_locks);
>    779		smp_mb__after_atomic(); /* B */  /* Avoid leaking the critical section. */
>    780		return scp - &ssp->sda->srcu_ctrs[0];
>    781	}
>    782	EXPORT_SYMBOL_GPL(__srcu_read_lock_nmisafe);
>    783	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
