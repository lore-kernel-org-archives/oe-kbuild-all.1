Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B494030101A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 03:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765250110; cv=none; b=mwH7WSwl8310ZubgZcod/wXluL8wt6U65Lc0v8a9HyvqquhfNbd0uGWUCyrmuZeBDftj097iz2ugskMGty9ZZQNu+NCToaKeXJwKDAU4rc4pGtFEsCA7noOGl16PVkYCXMmCYGdpcNipPS6DAgGI03rqicY4oZxDRwouLga/M0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765250110; c=relaxed/simple;
	bh=a6+IjzFHnwb0h+YrfqNWxu/0lvm/YB5Usv3jnSyTJT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNdsYflvdiKbdsj9hWWsz3XFBnMGY38jYalSCqIIltn7KoEVX5bvHlah2kEjvGT7PRoHjx5zBl6zjjNNHDKJgXLk969FC0YJvaqvtjsNVWhaLEiqji4lhwLj/G8W0nCW80SC81FDS/DdwoGz+y4j1sAHkMVcJWKr4wb3ZkTDcE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cZrvendv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cZrvendv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765250107; x=1796786107;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a6+IjzFHnwb0h+YrfqNWxu/0lvm/YB5Usv3jnSyTJT0=;
  b=cZrvendvkNfAoK9uFXGkUHgrKsYhNvRIEfxvlyxFPPZiiIZ9l7kDdl3L
   /EusIjqxYCib7TjDTKrmtNXL63nD9pAyvKnkCknEN2eWnm0Ldlh7EwWms
   qc38lx7mUqxtMX37skkHMb8F5Dvu9fyxxOA8jTZipjdGPTHtwWhkxjQyJ
   4w1y6kwiPjwgnsA0YeDKE8TqfB+o1o2zUjjJ3BYuBK1n9iLij1wH5qC8B
   zBYaxXEWpiJeMR33uetHjoI0Myp+xcc+2mMij21Ao3k/c7Bg2Dn7d3SNT
   b7G8U+ElSnBfzSudK8cBdQeYto+EbGo63S8uOOy1GOPMJOh9hjv5Qa26/
   A==;
X-CSE-ConnectionGUID: k/SFRQgUR9iP/Q6mRAisGw==
X-CSE-MsgGUID: N+dZRylbQJC9CnE7Bf4dsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="67087337"
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="67087337"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 19:15:07 -0800
X-CSE-ConnectionGUID: aL/15LsdSTWh6qdb0We9HA==
X-CSE-MsgGUID: Bvn7ROpHTba85wmImeHH6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,260,1758610800"; 
   d="scan'208";a="195885924"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2025 19:15:07 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSoBr-000000001FF-3feW;
	Tue, 09 Dec 2025 03:15:03 +0000
Date: Tue, 9 Dec 2025 11:14:20 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3493/3493] mm/madvise.c:297:6: warning: no
 previous prototype for function 'force_swapin_vma'
Message-ID: <202512091138.u8NXXfZk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Liu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   36141432a37f7dedddde8825e724b07ce3a440fb
commit: 92a0eb9bde6c03412b39f9f3d20968c091ea3b46 [3493/3493] memcg: introduce per-memcg swapin interface
config: x86_64-randconfig-r122-20251209 (https://download.01.org/0day-ci/archive/20251209/202512091138.u8NXXfZk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512091138.u8NXXfZk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512091138.u8NXXfZk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/madvise.c:9:
   In file included from include/linux/mman.h:5:
   In file included from include/linux/mm.h:2181:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   In file included from mm/madvise.c:21:
   include/linux/mm_inline.h:46:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      46 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:48:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      48 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
>> mm/madvise.c:297:6: warning: no previous prototype for function 'force_swapin_vma' [-Wmissing-prototypes]
     297 | void force_swapin_vma(struct vm_area_struct *vma)
         |      ^
   mm/madvise.c:297:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     297 | void force_swapin_vma(struct vm_area_struct *vma)
         | ^
         | static 
   4 warnings generated.


vim +/force_swapin_vma +297 mm/madvise.c

   280	
   281	#ifdef CONFIG_MEMCG_SWAP_QOS
   282	void force_swapin_vma(struct vm_area_struct *vma)
   283	{
   284		struct file *file = vma->vm_file;
   285	
   286		if (!can_madv_lru_vma(vma))
   287			return;
   288	
   289		if (!file) {
   290			walk_page_vma(vma, &swapin_walk_ops, vma);
   291			lru_add_drain();
   292		} else if (shmem_mapping(file->f_mapping))
   293			shmem_swapin_range(vma, vma->vm_start,
   294				vma->vm_end, file->f_mapping);
   295	}
   296	#else
 > 297	void force_swapin_vma(struct vm_area_struct *vma)
   298	{
   299	}
   300	#endif
   301	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
