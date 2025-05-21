Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A748923D283
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 09:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747819145; cv=none; b=kZw48j/oDRkvv8rv5Fp8dFnFBkNZQIZslnyV91KvZnN3Hey9e5GXAgW9XiAuLSo+tf9Fk4hapHAS6YdB022Q2HfkyhnLG2nNEKaLp0FENEFkJ40A2H29L5Mo3ZbO62CLBRB1Jp4QB5b7USbdKpOAV8+3lvmT7uz/R1V3qAV6A1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747819145; c=relaxed/simple;
	bh=67AGhiuCFow6tPvwmpbcSiH9XVlmvzagsSgUgatScK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jw39DYDFDlPxLCBnn6xJxc1mqb4+8oqbH9dvYrDop6fr+DwUcH2wxegsryyDTecnIOI4KD60oQsvxZQ3R1Hxg3sQ3Gt5GsWFd1ByQPbYFPFoovDYDy9dZM0FbyQAFh0QJseKBPE2Xq7WoCC9N6peRHXHZLjjkvbwoa1z0nNpDLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mp4oxK48; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mp4oxK48"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747819144; x=1779355144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=67AGhiuCFow6tPvwmpbcSiH9XVlmvzagsSgUgatScK4=;
  b=Mp4oxK48EdNv9eNQ4DF4Vgi12O+CSFORvOBRMqqdZ1m5mWe5DfghVv4W
   CLgQqfB1M0tC8XLf8W+c8OTbRQZu6VcyZsO9PJNx4UvSqndFR7O8cKbX5
   4RRIwUNrhEbgZ8jU/BzvG9tezt0lJg0mBWylsIK3VfezJf2oN2JzTyF4p
   AztVZasCG5eSXDwvwlf6eZmtXsHzL7eliUR3Jy02XmkuctxCMRLpZCFci
   p+9G6dM48KxPgRGv5lTuSZaVMeUISbO2l/5R3hbB5rFGhM5fnw4FJF/sV
   5vPz+8gZvcbhWGyUX6YRljY0MpBE/z2WCZHZXmekI58Zal+p7gtdVfKMH
   Q==;
X-CSE-ConnectionGUID: 9fc7lzCeQS+U43xP2Hko8Q==
X-CSE-MsgGUID: OcGtN6ezQTC6ME35v5JBVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49047447"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="49047447"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 02:19:03 -0700
X-CSE-ConnectionGUID: W4aR+cMLRJ+ZAICSHlGH7w==
X-CSE-MsgGUID: +RA7CrVPTHaM5MoImCKbrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="143975861"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 May 2025 02:19:02 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHfbI-000155-0a;
	Wed, 21 May 2025 09:19:00 +0000
Date: Wed, 21 May 2025 17:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_sbi_sse_v3 47/57] drivers/acpi/riscv/rimt.c:487:24:
 warning: variable 'fwspec' set but not used
Message-ID: <202505211726.mUHsNUtd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_sbi_sse_v3
head:   1cbb58375d3584633396096f9eded7943919f8cf
commit: 35c5fca17e5e01f813baf30d83ac0e906b88765d [47/57] ACPI: RISC-V: Add support for RIMT
config: riscv-randconfig-2004-20250521 (https://download.01.org/0day-ci/archive/20250521/202505211726.mUHsNUtd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505211726.mUHsNUtd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211726.mUHsNUtd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/riscv/rimt.c: In function 'rimt_iommu_configure_id':
>> drivers/acpi/riscv/rimt.c:487:24: warning: variable 'fwspec' set but not used [-Wunused-but-set-variable]
      struct iommu_fwspec *fwspec;
                           ^~~~~~


vim +/fwspec +487 drivers/acpi/riscv/rimt.c

   472	
   473	/**
   474	 * rimt_iommu_configure_id - Set-up IOMMU configuration for a device.
   475	 *
   476	 * @dev: device to configure
   477	 * @id_in: optional input id const value pointer
   478	 *
   479	 * Returns: 0 on success, <0 on failure
   480	 */
   481	int rimt_iommu_configure_id(struct device *dev, const u32 *id_in)
   482	{
   483		struct acpi_rimt_node *node;
   484		int err = -ENODEV;
   485	
   486		if (dev_is_pci(dev)) {
 > 487			struct iommu_fwspec *fwspec;
   488			struct pci_bus *bus = to_pci_dev(dev)->bus;
   489			struct rimt_pci_alias_info info = { .dev = dev };
   490	
   491			node = rimt_scan_node(ACPI_RIMT_NODE_TYPE_PCIE_ROOT_COMPLEX, &bus->dev);
   492			if (!node)
   493				return -ENODEV;
   494	
   495			info.node = node;
   496			err = pci_for_each_dma_alias(to_pci_dev(dev),
   497						     rimt_pci_iommu_init, &info);
   498	
   499			fwspec = dev_iommu_fwspec_get(dev);
   500		} else {
   501			node = rimt_scan_node(ACPI_RIMT_NODE_TYPE_PLAT_DEVICE, dev);
   502			if (!node)
   503				return -ENODEV;
   504	
   505			err = id_in ? rimt_plat_iommu_map_id(dev, node, id_in) :
   506				      rimt_plat_iommu_map(dev, node);
   507		}
   508	
   509		return err;
   510	}
   511	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
