Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E997F1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Aug 2023 01:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691718118; x=1723254118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3ee8/em5lSVx0HG6WyPC6MbBEvTrN7zO3GHj7P0BgJU=;
  b=no9I8FfcMA8rLRNiZL5zfV4a4cOGoYOB8uhCdm/in3NgX6kUdkBR1jo/
   MViGqVykyCGbIaBwvAdnUqFHcixmWEI8d69caBwoI47oEFc6i/NV14/bb
   y/zf0PLGSbKrtyNFdLYAxdZEzV/zZVduJLG/9J30kBxv2qoJWJ1p/Mln/
   QTo3Ny7xvu67l3hA3hBEwIppLIlPL0DzWKonLq1AIAkf6BTHRN+OsH6xE
   X0Yvay8VBf8w3xUQFH2Db9G5sUnBc82kEDs8ME6y2IDHMhe/yebNyGrzI
   9BQqyQcHHPpkFBrvn6s5DraDGgVjbCEZc2QnR7thuagAgx92/Uf+IE3lz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="351885522"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="351885522"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2023 18:37:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10798"; a="979051900"
X-IronPort-AV: E=Sophos;i="6.01,164,1684825200"; 
   d="scan'208";a="979051900"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Aug 2023 18:37:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qUH5h-0007PI-0u;
	Fri, 11 Aug 2023 01:37:25 +0000
Date: Fri, 11 Aug 2023 09:36:44 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Sodagudi <psodagud@codeaurora.org>
Cc: oe-kbuild-all@lists.linux.dev, Yogesh Lal <quic_ylal@quicinc.com>,
	Elliot Berman <eberman@codeaurora.org>
Subject: [sudeep-holla:android13-5.15/ffa 1113/4062]
 drivers/android/android_debug_symbols.c:11:10: fatal error:
 asm/stacktrace.h: No such file or directory
Message-ID: <202308110921.tFjVHegO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: b2df67a932b5cbd6535de9f1a6e63004992ad014 [1113/4062] ANDROID: android: Create debug_symbols driver
config: alpha-randconfig-r014-20230810 (https://download.01.org/0day-ci/archive/20230811/202308110921.tFjVHegO-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230811/202308110921.tFjVHegO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308110921.tFjVHegO-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> kernel/module.c:4789:6: warning: no previous prototype for 'android_debug_for_each_module' [-Wmissing-prototypes]
    4789 | void android_debug_for_each_module(int (*fn)(const char *mod_name, void *mod_addr, void *data),
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/module.c:4809:6: warning: no previous prototype for 'module_layout' [-Wmissing-prototypes]
    4809 | void module_layout(struct module *mod,
         |      ^~~~~~~~~~~~~
--
>> drivers/android/android_debug_symbols.c:11:10: fatal error: asm/stacktrace.h: No such file or directory
      11 | #include <asm/stacktrace.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 drivers/android/android_debug_symbols.c

     2	
     3	/*
     4	 * Copyright (c) 2021, The Linux Foundation. All rights reserved.
     5	 */
     6	
     7	#include <linux/types.h>
     8	#include <linux/kernel.h>
     9	#include <linux/module.h>
    10	#include <linux/android_debug_symbols.h>
  > 11	#include <asm/stacktrace.h>
    12	#include <asm/sections.h>
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
