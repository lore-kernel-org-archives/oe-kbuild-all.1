Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D936404D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jul 2026 22:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784757806; cv=none; b=bjhKq+ndSGpOh4jXbtpLDcT0TDpdHpfA+21vhLjDAUUtPnDcI+0SsJT9+qkTjN/qNJJWXn9t1z92k5xu7bxXn3VBMsS2DxuUKlExmKmFrZTHdz/2PpJfxk7/mMrRbldNboqxI4+TswfURVHsNNeYGNI2/AlQ40GO7ykjg+/ZY2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784757806; c=relaxed/simple;
	bh=q4Cp1aW4VO96Ndw/jRfUOAsdzpDLpz29oczG0VyHeZM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SzG4IGdWo6PBogAzLgaHnWAGu98RqVZFAjPj2eDnn2+jt58w7exS8CR4yUHs60/KVGHux6EyzJh1PtVmrgU2zD8DB7QmBE+V+f3t43bxLQSAx2C8S2zeT3v+iVvJJDQ/AYnaG8+rLvQZUv4g1hvs2nPi11yv3OrJvIleoYEgY8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cnrjNh/v; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cnrjNh/v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784757803; x=1816293803;
  h=date:from:to:cc:subject:message-id;
  bh=q4Cp1aW4VO96Ndw/jRfUOAsdzpDLpz29oczG0VyHeZM=;
  b=cnrjNh/vUfrHRC0X6CLzsnAcQtTOS4Zup8YVnqxr77v1H1OpbpaFu7fG
   rVIjnNni7YmefTG6aknffReQvd8tPuTFh/1qlq3as6/TbYFfeBajDbBeI
   55b8d/KLoCibBu1vD+tqkrmcraMDOt3RjKZnhyjwlNt3fm9H6PM3f8ugX
   nkCKXnKktIuwo4rVD74lkuJO0kgQ3oTSy80d/OW2TdMeodtY8I8FBBLpc
   mWdHpPQuGCJSHfp/S4A/fnmg/13EDuFAzhbqwpU7MxJ1zmWqY0jhQLcBr
   1nwZHK991NRqzM17Bk82Y7ez06lI5tUaG1YsWqe0Xu40egkQEeDTlV0Eo
   w==;
X-CSE-ConnectionGUID: zPfsNDrwS9aJvkLcnXS7pg==
X-CSE-MsgGUID: +d3LV9WcQbS9VFgdSJhhtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96778646"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="96778646"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 15:03:21 -0700
X-CSE-ConnectionGUID: nX/Cj7JFT2CbaNAb7MSV3Q==
X-CSE-MsgGUID: JXL3pE+3TMyWNo7Evudz8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="261766924"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Jul 2026 15:03:20 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmf25-00000000Z57-2QyG;
	Wed, 22 Jul 2026 22:03:17 +0000
Date: Thu, 23 Jul 2026 06:03:03 +0800
From: kernel test robot <lkp@intel.com>
To: Hans Zhang <18255117159@163.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Manivannan Sadhasivam <mani@kernel.org>
Subject: [linux-next:master 5152/8209]
 drivers/pci/controller/cadence/pcie-cadence-debugfs.c:230:46: sparse: sparse:
 mixing different enum types:
Message-ID: <202607230530.W063P5YO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   290aaf24a551d5a0dce037e3fab30820f9113a10
commit: d70e964dc099821f6c159d8f40aa7be2c62ecfd2 [5152/8209] PCI: cadence: Add LGA IP debugfs for LTSSM status
config: arc-randconfig-r111-20260722 (https://download.01.org/0day-ci/archive/20260723/202607230530.W063P5YO-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607230530.W063P5YO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607230530.W063P5YO-lkp@intel.com/

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
