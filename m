Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCF321DEFD9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 06:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746599478; cv=none; b=eAYyc4/fNkUXWybLPQuzZZI3rTzo0krck3dcG/px4FSQjrNiWTRsobHocbqshL0LspLoUYN225tk6K7poSR3P/8n8SD10KeQV3/Gh1miMphMrx2qaQGchec+lWKj+uLC+xP0slXIL53IP0IG3d+4AwP8YqiSe+w64LNlGoqyWU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746599478; c=relaxed/simple;
	bh=bvCPgWK4nREVdQit1iBpSWu1BUlLKgHEQdZWYkKzl2w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RmqP8kDGfCW8+IZa/nEtnEFVLPwKn7/1UJYDntgzh4PvxdXK490V276gEgYkaJhnbDLz0azicOegun1BpNeUzj77P9CQUnKfjdmcbrrd0s6gSIfZ6kx7Oz1Ujo3tlbPFGlCsuM2MV7LO3rP6/VQHqmUiI/WvcxF5/UYaVa/i9NQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9nxmWAy; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9nxmWAy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746599477; x=1778135477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bvCPgWK4nREVdQit1iBpSWu1BUlLKgHEQdZWYkKzl2w=;
  b=c9nxmWAy6bd4B6bWHjwl6jhiPuQ8FAmevCRC77hNKOHOW9hGGj0FewjL
   n7beTaLjWreNUSX66DOglcbbQWNavtOfII7Iqw/CVFwRpXQ9l0SQjXyX7
   2S2IDqgszNvMpftL0QjVcQlL5MTS5bk4d+DhOxdJHwnKHm5+6p1TN0tQG
   SlOtQq8QrkONmMI0rrwQLqv2ZHtliC1WsZ3TcX3PxnSD6WaViTqBLor1F
   zouJ4i4sbv9jgFXPdhpHhdR0keY90BAE3YDwQdm/iMdormSPZNWIwkkKX
   onUbNhmH8VhDYj3S398Kw50fDuIPwcO8jJUNsEnsN18/elt5O3Lc7jROa
   A==;
X-CSE-ConnectionGUID: oLAkdLhbRxSHfIPscponkg==
X-CSE-MsgGUID: pdCTFM25SSOwx/H6FIUW8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="70818309"
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="70818309"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2025 23:31:16 -0700
X-CSE-ConnectionGUID: oZOK2U1iQ4uiw9Ok502+FA==
X-CSE-MsgGUID: USEPOiFHROO9WwOAk+7hpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,268,1739865600"; 
   d="scan'208";a="135744292"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 06 May 2025 23:31:13 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCYJC-0007CN-1G;
	Wed, 07 May 2025 06:31:10 +0000
Date: Wed, 7 May 2025 14:30:20 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.rfc 6/13] mm/bpf_memcontrol.c:45:27: sparse:
 sparse: symbol 'bpf_mem_cgroup_events' was not declared. Should it be
 static?
Message-ID: <202505071404.PYtfv39h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.rfc
head:   9ee4288eb5bbd512b7272f1e3a1ac8f96f4fd1ba
commit: 5e0c6efa7c871bec767673a4ae167b61d5204d02 [6/13] mm: introduce bpf kfuncs to deal with memcg pointers
config: m68k-randconfig-r121-20250429 (https://download.01.org/0day-ci/archive/20250507/202505071404.PYtfv39h-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250507/202505071404.PYtfv39h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505071404.PYtfv39h-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/bpf_memcontrol.c:45:27: sparse: sparse: symbol 'bpf_mem_cgroup_events' was not declared. Should it be static?
>> mm/bpf_memcontrol.c:67:18: sparse: sparse: symbol 'bpf_mem_cgroup_flush_stats' was not declared. Should it be static?
   mm/bpf_memcontrol.c:37:9: sparse: sparse: context imbalance in 'bpf_get_mem_cgroup' - different lock contexts for basic block

vim +/bpf_mem_cgroup_events +45 mm/bpf_memcontrol.c

    44	
  > 45	__bpf_kfunc unsigned long bpf_mem_cgroup_events(struct mem_cgroup *memcg, int event)
    46	{
    47	
    48		if (event < 0 || event >= NR_VM_EVENT_ITEMS)
    49			return (unsigned long)-1;
    50	
    51		return memcg_events(memcg, event);
    52	}
    53	
    54	__bpf_kfunc unsigned long bpf_mem_cgroup_usage(struct mem_cgroup *memcg, bool swap)
    55	{
    56		return mem_cgroup_usage(memcg, swap);
    57	}
    58	
    59	__bpf_kfunc unsigned long bpf_mem_cgroup_page_state(struct mem_cgroup *memcg, int idx)
    60	{
    61		if (idx < 0 || idx >= MEMCG_NR_STAT)
    62			return (unsigned long)-1;
    63	
    64		return memcg_page_state(memcg, idx);
    65	}
    66	
  > 67	__bpf_kfunc void bpf_mem_cgroup_flush_stats(struct mem_cgroup *memcg)
    68	{
    69		mem_cgroup_flush_stats(memcg);
    70	}
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
