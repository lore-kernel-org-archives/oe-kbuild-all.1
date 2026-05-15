Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77A6F3446C4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 May 2026 18:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778870426; cv=none; b=uO9HXYu2y2bY/qnC3QsdjVWcM4beU191oDneHQGnIHma854TgHzRsZ4iF7sTuJV8f65j5hyB8ZSRR33eYD6RtzYLExdTqLONPxNWLZY5/NzOgAaDu4CPIzZIz1fCSfc7UK6vYObTBwsS+XPPVNIqFGdQU0hP94/4/owiqeamz4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778870426; c=relaxed/simple;
	bh=xary3M6E7r3XB0ClNIB8eUg27rreO5g/wvJ09qkijGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mFWl4MjX86yN9RB/HVUm5IR1n5k+rLoMuBxAJJTnS8xf7CP8bb15xtQnMfvWHTe3zs0mwFIfb0K6f2lNGRQ757gic1n4I0N+XY6Xebe2pH5kNhVyjI//nHBXZxPPwxR5yA15ZXCICxuw+0i3p1DbweIop2cOtpBmdvAcgxrKBEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i0tFUtV1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i0tFUtV1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778870421; x=1810406421;
  h=date:from:to:cc:subject:message-id;
  bh=xary3M6E7r3XB0ClNIB8eUg27rreO5g/wvJ09qkijGU=;
  b=i0tFUtV1HU7x7HMKjgVv4mYdUljM0+PGNzVt7mt7bMPrcpP1PsaUTQwH
   6R8Uaoh0B+0xlCccRMRjpMo5tOn4f+Fb3Ek2G9koo0HNjsETn5OXdM+l9
   p5O/uWfOuvn6rXsK0zesLuiOpDYCIf5KgkUrlo9On9FVam6myOW0dkl9N
   c2i1QoLVqX/gVSTS7lk0+VM9y8y2LPSlaCx4JHAa+i9e88S0go7BYF7CQ
   s7EhTW8+QyEgJia5yCAhN+/VI+gcVPvPAIjkCtQZvOJyIOTs1159cZG4j
   ybyfZUtvWMoitIrJtWrL3hWNl+vutm7ZUggKn340z4k4Ffmlzc4i0UN+x
   A==;
X-CSE-ConnectionGUID: vPMweezYQeCYQ7b54r1nkg==
X-CSE-MsgGUID: OwaVwSZ2RZaHvLS5fyMlfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11787"; a="97403783"
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="97403783"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2026 11:40:16 -0700
X-CSE-ConnectionGUID: YYtMAdyKQv+beZ8+GOAgvw==
X-CSE-MsgGUID: P0xctVLkRdS+dGaRnPkp2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,236,1770624000"; 
   d="scan'208";a="236121958"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 15 May 2026 11:40:14 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNxSG-00000000953-3QaY;
	Fri, 15 May 2026 18:40:12 +0000
Date: Fri, 15 May 2026 20:39:16 +0200
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/percpu.c:1770:1: warning: the frame size of 4160 bytes is
 larger than 2048 bytes
Message-ID: <202605152051.NeYN6M3M-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/mm-memcontrol-propagate-NMI-slab-stats-to-memcg-vmstats/20260515-133820
head:   241d6156e9c6e933dc5459a817c1ce186dfa12d4
commit: 3a49555d7319e2e0144add9927fc117579e6f18b mm: percpu: per-node kmem accounting using local credit
date:   13 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260515/202605152051.NeYN6M3M-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605152051.NeYN6M3M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605152051.NeYN6M3M-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/percpu.c: In function 'pcpu_memcg_post_alloc_hook.part.0':
>> mm/percpu.c:1770:1: warning: the frame size of 4160 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    1770 | }
         | ^


vim +1770 mm/percpu.c

