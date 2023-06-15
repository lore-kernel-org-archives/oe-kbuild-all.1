Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BDEA656
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Jun 2023 04:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686804560; x=1718340560;
  h=date:from:cc:subject:message-id:mime-version;
  bh=CuyJEO6iwexue6aSEPRZFzmpGDJeUcvP/1helpu+xUI=;
  b=TR+loyNRyfvCb8FRmHifEMJ+5bshOh/sG1lz+O46qrfCxsiADQsq1HRI
   MkJoQiwO0l4DVqoUL1jCqVWkJ+7mNtb+1oi/2lUYTTzy5UsPN9HSh79Jb
   rxKxnBCJcimNGNAIVWvSx4e8XOCortT29GTV06rxeqGooQK/eh6hvf0nh
   3BQusmTm7IJGeih/M6CcMY4afCw7OtsnDcW5ti+xc2LonR/5ugfMrmqmK
   r6T6aHNBKE5wOHGeF9WFSSLeAiOw4iy+mLwjzaqvIV+G27nbtC8LzkG0g
   mxamdrOP0Y68ZURKTLAE+BUvllOtExrpholmARQufQr2LBfy8TfZOE+vc
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="387230276"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="387230276"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 21:49:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10741"; a="662639373"
X-IronPort-AV: E=Sophos;i="6.00,243,1681196400"; 
   d="scan'208";a="662639373"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Jun 2023 21:49:17 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9ev6-0001S1-2L;
	Thu, 15 Jun 2023 04:49:16 +0000
Date: Thu, 15 Jun 2023 12:48:34 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Brandon Brnich <b-brnich@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 77/107] include/trace/define_trace.h:95:10:
 fatal error: '../../drivers/media/platform/chips-media/trace.h' file not
 found
Message-ID: <202306151205.K2kkiPni-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastian,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   9745edfc822376108888d3de7bb53e063a7be888
commit: 3535376e4f9618805ce0c36abaf8e567b61c95f7 [77/107] media: platform: chips-media: Move Coda to separate folder
config: arm-randconfig-r002-20230615 (https://download.01.org/0day-ci/archive/20230615/202306151205.K2kkiPni-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build):
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git
        git fetch --no-tags ti ti-rt-linux-6.1.y
        git checkout 3535376e4f9618805ce0c36abaf8e567b61c95f7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang ~/bin/make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash drivers/media/platform/chips-media/coda/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306151205.K2kkiPni-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/media/platform/chips-media/coda/coda-bit.c:32:
   In file included from drivers/media/platform/chips-media/coda/trace.h:175:
>> include/trace/define_trace.h:95:10: fatal error: '../../drivers/media/platform/chips-media/trace.h' file not found
      95 | #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:90:32: note: expanded from macro 'TRACE_INCLUDE'
      90 | # define TRACE_INCLUDE(system) __TRACE_INCLUDE(system)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~
   include/trace/define_trace.h:87:34: note: expanded from macro '__TRACE_INCLUDE'
      87 | # define __TRACE_INCLUDE(system) __stringify(TRACE_INCLUDE_PATH/system.h)
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/stringify.h:10:27: note: expanded from macro '__stringify'
      10 | #define __stringify(x...)       __stringify_1(x)
         |                                 ^~~~~~~~~~~~~~~~
   include/linux/stringify.h:9:29: note: expanded from macro '__stringify_1'
       9 | #define __stringify_1(x...)     #x
         |                                 ^~
   <scratch space>:33:1: note: expanded from here
      33 | "../../drivers/media/platform/chips-media/trace.h"
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 error generated.


vim +95 include/trace/define_trace.h

a8d154b0091683 Steven Rostedt 2009-04-10  94  
a8d154b0091683 Steven Rostedt 2009-04-10 @95  #include TRACE_INCLUDE(TRACE_INCLUDE_FILE)
a8d154b0091683 Steven Rostedt 2009-04-10  96  

:::::: The code at line 95 was first introduced by commit
:::::: a8d154b009168337494fbf345671bab74d3e4b8b tracing: create automated trace defines

:::::: TO: Steven Rostedt <srostedt@redhat.com>
:::::: CC: Steven Rostedt <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
