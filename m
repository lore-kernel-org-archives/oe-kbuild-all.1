Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F6317FE0
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 May 2023 18:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683656093; x=1715192093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xSTVjbDPYsujDWj3Tjs1GD7DPJu+teClT0Jb1GtV9tw=;
  b=PF5IXYz+bpoAawsqX/xVe9g7XjTausLmOMbSrRA3XdvtUcFyfa9rrqEz
   0nR6/vIm5nd1TfZhO/AAsz8aKy+KRwwDnyij3XKo+aocK4DtI9Xzy5ZYR
   mvHSkV3Wquy+6n2uFtNd0giq+hLXUX0TkKI0auxOTfym6xONvr+OG4DHz
   deliLwoaSEenrebAJ5iAV1gOTuPJ2Zzu9VeUemrv55XsWypxfKWYdEo0x
   ed2aU13UDrId+/f0FqQPcJBSVoLeSdtQiXP+hjAWqouVKoU8ptJpvbUHW
   GffkVeqFHOBw1AiYTOeDFigrgUDhcG3wTQ6FwcQ6nn4/EONZW2wPxvx0O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="334471707"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="334471707"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 11:14:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="768610314"
X-IronPort-AV: E=Sophos;i="5.99,262,1677571200"; 
   d="scan'208";a="768610314"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 May 2023 11:14:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwRrO-0002Lo-3D;
	Tue, 09 May 2023 18:14:51 +0000
Date: Wed, 10 May 2023 02:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor+lkp@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [conor:gpio-irq 3/8] drivers/irqchip/irq-mpfs-mux.c:207:10: error:
 'const struct irq_domain_ops' has no member named 'translate'
Message-ID: <202305100253.DED8LljA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq
head:   6ef4b8fad90b5bae682bd4b88b807f2a38822fe8
commit: f39a859cf7fec51e695de4544786f2b0fb566e75 [3/8] irqchip: add mpfs gpio interrupt mux
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230510/202305100253.DED8LljA-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?id=f39a859cf7fec51e695de4544786f2b0fb566e75
        git remote add conor https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git
        git fetch --no-tags conor gpio-irq
        git checkout f39a859cf7fec51e695de4544786f2b0fb566e75
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305100253.DED8LljA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/irqchip/irq-mpfs-mux.c:10:
   include/linux/bits.h:43:9: warning: conversion from 'long long unsigned int' to 'long unsigned int' changes value from '274877890560' to '4294950912' [-Woverflow]
      43 |         (GENMASK_INPUT_CHECK(h, l) + __GENMASK_ULL(h, l))
         |         ^
   drivers/irqchip/irq-mpfs-mux.c:59:9: note: in expansion of macro 'GENMASK_ULL'
      59 |         GENMASK_ULL(37, 14),
         |         ^~~~~~~~~~~
>> drivers/irqchip/irq-mpfs-mux.c:207:10: error: 'const struct irq_domain_ops' has no member named 'translate'
     207 |         .translate      = mpfs_irq_mux_nondirect_translate,
         |          ^~~~~~~~~
>> drivers/irqchip/irq-mpfs-mux.c:207:27: error: initialization of 'int (*)(struct irq_domain *, unsigned int,  irq_hw_number_t)' {aka 'int (*)(struct irq_domain *, unsigned int,  long unsigned int)'} from incompatible pointer type 'int (*)(struct irq_domain *, struct irq_fwspec *, long unsigned int *, unsigned int *)' [-Werror=incompatible-pointer-types]
     207 |         .translate      = mpfs_irq_mux_nondirect_translate,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-mpfs-mux.c:207:27: note: (near initialization for 'mpfs_irq_mux_nondirect_domain_ops.map')
>> drivers/irqchip/irq-mpfs-mux.c:208:10: error: 'const struct irq_domain_ops' has no member named 'alloc'
     208 |         .alloc          = mpfs_irq_mux_nondirect_alloc,
         |          ^~~~~
>> drivers/irqchip/irq-mpfs-mux.c:208:27: error: initialization of 'void (*)(struct irq_domain *, unsigned int)' from incompatible pointer type 'int (*)(struct irq_domain *, unsigned int,  unsigned int,  void *)' [-Werror=incompatible-pointer-types]
     208 |         .alloc          = mpfs_irq_mux_nondirect_alloc,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-mpfs-mux.c:208:27: note: (near initialization for 'mpfs_irq_mux_nondirect_domain_ops.unmap')
>> drivers/irqchip/irq-mpfs-mux.c:209:10: error: 'const struct irq_domain_ops' has no member named 'free'
     209 |         .free           = irq_domain_free_irqs_top,
         |          ^~~~
>> drivers/irqchip/irq-mpfs-mux.c:209:27: error: 'irq_domain_free_irqs_top' undeclared here (not in a function); did you mean 'irq_domain_free_irqs'?
     209 |         .free           = irq_domain_free_irqs_top,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~
         |                           irq_domain_free_irqs
   drivers/irqchip/irq-mpfs-mux.c:284:10: error: 'const struct irq_domain_ops' has no member named 'translate'
     284 |         .translate      = mpfs_irq_mux_direct_translate,
         |          ^~~~~~~~~
   drivers/irqchip/irq-mpfs-mux.c:284:27: error: initialization of 'int (*)(struct irq_domain *, unsigned int,  irq_hw_number_t)' {aka 'int (*)(struct irq_domain *, unsigned int,  long unsigned int)'} from incompatible pointer type 'int (*)(struct irq_domain *, struct irq_fwspec *, long unsigned int *, unsigned int *)' [-Werror=incompatible-pointer-types]
     284 |         .translate      = mpfs_irq_mux_direct_translate,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-mpfs-mux.c:284:27: note: (near initialization for 'mpfs_irq_mux_direct_domain_ops.map')
   drivers/irqchip/irq-mpfs-mux.c:285:10: error: 'const struct irq_domain_ops' has no member named 'alloc'
     285 |         .alloc          = mpfs_irq_mux_direct_alloc,
         |          ^~~~~
   drivers/irqchip/irq-mpfs-mux.c:285:27: error: initialization of 'void (*)(struct irq_domain *, unsigned int)' from incompatible pointer type 'int (*)(struct irq_domain *, unsigned int,  unsigned int,  void *)' [-Werror=incompatible-pointer-types]
     285 |         .alloc          = mpfs_irq_mux_direct_alloc,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/irqchip/irq-mpfs-mux.c:285:27: note: (near initialization for 'mpfs_irq_mux_direct_domain_ops.unmap')
   drivers/irqchip/irq-mpfs-mux.c:286:10: error: 'const struct irq_domain_ops' has no member named 'free'
     286 |         .free           = irq_domain_free_irqs_top,
         |          ^~~~
   cc1: some warnings being treated as errors


vim +207 drivers/irqchip/irq-mpfs-mux.c

   204	
   205	static const struct irq_domain_ops mpfs_irq_mux_nondirect_domain_ops = {
   206		.select		= mpfs_irq_mux_nondirect_select,
 > 207		.translate	= mpfs_irq_mux_nondirect_translate,
 > 208		.alloc		= mpfs_irq_mux_nondirect_alloc,
 > 209		.free		= irq_domain_free_irqs_top,
   210	};
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
