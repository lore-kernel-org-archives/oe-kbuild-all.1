Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372731863F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Sep 2023 06:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695883122; x=1727419122;
  h=date:from:cc:subject:message-id:mime-version;
  bh=QBFvDU7Ig+CcXOLcMM2a+LuGdipDB6YrNivQat12Zt0=;
  b=Z/ZzCf9Po+TnkgvCDJfWu6TTL6Wa+N+rPDtLqzSbyh40GOHIv6i0NP/o
   yItUGO4YFErgg45MpdfWjAYiRW0cmnLbZ0hdjf+qIrTpgfKd40AbGUk1u
   TRpjke8PHVTfDFxPbHoCQHgKEhZPn645CZw/wdOQm67qg3Zg3ghl24bFf
   Kmxmk492H3uObuIkMeVw19mQtGLsFCzKN7XG+x7PvwjW+dS6MjQNWie0c
   FehiPxsqPKn0G5LvzxpU330WuPRKDn/NAfSL7XyukASZoSXmLSXjL1wrx
   z6aeY9gUZA+sqWqxr/kuu302Wc13ckxmewwq2nFsI2ca4T2j8usPq0gQI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="3551600"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="3551600"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 23:38:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="873182156"
X-IronPort-AV: E=Sophos;i="6.03,183,1694761200"; 
   d="scan'208";a="873182156"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 27 Sep 2023 23:38:40 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlkfW-0001Bt-0I
	for oe-kbuild-all@lists.linux.dev;
	Thu, 28 Sep 2023 06:38:38 +0000
Date: Thu, 28 Sep 2023 14:37:59 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 22448/28233]
 include/linux/dovetail.h:234:10: fatal error: asm/dovetail.h: No such file
 or directory
Message-ID: <202309281456.a0brXkds-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Philippe,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   ec73c4e7ce8bba4e7ebdcd217ef20f768b63b4cc
commit: 03b1e7a382974fcb9316972ef10fad37dac90382 [22448/28233] dovetail: include asm/dovetail.h even if !DOVETAIL
config: arc-randconfig-001-20230928 (https://download.01.org/0day-ci/archive/20230928/202309281456.a0brXkds-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230928/202309281456.a0brXkds-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309281456.a0brXkds-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arc/Makefile:26: ** WARNING ** CONFIG_ARC_TUNE_MCPU flag '' is unknown, fallback to ''
   In file included from include/linux/mm.h:23,
                    from arch/arc/kernel/asm-offsets.c:7:
>> include/linux/dovetail.h:234:10: fatal error: asm/dovetail.h: No such file or directory
     234 | #include <asm/dovetail.h>
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
   make[2]: *** [scripts/Makefile.build:121: arch/arc/kernel/asm-offsets.s] Error 1 shuffle=1933339608
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1253: prepare0] Error 2 shuffle=1933339608
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:219: __sub-make] Error 2 shuffle=1933339608
   make: Target 'prepare' not remade because of errors.


vim +234 include/linux/dovetail.h

   232	
   233	/* We may have arch-specific placeholders. */
 > 234	#include <asm/dovetail.h>
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
