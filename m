Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60D81C1F31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 00:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737678976; cv=none; b=Jb5d7P3lhsVJrUy+8P8bwJJ6DvIaXu9rdWMhHOUkUjWu8HMFcKRbgAyjE8rp8P+hw1DrhO7jfVBj81YKCebKlbwRVPAnck9kpgIT/wt03AZRlLXoPETcifDbHsXulR/vwrGPY8bX6iYVpHBQcszS1dHLzIrGxVP3Xg9P/tDDDqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737678976; c=relaxed/simple;
	bh=ym50aVEElgnd8peS0TeJvSaKsEriwneV6gN7JHtPLyU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IJ49PbTvMSseEPTn4o06pBe3IrnldacM8Jr4o2/5JYkP8/t0Wqe7CG1bz74nidEUpo8aSXr0vh9wk2vcVxlCQ09bvX9ZBwGT3WxkOzidbMJZ5IXEUctPsDXSojY3qs27vyyOW4U2bRxiXfvdvhx+Lw7VR7M3/Gl8LDjjciv6N5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7rqF+J5; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7rqF+J5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737678975; x=1769214975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ym50aVEElgnd8peS0TeJvSaKsEriwneV6gN7JHtPLyU=;
  b=V7rqF+J5tDklk77EfQjU6lvtMx/eftuQ87p9Hq47EDj3/7s8uR+b5RXk
   sDyrkaaJz6U+2GCZlXWt3a8pGGF64WFWSiY2zFWOl4EE4QMB3hflwcJkY
   7CHlM2QMg2RR68shizyb0YTzm3tpBiDcCn0Uk2ZMUFCmKEAD+AaomIqfN
   f6Fq1XH851KFg82KmmF9MJOpZ2t6QscMjuUx7ISxdXxsYzNj5BQyBLmQA
   78h+04g32i5MSP3VHmA1O3GGUI9pD0qhtOQl64zfzkuBLC98Z2ZUSlMfs
   GMOxPS0PQEkSDmBSdziLolcDcnKtAPHxdnVrsrUTEvHuY+Dw8aCpmk/kd
   g==;
X-CSE-ConnectionGUID: k4ND7C6XQr6vOHEhdAtVMw==
X-CSE-MsgGUID: Svc0uQsySLy9C/g3n3Zz9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="48794979"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="48794979"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 16:36:13 -0800
X-CSE-ConnectionGUID: FFK5ZJ0BT+eOxfbvjTUn+A==
X-CSE-MsgGUID: m24DbJ9SR2m2AiFAp5/A3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="144862217"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 23 Jan 2025 16:36:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb7g9-000bup-0C;
	Fri, 24 Jan 2025 00:36:09 +0000
Date: Fri, 24 Jan 2025 08:35:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/1] mm/vmscan.c:4372:6:
 warning: no previous prototype for function 'isolate_folio'
Message-ID: <202501240857.bZVI5vGy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   42acac516f1a68af96b56ab5987656f624b79fb2
commit: 0e47a7391b3e2e57c4769f14a7be0ba7b56b10ca [0/1] ANDROID: mm: export isolate_folio and reclaim_pages
config: i386-buildonly-randconfig-001-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240857.bZVI5vGy-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240857.bZVI5vGy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240857.bZVI5vGy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/vmscan.c:30:
   include/linux/mm_inline.h:47:41: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      47 |         __mod_lruvec_state(lruvec, NR_LRU_BASE + lru, nr_pages);
         |                                    ~~~~~~~~~~~ ^ ~~~
   include/linux/mm_inline.h:49:22: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
      49 |                                 NR_ZONE_LRU_BASE + lru, nr_pages);
         |                                 ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:412:51: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     412 |                         size += zone_page_state(zone, NR_ZONE_LRU_BASE + lru);
         |                                                       ~~~~~~~~~~~~~~~~ ^ ~~~
   mm/vmscan.c:1745:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    1745 |                         __count_zid_vm_events(PGSCAN_SKIP, zid, nr_skipped[zid]);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:2251:51: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2251 |         inactive = lruvec_page_state(lruvec, NR_LRU_BASE + inactive_lru);
         |                                              ~~~~~~~~~~~ ^ ~~~~~~~~~~~~
   mm/vmscan.c:2252:49: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
    2252 |         active = lruvec_page_state(lruvec, NR_LRU_BASE + active_lru);
         |                                            ~~~~~~~~~~~ ^ ~~~~~~~~~~
>> mm/vmscan.c:4372:6: warning: no previous prototype for function 'isolate_folio' [-Wmissing-prototypes]
    4372 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         |      ^
   mm/vmscan.c:4372:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    4372 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         | ^
         | static 
   mm/vmscan.c:4461:4: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    4461 |                         __count_zid_vm_events(PGSCAN_SKIP, zone, skipped_zone);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   mm/vmscan.c:6283:3: warning: arithmetic between different enumeration types ('enum vm_event_item' and 'enum zone_type') [-Wenum-enum-conversion]
    6283 |                 __count_zid_vm_events(ALLOCSTALL, sc->reclaim_idx, 1);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:139:34: note: expanded from macro '__count_zid_vm_events'
     139 |         __count_vm_events(item##_NORMAL - ZONE_NORMAL + zid, delta)
         |                           ~~~~~~~~~~~~~ ^ ~~~~~~~~~~~
   9 warnings generated.


vim +/isolate_folio +4372 mm/vmscan.c

  4371	
> 4372	bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
  4373	{
  4374		bool success;
  4375	
  4376		/* swap constrained */
  4377		if (!(sc->gfp_mask & __GFP_IO) &&
  4378		    (folio_test_dirty(folio) ||
  4379		     (folio_test_anon(folio) && !folio_test_swapcache(folio))))
  4380			return false;
  4381	
  4382		/* raced with release_pages() */
  4383		if (!folio_try_get(folio))
  4384			return false;
  4385	
  4386		/* raced with another isolation */
  4387		if (!folio_test_clear_lru(folio)) {
  4388			folio_put(folio);
  4389			return false;
  4390		}
  4391	
  4392		/* see the comment on MAX_NR_TIERS */
  4393		if (!folio_test_referenced(folio))
  4394			set_mask_bits(&folio->flags, LRU_REFS_MASK | LRU_REFS_FLAGS, 0);
  4395	
  4396		/* for shrink_folio_list() */
  4397		folio_clear_reclaim(folio);
  4398		folio_clear_referenced(folio);
  4399	
  4400		success = lru_gen_del_folio(lruvec, folio, true);
  4401		VM_WARN_ON_ONCE_FOLIO(!success, folio);
  4402	
  4403		return true;
  4404	}
  4405	EXPORT_SYMBOL_GPL(isolate_folio);
  4406	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
