Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9641332A3D1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Feb 2026 20:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771274318; cv=none; b=hTm7yRbOqxfARCsTQERVXdi2z1F6VT3dzI+k+Xxujhaynoav4d4IANvBierlv5igP65MBikGd4xKL/RCBjqNlK+Ehinty6KFxY8GUS0pYtY5ojJKKOMHzIpYFRReazhXbnanVIlxJsV/hghSfOjOyEdV2+nxaqAsZcjyXRUxQGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771274318; c=relaxed/simple;
	bh=K+r1yX2mtL2JeTD33rvmC2Bma1Q69iZQhwAXDSfGFLQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GrXR61iTMNr2kWSiNrlExRzTSJ89lvYRu5R5hsFTShnCClehS06rkkjmOZGLSziFpSlNMbyFA4yOF2UBJNW3qANXvjZY8WfptXc8AyscoJ0MdM52NcuhsfLIvMzdQt4aEiuIe/JwXIZNoYOT3QuysPtJxY9jT3jt0yxFCpn7b9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=apeK2QOt; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="apeK2QOt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771274316; x=1802810316;
  h=date:from:to:cc:subject:message-id;
  bh=K+r1yX2mtL2JeTD33rvmC2Bma1Q69iZQhwAXDSfGFLQ=;
  b=apeK2QOty3aCCpYIyhmlkLo77cpdvzgajwezrE6mDpSzn2yxAe0R9uR/
   oewfAhdWM1VhR6vrV0mNjYm71oNZRhADjSiafFiJZu3898CELVjY8DOfS
   izHrcWrPkizK7A/1F59UkcDQtR6JdnKvieT04SQ99WPdHt5FXiVQpOXPT
   xZVxSiNe/YX7A7OBEdL4Q+WzQCIVOpGzUABAhPVMAZeY8QJ1R9gZBB+yl
   hTPfSL3inORt20vJNN3smmyRcONK+4sNWQmGkfix7cR5FQZrjOcjfUQGa
   4DPCz9dHy/OFIH45LyQanjn95wPGACXsa2rrqtjUiClESaGl+5UwXuyGX
   A==;
X-CSE-ConnectionGUID: FRJF4vcoQLiaqT6jyvoG2A==
X-CSE-MsgGUID: xGGZDK94QEynPu4BZwU2Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="83079010"
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="83079010"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 12:38:34 -0800
X-CSE-ConnectionGUID: LHhPrfsnSK641ZXhCaEDmQ==
X-CSE-MsgGUID: f3dc1gkIQzeIVBRPMKXseA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,294,1763452800"; 
   d="scan'208";a="217844711"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Feb 2026 12:38:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vs5MT-000000010GY-3URm;
	Mon, 16 Feb 2026 20:38:29 +0000
Date: Tue, 17 Feb 2026 04:38:27 +0800
From: kernel test robot <lkp@intel.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Dan Williams <dan.j.williams@intel.com>
Subject: fs/dax.c:1885:21: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202602170406.kegA2Rkg-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f2acd3148e0ef42bdacbd477f90e8533f96b2ac
commit: 38607c62b34b46317c46d5baf1df03ac6e48a1c6 fs/dax: properly refcount fs dax pages
date:   11 months ago
config: arm64-randconfig-r121-20260216 (https://download.01.org/0day-ci/archive/20260217/202602170406.kegA2Rkg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602170406.kegA2Rkg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602170406.kegA2Rkg-lkp@intel.com/

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
   fs/dax.c:1888:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected int ret @@     got restricted vm_fault_t @@
   fs/dax.c:1888:21: sparse:     expected int ret
   fs/dax.c:1888:21: sparse:     got restricted vm_fault_t
>> fs/dax.c:1891:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted vm_fault_t @@     got int ret @@
   fs/dax.c:1891:16: sparse:     expected restricted vm_fault_t
   fs/dax.c:1891:16: sparse:     got int ret
   fs/dax.c:1909:46: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t [usertype] ret @@
   fs/dax.c:1909:46: sparse:     expected int result
   fs/dax.c:1909:46: sparse:     got restricted vm_fault_t [usertype] ret
   fs/dax.c:1925:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [assigned] [usertype] ret @@     got unsigned long @@
   fs/dax.c:1925:21: sparse:     expected restricted vm_fault_t [assigned] [usertype] ret
   fs/dax.c:1925:21: sparse:     got unsigned long
   fs/dax.c:1966:51: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t [assigned] [usertype] ret @@
   fs/dax.c:1966:51: sparse:     expected int result
   fs/dax.c:1966:51: sparse:     got restricted vm_fault_t [assigned] [usertype] ret
   fs/dax.c:2046:21: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted vm_fault_t [assigned] [usertype] ret @@     got unsigned long @@
   fs/dax.c:2046:21: sparse:     expected restricted vm_fault_t [assigned] [usertype] ret
   fs/dax.c:2046:21: sparse:     got unsigned long
   fs/dax.c:2080:62: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected int result @@     got restricted vm_fault_t [assigned] [usertype] ret @@
   fs/dax.c:2080:62: sparse:     expected int result
   fs/dax.c:2080:62: sparse:     got restricted vm_fault_t [assigned] [usertype] ret
   fs/dax.c:2142:55: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t @@
   fs/dax.c:2142:55: sparse:     expected int result
   fs/dax.c:2142:55: sparse:     got restricted vm_fault_t
   fs/dax.c:2160:58: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected int result @@     got restricted vm_fault_t [assigned] [usertype] ret @@
   fs/dax.c:2160:58: sparse:     expected int result
   fs/dax.c:2160:58: sparse:     got restricted vm_fault_t [assigned] [usertype] ret
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
> 1885			ret = vmf_insert_folio_pmd(vmf, pfn_folio(pfn_t_to_pfn(pfn)),
  1886						write);
  1887		else
  1888			ret = vmf_insert_page_mkwrite(vmf, pfn_t_to_page(pfn), write);
  1889		folio_put(folio);
  1890	
> 1891		return ret;
  1892	}
  1893	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
