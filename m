Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 396501C2D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Jan 2023 13:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674478989; x=1706014989;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XqzrOacn9vKBFseeoCLFZ6qMxDiDAhlgCPXLHxBywGM=;
  b=MWDwxajA1aCIBsKNOwna1ealsQsyI39FfSxZ40gvPyczI9dKJ+qJF8cs
   47gyQVRB29CIIxJBOPmYcCjS5B5brJtkyFu8nixi4GnUlpgdvYcLoZahe
   UHrvt/0dV/SrbiLv8Ui37eYyxdVxt+5VRTvHUGyYKkEIMK9mmE1V1VRi8
   F4KFMd5k9t4hLjfdt4vMl1Tpj6Og5Iv2MswoXtoK1R79vWywlV3MGeLGo
   1D+kTZZTE6xuaqDt922JRhJN5D/onV5ZzUz8dwlmpBtR5no7hrmareVME
   LFpgqnXIsz25XAhsrwsRDdwIZDra8YY3YNjsT6TZtB41ekO3ls4JBdz1k
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="326068154"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="326068154"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2023 05:03:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="725027135"
X-IronPort-AV: E=Sophos;i="5.97,239,1669104000"; 
   d="scan'208";a="725027135"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 23 Jan 2023 05:03:07 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJwTa-0005eK-1z;
	Mon, 23 Jan 2023 13:03:06 +0000
Date: Mon, 23 Jan 2023 21:02:46 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: arch/csky/include/asm/page.h:6:10: fatal error: asm/setup.h: No such
 file or directory
Message-ID: <202301232142.LujwaLQ8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230123-181826
head:   569c0e5183ad71e231b95cb03d3ac25ba572b6db
commit: cfe06b3c018bf5b2147e2acdb4bc6791eb5c0546 asm-generic: Remove COMMAND_LINE_SIZE from uapi
date:   3 hours ago
config: csky-randconfig-r011-20230123 (https://download.01.org/0day-ci/archive/20230123/202301232142.LujwaLQ8-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/cfe06b3c018bf5b2147e2acdb4bc6791eb5c0546
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Alexandre-Ghiti/riscv-Split-early-and-final-KASAN-population-functions/20230123-181826
        git checkout cfe06b3c018bf5b2147e2acdb4bc6791eb5c0546
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=csky prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/csky/include/asm/thread_info.h:9,
                    from include/linux/thread_info.h:60,
                    from include/asm-generic/current.h:5,
                    from ./arch/csky/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from arch/csky/kernel/asm-offsets.c:4:
>> arch/csky/include/asm/page.h:6:10: fatal error: asm/setup.h: No such file or directory
       6 | #include <asm/setup.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.
   make[2]: *** [scripts/Makefile.build:114: arch/csky/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1298: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +6 arch/csky/include/asm/page.h

013de2d6671d89 Guo Ren 2018-09-05  5  
013de2d6671d89 Guo Ren 2018-09-05 @6  #include <asm/setup.h>
013de2d6671d89 Guo Ren 2018-09-05  7  #include <asm/cache.h>
013de2d6671d89 Guo Ren 2018-09-05  8  #include <linux/const.h>
013de2d6671d89 Guo Ren 2018-09-05  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
