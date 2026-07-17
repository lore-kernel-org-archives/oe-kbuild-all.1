Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729723064A9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 15:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784300978; cv=none; b=aA9fYIqfLPlg3KZ3lJP6L4G11xCG6JyxTygpQHSTs59dvrCiIbLDEBJSFnQlJi1AW5pbafaMzjcBI+IVtTWK+5gPtp+W17r0dkwWqM1NmRPJlorNiB8Sp9Ylo7fjzE88H3TqvwPR2F5KcU1O6XJmINxOuoNPBoXwy98//Mkj7ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784300978; c=relaxed/simple;
	bh=ACSjpSQn+Hzgjg30/g2sNwHWpSFSd7E8c6GFh0vY22o=;
	h=Date:From:To:Cc:Subject:Message-ID; b=R19l/9bfaMxJ5xGmlvo7jiVFfmFOcGbqs14d5IgBUd6X6frbSPeGQ/Zwd0hV2BvCw1Sw34+QuLxHJ+shDBWpeT2Kg3opcumTC8LSpZpR3hThLGzre7pM0rxVnlfm+yKYVQuGY7bQYQsdsIPN402YNeCzAoo0rng707R6c0rSDz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jC3rRDqm; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jC3rRDqm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784300977; x=1815836977;
  h=date:from:to:cc:subject:message-id;
  bh=ACSjpSQn+Hzgjg30/g2sNwHWpSFSd7E8c6GFh0vY22o=;
  b=jC3rRDqmlbcfQ76Bp+7HPJJ0q0PM//RRGCqmgDTUYufIOOtAEnOLnoj6
   ikhtr04/fJyiTtw9a/K6Au2iihdblr+DRjmXfvaviV8g3HU+voolLvccj
   GEbMEQp20Dq+dmtgNQ/BN6a9V6QIaNoB6iLxNviTJ4lWQ/Q+fS2Pyx0wf
   48eiRLST8MdYZEgYeog9kqIBUgdiQ1vsrRPH0qbAYa/9aPlGmpF3NfrDX
   SCeGNLFQKpjIo1YNxXXcvwwOlnahPRjQ/E1pTtDIeyNjkyl5a4iZtkH5u
   OUyphOudrV76ycdhOFlbapCoDnHYmNE+yKKhZpLtKI2RQSC5BuYSziCME
   A==;
X-CSE-ConnectionGUID: Su9CEc23Qh6vYHCuPMncwA==
X-CSE-MsgGUID: ivkRnzquR6uLPyMUlFkTOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11848"; a="83957211"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="83957211"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 08:09:36 -0700
X-CSE-ConnectionGUID: 5gh8bRCET/aoMEJlXsNf9g==
X-CSE-MsgGUID: sTtzaENwT6GEVJT+IabCtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="286880241"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 17 Jul 2026 08:09:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wkkBq-00000000SrS-140S;
	Fri, 17 Jul 2026 15:09:27 +0000
Date: Fri, 17 Jul 2026 23:08:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/28]
 drivers/ufs/host/tc-dwc-g210-pltfrm.c:36:34: warning: unused variable
 'tc_dwc_g210_pltfm_match'
Message-ID: <202607172347.0bKaenbi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Bart,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   ced98912a0d86b6d7c7365664b2df779bf159018
commit: 2d74ff4319d1c8a4254635d7a611562571a8e39f [0/28] UPSTREAM: scsi: ufs: Split the drivers/scsi/ufs directory
config: i386-randconfig-052-20260717 (https://download.01.org/0day-ci/archive/20260717/202607172347.0bKaenbi-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5c0dfced1adc55429e32b1db08570abd3a219d85)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260717/202607172347.0bKaenbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607172347.0bKaenbi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ufs/host/tc-dwc-g210-pltfrm.c:36:34: warning: unused variable 'tc_dwc_g210_pltfm_match' [-Wunused-const-variable]
      36 | static const struct of_device_id tc_dwc_g210_pltfm_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ASYNC_TX_ENABLE_CHANNEL_SWITCH
   Depends on [n]: DMADEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_DMA_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for ARCH_HAS_NONLEAF_PMD_YOUNG
   Depends on [n]: PGTABLE_LEVELS [=2]>2
   Selected by [y]:
   - X86 [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


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
