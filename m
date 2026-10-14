Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AA14EBAC8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 10:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791974283; cv=none; b=kklm71XI+xVSAmdfNv9kJ5Bhel5+JZtKu9oDfM2r+RhExQzKNTtjolxSESlhWUsupHWY5pwaPxqJuGUWe16Kjz0egQi3gaOoc7wcx3lTtVQauLiSrOgl50cT+gm256u2GNYEAf0LobCwBVVmYFtLPxoinsSfcmIzKYBatayR0Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791974283; c=relaxed/simple;
	bh=6WmU9vf81984V8Zf/DOrObgCZ9muS4RzqB7sViNexMo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XbzXWNinjsqwqQgvkrwq8WEBUC/CG5axfFBHT+aCqh0n/7fU8hGe+78YXWkCQ3VOhu6rqFBN9YExTP6XXR0zxiJX+lvqi63BrmMH2BgBbacNsRbwkj4AR+jTVv4xQz7JR8qbuj6hXYpcx0ZoA/1bPQipqDGQuLdgE8Y7xDNDTMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIL4ybvD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIL4ybvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791974281; x=1823510281;
  h=date:from:to:cc:subject:message-id;
  bh=6WmU9vf81984V8Zf/DOrObgCZ9muS4RzqB7sViNexMo=;
  b=BIL4ybvDtzjDquoGY6tVbTyY+j/vPPvbLeCn+gUv6qhC32k5X9EVrNOH
   nCOlCSNdJcfpA+Wwfq5MVHgtMRJO6Pm9Lv4hyZWqfZpQF4nxh3diHwqE/
   Y5tHIF3fSW/dBWC+YcajxHEkqYRm3GPmBWrxnV+Z7hnddteisZrkUndGY
   nSTfZEbxBLxCwlK+R5ughe0T+HyUiY03QJoQmfdfjwYvryVO0c44gRqqT
   0ibtIrfj2Q/RROsdXVSuBPNOgy7NR7/RRboTpMCHRIKQNoVX+B2yIcLm/
   8YGdr3ykRr41/t0Ztu/oHlfyKrpfK9UYhsYZZRgXDQgd3Qaodqv0pvPBc
   Q==;
X-CSE-ConnectionGUID: ChYZUAQ7Sce3K5r5XvbMvg==
X-CSE-MsgGUID: a3INZd+BR1Oh9U05dvqLnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="618640"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="618640"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 03:38:01 -0700
X-CSE-ConnectionGUID: QhOU0lOfT2+R+Dh1LTq8eA==
X-CSE-MsgGUID: jg0zpqZsTP+jQyE9a03RZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="3161167"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 14 Oct 2026 03:38:00 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGwMv-00000000B23-2Sxy;
	Wed, 14 Oct 2026 10:37:57 +0000
Date: Wed, 14 Oct 2026 12:37:13 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15-2025-07 2/2]
 drivers/ufs/host/tc-dwc-g210-pltfrm.c:36:34: warning:
 'tc_dwc_g210_pltfm_match' defined but not used
Message-ID: <202610141248.3gzv0GVy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bart,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15-2025-07
head:   46c96f2b3074c362a75032e50d95ec77b346008b
commit: 2d74ff4319d1c8a4254635d7a611562571a8e39f [2/2] UPSTREAM: scsi: ufs: Split the drivers/scsi/ufs directory
config: i386-randconfig-r2103-20261014 (https://download.01.org/0day-ci/archive/20261014/202610141248.3gzv0GVy-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261014/202610141248.3gzv0GVy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610141248.3gzv0GVy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/host/tc-dwc-g210-pltfrm.c:36:34: warning: 'tc_dwc_g210_pltfm_match' defined but not used [-Wunused-const-variable=]
      36 | static const struct of_device_id tc_dwc_g210_pltfm_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]


vim +/tc_dwc_g210_pltfm_match +36 drivers/ufs/host/tc-dwc-g210-pltfrm.c

fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  35  
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11 @36  static const struct of_device_id tc_dwc_g210_pltfm_match[] = {
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  37  	{
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  38  		.compatible = "snps,g210-tc-6.00-20bit",
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  39  		.data = &tc_dwc_g210_20bit_pltfm_hba_vops,
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  40  	},
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  41  	{
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  42  		.compatible = "snps,g210-tc-6.00-40bit",
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  43  		.data = &tc_dwc_g210_40bit_pltfm_hba_vops,
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  44  	},
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  45  	{ },
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  46  };
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  47  MODULE_DEVICE_TABLE(of, tc_dwc_g210_pltfm_match);
fc040a3fc47cad0 drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  48  

:::::: The code at line 36 was first introduced by commit
:::::: fc040a3fc47cad038f774275ea61fe6d5b57d7cc ufs: add TC G210 platform driver

:::::: TO: Joao Pinto <Joao.Pinto@synopsys.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
