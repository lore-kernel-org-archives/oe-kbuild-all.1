Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2787D25EF87
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 03:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764732795; cv=none; b=RNo8hcKbYlW52eGJZtWQz9ZFkI9oJYYh5aJuaYry2iBlmDAEZd34FmvdNr0Y1COMseLRLu82/YXl2fOHCqTKmAr8jKzoYFMONWoLLNlcuqjs8OInvoEVm/XN9HwjNGDi7rP3qunjMcWQz4p9a0GkZcSiGCzWy1hmM7VLM4OHeHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764732795; c=relaxed/simple;
	bh=pF92qd8vcNzCTWj3vobUghfjCA/jboSHn9Ujh2Ir2pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZbMroY2O8Qz5zYtfqkKsBB3F6+PaGAFYu6tP2NrzzAFHn+aP6zihjdQQuguQSREtzXFqE5MEreE606gxUtqaEkEyPAPinf6JHuuwwJd50K2KNuDmkJV+9VKHTptuhJeD3ffK6W+5KOfKERtsw9LaFH4j6aleEVbUIMWzdck6uYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESZfTK9/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESZfTK9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764732795; x=1796268795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pF92qd8vcNzCTWj3vobUghfjCA/jboSHn9Ujh2Ir2pg=;
  b=ESZfTK9/KUVyosxzRSd6Rttq+1FM2TW835N0aN6y41I8Rx+qZVfdrIgm
   Nia+oigWYvVwGWn/joFS3XnO2oPo4n6HFQFNihDTn35kaox/cjx8puwHu
   4C4dAAHfrMzFGpiK17EOi8DJSQq/oD23+vcCqAdhYFn98OCSiru8YeOs2
   PuWMJvl3kUDhSeaCnblAUQmyldGG8mZAC/SSE/KtPJ0NsDWZQ5jH3MzaM
   UufnYTtAZwj3HUcSrJ+H0p0QReaKJQC2TKamO5YagAwqguP5maIuKjKxF
   6qH6MvDVN1WmoLhgfY3X1WqVokqB1L6uzCvl3eSOc4E0z0b8V0jk+RRPr
   Q==;
X-CSE-ConnectionGUID: LE/wI6ofQCSo5jPaSS3WLA==
X-CSE-MsgGUID: 57IUC6S1QDegCFirg7LqJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70575448"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="70575448"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 19:33:11 -0800
X-CSE-ConnectionGUID: HvT7mUsUQ6mW8CLiMGx01Q==
X-CSE-MsgGUID: eCvzKnVUTfGr3RdF5NMFlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194554550"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Dec 2025 19:33:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQdc3-00000000AVr-0yLy;
	Wed, 03 Dec 2025 03:33:07 +0000
Date: Wed, 3 Dec 2025 11:33:02 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.3.1 14/28] mm/bpf_memcontrol.c:110:27: sparse:
 sparse: symbol 'bpf_mem_cgroup_memory_events' was not declared. Should it be
 static?
