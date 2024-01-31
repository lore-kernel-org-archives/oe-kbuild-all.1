Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A7D3A8DA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 23:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706745498; cv=none; b=mQvpzuIY4dTMlMkv8V5nZTawOuXFwP+M9c1/ebyXm2ohpIJ9s3EhJboTJaBcoGYrEz4vw1Ho0VdL6nh6753oIQ9mXue0zCOt+hBF8LEklgKjyM/5kjUsVVP12Zdi+BsnfSGBWA7sFO4rtUstSCbV8rnWc1OuA40LwKHrKfx4zq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706745498; c=relaxed/simple;
	bh=I/mpL3LnUPdDCZHbx09sAv5SckJc+O0RSMC/iufQnMc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UnxBOLQmn0Z2aEhkQDXwG8ciJpgkUyOjnl5uBLVryHI66PFswBETua0bwUwV65zq1RVKpFHAkCPsuXU2QXFMEkPnQ8UAyeTS4MCFYCfy/C4hDOpXqB7U2Uwany7U5cPdKRWHpbPWzyEthV3qTbMA6Y7Dp/f4uKdQsKW7hYcaHlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jFerSisV; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jFerSisV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706745496; x=1738281496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/mpL3LnUPdDCZHbx09sAv5SckJc+O0RSMC/iufQnMc=;
  b=jFerSisVZ6w4exZiwc9isyTjxac8frW6ETooy2G9hd9PQVQyK3josK11
   rzWnweNOOtbyfNPl+CsxYY6edFNIiLkZBw3H+WG2wrwb4Zp5OGqVl87sW
   i8Hml7/5MaJUIHjanT/LpN1yYIgESkQ/327+1KxZ9PxZ/cYA5uEqqdNSS
   MqfazfVx7Zr7tIT2LTttr8y6zr64b08vgiv5qW18IMDveCZ2ZztCEgo4N
   zGJJ9JYesiU0ZSBKBNVRe6copyehQjvoN2+3p4sObCB9eLQV9d5AkZ1TN
   iFmgUsLtdbObWr0DZDx70IJ0+U/oDcUwbhxMgGaKV88PCIa0VjZqlQvhj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="394205726"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="394205726"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 15:58:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="911956805"
X-IronPort-AV: E=Sophos;i="6.05,233,1701158400"; 
   d="scan'208";a="911956805"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 31 Jan 2024 15:58:14 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVKQc-0002B0-1K;
	Wed, 31 Jan 2024 23:56:06 +0000
Date: Thu, 1 Feb 2024 07:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/kprobe_multi_fixes 2/10]
 kernel/bpf/helpers.c:2545:17: sparse: sparse: symbol 'bpf_preempt_count' was
 not declared. Should it be static?
