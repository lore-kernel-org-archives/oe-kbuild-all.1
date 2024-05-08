Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6795A11C94
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 May 2024 03:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715139186; cv=none; b=FcVpGYm3Osv32sW7ZCcUhTD9Isc5TL1JxkKoKUvV2zN5ek1FeF4Wbfheimi93tOgP+TDmy4CaqlKSm2koF35JMH0osFgQzGtGDk0VX9FvdohAN7LAMt97CEOqW4UiVrYbMQ9UCcquKHusM0xuezvoQJDrWol5GCKkdgTYXOlkAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715139186; c=relaxed/simple;
	bh=QOKrf2MMhnFJyPo6cySP9Ag6t0aKfyE6rEmd54afenE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FPjerQ39dNZBvsXItsAhh/PUG3HfMNjrC3pSvj9AWYbYawLVoEQgRglZewMia6fEFNnAKhNz5KZ82EHgSt7YATvKbOnfDMWDKyDQSfFx34cC8PKBqZ9S9Se0iI8p0d9SwYdd1Wagi5ImjpAzwgHzsu1dLdvTiSi7F/CBAD1mSqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVkSiADy; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVkSiADy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715139184; x=1746675184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QOKrf2MMhnFJyPo6cySP9Ag6t0aKfyE6rEmd54afenE=;
  b=AVkSiADyJXQOXjnb6yJAmND4+zf1Vjy6lIojDtjieLgZgy1zwkYBc4iu
   8Epwbt2x24lNNNM04t/iGfU7mKV2VBV5OQByzkMvymeuz+vhhFUULmAqT
   3LuZDwCJ9tmJZAg8IXUWfnMMFQ0wM1fWGxdQBfnZKqK7yEd0k8ceDW+J4
   bKJmewZXbx6pbtZTBZ4wuAbscdOOVlIPZzKpHrrL+/lj/L72QNyJKP8dU
   DGG53Ra0TpGmzK/s/UspE7FJfsyDoRYQGjAT8hFIp02mZ0WhApbqb64xO
   AHUkW2rABkHn+dhsTDVp7AnCBav9X7KgbHULZHj/+wB/lebVR/89bTgTz
   A==;
X-CSE-ConnectionGUID: GfrZsnIWQ7Kfje0QzyS4Ng==
X-CSE-MsgGUID: dTfODLzATQOwlmhUxIZnlw==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10815681"
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="10815681"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 20:33:04 -0700
X-CSE-ConnectionGUID: N4LWK6CDTpmDuEm/mJ1E3w==
X-CSE-MsgGUID: +GwG1iuLT7CHn0mV3OKyxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,144,1712646000"; 
   d="scan'208";a="29310308"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2024 20:33:03 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4Y3A-0002vQ-2b;
	Wed, 08 May 2024 03:33:00 +0000
Date: Wed, 8 May 2024 11:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:memcontrol_v1.1 4/5] mm/internal.h:1527:17: error:
 implicit declaration of function 'cgroup_subsys_on_dfl'
Message-ID: <202405081104.FJFLLCna-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git memcontrol_v1.1
head:   9a677688ef8b39a000f682ac9bfb46453fd94685
commit: 8725b3ac18d0ce3a4cba970cfd0d28286a0b182e [4/5] mm: memcg: move legacy memcg event code into memcontrol-v1.c
config: arc-allnoconfig (https://download.01.org/0day-ci/archive/20240508/202405081104.FJFLLCna-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405081104.FJFLLCna-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405081104.FJFLLCna-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:51:
   mm/internal.h: In function 'do_memsw_account':
>> mm/internal.h:1527:17: error: implicit declaration of function 'cgroup_subsys_on_dfl' [-Werror=implicit-function-declaration]
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                 ^~~~~~~~~~~~~~~~~~~~
>> mm/internal.h:1527:38: error: 'memory_cgrp_subsys' undeclared (first use in this function)
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                                      ^~~~~~~~~~~~~~~~~~
   mm/internal.h:1527:38: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors
--
   In file included from mm/page-writeback.c:43:
   mm/internal.h: In function 'do_memsw_account':
>> mm/internal.h:1527:17: error: implicit declaration of function 'cgroup_subsys_on_dfl' [-Werror=implicit-function-declaration]
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                 ^~~~~~~~~~~~~~~~~~~~
>> mm/internal.h:1527:38: error: 'memory_cgrp_subsys' undeclared (first use in this function)
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                                      ^~~~~~~~~~~~~~~~~~
   mm/internal.h:1527:38: note: each undeclared identifier is reported only once for each function it appears in
   mm/page-writeback.c: In function 'cgwb_calc_thresh':
   mm/page-writeback.c:900:39: warning: variable 'gdtc' set but not used [-Wunused-but-set-variable]
     900 |         struct dirty_throttle_control gdtc = { GDTC_INIT_NO_WB };
         |                                       ^~~~
   cc1: some warnings being treated as errors
--
   In file included from mm/slub.c:49:
   mm/internal.h: In function 'do_memsw_account':
>> mm/internal.h:1527:17: error: implicit declaration of function 'cgroup_subsys_on_dfl' [-Werror=implicit-function-declaration]
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                 ^~~~~~~~~~~~~~~~~~~~
>> mm/internal.h:1527:38: error: 'memory_cgrp_subsys' undeclared (first use in this function)
    1527 |         return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
         |                                      ^~~~~~~~~~~~~~~~~~
   mm/internal.h:1527:38: note: each undeclared identifier is reported only once for each function it appears in
   mm/slub.c: In function 'slab_post_alloc_hook':
   mm/slub.c:3831:29: warning: variable 'obj_exts' set but not used [-Wunused-but-set-variable]
    3831 |         struct slabobj_ext *obj_exts;
         |                             ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/cgroup_subsys_on_dfl +1527 mm/internal.h

  1523	
  1524	/* Whether legacy memory+swap accounting is active */
  1525	static inline bool do_memsw_account(void)
  1526	{
> 1527		return !cgroup_subsys_on_dfl(memory_cgrp_subsys);
  1528	}
  1529	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
