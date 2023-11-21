Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC8B1DFC3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 08:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0PWaFdJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700554455; x=1732090455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=67EYm78L7rIU9WKwDqnevVP1mHFgFlt6brLmTQZsmZw=;
  b=j0PWaFdJqkU79ZwsU59tisYW6o5nr4Kf3aXxaqX7dMeVLxdjLD+iTYTd
   F78Gt0wswKDqnwwTz9DJacbMDKS6Z3nfHTqooy/625VOM6TNhBbAH5Rn3
   v0n4xLc2sDwncyUETb/T4T535ExY1G21iGM1tqEmWdOXcdcwiTJ1MS9OU
   HY/rej1vHwiUiuII0tmvRRGUHGAI0nGg2P1PjeulUGrfYIXrrRZP7sJgE
   LrSXm+OZGgZv4C2FS5QYHvZPLVWvr1++f6mZy2m20e3UjOS5+ANtxO3++
   YcoZP9/myiAWlbRt9tfavON4joT36UgwMjhuoH2GEeiWf8XFbKHSBvmYH
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422889727"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="422889727"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 00:14:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="760026348"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="760026348"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Nov 2023 00:14:12 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5Lrc-0007Xt-2f;
	Tue, 21 Nov 2023 08:12:31 +0000
Date: Tue, 21 Nov 2023 16:08:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/050-nvme 1/3] drivers/nvme/host/apple.c:208:14:
 sparse: sparse: symbol 'flush_interval' was not declared. Should it be
 static?
Message-ID: <202311211638.SrNAPRId-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/050-nvme
head:   9aab2d5712b51bda0913044211406563da5eee5c
commit: 257698a1cbe2189c52568a6ff5be74c700776c72 [1/3] apple-nvme: defer cache flushes by a specified amount
config: arm64-randconfig-r121-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211638.SrNAPRId-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311211638.SrNAPRId-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211638.SrNAPRId-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/nvme/host/apple.c:208:14: sparse: sparse: symbol 'flush_interval' was not declared. Should it be static?

vim +/flush_interval +208 drivers/nvme/host/apple.c

   207	
 > 208	unsigned int flush_interval = 1000;
   209	module_param(flush_interval, uint, 0644);
   210	MODULE_PARM_DESC(flush_interval, "Grace period in msecs between flushes");
   211	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
