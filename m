Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D4EF14A9D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jul 2023 05:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689054946; x=1720590946;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pLpo4cTQlkmUgyhJ9PAeneKD7qZoJ8gZDxicsq+k6/Q=;
  b=KJxkcKG+O/4R+4vT4bCMntDITfgMn4RSZp2EHNG9Plkn3Mu8v98sRJmO
   rDJWmCmqI6qeqLI/tAuN2wuM2hhP/vDy6/d25cYq3ZPsRNlJaZVKQAepQ
   T6W1ZVa/HAQYVMSCZ6wu4Jjo/xQ59Xc3HBFbP7pqFSWnJFxWS99PW01a7
   7f4KTQsnpDKAStfSwRcY0FJqKtb1nx7xryBmyQhRbwWj20QPeyWNzm5Sk
   6ScnDvM+cfjMnPgQiE2DMgbnih65YzI36F0cDDGDbEqqdvcqvf28e9DGX
   KBXEQvpQWL5WBlF7EMmMVQY63QDZ5hCuvZcJjGeH5EB8cDz47vuywGn4O
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="450894034"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="450894034"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2023 22:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10767"; a="834532608"
X-IronPort-AV: E=Sophos;i="6.01,196,1684825200"; 
   d="scan'208";a="834532608"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 10 Jul 2023 22:55:43 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qJ6Le-0004NP-3D;
	Tue, 11 Jul 2023 05:55:43 +0000
Date: Tue, 11 Jul 2023 13:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/bleeding-edge 1/4]
 drivers/thermal/tegra/../thermal_core.h:18:2: warning: #warning This header
 can only be included by the thermal core code
Message-ID: <202307111359.HZqRfobP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Daniel,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/bleeding-edge
head:   c1601aa7a4588e3b79522dfba93c41630f04950f
commit: 1211989c112f7e29bf11589aab7ee6da5ae9540c [1/4] thermal/core: Hardening the self-encapsulation
config: arm64-randconfig-r006-20230710 (https://download.01.org/0day-ci/archive/20230711/202307111359.HZqRfobP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230711/202307111359.HZqRfobP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307111359.HZqRfobP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/thermal/tegra/soctherm.c:36:
>> drivers/thermal/tegra/../thermal_core.h:18:2: warning: #warning This header can only be included by the thermal core code [-Wcpp]
      18 | #warning This header can only be included by the thermal core code
         |  ^~~~~~~


vim +18 drivers/thermal/tegra/../thermal_core.h

    16	
    17	#ifndef THERMAL_CORE_SUBSYS
  > 18	#warning This header can only be included by the thermal core code
    19	#endif
    20	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
