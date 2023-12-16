Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFDA328B6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Dec 2023 16:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZckwOek0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702744981; x=1734280981;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+2/LaCSR+PtydkQVCxuUcMUEnFFZ9NHlsYKCHUJ3SNM=;
  b=ZckwOek0s+2KjJZgjnVMVomH4dyxIOA8tMRI8Zpl/kiKydOJI/t2wlKI
   oW9rGCf/nzQvOkTk2aTUMH29Vu/+4ys1QCdzbnUjmxtp0ROtfjxBk5Qse
   XW/vwt6q3lc2WtFTV8/smVzd6F38PPFy2l33mxqdPi6o/p4eKSIyhKPku
   ennpuRALquxuy5IqOOV317hPeRO87FtQgADzYcrszGHTCczaYmIWUhjxd
   vFHggKPB8/gzzp+6DQuerSXrH7uGenVjRNuoCw8e3QqgAZj4U1KCaR1c+
   wYKuh2owt+jzXdBUfNB1NRCxghpRdE2TTuUU+ic7jbrpxUlru9opRir7J
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="385800980"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="385800980"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2023 08:43:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10926"; a="898473997"
X-IronPort-AV: E=Sophos;i="6.04,281,1695711600"; 
   d="scan'208";a="898473997"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Dec 2023 08:43:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEXk5-0001tu-1T;
	Sat, 16 Dec 2023 16:42:35 +0000
Date: Sun, 17 Dec 2023 00:41:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:report-refcounts 425/534] xfs_rmap_item.c:undefined
 reference to `xfs_rtrmap_update_defer_type'
Message-ID: <202312170031.tA16JKMj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git report-refcounts
head:   9b53da520c1def16c6d9730337bb2c3abb2073c8
commit: ba50a1fd4abfb8ac48bf4399707ea3d5320fc5ec [425/534] xfs: add a realtime flag to the rmap update log redo items
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20231217/202312170031.tA16JKMj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231217/202312170031.tA16JKMj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312170031.tA16JKMj-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: fs/xfs/xfs_extfree_item.o: in function `.L147':
   xfs_extfree_item.c:(.text+0xf94): undefined reference to `xfs_rtextent_free_defer_type'
   loongarch64-linux-ld: xfs_extfree_item.c:(.text+0xf98): undefined reference to `xfs_rtextent_free_defer_type'
   loongarch64-linux-ld: fs/xfs/xfs_extfree_item.o: in function `.L153':
   xfs_extfree_item.c:(.text+0x1098): undefined reference to `xfs_rtextent_free_defer_type'
   loongarch64-linux-ld: xfs_extfree_item.c:(.text+0x10a0): undefined reference to `xfs_rtextent_free_defer_type'
   loongarch64-linux-ld: fs/xfs/xfs_rmap_item.o: in function `.L98':
>> xfs_rmap_item.c:(.text+0x838): undefined reference to `xfs_rtrmap_update_defer_type'
>> loongarch64-linux-ld: xfs_rmap_item.c:(.text+0x83c): undefined reference to `xfs_rtrmap_update_defer_type'
   loongarch64-linux-ld: fs/xfs/xfs_rmap_item.o: in function `xfs_rmap_defer_add':
   xfs_rmap_item.c:(.text+0xc8c): undefined reference to `xfs_rtrmap_update_defer_type'
   loongarch64-linux-ld: xfs_rmap_item.c:(.text+0xc90): undefined reference to `xfs_rtrmap_update_defer_type'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
