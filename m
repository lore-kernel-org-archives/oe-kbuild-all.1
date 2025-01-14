Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 513CD240241
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 05:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736830911; cv=none; b=oULY3S2mu+7RVXUj78IAFNsPJuvsnJcjjs/TXjO6MKmtBSfFKAaiuWEffYfG4JsYbVIm7H2g+PyARnSIbQaE29aD8pIhQGWzXjMvhfyIb9wthXV2S4TBSE2RaQS0RXlT7qJO0cnR9pLHCunadLqnu0wl8Ln+FCkbBHvBdsDaYMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736830911; c=relaxed/simple;
	bh=Ya8nv824L82qEgtYgHYPhqIXKQnGsiCLtbsUPvpmGJA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fEEVj000kKtq33f6x2nHbi4cnJsggCz1JWZIobRSHLGs4oq80sWxZ09r0NHymgs9lgixZw/y3rTuThNxn1P70hxwD5hAlLPiWS3D7y/82WGrp3fH4lJNo50MpNQURuv0gvGul91rMeUPxTczyHEC022DlzFMK66X2RZZqXsPJC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qavlNM0a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qavlNM0a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3ED4C4CEDF;
	Tue, 14 Jan 2025 05:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736830910;
	bh=Ya8nv824L82qEgtYgHYPhqIXKQnGsiCLtbsUPvpmGJA=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=qavlNM0aoqQqwb6d32CQWjr5B+VDv/PrYv3mW/h8DK/B69W976W66AGVkDXkCYrqi
	 8Ifqitz6pUdf1RczbyYsGbQF8uPvSUm05pB81OyShHdVCkJsrO9Ac1R5QjadREydrP
	 FE93PT6z8ZTmFPh2cuhu0nOf/mRSiBPlloL8bth+z5hVlES9ysmZOeoSEUATQWzVBa
	 DV4PD4gYob+FW4owqrCNiNz8wWrd53WeLDYX5mzRur9g5LgbSxpTvElUI44M5lHij8
	 a6VWUAplEqkSJ0ujBNYoBQ3djpc4xKHN3EVb4BosXT5mVKU7m11zBiA+KP8yAC8Z/5
	 B0tYuDypmAnYA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 7E8F0CE09FF; Mon, 13 Jan 2025 21:01:50 -0800 (PST)
Date: Mon, 13 Jan 2025 21:01:50 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [paulmckrcu:dev.2025.01.09a 57/60] kernel/rcu/srcutree.c:798:26:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <8b728272-f6d2-4f5e-b39e-d165923d4a90@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <202501140806.qLVjWtmq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202501140806.qLVjWtmq-lkp@intel.com>

