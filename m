Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFEA630FAB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Oct 2023 16:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQy3OuhB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697127049; x=1728663049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=40nX164TGqBga2/k6hQQhR+AzhxK2ZPlQ878F4gakVo=;
  b=lQy3OuhBiTmiaApy0vl4XTnPJN5uwIOBBCSNNe1Lq2VBjyXGIdCm9zyY
   bhIruZL225khoXPNmcOXDel3bPqBdSKSF+FW1ilkQmzvrt4wRHA0IIADh
   UBazP5/lRx9KHzE4vl/rtSVe0hwwGmnaEgplm7G440PoyCFcTaYcy/xOR
   icSkcNB8Oq0PoWoMSj3eM37pUJl7z60CG8YuhxG6koEQZFZbS6JKOOTVp
   ler2imKNHP1nZxX3t6+dfy9Bu+yZVsSZoSmlfxsCqZm5RKSsPOPbKHvaW
   eqieTG915WRiLKQRi1rl/KF8TMFMxnKGCAKbKCcQqKeeQYOMvVu4GjsOH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="3564361"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="3564361"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2023 09:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10861"; a="758088079"
X-IronPort-AV: E=Sophos;i="6.03,219,1694761200"; 
   d="scan'208";a="758088079"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 12 Oct 2023 09:10:43 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qqyGn-0003cD-1U;
	Thu, 12 Oct 2023 16:10:41 +0000
Date: Fri, 13 Oct 2023 00:10:31 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	WANG Xuerui <git@xen0n.name>, Jianmin Lv <lvjianmin@loongson.cn>
Subject: drivers/pci/controller/pcie-mediatek.c:400:40: sparse: sparse:
 incorrect type in argument 1 (different address spaces)
Message-ID: <202310130048.TpFzif6q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   401644852d0b2a278811de38081be23f74b5bb04
commit: 57fc7323a8e7c2e7c1d5795ab63cb3ffea3cfdfb LoongArch: Add PCI controller support
date:   1 year, 2 months ago
config: loongarch-randconfig-r122-20230906 (https://download.01.org/0day-ci/archive/20231013/202310130048.TpFzif6q-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231013/202310130048.TpFzif6q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310130048.TpFzif6q-lkp@intel.com/

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

b099631df160ec drivers/pci/host/pcie-mediatek.c Ryder Lee     2017-08-10  393  
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  394  static void mtk_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
43e6409db64dda drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  395  {
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  396  	struct mtk_pcie_port *port = irq_data_get_irq_chip_data(data);
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  397  	phys_addr_t addr;
43e6409db64dda drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  398  
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  399  	/* MT2712/MT7622 only support 32-bit MSI addresses */
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04 @400  	addr = virt_to_phys(port->base + PCIE_MSI_VECTOR);
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  401  	msg->address_hi = 0;
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  402  	msg->address_lo = lower_32_bits(addr);
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  403  
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  404  	msg->data = data->hwirq;
43e6409db64dda drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  405  
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  406  	dev_dbg(port->pcie->dev, "msi#%d address_hi %#x address_lo %#x\n",
42fe2f91b4ebc0 drivers/pci/host/pcie-mediatek.c Honghui Zhang 2018-05-04  407  		(int)data->hwirq, msg->address_hi, msg->address_lo);
43e6409db64dda drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  408  }
43e6409db64dda drivers/pci/host/pcie-mediatek.c Honghui Zhang 2017-08-14  409  

:::::: The code at line 400 was first introduced by commit
:::::: 42fe2f91b4ebc07c815fb334ea1262e6dc23bf77 PCI: mediatek: Implement chained IRQ handling setup

:::::: TO: Honghui Zhang <honghui.zhang@mediatek.com>
:::::: CC: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
