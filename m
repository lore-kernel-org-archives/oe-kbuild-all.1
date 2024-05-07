Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EB416D316
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 May 2024 18:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715107131; cv=none; b=L1dIVmkIdTbwtOx+00Gk9ufSMdc9BuZHJ4Ow6l9dMgs5KX8+yjh/oeS4gMRCpYT5uogcu7ZfGK3RBittycnxqlM3utDax+lPXRAvSxX/pZJiXLXF05Ii0vTIzd8asSjIQ04vTy+J3ImgyhP6x+KkbMsYL1LvK774ikNq4ORHbI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715107131; c=relaxed/simple;
	bh=Uv9XTPLaYTiV0mmnqhSuZCe+yWrOTeED5yq5y7Ux/OQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UwRcNZ5Xicc9sAO3AAq5cOZM8VSVNVjeuwEQ4EO82yHs45OE644mwbDYRhd/tWTEYigbRMC1RnIHcVPWTns75M3hMUPVdP7mGB4jGg6/R2xHgHzW5GDddsOWHOV3JBZi90MjDvzophwI5n1UgMZMAlF9HJYB072bTAYIj+U9gEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdcpwAsb; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdcpwAsb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715107129; x=1746643129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Uv9XTPLaYTiV0mmnqhSuZCe+yWrOTeED5yq5y7Ux/OQ=;
  b=CdcpwAsbCgQX3u5Kd3dYaihe7S5uLplLwcoO42rPiXcGVXCYXm1N8org
   +DB/qMO7nD1zIbXBIoJ0Itr/jbbGIMJWbsJQgNYWoSdWkaEq7/0yu89KP
   vcb65HXgeJllO5xvVDjdVesxyOt60zIx4JK3MDIvEsbHKvBIp/6gCWLn9
   UI+4WX96hXxp6j/+gfRsTKZLNEXOJkZ+VhAHESOZXT8RHuuMRmZe6kBxD
   qow/+fLf5Jp0/DJjOIMvccggeNX4+I8fi4S7Dw9/3ZSQf4BBzxF8fu8fg
   7Kmmln6nNjE4YbhjCroVKC3xbxOVdgr7PzZtL1SOTAzPnVW7KOnIl9jLI
   g==;
X-CSE-ConnectionGUID: owWiYfIHSkSJjE1WYOf9TQ==
X-CSE-MsgGUID: FI9L7wmTT6WDlST5knC5ig==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10783173"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="10783173"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 11:38:49 -0700
X-CSE-ConnectionGUID: Mww/YtB0R2iLk6YlJ95aYg==
X-CSE-MsgGUID: GRu4QDlAQYmw6Vjm5Gwz9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="28677852"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 07 May 2024 11:38:45 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4Pi7-0002YQ-1P;
	Tue, 07 May 2024 18:38:43 +0000
Date: Wed, 8 May 2024 02:37:49 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6514/6518] drivers/crypto/ccp/hygon/hct.c:2098:6:
 warning: no previous prototype for 'hct_noiommu_set_memory_wb'
Message-ID: <202405080231.NA9geGDj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   b294718c76ed688d3272e48c431221a8194cd2d3
commit: f0872dfb71fb45aaf2ea14da6e32c68bf43a399f [6514/6518] ccp: supporting memory encryption features for host vfio-noiommu mode, and wb attribute for the bar memory of virtual machine.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240508/202405080231.NA9geGDj-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240508/202405080231.NA9geGDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405080231.NA9geGDj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/hct.c:1345:15: warning: no previous prototype for 'hct_pin_memory' [-Wmissing-prototypes]
    1345 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^~~~~~~~~~~~~~
>> drivers/crypto/ccp/hygon/hct.c:2098:6: warning: no previous prototype for 'hct_noiommu_set_memory_wb' [-Wmissing-prototypes]
    2098 | void hct_noiommu_set_memory_wb(unsigned long address)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hct_noiommu_set_memory_wb +2098 drivers/crypto/ccp/hygon/hct.c

  2094	
  2095	/* set the flags PAT, PCT and PWT of page all to 0
  2096	 * for obtaining cache properties.
  2097	 */
> 2098	void hct_noiommu_set_memory_wb(unsigned long address)
  2099	{
  2100		pgd_t *pgd = current->mm->pgd + pgd_index(address);
  2101		p4d_t *p4d;
  2102		pud_t *pud;
  2103		pmd_t *pmd;
  2104		pte_t *pte;
  2105		pte_t old_pte;
  2106		pte_t new_pte;
  2107		pgprot_t new_prot;
  2108		unsigned long pfn;
  2109	
  2110		if (pgd_none(*pgd)) {
  2111			pr_err("pgd val shouldn't be none\n");
  2112			return;
  2113		}
  2114	
  2115		p4d = p4d_offset(pgd, address);
  2116		if (p4d_none(*p4d)) {
  2117			pr_err("p4d val shouldn't be none\n");
  2118			return;
  2119		}
  2120	
  2121		pud = pud_offset(p4d, address);
  2122		if (pud_none(*pud) || pud_large(*pud) || !pud_present(*pud)) {
  2123			pr_err("pud val is invalid.\n");
  2124			return;
  2125		}
  2126	
  2127		pmd = pmd_offset(pud, address);
  2128		if (pmd_none(*pmd) || pmd_large(*pmd) || !pmd_present(*pmd)) {
  2129			pr_err("pmd val is invalid.\n");
  2130			return;
  2131		}
  2132	
  2133		pte = pte_offset_kernel(pmd, address);
  2134		if (pte_none(*pte)) {
  2135			pr_err("pte val shouldn't be none\n");
  2136			return;
  2137		}
  2138	
  2139		old_pte = *pte;
  2140		pfn = pte_pfn(old_pte);
  2141		new_prot = pte_pgprot(old_pte);
  2142		pgprot_val(new_prot) &= ~(_PAGE_PAT | _PAGE_PCD | _PAGE_PWT);
  2143		new_pte = pfn_pte(pfn, new_prot);
  2144		set_pte_atomic(pte, new_pte);
  2145	}
  2146	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
