Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6727337CD4A
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Apr 2026 08:44:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775205841; cv=none; b=JvRcTH+IbQe5orTdpM1dHBmwUA10aXbq6qcOF8ye5g3hSXD6ly9ZvX6k8BKs0a+dmjUaSUOVJvkcShd+Z5Yqz365AmNii/8/oDUWA9IHsGPinObSLBTJw+UrmZGfq0aH3USP4qjPJYxw15fl5LleXM37+7ZZ4Uy0sA09Gz+BU5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775205841; c=relaxed/simple;
	bh=5u7GzY/aUiTjraRc/laT9qLV/8CXDUzN6rmSexuiUxE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gLOEsgPQYoVuW/xJH15i3nfWYBBG541uAZ+5qwEbOVcnsUKpoe70Ruf1LpcEJncb5r3JT4VqJLaFNucJJw9Q3C5gAKtq4Wl2ufTewP5KkSvfuTt0FKQ5L+mGxOkf/BcEOFtSLivmdzZA3DsYQYwnGs1+3ParqkiaOxseRK9Zxfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M61raBZg; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M61raBZg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775205840; x=1806741840;
  h=date:from:to:cc:subject:message-id;
  bh=5u7GzY/aUiTjraRc/laT9qLV/8CXDUzN6rmSexuiUxE=;
  b=M61raBZgLHGR+d/UXcJ77qSTHJ/Izo225R/8V2LD7LMja1crroZwC707
   BwWmuHH8VjO6TNhBbCmCp0NKrWrqXloN03Fd+UT3dSFiV2jkE6G/b4D2E
   XdSouoWs49dnv0TCDCTIWPuP+X3mXHN9YD+fr+J9ih2W2+mnmZidRncTt
   DvL0WmLGzPQIjEcgPpi5XTwLGk9m5ckqP3Owk/KUHUnOW8lKaf1pn9gjC
   IIf8+gKfyV4RSvYf1pmoWlZ43uhCTKu97qrPf/N35W3J6CLpJv5/TFZ0x
   fkI0TakNqQ8y9jJwNPSt+eKl0dZ/4B3vQHTFwAy4kafkSJsLf/BgcZN5T
   A==;
X-CSE-ConnectionGUID: VonXi39sQR6XzR5xfuPfxw==
X-CSE-MsgGUID: pEnaaSrvRUSuV4KLjBxAVg==
X-IronPort-AV: E=McAfee;i="6800,10657,11747"; a="93852229"
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="93852229"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2026 01:43:59 -0700
X-CSE-ConnectionGUID: 17Sk+kAoRjuBd+L+7dDQDA==
X-CSE-MsgGUID: Qja9MYLXSv6y/PT8Fz8TOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,157,1770624000"; 
   d="scan'208";a="223943416"
Received: from lkp-server01.sh.intel.com (HELO 064ad336901d) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Apr 2026 01:43:58 -0700
Received: from kbuild by 064ad336901d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w8a8B-0000000014J-31PF;
	Fri, 03 Apr 2026 08:43:55 +0000
Date: Fri, 03 Apr 2026 16:43:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/1]
 drivers/ufs/host/ufs-hisi.c:561:34: warning: 'ufs_hisi_of_match' defined but
 not used
Message-ID: <202604030328.nT7sqE9C-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bart,

First bad commit (maybe != root cause):

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   3345d7186397130229186427c1c89125d9687c46
commit: 2d74ff4319d1c8a4254635d7a611562571a8e39f [0/1] UPSTREAM: scsi: ufs: Split the drivers/scsi/ufs directory
config: i386-buildonly-randconfig-006-20260403 (https://download.01.org/0day-ci/archive/20260403/202604030328.nT7sqE9C-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260403/202604030328.nT7sqE9C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604030328.nT7sqE9C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/host/ufs-hisi.c:561:34: warning: 'ufs_hisi_of_match' defined but not used [-Wunused-const-variable=]
     561 | static const struct of_device_id ufs_hisi_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]


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
