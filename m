Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB2142EB10
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 01:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767664777; cv=none; b=AGkEVcHK5RawgedbysxR1wOIVqC7FCYFa9TYbBHzAflC19WMBRHiVF4iWlXdD8mMPx07A7SJUX1o+aKcXaaCc7Z604iZtyY7yCSeaElXKbOGO8cPDhRhTVE+spY5sRXl4WrzX3YN7g8UCB0bpdXdpTJosWo5jzpaiXg6gSZyto4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767664777; c=relaxed/simple;
	bh=9lk22hTDGI4kSRWp0LUa3iHJREBond9GT+PBATeZqf8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=VVGKn6BOtozQkFAMJCip1gP3aVa022mbfBPnjsDxycUwQTvFUdhWHorVJ0+Lkaz+XyyN5NP1cbQS3Ql787vwLjmQDyS0JI7Um1GVX8meU/uGHelEJr0OPNDpqJfpWuDt/BAC5wOkMN0Lk0ZBR4+TR5eABc+GbElMCJliO4nfXvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jh0i/iqP; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jh0i/iqP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767664775; x=1799200775;
  h=date:from:to:cc:subject:message-id;
  bh=9lk22hTDGI4kSRWp0LUa3iHJREBond9GT+PBATeZqf8=;
  b=jh0i/iqPvo+V//afVNfuxQpjTUH9Jvezgn4RGz0epvQEiGmx35FlkaRK
   /i86rQfA7/iWcIK2FXWywytSDzdlm2vKO7ZjoYwXTh8HURZwnqYengZzF
   8lYWyXXkNxSFGUQG2fsT2EcHh8UnWF7SROpwJ36gUe8UzbFlnxL6t+m24
   5tQSEklaIEBjSsaglMth9uAwM9L3HNUu3IiJ1ouMcE36jbu/l9Nypf0iv
   JNL1Q1DHUL/jN1hVfNP5xn9xOpKAdypZ9sZ066uCInSXBg1M0NLQbfIwW
   SsuKGsB88IhVQQBxMs+g1m7V2Ph/m8ffXTu9ctOg0qFZsgcLeoFfcgRBk
   g==;
X-CSE-ConnectionGUID: 2j/UZmvITBO8F2B0xddqlA==
X-CSE-MsgGUID: G84VkAgbRXqbyCWCJvA2jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="86452422"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="86452422"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 17:59:35 -0800
X-CSE-ConnectionGUID: 32SvNr8EQd6nw7Q1LX2zpA==
X-CSE-MsgGUID: tQcEzr36RV6hn4+J4igZnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="207418449"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jan 2026 17:59:33 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcwM6-000000001b3-0q06;
	Tue, 06 Jan 2026 01:59:30 +0000
Date: Tue, 06 Jan 2026 09:59:28 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 JP Kobryn <inwardvessel@gmail.com>
Subject: [linux-next:master 2202/3725] mm/bpf_memcontrol.c:125:27:
 sparse: sparse: symbol 'bpf_mem_cgroup_memory_events' was not declared.
 Should it be static?
Message-ID: <202601060951.Vua46d0y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f8f97927abf7c12382dddc93a144fc9df7919b77
commit: 99430ab8b804c26b8a0dec93fcbfe75469f3edc7 [2202/3725] mm: introduce BPF kfuncs to access memcg statistics and events
config: m68k-randconfig-r133-20260105 (https://download.01.org/0day-ci/archive/20260106/202601060951.Vua46d0y-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060951.Vua46d0y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601060951.Vua46d0y-lkp@intel.com/

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
