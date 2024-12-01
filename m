Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888361CCB23
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 13:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733059284; cv=none; b=nkb7GZ8rmibdr6suQxtdAXxfA4cWWujy046wi4/Sj4t4bnTlzNNklNuPyuo4uDXAVoDl8CAK1qzU7LYomxkY51FqG7EnAjGa2xWsIpwE8Alh+8ZioyAm/N6NG4DkloXeGN1iCtffyaM7GyA1X5H5Phb5ENloZ4F4LEpN+oWMCWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733059284; c=relaxed/simple;
	bh=LzbCug0RI2BDoJubCuOctZEDeZuq9zBpw6PBqK2RzgU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XSobIJZWtZadvXwCaf5++7TCl32WcOFtGbwJVOg9QW96cOfJ33BZaaifNe+voOJTDD62v4kMGDPNzB73Pm6gtgRHhlZHhv1QLR9AFUr5t4mg8c1w40TUDD8vH4hKh/qbli+T0efu9rROPiHKq+0dCAi6VBm92lGbhzwUSr5FUOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kom+eSJg; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kom+eSJg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733059283; x=1764595283;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LzbCug0RI2BDoJubCuOctZEDeZuq9zBpw6PBqK2RzgU=;
  b=Kom+eSJgBsSI51XzhrZiJnFrRHtOiuAxwWHihTrRHgDVpaSUokedY9Bv
   0J8v7aaI1kZeDr52gOzdyKtv+3CP13cqQwIzghGq/Frjxh8MA1idTtu0l
   H5HX6q9PGN6XO3xP30BTDRnYbZLLJKscnIVsgfsxdxfGg/0Io2/wFOOLe
   ajSxSXfKueniPdbxzZk8vMVRfFiK76Unf2Jf7eK+holJNzEzJ6SVdzZz1
   X+IFcUBhNXRC1DbZvCI5Nr+CKvC+Yl8wzd/59ctKLmMnYdoFcnzANu3cO
   ue46UdSS0NVVAa4tjelL+ZGcuFPhGMuihabywwp9blfZb8AJnnWp41la0
   g==;
X-CSE-ConnectionGUID: klMez5qYQYW10g3yScYEpg==
X-CSE-MsgGUID: nYArADdaQDyyTqd9E2C9RA==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="58624347"
X-IronPort-AV: E=Sophos;i="6.12,200,1728975600"; 
   d="scan'208";a="58624347"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 05:21:20 -0800
X-CSE-ConnectionGUID: oJHh4Gc+QzaayTsn1Qpj7w==
X-CSE-MsgGUID: kat6xDgrSjOMFtXIY5El1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="97895467"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Dec 2024 05:21:18 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHjsy-0001YM-0p;
	Sun, 01 Dec 2024 13:21:16 +0000
Date: Sun, 1 Dec 2024 21:20:53 +0800
From: kernel test robot <lkp@intel.com>
To: Alejandro Jimenez <alejandro.j.jimenez@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: [jgunthorpe:iommu_pt 47/48] drivers/iommu/amd/iommu.c:1835:
 undefined reference to `pt_iommu_amdv1_hw_info'
Message-ID: <202412012157.6OW1rS79-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   87e70b0c76695339b0163fde25b260773b0720c2
commit: b17f0e7b887fa38ca758c7b2ee98e7963f532138 [47/48] iommu/amd: Use the generic iommu page table
config: x86_64-randconfig-122-20241201 (https://download.01.org/0day-ci/archive/20241201/202412012157.6OW1rS79-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241201/202412012157.6OW1rS79-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412012157.6OW1rS79-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `set_dte_entry':
>> drivers/iommu/amd/iommu.c:1835: undefined reference to `pt_iommu_amdv1_hw_info'
   ld: vmlinux.o: in function `init_gcr3_table':
>> drivers/iommu/amd/iommu.c:1979: undefined reference to `pt_iommu_x86pae_hw_info'
   ld: vmlinux.o: in function `amd_iommu_domain_alloc_paging_v2':
>> drivers/iommu/amd/iommu.c:2415: undefined reference to `pt_iommu_x86pae_init'
   ld: vmlinux.o: in function `amd_iommu_domain_alloc_paging_v1':
