Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0132D2389
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 13:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762262721; cv=none; b=Y42MUpFztWKwUT6P0sJDgBEWh4wwYqhqHYhdfPsfwtzEuruS9iVtWVs4hMU8nNDU2Fcfla2R9BVHtIw0UsTfeoEPDN2gvkLM68tpXJFj/nQuf9JyMRwqsb7W8kDi9SNOX/wSQOPEXwWEYQUiF02dK3VGPYNDx4mc0KDx8mPsjXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762262721; c=relaxed/simple;
	bh=utWOxHeZx6kNF+Qm9dmFtj26fiiv+YrLuX+S0IZZVT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNQJNc6LUGr5vzrF2y4Ic5TOvNjrY1qQ90ZTlc9qwsFwW1cBJDtvkGKNTh5a1A8MHGSqxo+TrH82AZYAnBR2j3UnJjHAmvb9nzwup2OZCuenrupTSQIZSigNTUbvUFL+dOIpKdjPNfZ8NbpsINLviAdpCfZH0qa0U8E4er7wnmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndjD3Qgb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndjD3Qgb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762262720; x=1793798720;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=utWOxHeZx6kNF+Qm9dmFtj26fiiv+YrLuX+S0IZZVT8=;
  b=ndjD3Qgb0teLQG4QlK+eYtJyElSFfNwg26RyZPs/NgykK8SXMgxJbKHc
   Fc3KhVIjGnTwSbc6Yfgx5kRK10ra/mtGXRpBRmg5vjxWy1shWzp3o59hz
   9AxxVld8vgosLHhar0A7wWCgVFvfRLbznvCMLd7OxnOkLHMcD3DYGHmCE
   tB0n9XDCP49N24aLWrn245FiC+zrj8B5VcoE/e72kyj1v0o0dnUvh4lQd
   bDXnqlHKswrjtEIKr+GNluBtFRznpU3/syNzsek0eE3W3jI7Zz1VyHEBg
   IL1eesiDH/R3peLAHKO2xGwR7B021ktfAWHEe4dlAw3EQMDjj4iI+0Dew
   g==;
X-CSE-ConnectionGUID: aET7CIv9R7GsxZmo95WUZw==
X-CSE-MsgGUID: XB5R0qZCStOVehoMSgJHFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="68009829"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="68009829"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 05:25:19 -0800
X-CSE-ConnectionGUID: F7fGfJ3+TOu9Xf+f2DTrqA==
X-CSE-MsgGUID: 9mN7fRTTSjeceLD3fYsTbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="186399849"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 04 Nov 2025 05:25:19 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGH1z-000RQq-1Q;
	Tue, 04 Nov 2025 13:25:13 +0000
Date: Tue, 4 Nov 2025 21:24:21 +0800
From: kernel test robot <lkp@intel.com>
To: Dan Williams <dan.j.williams@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 9/9] PCI/TSM: Report active IDE streams
Message-ID: <202511042139.GgeNKhRY-lkp@intel.com>
References: <20251031212902.2256310-10-dan.j.williams@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251031212902.2256310-10-dan.j.williams@intel.com>

Hi Dan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 211ddde0823f1442e4ad052a2f30f050145ccada]

url:    https://github.com/intel-lab-lkp/linux/commits/Dan-Williams/coco-tsm-Introduce-a-core-device-for-TEE-Security-Managers/20251101-053254
base:   211ddde0823f1442e4ad052a2f30f050145ccada
patch link:    https://lore.kernel.org/r/20251031212902.2256310-10-dan.j.williams%40intel.com
patch subject: [PATCH v8 9/9] PCI/TSM: Report active IDE streams
config: sparc-randconfig-r064-20251104 (https://download.01.org/0day-ci/archive/20251104/202511042139.GgeNKhRY-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511042139.GgeNKhRY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511042139.GgeNKhRY-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc-linux-ld: drivers/pci/ide.o: in function `pci_ide_stream_release':
>> drivers/pci/ide.c:266:(.text+0x498): undefined reference to `tsm_ide_stream_unregister'
   sparc-linux-ld: drivers/pci/tsm.o: in function `connect_store':
   drivers/pci/tsm.c:256:(.text+0xbdc): undefined reference to `find_tsm_dev'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for TSM
   Depends on [n]: VIRT_DRIVERS [=n]
   Selected by [y]:
   - PCI_TSM [=y] && PCI [=y]


vim +266 drivers/pci/ide.c

   242	
   243	/**
   244	 * pci_ide_stream_release() - unwind and release an @ide context
   245	 * @ide: partially or fully registered IDE settings descriptor
   246	 *
   247	 * In support of automatic cleanup of IDE setup routines perform IDE
   248	 * teardown in expected reverse order of setup and with respect to which
   249	 * aspects of IDE setup have successfully completed.
   250	 *
   251	 * Be careful that setup order mirrors this shutdown order. Otherwise,
   252	 * open code releasing the IDE context.
   253	 */
   254	void pci_ide_stream_release(struct pci_ide *ide)
   255	{
   256		struct pci_dev *pdev = ide->pdev;
   257		struct pci_dev *rp = pcie_find_root_port(pdev);
   258	
   259		if (ide->partner[PCI_IDE_RP].enable)
   260			pci_ide_stream_disable(rp, ide);
   261	
   262		if (ide->partner[PCI_IDE_EP].enable)
   263			pci_ide_stream_disable(pdev, ide);
   264	
   265		if (ide->tsm_dev)
 > 266			tsm_ide_stream_unregister(ide);
   267	
   268		if (ide->partner[PCI_IDE_RP].setup)
   269			pci_ide_stream_teardown(rp, ide);
   270	
   271		if (ide->partner[PCI_IDE_EP].setup)
   272			pci_ide_stream_teardown(pdev, ide);
   273	
   274		if (ide->name)
   275			pci_ide_stream_unregister(ide);
   276	
   277		pci_ide_stream_free(ide);
   278	}
   279	EXPORT_SYMBOL_GPL(pci_ide_stream_release);
   280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
