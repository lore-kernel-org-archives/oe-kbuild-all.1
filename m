Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7423D137750
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 00:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790900719; cv=none; b=G7stAx3YnXwn6mH83neWuKl3NOLZiN4XhLAC+XpcZzCbh2+1smiv/RloSGNvvnbg4JxSowTTbRZJ4DGakbN+kSY1Ru0jspHyGykePKZNXYXg+iktp6fgKQU5Um6LcNVV0z4AaQB7khYKBcdDO9EelyKXdDHDnH6gp3Wi6qR4aYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790900719; c=relaxed/simple;
	bh=RsC8MoNtG/GxTxhfLapQxzKaNuK/jgkZuulUgcTsS4E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M32sRoUSJHLXMSAFGZjJdCcFR2L9ef+g4a1O4X1Ml+hQyIMJyl7C6u7M15DIc5Z1ZtY/Rg3Van1Ea7O4IiH0GeslnTKNz6o1fGtYtp0EARtn6j+O1fDphtL2tLB6xBSWLMISLrQZj98T4oibQne8mbEqtxrNSuBKagadW1hq7dY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kDcup38Q; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kDcup38Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790900717; x=1822436717;
  h=date:from:to:cc:subject:message-id;
  bh=RsC8MoNtG/GxTxhfLapQxzKaNuK/jgkZuulUgcTsS4E=;
  b=kDcup38Q6fT1BcJ3PUjlLdON7ADs6jQo9/sATTMUysVSRrQPPd9JUTWm
   WnWAs8x/4xofVQVai9WHLLBm8RmMiFbhnUp+DYhKzh7SOctivh4Tvpz6Z
   VLNlt152rFZLeZ4HnJ6jhk1+crF0OLOOSqCwpgXnLREWom8k3/jtq6hTr
   QPaea5lVuAAhALP7fN2949t9hpYYbOu5miRttQQKS3YrKbuWg/GferSWC
   i3D87Oah/eQF5Sh0Gsr5LSfjiOeqSlwlENnjifHAGWHwIHCP8eYaenJ0M
   BZWVayvviwWzvEErySfsrD17IBalt8rTVORQ13vDVcs9cQPKoUW7F3Pbp
   Q==;
X-CSE-ConnectionGUID: Ge+2SdVTTd6PncaJ9nM+Tg==
X-CSE-MsgGUID: CVZ53K9URce47DhaRwE8dg==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="90532234"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="90532234"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 17:25:06 -0700
X-CSE-ConnectionGUID: BAJIddFnT1mIoTlrzVXJ/w==
X-CSE-MsgGUID: 1N4ZU2kIT4W/4bW1tMLxTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="302379944"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2026 17:25:03 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCR59-000000000J1-1Xle;
	Fri, 02 Oct 2026 00:24:59 +0000
Date: Fri, 02 Oct 2026 02:24:32 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:fermata 48/49] mm/bpf_memcontrol.c:175:27:
 sparse: sparse: symbol 'bpf_global_zone_page_state' was not declared. Should
 it be static?
