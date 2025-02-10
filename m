Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F2BB261361
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 23:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739231084; cv=none; b=hhVrwUHHlEG46EP2c0MAHcQDZXj4mfZlvAfifTFjiFbjSXYpZoY4sRjSqIClXAk6k0Bm1KgBWiiVT+0gueZk3EK/LPBkFenFDH31kXdL0R5bYJuFPgdxMz/ODgoM/8RT/0Q1603Kl2wyaL9jlI+YZyijNoUkQnik0NXVCEJoNA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739231084; c=relaxed/simple;
	bh=c/f1EBXC+6Txpbj6xTVffsJ/qbqfGd9fn15EJImhiUY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nJbQb/zgF1LdzhpKxbPwOqHRuDQdwkcqxRPPwWr+b/scuqPfpHc+AL98fMvrW42IstABzcIIdX1yWr5o7b/xeHXR+BZyI2v4RvATexS4XcQ/LuBnIchCs0KDyBciCLTHY8r0jWMgdhawIA9ozxC7mPARkTZrq8+p8cjPkl/T9oQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kRuuiY/K; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kRuuiY/K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739231081; x=1770767081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c/f1EBXC+6Txpbj6xTVffsJ/qbqfGd9fn15EJImhiUY=;
  b=kRuuiY/KIxAnPLThMUcGjzaS24yk7/UFGOaIDc7pKAs1IQA6RwH85W+7
   AExfOX7UEdFzZz1zTLwQa6gO8VcAzWm2rWsMKatk2X6bOOdLBMdXodFd9
   Iw8UkZVdPzGYm0JxBR6SxNnkswNR3WuwJM3j2B3kuzYKNhPGnG+Lnlavh
   DFODej2mkIaBzL0P5iupzZ9yIA7r4J/fXiACZO6bTx07Ar5+XsDk2LaRs
   pJnn8LvelXmbIuGhZpV+HPrcx6X//jcAHRB0Jnelv1HgSqNJRjstm5Ym8
   guxT/bFkCPOolBnOUL4Tj/O1FRBhTzACSG/5qQaELw9qVAdvvWqLGipmN
   w==;
X-CSE-ConnectionGUID: ns5UFPYQTNaf99HZDWPSpw==
X-CSE-MsgGUID: bUxwDFe8SUmH7iw0l/vAPg==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="62308002"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; 
   d="scan'208";a="62308002"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 15:44:40 -0800
X-CSE-ConnectionGUID: AS0zkJf1QAm5EDgoWZZgXQ==
X-CSE-MsgGUID: tyxiAIAITtGYDtMQ8kts2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="143234927"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 10 Feb 2025 15:44:39 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thdS8-0013X9-19;
	Mon, 10 Feb 2025 23:44:36 +0000
