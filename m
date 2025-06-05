Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323712114
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 09:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749116010; cv=none; b=Fc4+dcEqKeq4PrgO/AQi0aJ+q236rDxjnhS4tvRVTjeMBqv9f0hfaJh53tIEIyjR2wiMjAvEC2F+Z0Caj+ib/FAAUkhxnMEnSKSnVWOEo+SQ2poSeDf9w3GVSC8Rifpnc8Z92XM4W7t3FpBeQeOWFFb/zFjik42o2c2pBX6V+CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749116010; c=relaxed/simple;
	bh=pq0/4oGjVaXlQuzXA1LrhkV6m5Wcgc2Vab8bGpMYGW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=azl/FEtUW3ui7MWHK/8wAnjwyTcetVqcYMijbpk1imXW07A5bswkABpeJKTLz6XP9Gmr781m5P9uQKVpBxsfacqkYgJDHvOgdQJhw1cREX+VGlZn5zjDdnBCyqXkdFy+Ez4Kq5nniOnWiP+KEHSMNtl+0xX/oejoTKiUnEYTzrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PyiTdAln; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PyiTdAln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749116009; x=1780652009;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pq0/4oGjVaXlQuzXA1LrhkV6m5Wcgc2Vab8bGpMYGW8=;
  b=PyiTdAlndYt4U1jmPhOrVPpJv1rCUIS0DHVUlkrNukTAjes4HGwzwXyH
   xctgfvlnPxvquLkM98tu6XKAYhcfUNzPdM74Ml6zd39lD0h71ajMPoci7
   7xFY+QeMbsKrU1VTGq+q2/S5p2hMrtDuX7UDabIPWR45oNsxI9KH/2ths
   7UcAKsSyEVM10koDCNwua/zTQME7re0oSfpk2wcq+ulGklMPXt2s1Bw5O
   6+x/Gj8F/2X7kxk9hvkgHWl1mRNlRZeo5/1ajJGK+J/TMJc7EIDkNG8UE
   IjPfrXGEAhaR+rOYMtGqZ2W7mdZWq776P5tGKMxmXqe01CsVhHFVqJurF
   Q==;
X-CSE-ConnectionGUID: 6cqT9dhoRRSK9vTIsHfbSQ==
X-CSE-MsgGUID: 7eEVfawxSLieKZrJ5N/4mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="54889565"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="54889565"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 02:33:28 -0700
X-CSE-ConnectionGUID: jnNf57kmQJy9LZF7bRDs2g==
X-CSE-MsgGUID: gl8q7jIERWGYrzhzC7hWJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="146048020"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 05 Jun 2025 02:33:26 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN6yS-0003xb-1c;
	Thu, 05 Jun 2025 09:33:24 +0000
Date: Thu, 5 Jun 2025 17:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.2 5/17] mm/bpf_memcontrol.c:45:27: sparse:
 sparse: symbol 'bpf_mem_cgroup_events' was not declared. Should it be
 static?
Message-ID: <202506051752.uj7dbLuJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.2
head:   e3a569772f1fbe667574cb12da7cf500a0c91475
commit: 91f1156004c1e4ba4636fb952d8c076579962d05 [5/17] mm: introduce bpf kfuncs to deal with memcg pointers
config: hexagon-randconfig-r133-20250605 (https://download.01.org/0day-ci/archive/20250605/202506051752.uj7dbLuJ-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250605/202506051752.uj7dbLuJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051752.uj7dbLuJ-lkp@intel.com/

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
