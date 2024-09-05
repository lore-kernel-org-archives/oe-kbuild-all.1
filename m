Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C8ED53F
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Sep 2024 01:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725499520; cv=none; b=r1nmp+g/tGhs1UofdbX4y8u0jharHIVWyO/8FeIPn0NUCW/iibHXJD834IYaXpti5h4Xnosn/wNzCci8e3NFPVMU/4L+4mScUoeGK+5ozuFE5LFu2zhw3C32eUxyh3sPtPr3trcIQLP3BWakUsfUi1athQILjlBcUdM8AVpY51Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725499520; c=relaxed/simple;
	bh=pSWZROJufXLio8zerbTL7bNjxksenLaQq/g2HbYte/0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m330iDZWf5hGTV5N90Jm/YkBW/ZVRDTmnfdNLKfN1YX+pZODGc2qNjjYG+rYNkPheO3PNePesFEB0efLj6EaX1PKF+7WKMTyPmJ4KL+HXMV4FKnvTAlf+MGTOUP9T8Q1b+eKWeZGsYzZXylV3dGQL+EMcGcKiHuAErBShgsmkZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H66Quy4S; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H66Quy4S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725499519; x=1757035519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pSWZROJufXLio8zerbTL7bNjxksenLaQq/g2HbYte/0=;
  b=H66Quy4SEmgUaISHJcuN+E+J8YsYuALB9BTvhh/jySm4iaE/uoDvUEIU
   ZCDz+TSfPQylQeqa57kX5RjbR97bO7/XKHGog8r8rm0dDcKziKQ/z2i/r
   7w5HIg3RNGujbwU95zvvh9tjAhrhojVgNXAA5jf5ls1qNCsgdnMD/QuAQ
   FeZumZF3a0SMNH1n6pM+n/+k8M4BOyD0CvsjISj09X1DZ8CHfyRegEa/S
   rT4KGf6jLMDKhPeodA3YNc1SlWXb4lA+kawsbypVtsjHbKayiSR5UnD/6
   73P3/WMiJ9FWDcOKuNV+mcQ7lBb+IBpnRJJatp0svnuXQiYvbxk9jfD7n
   Q==;
X-CSE-ConnectionGUID: 6xBle3jhR5+Vv5dhL+Z4+w==
X-CSE-MsgGUID: fKv4/bkMTimzknbpJQe+IQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11185"; a="24385756"
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="24385756"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2024 18:25:18 -0700
X-CSE-ConnectionGUID: YqBp99F/Syyv42DLQqEQlg==
X-CSE-MsgGUID: cyCDlX1ZQJqRgU5hi7adMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,203,1719903600"; 
   d="scan'208";a="65450767"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 04 Sep 2024 18:25:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sm1FK-0008lv-2F;
	Thu, 05 Sep 2024 01:25:14 +0000
Date: Thu, 5 Sep 2024 09:24:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 109/111]
 drivers/ufs/host/tc-dwc-g210-pltfrm.c:36:34: warning:
 'tc_dwc_g210_pltfm_match' defined but not used
Message-ID: <202409050934.Wyr6BcdA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   1fabbd89f9c48b7e982d8b95e90a822f17a5d49e
commit: 2d74ff4319d1c8a4254635d7a611562571a8e39f [109/111] UPSTREAM: scsi: ufs: Split the drivers/scsi/ufs directory
config: x86_64-randconfig-002-20240905 (https://download.01.org/0day-ci/archive/20240905/202409050934.Wyr6BcdA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240905/202409050934.Wyr6BcdA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409050934.Wyr6BcdA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/host/tc-dwc-g210-pltfrm.c:36:34: warning: 'tc_dwc_g210_pltfm_match' defined but not used [-Wunused-const-variable=]
      36 | static const struct of_device_id tc_dwc_g210_pltfm_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=n] && !UML && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


vim +/tc_dwc_g210_pltfm_match +36 drivers/ufs/host/tc-dwc-g210-pltfrm.c

fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  35  
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11 @36  static const struct of_device_id tc_dwc_g210_pltfm_match[] = {
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  37  	{
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  38  		.compatible = "snps,g210-tc-6.00-20bit",
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  39  		.data = &tc_dwc_g210_20bit_pltfm_hba_vops,
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  40  	},
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  41  	{
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  42  		.compatible = "snps,g210-tc-6.00-40bit",
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  43  		.data = &tc_dwc_g210_40bit_pltfm_hba_vops,
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  44  	},
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  45  	{ },
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  46  };
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  47  MODULE_DEVICE_TABLE(of, tc_dwc_g210_pltfm_match);
fc040a3fc47cad drivers/scsi/ufs/tc-dwc-g210-pltfrm.c Joao Pinto 2016-05-11  48  

:::::: The code at line 36 was first introduced by commit
:::::: fc040a3fc47cad038f774275ea61fe6d5b57d7cc ufs: add TC G210 platform driver

:::::: TO: Joao Pinto <Joao.Pinto@synopsys.com>
:::::: CC: Martin K. Petersen <martin.petersen@oracle.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
