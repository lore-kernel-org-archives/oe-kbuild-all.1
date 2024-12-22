Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880EF646
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 07:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734851858; cv=none; b=rHnRPDF7CHb/q4IfFBVSHvDAoINwiSvv9L4E+tMqAGJEW/qKBoyuWYtOsurxRYAuS14qrd4v2AMudE2Cm3I779qoMDbNe3xFu0T1uZE7/GySxkGwGtYsuRBy7vpVqFAuDwNYTsdTUAFJqEveEIebqid7isSUhY0tTPMzQxP6tt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734851858; c=relaxed/simple;
	bh=0EBbSAm0ag8bxpIDPNquhMCQy6tNCidwuknbh/tnhIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L+zprSGnyTU1ii12hbMsOi5RXQ4Zr1bjI0/ItRrSdex/wPKqIu8KvSG5ZgAfh+7FZ8lh51euvv/qRaBaEYYWnYUTJmlTfKpk6/YM4cnv2AJnn0svbtaWKd76kNvUufzhup13xoXhoo3R7XLmmcJ03lkEkEYPB97H8hLYg/tOB98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUi1Iz7J; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUi1Iz7J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734851856; x=1766387856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0EBbSAm0ag8bxpIDPNquhMCQy6tNCidwuknbh/tnhIY=;
  b=iUi1Iz7Jwhq2qvWYybTbgE+2/FbgXLoHrAWjLHKtmBYayGIZ5J0KBLPc
   u47tmBTXfvQzdlcKxrWdIHd+BpOFLW4E+TZeMnXIqlJJxzZ+w1N+yGWuN
   esYOgSQ0CPjo6odDC/R12wYvsxSd4EztW3XfXbtbRoOB8Gw2G7ljy3w+J
   Xzy69bD/beXFx2uZKL5KFVUrE54VEyO5s+BrR4CYHjObLHodAREM2nE2i
   vfCBiNx/gt1v1beAR+bIGjyGk0D1YpRclvJtMzHOk9tw1/LFd8ogBseta
   8Jw3mpsTs0Ag4OQyJ3ueGSvMxcWkh/j4d6ldwVgBRCSzcDlqFuRAzjrID
   Q==;
X-CSE-ConnectionGUID: p9NF8rqrTn+nZtafe7219A==
X-CSE-MsgGUID: LOvbDFntRz+34LnJhp/hyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="38188624"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="38188624"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 23:17:35 -0800
X-CSE-ConnectionGUID: QOPeNgMzScW6ldNUNfQsQg==
X-CSE-MsgGUID: lAddO/piS565MryaKPq6JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="99304113"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 21 Dec 2024 23:17:34 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPGDU-0002mV-2V;
	Sun, 22 Dec 2024 07:17:32 +0000
Date: Sun, 22 Dec 2024 15:16:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_defconfig_v1 36/59] drivers/acpi/riscv/rimt.c:418:12:
 warning: 'rimt_pci_iommu_init' defined but not used
Message-ID: <202412221512.lK9cbd2B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_defconfig_v1
head:   4fd509619498a267ba245e95fefba09eef65a97e
commit: 92e54add84ea71310bc3c9e2afa25b7721b18c54 [36/59] RISC-V: IOMMU: Add ACPI support using RIMT
config: riscv-randconfig-r063-20241222 (https://download.01.org/0day-ci/archive/20241222/202412221512.lK9cbd2B-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241222/202412221512.lK9cbd2B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412221512.lK9cbd2B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/acpi/riscv/rimt.c:435:5: error: conflicting types for 'rimt_iommu_register'; have 'int(struct device *)'
     435 | int rimt_iommu_register(struct device *dev)
         |     ^~~~~~~~~~~~~~~~~~~
   In file included from drivers/acpi/riscv/rimt.c:9:
   include/linux/acpi_rimt.h:10:5: note: previous declaration of 'rimt_iommu_register' with type 'int(struct device *, const struct iommu_ops *)'
      10 | int rimt_iommu_register(struct device *dev, const struct iommu_ops *ops);
         |     ^~~~~~~~~~~~~~~~~~~
>> drivers/acpi/riscv/rimt.c:418:12: warning: 'rimt_pci_iommu_init' defined but not used [-Wunused-function]
     418 | static int rimt_pci_iommu_init(struct pci_dev *pdev, u16 alias, void *data)
         |            ^~~~~~~~~~~~~~~~~~~
>> drivers/acpi/riscv/rimt.c:399:31: warning: 'rimt_node_map_platform_id' defined but not used [-Wunused-function]
     399 | static struct acpi_rimt_node *rimt_node_map_platform_id(struct acpi_rimt_node *node, u32 *id_out,
         |                               ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/rimt_pci_iommu_init +418 drivers/acpi/riscv/rimt.c

   398	
 > 399	static struct acpi_rimt_node *rimt_node_map_platform_id(struct acpi_rimt_node *node, u32 *id_out,
   400								u8 type_mask, int index)
   401	{
   402		struct acpi_rimt_node *parent;
   403		u32 id;
   404	
   405		parent = rimt_node_get_id(node, &id, index);
   406		if (!parent)
   407			return NULL;
   408	
   409		if (!(RIMT_TYPE_MASK(parent->type) & type_mask))
   410			parent = rimt_node_map_id(parent, id, id_out, type_mask);
   411		else
   412			if (id_out)
   413				*id_out = id;
   414	
   415		return parent;
   416	}
   417	
 > 418	static int rimt_pci_iommu_init(struct pci_dev *pdev, u16 alias, void *data)
   419	{
   420		struct rimt_pci_alias_info *info = data;
   421		struct acpi_rimt_node *parent;
   422		u32 streamid;
   423	
   424		parent = rimt_node_map_id(info->node, alias, &streamid, RIMT_IOMMU_TYPE);
   425		return rimt_iommu_xlate(info->dev, parent, streamid);
   426	}
   427	
   428	/*
   429	 * RISC-V supports IOMMU as a PCI device or a platform device.
   430	 * When it is a platform device, there should be a namespace device as
   431	 * well along with RIMT. To create the link between RIMT information and
   432	 * the platform device, the IOMMU driver should register itself with the
   433	 * RIMT module. This is true for PCI based IOMMU as well.
   434	 */
 > 435	int rimt_iommu_register(struct device *dev)
   436	{
   437		struct fwnode_handle *rimt_fwnode;
   438		struct acpi_rimt_node *node;
   439	
   440		node = rimt_scan_node(ACPI_RIMT_NODE_IOMMU, rimt_match_node_callback, dev);
   441		if (!node) {
   442			pr_err("Could not find IOMMU node in RIMT\n");
   443			return -ENODEV;
   444		}
   445	
   446		if (dev_is_pci(dev)) {
   447			rimt_fwnode = acpi_alloc_fwnode_static();
   448			if (!rimt_fwnode)
   449				return -ENOMEM;
   450	
   451			rimt_fwnode->dev = dev;
   452			if (!dev->fwnode)
   453				dev->fwnode = rimt_fwnode;
   454	
   455			rimt_set_fwnode(node, rimt_fwnode);
   456		} else {
   457			rimt_set_fwnode(node, dev->fwnode);
   458		}
   459	
   460		return 0;
   461	}
   462	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
