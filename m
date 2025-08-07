Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A39317E0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Aug 2025 04:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754541961; cv=none; b=cg5ceLd6BCHYQz/dYQwpYtYGtEx6yIg23i7iV2DUsV3VuqFwv+6yzHKqxCwYtJn9et6+05i/ZOcQ9C60SEUE8xksI5N7lfOaUREbBUug+jkuZK6oXEU8yA+cF/r8RsYOhFQCS8N/W2UzXumlbUmbtakU5LOHjAWmfAso8GM0qRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754541961; c=relaxed/simple;
	bh=3XdN9eq00u4YAGvcnxlihwI8peVE2FwjnlbaYYcTb2E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BnyCbnM/EQW+T/nNyUuMZTm3U8NK85GlZKcqybRETjrAPloB1I1Yr8b7Yd7g8bqpuaWrCPownHSJvv6YlFxGT/cjMNtHwUR35XWCPdgFgV/QQHF2+shCXTk5S+eD7TMBLk7k5V4Vn0rQPMiLRcrWKIm1GiPNXrR9+0kWUlQHQyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BPpjCckI; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BPpjCckI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754541959; x=1786077959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3XdN9eq00u4YAGvcnxlihwI8peVE2FwjnlbaYYcTb2E=;
  b=BPpjCckIyePdq2Y7Q/+Rukg/ye1EzxQwsk5WcElcWUHZdjzbkh51KJc4
   k7pwH5Gulm1v3pq8Wu0tcPzMbM2MWDHtWIHchUeJ/VQ8N6U+ko1lGQelF
   03KquGnXOYv4Fm2mFnZip878C5+h0DdfjRkQNlDyYIK5s3ImZJDJw8iw3
   97i5VAMHCA9XijRlQ1OD0NhOfvHBoNtRJU3l4m8AmqkVOhErUZEJnoyyg
   jpnvk4htomZTQyHT2d4w73XdQjTxTo2r9VlOj4vgDwy+cndl1aj9XR/v4
   vIWRlWf78DBgPrwpoFbcAdR0CdT9xyCtbq7/Y2Q9Qf4l8g9XH8DSbHDMi
   w==;
X-CSE-ConnectionGUID: KkDFoMhNSj69t6isgBmIMg==
X-CSE-MsgGUID: MRa8m56qSTyvQeVMt7fFIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11514"; a="68243793"
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="68243793"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 21:45:59 -0700
X-CSE-ConnectionGUID: VkZdS/h0Rd+rabUjcIMTQg==
X-CSE-MsgGUID: P1ObzgNaSFSSY8yY/y70RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,271,1747724400"; 
   d="scan'208";a="165308361"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 06 Aug 2025 21:45:58 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujsVn-0002NU-23;
	Thu, 07 Aug 2025 04:45:55 +0000
Date: Thu, 7 Aug 2025 12:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:bpfoom.1.5 16/17] kernel/sched/bpf_psi.c:173:10: error:
 incompatible integer to pointer conversion assigning to 'struct cgroup *'
 from 'int'
Message-ID: <202508071258.e0dHl6m6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git bpfoom.1.5
head:   56067bc9ae98ae8d75fbb2506874ef96ee0396e5
commit: b5af0b785216064240ec354266754b2a902e003a [16/17] sched: psi: implement bpf_psi_create_trigger() kfunc
config: x86_64-buildonly-randconfig-004-20250807 (https://download.01.org/0day-ci/archive/20250807/202508071258.e0dHl6m6-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250807/202508071258.e0dHl6m6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508071258.e0dHl6m6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/bpf_psi.c:84:34: error: incomplete definition of type 'struct cgroup'
      84 |         struct psi_group *group = cgroup->psi;
         |                                   ~~~~~~^
   include/linux/sched/task.h:44:9: note: forward declaration of 'struct cgroup'
      44 |         struct cgroup *cgrp;
         |                ^
   In file included from kernel/sched/build_utility.c:97:
   kernel/sched/bpf_psi.c:173:12: error: call to undeclared function 'cgroup_get_from_id'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     173 |                 cgroup = cgroup_get_from_id(cgroup_id);
         |                          ^
   kernel/sched/bpf_psi.c:173:12: note: did you mean 'cgroup_id_from_mm'?
   include/linux/memcontrol.h:1473:19: note: 'cgroup_id_from_mm' declared here
    1473 | static inline u64 cgroup_id_from_mm(struct mm_struct *mm)
         |                   ^
   In file included from kernel/sched/build_utility.c:97:
>> kernel/sched/bpf_psi.c:173:10: error: incompatible integer to pointer conversion assigning to 'struct cgroup *' from 'int' [-Wint-conversion]
     173 |                 cgroup = cgroup_get_from_id(cgroup_id);
         |                        ^ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/sched/bpf_psi.c:177:11: error: call to undeclared function 'cgroup_psi'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     177 |                 group = cgroup_psi(cgroup);
         |                         ^
>> kernel/sched/bpf_psi.c:177:9: error: incompatible integer to pointer conversion assigning to 'struct psi_group *' from 'int' [-Wint-conversion]
     177 |                 group = cgroup_psi(cgroup);
         |                       ^ ~~~~~~~~~~~~~~~~~~
   kernel/sched/bpf_psi.c:197:3: error: call to undeclared function 'cgroup_put'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     197 |                 cgroup_put(cgroup);
         |                 ^
   6 errors generated.


vim +173 kernel/sched/bpf_psi.c

   156	
   157	__bpf_kfunc int bpf_psi_create_trigger(struct bpf_psi *bpf_psi,
   158					       u64 cgroup_id, u32 resource,
   159					       u32 threshold_us, u32 window_us)
   160	{
   161		enum psi_res res = resource & ~BPF_PSI_FULL;
   162		bool full = resource & BPF_PSI_FULL;
   163		struct psi_trigger_params params;
   164		struct cgroup *cgroup = NULL;
   165		struct psi_group *group;
   166		struct psi_trigger *t;
   167		int ret = 0;
   168	
   169		if (res >= NR_PSI_RESOURCES)
   170			return -EINVAL;
   171	
   172		if (cgroup_id) {
 > 173			cgroup = cgroup_get_from_id(cgroup_id);
   174			if (IS_ERR_OR_NULL(cgroup))
   175				return PTR_ERR(cgroup);
   176	
 > 177			group = cgroup_psi(cgroup);
   178		} else {
   179			group = &psi_system;
   180		}
   181	
   182		params.type = PSI_BPF;
   183		params.bpf_psi = bpf_psi;
   184		params.privileged = capable(CAP_SYS_RESOURCE);
   185		params.res = res;
   186		params.full = full;
   187		params.threshold_us = threshold_us;
   188		params.window_us = window_us;
   189	
   190		t = psi_trigger_create(group, &params);
   191		if (IS_ERR_OR_NULL(t))
   192			ret = PTR_ERR(t);
   193		else
   194			t->cgroup_id = cgroup_id;
   195	
   196		if (cgroup)
   197			cgroup_put(cgroup);
   198	
   199		return ret;
   200	}
   201	__bpf_kfunc_end_defs();
   202	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
