Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E6638C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Dec 2024 03:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733368924; cv=none; b=Ax4fLAX4dFxqNxhaBEz/xpJy/UVt5ryjuqtXClLHVOFmEGgsjZ5lwGwwFc30oxSmUElnlHMs2BsiyxWVF2UIv6yqUQjJEzs6GqWPWXfT/ablA4UGCyzDsIvMC7OuDxkOu00Ze8API7dPtynHHxJpLTsmd2pSuEjEgR9/SXjpG3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733368924; c=relaxed/simple;
	bh=JIJIUAJDkvI663EO2bhmQZ16pjK+IGhRmXP80wscQR4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YpjfkmVQQbT2guEW452fz9thxFBIfAbaCSFJthwz+XUiFeKxST9ZWud+czKkwkfOA+2Ucv1fvjBKyO6GwLP115kYleeyDU4Gk01LKEGwKVSP4Gk1ZbRcs4mnChTVhUL3+0k18lpT1bEFqxcsgjbRekUkdqOwoNAbiL8NYiCp9gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bKnaFFIw; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKnaFFIw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733368922; x=1764904922;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JIJIUAJDkvI663EO2bhmQZ16pjK+IGhRmXP80wscQR4=;
  b=bKnaFFIwkI+4dP/E4Mruwuqgql3zw78FD2KDstCl4mZYBQMQDKLmhAO2
   Au1kxMgXvvEBmYO4FvmuU5kyNlMh3VR6f6w1GEa3xRhGA2PfIH2855TYl
   h0F02GJFIIhwRjZ144YSWuFlsRi9IWGq2Hpszw4GWeDedWxlsax2pMEZ1
   2Jmk0Pj3q5l/N7rhO+DWYa6tcazB688bXujTcSeKP2Frs71dQx74EzCMb
   detqjH1p8ulNaXOZNSkiOmPtc6CC97UlXCyzihJXSZFT4XCJp1+0KCTtr
   aoyM77jQIP933VJplED+l5dBHGlOD+uMk+DcYkCt0N0d9M8V8m4bioX0/
   w==;
X-CSE-ConnectionGUID: CZxgjWdvQgKE9pcCAiE+6Q==
X-CSE-MsgGUID: qxJYfRD6QzGRHr36GqYxfA==
X-IronPort-AV: E=McAfee;i="6700,10204,11276"; a="37600507"
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="37600507"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 19:22:01 -0800
X-CSE-ConnectionGUID: 2huOVneqSEqUPyex9O5Llw==
X-CSE-MsgGUID: 3G/iYw4FQCaDtsNnI9eJLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,209,1728975600"; 
   d="scan'208";a="94396091"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 04 Dec 2024 19:22:00 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJ2RB-0003jW-2L;
	Thu, 05 Dec 2024 03:21:57 +0000
Date: Thu, 5 Dec 2024 11:21:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 109/111]
 drivers/ufs/host/ufs-hisi.c:561:34: warning: unused variable
 'ufs_hisi_of_match'
Message-ID: <202412051109.UIU8XuoT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   06a0756a038bab21da780e524fb569610b4227a0
commit: 2d74ff4319d1c8a4254635d7a611562571a8e39f [109/111] UPSTREAM: scsi: ufs: Split the drivers/scsi/ufs directory
config: i386-buildonly-randconfig-005-20241205 (https://download.01.org/0day-ci/archive/20241205/202412051109.UIU8XuoT-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241205/202412051109.UIU8XuoT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412051109.UIU8XuoT-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/ufs/host/ufs-hisi.c:14:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:1640:
   include/linux/vmstat.h:357:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     357 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/ufs/host/ufs-hisi.c:561:34: warning: unused variable 'ufs_hisi_of_match' [-Wunused-const-variable]
     561 | static const struct of_device_id ufs_hisi_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/ufs_hisi_of_match +561 drivers/ufs/host/ufs-hisi.c

653fcb07d95eda drivers/scsi/ufs/ufs-hisi.c Manivannan Sadhasivam 2019-01-05  560  
653fcb07d95eda drivers/scsi/ufs/ufs-hisi.c Manivannan Sadhasivam 2019-01-05 @561  static const struct of_device_id ufs_hisi_of_match[] = {
653fcb07d95eda drivers/scsi/ufs/ufs-hisi.c Manivannan Sadhasivam 2019-01-05  562  	{ .compatible = "hisilicon,hi3660-ufs", .data = &ufs_hba_hi3660_vops },
653fcb07d95eda drivers/scsi/ufs/ufs-hisi.c Manivannan Sadhasivam 2019-01-05  563  	{ .compatible = "hisilicon,hi3670-ufs", .data = &ufs_hba_hi3670_vops },
653fcb07d95eda drivers/scsi/ufs/ufs-hisi.c Manivannan Sadhasivam 2019-01-05  564  	{},
653fcb07d95eda drivers/scsi/ufs/ufs-hisi.c Manivannan Sadhasivam 2019-01-05  565  };
653fcb07d95eda drivers/scsi/ufs/ufs-hisi.c Manivannan Sadhasivam 2019-01-05  566  

:::::: The code at line 561 was first introduced by commit
:::::: 653fcb07d95eda58b72a5e715230b582c4d6d69e scsi: ufs: Add HI3670 SoC UFS driver support

:::::: TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
