Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17A413D518
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Nov 2024 21:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732742527; cv=none; b=EBJ5iBb8brGCo48szWkOOxAGTxfOL6PtMS9pfPs6lqibPMrtAHtzfRGOK8owSJNAf/Ov8s1XOmOhUAA5QHsXkQFUvd25OjoHd5TT6nqNQu2HHE1xTlOuIhjnjmG5zLo5Zml/AfciYMyNKQuU0LHcvhe/CE+eQUihlPBMEmud4FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732742527; c=relaxed/simple;
	bh=bBS5v/8ewHyUPef3WKGuCStcilphtiqRn+EutOBZGX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qsTFv6QqhOh8uxAwzIOhy8LeFgGnXNkVXOkPiKrmOuyRPv0CmTZm9jwQtjI4lzyaBn9pf+AjHmi/FSMQXx83Pv3YaDeXrhHuVygfO9wJEYAYMoVfq9wrjWCABVe6woV9ILoR6SsUE9WfrNdPrivHVWrq3sRaN91xUrGgd0qAfWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fmmvk38t; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fmmvk38t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732742526; x=1764278526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bBS5v/8ewHyUPef3WKGuCStcilphtiqRn+EutOBZGX8=;
  b=Fmmvk38tiXQvKGMOxClPO7QutSRjkmP/zVb7GbS6VDW9USLjdVvcbNVN
   u5OPw+Kyep9sc+qMupqoV/8FvEkTNBROGKS3aPlptw+s2wuQohag4zLGR
   CSz3qrv/kyRuCm04aEzgnd/4Gp3fG1/BoK50LA2H2jhhkg2OIMFdTdqny
   ibjFnwpLF1ar/o+YNJtDilD0AR6zHiJjx8UEsuM9QUYNkbcA8j9fCZxDA
   8r2VGtx2uLvFVqO4Gu7XMDLyTsqhoX3AoSOsd6b3hv+LpqZHft/gjHUix
   7FEQFUIgS9KDnRr76jGMNaX8Y9pZ+O/q/Njb2GLghZMShoJmSUch91ON7
   g==;
X-CSE-ConnectionGUID: l16W/GmyQFuIC+u/3aDhAQ==
X-CSE-MsgGUID: EqjAOSNIQd60SxH/wVO4DQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="33116798"
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="33116798"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2024 13:22:05 -0800
X-CSE-ConnectionGUID: 2k4ui6DFSzGINGODs34sFQ==
X-CSE-MsgGUID: Y2p+NwhLSOK2f8eplPzlOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,190,1728975600"; 
   d="scan'208";a="92886293"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Nov 2024 13:22:04 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGPU1-0008N5-2E;
	Wed, 27 Nov 2024 21:22:01 +0000
Date: Thu, 28 Nov 2024 05:21:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 264/377]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:600:45: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202411280514.BilUPotG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   0a51d2d4527b43c5e467ffa6897deefeaf499358
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [264/377] PCI: endpoint: Support NTB transfer between RC and EP
config: x86_64-randconfig-r131-20241122 (https://download.01.org/0day-ci/archive/20241128/202411280514.BilUPotG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411280514.BilUPotG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411280514.BilUPotG-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/endpoint/functions/pci-epf-vntb.c:542:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *mw_addr @@     got void * @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:542:17: sparse:     expected void [noderef] __iomem *mw_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:542:17: sparse:     got void *
   drivers/pci/endpoint/functions/pci-epf-vntb.c:574:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *epf_db @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:574:41: sparse:     expected void *addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:574:41: sparse:     got void [noderef] __iomem *epf_db
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:600:45: sparse: sparse: Using plain integer as NULL pointer
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:985:16: sparse: sparse: symbol 'vpci_ops' was not declared. Should it be static?
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1089:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1089:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1089:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1100:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1100:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1100:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1111:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1111:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1111:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1123:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1123:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1123:33: sparse:     got struct epf_ntb_ctrl *reg

vim +600 drivers/pci/endpoint/functions/pci-epf-vntb.c

   580	
   581	/**
   582	 * epf_ntb_mw_bar_init() - Configure Memory window BARs
   583	 * @ntb: NTB device that facilitates communication between HOST and vHOST
   584	 *
   585	 */
   586	static int epf_ntb_mw_bar_init(struct epf_ntb *ntb)
   587	{
   588		int ret = 0;
   589		int i;
   590		u64 size;
   591		enum pci_barno barno;
   592		struct device *dev = &ntb->epf->dev;
   593	
   594		for (i = 0; i < ntb->num_mws; i++) {
   595			size = ntb->mws_size[i];
   596			barno = ntb->epf_ntb_bar[BAR_MW0 + i];
   597	
   598			ntb->epf->bar[barno].barno = barno;
   599			ntb->epf->bar[barno].size = size;
 > 600			ntb->epf->bar[barno].addr = 0;
   601			ntb->epf->bar[barno].phys_addr = 0;
   602			ntb->epf->bar[barno].flags |= upper_32_bits(size) ?
   603					PCI_BASE_ADDRESS_MEM_TYPE_64 :
   604					PCI_BASE_ADDRESS_MEM_TYPE_32;
   605	
   606			ret = pci_epc_set_bar(ntb->epf->epc,
   607					      ntb->epf->func_no,
   608					      ntb->epf->vfunc_no,
   609					      &ntb->epf->bar[barno]);
   610			if (ret) {
   611				dev_err(dev, "MW set failed\n");
   612				goto err_alloc_mem;
   613			}
   614	
   615			/* Allocate EPC outbound memory windows to vpci vntb device */
   616			ntb->vpci_mw_addr[i] = pci_epc_mem_alloc_addr(ntb->epf->epc,
   617								      &ntb->vpci_mw_phy[i],
   618								      size);
   619			if (!ntb->vpci_mw_addr[i]) {
   620				dev_err(dev, "Failed to allocate source address\n");
   621				goto err_alloc_mem;
   622			}
   623		}
   624	
   625		return ret;
   626	err_alloc_mem:
   627		return ret;
   628	}
   629	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