3c7be18ac9a06b Roman Gushchin  2020-08-11  1706  
3c7be18ac9a06b Roman Gushchin  2020-08-11  1707  static void pcpu_memcg_post_alloc_hook(struct obj_cgroup *objcg,
3c7be18ac9a06b Roman Gushchin  2020-08-11  1708  				       struct pcpu_chunk *chunk, int off,
3c7be18ac9a06b Roman Gushchin  2020-08-11  1709  				       size_t size)
3c7be18ac9a06b Roman Gushchin  2020-08-11  1710  {
3c7be18ac9a06b Roman Gushchin  2020-08-11  1711  	if (!objcg)
3c7be18ac9a06b Roman Gushchin  2020-08-11  1712  		return;
3c7be18ac9a06b Roman Gushchin  2020-08-11  1713  
8f30d2660a38be Kent Overstreet 2024-03-21  1714  	if (likely(chunk && chunk->obj_exts)) {
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1715  		unsigned int nr_pages = PAGE_ALIGN(size) >> PAGE_SHIFT;
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1716  		unsigned int precharge_pages = pcpu_memcg_nr_precharge_pages(size);
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1717  		unsigned int pages_used = 0;
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1718  		unsigned int node_credit[MAX_NUMNODES] = { 0 };
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1719  		unsigned int cpu;
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1720  		int nid;
b22fbf6c1fceb0 Alexandre Ghiti 2026-05-11  1721  
c63b835d0eafc9 Roman Gushchin  2023-10-19  1722  		obj_cgroup_get(objcg);
8f30d2660a38be Kent Overstreet 2024-03-21  1723  		chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].cgroup = objcg;
772616b031f06e Roman Gushchin  2020-08-11  1724  
772616b031f06e Roman Gushchin  2020-08-11  1725  		rcu_read_lock();
772616b031f06e Roman Gushchin  2020-08-11  1726  		mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B,
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1727  				pcpu_obj_total_size(size));
772616b031f06e Roman Gushchin  2020-08-11  1728  		rcu_read_unlock();
b22fbf6c1fceb0 Alexandre Ghiti 2026-05-11  1729  
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1730  		for_each_possible_cpu(cpu) {
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1731  			unsigned int i;
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1732  
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1733  			for (i = 0; i < nr_pages; i++) {
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1734  				void *addr = (void *)pcpu_chunk_addr(chunk, cpu,
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1735  								     PFN_DOWN(off) + i);
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1736  				size_t page_sz = i < nr_pages - 1 ?
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1737  					PAGE_SIZE : size - (nr_pages - 1) * PAGE_SIZE;
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1738  
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1739  				nid = page_to_nid(pcpu_addr_to_page(addr));
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1740  
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1741  				if (node_credit[nid] < page_sz) {
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1742  					struct obj_cgroup *nid_objcg;
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1743  
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1744  					nid_objcg = obj_cgroup_get_nid(objcg, nid);
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1745  					obj_cgroup_account_kmem(nid_objcg, 1);
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1746  					node_credit[nid] += PAGE_SIZE;
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1747  					pages_used++;
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1748  				}
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1749  
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1750  				node_credit[nid] -= page_sz;
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1751  			}
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1752  		}
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1753  
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1754  		/* Return unused precharged pages */
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1755  		if (pages_used < precharge_pages)
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1756  			obj_cgroup_unprecharge(objcg, precharge_pages - pages_used);
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1757  
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1758  		/* Put leftover per-node credit into stock */
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1759  		for_each_online_node(nid) {
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1760  			if (node_credit[nid] > 0) {
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1761  				struct obj_cgroup *nid_objcg;
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1762  
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1763  				nid_objcg = obj_cgroup_get_nid(objcg, nid);
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1764  				obj_cgroup_uncharge(nid_objcg, node_credit[nid]);
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1765  			}
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1766  		}
3c7be18ac9a06b Roman Gushchin  2020-08-11  1767  	} else {
3a49555d7319e2 Alexandre Ghiti 2026-05-11  1768  		obj_cgroup_unprecharge(objcg, pcpu_memcg_nr_precharge_pages(size));
3c7be18ac9a06b Roman Gushchin  2020-08-11  1769  	}
3c7be18ac9a06b Roman Gushchin  2020-08-11 @1770  }
3c7be18ac9a06b Roman Gushchin  2020-08-11  1771  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
