Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939BC280CE5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Jun 2026 19:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781464066; cv=none; b=IDcLRmYpE+vVuNl3hpBXGksidZ1Gb3U3PDMWmlmt8nBcXju9p+izmLEq3u9EpiN2LjBf0AcrJaoRHMQyaxnyD2ruJjjeNqmBz+1dgKXROcf8oco00Kc9rpfhOhGfWWSpIjhfLgZtDBQ2wMgB913wv5Xj/0LhjytPoglCU+pRSto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781464066; c=relaxed/simple;
	bh=X4e8JEO+Tb3fONLnNopviPsKlYoGFxiIwcJBNHdSz0w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p2Yt0owPePtg56GhzNoAap+As8991OiFaeERfQ3r4ZgSOxPqelKSP84GV6lSZbTT2BCnLl38fTgY5KGWxn5v94iaFGH06Bj6BzRtpZweszhpFuRSkSMdVWlYqZt7t0lWqrEG5LRx3R7yLW6CHQqTPzxe6+WXFPYeII+I9tEjL0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bMT/kuaz; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bMT/kuaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781464065; x=1813000065;
  h=date:from:to:cc:subject:message-id;
  bh=X4e8JEO+Tb3fONLnNopviPsKlYoGFxiIwcJBNHdSz0w=;
  b=bMT/kuazOZ7uhxDUCtSDvrMQzA1UD8Bza77TRCEHJvw516GS4IZ4SiUU
   o9J/CBxQArKlo360OcXE/p+eZkGLKhhOTLLkkpa1PEJH4QVnpXtbzyYS+
   LN1QAFJEDQXT3jIw1nFisycVnZDuncL8imPzh/QAavFCXlbCNBSDypNUw
   sAfudshlIyWRi3tjqzgFmGnA1NQatVizYcJFNHFgwKPy2UmQeiG0jscG6
   iWI49MaslCFJv/ZIjZycytkxOAfg2O16ejnkYixGJQvohcgKTE9NFubXt
   wecLQy4ZD/wrgQz5IQQ//HbMau+NHbDDR3LEBpt67bkYh22fhsTVQdaux
   A==;
X-CSE-ConnectionGUID: TE4RanjiTd2aDEPfMz9TuQ==
X-CSE-MsgGUID: 1L8dZI6IQQuUrVDoY9z7bQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11817"; a="81348400"
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="81348400"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2026 12:07:44 -0700
X-CSE-ConnectionGUID: ZjZYJBhuTJi5CgSvqgB43Q==
X-CSE-MsgGUID: FD/TdWhAR3GOStqQcJq/1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,205,1774335600"; 
   d="scan'208";a="252231299"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 14 Jun 2026 12:07:42 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wYqBH-00000000R90-2Hf6;
	Sun, 14 Jun 2026 19:07:39 +0000
Date: Mon, 15 Jun 2026 03:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Alexei Starovoitov <ast@kernel.org>, JP Kobryn <inwardvessel@gmail.com>
Subject: mm/bpf_memcontrol.c:125:27: sparse: sparse: symbol
 'bpf_mem_cgroup_memory_events' was not declared. Should it be static?
Message-ID: <202606150332.Xy4Egd9s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cd9520d35a6c38db6567e97dd93b1f11f185dc6
commit: 99430ab8b804c26b8a0dec93fcbfe75469f3edc7 mm: introduce BPF kfuncs to access memcg statistics and events
date:   6 months ago
config: powerpc-randconfig-r134-20260614 (https://download.01.org/0day-ci/archive/20260615/202606150332.Xy4Egd9s-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 305faf498a4e0b52b40742c927af63ab2082e1a9)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260615/202606150332.Xy4Egd9s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 99430ab8b804 ("mm: introduce BPF kfuncs to access memcg statistics and events")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606150332.Xy4Egd9s-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/bpf_memcontrol.c:125:27: sparse: sparse: symbol 'bpf_mem_cgroup_memory_events' was not declared. Should it be static?
   mm/bpf_memcontrol.c:68:9: sparse: sparse: context imbalance in 'bpf_get_mem_cgroup' - different lock contexts for basic block

vim +/bpf_mem_cgroup_memory_events +125 mm/bpf_memcontrol.c

   117	
   118	/**
   119	 * bpf_mem_cgroup_memory_events - Read memory cgroup's memory event value
   120	 * @memcg: memory cgroup
   121	 * @event: memory event id
   122	 *
   123	 * Return: The current value of the memory event counter.
   124	 */
 > 125	__bpf_kfunc unsigned long bpf_mem_cgroup_memory_events(struct mem_cgroup *memcg,
   126							       enum memcg_memory_event event)
   127	{
   128		if (unlikely(event >= MEMCG_NR_MEMORY_EVENTS))
   129			return (unsigned long)-1;
   130	
   131		return atomic_long_read(&memcg->memory_events[event]);
   132	}
   133	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
