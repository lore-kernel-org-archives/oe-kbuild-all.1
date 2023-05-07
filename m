Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E6E15BE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 May 2023 04:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683433649; x=1714969649;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=07n/FTDlsR0C8qmH1UCBtHK5yAANVzuxSZU23nCWTsU=;
  b=jHdPOt3o69LC/4AtpUdsyovNFlCwOMVnkVf6o4HZoo/Xqo3mswHdjwK1
   hHrEqkj1P2nV2FSaV1EQpsQrN5t8Vs5K0B4nOVfH3gLoHEpPON5F84RLi
   8a30qHPMHSMCxfHqNqCnM1dizP6deYTupY5eNeE7w1VBawKpUG3w0HDXi
   K5YGrtvKt+ZIVJitvEiZ34YHA12bMvzpk98LU851JSNqrGGmuUzW5X1Cy
   w394ZbGHFU4pcUu6cdqBzJrPeyFxqBqoABM9HBLN9k/QRPt6Hh1COWBa9
   yG3yhWehygUO+q4TRihiu4sJe8Lgv5gT7z2s7V7rw1BEzZ66UZW/YF6GD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="415001981"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="415001981"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 21:27:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="648446637"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="648446637"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 May 2023 21:27:27 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvVzb-0000bZ-0L;
	Sun, 07 May 2023 04:27:27 +0000
Date: Sun, 7 May 2023 12:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/loongarch/kernel/kfpu.c:17:9: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202305071214.H6XgYvVI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc4354c6e5c21257cf4a50b32f7c11c7d65c55b3
commit: 2b3bd32ea3a22ea2d5e591da4ac2c2b1fb17c0e0 LoongArch: Provide kernel fpu functions
date:   6 days ago
config: loongarch-randconfig-s043-20230507 (https://download.01.org/0day-ci/archive/20230507/202305071214.H6XgYvVI-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2b3bd32ea3a22ea2d5e591da4ac2c2b1fb17c0e0
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 2b3bd32ea3a22ea2d5e591da4ac2c2b1fb17c0e0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=loongarch SHELL=/bin/bash arch/loongarch/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305071214.H6XgYvVI-lkp@intel.com/

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
