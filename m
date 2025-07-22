Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BCE32DC35C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 09:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753176462; cv=none; b=JMBW2CutZr7c77H3ojfbReeqbvF9hQ6oFbJULcz334Ku/kEVRinjJDCSj3d6ynp41Fyalslz4yhKQRcBOc7l2N0650Z456sjjmKpV6FKtQL8q622enHuLdAeBKsXDUYfqRNZ+kKxS+9DNfh7L8DhDns6Jti/d4jD8p43bDW9yDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753176462; c=relaxed/simple;
	bh=AU93TTb08Et7qjj4zb7KZTCFC6zzs0o1TnsPBCj0ysI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Be2dB9vQYEoi0/v5/RmPN9MqtbP1XoHqFNozteZcKkMu+VAe95gc2N5ZFdKOkijxp6fKxdKACAHDUqG2sOl5kyrtBTenAk5MrXvDC//dyXhvDVQjyUk1qfMFwpl4SR3wImIce60DnGib3LlFndq7dc6UUgamHUDipz5wx27mYQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/tX7utP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/tX7utP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753176460; x=1784712460;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AU93TTb08Et7qjj4zb7KZTCFC6zzs0o1TnsPBCj0ysI=;
  b=c/tX7utPswhngSBa46Shnpc3L2aQa3yewMvu0A229T8eSnmMGXHSQTeR
   UJB317nqaPn7Lcyp9AMZEoQBBnT+gwBSmqIy8ZLT7U7rjFEnTThYYvr1a
   W4yaa5dfl5ElZPJr/7GHJecRwmxU3Imhe4QiVf+7/k6Y4D/uXtjpem4W7
   KQ2tIojJcyPikNP4FFta2ZcVm2JtlBrbeEDgR2lDJyBFADhbdKPCanuUF
   31LpdfIrCtro7V4ZUVj0jAHXNxTcJ6Gn2IkOL43ZLupUVPRkISKXoY2SB
   9bVHnMYJCm/VzB+CwiAi63HIIckpAodQ0sQ6KJxse7nbDz+cu3NpLj4eR
   A==;
X-CSE-ConnectionGUID: d3XLJVXLSGSlkvq6eML64A==
X-CSE-MsgGUID: E2DQrOG9Rt2Kn90ueg6ipQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55504501"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55504501"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 02:27:38 -0700
X-CSE-ConnectionGUID: s36z4RHxTyq2vb/wzF3ZkA==
X-CSE-MsgGUID: zGhWTTkTRVeccGFV1jEgcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="164764704"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Jul 2025 02:27:36 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ue9Ha-000HeP-0n;
	Tue, 22 Jul 2025 09:27:34 +0000
Date: Tue, 22 Jul 2025 17:26:57 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 34/34] mm/slub.c:1904:1: warning:
 label 'find' defined but not used
Message-ID: <202507221741.0IOGBDGk-lkp@intel.com>
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
head:   7c51bc02ec5b3728140f3a1cd74cf21c8566be5c
commit: c0ddc144af5dedb37b3bc9324538d9f234f58d04 [34/34] anolis: mm: use oot_page_list to cache pages return to buddy
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250722/202507221741.0IOGBDGk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221741.0IOGBDGk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221741.0IOGBDGk-lkp@intel.com/

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
