Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E083D8914
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Sep 2026 03:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789702967; cv=none; b=OuyuL1w42uNatdruxpbjUW+WhEPBQLAuj4LsRoppjM//0YsHEsP+AyYn8M8U8d3Gkm2hmlJmXXYrIK6Q/cx22VEMtOmVFbUFFHK86KSq5QUjuT9GN0lnKx/gfvov12Mc37L35rPyAD4wfJDm8FhjmGWkdfIBvrbtdZltud+MPeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789702967; c=relaxed/simple;
	bh=/wD99VtDX7olsqo6g7NeBZMWmR3l9dtJvOyVJ7e6brU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HFRnlorb2Oz3zPh4v38FpxfagAqGCArjBPSg2RkFXuvuElHA6KaQaomsP4SmDazCY77DMA4Q1KUXdabM8Sk5e5iAhvS13N1V4cSsIPYyG7p6dnpDfJiM0TZFJi02eJa6EsTUWeyCa3A/xNZfoLChcTiFh6SNJ8dJKMjQvYRY34g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOr0WF41; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOr0WF41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789702965; x=1821238965;
  h=date:from:to:cc:subject:message-id;
  bh=/wD99VtDX7olsqo6g7NeBZMWmR3l9dtJvOyVJ7e6brU=;
  b=fOr0WF41bsxpyIuCLeSGRr04XyrIuxIK1sgnBqeeidHcRIjQRfjBc7zM
   Qq+z3wxiM7ybxpCEokcDLWVWzIkJLdsDI78tHDUUdUTEeAe6YRAbWAc/Y
   dSdjnkfUWwAFfYhO6ab8LGOQbre+6w0B6LOxZXaJb2bMjz/EPOX4slp+d
   osruvQ3UlKVTADYhbqMCEoY+v8uRloFUnsntDuR/tuLPjETG/0GWicOay
   Zth9bVmDrkK4W7+skkFBUZiOQsC1TGmUbp2/Lz3QY+LcQULjSji/6wMpT
   kOi2zEnyd1AZpJhgLElaqhhfdkK50MHBy5ajkWSIAAxCpGzrr1oxxaawA
   A==;
X-CSE-ConnectionGUID: RQetHyDOThO9EBjNwIamNg==
X-CSE-MsgGUID: 2YQVusMrTJ2LhvmDiez9BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="94014475"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="94014475"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 20:42:43 -0700
X-CSE-ConnectionGUID: Z/lDqPOvRP6cyAepnoiAtQ==
X-CSE-MsgGUID: FD2+fXFFS4uvLAXU8OyvIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2588338"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 17 Sep 2026 20:42:42 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7PUm-000000000xs-0ht7;
	Fri, 18 Sep 2026 03:42:40 +0000
Date: Fri, 18 Sep 2026 05:41:51 +0200
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:aer_baseline_v1 7/7] drivers/pci/pcie/aer.c:437:3:
 error: expected ')'
Message-ID: <202609180509.UrH3oLIr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/l1k/linux aer_baseline_v1
head:   c03892987cf6c02922172ccd72a517bd7790d3b1
commit: c03892987cf6c02922172ccd72a517bd7790d3b1 [7/7] PCI/AER: Enable baseline capability error reporting
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260918/202609180509.UrH3oLIr-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260918/202609180509.UrH3oLIr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609180509.UrH3oLIr-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/pci/pcie/aer.c:437:3: error: expected ')'
     437 |                 pcie_clear_device_status(dev);
         |                 ^
   drivers/pci/pcie/aer.c:436:5: note: to match this '('
     436 |         if (pcie_aer_is_native(dev)
         |            ^
   1 error generated.


vim +437 drivers/pci/pcie/aer.c

   395	
   396	void pci_aer_init(struct pci_dev *dev)
   397	{
   398		int n;
   399	
   400		if (!pci_is_pcie(dev))
   401			return;
   402	
   403		dev->aer_info = kzalloc_obj(*dev->aer_info);
   404		if (!dev->aer_info)
   405			return;
   406	
   407		ratelimit_state_init(&dev->aer_info->correctable_ratelimit,
   408				     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
   409		ratelimit_state_init(&dev->aer_info->nonfatal_ratelimit,
   410				     DEFAULT_RATELIMIT_INTERVAL, DEFAULT_RATELIMIT_BURST);
   411	
   412		dev->aer_cap = pci_find_ext_capability(dev, PCI_EXT_CAP_ID_ERR);
   413		if (!dev->aer_cap)
   414			goto enable;
   415	
   416		/*
   417		 * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
   418		 * PCI_ERR_COR_MASK, and PCI_ERR_CAP.  Root and Root Complex Event
   419		 * Collectors also implement PCI_ERR_ROOT_COMMAND (PCIe r6.0, sec
   420		 * 7.8.4.9).
   421		 */
   422		n = pcie_cap_has_rtctl(dev) ? 5 : 4;
   423		pci_add_ext_cap_save_buffer(dev, PCI_EXT_CAP_ID_ERR, sizeof(u32) * n);
   424	
   425		/*
   426		 * Advisory Non-Fatal Errors are masked by default (PCIe r7.0, sec
   427		 * 7.8.4.6).
   428		 */
   429		if (pcie_aer_is_native(dev) && dev->devcap & PCI_EXP_DEVCAP_RBER)
   430			pci_clear_and_set_config_dword(dev,
   431						       dev->aer_cap + PCI_ERR_COR_MASK,
   432						       PCI_ERR_COR_ADV_NFAT, 0);
   433	
   434		pci_aer_clear_status(dev);
   435	enable:
   436		if (pcie_aer_is_native(dev)
 > 437			pcie_clear_device_status(dev);
   438	
   439		if (pci_aer_available())
   440			pci_enable_pcie_error_reporting(dev);
   441	
   442		pcie_set_ecrc_checking(dev);
   443	}
   444	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
