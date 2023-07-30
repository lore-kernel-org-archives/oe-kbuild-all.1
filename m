Received: from mgamail.intel.com (unknown [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF1E134C8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Jul 2023 21:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690753059; x=1722289059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MSUbnwAjNuDpTr2nxDumwl8aqJ7WokI2ERPW6kXcn6Y=;
  b=Noa/q7MPCthWW6+3QOIxeyjp/SVLu7kmhVgIkRSY3f7T3s9kP0ezbH07
   5mbDHiPIT0A3vcM/nJcWQBs4B+21RIUntffHg6a2J4OU9xmO/PUkRjPSZ
   4rJ9mk4OYP3WEQawrvvm3dCeC87REqGuoZdMydrTEtror3ozEkDewa2n8
   NIGllwn3Nhbb7nWSpD12yITaiPmn9ieyavRCjvN3wV4UD/EW+k6AVc8gA
   mPfiKhCNVILP4eU70lqNI4kwMvXMyNaZAHBQnXE4J3QY9QHW7KNzfZnBi
   JCiv5BDkyyDfju+23Kdt+bK/afqpC6rwber3NCY5GfUdo9IovbD7dwfeh
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="348484182"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="348484182"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2023 14:37:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10787"; a="731366387"
X-IronPort-AV: E=Sophos;i="6.01,242,1684825200"; 
   d="scan'208";a="731366387"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 30 Jul 2023 14:37:37 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQE6N-0004ml-1n;
	Sun, 30 Jul 2023 21:37:26 +0000
Date: Mon, 31 Jul 2023 05:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 109/111]
 drivers/ufs/host/ufs-exynos.c:1598:34: warning: 'exynos_ufs_of_match'
 defined but not used
Message-ID: <202307310522.c8LiJApZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bart,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   098173a46bca010e394c7e8e402e519f2ae3f88a
commit: 2d74ff4319d1c8a4254635d7a611562571a8e39f [109/111] UPSTREAM: scsi: ufs: Split the drivers/scsi/ufs directory
config: x86_64-buildonly-randconfig-r002-20230731 (https://download.01.org/0day-ci/archive/20230731/202307310522.c8LiJApZ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307310522.c8LiJApZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307310522.c8LiJApZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/host/ufs-exynos.c:1598:34: warning: 'exynos_ufs_of_match' defined but not used [-Wunused-const-variable=]
    1598 | static const struct of_device_id exynos_ufs_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~


vim +/exynos_ufs_of_match +1598 drivers/ufs/host/ufs-exynos.c

55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1597  
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28 @1598  static const struct of_device_id exynos_ufs_of_match[] = {
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1599  	{ .compatible = "samsung,exynos7-ufs",
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1600  	  .data	      = &exynos_ufs_drvs },
357cd07dd70f25 drivers/scsi/ufs/ufs-exynos.c Chanho Park 2021-10-18  1601  	{ .compatible = "samsung,exynosautov9-ufs",
357cd07dd70f25 drivers/scsi/ufs/ufs-exynos.c Chanho Park 2021-10-18  1602  	  .data	      = &exynosauto_ufs_drvs },
3580301d7f9d99 drivers/scsi/ufs/ufs-exynos.c Chanho Park 2021-10-18  1603  	{ .compatible = "samsung,exynosautov9-ufs-vh",
3580301d7f9d99 drivers/scsi/ufs/ufs-exynos.c Chanho Park 2021-10-18  1604  	  .data	      = &exynosauto_ufs_vh_drvs },
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1605  	{},
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1606  };
55f4b1f73631a0 drivers/scsi/ufs/ufs-exynos.c Alim Akhtar 2020-05-28  1607  

:::::: The code at line 1598 was first introduced by commit
:::::: 55f4b1f73631a0817717fe6e98517de51b4c3527 scsi: ufs: ufs-exynos: Add UFS host support for Exynos SoCs

:::::: TO: Alim Akhtar <alim.akhtar@samsung.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