>> drivers/iommu/amd/iommu.c:2375: undefined reference to `pt_iommu_amdv1_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_PT_AMDV1
   Depends on [n]: GENERIC_PT [=n] && IOMMU_PT [=n] && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - AMD_IOMMU [=y] && IOMMU_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y] && HAVE_CMPXCHG_DOUBLE [=y]
   WARNING: unmet direct dependencies detected for IOMMU_PT_X86PAE
   Depends on [n]: GENERIC_PT [=n] && IOMMU_PT [=n] && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - AMD_IOMMU [=y] && IOMMU_SUPPORT [=y] && X86_64 [=y] && PCI [=y] && ACPI [=y] && HAVE_CMPXCHG_DOUBLE [=y]


vim +1835 drivers/iommu/amd/iommu.c

  1803	
  1804	static void set_dte_entry(struct amd_iommu *iommu,
  1805				  struct iommu_dev_data *dev_data,
  1806				  phys_addr_t top_paddr, unsigned int top_level)
  1807	{
  1808		u64 pte_root = 0;
  1809		u64 flags = 0;
  1810		u32 old_domid;
  1811		u16 devid = dev_data->devid;
  1812		u16 domid;
  1813		struct protection_domain *domain = dev_data->domain;
  1814		struct dev_table_entry *dev_table = get_dev_table(iommu);
  1815		struct gcr3_tbl_info *gcr3_info = &dev_data->gcr3_info;
  1816		struct pt_iommu_amdv1_hw_info pt_info;
  1817	
  1818		if (gcr3_info && gcr3_info->gcr3_tbl)
  1819			domid = dev_data->gcr3_info.domid;
  1820		else {
  1821			domid = domain->id;
  1822	
  1823			if (domain->domain.type & __IOMMU_DOMAIN_PAGING) {
  1824				/*
  1825				 * When updating the IO pagetable, the new top and level
  1826				 * are provided as parameters. For other operations i.e.
  1827				 * device attach, retrieve the current pagetable info
  1828				 * via the IOMMU PT API.
  1829				 */
  1830				if (top_paddr) {
  1831					pt_info.host_pt_root = top_paddr;
  1832					pt_info.mode = top_level + 1;
  1833				} else {
  1834					WARN_ON(top_paddr || top_level);
> 1835					pt_iommu_amdv1_hw_info(&domain->amdv1,
  1836							       &pt_info);
  1837				}
  1838	
  1839				pte_root = pt_info.host_pt_root;
  1840				pte_root |= (pt_info.mode & DEV_ENTRY_MODE_MASK)
  1841					    << DEV_ENTRY_MODE_SHIFT;
  1842			}
  1843		}
  1844	
  1845		pte_root |= DTE_FLAG_IR | DTE_FLAG_IW | DTE_FLAG_V;
  1846	
  1847		/*
  1848		 * When SNP is enabled, Only set TV bit when IOMMU
  1849		 * page translation is in use.
  1850		 */
  1851		if (!amd_iommu_snp_en || (domid != 0))
  1852			pte_root |= DTE_FLAG_TV;
  1853	
  1854		flags = dev_table[devid].data[1];
  1855	
  1856		if (dev_data->ats_enabled)
  1857			flags |= DTE_FLAG_IOTLB;
  1858	
  1859		if (dev_data->ppr)
  1860			pte_root |= 1ULL << DEV_ENTRY_PPR;
  1861	
  1862		if (domain->dirty_tracking)
  1863			pte_root |= DTE_FLAG_HAD;
  1864	
  1865		if (gcr3_info && gcr3_info->gcr3_tbl) {
  1866			u64 gcr3 = iommu_virt_to_phys(gcr3_info->gcr3_tbl);
  1867			u64 glx  = gcr3_info->glx;
  1868			u64 tmp;
  1869	
  1870			pte_root |= DTE_FLAG_GV;
  1871			pte_root |= (glx & DTE_GLX_MASK) << DTE_GLX_SHIFT;
  1872	
  1873			/* First mask out possible old values for GCR3 table */
  1874			tmp = DTE_GCR3_VAL_B(~0ULL) << DTE_GCR3_SHIFT_B;
  1875			flags    &= ~tmp;
  1876	
  1877			tmp = DTE_GCR3_VAL_C(~0ULL) << DTE_GCR3_SHIFT_C;
  1878			flags    &= ~tmp;
  1879	
  1880			/* Encode GCR3 table into DTE */
  1881			tmp = DTE_GCR3_VAL_A(gcr3) << DTE_GCR3_SHIFT_A;
  1882			pte_root |= tmp;
  1883	
  1884			tmp = DTE_GCR3_VAL_B(gcr3) << DTE_GCR3_SHIFT_B;
  1885			flags    |= tmp;
  1886	
  1887			tmp = DTE_GCR3_VAL_C(gcr3) << DTE_GCR3_SHIFT_C;
  1888			flags    |= tmp;
  1889	
  1890			if (amd_iommu_gpt_level == PAGE_MODE_5_LEVEL) {
  1891				dev_table[devid].data[2] |=
  1892					((u64)GUEST_PGTABLE_5_LEVEL << DTE_GPT_LEVEL_SHIFT);
  1893			}
  1894	
  1895			/* GIOV is supported with V2 page table mode only */
  1896			if (pdom_is_v2_pgtbl_mode(domain))
  1897				pte_root |= DTE_FLAG_GIOV;
  1898		}
  1899	
  1900		flags &= ~DEV_DOMID_MASK;
  1901		flags |= domid;
  1902	
  1903		old_domid = dev_table[devid].data[1] & DEV_DOMID_MASK;
  1904		dev_table[devid].data[1]  = flags;
  1905		dev_table[devid].data[0]  = pte_root;
  1906	
  1907		/*
  1908		 * A kdump kernel might be replacing a domain ID that was copied from
  1909		 * the previous kernel--if so, it needs to flush the translation cache
  1910		 * entries for the old domain ID that is being overwritten
  1911		 */
  1912		if (old_domid) {
  1913			amd_iommu_flush_tlb_domid(iommu, old_domid);
  1914		}
  1915	}
  1916	
  1917	static void clear_dte_entry(struct amd_iommu *iommu, u16 devid)
  1918	{
  1919		struct dev_table_entry *dev_table = get_dev_table(iommu);
  1920	
  1921		/* remove entry from the device table seen by the hardware */
  1922		dev_table[devid].data[0]  = DTE_FLAG_V;
  1923	
  1924		if (!amd_iommu_snp_en)
  1925			dev_table[devid].data[0] |= DTE_FLAG_TV;
  1926	
  1927		dev_table[devid].data[1] &= DTE_FLAG_MASK;
  1928	
  1929		amd_iommu_apply_erratum_63(iommu, devid);
  1930	}
  1931	
  1932	/* Update and flush DTE for the given device */
  1933	static void dev_update_dte(struct iommu_dev_data *dev_data, bool set)
  1934	{
  1935		struct amd_iommu *iommu = get_amd_iommu_from_dev(dev_data->dev);
  1936	
  1937		if (set)
  1938			set_dte_entry(iommu, dev_data, 0, 0);
  1939		else
  1940			clear_dte_entry(iommu, dev_data->devid);
  1941	
  1942		clone_aliases(iommu, dev_data->dev);
  1943		device_flush_dte(dev_data);
  1944		iommu_completion_wait(iommu);
  1945	}
  1946	
  1947	/*
  1948	 * If domain is SVA capable then initialize GCR3 table. Also if domain is
  1949	 * in v2 page table mode then update GCR3[0].
  1950	 */
  1951	static int init_gcr3_table(struct iommu_dev_data *dev_data,
  1952				   struct protection_domain *pdom)
  1953	{
  1954		struct amd_iommu *iommu = get_amd_iommu_from_dev_data(dev_data);
  1955		int max_pasids = dev_data->max_pasids;
  1956		struct pt_iommu_x86pae_hw_info pt_info;
  1957		int ret = 0;
  1958	
  1959		 /*
  1960		  * If domain is in pt mode then setup GCR3 table only if device
  1961		  * is PASID capable
  1962		  */
  1963		if (pdom_is_in_pt_mode(pdom) && !pdev_pasid_supported(dev_data))
  1964			return ret;
  1965	
  1966		/*
  1967		 * By default, setup GCR3 table to support MAX PASIDs
  1968		 * supported by the device/IOMMU.
  1969		 */
  1970		ret = setup_gcr3_table(&dev_data->gcr3_info, iommu,
  1971				       max_pasids > 0 ?  max_pasids : 1);
  1972		if (ret)
  1973			return ret;
  1974	
  1975		/* Setup GCR3[0] only if domain is setup with v2 page table mode */
  1976		if (!pdom_is_v2_pgtbl_mode(pdom))
  1977			return ret;
  1978	
> 1979		pt_iommu_x86pae_hw_info(&pdom->amdv2, &pt_info);
  1980		ret = update_gcr3(dev_data, 0, pt_info.gcr3_pt, true);
  1981		if (ret)
  1982			free_gcr3_table(&dev_data->gcr3_info);
  1983	
  1984		return ret;
  1985	}
  1986	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
