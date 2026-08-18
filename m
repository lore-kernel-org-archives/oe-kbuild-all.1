Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F08835C197
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 07:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787038789; cv=none; b=sSPfId9C6PORqoZ+TMPLRkWXyO+FrOh7NOiDMIAjnJpA4f8qA9tkoRDfSLFQ2if35WHjZtUcrwMq3wUpsbJ43C5Y4E2Itv0XsbdSurW1UyrCUB8PhvlkUGFil6G29UXIhB1zW5XoIRBoPYWZJMIXn3b4EnkTuyJL567rdEr1gHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787038789; c=relaxed/simple;
	bh=hQ8gdT3LASImVnNSUp6HQgsR4+X4t57iJZO7lfM96MQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=p9IcxDII0oH06UFj12zjV+iHfikSPBo18P2qUjgcIlYb18Ud7fHJieY8fl+l0U+PCnyqhg92LtaczcaVRk8eYzLGcZHYDzO5V8r2h8E7cES3Px6h8bYBlDx/fT2hjXQtXgeeM/VECjb2Bi/0LTE++jyxraP84Va1f2rQECUTLKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YM8l/C8K; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YM8l/C8K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787038788; x=1818574788;
  h=date:from:to:cc:subject:message-id;
  bh=hQ8gdT3LASImVnNSUp6HQgsR4+X4t57iJZO7lfM96MQ=;
  b=YM8l/C8KSj4tzeDtFuIdTpeuWDcVzVM1A5YBsPcsKUbaUZ7RS/XSzvyr
   jiQudJOXdN/F8wjgNhEuc8qml23UVV5dJqvH56obenpt3uTSVBx9r1is5
   /3uTxlWG44bcwSHCtgaq9lu0VFp+Pcyjxwev1+/zrFYt9bJi1+mpM1Rx6
   6Yf7CrEWRijaXmh4KEq17O8vK6VbRfcU/KnLNeD+yabTh5L5jMHhu5QO3
   ctCcuzJ/ipSafoVjA3kSJR6XEhkNbUH2PvkgRbd2bO7dYFa2TlGSy/LsR
   zP+6JJO0wXKdz9+BwJMnIyDSmrApdJASw8QxBcaXDaA7GZ6Cvh0FAiksR
   A==;
X-CSE-ConnectionGUID: kxpii/W7Rx+ZB1buqRxD6A==
X-CSE-MsgGUID: pyWoPzmrSvSwKDql+iveQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="87539577"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="87539577"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 00:39:48 -0700
X-CSE-ConnectionGUID: R0VLuTzrRNSEjNqLwmGumw==
X-CSE-MsgGUID: AzhTioCsQR6U5dwySD11KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="261865445"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 18 Aug 2026 00:39:46 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwEQC-0000000073l-2TQ0;
	Tue, 18 Aug 2026 07:39:44 +0000
Date: Tue, 18 Aug 2026 09:38:46 +0200
From: kernel test robot <lkp@intel.com>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/percpu.c:1748:1: warning: the frame size of 4304 bytes is
 larger than 2048 bytes
Message-ID: <202608180909.rbuXZ2uR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Alexandre-Ghiti/memcg-convert-task-objcg-to-a-per-node-objcgs-array/20260814-105220
head:   312c5531b4eccad1d6df5498a3f86bf6a3591348
commit: ece9a1822c4d19986136c28bef371b63ab7acd75 mm: percpu: per-node kmem accounting
date:   4 days ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260818/202608180909.rbuXZ2uR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180909.rbuXZ2uR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608180909.rbuXZ2uR-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/percpu.c: In function 'pcpu_memcg_free_hook':
>> mm/percpu.c:1748:1: warning: the frame size of 4304 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    1748 | }
         | ^
   mm/percpu.c: In function 'pcpu_memcg_post_alloc_hook.part.0':
   mm/percpu.c:1717:1: warning: the frame size of 4336 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    1717 | }
         | ^


vim +1748 mm/percpu.c

3c7be18ac9a06b Roman Gushchin  2020-08-11  1718  
3c7be18ac9a06b Roman Gushchin  2020-08-11  1719  static void pcpu_memcg_free_hook(struct pcpu_chunk *chunk, int off, size_t size)
3c7be18ac9a06b Roman Gushchin  2020-08-11  1720  {
ece9a1822c4d19 Alexandre Ghiti 2026-06-26  1721  	unsigned int node_bytes[MAX_NUMNODES] = { 0 };
3c7be18ac9a06b Roman Gushchin  2020-08-11  1722  	struct obj_cgroup *objcg;
ece9a1822c4d19 Alexandre Ghiti 2026-06-26  1723  	int nid;
3c7be18ac9a06b Roman Gushchin  2020-08-11  1724  
8f30d2660a38be Kent Overstreet 2024-03-21  1725  	if (unlikely(!chunk->obj_exts))
3c7be18ac9a06b Roman Gushchin  2020-08-11  1726  		return;
3c7be18ac9a06b Roman Gushchin  2020-08-11  1727  
8f30d2660a38be Kent Overstreet 2024-03-21  1728  	objcg = chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].cgroup;
faf65dde844aff Roman Gushchin  2021-06-02  1729  	if (!objcg)
faf65dde844aff Roman Gushchin  2021-06-02  1730  		return;
8f30d2660a38be Kent Overstreet 2024-03-21  1731  	chunk->obj_exts[off >> PCPU_MIN_ALLOC_SHIFT].cgroup = NULL;
3c7be18ac9a06b Roman Gushchin  2020-08-11  1732  
ece9a1822c4d19 Alexandre Ghiti 2026-06-26  1733  	pcpu_memcg_accumulate_pages(chunk, off, size, node_bytes);
3c7be18ac9a06b Roman Gushchin  2020-08-11  1734  
772616b031f06e Roman Gushchin  2020-08-11  1735  	rcu_read_lock();
772616b031f06e Roman Gushchin  2020-08-11  1736  	mod_memcg_state(obj_cgroup_memcg(objcg), MEMCG_PERCPU_B,
8c57c07741bf28 Qi Zheng        2022-01-14  1737  			-pcpu_obj_full_size(size));
ece9a1822c4d19 Alexandre Ghiti 2026-06-26  1738  
ece9a1822c4d19 Alexandre Ghiti 2026-06-26  1739  	/* Uncharge each node the exact bytes it was charged at alloc. */
ece9a1822c4d19 Alexandre Ghiti 2026-06-26  1740  	for_each_online_node(nid) {
ece9a1822c4d19 Alexandre Ghiti 2026-06-26  1741  		if (node_bytes[nid])
ece9a1822c4d19 Alexandre Ghiti 2026-06-26  1742  			obj_cgroup_uncharge(obj_cgroup_nid(objcg, nid),
ece9a1822c4d19 Alexandre Ghiti 2026-06-26  1743  					    node_bytes[nid]);
ece9a1822c4d19 Alexandre Ghiti 2026-06-26  1744  	}
772616b031f06e Roman Gushchin  2020-08-11  1745  	rcu_read_unlock();
772616b031f06e Roman Gushchin  2020-08-11  1746  
3c7be18ac9a06b Roman Gushchin  2020-08-11  1747  	obj_cgroup_put(objcg);
3c7be18ac9a06b Roman Gushchin  2020-08-11 @1748  }
3c7be18ac9a06b Roman Gushchin  2020-08-11  1749  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
