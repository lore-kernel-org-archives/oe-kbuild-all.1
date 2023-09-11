Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB338F5F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Sep 2023 17:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694452606; x=1725988606;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LPOL9UcqqLpoMhwRy2SR2pU8ZrJ1nIDn8hOvm80ItC8=;
  b=ATqSmlO8w92qyUOEVownsJnBzq2I2t24DT7PqTck8pjLyIlSXCoADyi3
   1B6P41hZOmUQ09IaJ+a3K2+DH69cdqzym8ybyRSSPk1qqd9q6t5jbeuka
   WyeeDLF+6W0ppdY5Tp0YO8D9TKMHAEwHiM95xBeyFsr8WmnlXaFmUOGMm
   5EKQNbm7pRytMNnxgoWJSWNLaVFbr3rBf1eQKfkzTpK/+G38X1UY3OlrL
   wLQXWMcBgAZTDT4/4Xeiw/WXbxIlFj10hqhCD26MHM2p11+vzoEsBmA9+
   6kRvBqRp17LGe/Qccf0IHhXhqriutiubJ1vFw3KF4THShOZoPhz/xmfQA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="442159617"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="442159617"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2023 10:15:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10830"; a="772665981"
X-IronPort-AV: E=Sophos;i="6.02,244,1688454000"; 
   d="scan'208";a="772665981"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 11 Sep 2023 10:15:29 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qfkVS-0006WZ-2j;
	Mon, 11 Sep 2023 17:15:26 +0000
Date: Tue, 12 Sep 2023 01:14:52 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:5.15-2.2.x-imx 1331/25021]
 ./usr/include/linux/videodev2.h:2398:20: error: field has incomplete type
 'struct timespec'
Message-ID: <202309120108.AAXYpg5V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc 5.15-2.2.x-imx
head:   3a95b5654979d1c2d61616bf60249ed3a98dcfbc
commit: 0103d73732ea64a7956c8423ff3ec99d9f8b119f [1331/25021] MLK-21876-13 ipu: add uapi headfile for yocto build pass
config: i386-buildonly-randconfig-001-20230910 (https://download.01.org/0day-ci/archive/20230912/202309120108.AAXYpg5V-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230912/202309120108.AAXYpg5V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309120108.AAXYpg5V-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
   In file included from ./usr/include/linux/ipu.h:29:
>> ./usr/include/linux/videodev2.h:2398:20: error: field has incomplete type 'struct timespec'
           struct timespec                 timestamp;
                                           ^
   ./usr/include/linux/videodev2.h:2398:9: note: forward declaration of 'struct timespec'
           struct timespec                 timestamp;
                  ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
