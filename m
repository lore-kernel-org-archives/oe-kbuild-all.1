Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531F042061
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 15:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711639457; cv=none; b=c9qFX1VoyFklAAEXHabmCus4vTAe6NBotQUfOHeA0QX7EsFarOeDzsIAtPb4noa1Gpols2P6e4pZGEpz61GcEH0bLYr8omnSqXC/RmXXhntsLwgiwUt/SASRIDi1nASrC3cEz5zmWp6NpxbzNq+l64Mbbg/YdRaT+ilBsDxZNpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711639457; c=relaxed/simple;
	bh=iGGvxtu0slOYrkScpxm0lUGQuE0Yc+LkA+b9cHh8j6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HW7NLsUXKB6AcRKVOrrOrjWW9UgQ7ajMD5PkqXZcyWwFL5UtJs9W1Oz9bTOIeMBzshopVjt/PqybexL7FeHde6oybvlMbhq+avNOLwrE6FnPaQ1jWKalYOcdNbFK1V5iM2fmNvawB827nWZxKO9aP+mdJ9xmV2yu0O82xCZiINg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1AgaNbj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1AgaNbj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711639454; x=1743175454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iGGvxtu0slOYrkScpxm0lUGQuE0Yc+LkA+b9cHh8j6g=;
  b=J1AgaNbj0F0tJAaFIA0I7c1xNpscMmrKVILx9VNh7LGHobcU0tCRwpim
   XT82H3/biYHRsuA596rCfQJ0rQ3ACWqREdO/6eMGqJqAV6S2tJodW71d9
   H5rGDwAYRznQpw1QTBwTXO5h4Q4JovBfYPX23WSESWARdvzJiB1yMgNhS
   Ws0wv/5djQXCcNYigdLjyA5e4yVkXPzRulP2EljjgQ4TBzWEavYejar6/
   fIiWCbrIN/wRcbugApZ8xWO5tJa2Si4GcX7+WT+IKXR9zxkUMeedCe2sa
   Auoe+WtYAkIsViyjT7VPwaWQYbhFEbTd/1plVRrMCrfaDHk6Meg4P6Cmq
   Q==;
X-CSE-ConnectionGUID: LOenJUhCRLiNcdaDvtniJA==
X-CSE-MsgGUID: 1i9y9goSR2OCOClrzKmkDQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="7400147"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="7400147"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 08:24:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="21150178"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Mar 2024 08:24:12 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rprbt-0002Fy-0r;
	Thu, 28 Mar 2024 15:24:09 +0000
Date: Thu, 28 Mar 2024 23:23:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-linux-5.15.y 264/377]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:600:45: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202403282339.inNxJ7O8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common upstream-linux-5.15.y
head:   9465fef4ae351749f7068da8c78af4ca27e61928
commit: e2b6ef72b7aea9d7d480d2df499bcd1c93247abb [264/377] PCI: endpoint: Support NTB transfer between RC and EP
config: i386-randconfig-062-20240328 (https://download.01.org/0day-ci/archive/20240328/202403282339.inNxJ7O8-lkp@intel.com/config)
compiler: gcc-8 (Ubuntu 8.4.0-3ubuntu2) 8.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403282339.inNxJ7O8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403282339.inNxJ7O8-lkp@intel.com/

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

   511	
   512	/**
   513	 * epf_ntb_db_bar_init() - Configure Doorbell window BARs
   514	 * @ntb: NTB device that facilitates communication between HOST and vHOST
   515	 */
   516	static int epf_ntb_db_bar_init(struct epf_ntb *ntb)
   517	{
   518		const struct pci_epc_features *epc_features;
   519		u32 align;
   520		struct device *dev = &ntb->epf->dev;
   521		int ret;
   522		struct pci_epf_bar *epf_bar;
   523		void __iomem *mw_addr;
   524		enum pci_barno barno;
   525		size_t size = 4 * ntb->db_count;
   526	
   527		epc_features = pci_epc_get_features(ntb->epf->epc,
   528						    ntb->epf->func_no,
   529						    ntb->epf->vfunc_no);
   530		align = epc_features->align;
   531	
   532		if (size < 128)
   533			size = 128;
   534	
   535		if (align)
   536			size = ALIGN(size, align);
   537		else
   538			size = roundup_pow_of_two(size);
   539	
   540		barno = ntb->epf_ntb_bar[BAR_DB];
   541	
 > 542		mw_addr = pci_epf_alloc_space(ntb->epf, size, barno, align, 0);
   543		if (!mw_addr) {
   544			dev_err(dev, "Failed to allocate OB address\n");
   545			return -ENOMEM;
   546		}
   547	
   548		ntb->epf_db = mw_addr;
   549	
   550		epf_bar = &ntb->epf->bar[barno];
   551	
   552		ret = pci_epc_set_bar(ntb->epf->epc, ntb->epf->func_no, ntb->epf->vfunc_no, epf_bar);
   553		if (ret) {
   554			dev_err(dev, "Doorbell BAR set failed\n");
   555				goto err_alloc_peer_mem;
   556		}
   557		return ret;
   558	
   559	err_alloc_peer_mem:
   560		pci_epc_mem_free_addr(ntb->epf->epc, epf_bar->phys_addr, mw_addr, epf_bar->size);
   561		return -1;
   562	}
   563	
   564	/**
   565	 * epf_ntb_db_bar_clear() - Clear doorbell BAR and free memory
   566	 *   allocated in peer's outbound address space
   567	 * @ntb: NTB device that facilitates communication between HOST and vHOST
   568	 */
   569	static void epf_ntb_db_bar_clear(struct epf_ntb *ntb)
   570	{
   571		enum pci_barno barno;
   572	
   573		barno = ntb->epf_ntb_bar[BAR_DB];
   574		pci_epf_free_space(ntb->epf, ntb->epf_db, barno, 0);
   575		pci_epc_clear_bar(ntb->epf->epc,
   576				  ntb->epf->func_no,
   577				  ntb->epf->vfunc_no,
   578				  &ntb->epf->bar[barno]);
   579	}
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
