Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD9AC6FD7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Apr 2023 21:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682114246; x=1713650246;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JZkCq4caozfjFfJ5r2vyU/sdVvuP5FCTWbJhCXt4tOI=;
  b=MCXVAVQ/zhgqgNyGKuqH4YOda+75z+PIUyW8BPLziZonhYjxVpczkC8H
   Gsb4op8rLYlkEyCKebV/uNjp2hWy0Dpdaa5EpMk5BXAHkPamQGjsaO6Ha
   QYci18V4TEs+1h/0f8TSXWJu3ipe/e0cgXtXcZHuvhT8c3XV/U9Iqg189
   Sya+qoHyTIxIIpJQXT1xUeP+YH58TOu6QW+zr9TmGqUzyF2GjvywaeVP7
   yTjks6W+lj7poWbRR3i5PL/xMHIQ1bYd1VhqnUn5DkH6Ey5MWEdfbXbFl
   ECNTUEXO3XApveIzhdhF07f4K5TLotCP8wb2DC7hiZ/gT7LFVyeLYGfxS
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="346110233"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="346110233"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2023 14:57:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="836306348"
X-IronPort-AV: E=Sophos;i="5.99,216,1677571200"; 
   d="scan'208";a="836306348"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Apr 2023 14:57:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ppyku-000gqW-0h;
	Fri, 21 Apr 2023 21:57:24 +0000
Date: Sat, 22 Apr 2023 05:57:23 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie 1/19] arch/x86/include/asm/processor.h:401:16: error:
 implicit declaration of function 'per_cpu_offset'
Message-ID: <202304220522.ChigZbHH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie
head:   01406d471d3e3718b3771fdabcfca8c505157404
commit: 427d4bb4ab26e69846f693d1ac4618691bc4a1cc [1/19] x86: Use stack protector with guard symbol if supported
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230422/202304220522.ChigZbHH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=427d4bb4ab26e69846f693d1ac4618691bc4a1cc
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb x86-pie
        git checkout 427d4bb4ab26e69846f693d1ac4618691bc4a1cc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304220522.ChigZbHH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/cpufeature.h:5,
                    from arch/x86/include/asm/thread_info.h:53,
                    from include/linux/thread_info.h:60,
                    from arch/x86/include/asm/preempt.h:9,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:56,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:15,
                    from include/linux/crypto.h:20,
                    from arch/x86/kernel/asm-offsets.c:9:
   arch/x86/include/asm/processor.h: In function 'cpu_kernelmode_gs_base':
>> arch/x86/include/asm/processor.h:401:16: error: implicit declaration of function 'per_cpu_offset' [-Werror=implicit-function-declaration]
     401 |         return per_cpu_offset(cpu);
         |                ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/x86/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1286: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/per_cpu_offset +401 arch/x86/include/asm/processor.h

   398	
   399	static inline unsigned long cpu_kernelmode_gs_base(int cpu)
   400	{
 > 401		return per_cpu_offset(cpu);
   402	}
   403	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
