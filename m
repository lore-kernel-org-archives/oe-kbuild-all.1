Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8A446BB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Feb 2023 15:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676217529; x=1707753529;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ge+tLQJJJ2dWROdiC3sZ9RGJGcCp+jZxMmbe+K3Ircc=;
  b=ftnNnCn6eddDbbIi+sYeTZG0U9wNGeulLDiIJDSearb4eBAOKTK9Y5SF
   30zonlLl0IQXaUjtKQOTinSQL1xYkXvvM7CwxxKORvcINqu1LqiFcjNTj
   ECR9AxVl7S8j/BxYLIvAlo4kqhcpCtJDPr8cruz6NKaDOYdD+F5dMiYY2
   ZB4cN7luYcmW96tSsKU8wsxUE8BhbzhgW0EY9RUNKsDhfHJ4X/qcLK4GV
   AfLRgxztGYkJZsx1FACa9QaPO52yRncudw36khCTZvRQYQDC34nj3HQ38
   uXaBnDDQULM+B66EHd2+MMga62NAZNA3ZoPxzgQm3xgz/C7Nj8hSnVHL2
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="314369134"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="314369134"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2023 07:58:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="661920638"
X-IronPort-AV: E=Sophos;i="5.97,291,1669104000"; 
   d="scan'208";a="661920638"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 12 Feb 2023 07:58:46 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pREkX-0007Gr-2d;
	Sun, 12 Feb 2023 15:58:45 +0000
Date: Sun, 12 Feb 2023 23:58:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-5.4 62/71] drivers/iommu/iommu.c:1861:5:
 warning: no previous prototype for function '__iommu_map'
