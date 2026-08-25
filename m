Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEB82E06E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Aug 2026 14:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787666662; cv=none; b=e1FcI6zACaYBpdHZxSsDNxXMyyw3akgTq+6oz97mi2fxS4s36lu2Qb5xAG1q08cPVieo6m8R6Macrck/D06hVIhsEFXxmJSPalgG2qPI6sWD6KWAgLpm0maE55TXbFV85lpGNiUIZOiwWWCCy8arT8fVtk8etzuHXnw0OmEWFtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787666662; c=relaxed/simple;
	bh=9cfLHxqxu2N1nOsWEAcuS62/RXOJC7jJGTmNVI5TMlQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OwLncnn+XGnvUEzlxmpa6i1mXTYSRiIU2TInh4LJhpnVDArFWiYiutvSNFp9Nv/AKv1NbdatwgjEqNsxe18dYymcELNaCMsHFiwsJQRdyVVbYSar1UspBpisp6GuNrnKqff73CXpcNNNC07w5MMFNd0TN8RnrjORZNlMZwAhNs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBY8O1T7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBY8O1T7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787666661; x=1819202661;
  h=date:from:to:cc:subject:message-id;
  bh=9cfLHxqxu2N1nOsWEAcuS62/RXOJC7jJGTmNVI5TMlQ=;
  b=eBY8O1T7wqT+MXq3mXaq6UiZcr/mZLQvmByuozulMivj8riC8l643LoF
   kFsZdIN/pEN6kupgJ+jBSCLH9NgS0+k70nLJSJdMNQ3Gc8VyKB5EUi1p7
   c/lbOwdYbOzKsVEYlrjcNKRQL6ZtI8H2ZeWAvcZF3634Iw2BLoj5pOhY1
   EZRufMMifSoEb6QUHtNivFnobfKgiHj1sfBR5oeiVe3TSUk5Wg7Xqa8ui
   QDd0nm8n7cLjTHCqdwx73jKLN/sL8vSFyz7/Bl96SlxlQLFWs3lUwBbxb
   18ciFZnbfNrVnFGDYpMag4TajSuAyx0l0NlZCpI8xJj10zDvt8EXapfEc
   g==;
X-CSE-ConnectionGUID: tRsrBUQKQuGXgpyqZ8diCg==
X-CSE-MsgGUID: 2Z15x8DrS6KsMwiljARtng==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="87899489"
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="87899489"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Aug 2026 07:04:21 -0700
X-CSE-ConnectionGUID: KvCr4VxgQuOo2O/Z+ylDYQ==
X-CSE-MsgGUID: Ol0xO9cqTKuk9kYaJ/8ZLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,242,1779174000"; 
   d="scan'208";a="267334840"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Aug 2026 07:04:19 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyrlA-000000005wB-3NVK;
	Tue, 25 Aug 2026 14:04:16 +0000
Date: Tue, 25 Aug 2026 22:03:18 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Zhang <18255117159@163.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>
Subject: 
 drivers/pci/controller/cadence/pcie-cadence-debugfs.c:230:46: sparse: sparse:
 mixing different enum types:
Message-ID: <202608252156.pgYqaJww-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   66498c75b4f8017f62d720d9b59675bdf3abce91
commit: d70e964dc099821f6c159d8f40aa7be2c62ecfd2 PCI: cadence: Add LGA IP debugfs for LTSSM status
date:   6 weeks ago
config: sparc-randconfig-r133-20260825 (https://download.01.org/0day-ci/archive/20260825/202608252156.pgYqaJww-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260825/202608252156.pgYqaJww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d70e964dc099 ("PCI: cadence: Add LGA IP debugfs for LTSSM status")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608252156.pgYqaJww-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pci/controller/cadence/pcie-cadence-debugfs.c:230:46: sparse: sparse: mixing different enum types:
   drivers/pci/controller/cadence/pcie-cadence-debugfs.c:230:46: sparse:    unsigned int enum cdns_pcie_hpa_ltssm
   drivers/pci/controller/cadence/pcie-cadence-debugfs.c:230:46: sparse:    unsigned int enum cdns_pcie_lga_ltssm

vim +230 drivers/pci/controller/cadence/pcie-cadence-debugfs.c

   209	
   210	static int ltssm_status_show(struct seq_file *s, void *v)
   211	{
   212		struct cdns_pcie *pci = s->private;
   213		enum cdns_pcie_lga_ltssm lga_ltssm;
   214		enum cdns_pcie_hpa_ltssm hpa_ltssm;
   215		const char *str_ltssm;
   216		u32 val;
   217	
   218		if (pci->is_hpa) {
   219			val = cdns_pcie_hpa_readl(pci, REG_BANK_IP_REG,
   220						  CDNS_PCIE_HPA_PHY_DBG_STS_REG0);
   221			hpa_ltssm = FIELD_GET(CDNS_PCIE_HPA_LTSSM_STATUS_MASK, val);
   222			str_ltssm = cdns_pcie_hpa_ltssm_status_string(hpa_ltssm);
   223		} else {
   224			val = cdns_pcie_readl(pci, CDNS_PCIE_LM_BASE);
   225			lga_ltssm = FIELD_GET(CDNS_PCIE_LGA_LTSSM_STATUS_MASK, val);
   226			str_ltssm = cdns_pcie_lga_ltssm_status_string(lga_ltssm);
   227		}
   228	
   229		seq_printf(s, "%s (0x%02x)\n", str_ltssm,
 > 230			   pci->is_hpa ? hpa_ltssm : lga_ltssm);
   231	
   232		return 0;
   233	}
   234	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