Message-ID: <202512031109.23tnEFwS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.3.1
head:   dca9f586d5471222d105b51cf2ceb5eb91fdda01
commit: 7a2b79c829dc8a15df310c4dc92d9c01b1e0bfa3 [14/28] mm: introduce BPF kfunc to access memory events
config: i386-randconfig-062-20251202 (https://download.01.org/0day-ci/archive/20251203/202512031109.23tnEFwS-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031109.23tnEFwS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031109.23tnEFwS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/bpf_memcontrol.c:110:27: sparse: sparse: symbol 'bpf_mem_cgroup_memory_events' was not declared. Should it be static?
   mm/bpf_memcontrol.c:63:9: sparse: sparse: context imbalance in 'bpf_get_mem_cgroup' - different lock contexts for basic block

vim +/bpf_mem_cgroup_memory_events +110 mm/bpf_memcontrol.c

    12	
    13	/**
    14	 * bpf_get_root_mem_cgroup - Returns a pointer to the root memory cgroup
    15	 *
    16	 * The function has KF_ACQUIRE semantics, even though the root memory
    17	 * cgroup is never destroyed after being created and doesn't require
    18	 * reference counting. And it's perfectly safe to pass it to
    19	 * bpf_put_mem_cgroup()
    20	 */
  > 21	__bpf_kfunc struct mem_cgroup *bpf_get_root_mem_cgroup(void)
    22	{
    23		/* css_get() is not needed */
    24		return root_mem_cgroup;
    25	}
    26	
    27	/**
    28	 * bpf_get_mem_cgroup - Get a reference to a memory cgroup
    29	 * @css: pointer to the css structure
    30	 *
    31	 * Returns a pointer to a mem_cgroup structure after bumping
    32	 * the corresponding css's reference counter.
    33	 *
    34	 * It's fine to pass a css which belongs to any cgroup controller,
    35	 * e.g. unified hierarchy's main css.
    36	 *
    37	 * Implements KF_ACQUIRE semantics.
    38	 */
    39	__bpf_kfunc struct mem_cgroup *
    40	bpf_get_mem_cgroup(struct cgroup_subsys_state *css)
    41	{
    42		struct mem_cgroup *memcg = NULL;
    43		bool rcu_unlock = false;
    44	
    45		if (!root_mem_cgroup)
    46			return NULL;
    47	
    48		if (root_mem_cgroup->css.ss != css->ss) {
    49			struct cgroup *cgroup = css->cgroup;
    50			int ssid = root_mem_cgroup->css.ss->id;
    51	
    52			rcu_read_lock();
    53			rcu_unlock = true;
    54			css = rcu_dereference_raw(cgroup->subsys[ssid]);
    55		}
    56	
    57		if (css && css_tryget(css))
    58			memcg = container_of(css, struct mem_cgroup, css);
    59	
    60		if (rcu_unlock)
    61			rcu_read_unlock();
    62	
    63		return memcg;
    64	}
    65	
    66	/**
    67	 * bpf_put_mem_cgroup - Put a reference to a memory cgroup
    68	 * @memcg: memory cgroup to release
    69	 *
    70	 * Releases a previously acquired memcg reference.
    71	 * Implements KF_RELEASE semantics.
    72	 */
    73	__bpf_kfunc void bpf_put_mem_cgroup(struct mem_cgroup *memcg)
    74	{
    75		css_put(&memcg->css);
    76	}
    77	
    78	/**
    79	 * bpf_mem_cgroup_vm_events - Read memory cgroup's vm event counter
    80	 * @memcg: memory cgroup
    81	 * @event: event id
    82	 *
    83	 * Allows to read memory cgroup event counters.
    84	 */
    85	__bpf_kfunc unsigned long bpf_mem_cgroup_vm_events(struct mem_cgroup *memcg,
    86							enum vm_event_item event)
    87	{
    88		return memcg_events(memcg, event);
    89	}
    90	
    91	/**
    92	 * bpf_mem_cgroup_usage - Read memory cgroup's usage
    93	 * @memcg: memory cgroup
    94	 *
    95	 * Returns current memory cgroup size in bytes.
    96	 */
    97	__bpf_kfunc unsigned long bpf_mem_cgroup_usage(struct mem_cgroup *memcg)
    98	{
    99		return page_counter_read(&memcg->memory) * PAGE_SIZE;
   100	}
   101	
   102	/**
   103	 * bpf_mem_cgroup_events - Read memory cgroup's page state counter
   104	 * bpf_mem_cgroup_memory_events - Read memory cgroup's memory event value
   105	 * @memcg: memory cgroup
   106	 * @event: memory event id
   107	 *
   108	 * Returns current memory event count.
   109	 */
 > 110	__bpf_kfunc unsigned long bpf_mem_cgroup_memory_events(struct mem_cgroup *memcg,
   111							enum memcg_memory_event event)
   112	{
   113		if (event >= MEMCG_NR_MEMORY_EVENTS)
   114			return (unsigned long)-1;
   115	
   116		return atomic_long_read(&memcg->memory_events[event]);
   117	}
   118	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
