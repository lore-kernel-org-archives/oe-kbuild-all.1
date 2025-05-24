Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E1A1DACB8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 07:50:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748073036; cv=none; b=Jm1LZBh187aM+LqzenUxZ6dhOnWVUdBpHyg5ER+Vy6tP1RqE+9s7pgHIopmEhJXcMoLvSptMbOwkM6JOnFPkKqQglGNQppmTuglNzNFBPkUub9QmrxeUyIJHTWMoyhD9anuMxpcAfv0UmL4EgQFgpxZNXGmHrUAJICsc4jqVwUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748073036; c=relaxed/simple;
	bh=Ur0U125HvLeRccUv0Gm9fDwrMeS7QSK7C/9orS4939o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=i/WAr7npBSeuhhUyuEX2Sw7a94SV8893VB7dLVhYBleTaGyR3zeZ7VqnUv0nafDqIPxFwOwW++3S4MuJXZF2BALNoDGV+xF/uk0KR2CvQ0xYW2TGmQ+hnRzmRdt8OEvsIoD2IWe72Bw2ZRX5QmyrRyc/Kbag2abRLjOyVXGS8+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oFNJhXh/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oFNJhXh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748073035; x=1779609035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ur0U125HvLeRccUv0Gm9fDwrMeS7QSK7C/9orS4939o=;
  b=oFNJhXh/Njanx4Bqtu5p4tRJzlBpS26OnR2ubN/4/ZxXxtM765nIjpEu
   jBLtydkvYEA1XdRe0q0yMZpaZMNh3XKMvuV8tiFt/hVfsmG+JicWH21FJ
   xW68hL2q69eyDh+7qTBoXlcvpOawuYmOKRX0YdHzHfgq5fadBZT8WQjM4
   DcfZ/X/8FS7uw9egH1qIk5Wht6XltJFkWBLjENbP9xiIHOaL3l2X0AyGF
   DHgjYWWW+Cy3+gDA+i2pmEIiQHij5xw2e7Pd6vZI5ypDQuzJ/YT8QEMWl
   VHiG3Jk2jzKRojlbPYRLG1wt7XWkdS7mTLi7xQwnPAhBOSpS43/Aot24C
   g==;
X-CSE-ConnectionGUID: Gh8kRdC2T3Sd1OVTeptMog==
X-CSE-MsgGUID: 0oTvAa/DQreDBOjWZf0JUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="52747040"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="52747040"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 00:50:34 -0700
X-CSE-ConnectionGUID: 0/YQmXbOS4WqDcbrF9N6bA==
X-CSE-MsgGUID: v364cTj3Suy3hVnFew2VUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="141340325"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 24 May 2025 00:50:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIjeH-000R2K-2B;
	Sat, 24 May 2025 07:50:29 +0000
Date: Sat, 24 May 2025 15:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: Victor Erminpour <victor.erminpour@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	Sasha Levin <sashal@kernel.org>,
	Dave Aldridge <david.j.aldridge@oracle.com>,
	Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	John Donnelly <john.p.donnelly@oracle.com>,
	Alex Thorlton <alex.thorlton@oracle.com>,
	Julian Pidancet <julian.pidancet@oracle.com>,
	Gregory Herrero <gregory.herrero@oracle.com>
Subject: [jlayton:uek-localio 2063/2262] kernel/freezer.c:46:30: error:
 'TIF_KSPLICE_FREEZING' undeclared; did you mean 'TIF_SIGPENDING'?
Message-ID: <202505241515.EQlcpbeb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 4a1305799e26862733cdc2a01177bc8d88c88942 [2063/2262] ksplice: Provide an interface to freeze tasks
config: sparc64-randconfig-001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241515.EQlcpbeb-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241515.EQlcpbeb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241515.EQlcpbeb-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/writeback.h:13,
                    from include/linux/memcontrol.h:23,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from kernel/freezer.c:9:
   include/linux/highmem.h: In function 'clear_user_highpage_uncached':
   include/linux/highmem.h:265:2: error: implicit declaration of function 'clear_user_page_uncached'; did you mean 'clear_user_highpage_uncached'? [-Werror=implicit-function-declaration]
     clear_user_page_uncached(addr, vaddr, page);
     ^~~~~~~~~~~~~~~~~~~~~~~~
     clear_user_highpage_uncached
   kernel/freezer.c: In function 'freezing_slow_path':
>> kernel/freezer.c:46:30: error: 'TIF_KSPLICE_FREEZING' undeclared (first use in this function); did you mean 'TIF_SIGPENDING'?
     if (test_tsk_thread_flag(p, TIF_KSPLICE_FREEZING))
                                 ^~~~~~~~~~~~~~~~~~~~
                                 TIF_SIGPENDING
   kernel/freezer.c:46:30: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors


vim +46 kernel/freezer.c

    28	
    29	/**
    30	 * freezing_slow_path - slow path for testing whether a task needs to be frozen
    31	 * @p: task to be tested
    32	 *
    33	 * This function is called by freezing() if freezer_active isn't zero
    34	 * and tests whether @p needs to enter and stay in frozen state.  Can be
    35	 * called under any context.  The freezers are responsible for ensuring the
    36	 * target tasks see the updated state.
    37	 */
    38	bool freezing_slow_path(struct task_struct *p)
    39	{
    40		if (p->flags & (PF_NOFREEZE | PF_SUSPEND_TASK))
    41			return false;
    42	
    43		if (test_tsk_thread_flag(p, TIF_MEMDIE))
    44			return false;
    45	
  > 46		if (test_tsk_thread_flag(p, TIF_KSPLICE_FREEZING))
    47			return true;
    48	
    49		if (pm_nosig_freezing || cgroup_freezing(p))
    50			return true;
    51	
    52		if (pm_freezing && !(p->flags & PF_KTHREAD))
    53			return true;
    54	
    55		return false;
    56	}
    57	EXPORT_SYMBOL(freezing_slow_path);
    58	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
