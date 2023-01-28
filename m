Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2979D5CBA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jan 2023 16:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674922963; x=1706458963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pSQx8VK/IlIygW6uMVw13xahMd+8i+Z0EYtQ3T+050E=;
  b=FhOJyPEK1lje18n4G+9Q7cNJFqcSo0nlPwmRxqewHubPyzRkA95cz2Np
   GmjR5fI1VVDWvJATYn7dwb5am2myWZyq1Jxi3y3dXw6+jR6zDF/MruiWa
   glIo7r5ujEi0FYh6HuRaP1o91L9snW3bZPBCoB3RIei6DUuKYQ2rgrwtU
   TNIxfznYB3Egr/Fq23G0OTjXJiIPzwVKGaQzgRWIMDnto1RG4cV6sBCf9
   WibDd2fnNN8ulQ4YLXEBPSOjA+hUb/RmKFmhR27FtoVMWeCpwFuYC5pqC
   +VBGPP+LMZuSoDRJHGHxEt3rwoxtj6RE9sgte6FT6FyC3f8kDBqSaz/gY
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="325000215"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="325000215"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2023 08:22:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10604"; a="771936482"
X-IronPort-AV: E=Sophos;i="5.97,254,1669104000"; 
   d="scan'208";a="771936482"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2023 08:22:41 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pLnyS-0000td-1V;
	Sat, 28 Jan 2023 16:22:40 +0000
Date: Sun, 29 Jan 2023 00:21:52 +0800
From: kernel test robot <lkp@intel.com>
To: Song Liu <song@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/nommu.c:384:6: error: conflicting types for 'execmem_free'; have
 'void(const void *)'
Message-ID: <202301290036.glTq1nEA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Song-Liu/module-replace-module_layout-with-module_memory/20230128-155809
head:   3d043be5ab6ba8f9103bf6e4fe555f9d094e5b2c
commit: ea859943bf7b6df33f026f0304403ec3b89c99b0 vmalloc: introduce execmem_alloc, execmem_free, and execmem_fill
date:   8 hours ago
config: arm-randconfig-r023-20230123 (https://download.01.org/0day-ci/archive/20230129/202301290036.glTq1nEA-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/ea859943bf7b6df33f026f0304403ec3b89c99b0
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Song-Liu/module-replace-module_layout-with-module_memory/20230128-155809
        git checkout ea859943bf7b6df33f026f0304403ec3b89c99b0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> mm/nommu.c:384:6: error: conflicting types for 'execmem_free'; have 'void(const void *)'
     384 | void execmem_free(const void *addr) { }
         |      ^~~~~~~~~~~~
   In file included from include/asm-generic/io.h:994,
                    from arch/arm/include/asm/io.h:416,
                    from include/linux/io.h:13,
                    from include/linux/irq.h:20,
                    from include/asm-generic/hardirq.h:17,
                    from arch/arm/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from mm/nommu.c:23:
   include/linux/vmalloc.h:159:6: note: previous declaration of 'execmem_free' with type 'void(void *)'
     159 | void execmem_free(void *addr);
         |      ^~~~~~~~~~~~


vim +384 mm/nommu.c

   383	
 > 384	void execmem_free(const void *addr) { }
   385	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
