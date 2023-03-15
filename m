Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3670567F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Mar 2023 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678900806; x=1710436806;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FjG1VJmwLC4T7SafxT0CJu7sz8r3uPAEOEeI6/KSXGE=;
  b=HxkeEGz2fsOrfDRet6VlEcZ+en+IsVFm9Y8JbT5dT2Pmj6lj4wzFGCIQ
   YFoLZVURCyD3eWsVc+/2XjOlY2OC+gxYxpwzgD2yg4PcYuZVRHOSxsC4k
   PsY0pCyDVLRRpqeq8sr5YeiUELOzJAeNSayMYIv30J55Qh9Qx0kz4YRcs
   mYuQ0U3k/osvDeinnk04f8jYbKev8y5ckiim4CFHIsKyyPQHrQht3shOu
   xXUlGO/UG0zrluJUpT5V1hkAlgE4FawN2WhYwT25ZR5vO96Zvfqjeo47p
   6Qs9U9lA6w7+wi0QFL1BUaXiiR80cl3OTCR9uKluWTsiN50lWHRK+iGcr
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="424042580"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="424042580"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 10:20:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="1008902638"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; 
   d="scan'208";a="1008902638"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Mar 2023 10:20:05 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pcUn9-0007un-2p;
	Wed, 15 Mar 2023 17:19:59 +0000
Date: Thu, 16 Mar 2023 01:19:16 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH V4] LoongArch: Provide kernel fpu functions
Message-ID: <202303160108.iAaHnyBO-lkp@intel.com>
References: <20230310025136.964745-1-chenhuacai@loongson.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310025136.964745-1-chenhuacai@loongson.cn>

Hi Huacai,

I love your patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.3-rc2]
[cannot apply to soc/for-next next-20230315]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Huacai-Chen/LoongArch-Provide-kernel-fpu-functions/20230310-105230
patch link:    https://lore.kernel.org/r/20230310025136.964745-1-chenhuacai%40loongson.cn
patch subject: [PATCH V4] LoongArch: Provide kernel fpu functions
config: loongarch-randconfig-s033-20230312 (https://download.01.org/0day-ci/archive/20230316/202303160108.iAaHnyBO-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/583c7f4c320e4d597d727e41d2e8c51169461e06
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Huacai-Chen/LoongArch-Provide-kernel-fpu-functions/20230310-105230
        git checkout 583c7f4c320e4d597d727e41d2e8c51169461e06
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash arch/loongarch/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303160108.iAaHnyBO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/loongarch/kernel/kfpu.c:17:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:17:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:17:9: sparse:     got bool [noderef] __percpu *
>> arch/loongarch/kernel/kfpu.c:17:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:17:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:17:9: sparse:     got bool [noderef] __percpu *
>> arch/loongarch/kernel/kfpu.c:17:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:17:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:17:9: sparse:     got bool [noderef] __percpu *
>> arch/loongarch/kernel/kfpu.c:17:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:17:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:17:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:19:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:19:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:19:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:19:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:19:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:19:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:19:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:19:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:19:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:19:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:19:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:19:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:32:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:32:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:32:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:32:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:32:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:32:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:32:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:32:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:32:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:32:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:32:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:32:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:39:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:39:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:39:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:39:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:39:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:39:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:39:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:39:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:39:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c:39:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *ptr @@     got bool [noderef] __percpu * @@
   arch/loongarch/kernel/kfpu.c:39:9: sparse:     expected void *ptr
   arch/loongarch/kernel/kfpu.c:39:9: sparse:     got bool [noderef] __percpu *
   arch/loongarch/kernel/kfpu.c: note: in included file (through arch/loongarch/include/asm/cpu-info.h, arch/loongarch/include/asm/processor.h, ...):
   arch/loongarch/include/asm/loongarch.h:211:16: sparse: sparse: undefined identifier '__builtin_loongarch_csrrd_w'
   arch/loongarch/include/asm/loongarch.h:211:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:221:9: sparse: sparse: undefined identifier '__builtin_loongarch_csrwr_w'
   arch/loongarch/include/asm/loongarch.h:221:9: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:211:16: sparse: sparse: cast from unknown type
   arch/loongarch/include/asm/loongarch.h:221:9: sparse: sparse: cast from unknown type

vim +17 arch/loongarch/kernel/kfpu.c

    12	
    13	void kernel_fpu_begin(void)
    14	{
    15		preempt_disable();
    16	
  > 17		WARN_ON(this_cpu_read(in_kernel_fpu));
    18	
    19		this_cpu_write(in_kernel_fpu, true);
    20	
    21		if (!is_fpu_owner())
    22			enable_fpu();
    23		else
    24			_save_fp(&current->thread.fpu);
    25	
    26		write_fcsr(LOONGARCH_FCSR0, 0);
    27	}
    28	EXPORT_SYMBOL_GPL(kernel_fpu_begin);
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
