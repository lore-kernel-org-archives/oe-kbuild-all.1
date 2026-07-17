Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A7E3803DC
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jul 2026 18:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784314633; cv=none; b=JPWqG89qCnfB8vWSrzxo+znhQmbdRtp9JYhVCVMsCRszs2Zb8c3bSQXkxHz3sx8BQrQxntUjAI4pO2CoqK6LHKvpDppw5dlPrWdQRHci3r3uunWL5l6mSqYuNODkrwzG25JT1U/TIWEsrzXEILaxkmUeDF9ukAjWxY/7gLr09gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784314633; c=relaxed/simple;
	bh=GZlxpC8PtGDtUhHe8FXmmzK+3/IEnWaj8ifu/bGTSrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n8ow8BpLeqxuSefjz6J9pfjIO7aRK8lTA9lEtyutqtgkcMt8sx0thJzEqhpS5ZR3NNIBdvg6aDzB/YWXE9Xga8M9B8TkYJdYrYr207y2XEyaWppSXqO86PEwGRjoOI3WM9qQa11aGcxhmlo0zzPql5aEqCxSv+Ih1DbyIhK3Lmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=e/RjJEMm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="e/RjJEMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784314632; x=1815850632;
  h=date:from:to:cc:subject:message-id;
  bh=GZlxpC8PtGDtUhHe8FXmmzK+3/IEnWaj8ifu/bGTSrg=;
  b=e/RjJEMmpYxny/dEUhML5MIpoPLklIOEvUjwGHY0+Dh+gxzyt2W00JsL
   7Ycb00OASXIxUKne/RfzA1a7L3ZFV0lFceUEMaMymTrJd+vN2nMrAZlyO
   jX3sww1ARmZOy8YqjKdrfGeVUCsILc2B9we0AhEqdar+0LAogkkOotbt8
   zNPEeFt2LTlnE6/s+/t8ESvnet0rbnbj765r97AAfqhxr+xNbVHqn9ntQ
   iXQzrKNyDspZo+r9E0+AjyzbKsued4rSLT72CFGq1zJZObwoUwWXVYX3f
   9N+nhRINLYOQCojK99OpMIasXma/xgCsEnfcYcDzVBSU/EZozYCwZE3vy
   Q==;
X-CSE-ConnectionGUID: nbTU0pTdTHaV5PD7vHBSTQ==
X-CSE-MsgGUID: UpWkf0+YSTSzOHyNclGWkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11849"; a="102415442"
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="102415442"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2026 11:57:12 -0700
X-CSE-ConnectionGUID: g+OSZkGpTAua+T4Mv694tQ==
X-CSE-MsgGUID: c8gyKiiyTuGFixcgJg6ymw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,169,1779174000"; 
   d="scan'208";a="255090087"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 17 Jul 2026 11:57:10 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wknkB-00000000T2e-1Wwg;
	Fri, 17 Jul 2026 18:57:07 +0000
Date: Sat, 18 Jul 2026 02:56:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 0/28]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:600:45: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202607180225.MLfLteW0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   ced98912a0d86b6d7c7365664b2df779bf159018
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [0/28] PCI: endpoint: Support NTB transfer between RC and EP
config: i386-randconfig-061 (https://download.01.org/0day-ci/archive/20260718/202607180225.MLfLteW0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260718/202607180225.MLfLteW0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607180225.MLfLteW0-lkp@intel.com/

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
