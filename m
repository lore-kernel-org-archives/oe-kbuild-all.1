Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A02B1D61AC
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Jan 2025 14:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735915463; cv=none; b=IHQvzCvR2ttM4hoClgwPQPtsUNN6OqFKU0qDUp001u2ZPrSJC13AzcZJagxAjpWLvYjHnEG6OKcMM2y3WPjyAqK2jRt4CtG8eTZKaV97tZz2ZqJNmHX1bTyGlr21ILfQ6TQizpVMx5f2nRy5lmXCwQwmWwn9NMSN0MG/EgqGpgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735915463; c=relaxed/simple;
	bh=5Pfhve4AEREoMqPXMp6OGuBxMhz/T5F7RSRtCqQJPSM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s9yMk9dtWzpb2PzXhHhuE4Aqh7i+UfZGoJdJcvBFUnPSyz3xGWdm9QuEm15DXZOOy2bvfPg2v0oG6eRwNdiVMaUiUwbxTgYGfdajO7/1MCB509aIySprTHXIT8ih5oIU9e6Bc9hJ6cog3Z6B6ivyQJ66K467PndoyjjK2cpDdaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2hlyDEz; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2hlyDEz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735915460; x=1767451460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5Pfhve4AEREoMqPXMp6OGuBxMhz/T5F7RSRtCqQJPSM=;
  b=F2hlyDEzU2CG5eYGVupfbjOD92NKbQugZcWVQ4+kulCxxsDWBSoJt95m
   hUt4+b4YCvxeO7IInSOlBy8V0mOV//Kz/pamLRA1lCmVWnPz04AJxkYUp
   wKT+CJyq38KzzDoQP6CiI4VldgznbRExnk2NrsAMgmI+TxtQw+72qUFAc
   mqrF0S0HOLIrCOZFjEQD2UisD75CVTd2AX/n56X+JEOS2PoqN5cVllJ5D
   tbNgo/eTjfPtuMHka6wDOtejk1c5X2ZSutp/Xnf6Bnr3MwVoZqoW8XCxl
   vhrRggDEbohR53ThgcUAL/ZFz0uWYN6sH5EMBG4tYCGw2yKiORsLUAo6K
   A==;
X-CSE-ConnectionGUID: mgGi+if6Q5u4Y2sSCp1vGw==
X-CSE-MsgGUID: T41DHMUhQjSFEL4ZaUCK4Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="36388689"
X-IronPort-AV: E=Sophos;i="6.12,286,1728975600"; 
   d="scan'208";a="36388689"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 06:44:19 -0800
X-CSE-ConnectionGUID: WlFBrxtqQ/SVn+qnsIexSA==
X-CSE-MsgGUID: wacTzn3jSWiMrKWDPj1Ulg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="101663248"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 03 Jan 2025 06:44:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTiuN-0009qj-1F;
	Fri, 03 Jan 2025 14:44:15 +0000
Date: Fri, 3 Jan 2025 22:43:28 +0800
From: kernel test robot <lkp@intel.com>
To: Palmer Dabbelt <palmer@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>, Michal Simek <monstr@monstr.eu>
Subject: drivers/pci/controller/pcie-mediatek.c:404:40: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202501032208.DbyYB3ff-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Palmer,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 191d6f91f283dfb007499bb8529d54c3ac434bd7 PCI: Remove PCI_MSI_IRQ_DOMAIN architecture whitelist
date:   5 years ago
config: m68k-randconfig-r121-20241230 (https://download.01.org/0day-ci/archive/20250103/202501032208.DbyYB3ff-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250103/202501032208.DbyYB3ff-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501032208.DbyYB3ff-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-mediatek.c:404:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *address @@     got void [noderef] __iomem * @@
   drivers/pci/controller/pcie-mediatek.c:404:40: sparse:     expected void *address
   drivers/pci/controller/pcie-mediatek.c:404:40: sparse:     got void [noderef] __iomem *
   drivers/pci/controller/pcie-mediatek.c:527:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void *address @@     got void [noderef] __iomem * @@
   drivers/pci/controller/pcie-mediatek.c:527:44: sparse:     expected void *address
   drivers/pci/controller/pcie-mediatek.c:527:44: sparse:     got void [noderef] __iomem *
   drivers/pci/controller/pcie-mediatek.c: note: in included file (through arch/m68k/include/asm/io.h, include/linux/io.h, include/linux/iopoll.h):
   arch/m68k/include/asm/io_no.h:77:24: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:77:24: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:77:24: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:94:17: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:96:17: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:96:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   arch/m68k/include/asm/io_no.h:96:17: sparse:     expected unsigned int volatile
   arch/m68k/include/asm/io_no.h:96:17: sparse:     got restricted __le32 [usertype]
   arch/m68k/include/asm/io_no.h:94:17: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:96:17: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:96:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   arch/m68k/include/asm/io_no.h:96:17: sparse:     expected unsigned int volatile
   arch/m68k/include/asm/io_no.h:96:17: sparse:     got restricted __le32 [usertype]
   arch/m68k/include/asm/io_no.h:94:17: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:96:17: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:96:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   arch/m68k/include/asm/io_no.h:96:17: sparse:     expected unsigned int volatile
   arch/m68k/include/asm/io_no.h:96:17: sparse:     got restricted __le32 [usertype]
   arch/m68k/include/asm/io_no.h:77:24: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:94:17: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:96:17: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:96:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   arch/m68k/include/asm/io_no.h:96:17: sparse:     expected unsigned int volatile
   arch/m68k/include/asm/io_no.h:96:17: sparse:     got restricted __le32 [usertype]
   arch/m68k/include/asm/io_no.h:77:24: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:78:16: sparse: sparse: cast to restricted __le32
   arch/m68k/include/asm/io_no.h:94:17: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:96:17: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:96:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   arch/m68k/include/asm/io_no.h:96:17: sparse:     expected unsigned int volatile
   arch/m68k/include/asm/io_no.h:96:17: sparse:     got restricted __le32 [usertype]
   arch/m68k/include/asm/io_no.h:94:17: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:96:17: sparse: sparse: cast removes address space '__iomem' of expression
   arch/m68k/include/asm/io_no.h:96:17: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int volatile @@     got restricted __le32 [usertype] @@
   arch/m68k/include/asm/io_no.h:96:17: sparse:     expected unsigned int volatile

vim +404 drivers/pci/controller/pcie-mediatek.c

b099631df160ec drivers/pci/host/pcie-mediatek.c Ryder Lee     2017-08-10  397  
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  398  static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
43e6409db64dda drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  399  {
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  400  	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  401  	phys_addr_t addr;
43e6409db64dda drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  402  
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  403  	/* MT2712/MT7622 only support 32-bit MSI addresses */
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04 @404  	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  405  	msg->address_hi = 0;
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  406  	msg->address_lo = lower_32_bits(addr);
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  407  
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  408  	msg->data = data->hwirq;
43e6409db64dda drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  409  
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  410  	dev_dbg(port->pcie->dev, "msi#%d address_hi %#x address_lo %#x\n",
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  411  		(int)data->hwirq, msg->address_hi, msg->address_lo);
43e6409db64dda drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  412  }
43e6409db64dda drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  413  

:::::: The code at line 404 was first introduced by commit
:::::: 42fe2f91b4ebc07c815fb334ea1262e6dc23bf77 PCI: mediatek: Implement chained IRQ handling setup

:::::: TO: Honghui Zhang <honghui.zhang@mediatek.com>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
