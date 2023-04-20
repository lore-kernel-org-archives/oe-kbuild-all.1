Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBF3317ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Apr 2023 03:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681959994; x=1713495994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oPFxqdCIsSAToafpSrqMZOefD3ed+RHQ+C2UajMpmho=;
  b=NUp8dDaat075ywB7TZmFvk/o+o7FMdkIXtgO5LD2F5JTXYjT0dcAA2P1
   Kz7uCfu1xbjau3dBBK19ZpAPXK1jZxh2gnHaEYFkvE5UzwiK1gT9fASS9
   LiJ5lJm/HRNhYQGV7Bzf7vCsea+jC1BwpjjM7LQ3XbiRmFlD7P3o3pa0l
   O7gZ412/RZ0DIn+IV/QflBJEX5sNQuKC6Krg0o+1kNhZ6nRUImNqZcIiH
   cEDKDg/nmjYMmybgCG4QvXLu+mGsW+jXgsEZUN/T1Awa2gWnLHttIFP5o
   vv1vYnQSQE8nN921b1FNd6TGUVFD+NLsnUtTZ4OWynxPhmjnLWn/O0WFJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="431896668"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="431896668"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2023 20:06:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="760978835"
X-IronPort-AV: E=Sophos;i="5.99,211,1677571200"; 
   d="scan'208";a="760978835"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 19 Apr 2023 20:06:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppKcf-000fPS-04;
	Thu, 20 Apr 2023 03:06:13 +0000
Date: Thu, 20 Apr 2023 11:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 8/8] mm/page_alloc.c:6789:16: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202304201116.HlmJMCfv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   91fdd255931e43c5dfca21aadad7371f9c8b1f79
commit: 42596c7b41c85be2647f23da66cda4b0a0c242e1 [8/8] ANDROID: fix ABI breakage caused by per_cpu_pages
config: i386-randconfig-s001-20230417 (https://download.01.org/0day-ci/archive/20230420/202304201116.HlmJMCfv-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android13-5.10
        git checkout 42596c7b41c85be2647f23da66cda4b0a0c242e1
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304201116.HlmJMCfv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_alloc.c:6789:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct per_cpu_pageset_ext *ps_ext @@     got struct per_cpu_pageset_ext [noderef] __percpu * @@
   mm/page_alloc.c:6789:16: sparse:     expected struct per_cpu_pageset_ext *ps_ext
   mm/page_alloc.c:6789:16: sparse:     got struct per_cpu_pageset_ext [noderef] __percpu *
>> mm/page_alloc.c:6790:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct per_cpu_pageset [noderef] __percpu *pageset @@     got struct per_cpu_pageset * @@
   mm/page_alloc.c:6790:23: sparse:     expected struct per_cpu_pageset [noderef] __percpu *pageset
   mm/page_alloc.c:6790:23: sparse:     got struct per_cpu_pageset *
   mm/page_alloc.c:3365:28: sparse: sparse: context imbalance in 'free_unref_page_commit' - unexpected unlock
   mm/page_alloc.c:3687:20: sparse: sparse: context imbalance in '__rmqueue_pcplist' - wrong count at exit
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:369:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:369:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:369:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:369:27: sparse: sparse: restricted gfp_t degrades to integer

vim +6789 mm/page_alloc.c

  6783	
  6784	void __meminit setup_zone_pageset(struct zone *zone)
  6785	{
  6786		int cpu;
  6787		struct per_cpu_pageset_ext *ps_ext;
  6788	
> 6789		ps_ext = alloc_percpu(struct per_cpu_pageset_ext);
> 6790		zone->pageset = &ps_ext->pageset;
  6791		for_each_possible_cpu(cpu)
  6792			zone_pageset_init(zone, cpu);
  6793	}
  6794	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
