Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 318771C6B4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 03:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744081879; cv=none; b=mnh5wT0lCQF8FQdrOalQtSQfMGDjDpuNeo5sLF2ZIhTN7eC5j+E3081pIWDDmUpU5C+8papja63ZMCIHtek3RaWNon/7DBSX6VI5BvtfbuzT6pB7HSDIPKRyE3Iyy/0SbKIeVUWjs8pgeBJ5PgqEIiDiQr1ZZ907WQzDgs4PRKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744081879; c=relaxed/simple;
	bh=xE8JoKIdQ3CmNIH2DkgKHucnodyvb5xhob1+b68Ki7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y2LbnglG4LzPPy9wFKhyiEyZRxSZGs6bZmRPxAK53U70HQLSZrWk1EHg0esSNrfDn0DgDqh9g7zrgVtOIHOSnK7f1h8+DJ3W3vFoY5a5FXAruucjYnKRDiuWP9iFaNb4YDPGVoqX/+WA3FJ///Lh4INYiSY4LKSYX4ERzB0SJxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6daW2uD; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6daW2uD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744081877; x=1775617877;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xE8JoKIdQ3CmNIH2DkgKHucnodyvb5xhob1+b68Ki7k=;
  b=m6daW2uDRLM5Q2G5fmvzdA2eA9el5VpexkaZj15/BEp/vszSh9eZu7Zw
   5i4OnDq4NVWnGFnQRxhLYu/QC19V2B1Sj+gxQB4gGJKrZb5SvVTtRmaDo
   yTE94W2YUGrgn9Q0T7aAVfeZ+64QGJaAadakyLrTGZVgcPpuAdEGv5SIy
   RXfgalVCzxe7g8JqXLth3ds4ynEDBjy55/Nt0A7+95K5qoRbx1q+N6gLS
   WGcYyZ+yJSYWQXXsEwcMKxfUP+Dxfv6dQkYhZGF3E+KOhoMiotjZe6T/g
   UXRE0XhzTBaz/0nZnRdvoN3cWshzk9njwix7+B52RqSNFvD+ZPR42jFJ1
   Q==;
X-CSE-ConnectionGUID: q3OAEjVgT7uMC5iGNWks/w==
X-CSE-MsgGUID: IFk+V1ddRXGf7q0Mxgs3+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45629758"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="45629758"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 20:11:16 -0700
X-CSE-ConnectionGUID: vmd41UAKSOSwNWQyiXoYFA==
X-CSE-MsgGUID: HPIqtLYxSLuYkfhHWjVMJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="132992834"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Apr 2025 20:11:15 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1zMm-00044B-1K;
	Tue, 08 Apr 2025 03:11:12 +0000
Date: Tue, 8 Apr 2025 11:10:35 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 73/73] mm/slub.c:1904:1: warning:
 label 'find' defined but not used
Message-ID: <202504081126.PiK5Qf7U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yi,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   b25eef84f6a2a410019d17d8923cc61a9e127ceb
commit: 3d08021ea0c480fbdbc5f988309cc7684c35db4f [73/73] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250408/202504081126.PiK5Qf7U-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081126.PiK5Qf7U-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081126.PiK5Qf7U-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/slub.c: In function 'alloc_slab_page':
>> mm/slub.c:1904:1: warning: label 'find' defined but not used [-Wunused-label]
    1904 | find:
         | ^~~~
>> mm/slub.c:1874:13: warning: unused variable 'nid' [-Wunused-variable]
    1874 |         int nid;
         |             ^~~
>> mm/slub.c:1872:29: warning: unused variable 't' [-Wunused-variable]
    1872 |         struct slab *slab, *t;
         |                             ^


vim +/find +1904 mm/slub.c

  1864	
  1865	/*
  1866	 * Slab allocation and freeing
  1867	 */
  1868	static inline struct slab *alloc_slab_page(struct kmem_cache *s,
  1869			gfp_t flags, int node, struct kmem_cache_order_objects oo)
  1870	{
  1871		struct folio *folio;
> 1872		struct slab *slab, *t;
  1873		unsigned int order = oo_order(oo);
> 1874		int nid;
  1875	
  1876		flags |= __GFP_NOKFENCE;
  1877	
  1878	#ifdef CONFIG_MODULES
  1879		if (unlikely(s->is_oot)) {
  1880			spin_lock(&s->oot_lock);
  1881			list_for_each_entry_safe(slab, t, &s->oot_page_list, slab_list) {
  1882				nid = page_to_nid(&(slab_folio(slab)->page));
  1883				if (nid == node ||
  1884				   (node == NUMA_NO_NODE && nid == numa_node_id())) {
  1885					list_del(&slab->slab_list);
  1886					s->oot_page_num--;
  1887					spin_unlock(&s->oot_lock);
  1888					folio = slab_folio(slab);
  1889					goto find;
  1890				}
  1891			}
  1892			spin_unlock(&s->oot_lock);
  1893		}
  1894	#endif
  1895	
  1896		if (node == NUMA_NO_NODE)
  1897			folio = (struct folio *)alloc_pages(flags, order);
  1898		else
  1899			folio = (struct folio *)__alloc_pages_node(node, flags, order);
  1900	
  1901		if (!folio)
  1902			return NULL;
  1903	
> 1904	find:
  1905		slab = folio_slab(folio);
  1906		__folio_set_slab(folio);
  1907		/* Make the flag visible before any changes to folio->mapping */
  1908		smp_wmb();
  1909		if (folio_is_pfmemalloc(folio))
  1910			slab_set_pfmemalloc(slab);
  1911	
  1912		return slab;
  1913	}
  1914	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
