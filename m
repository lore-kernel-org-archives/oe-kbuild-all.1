Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3805A38F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jan 2024 00:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="auye49di"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704933960; x=1736469960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gxvZgiZP8pGTAi56tKBbolvgnOLZeCcfvKzhcQM178E=;
  b=auye49diYTn1SBoz9Oa3HI2NXCqQZr5/Eat7s+avSi8dEqeOlW8AXHLs
   pOiOrtSfnkPB5DeGHNZSZXfLDSfQDBAkLTBaAnTmvEqnEsKe9MoqqS+GR
   9HpdWBPah9cCic0ESe28e+I7TMyOMhkIpDtarYzYs0i/VZRfqrLHUFooq
   TXIYFMvnHfuwopx4sBNHolyGFO+6hMgZW6nC3Lb6JiHoq91GFT2faxsTY
   RtuGhT6mSnDP+VDa6fAbCwwFmkGPYUw5czrzd8lDcHdXa0E3h1RKZxpdn
   +FurX4ff8BRqacZoDZn+v/9Vkd+eUFBWPmZ5l7af4ivW8ueSBvYO0iu4J
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="5780220"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="5780220"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2024 16:45:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10949"; a="732016630"
X-IronPort-AV: E=Sophos;i="6.04,184,1695711600"; 
   d="scan'208";a="732016630"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 10 Jan 2024 16:45:57 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rNjCk-0007dY-2x;
	Thu, 11 Jan 2024 00:45:54 +0000
Date: Thu, 11 Jan 2024 08:45:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 8821/30000] cc1: error:
 '-fsanitize=shadow-call-stack' requires '-ffixed-x18'
Message-ID: <202401110831.R6ApQeNR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sami,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   782f2a2a1a090d013575b791b3caec126353458c
commit: 332eaac720a2ecaa3227b70cc792a1698cafdfb9 [8821/30000] FROMLIST: arm64: implement Shadow Call Stack
config: arm64-randconfig-001-20240110 (https://download.01.org/0day-ci/archive/20240111/202401110831.R6ApQeNR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240111/202401110831.R6ApQeNR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401110831.R6ApQeNR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: '-fsanitize=shadow-call-stack' requires '-ffixed-x18'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
