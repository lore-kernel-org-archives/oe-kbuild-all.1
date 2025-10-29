Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DB82673B7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 03:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761707991; cv=none; b=U42vipu4tahiMdCCFGfbI5KSGOfxSuRcOQ9XWX1OFd9M4c31aRXTLAU3x9oRlXfux+iI4K1Th1Q4b4eFJuMrYcIHJteh5mD86jxqU5x0l5AgCu8d8Gopkip5yjo6xfBK7cjimPNg94x6c3fsVDpQj2RBzj9Zm7LHixz8QPEcRnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761707991; c=relaxed/simple;
	bh=PZ9w4WEUqwK58/tDFHd3jHGuOjPiI/3WrHqga7NahqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RkvlSp8kFEcD4LyF5JmN8JOhoWTBTA/8sOtv0jb+1WGCa+04X4NCnV/7iTIDDDcCvRj6nJpBHSbc+v0xkcz0p/JzKEiJ4O6XyPc6FBYO8PaPbpUZqm0PUoTddt+Ruy56LmwUUpICbAzCl/oUEo5ecHiKlfu9I10ZX4LxqVNOVMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vn1DvTsf; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vn1DvTsf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761707990; x=1793243990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PZ9w4WEUqwK58/tDFHd3jHGuOjPiI/3WrHqga7NahqA=;
  b=Vn1DvTsfN/Mb+nRRA2HLcS4iNTl3opS1jiLgMPgwmpXuTUaVlC+FYK+c
   d8jwnCXT0ytAh0L6M1/X/36E1uGjObRPGxXDBUF04b3Ci8RifGtSgb6qH
   7zA0lLv7IrUk3/yXniVZLv4GI0AkJoDveYmN0K+bqt0ReGufDtWOf0qpU
   zaKm9pi0+G8IXCdzIvHvq6u7kS/2kU5Ut6nh3r7Tg1AYmc22mL9+mV/Km
   sQMyRmG/glyltis+4amXuNLcuihi5kBm9/zVqVL9htYiyhBCBgHvou99v
   8aVEmy8wKwahc70goRDiOK80l/nwzDsM5c48Z6ulIhHWQTGG+bMCG4lsw
   g==;
X-CSE-ConnectionGUID: NOSwV1UKRe6xA2t8jtGojQ==
X-CSE-MsgGUID: W1J8AcFcQByiOICFsl7sXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63026498"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="63026498"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 20:19:49 -0700
X-CSE-ConnectionGUID: HkCf/Xh3RHirUwEWleDCiw==
X-CSE-MsgGUID: D4awzmMbRbes/BcQDZZviw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="186279720"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2025 20:19:48 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDwig-000K6D-2n;
	Wed, 29 Oct 2025 03:19:35 +0000
Date: Wed, 29 Oct 2025 11:18:49 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2 12/24] mm/bpf_memcontrol.c:110:27: sparse:
 sparse: symbol 'bpf_mem_cgroup_memory_events' was not declared. Should it be
 static?
Message-ID: <202510291140.feFCLvWX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2
head:   3f0df7de9436e41af09fa5797aeb7d631dc27a37
commit: 65141c40442a1310666a59c9b8cf7faf07f07301 [12/24] mm: introduce BPF kfunc to access memory events
config: hexagon-randconfig-r111-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291140.feFCLvWX-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291140.feFCLvWX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291140.feFCLvWX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/bpf_memcontrol.c:110:27: sparse: sparse: symbol 'bpf_mem_cgroup_memory_events' was not declared. Should it be static?
   mm/bpf_memcontrol.c:140:18: sparse: sparse: symbol 'bpf_mem_cgroup_flush_stats' was not declared. Should it be static?
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
    99		return page_counter_read(&memcg->memory);
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
