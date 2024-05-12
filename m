Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB54C13D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 05:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715491187; cv=none; b=Zy8kEXA3elLySCDoPgO4Phm+zJn/vsGbqExMdPC5gHQdTd+I3ZoOHsUq1NZEo32iQJ3dTozxV6AgoaHqdyhVVNSjgiGF1bMST5U6RZi0reHs53/OMrCaibG5PAX4GY6pOd2fsr0PN44wnXFwdlUgzLNJtdVfxyepveLcUMlVau8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715491187; c=relaxed/simple;
	bh=mX1ZaCk4i08Gn46HquCFYelGz/YrAK/+DUW5UPLi5Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HhSB3WinQBL0nxWMb0tPRTyNzl+YYiaafM6wfjXWMLrGUvcwtfcofP1qiiLUIZjkGnYQj+QgTLmuB7y3dgsFLkAfAGU6spPKsEGP0E9fQdPQGJBked+Q+dtLD/qnw5RlH9iowi3+VzoN8Gxxl32WJepSwJt9eiG8z8zgSaENTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVxq+oSR; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVxq+oSR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715491185; x=1747027185;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mX1ZaCk4i08Gn46HquCFYelGz/YrAK/+DUW5UPLi5Ks=;
  b=aVxq+oSRVBEayDCJRxpXtc+3GSauWLPqSPWWL7w3WCc8T1yGNT3Xqj/h
   y3nFfdkE6dL8fq+2e8rnrvLSPXeyc2gWJvJ+jbgeBX43Xir6mQ2GBm6E4
   2kK/ig76tAfBC7/iDrQAfz8n2b7DXJ5hPYuOU7RpMEdkCYEVAWDiYvhtx
   4rFCRaOZCXJ7gkoAU1AteBQmM8/XN449neaqnLr5vcMfTOlnErcPkxygI
   a+UF0OgDJE+ckFCfqXNNejkGq8ks9A0fIsTejMINMB4r2WWYGc/ZTP3QH
   l3FUQtWQ5g3p6o1fjhtw7C4Az0wl3Enpr8X8pZsLNtO0vJuMZorEcQ5rI
   A==;
X-CSE-ConnectionGUID: rigaro+2SliXsint8slgOQ==
X-CSE-MsgGUID: 2rFYJauCSt67uKVBl5Ba6Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="22021096"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="22021096"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 22:19:44 -0700
X-CSE-ConnectionGUID: fc29mNUWQECbxwEsvYtK/w==
X-CSE-MsgGUID: dmMiKMgeRkWmLV6ACBmEMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="30584497"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 May 2024 22:19:41 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s61cY-0008D5-29;
	Sun, 12 May 2024 05:19:38 +0000
Date: Sun, 12 May 2024 13:19:27 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6574/6591] drivers/crypto/ccp/hygon/hct.c:2098:6:
 warning: no previous prototype for function 'hct_noiommu_set_memory_wb'
Message-ID: <202405121313.3JyWFffv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   af8a5753e476c40851cc338e3ac6aa2d962d05a1
commit: f0872dfb71fb45aaf2ea14da6e32c68bf43a399f [6574/6591] ccp: supporting memory encryption features for host vfio-noiommu mode, and wb attribute for the bar memory of virtual machine.
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240512/202405121313.3JyWFffv-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405121313.3JyWFffv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405121313.3JyWFffv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/hygon/hct.c:1345:15: warning: no previous prototype for function 'hct_pin_memory' [-Wmissing-prototypes]
    1345 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         |               ^
   drivers/crypto/ccp/hygon/hct.c:1345:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1345 | struct page **hct_pin_memory(struct hct_private *private, unsigned long uaddr,
         | ^
         | static 
>> drivers/crypto/ccp/hygon/hct.c:2098:6: warning: no previous prototype for function 'hct_noiommu_set_memory_wb' [-Wmissing-prototypes]
    2098 | void hct_noiommu_set_memory_wb(unsigned long address)
         |      ^
   drivers/crypto/ccp/hygon/hct.c:2098:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2098 | void hct_noiommu_set_memory_wb(unsigned long address)
         | ^
         | static 
   2 warnings generated.


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
