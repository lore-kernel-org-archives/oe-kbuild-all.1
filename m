Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BBA1306D40
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Oct 2025 20:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760560668; cv=none; b=O5OZXwbfR3g2rKtBTFxAMzz9vaDwmygp05plzhhyXbqeTqBdIk5N0PrJ2ZCrjej4srOrhsl1jiVThq/fQKkb3+WwLte4tDpxS7tH/+ZWDAeRjagm/5XOkxaf7or+Mxy28dSMWtwdmgtwnWh4db9zN4tisKDc0TbSZMxto6Aa1ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760560668; c=relaxed/simple;
	bh=qZfZFh1M6wfp+obRY5Os3znWyVosdehhOY4dwUF5+9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bTZCbyD9Kh9lQ69IV9iubKF1sbPJsBy/riD/Vh8CVN4XVucSvnJpAA/Jo19dkH0w/ggBX4V9az3yfGDJ1fyprtrXqbRoI0wbHV36xpCbkDtj26och5c4uBpjdMKf9J200ZrHhSbZCaHz3AbEZ/PH73WRVPt8tOWkn62TYJy0854=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhgLjg3e; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhgLjg3e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760560666; x=1792096666;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qZfZFh1M6wfp+obRY5Os3znWyVosdehhOY4dwUF5+9M=;
  b=hhgLjg3e7E3gecFbD0gDNVsl/o+ZhUxQi5zSmmoe2OCzsBBBJ7/k+dVW
   gQ2mymeVtfOhIOTSbtzWemvLVG/M8oD8YHm8uYOqSwCCOzJvG14kuoc7+
   kml7zcPSntTYuT7k1ChQsp+yQbTVMgOJe7Txjxj+B7Ea2u/1FFEp4XceT
   kW53ew645T2sNbA4qu7VGq96k2UKzA1WgPcvJN7mNGqU+sN7rcpF1loOn
   ajpDXc0ulcUH7IQjhI1/la4pNVLZP8PrHzkm8Zo+kqvW40NTVMpHXzIhs
   ZQ5CecXZOQe4hC896F6rbL8wXy5a6Bwt9iv56fzm3k9RtKqipXKPED5Vg
   A==;
X-CSE-ConnectionGUID: Eq47XAxiQ+urmn3KParY9A==
X-CSE-MsgGUID: h8h31JozQZev01PLm0taFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62647051"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="62647051"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 13:37:45 -0700
X-CSE-ConnectionGUID: m6H8PniITviq0CfxyfvuXg==
X-CSE-MsgGUID: Tvr8FzOLTUmgnoCIhU4T3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="182214275"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 15 Oct 2025 13:37:44 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v98Fi-0004D9-0o;
	Wed, 15 Oct 2025 20:37:42 +0000
Date: Thu, 16 Oct 2025 04:37:18 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.2.2 8/21] mm/bpf_memcontrol.c:71:27: sparse:
 sparse: symbol 'bpf_mem_cgroup_events' was not declared. Should it be
 static?
Message-ID: <202510160418.zwmsYB4f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.2.2
head:   45efac5878c5044a04954bf71d4e895e8c13a604
commit: f811653ff6f0f0c1e8b85e1fe6a68724d2b707c6 [8/21] mm: introduce bpf kfuncs to deal with memcg pointers
config: x86_64-randconfig-r112-20251015 (https://download.01.org/0day-ci/archive/20251016/202510160418.zwmsYB4f-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510160418.zwmsYB4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510160418.zwmsYB4f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/bpf_memcontrol.c:71:27: sparse: sparse: symbol 'bpf_mem_cgroup_events' was not declared. Should it be static?
>> mm/bpf_memcontrol.c:117:18: sparse: sparse: symbol 'bpf_mem_cgroup_flush_stats' was not declared. Should it be static?
   mm/bpf_memcontrol.c:49:9: sparse: sparse: context imbalance in 'bpf_get_mem_cgroup' - different lock contexts for basic block

vim +/bpf_mem_cgroup_events +71 mm/bpf_memcontrol.c

    63	
    64	/**
    65	 * bpf_mem_cgroup_events - Read memory cgroup's event counter
    66	 * @memcg: memory cgroup
    67	 * @event: event idx
    68	 *
    69	 * Allows to read memory cgroup event counters.
    70	 */
  > 71	__bpf_kfunc unsigned long bpf_mem_cgroup_events(struct mem_cgroup *memcg, int event)
    72	{
    73	
    74		if (event < 0 || event >= NR_VM_EVENT_ITEMS)
    75			return (unsigned long)-1;
    76	
    77		return memcg_events(memcg, event);
    78	}
    79	
    80	/**
    81	 * bpf_mem_cgroup_usage - Read memory cgroup's usage
    82	 * @memcg: memory cgroup
    83	 *
    84	 * Returns current memory cgroup size in bytes.
    85	 */
    86	__bpf_kfunc unsigned long bpf_mem_cgroup_usage(struct mem_cgroup *memcg)
    87	{
    88		return page_counter_read(&memcg->memory);
    89	}
    90	
    91	/**
    92	 * bpf_mem_cgroup_events - Read memory cgroup's page state counter
    93	 * @memcg: memory cgroup
    94	 * @event: event idx
    95	 *
    96	 * Allows to read memory cgroup statistics.
    97	 */
    98	__bpf_kfunc unsigned long bpf_mem_cgroup_page_state(struct mem_cgroup *memcg, int idx)
    99	{
   100		if (idx < 0 || idx >= MEMCG_NR_STAT)
   101			return (unsigned long)-1;
   102	
   103		return memcg_page_state(memcg, idx);
   104	}
   105	
   106	/**
   107	 * bpf_mem_cgroup_flush_stats - Flush memory cgroup's statistics
   108	 * @memcg: memory cgroup
   109	 *
   110	 * Propagate memory cgroup's statistics up the cgroup tree.
   111	 *
   112	 * Note, that this function uses the rate-limited version of
   113	 * mem_cgroup_flush_stats() to avoid hurting the system-wide
   114	 * performance. So bpf_mem_cgroup_flush_stats() guarantees only
   115	 * that statistics is not stale beyond 2*FLUSH_TIME.
   116	 */
 > 117	__bpf_kfunc void bpf_mem_cgroup_flush_stats(struct mem_cgroup *memcg)
   118	{
   119		mem_cgroup_flush_stats_ratelimited(memcg);
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