Date: Tue, 11 Feb 2025 07:43:45 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [linux-next:master 1796/2407] fs/dax.c:1885:21: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202502110703.hGC7ZWMU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   df5d6180169ae06a2eac57e33b077ad6f6252440
commit: 046f7dac066cf5bc28d85f7f753cd272e8332be0 [1796/2407] fs/dax: properly refcount fs dax pages
config: x86_64-randconfig-121-20250210 (https://download.01.org/0day-ci/archive/20250211/202502110703.hGC7ZWMU-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250211/202502110703.hGC7ZWMU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502110703.hGC7ZWMU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/dax.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/fs_dax.h):
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:10:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:10:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:10:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   include/trace/events/fs_dax.h:153:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/fs_dax.h:153:1: sparse:     expected unsigned long mask
   include/trace/events/fs_dax.h:153:1: sparse:     got restricted vm_fault_t
   fs/dax.c:727:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long v @@     got restricted vm_fault_t @@
   fs/dax.c:727:39: sparse:     expected unsigned long v
   fs/dax.c:727:39: sparse:     got restricted vm_fault_t
   fs/dax.c:729:39: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long v @@     got restricted vm_fault_t @@
   fs/dax.c:729:39: sparse:     expected unsigned long v
   fs/dax.c:729:39: sparse:     got restricted vm_fault_t
   fs/dax.c:733:31: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long v @@     got restricted vm_fault_t @@
   fs/dax.c:733:31: sparse:     expected unsigned long v
   fs/dax.c:733:31: sparse:     got restricted vm_fault_t
   fs/dax.c:1376:41: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t [assigned] [usertype] ret @@
   fs/dax.c:1376:41: sparse:     expected int result
   fs/dax.c:1376:41: sparse:     got restricted vm_fault_t [assigned] [usertype] ret
>> fs/dax.c:1885:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int ret @@     got restricted vm_fault_t @@
   fs/dax.c:1885:21: sparse:     expected int ret
   fs/dax.c:1885:21: sparse:     got restricted vm_fault_t
   fs/dax.c:1887:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int ret @@     got restricted vm_fault_t @@
   fs/dax.c:1887:21: sparse:     expected int ret
   fs/dax.c:1887:21: sparse:     got restricted vm_fault_t
>> fs/dax.c:1890:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int ret @@
   fs/dax.c:1890:16: sparse:     expected restricted vm_fault_t
   fs/dax.c:1890:16: sparse:     got int ret
   fs/dax.c:1908:46: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t [usertype] ret @@
   fs/dax.c:1908:46: sparse:     expected int result
   fs/dax.c:1908:46: sparse:     got restricted vm_fault_t [usertype] ret
   fs/dax.c:1924:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [assigned] [usertype] ret @@     got unsigned long @@
   fs/dax.c:1924:21: sparse:     expected restricted vm_fault_t [assigned] [usertype] ret
   fs/dax.c:1924:21: sparse:     got unsigned long
   fs/dax.c:1965:51: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t [assigned] [usertype] ret @@
   fs/dax.c:1965:51: sparse:     expected int result
   fs/dax.c:1965:51: sparse:     got restricted vm_fault_t [assigned] [usertype] ret
   fs/dax.c:2141:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t @@
   fs/dax.c:2141:55: sparse:     expected int result
   fs/dax.c:2141:55: sparse:     got restricted vm_fault_t
   fs/dax.c:2159:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t [assigned] [usertype] ret @@
   fs/dax.c:2159:58: sparse:     expected int result
   fs/dax.c:2159:58: sparse:     got restricted vm_fault_t [assigned] [usertype] ret
   fs/dax.c:279:13: sparse: sparse: context imbalance in 'wait_entry_unlocked' - unexpected unlock
   fs/dax.c:508:49: sparse: sparse: context imbalance in 'dax_lock_folio' - different lock contexts for basic block
   fs/dax.c:575:17: sparse: sparse: context imbalance in 'dax_lock_mapping_entry' - different lock contexts for basic block
   fs/dax.c:1148:9: sparse: sparse: context imbalance in 'dax_writeback_one' - unexpected unlock

vim +1885 fs/dax.c

  1826	
  1827	/**
  1828	 * dax_fault_iter - Common actor to handle pfn insertion in PTE/PMD fault.
  1829	 * @vmf:	vm fault instance
  1830	 * @iter:	iomap iter
  1831	 * @pfnp:	pfn to be returned
  1832	 * @xas:	the dax mapping tree of a file
  1833	 * @entry:	an unlocked dax entry to be inserted
  1834	 * @pmd:	distinguish whether it is a pmd fault
  1835	 */
  1836	static vm_fault_t dax_fault_iter(struct vm_fault *vmf,
  1837			const struct iomap_iter *iter, pfn_t *pfnp,
  1838			struct xa_state *xas, void **entry, bool pmd)
  1839	{
  1840		const struct iomap *iomap = &iter->iomap;
  1841		const struct iomap *srcmap = iomap_iter_srcmap(iter);
  1842		size_t size = pmd ? PMD_SIZE : PAGE_SIZE;
  1843		loff_t pos = (loff_t)xas->xa_index << PAGE_SHIFT;
  1844		bool write = iter->flags & IOMAP_WRITE;
  1845		unsigned long entry_flags = pmd ? DAX_PMD : 0;
  1846		struct folio *folio;
  1847		int ret, err = 0;
  1848		pfn_t pfn;
  1849		void *kaddr;
  1850	
  1851		if (!pmd && vmf->cow_page)
  1852			return dax_fault_cow_page(vmf, iter);
  1853	
  1854		/* if we are reading UNWRITTEN and HOLE, return a hole. */
  1855		if (!write &&
  1856		    (iomap->type == IOMAP_UNWRITTEN || iomap->type == IOMAP_HOLE)) {
  1857			if (!pmd)
  1858				return dax_load_hole(xas, vmf, iter, entry);
  1859			return dax_pmd_load_hole(xas, vmf, iter, entry);
  1860		}
  1861	
  1862		if (iomap->type != IOMAP_MAPPED && !(iomap->flags & IOMAP_F_SHARED)) {
  1863			WARN_ON_ONCE(1);
  1864			return pmd ? VM_FAULT_FALLBACK : VM_FAULT_SIGBUS;
  1865		}
  1866	
  1867		err = dax_iomap_direct_access(iomap, pos, size, &kaddr, &pfn);
  1868		if (err)
  1869			return pmd ? VM_FAULT_FALLBACK : dax_fault_return(err);
  1870	
  1871		*entry = dax_insert_entry(xas, vmf, iter, *entry, pfn, entry_flags);
  1872	
  1873		if (write && iomap->flags & IOMAP_F_SHARED) {
  1874			err = dax_iomap_copy_around(pos, size, size, srcmap, kaddr);
  1875			if (err)
  1876				return dax_fault_return(err);
  1877		}
  1878	
  1879		folio = dax_to_folio(*entry);
  1880		if (dax_fault_is_synchronous(iter, vmf->vma))
  1881			return dax_fault_synchronous_pfnp(pfnp, pfn);
  1882	
  1883		folio_ref_inc(folio);
  1884		if (pmd)
> 1885			ret = vmf_insert_folio_pmd(vmf, pfn_folio(pfn_t_to_pfn(pfn)), write);
  1886		else
  1887			ret = vmf_insert_page_mkwrite(vmf, pfn_t_to_page(pfn), write);
  1888		folio_put(folio);
  1889	
> 1890		return ret;
  1891	}
  1892	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
