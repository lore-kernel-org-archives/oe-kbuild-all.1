Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFCA4A1D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Jan 2025 00:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736814592; cv=none; b=ZqqfRqZsBq9o270jWKOMftKu4OKf68bHiECiZ2ycZqEok/ZJOs2Hbx6YhPy7dPzmBBNPMljyBUvAZGLHYIyJIYr7NX5LgtEbIF0SnUeghPe/qPQIkVjpG8gNFawTL6gNMjkZNoa1ffMihYF9ADR2JE7EWX2NTbGOxTkMae0OZfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736814592; c=relaxed/simple;
	bh=TJbYoLlQJm1hetXbm3TRVhz8acIeH9GvLK8k5U/bj24=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A5640HuMLf+MhoYauFMHXgoBjKgIxnyCNV6cQJRZ4rl9XjYvIflY/7gy0tZacEBMJ9Z91KcL1t+oCmNL/k/GvJwLfsXGBPgbl2geAtZtm/XF9KgTylyinqSWRZ95sjdOGu2qAGaH/PupTdVQq/Wv4jfdV2P8ocdhHf6878dxsJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jjeS8via; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jjeS8via"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736814591; x=1768350591;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TJbYoLlQJm1hetXbm3TRVhz8acIeH9GvLK8k5U/bj24=;
  b=jjeS8viaHLIgr/pub1Hx9zbWP/RKCEjRq1Qx3oidmH85mptIZiliALpa
   NQkT1XAwc7qNEp0JubMFtbSB6X2k5/oA6vkV5rbNJY739u4nfDsfPxTEp
   e4Ct5p6Bqdsty0L4QtTlP28d0jUOffRadZ+gHXmU2g0kip+wZC2SVpQwC
   TH6i/F1Ok+rj6lngUUUd99aITC5bTWF5lDQg1NuJO5TcXLGK38P4Y85go
   GxFIu7A8NY39eIsqg95hCVTWTJ2CJoLFjMwRHblgRMzCazZPjey3XqVV/
   Jsa/Ja4eZ3qr6iPyS+pIixFoINgMlmyp0B4sR3R9qigOP0VBy7RdfQutW
   Q==;
X-CSE-ConnectionGUID: GLJojkjtTHi8j4mNlX7azQ==
X-CSE-MsgGUID: 4UMqPWRwQj2r5sS+B6ZWAA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36309683"
X-IronPort-AV: E=Sophos;i="6.12,312,1728975600"; 
   d="scan'208";a="36309683"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 16:29:50 -0800
X-CSE-ConnectionGUID: byl6TgGlROm10NoNz6/TCw==
X-CSE-MsgGUID: A/GYAPT2TTm6vLtIHuDG8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104504051"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Jan 2025 16:29:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXUoU-000Nsp-0H;
	Tue, 14 Jan 2025 00:29:46 +0000
Date: Tue, 14 Jan 2025 08:28:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <ast@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ast-bpf:trylock 23/29] mm/page_alloc.c:7079:53: error: 'zone'
 undeclared
Message-ID: <202501140820.eaqK0nPJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ast/bpf.git trylock
head:   1b2329dd88553224f4ef9a26e1b22cea83b071a5
commit: da4b036e3dc46bc8ab5add0a7d4944de54182afe [23/29] mm, bpf: Introduce try_alloc_pages() for opportunistic page allocation
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20250114/202501140820.eaqK0nPJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501140820.eaqK0nPJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501140820.eaqK0nPJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'try_alloc_pages_noprof':
>> mm/page_alloc.c:7079:53: error: 'zone' undeclared (first use in this function)
    7079 |         if (has_unaccepted_memory() && !list_empty(&zone->unaccepted_pages))
         |                                                     ^~~~
   mm/page_alloc.c:7079:53: note: each undeclared identifier is reported only once for each function it appears in


vim +/zone +7079 mm/page_alloc.c

  7035	
  7036	struct page *try_alloc_pages_noprof(int nid, unsigned int order)
  7037	{
  7038		/*
  7039		 * Do not specify __GFP_DIRECT_RECLAIM, since direct claim is not allowed.
  7040		 * Do not specify __GFP_KSWAPD_RECLAIM either, since wake up of kswapd
  7041		 * is not safe in arbitrary context.
  7042		 *
  7043		 * These two are the conditions for gfpflags_allow_spinning() being true.
  7044		 *
  7045		 * Specify __GFP_NOWARN since failing try_alloc_pages() is not a reason
  7046		 * to warn. Also warn would trigger printk() which is unsafe from
  7047		 * various contexts. We cannot use printk_deferred_enter() to mitigate,
  7048		 * since the running context is unknown.
  7049		 *
  7050		 * Specify __GFP_ZERO to make sure that call to kmsan_alloc_page() below
  7051		 * is safe in any context. Also zeroing the page is mandatory for
  7052		 * BPF use cases.
  7053		 *
  7054		 * Though __GFP_NOMEMALLOC is not checked in the code path below,
  7055		 * specify it here to highlight that try_alloc_pages()
  7056		 * doesn't want to deplete reserves.
  7057		 */
  7058		gfp_t alloc_gfp = __GFP_NOWARN | __GFP_ZERO | __GFP_NOMEMALLOC;
  7059		unsigned int alloc_flags = ALLOC_TRYLOCK;
  7060		struct alloc_context ac = { };
  7061		struct page *page;
  7062	
  7063		/*
  7064		 * In RT spin_trylock() may call raw_spin_lock() which is unsafe in NMI.
  7065		 * If spin_trylock() is called from hard IRQ the current task may be
  7066		 * waiting for one rt_spin_lock, but rt_spin_trylock() will mark the
  7067		 * task as the owner of another rt_spin_lock which will confuse PI
  7068		 * logic, so return immediately if called form hard IRQ or NMI.
  7069		 *
  7070		 * Note, irqs_disabled() case is ok. This function can be called
  7071		 * from raw_spin_lock_irqsave region.
  7072		 */
  7073		if (IS_ENABLED(CONFIG_PREEMPT_RT) && (in_nmi() || in_hardirq()))
  7074			return NULL;
  7075		if (!pcp_allowed_order(order))
  7076			return NULL;
  7077	
  7078	#ifdef CONFIG_UNACCEPTED_MEMORY
> 7079		if (has_unaccepted_memory() && !list_empty(&zone->unaccepted_pages))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
