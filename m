Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B8D7080D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Nov 2024 04:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730608458; cv=none; b=uypCCQNOKZzV2xWImxsDBPlSaQdSpBm9RRBYh+WFDBvu4VlWpSrsR4LAT0fSk8SvnXRGgsCFTyaRdfQYlBe6/vlKWK+xLTDkW794+5VsluIBFmrTSuNbfaou3v4FEJ9HSlyQ4zdP11t/rL02IPEGt8rmJjMLF3N6pQsfa19BmhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730608458; c=relaxed/simple;
	bh=k1JH45YJIV2hCiSBGMMSTBtJKMEwnsah3BWY0Gyc9bI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Qe1nRTrhl6HGz4Rz0pvRNGLUdHKnn6k3FzGNh+ng69wtMXp1bF4j92jOO3F53kWAka0arLfDI4cpq8c/7pmW34EGjARgBQupBDZYo0xyUwijNXZeLdwjvlFkmLjCnf2olHF3FZMK/oAiCrpDiE/XaxeB9SmE+PV1zXt0oJzR4Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxWL/WfB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxWL/WfB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730608456; x=1762144456;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k1JH45YJIV2hCiSBGMMSTBtJKMEwnsah3BWY0Gyc9bI=;
  b=MxWL/WfB2kyQtVmHjTQ2Yl00E2TZtOxsaYXDhO7b0NTnhlqHA9bsstZf
   aQZSIepVACMkaXzRlUmoKwjtMuYjx7cG5CXRUqpCXVUwotKzFh7129mTU
   khtW1d/hJg4P42c9EkA4vxag0azlHyecdru/TsMT5dqvrmsL02CBQrE7y
   4t4XZHHi31hkXZcP/cptg5zbMX1wJKX65vdVgd8Xu3S/6FObdL/7RE2tL
   3ZqcUy8wp0GvL9nH38Db/150pGCCuswIvdN1rGHpgJAVbAwv/YFoSV9Al
   4ODcOso4oInh2UddBMx6MiZj91OuahnklQImBa6OAVBwOd7NUyHqcaPNg
   A==;
X-CSE-ConnectionGUID: qKoLloINR+W9CxsKjQIfHg==
X-CSE-MsgGUID: en1iDGl7TYqlfA6pMygQig==
X-IronPort-AV: E=McAfee;i="6700,10204,11244"; a="47827213"
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="47827213"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2024 21:34:13 -0700
X-CSE-ConnectionGUID: pURb6C7yQOmpXCqGbf+HJA==
X-CSE-MsgGUID: IZX9Pk2RQmus5SS3YnodzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,254,1725346800"; 
   d="scan'208";a="82994231"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 02 Nov 2024 21:34:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t7SJV-000jgr-1i;
	Sun, 03 Nov 2024 04:34:09 +0000
Date: Sun, 3 Nov 2024 12:33:14 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Olsa <jolsa@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/optimized_usdt_3 21/24]
 kernel/events/uprobes.c:2522:undefined reference to `arch_uprobe_optimize'
Message-ID: <202411031222.d41XHGa9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/optimized_usdt_3
head:   2e0575143d13814d04f02a33a4110989ccdbf3a3
commit: 0200936b03cfee067eb7db4b44079104b561b726 [21/24] uprobes/x86: Add support to optimize uprobes
config: powerpc-randconfig-003-20241103 (https://download.01.org/0day-ci/archive/20241103/202411031222.d41XHGa9-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241103/202411031222.d41XHGa9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411031222.d41XHGa9-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: kernel/events/uprobes.o: in function `handle_swbp':
>> kernel/events/uprobes.c:2522:(.text+0x76f8): undefined reference to `arch_uprobe_optimize'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [y]:
   - RESOURCE_KUNIT_TEST [=y] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +2522 kernel/events/uprobes.c

  2457	
  2458	/*
  2459	 * Run handler and ask thread to singlestep.
  2460	 * Ensure all non-fatal signals cannot interrupt thread while it singlesteps.
  2461	 */
  2462	static void handle_swbp(struct pt_regs *regs)
  2463	{
  2464		struct uprobe *uprobe;
  2465		unsigned long bp_vaddr;
  2466		int is_swbp;
  2467	
  2468		bp_vaddr = uprobe_get_swbp_addr(regs);
  2469		if (bp_vaddr == uprobe_get_trampoline_vaddr())
  2470			return uprobe_handle_trampoline(regs);
  2471	
  2472		rcu_read_lock_trace();
  2473	
  2474		uprobe = find_active_uprobe_rcu(bp_vaddr, &is_swbp);
  2475		if (!uprobe) {
  2476			if (is_swbp > 0) {
  2477				/* No matching uprobe; signal SIGTRAP. */
  2478				force_sig(SIGTRAP);
  2479			} else {
  2480				/*
  2481				 * Either we raced with uprobe_unregister() or we can't
  2482				 * access this memory. The latter is only possible if
  2483				 * another thread plays with our ->mm. In both cases
  2484				 * we can simply restart. If this vma was unmapped we
  2485				 * can pretend this insn was not executed yet and get
  2486				 * the (correct) SIGSEGV after restart.
  2487				 */
  2488				instruction_pointer_set(regs, bp_vaddr);
  2489			}
  2490			goto out;
  2491		}
  2492	
  2493		/* change it in advance for ->handler() and restart */
  2494		instruction_pointer_set(regs, bp_vaddr);
  2495	
  2496		/*
  2497		 * TODO: move copy_insn/etc into _register and remove this hack.
  2498		 * After we hit the bp, _unregister + _register can install the
  2499		 * new and not-yet-analyzed uprobe at the same address, restart.
  2500		 */
  2501		if (unlikely(!test_bit(UPROBE_COPY_INSN, &uprobe->flags)))
  2502			goto out;
  2503	
  2504		/*
  2505		 * Pairs with the smp_wmb() in prepare_uprobe().
  2506		 *
  2507		 * Guarantees that if we see the UPROBE_COPY_INSN bit set, then
  2508		 * we must also see the stores to &uprobe->arch performed by the
  2509		 * prepare_uprobe() call.
  2510		 */
  2511		smp_rmb();
  2512	
  2513		/* Tracing handlers use ->utask to communicate with fetch methods */
  2514		if (!get_utask())
  2515			goto out;
  2516	
  2517		if (arch_uprobe_ignore(&uprobe->arch, regs))
  2518			goto out;
  2519	
  2520		handler_chain(uprobe, regs);
  2521	
> 2522		arch_uprobe_optimize(&uprobe->arch, bp_vaddr);
  2523	
  2524		if (arch_uprobe_skip_sstep(&uprobe->arch, regs))
  2525			goto out;
  2526	
  2527		if (pre_ssout(uprobe, regs, bp_vaddr))
  2528			goto out;
  2529	
  2530	out:
  2531		/* arch_uprobe_skip_sstep() succeeded, or restart if can't singlestep */
  2532		rcu_read_unlock_trace();
  2533	}
  2534	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
