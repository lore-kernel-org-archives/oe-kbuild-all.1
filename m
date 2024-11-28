Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A40B13EFF3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 18:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732818852; cv=none; b=NKQRQiPsd0D7a/mD1oV+xrludcQlPWULE9Y/lgJ9xdIK1/XOyLB5x3WPrlJ6YsRJhl2pq3NQV7wJGgU/V+KFOwz0mGBUKhIqSnz5NP2nmmY/j7o/ZQDCVW7ubiXtKUuGcafrTp2zttVGjYlXQmQ101IaQHPjxD5iEFYch3SWlvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732818852; c=relaxed/simple;
	bh=sNdl54ft9au29jMSuMKcb1J3+JGkdEFrf7In+bCU74U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FcKQdbFsFDIaj8VioCcVxZ35WJkV7xa9HrfA17Zx+rZnPqri1mZwqEEVzhvAwV5lvk3DRNyHjDTvENrf2FfT5ylQtOxN6RLVEsHvEp8uxKk8OeGsURyWN4sN48E4Io6xEUX5Fj18W5ArHMlgKP4fV9GtlT4Sq42srm7ddd/09uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2iRMuqU; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2iRMuqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732818850; x=1764354850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sNdl54ft9au29jMSuMKcb1J3+JGkdEFrf7In+bCU74U=;
  b=C2iRMuqUUHqlH9Uq4D9X7oO4tRGmLR5wiKITwmjz5OowX6eFW3t0B/+m
   oOpu72W3oDsCN2+IFWAm/mMdOhnQq/iw6rYid6v9T8Qaf5SFW5d2uK38g
   rT8NXNrOTOfkLTRGo37nTAHeL1bzNNcR9u9j6q//U6NRKFMQmYMe+RzAV
   xSUrKQgps1UOkaArQyEBPdnKCI6VpOkNHb/FcDe695nuCG6nLNezsy4rO
   t6FS3UKyXUxJW4/RvgEhAiz2lKvRBiWmGeMfMwdWjkYmmfb6XXl+SIiET
   By7ScMeZHYNWbbRqN5I0kjWMYhS5BNKf1pv9CN70P4hfc5XFlY0fViSiE
   Q==;
X-CSE-ConnectionGUID: XTIx0hGDTPCDF/9paDzsLg==
X-CSE-MsgGUID: 8bXkebl/STGla5UM7FAH4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32426583"
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="32426583"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 10:34:07 -0800
X-CSE-ConnectionGUID: ZgIOobRiRauxOtRqJ+LOEg==
X-CSE-MsgGUID: +pHg7rBERYeyxIsq6OgUhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,193,1728975600"; 
   d="scan'208";a="92762717"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Nov 2024 10:34:06 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGjL2-0009uR-1G;
	Thu, 28 Nov 2024 18:34:04 +0000
Date: Fri, 29 Nov 2024 02:33:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540] kernel/sched/bpf_sched.c:187:17:
 warning: no previous prototype for function 'bpf_sched_entity_is_task'
Message-ID: <202411290245.YQeCUdgI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   95bc69473a373c2e578d4fc39734e5811a03ead3
commit: 6f06e093b3708dcee5b7e4f0478e0206bc601da1 [1540/1540] sched/ebpf: Support task selection programmable
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20241129/202411290245.YQeCUdgI-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241129/202411290245.YQeCUdgI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411290245.YQeCUdgI-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:24:
   In file included from include/linux/cpuset.h:17:
   In file included from include/linux/mm.h:2247:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/build_utility.c:113:
>> kernel/sched/bpf_sched.c:187:17: warning: no previous prototype for function 'bpf_sched_entity_is_task' [-Wmissing-prototypes]
     187 | __bpf_kfunc int bpf_sched_entity_is_task(struct sched_entity *se)
         |                 ^
   kernel/sched/bpf_sched.c:187:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     187 | __bpf_kfunc int bpf_sched_entity_is_task(struct sched_entity *se)
         |             ^
         |             static 
>> kernel/sched/bpf_sched.c:195:33: warning: no previous prototype for function 'bpf_sched_entity_to_task' [-Wmissing-prototypes]
     195 | __bpf_kfunc struct task_struct *bpf_sched_entity_to_task(struct sched_entity *se)
         |                                 ^
   kernel/sched/bpf_sched.c:195:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     195 | __bpf_kfunc struct task_struct *bpf_sched_entity_to_task(struct sched_entity *se)
         |             ^
         |             static 
>> kernel/sched/bpf_sched.c:203:18: warning: no previous prototype for function 'bpf_sched_tag_of_entity' [-Wmissing-prototypes]
     203 | __bpf_kfunc long bpf_sched_tag_of_entity(struct sched_entity *se)
         |                  ^
   kernel/sched/bpf_sched.c:203:13: note: declare 'static' if the function is not intended to be used outside of this translation unit
     203 | __bpf_kfunc long bpf_sched_tag_of_entity(struct sched_entity *se)
         |             ^
         |             static 
   8 warnings generated.


vim +/bpf_sched_entity_is_task +187 kernel/sched/bpf_sched.c

   186	
 > 187	__bpf_kfunc int bpf_sched_entity_is_task(struct sched_entity *se)
   188	{
   189		if (!se)
   190			return -EINVAL;
   191	
   192		return entity_is_task(se);
   193	}
   194	
 > 195	__bpf_kfunc struct task_struct *bpf_sched_entity_to_task(struct sched_entity *se)
   196	{
   197		if (se && entity_is_task(se))
   198			return task_of(se);
   199	
   200		return NULL;
   201	}
   202	
 > 203	__bpf_kfunc long bpf_sched_tag_of_entity(struct sched_entity *se)
   204	{
   205		if (!se)
   206			return -EINVAL;
   207	
   208		if (entity_is_task(se))
   209			return task_of(se)->tag;
   210	
   211		return group_cfs_rq(se)->tg->tag;
   212	}
   213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