Message-ID: <202402010718.npzJ6k4H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/kprobe_multi_fixes
head:   5703324025779c0c206e17abb370986a6a5a78ec
commit: 5c8e6ec673e4aaf07678b06cb5c4b09bff58ca9c [2/10] bpf: Add bpf_preempt_count kfunc
config: x86_64-randconfig-123-20240131 (https://download.01.org/0day-ci/archive/20240201/202402010718.npzJ6k4H-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010718.npzJ6k4H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010718.npzJ6k4H-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:2154:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2184:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?
>> kernel/bpf/helpers.c:2545:17: sparse: sparse: symbol 'bpf_preempt_count' was not declared. Should it be static?
   kernel/bpf/helpers.c:2492:18: sparse: sparse: context imbalance in 'bpf_rcu_read_lock' - wrong count at exit
   kernel/bpf/helpers.c:2497:18: sparse: sparse: context imbalance in 'bpf_rcu_read_unlock' - unexpected unlock

vim +/bpf_preempt_count +2545 kernel/bpf/helpers.c

  2447	
> 2448	__bpf_kfunc bool bpf_dynptr_is_null(struct bpf_dynptr_kern *ptr)
  2449	{
  2450		return !ptr->data;
  2451	}
  2452	
  2453	__bpf_kfunc bool bpf_dynptr_is_rdonly(struct bpf_dynptr_kern *ptr)
  2454	{
  2455		if (!ptr->data)
  2456			return false;
  2457	
  2458		return __bpf_dynptr_is_rdonly(ptr);
  2459	}
  2460	
  2461	__bpf_kfunc __u32 bpf_dynptr_size(const struct bpf_dynptr_kern *ptr)
  2462	{
  2463		if (!ptr->data)
  2464			return -EINVAL;
  2465	
  2466		return __bpf_dynptr_size(ptr);
  2467	}
  2468	
  2469	__bpf_kfunc int bpf_dynptr_clone(struct bpf_dynptr_kern *ptr,
  2470					 struct bpf_dynptr_kern *clone__uninit)
  2471	{
  2472		if (!ptr->data) {
  2473			bpf_dynptr_set_null(clone__uninit);
  2474			return -EINVAL;
  2475		}
  2476	
  2477		*clone__uninit = *ptr;
  2478	
  2479		return 0;
  2480	}
  2481	
  2482	__bpf_kfunc void *bpf_cast_to_kern_ctx(void *obj)
  2483	{
  2484		return obj;
  2485	}
  2486	
  2487	__bpf_kfunc void *bpf_rdonly_cast(void *obj__ign, u32 btf_id__k)
  2488	{
  2489		return obj__ign;
  2490	}
  2491	
  2492	__bpf_kfunc void bpf_rcu_read_lock(void)
  2493	{
  2494		rcu_read_lock();
  2495	}
  2496	
  2497	__bpf_kfunc void bpf_rcu_read_unlock(void)
  2498	{
  2499		rcu_read_unlock();
  2500	}
  2501	
  2502	struct bpf_throw_ctx {
  2503		struct bpf_prog_aux *aux;
  2504		u64 sp;
  2505		u64 bp;
  2506		int cnt;
  2507	};
  2508	
  2509	static bool bpf_stack_walker(void *cookie, u64 ip, u64 sp, u64 bp)
  2510	{
  2511		struct bpf_throw_ctx *ctx = cookie;
  2512		struct bpf_prog *prog;
  2513	
  2514		if (!is_bpf_text_address(ip))
  2515			return !ctx->cnt;
  2516		prog = bpf_prog_ksym_find(ip);
  2517		ctx->cnt++;
  2518		if (bpf_is_subprog(prog))
  2519			return true;
  2520		ctx->aux = prog->aux;
  2521		ctx->sp = sp;
  2522		ctx->bp = bp;
  2523		return false;
  2524	}
  2525	
  2526	__bpf_kfunc void bpf_throw(u64 cookie)
  2527	{
  2528		struct bpf_throw_ctx ctx = {};
  2529	
  2530		arch_bpf_stack_walk(bpf_stack_walker, &ctx);
  2531		WARN_ON_ONCE(!ctx.aux);
  2532		if (ctx.aux)
  2533			WARN_ON_ONCE(!ctx.aux->exception_boundary);
  2534		WARN_ON_ONCE(!ctx.bp);
  2535		WARN_ON_ONCE(!ctx.cnt);
  2536		/* Prevent KASAN false positives for CONFIG_KASAN_STACK by unpoisoning
  2537		 * deeper stack depths than ctx.sp as we do not return from bpf_throw,
  2538		 * which skips compiler generated instrumentation to do the same.
  2539		 */
  2540		kasan_unpoison_task_stack_below((void *)(long)ctx.sp);
  2541		ctx.aux->bpf_exception_cb(cookie, ctx.sp, ctx.bp, 0, 0);
  2542		WARN(1, "A call to BPF exception callback should never return\n");
  2543	}
  2544	
> 2545	__bpf_kfunc int bpf_preempt_count(void)
  2546	{
  2547		return preempt_count();
  2548	}
  2549	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
