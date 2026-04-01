Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05C037AA9E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Apr 2026 03:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775015919; cv=none; b=dA+TrvlVx7Y9Xjaw54baAnnozPWLFpemzDcti6Uvrehiy9fbFWOh6mqZ8Hp4lJbYzvFquYlIlDKOzKVWUqOzLX97S2Zidpaqm94esKbLjERY8YKDjjt36ormc7qlv0PHn9LtshWCpYc00z9BY7ZDic29Ny0vxwx+aHhHCf8yx78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775015919; c=relaxed/simple;
	bh=jyblcyJc38ey0wCt6Qrb/mY+/gK2nlVHKpvlz+S/5t0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WtWIlU9745gzG0RVrrIBRfLoS6stSImkwTQ0xXB892fDclZO3KEIONRsFCrngt58fSF5S8BZFco4MuJm6OHYPE2Cq7afpQ4yar5cS9X1CjNNP1+9VnvYmEW5MTjP8BsOAAwt1Dw7POIFjYqOgHylCHl74rj5j6NSZbb3e5WSlD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TMMap+DU; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TMMap+DU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775015917; x=1806551917;
  h=date:from:to:cc:subject:message-id;
  bh=jyblcyJc38ey0wCt6Qrb/mY+/gK2nlVHKpvlz+S/5t0=;
  b=TMMap+DUdsg8pL/+txqk3XPTEH40V+EojcpmGRxjUMvMbE06FrYEvItq
   OraK+0cHBm9lhQ4+6OiAF3AoO5FtA+70KG4n/gWOOzHB+Lh3XMLaF3yf7
   LMJhF8tCd9g7IP5JEXfSxF35gxG5GiHZQzuvRe8rdQHU+7fhkEJKRTb1O
   0iKDacjPpv7rSgHV00vI/PM7lg5YLf11UGJP2wy7Rk5/k18PlcICXwMXF
   cDUrnUYtNiYtSk/amWWqCq58nht7ZV0M7XS5OBp+2C6CAjY3KuhpyZkUr
   OfKMEmGaz4jDJeIaSuqTNa/494c1+fFDBB3gOJZNaiF41Qpn6OElk3qeY
   g==;
X-CSE-ConnectionGUID: ++GAUS5nQXuZL0udb/vdtA==
X-CSE-MsgGUID: AqI/JX0VQGiJjglmW462cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11745"; a="87436263"
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="87436263"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 20:58:37 -0700
X-CSE-ConnectionGUID: mNQaCkg9QvW5CiEdsZr/jw==
X-CSE-MsgGUID: atDxRSJjRnC/zwG8qNesGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,153,1770624000"; 
   d="scan'208";a="228161635"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 31 Mar 2026 20:58:36 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7miv-000000004li-2XM5;
	Wed, 01 Apr 2026 03:58:33 +0000
Date: Wed, 01 Apr 2026 11:58:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2025-05 0/2]
 drivers/pci/endpoint/functions/pci-epf-vntb.c:560:38: sparse: sparse:
 incorrect type in argument 2 (different address spaces)
Message-ID: <202604011132.i2fqVKmV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1-2025-05
head:   e9d40e5361fec6536168a1ce5b8320b89734442e
commit: 21d8b6bd3730fc6af7ff0eb3c65a8364da310f66 [0/2] PCI: endpoint: pci-epf-vntb: Fix call pci_epc_mem_free_addr() in error path
config: i386-randconfig-061-20260401 (https://download.01.org/0day-ci/archive/20260401/202604011132.i2fqVKmV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260401/202604011132.i2fqVKmV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604011132.i2fqVKmV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/pci/endpoint/functions/pci-epf-vntb.c:542:17: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *mw_addr @@     got void * @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:542:17: sparse:     expected void [noderef] __iomem *mw_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:542:17: sparse:     got void *
>> drivers/pci/endpoint/functions/pci-epf-vntb.c:560:38: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *mw_addr @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:560:38: sparse:     expected void *addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:560:38: sparse:     got void [noderef] __iomem *mw_addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:576:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void *addr @@     got void [noderef] __iomem *epf_db @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:576:41: sparse:     expected void *addr
   drivers/pci/endpoint/functions/pci-epf-vntb.c:576:41: sparse:     got void [noderef] __iomem *epf_db
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1106:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1106:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1106:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1117:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1117:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1117:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1128:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1128:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1128:33: sparse:     got struct epf_ntb_ctrl *reg
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1140:33: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *base @@     got struct epf_ntb_ctrl *reg @@
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1140:33: sparse:     expected void [noderef] __iomem *base
   drivers/pci/endpoint/functions/pci-epf-vntb.c:1140:33: sparse:     got struct epf_ntb_ctrl *reg

vim +560 drivers/pci/endpoint/functions/pci-epf-vntb.c

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
   542		mw_addr = pci_epf_alloc_space(ntb->epf, size, barno, align, 0);
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
 > 560		pci_epf_free_space(ntb->epf, mw_addr, barno, 0);
   561		return -1;
   562	}
   563	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
