Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B4DF14BF97
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 May 2024 12:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715257925; cv=none; b=gasbkffSP6LeZRPoAQsxdIhi4XmJepkwiIt96XIHc2qxBEq146l5XOYHjuKiUSQ6ezSMVmIBuso11YzlyFEXNq98gHy9JyDFczzXMZAOFNzuri7K49TBTMhWB2bTxTRRH81EZmjI4effGBflta2a/59MA1QvA06ggnqNqTjqkJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715257925; c=relaxed/simple;
	bh=oAzblVWppGT0yL9EQIMl1/4aHbTCjs0+JviLjtZ3LlA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nlz+taKcCRBHlQ1pC/M/z6W6jfTw+Jl00FfyJhkX9PA6ONEDyqdWgyzjYoX335lVGqsGUMuGH9gesmoFso5aucGK0Gr9zOzvgL+Q+MunTaBd1DA7zWyeyVjBZFCmNAkUEjER2WSKWUtTXx4C3qhYAuhcklLiNhmBJpyXFzKTAR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LFlteuJq; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LFlteuJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715257921; x=1746793921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oAzblVWppGT0yL9EQIMl1/4aHbTCjs0+JviLjtZ3LlA=;
  b=LFlteuJqjPbZlV8GC/tDU8C3A3Hb3P/8zVa/i0i0R41/b/hJePgYKOHe
   u/2kqCfeFsLZqrS/hOAPf+I+2cN6tmBaOTJaJjpkba5dTUTLViwX6NOtv
   afTxw46RfvIyySBKB41M6Ssz3wTEVaM1Z6M76rrm/UIrP/O0aoq/x86gQ
   jGOp39XGw1lhrKpI3NOl5ap3dOJhv4/2YLCpqAqwt2xdFVeHMZO4O3pOf
   u8uOzFASZuBTbtMYz02Uk8XpzsrOyQToTcAH7SmRd+7Kj0VxDshM6l7J7
   iPsEx21k1ZqIndVr3FUWXjezDisBnuPUNGcRooZpUJ5aH/z8uVUcxGQlg
   w==;
X-CSE-ConnectionGUID: sj60BV17Sg6C/Oq9Wy3D7w==
X-CSE-MsgGUID: LBkCl0+PQM+Ufi95wsIx8A==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="11446713"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="11446713"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2024 05:32:01 -0700
X-CSE-ConnectionGUID: I4+uEvgyQDSYE9cQM2AbHQ==
X-CSE-MsgGUID: y+GSNcROR4GGtx6sf8OriQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; 
   d="scan'208";a="33768190"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 May 2024 05:31:58 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s52wH-0004tk-2l;
	Thu, 09 May 2024 12:31:57 +0000
Date: Thu, 9 May 2024 20:31:53 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 6/9] mm/memcontrol-v1.c:1475:6: warning:
 no previous prototype for function 'mem_cgroup_oom_notify'
Message-ID: <202405092043.moQOpmtC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1
head:   4e1c777d2317dbb58d002c700e3c7b09bb4364ae
commit: bd76bb4b8e7feecffcbf151dc6a6809d4126efcf [6/9] mm: memcg: move cgroup v1 oom handling code into memcontrol-v1.c
config: riscv-defconfig (https://download.01.org/0day-ci/archive/20240509/202405092043.moQOpmtC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project b910bebc300dafb30569cecc3017b446ea8eafa0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240509/202405092043.moQOpmtC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405092043.moQOpmtC-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/memcontrol-v1.c:3:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:26:
   In file included from include/linux/kernel_stat.h:9:
   In file included from include/linux/interrupt.h:21:
   In file included from arch/riscv/include/asm/sections.h:9:
   In file included from include/linux/mm.h:2253:
   include/linux/vmstat.h:514:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     514 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/memcontrol-v1.c:10:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/memcontrol-v1.c:1475:6: warning: no previous prototype for function 'mem_cgroup_oom_notify' [-Wmissing-prototypes]
    1475 | void mem_cgroup_oom_notify(struct mem_cgroup *memcg)
         |      ^
   mm/memcontrol-v1.c:1475:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1475 | void mem_cgroup_oom_notify(struct mem_cgroup *memcg)
         | ^
         | static 
   4 warnings generated.


vim +/mem_cgroup_oom_notify +1475 mm/memcontrol-v1.c

d93eaf0623ab87 Roman Gushchin 2024-05-06  1474  
d93eaf0623ab87 Roman Gushchin 2024-05-06 @1475  void mem_cgroup_oom_notify(struct mem_cgroup *memcg)
d93eaf0623ab87 Roman Gushchin 2024-05-06  1476  {
d93eaf0623ab87 Roman Gushchin 2024-05-06  1477  	struct mem_cgroup *iter;
d93eaf0623ab87 Roman Gushchin 2024-05-06  1478  
d93eaf0623ab87 Roman Gushchin 2024-05-06  1479  	for_each_mem_cgroup_tree(iter, memcg)
d93eaf0623ab87 Roman Gushchin 2024-05-06  1480  		mem_cgroup_oom_notify_cb(iter);
d93eaf0623ab87 Roman Gushchin 2024-05-06  1481  }
d93eaf0623ab87 Roman Gushchin 2024-05-06  1482  

:::::: The code at line 1475 was first introduced by commit
:::::: d93eaf0623ab87511b49667b28956a4c33bc45f6 mm: memcg: move legacy memcg event code into memcontrol-v1.c

:::::: TO: Roman Gushchin <roman.gushchin@linux.dev>
:::::: CC: Roman Gushchin <roman.gushchin@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
