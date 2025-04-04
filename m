Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41D7B634
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Apr 2025 01:04:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743728665; cv=none; b=IiV22ISHkxYNuFngn3fP1dBpm2U8BGH17ES8fR6xYtV/nAFVYL705hRfXPbnWkyrVGZDMAPd5TTkfXzZKpRVnR9HqeMNjOZOkbLNbfHrh2RlMk3O3bBfXPHoXXNF7GVRcHdQGObeQ1j1CbVOGPwm1On602yr1vtaYbbBCs33/8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743728665; c=relaxed/simple;
	bh=qoA1PqKxlDZ111sdTNxZr8f7mGlRmFRScSxqlwAuNmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y68wZ44e1uVJVVlscjhqMXkAxcLb6G2QB7xI0hVB4GZ9TGZ1/e1PvCTlvR0V1nm5fU1c9jdJ+HMycGH89dpk07+C5rdOheaQgc1gwqgIt2FKnOSxJW5+qXSr9Wf+6yJ0u5+nfxmU/XebYQy9nT3E8yPxgyOslLjMnlsD/0PgxPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hh+ZP1nx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hh+ZP1nx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743728663; x=1775264663;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qoA1PqKxlDZ111sdTNxZr8f7mGlRmFRScSxqlwAuNmM=;
  b=Hh+ZP1nxFNuO8x3CrteElpklCYHak+iCWekJj7DDPg6sDsR2frqYUKBh
   mcXi0LS3ggAvpvlZkEsemvxE/ibiHSbTD4wLGSoAeSZuMh4JQqiZxcRmt
   p+Q3zgdWLcD37Ou52ufyVU5ByhR0jD0z/futlX3aLSvlAI/z6lPfxql+T
   dg92Hs/gZPAAQ00e9W1VM63BSvXaMDDCXtfKL+ILLu0x9C3A+HHe+aFnP
   HQSKV7DhwhLLbfaM9UEqxMdQdggEwLoleNS0ul3AddF0/aMhGUC5qoDJQ
   I6vToxXFMlU23paMxbShsYkIg4E0XlZMWw819eWBKgW4+vgwk55nhXNV+
   w==;
X-CSE-ConnectionGUID: S3Jw16jURTubrOOlpfuiCQ==
X-CSE-MsgGUID: Bkd3EvVPTJSdOmDzccVVBQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11393"; a="47879203"
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="47879203"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2025 18:04:22 -0700
X-CSE-ConnectionGUID: h6gRinZTRmKeKmucMeIpmg==
X-CSE-MsgGUID: /MkVPBmKQ+2u8FOoWjMErA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,186,1739865600"; 
   d="scan'208";a="126952697"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 03 Apr 2025 18:04:21 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0VTn-0000tn-0i;
	Fri, 04 Apr 2025 01:04:19 +0000
Date: Fri, 4 Apr 2025 09:03:26 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 2/4] drm/xe: Update xe_ttm_access_memory to use GPU
 for non-visible access
Message-ID: <202504040820.oEc4vaWF-lkp@intel.com>
References: <20250403202705.18488-3-matthew.brost@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403202705.18488-3-matthew.brost@intel.com>

