Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49746208C7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Oct 2023 19:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gdty3bJx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697053915; x=1728589915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K55L4tJbHN93cKRt7fHalGKnxFZ4BSmZmywuVimPaIs=;
  b=gdty3bJxtI/pwssBfztdZwau4vBwQQIYQLJbj8/It/W+c1hhrFIThPaJ
   A4NPbSoFbHkKA8I9NxH4WcCGrUS1n1sHa7iCu0pWtzUBTM0TK2l1zg0HK
   poqS765NHTTGP6cc3e656ljRZmaDqJbAH/2elTClg7YrTpw91akZkt7Pj
   EfVEYoyTtkeh94fbiY5g9hfoieRybfYSmT9/lUS3McGzX1jtUw0cgfQ7/
   jSqy0F1GtSWmBYZGgew4ZcMbpPPoQobhJ4hkqYTiLCVhob2ryr9wOM02q
   BozmPryKFs+FKSLcaoWyuGbTh2s5C8bFvrI0iNH2Ro122XuTEC24uJlUS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="6310413"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="6310413"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 12:51:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10860"; a="870278523"
X-IronPort-AV: E=Sophos;i="6.03,217,1694761200"; 
   d="scan'208";a="870278523"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 11 Oct 2023 12:51:48 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqfFC-0002en-2K;
	Wed, 11 Oct 2023 19:51:46 +0000
Date: Thu, 12 Oct 2023 03:51:23 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>, Jianmin Lv <lvjianmin@loongson.cn>
Subject: drivers/pci/controller/pcie-mediatek.c:400:40: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202310120352.9mcOljlX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c8b86a3799f7e5be903c3f49fcdaee29fd385b5
commit: 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb LoongArch: Add PCI controller support
date:   1 year, 2 months ago
config: loongarch-randconfig-r122-20230906 (https://download.01.org/0day-ci/archive/20231012/202310120352.9mcOljlX-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231012/202310120352.9mcOljlX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310120352.9mcOljlX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/pcie-mediatek.c:400:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile *address @@     got void [noderef] __iomem * @@
   drivers/pci/controller/pcie-mediatek.c:400:40: sparse:     expected void volatile *address
   drivers/pci/controller/pcie-mediatek.c:400:40: sparse:     got void [noderef] __iomem *
   drivers/pci/controller/pcie-mediatek.c:523:44: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile *address @@     got void [noderef] __iomem * @@
   drivers/pci/controller/pcie-mediatek.c:523:44: sparse:     expected void volatile *address
   drivers/pci/controller/pcie-mediatek.c:523:44: sparse:     got void [noderef] __iomem *
--
   drivers/uio/uio_aec.c:44:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *int_flag @@     got void * @@
   drivers/uio/uio_aec.c:44:49: sparse:     expected void [noderef] __iomem *int_flag
   drivers/uio/uio_aec.c:44:49: sparse:     got void *
>> drivers/uio/uio_aec.c:50:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:50:49: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:50:49: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:88:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *priv @@     got void [noderef] __iomem * @@
   drivers/uio/uio_aec.c:88:20: sparse:     expected void *priv
   drivers/uio/uio_aec.c:88:20: sparse:     got void [noderef] __iomem *
>> drivers/uio/uio_aec.c:104:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:104:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:104:42: sparse:     got void *
   drivers/uio/uio_aec.c:105:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:105:43: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:105:43: sparse:     got void *
   drivers/uio/uio_aec.c:106:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:106:34: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:106:34: sparse:     got void *
   drivers/uio/uio_aec.c:115:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void *priv @@
   drivers/uio/uio_aec.c:115:31: sparse:     expected void [noderef] __iomem *
   drivers/uio/uio_aec.c:115:31: sparse:     got void *priv
   drivers/uio/uio_aec.c:128:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:128:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:128:42: sparse:     got void *
   drivers/uio/uio_aec.c:129:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:129:43: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:129:43: sparse:     got void *
   drivers/uio/uio_aec.c:131:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/uio/uio_aec.c:131:28: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:131:28: sparse:     got void *
   drivers/uio/uio_aec.c:136:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void *priv @@
   drivers/uio/uio_aec.c:136:31: sparse:     expected void [noderef] __iomem *
   drivers/uio/uio_aec.c:136:31: sparse:     got void *priv

vim +400 drivers/pci/controller/pcie-mediatek.c

b099631df160ec6 drivers/pci/host/pcie-mediatek.c Ryder Lee     2017-08-10  393  
42fe2f91b4ebc07 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  394  static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
43e6409db64ddab drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  395  {
42fe2f91b4ebc07 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  396  	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
42fe2f91b4ebc07 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  397  	phys_addr_t addr;
43e6409db64ddab drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  398  
42fe2f91b4ebc07 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  399  	/* MT2712/MT7622 only support 32-bit MSI addresses */
42fe2f91b4ebc07 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04 @400  	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
42fe2f91b4ebc07 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  401  	msg->address_hi = 0;
42fe2f91b4ebc07 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  402  	msg->address_lo = lower_32_bits(addr);
42fe2f91b4ebc07 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  403  
42fe2f91b4ebc07 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  404  	msg->data = data->hwirq;
43e6409db64ddab drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  405  
42fe2f91b4ebc07 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  406  	dev_dbg(port->pcie->dev, "msi#%d address_hi %#x address_lo %#x\n",
42fe2f91b4ebc07 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  407  		(int)data->hwirq, msg->address_hi, msg->address_lo);
43e6409db64ddab drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  408  }
43e6409db64ddab drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  409  

:::::: The code at line 400 was first introduced by commit
:::::: 42fe2f91b4ebc07c815fb334ea1262e6dc23bf77 PCI: mediatek: Implement chained IRQ handling setup

:::::: TO: Honghui Zhang <honghui.zhang@mediatek.com>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