On Tue, Jan 14, 2025 at 09:01:00AM +0800, kernel test robot wrote:
> tree:   https://github.com/paulmckrcu/linux dev.2025.01.09a
> head:   a99741861216c54658023bdc01f5ad5ad3330f52
> commit: 7a99570b926cb1b906ef0c54613db372f859203e [57/60] fixup! srcu: Pull integer-to-pointer conversion into __srcu_ctr_to_ptr()
> config: arc-randconfig-r133-20250114 (https://download.01.org/0day-ci/archive/20250114/202501140806.qLVjWtmq-lkp@intel.com/config)
> compiler: arceb-elf-gcc (GCC) 13.2.0
> reproduce: (https://download.01.org/0day-ci/archive/20250114/202501140806.qLVjWtmq-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202501140806.qLVjWtmq-lkp@intel.com/

I believe that these are fixed in this commit:

fd53a7d046b1 ("srcu: Add SRCU-fast readers"), but I should let you be the
judge of that.  ;-)

Thank you for your testing efforts!

							Thanx, Paul

> sparse warnings: (new ones prefixed by >>)
>    kernel/rcu/srcutree.c:768:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
>    kernel/rcu/srcutree.c:768:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    kernel/rcu/srcutree.c:768:9: sparse:     got int *
>    kernel/rcu/srcutree.c:768:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
>    kernel/rcu/srcutree.c:768:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    kernel/rcu/srcutree.c:768:9: sparse:     got int *
>    kernel/rcu/srcutree.c:768:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
>    kernel/rcu/srcutree.c:768:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    kernel/rcu/srcutree.c:768:9: sparse:     got int *
>    kernel/rcu/srcutree.c:768:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
>    kernel/rcu/srcutree.c:768:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    kernel/rcu/srcutree.c:768:9: sparse:     got int *
>    kernel/rcu/srcutree.c:768:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got int * @@
>    kernel/rcu/srcutree.c:768:9: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    kernel/rcu/srcutree.c:768:9: sparse:     got int *
>    kernel/rcu/srcutree.c:786:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct srcu_ctr [noderef] __percpu *scpp @@     got struct srcu_ctr *scp @@
>    kernel/rcu/srcutree.c:786:39: sparse:     expected struct srcu_ctr [noderef] __percpu *scpp
>    kernel/rcu/srcutree.c:786:39: sparse:     got struct srcu_ctr *scp
> >> kernel/rcu/srcutree.c:798:26: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct srcu_ctr * @@
>    kernel/rcu/srcutree.c:798:26: sparse:     expected void const [noderef] __percpu *__vpp_verify
>    kernel/rcu/srcutree.c:798:26: sparse:     got struct srcu_ctr *
>    kernel/rcu/srcutree.c:371:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_sdp_contention' - wrong count at exit
>    kernel/rcu/srcutree.c:389:13: sparse: sparse: context imbalance in 'spin_lock_irqsave_ssp_contention' - wrong count at exit
>    kernel/rcu/srcutree.c: note: in included file (through include/linux/srcu.h, include/linux/notifier.h, include/linux/memory_hotplug.h, ...):
>    include/linux/srcutree.h:226:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
>    include/linux/srcutree.h:226:36: sparse:     expected struct srcu_ctr *
>    include/linux/srcutree.h:226:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>    include/linux/srcutree.h:226:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
>    include/linux/srcutree.h:226:36: sparse:     expected struct srcu_ctr *
>    include/linux/srcutree.h:226:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>    include/linux/srcutree.h:226:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
>    include/linux/srcutree.h:226:36: sparse:     expected struct srcu_ctr *
>    include/linux/srcutree.h:226:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>    include/linux/srcutree.h:226:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
>    include/linux/srcutree.h:226:36: sparse:     expected struct srcu_ctr *
>    include/linux/srcutree.h:226:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>    include/linux/srcutree.h:226:36: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct srcu_ctr * @@     got struct srcu_ctr [noderef] __percpu * @@
>    include/linux/srcutree.h:226:36: sparse:     expected struct srcu_ctr *
>    include/linux/srcutree.h:226:36: sparse:     got struct srcu_ctr [noderef] __percpu *
>    kernel/rcu/srcutree.c:1006:9: sparse: sparse: context imbalance in 'srcu_funnel_exp_start' - unexpected unlock
>    kernel/rcu/srcutree.c:1095:9: sparse: sparse: context imbalance in 'srcu_funnel_gp_start' - unexpected unlock
>    kernel/rcu/srcutree.c:1335:9: sparse: sparse: context imbalance in 'srcu_gp_start_if_needed' - unexpected unlock
> 
> vim +798 kernel/rcu/srcutree.c
> 
>    789	
>    790	/*
>    791	 * Removes the count for the old reader from the appropriate per-CPU
>    792	 * element of the srcu_struct.  Note that this may well be a different
>    793	 * CPU than that which was incremented by the corresponding srcu_read_lock().
>    794	 */
>    795	void __srcu_read_unlock_nmisafe(struct srcu_struct *ssp, int idx)
>    796	{
>    797		smp_mb__before_atomic(); /* C */  /* Avoid leaking the critical section. */
>  > 798		atomic_long_inc(&raw_cpu_ptr(__srcu_ctr_to_ptr(ssp, idx))->srcu_unlocks);
>    799	}
>    800	EXPORT_SYMBOL_GPL(__srcu_read_unlock_nmisafe);
>    801	
> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