Message-ID: <202302122354.beNlqQ2Q-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-5.4
head:   1a75a12f11128114da2930ef58af4a8940a256db
commit: 918cff530d4f2dfa379e51f58fcb7ad4b971535f [62/71] iommu: Add gfp parameter to iommu_ops::map
config: x86_64-randconfig-a005 (https://download.01.org/0day-ci/archive/20230212/202302122354.beNlqQ2Q-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=918cff530d4f2dfa379e51f58fcb7ad4b971535f
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout 918cff530d4f2dfa379e51f58fcb7ad4b971535f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/iommu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302122354.beNlqQ2Q-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/iommu.c:292:5: warning: no previous prototype for function 'iommu_insert_resv_region' [-Wmissing-prototypes]
   int iommu_insert_resv_region(struct iommu_resv_region *new,
       ^
   drivers/iommu/iommu.c:292:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int iommu_insert_resv_region(struct iommu_resv_region *new,
   ^
   static 
>> drivers/iommu/iommu.c:1861:5: warning: no previous prototype for function '__iommu_map' [-Wmissing-prototypes]
   int __iommu_map(struct iommu_domain *domain, unsigned long iova,
       ^
   drivers/iommu/iommu.c:1861:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __iommu_map(struct iommu_domain *domain, unsigned long iova,
   ^
   static 
>> drivers/iommu/iommu.c:2012:8: warning: no previous prototype for function '__iommu_map_sg' [-Wmissing-prototypes]
   size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
          ^
   drivers/iommu/iommu.c:2012:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
   ^
   static 
   3 warnings generated.


vim +/__iommu_map +1861 drivers/iommu/iommu.c

  1860	
> 1861	int __iommu_map(struct iommu_domain *domain, unsigned long iova,
  1862		      phys_addr_t paddr, size_t size, int prot, gfp_t gfp)
  1863	{
  1864		const struct iommu_ops *ops = domain->ops;
  1865		unsigned long orig_iova = iova;
  1866		unsigned int min_pagesz;
  1867		size_t orig_size = size;
  1868		phys_addr_t orig_paddr = paddr;
  1869		int ret = 0;
  1870	
  1871		if (unlikely(ops->map == NULL ||
  1872			     domain->pgsize_bitmap == 0UL))
  1873			return -ENODEV;
  1874	
  1875		if (unlikely(!(domain->type & __IOMMU_DOMAIN_PAGING)))
  1876			return -EINVAL;
  1877	
  1878		/* find out the minimum page size supported */
  1879		min_pagesz = 1 << __ffs(domain->pgsize_bitmap);
  1880	
  1881		/*
  1882		 * both the virtual address and the physical one, as well as
  1883		 * the size of the mapping, must be aligned (at least) to the
  1884		 * size of the smallest page supported by the hardware
  1885		 */
  1886		if (!IS_ALIGNED(iova | paddr | size, min_pagesz)) {
  1887			pr_err("unaligned: iova 0x%lx pa %pa size 0x%zx min_pagesz 0x%x\n",
  1888			       iova, &paddr, size, min_pagesz);
  1889			return -EINVAL;
  1890		}
  1891	
  1892		pr_debug("map: iova 0x%lx pa %pa size 0x%zx\n", iova, &paddr, size);
  1893	
  1894		while (size) {
  1895			size_t pgsize = iommu_pgsize(domain, iova | paddr, size);
  1896	
  1897			pr_debug("mapping: iova 0x%lx pa %pa pgsize 0x%zx\n",
  1898				 iova, &paddr, pgsize);
  1899			ret = ops->map(domain, iova, paddr, pgsize, prot, gfp);
  1900	
  1901			if (ret)
  1902				break;
  1903	
  1904			iova += pgsize;
  1905			paddr += pgsize;
  1906			size -= pgsize;
  1907		}
  1908	
  1909		if (ops->iotlb_sync_map)
  1910			ops->iotlb_sync_map(domain);
  1911	
  1912		/* unroll mapping in case something went wrong */
  1913		if (ret)
  1914			iommu_unmap(domain, orig_iova, orig_size - size);
  1915		else
  1916			trace_map(orig_iova, orig_paddr, orig_size);
  1917	
  1918		return ret;
  1919	}
  1920	
  1921	int iommu_map(struct iommu_domain *domain, unsigned long iova,
  1922		      phys_addr_t paddr, size_t size, int prot)
  1923	{
  1924		might_sleep();
  1925		return __iommu_map(domain, iova, paddr, size, prot, GFP_KERNEL);
  1926	}
  1927	EXPORT_SYMBOL_GPL(iommu_map);
  1928	
  1929	int iommu_map_atomic(struct iommu_domain *domain, unsigned long iova,
  1930		      phys_addr_t paddr, size_t size, int prot)
  1931	{
  1932		return __iommu_map(domain, iova, paddr, size, prot, GFP_ATOMIC);
  1933	}
  1934	EXPORT_SYMBOL_GPL(iommu_map_atomic);
  1935	
  1936	static size_t __iommu_unmap(struct iommu_domain *domain,
  1937				    unsigned long iova, size_t size,
  1938				    struct iommu_iotlb_gather *iotlb_gather)
  1939	{
  1940		const struct iommu_ops *ops = domain->ops;
  1941		size_t unmapped_page, unmapped = 0;
  1942		unsigned long orig_iova = iova;
  1943		unsigned int min_pagesz;
  1944	
  1945		if (unlikely(ops->unmap == NULL ||
  1946			     domain->pgsize_bitmap == 0UL))
  1947			return 0;
  1948	
  1949		if (unlikely(!(domain->type & __IOMMU_DOMAIN_PAGING)))
  1950			return 0;
  1951	
  1952		/* find out the minimum page size supported */
  1953		min_pagesz = 1 << __ffs(domain->pgsize_bitmap);
  1954	
  1955		/*
  1956		 * The virtual address, as well as the size of the mapping, must be
  1957		 * aligned (at least) to the size of the smallest page supported
  1958		 * by the hardware
  1959		 */
  1960		if (!IS_ALIGNED(iova | size, min_pagesz)) {
  1961			pr_err("unaligned: iova 0x%lx size 0x%zx min_pagesz 0x%x\n",
  1962			       iova, size, min_pagesz);
  1963			return 0;
  1964		}
  1965	
  1966		pr_debug("unmap this: iova 0x%lx size 0x%zx\n", iova, size);
  1967	
  1968		/*
  1969		 * Keep iterating until we either unmap 'size' bytes (or more)
  1970		 * or we hit an area that isn't mapped.
  1971		 */
  1972		while (unmapped < size) {
  1973			size_t pgsize = iommu_pgsize(domain, iova, size - unmapped);
  1974	
  1975			unmapped_page = ops->unmap(domain, iova, pgsize, iotlb_gather);
  1976			if (!unmapped_page)
  1977				break;
  1978	
  1979			pr_debug("unmapped: iova 0x%lx size 0x%zx\n",
  1980				 iova, unmapped_page);
  1981	
  1982			iova += unmapped_page;
  1983			unmapped += unmapped_page;
  1984		}
  1985	
  1986		trace_unmap(orig_iova, size, unmapped);
  1987		return unmapped;
  1988	}
  1989	
  1990	size_t iommu_unmap(struct iommu_domain *domain,
  1991			   unsigned long iova, size_t size)
  1992	{
  1993		struct iommu_iotlb_gather iotlb_gather;
  1994		size_t ret;
  1995	
  1996		iommu_iotlb_gather_init(&iotlb_gather);
  1997		ret = __iommu_unmap(domain, iova, size, &iotlb_gather);
  1998		iommu_tlb_sync(domain, &iotlb_gather);
  1999	
  2000		return ret;
  2001	}
  2002	EXPORT_SYMBOL_GPL(iommu_unmap);
  2003	
  2004	size_t iommu_unmap_fast(struct iommu_domain *domain,
  2005				unsigned long iova, size_t size,
  2006				struct iommu_iotlb_gather *iotlb_gather)
  2007	{
  2008		return __iommu_unmap(domain, iova, size, iotlb_gather);
  2009	}
  2010	EXPORT_SYMBOL_GPL(iommu_unmap_fast);
  2011	
> 2012	size_t __iommu_map_sg(struct iommu_domain *domain, unsigned long iova,
  2013			    struct scatterlist *sg, unsigned int nents, int prot,
  2014			    gfp_t gfp)
  2015	{
  2016		size_t len = 0, mapped = 0;
  2017		phys_addr_t start;
  2018		unsigned int i = 0;
  2019		int ret;
  2020	
  2021		while (i <= nents) {
  2022			phys_addr_t s_phys = sg_phys(sg);
  2023	
  2024			if (len && s_phys != start + len) {
  2025				ret = __iommu_map(domain, iova + mapped, start,
  2026						len, prot, gfp);
  2027	
  2028				if (ret)
  2029					goto out_err;
  2030	
  2031				mapped += len;
  2032				len = 0;
  2033			}
  2034	
  2035			if (len) {
  2036				len += sg->length;
  2037			} else {
  2038				len = sg->length;
  2039				start = s_phys;
  2040			}
  2041	
  2042			if (++i < nents)
  2043				sg = sg_next(sg);
  2044		}
  2045	
  2046		return mapped;
  2047	
  2048	out_err:
  2049		/* undo mappings already done */
  2050		iommu_unmap(domain, iova, mapped);
  2051	
  2052		return 0;
  2053	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
