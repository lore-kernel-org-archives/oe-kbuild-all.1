Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECBF315A2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Sep 2023 07:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693726910; x=1725262910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9yUxFcC257Ri1h2I1iVR0Bni1YDLt44N8uja6WLGuUE=;
  b=jZ0TJYmmDa05cMOQZfb34gs4+//iv40SCehCIh/iPf10fZkOTvC6cKDf
   i5mmLlvrqCdnSIhZafg0C7ll3zXTZou8dap23svy57rnqaguVhqKKxKkQ
   hiDvBlphLSOZUSSbk0sTi5nndrHjCexopD6Crl6JnCUD4F4KL6QDaNNFr
   xb6kfLc8GxeB0NCZW/1xjBDB/jkq59wBzHOMskw9e7hI4jOP6GN++6vyV
   xYQtxsc6iQJyW1Rm3SnNicZRBaNFDoA6hph4Gnbn51Xvt0tjcpar2q4pu
   ewtPlOiX/kfHZIhAdaohLkc5HwZ+unwMAcSDthqLIxc4/koHaYQxrHeHh
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="361450025"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="361450025"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2023 00:41:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="830576197"
X-IronPort-AV: E=Sophos;i="6.02,224,1688454000"; 
   d="scan'208";a="830576197"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Sep 2023 00:41:48 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qchju-00030l-1Z;
	Sun, 03 Sep 2023 07:41:46 +0000
Date: Sun, 3 Sep 2023 15:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_3 14460/14511]
 drivers/mtd/nand/spi/core.c:979:5: sparse: sparse: symbol 'spinand_cal_read'
 was not declared. Should it be static?
Message-ID: <202309031522.9pCXAaK4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_3
head:   bd334514d2acb4d7ae8675e52ad6faf9cd7e64b6
commit: f7c5c11bb7d6ace56bea04f752d56c629d392689 [14460/14511] drivers: mtd: spi-nor: Add calibration support for spi-nor
config: x86_64-randconfig-121-20230903 (https://download.01.org/0day-ci/archive/20230903/202309031522.9pCXAaK4-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230903/202309031522.9pCXAaK4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309031522.9pCXAaK4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/spi/core.c:979:5: sparse: sparse: symbol 'spinand_cal_read' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
