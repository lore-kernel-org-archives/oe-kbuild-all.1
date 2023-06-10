Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D94D1FAE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 Jun 2023 10:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686391711; x=1717927711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5rzpVgP3NIUlRfXlBXH8y4As6KE/DAcII/SSDH+WQp4=;
  b=ZxiqjzGYDQPOVxZVAzT0nFFwy8QjyGyzOjBQzxBt8/59RPxjcaQSPaU8
   BquzCD/fjHxHJqDB1+iklT24Znu/MAs9RRRdQUVz4uSxA52aFhytdNEut
   +W/n0BKbCSu2yJ/0vwV0XhFXWARGw3+NnGXD1lOIi42+JbyoL+tZZ/Xq3
   GhybLy57AJt3JmzuMrVDcYeE8cp7FqwdEgSCHMsqV8Ycqen68nZGF16Rh
   Yll1lWtPjmOD/82jk1A5N/ARitI4/BE09Y9HKyHNiHU19bm4VWXcoNSZf
   P2EVQWYL9QdFxHfisQJDM73XmZG6rqPyE1JbGSSiStWnFLsxIXFNyv3dV
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="361114468"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="361114468"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2023 03:08:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10736"; a="834906287"
X-IronPort-AV: E=Sophos;i="6.00,232,1681196400"; 
   d="scan'208";a="834906287"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 Jun 2023 03:08:29 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q7vWG-0009zc-1y;
	Sat, 10 Jun 2023 10:08:28 +0000
Date: Sat, 10 Jun 2023 18:08:15 +0800
From: kernel test robot <lkp@intel.com>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm64:devel/kmalloc-minalign 18/18] arch/sh/include/asm/page.h:181:
 warning: "ARCH_DMA_MINALIGN" redefined
Message-ID: <202306101810.JwfW3YwQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git devel/kmalloc-minalign
head:   e5bbe79231baf5cad690c6fc9de3910ad14a2aa6
commit: e5bbe79231baf5cad690c6fc9de3910ad14a2aa6 [18/18] fixup! mm/slab: Decouple ARCH_KMALLOC_MINALIGN from ARCH_DMA_MINALIGN
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20230610/202306101810.JwfW3YwQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/commit/?id=e5bbe79231baf5cad690c6fc9de3910ad14a2aa6
        git remote add arm64 https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
        git fetch --no-tags arm64 devel/kmalloc-minalign
        git checkout e5bbe79231baf5cad690c6fc9de3910ad14a2aa6
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sh olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross W=1 O=build_dir ARCH=sh SHELL=/bin/bash fs/efs/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306101810.JwfW3YwQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mm_types_task.h:16,
                    from include/linux/mm_types.h:5,
                    from include/linux/buildid.h:5,
                    from include/linux/module.h:14,
                    from fs/efs/super.c:11:
>> arch/sh/include/asm/page.h:181: warning: "ARCH_DMA_MINALIGN" redefined
     181 | #define ARCH_DMA_MINALIGN       L1_CACHE_BYTES
         | 
   In file included from include/linux/time.h:5,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13:
   include/linux/cache.h:104: note: this is the location of the previous definition
     104 | #define ARCH_DMA_MINALIGN __alignof__(unsigned long long)
         | 
   In file included from fs/efs/super.c:18:
   fs/efs/efs.h:22:19: warning: 'cprt' defined but not used [-Wunused-const-variable=]
      22 | static const char cprt[] = "EFS: "EFS_VERSION" - (c) 1999 Al Smith <Al.Smith@aeschi.ch.eu.org>";
         |                   ^~~~


vim +/ARCH_DMA_MINALIGN +181 arch/sh/include/asm/page.h

fd4fd5aac12828 include/asm-sh/page.h      Stephen Rothwell 2005-09-03  176  
cbd2d9d8fcd9d2 include/asm-sh/page.h      Paul Mundt       2007-06-04  177  /*
66d485b45a5493 include/asm-sh/page.h      Paul Mundt       2007-11-27  178   * Some drivers need to perform DMA into kmalloc'ed buffers
66d485b45a5493 include/asm-sh/page.h      Paul Mundt       2007-11-27  179   * and so we have to increase the kmalloc minalign for this.
cbd2d9d8fcd9d2 include/asm-sh/page.h      Paul Mundt       2007-06-04  180   */
a6eb9fe105d5de arch/sh/include/asm/page.h FUJITA Tomonori  2010-08-10 @181  #define ARCH_DMA_MINALIGN	L1_CACHE_BYTES
01fed9311ab8a7 include/asm-sh/page.h      Paul Mundt       2007-11-10  182  

:::::: The code at line 181 was first introduced by commit
:::::: a6eb9fe105d5de0053b261148cee56c94b4720ca dma-mapping: rename ARCH_KMALLOC_MINALIGN to ARCH_DMA_MINALIGN

:::::: TO: FUJITA Tomonori <fujita.tomonori@lab.ntt.co.jp>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
