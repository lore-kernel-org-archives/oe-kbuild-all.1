Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26C533FA
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Feb 2023 19:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675278359; x=1706814359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Tle4w4XMdpsuZCbR0F2L2JqBFOyjkYkQHOxK3l8UIkY=;
  b=eMTt73r2nhCruZcqy3+dgH5Q5hJgJjrCkFvX8yQXowM/590a3m9r5jZr
   tX2hnAHLSBULHTAnL3NF+MA9jsSmEaafvuHZ44AK8Duh+RfJxfn03dBZs
   xTrUnNy4xup/45vvvuKkBVBpfzk70/RbV7+wZ2r7dE7FcyhnzdqROwC9p
   2o/xDCGs5W5PPEb0r7X8+QJ0HpayKc69YDXZlyU9c8o7+ncpnvrlzZDJu
   JgQK7Ozm+itoMLkcpwpC9SXtuyhymnT7+R7i/PFMSliWqCNiKO9D/prkA
   WG4mrfpjpuSqSZCP7RqNaH9C19YAPSNoKFhrCviU6pxpV713jdad1oZsq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="311889158"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="311889158"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 11:05:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="658433151"
X-IronPort-AV: E=Sophos;i="5.97,265,1669104000"; 
   d="scan'208";a="658433151"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 01 Feb 2023 11:05:45 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pNIQS-0005iu-2t;
	Wed, 01 Feb 2023 19:05:44 +0000
Date: Thu, 2 Feb 2023 03:04:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3 19/25]
 s390-linux-ld:arch/s390/kernel/vdso64/vdso64.lds:262: syntax error
Message-ID: <202302020324.dSlAYQgL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3
head:   ac3cfb78163256f2febd47ebd017d9f5b75820dd
commit: 45f0ce510abec7dd6a9e15aa18a2b5fb93242539 [19/25] s390/mm: Make virt_to_pfn() a static inline
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20230202/202302020324.dSlAYQgL-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=45f0ce510abec7dd6a9e15aa18a2b5fb93242539
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3
        git checkout 45f0ce510abec7dd6a9e15aa18a2b5fb93242539
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
>> s390-linux-ld:arch/s390/kernel/vdso64/vdso64.lds:262: syntax error
   make[2]: *** [arch/s390/kernel/vdso64/Makefile:50: arch/s390/kernel/vdso64/vdso64.so.dbg] Error 1
   make[2]: Target 'include/generated/vdso64-offsets.h' not remade because of errors.
   make[1]: *** [arch/s390/Makefile:159: vdso_prepare] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:242: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
