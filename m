Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10A83A75A7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 23:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784332778; cv=none; b=IXNKWJKhwn0nEr4vVkDFkEj3th9JSIqDLkxM7ptCIkmQXj1ZfI3NYISoFuSgK/61UKGtkfD4GDzHlw2J89hmtCfRzgqwWFa/tHy/N0H1jeTMCUsiaektBdLFmxfgska9P18O5OUH91vK68teBPxJfvdZ9ckXQcH8CnTHQ2UhjVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784332778; c=relaxed/simple;
	bh=d9wyFpMcEFIBNpItTImFOrICadTLz5bUkOs7/vGzjBU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C7+MJLf9QpDo1f9Ne7U9KS3wJXxpls19DiPByOTZskhVDruPdqmk7akKSsly+6EP0ZQPHp5M+FLBRNJvWQQ1jEbYPVWczFJCmg0JUn4At3diovh4RLwQYupEZNBVWFqf9vpvN1HXaK1bxK7kY46YcAqCM9aAR2jKWf2pMyzf02Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nSL8iKzc; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nSL8iKzc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784332777; x=1815868777;
  h=date:from:to:cc:subject:message-id;
  bh=d9wyFpMcEFIBNpItTImFOrICadTLz5bUkOs7/vGzjBU=;
  b=nSL8iKzcP3NJdszXhuKxDJw81QaSKevsEKNakHkVedfF1nkoz971SD2B
   a6YDOXAF2kv8KAF5+LNY/EZ5YC/EMRScOsDhCdCr1NHdeQTrZb5281lml
   KK1DScysi0ERsWVh1lc+bmPKiwmKsKJY/f3uUbotvzSCYJiHS4GZGAYRY
   QCOMcGABIqip4FCFN8uH90QjMUdf/04cW75+OqEZdZooeh51so0ko7EO4
   iEfH42S1V54AwhfIfoOFamlontkEGqDE2411qwj/xLNFkoV7m+JorQ5kS
   AM8UmpgUtTQ5+GO+NsN4pBM/20uMWXmJDLczn/99wDr0yR1CwVLYtw/oP
   w==;
X-CSE-ConnectionGUID: yW31BLFQQ6Ol5hZC+Njo9Q==
X-CSE-MsgGUID: d3HzzAXCTW2jU1H5EAa2XQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="84887465"
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="84887465"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 16:59:36 -0700
X-CSE-ConnectionGUID: 02XLj403QXeBLA/faY49wg==
X-CSE-MsgGUID: RkZQwDXnRUON2re0Qnw5FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,170,1779174000"; 
   d="scan'208";a="261881978"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jul 2026 16:59:34 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wksSm-00000000TGe-27rD;
	Fri, 17 Jul 2026 23:59:29 +0000
Date: Sat, 18 Jul 2026 07:58:24 +0800
From: kernel test robot <lkp@intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Alex Deucher <alexander.deucher@amd.com>
Subject: [linux-next:master 5823/6789]
 drivers/gpu/drm/radeon/radeon_bios.c:614:12: warning:
 'radeon_acpi_vfct_match' defined but not used
Message-ID: <202607180712.nxVJeXl9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
commit: 33a18ecd2fbf6bcbf803836e94eb31c26f4c7f41 [5823/6789] drm/radeon: Fix VFCT bus number matching with soft filter
config: openrisc-allmodconfig (https://download.01.org/0day-ci/archive/20260718/202607180712.nxVJeXl9-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180712.nxVJeXl9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180712.nxVJeXl9-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/radeon/radeon_bios.c:614:12: warning: 'radeon_acpi_vfct_match' defined but not used [-Wunused-function]
     614 | static int radeon_acpi_vfct_match(struct radeon_device *rdev,
         |            ^~~~~~~~~~~~~~~~~~~~~~


vim +/radeon_acpi_vfct_match +614 drivers/gpu/drm/radeon/radeon_bios.c

   598	
   599	/**
   600	 * radeon_acpi_vfct_match() - Check if a VFCT entry matches the device
   601	 * @rdev: Radeon device
   602	 * @vhdr: VFCT image header to check
   603	 *
   604	 * VFCT entries contain the PCI bus number as recorded during BIOS POST.
   605	 * On systems where the kernel renumbers PCI buses (e.g. pci=realloc or
   606	 * resource conflicts), the runtime bus number may differ from the POST
   607	 * value.  Match by device identity (vendor + device + function) and use
   608	 * the bus number as a preference: exact bus match is preferred, but when
   609	 * the bus numbers disagree we accept the entry if the device identity
   610	 * matches.
   611	 *
   612	 * Returns: 0 on match, -ENODEV on no match
   613	 */
 > 614	static int radeon_acpi_vfct_match(struct radeon_device *rdev,
   615					  VFCT_IMAGE_HEADER *vhdr)
   616	{
   617		/* Vendor and device IDs must always match */
   618		if (vhdr->VendorID != rdev->pdev->vendor ||
   619		    vhdr->DeviceID != rdev->pdev->device)
   620			return -ENODEV;
   621	
   622		if (vhdr->PCIDevice != PCI_SLOT(rdev->pdev->devfn) ||
   623		    vhdr->PCIFunction != PCI_FUNC(rdev->pdev->devfn))
   624			return -ENODEV;
   625	
   626		/* Exact bus number match - preferred */
   627		if (vhdr->PCIBus == rdev->pdev->bus->number)
   628			return 0;
   629	
   630		/* Bus mismatch but device identity matches (PCI renumbering case) */
   631		dev_notice(&rdev->pdev->dev,
   632			   "VFCT bus number mismatch: table %u != runtime %u, matching by device identity (vendor 0x%04x device 0x%04x)\n",
   633			   vhdr->PCIBus, rdev->pdev->bus->number,
   634			   rdev->pdev->vendor, rdev->pdev->device);
   635		return 0;
   636	}
   637	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
