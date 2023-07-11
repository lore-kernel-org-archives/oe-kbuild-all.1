Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C364C3FE6
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 04:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689049363; x=1720585363;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=phr6qluk3AlJgw1buCsZpiE6WZMYi6XVxrqJ+G90pzk=;
  b=E3HLjE9ghWJe1EQge0U6nWFmrdK3Xay0Li79jvkSYLTqcMbe6BrO8p8l
   72fjOmb2ElqQGnTz8EzCGFC5DfujZLzwjr2upvgrlENTHlnZVUR4aFd5f
   6EKiEAnA3uWvRCixWdUeIaBfomzDLN+Lt/HljDTYLoGXYQ+KRLPdd0DbJ
   w4WoUEMr/IdJC23avm2kVk8ybTddLSOn4Fv83SIsLaLPEKmPlyrM1lGuo
   wSl6aPxWGYpa+2OAVRU1s2N65O2CPvp30r4dU8x520edgg2T+L6N3Tbx1
   pUB0V1plL6DvADO6rreNi1h/IZOUhsGbKINKWjMIkT3nbE428kTLr3vKC
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="367099491"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="367099491"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 21:22:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="786460139"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="786460139"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 10 Jul 2023 21:22:41 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ4tc-0004JD-2E;
	Tue, 11 Jul 2023 04:22:40 +0000
Date: Tue, 11 Jul 2023 12:22:18 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.5-rc1-esp32wifi 25/27]
 drivers/net/wireless/espressif/esp_shmem.c:18:10: fatal error: esp_shmem.h:
 No such file or directory
Message-ID: <202307111201.4eyHqqON-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.5-rc1-esp32wifi
head:   2eab76fb89d797558f2825d8813565c35c8ef134
commit: ed6dd9902d82039125296986ae888c48b0f144eb [25/27] esp_wifi: add shmem transport
config: um-defconfig (https://download.01.org/0day-ci/archive/20230711/202307111201.4eyHqqON-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111201.4eyHqqON-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111201.4eyHqqON-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/net/wireless/espressif/esp_shmem.c:18:10: fatal error: esp_shmem.h: No such file or directory
      18 | #include "esp_shmem.h"
         |          ^~~~~~~~~~~~~
   compilation terminated.


vim +18 drivers/net/wireless/espressif/esp_shmem.c

    12	
    13	#include "esp.h"
    14	#include "esp_if.h"
    15	#include "esp_api.h"
    16	#include "esp_bt_api.h"
    17	#include "esp_kernel_port.h"
  > 18	#include "esp_shmem.h"
    19	#include "esp_stats.h"
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
