Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B78E277CAE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Aug 2025 06:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755500099; cv=none; b=mGoxL5O3diSpG1uohOA9JsENkJgL9QNQbc9NcuZoMdDK3nfvo6Zk2kNaDAF34UoVSkGlklP+ADnDCc5Ikyal0HrAlJVIHIoWJ1SFRUneV9PU9xQCpgY4+V8vgtKeOeX9gatirPrFrBpAihTnv8kZEUCk0FB01CoNif4ixmNxqNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755500099; c=relaxed/simple;
	bh=Gdt71NQMRvpYIrZzc94pOE8mGSEZooDfHubZ+/iyHBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rPUnhnjX+2Wqzueru2fhwD7mEhCcQB3nxIqep6bcz3rVaXNlA8gKKN9S3FeBscIv1PJlf6k3/Sfj2x9B18gQ/vkQSXWZwJbwRzN3dvIfKCU/1Xj+KU3HXuH07SjTFuNt61rRl1db9WA3c/rIbOnYKTLoiq/34MC4oy9dO3nDPdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WgmSmdiJ; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WgmSmdiJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755500097; x=1787036097;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gdt71NQMRvpYIrZzc94pOE8mGSEZooDfHubZ+/iyHBk=;
  b=WgmSmdiJLkwF1Bq6cnvTtpkC02LYykcsrpwUXbaCPrUwPRZmr/qOWNUW
   Zh9+aM1aOEfy8zRIez2zcWf2z0efuAL8F6xOr+xhNZ9+nYae0y+Li4SLE
   0cJQJ9InkFFW3LDXOlvcQK5L1VdgjyfZAmkZD2NIiT6yI+sp46WpScg76
   xgGBpESZa1qkxrIM9xHJ2rzX7/vfwYNaeU8GIkN+zL//UwroRFENLUDZl
   IXM+uhsiqmO7IgCSBp0720Xy26C6HFre7lpzD7tIqkgUjpLxfN/Z8HM/z
   IvURTmB6DWk+uRf7PTGT+xeu75OFtKgXtNo2DnNDk+t/cj/AJfffRi/Fg
   g==;
X-CSE-ConnectionGUID: /T6GVheQRF2LSME/RzYUpA==
X-CSE-MsgGUID: jp38py/ISgORpON1G1asEA==
X-IronPort-AV: E=McAfee;i="6800,10657,11524"; a="56923576"
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="56923576"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2025 23:54:57 -0700
X-CSE-ConnectionGUID: Kk8uiPoKQF24hjJzO1T9sA==
X-CSE-MsgGUID: Vn0ST9h9Q6OBf4jA09zeAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,293,1747724400"; 
   d="scan'208";a="171727362"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 17 Aug 2025 23:54:55 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1untld-00012J-2b;
	Mon, 18 Aug 2025 06:54:53 +0000
Date: Mon, 18 Aug 2025 08:54:37 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2687/2687] mm/madvise.c:297:6: warning: no
 previous prototype for function 'force_swapin_vma'
Message-ID: <202508180823.hOEzzv8k-lkp@intel.com>
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
head:   08d6c0b8f95e9c676bd9bc28b12d198df722218e
commit: 92a0eb9bde6c03412b39f9f3d20968c091ea3b46 [2687/2687] memcg: introduce per-memcg swapin interface
config: x86_64-buildonly-randconfig-2003-20250818 (https://download.01.org/0day-ci/archive/20250818/202508180823.hOEzzv8k-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250818/202508180823.hOEzzv8k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508180823.hOEzzv8k-lkp@intel.com/

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