Message-ID: <202610020219.GhjzXoqR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kkdwivedi/linux fermata
head:   babde5051be3840becf5a78de91a0b68a99f0e49
commit: 65eb663270adcb1d5ae032653a112ca96b2bac72 [48/49] mm/bpf: Add kfuncs for the free page count and memory.high
config: csky-randconfig-r2300-20261001 (https://download.01.org/0day-ci/archive/20261002/202610020219.GhjzXoqR-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610020219.GhjzXoqR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610020219.GhjzXoqR-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/bpf_memcontrol.c:25:31: sparse: sparse: symbol 'bpf_get_root_mem_cgroup' was not declared. Should it be static?
   mm/bpf_memcontrol.c:46:31: sparse: sparse: symbol 'bpf_get_mem_cgroup' was not declared. Should it be static?
   mm/bpf_memcontrol.c:80:18: sparse: sparse: symbol 'bpf_put_mem_cgroup' was not declared. Should it be static?
   mm/bpf_memcontrol.c:94:27: sparse: sparse: symbol 'bpf_mem_cgroup_vm_events' was not declared. Should it be static?
   mm/bpf_memcontrol.c:115:27: sparse: sparse: symbol 'bpf_mem_cgroup_usage' was not declared. Should it be static?
   mm/bpf_memcontrol.c:127:27: sparse: sparse: symbol 'bpf_mem_cgroup_memory_events' was not declared. Should it be static?
   mm/bpf_memcontrol.c:145:27: sparse: sparse: symbol 'bpf_mem_cgroup_page_state' was not declared. Should it be static?
   mm/bpf_memcontrol.c:159:18: sparse: sparse: symbol 'bpf_mem_cgroup_flush_stats' was not declared. Should it be static?
>> mm/bpf_memcontrol.c:175:27: sparse: sparse: symbol 'bpf_global_zone_page_state' was not declared. Should it be static?
>> mm/bpf_memcontrol.c:201:17: sparse: sparse: symbol 'bpf_mem_cgroup_set_high' was not declared. Should it be static?
   mm/bpf_memcontrol.c:234:18: sparse: sparse: symbol 'bpf_proactive_reclaim' was not declared. Should it be static?

vim +/bpf_global_zone_page_state +175 mm/bpf_memcontrol.c

   163	
   164	/**
   165	 * bpf_global_zone_page_state - Read a system-wide zone page state counter
   166	 * @item: the counter, for example NR_FREE_PAGES
   167	 *
   168	 * Reads the sum of a zone counter over all zones, as /proc/vmstat reports
   169	 * it. A reclaim policy that keeps a buffer of free memory needs the free
   170	 * page count, which lives in vm_zone_stat, a plain global variable that the
   171	 * kernel BTF does not carry.
   172	 *
   173	 * Return: the counter value in bytes, or -1 if @item is out of range.
   174	 */
 > 175	__bpf_kfunc unsigned long bpf_global_zone_page_state(enum zone_stat_item item)
   176	{
   177		if (unlikely((unsigned int)item >= NR_VM_ZONE_STAT_ITEMS))
   178			return (unsigned long)-1;
   179	
   180		return global_zone_page_state(item) * PAGE_SIZE;
   181	}
   182	
   183	/**
   184	 * bpf_mem_cgroup_set_high - Set a memory cgroup's memory.high limit
   185	 * @memcg: the memory cgroup
   186	 * @high: the new limit in bytes; a value beyond the counter's range removes
   187	 *        the limit, as writing "max" to memory.high does
   188	 *
   189	 * Sets the limit as a write to memory.high with O_NONBLOCK would: the
   190	 * counter changes at once and no reclaim happens here. Tasks that charge
   191	 * the cgroup above the limit reclaim on their way back to user space and
   192	 * are delayed in proportion to the overage, outside any lock. A proactive
   193	 * reclaim policy can use this as its backstop when its own reclaim cannot
   194	 * keep up with a cgroup's allocation rate.
   195	 *
   196	 * Only available to BPF_PROG_TYPE_SYSCALL, like bpf_proactive_reclaim().
   197	 *
   198	 * Return: 0 on success, or -EINVAL for the root memory cgroup, which has no
   199	 * memory.high.
   200	 */
 > 201	__bpf_kfunc int bpf_mem_cgroup_set_high(struct mem_cgroup *memcg, unsigned long high)
   202	{
   203		unsigned long nr_pages = high / PAGE_SIZE;
   204	
   205		if (mem_cgroup_is_root(memcg))
   206			return -EINVAL;
   207		if (nr_pages > PAGE_COUNTER_MAX)
   208			nr_pages = PAGE_COUNTER_MAX;
   209	
   210		page_counter_set_high(&memcg->memory, nr_pages);
   211		return 0;
   212	}
   213	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
