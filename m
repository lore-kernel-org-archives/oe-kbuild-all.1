Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61D223B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 Nov 2024 05:25:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732253151; cv=none; b=Ij1I/oQFFJM9vazpgBm7FBUfBikoUxpHsi+prkXtYYZGcnXG2kylJ3FAnWLfPj1anT+7ugMRcKSnsmOSoGunjHKhF1JN8lvyhdXdlnTu2DiNOoSMG329sJRRwyKM/6vwEsrE/b0RtxMTOTdisYONHpKGuCRcaZgyHxpCpyAwZsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732253151; c=relaxed/simple;
	bh=i2RjlCnmJ9zVGDBP2v0IQFazSMIZVD3AzUTvH18GPP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HMD5qOOO0Z4T6qoF34101ZAwnNLvD7FeBNJ/uVQqjWwb4hWzYkV+OXfXxrukJxJ7CjwajnoBvjySFOjPFt8i5vRZqVzSFWfLvNPCRoxsPV9bZi9OCaoM/sQJaxQOJg2qPRhow/ceI0j7PK10Zesas8j+kHjcYVK7p8evJi7sufg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRVfv6Vs; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRVfv6Vs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732253151; x=1763789151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i2RjlCnmJ9zVGDBP2v0IQFazSMIZVD3AzUTvH18GPP0=;
  b=hRVfv6VsJkx7F8uBiLFmFvMT9ljKxQkf+PC/DxBBEomnvm2v2baeM3cV
   ICQ2V31G7VRcJ3/eAibIn1FswO3vfY4yZ88yXsDRyoNd5NzH1nZvqVDlr
   b/BcPvKKIOfDJEnB1Sc/eoulrK0/g6NSt7W3pKMsVPh2N4OX/9Lu82L3G
   jTE+9XhQBL7WdQHP/+6LivR7J83QESi3DOIKfyGmyE9qXuuKE4KBPkY6e
   QMt0mdWYllYL3sgw6haUtSg/na8LaKjuell4+CzTjxbzSP3jg2bVusfmH
   yId0WE0IcuH9DFOGJZ4MhQ9x+31YxAjzGVFaDYLj+il6IPEYQMt02gHyJ
   g==;
X-CSE-ConnectionGUID: hvGs2tTlQZuDFIPnC8Xg2w==
X-CSE-MsgGUID: VBYwLKIPQVOJypipQNs/bw==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="35255644"
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="35255644"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2024 21:25:50 -0800
X-CSE-ConnectionGUID: YQZ/TkQMRWeGyTR1JXJUlg==
X-CSE-MsgGUID: vk+/tkvVSsiy1tBDcmfK7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,174,1728975600"; 
   d="scan'208";a="121342597"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 21 Nov 2024 21:25:48 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tEMAr-0003hV-2R;
	Fri, 22 Nov 2024 05:25:45 +0000
Date: Fri, 22 Nov 2024 13:25:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 264/377]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:600:45: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202411221338.3amcZ9Ya-lkp@intel.com>
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
config: x86_64-randconfig-r131-20241122 (https://download.01.org/0day-ci/archive/20241122/202411221338.3amcZ9Ya-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241122/202411221338.3amcZ9Ya-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411221338.3amcZ9Ya-lkp@intel.com/

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