Hi Matthew,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-xe/drm-xe-next]
[also build test WARNING on next-20250403]
[cannot apply to drm-exynos/exynos-drm-next linus/master drm/drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip v6.14]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Matthew-Brost/drm-xe-Add-devcoredump-chunking/20250404-042700
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250403202705.18488-3-matthew.brost%40intel.com
patch subject: [PATCH v2 2/4] drm/xe: Update xe_ttm_access_memory to use GPU for non-visible access
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20250404/202504040820.oEc4vaWF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250404/202504040820.oEc4vaWF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504040820.oEc4vaWF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/gpu/drm/xe/xe_migrate.c: In function 'xe_migrate_access_memory':
   drivers/gpu/drm/xe/xe_migrate.c:1819:19: error: 'XE_CACHELINE_MASK' undeclared (first use in this function)
    1819 |         if (len & XE_CACHELINE_MASK ||
         |                   ^~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_migrate.c:1819:19: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/xe/xe_migrate.c:1828:35: error: 'XE_CACHELINE_BYTES' undeclared (first use in this function); did you mean 'L1_CACHE_BYTES'?
    1828 |                         u8 bounce[XE_CACHELINE_BYTES];
         |                                   ^~~~~~~~~~~~~~~~~~
         |                                   L1_CACHE_BYTES
>> drivers/gpu/drm/xe/xe_migrate.c:1828:28: warning: unused variable 'bounce' [-Wunused-variable]
    1828 |                         u8 bounce[XE_CACHELINE_BYTES];
         |                            ^~~~~~
   drivers/gpu/drm/xe/xe_migrate.c:1888:27: error: implicit declaration of function 'xe_migrate_vram'; did you mean 'xe_migrate_to_vram'? [-Wimplicit-function-declaration]
    1888 |                 __fence = xe_migrate_vram(m, current_bytes,
         |                           ^~~~~~~~~~~~~~~
         |                           xe_migrate_to_vram
   drivers/gpu/drm/xe/xe_migrate.c:1892:43: error: 'XE_MIGRATE_COPY_TO_VRAM' undeclared (first use in this function)
    1892 |                                           XE_MIGRATE_COPY_TO_VRAM :
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/xe/xe_migrate.c:1893:43: error: 'XE_MIGRATE_COPY_TO_SRAM' undeclared (first use in this function)
    1893 |                                           XE_MIGRATE_COPY_TO_SRAM);
         |                                           ^~~~~~~~~~~~~~~~~~~~~~~


vim +/bounce +1828 drivers/gpu/drm/xe/xe_migrate.c

  1785	
  1786	/**
  1787	 * xe_migrate_access_memory - Access memory of a BO via GPU
  1788	 *
  1789	 * @m: The migration context.
  1790	 * @bo: buffer object
  1791	 * @offset: access offset into buffer object
  1792	 * @buf: pointer to caller memory to read into or write from
  1793	 * @len: length of access
  1794	 * @write: write access
  1795	 *
  1796	 * Access memory of a BO via GPU either reading in or writing from a passed in
  1797	 * pointer. Pointer is dma mapped for GPU access and GPU commands are issued to
  1798	 * read to or write from pointer.
  1799	 *
  1800	 * Returns:
  1801	 * 0 if successful, negative error code on failure.
  1802	 */
  1803	int xe_migrate_access_memory(struct xe_migrate *m, struct xe_bo *bo,
  1804				     unsigned long offset, void *buf, int len,
  1805				     int write)
  1806	{
  1807		struct xe_tile *tile = m->tile;
  1808		struct xe_device *xe = tile_to_xe(tile);
  1809		struct xe_res_cursor cursor;
  1810		struct dma_fence *fence = NULL;
  1811		dma_addr_t *dma_addr;
  1812		unsigned long page_offset = (unsigned long)buf & ~PAGE_MASK;
  1813		int bytes_left = len, current_page = 0;
  1814		void *orig_buf = buf;
  1815	
  1816		xe_bo_assert_held(bo);
  1817	
  1818		/* Use bounce buffer for small access and unaligned access */
> 1819		if (len & XE_CACHELINE_MASK ||
  1820		    ((uintptr_t)buf | offset) & XE_CACHELINE_MASK) {
  1821			int buf_offset = 0;
  1822	
  1823			/*
  1824			 * Less than ideal for large unaligned access but this should be
  1825			 * fairly rare, can fixup if this becomes common.
  1826			 */
  1827			do {
> 1828				u8 bounce[XE_CACHELINE_BYTES];
  1829				void *ptr = (void *)bounce;
  1830				int err;
  1831				int copy_bytes = min_t(int, bytes_left,
  1832						       XE_CACHELINE_BYTES -
  1833						       (offset & XE_CACHELINE_MASK));
  1834				int ptr_offset = offset & XE_CACHELINE_MASK;
  1835	
  1836				err = xe_migrate_access_memory(m, bo,
  1837							       offset &
  1838							       ~XE_CACHELINE_MASK,
  1839							       (void *)ptr,
  1840							       sizeof(bounce), 0);
  1841				if (err)
  1842					return err;
  1843	
  1844				if (!write) {
  1845					memcpy(buf + buf_offset, ptr + ptr_offset,
  1846					       copy_bytes);
  1847					goto next;
  1848				}
  1849	
  1850				memcpy(ptr + ptr_offset, buf + buf_offset, copy_bytes);
  1851				err = xe_migrate_access_memory(m, bo,
  1852							       offset & ~XE_CACHELINE_MASK,
  1853							       (void *)ptr,
  1854							       sizeof(bounce), 0);
  1855				if (err)
  1856					return err;
  1857	
  1858	next:
  1859				bytes_left -= copy_bytes;
  1860				buf_offset += copy_bytes;
  1861				offset += copy_bytes;
  1862			} while (bytes_left);
  1863	
  1864			return 0;
  1865		}
  1866	
  1867		dma_addr = xe_migrate_dma_map(xe, buf, len + page_offset, write);
  1868		if (IS_ERR(dma_addr))
  1869			return PTR_ERR(dma_addr);
  1870	
  1871		xe_res_first(bo->ttm.resource, offset, bo->size - offset, &cursor);
  1872	
  1873		do {
  1874			struct dma_fence *__fence;
  1875			u64 vram_addr = vram_region_gpu_offset(bo->ttm.resource) +
  1876				cursor.start;
  1877			int current_bytes;
  1878	
  1879			if (cursor.size > MAX_PREEMPTDISABLE_TRANSFER)
  1880				current_bytes = min_t(int, bytes_left,
  1881						      MAX_PREEMPTDISABLE_TRANSFER);
  1882			else
  1883				current_bytes = min_t(int, bytes_left, cursor.size);
  1884	
  1885			if (fence)
  1886				dma_fence_put(fence);
  1887	
  1888			__fence = xe_migrate_vram(m, current_bytes,
  1889						  (unsigned long)buf & ~PAGE_MASK,
  1890						  dma_addr + current_page,
  1891						  vram_addr, write ?
  1892						  XE_MIGRATE_COPY_TO_VRAM :
  1893						  XE_MIGRATE_COPY_TO_SRAM);
  1894			if (IS_ERR(__fence)) {
  1895				if (fence)
  1896					dma_fence_wait(fence, false);
  1897				fence = __fence;
  1898				goto out_err;
  1899			}
  1900			fence = __fence;
  1901	
  1902			buf += current_bytes;
  1903			offset += current_bytes;
  1904			current_page = (int)(buf - orig_buf) / PAGE_SIZE;
  1905			bytes_left -= current_bytes;
  1906			if (bytes_left)
  1907				xe_res_next(&cursor, current_bytes);
  1908		} while (bytes_left);
  1909	
  1910		dma_fence_wait(fence, false);
  1911		dma_fence_put(fence);
  1912		xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
  1913	
  1914		return 0;
  1915	
  1916	out_err:
  1917		xe_migrate_dma_unmap(xe, dma_addr, len + page_offset, write);
  1918		return PTR_ERR(fence);
  1919	}
  1920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
