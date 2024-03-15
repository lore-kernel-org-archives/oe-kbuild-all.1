Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDE9C54901
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Mar 2024 21:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710538351; cv=none; b=bO3ei3UDGt3VxesnXagaRYhY0ShzYK85M4iTKZsk9J4ebvZPpJoeUYGdfK3d/yrxcPW+BiQby6wwQ6Ql1tdHI27QmU658GHcfGjWoRqTDY+3UBQjS9hnI+wT06rgVYUtT0S1LOEOSIH4I76jQ8ZMk/lonyejxRsuAlAcsz9pqO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710538351; c=relaxed/simple;
	bh=a9ZYOwoY5sDIo/JkD8Zag0QZTZeShi9mhkd3EMYKpX8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ehOcaZT7pzQ7tuBM630rACLDNfbSsnJO1IWsi/EnQu5tWSwLvOZttEjnwFAMLmEjzvL3AgFl4daZV6hE/xCeUbT0nBHuJ1Gip2qBz0cLoVLmIA1kNxeIZhinupK4WdAiBE5NB9m8ppKsJIA3EX5YzDslfWKJaNUsNn0Y3feJSOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVEnVMvH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVEnVMvH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710538348; x=1742074348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a9ZYOwoY5sDIo/JkD8Zag0QZTZeShi9mhkd3EMYKpX8=;
  b=fVEnVMvHM2CMeHkWuZmr5QTjT/uiXeH3qRTvAukJtetovn8zVF/gWsoy
   majeeoAEyj5qJnhZBeidSCmwhZEDZ7eraGROkO+a2ou1LFI1bxASMkUIu
   IfplCaLaDUzU8vVgQucR7ColqzKpbbvL8E/xa5+p3nTCm8iBYjjAD5MV9
   N7pZU97sTY9AxeVwYpeCmYik2LmZXyG3x+Wu9SWXSDuyW7ap5cI2jQn7X
   4GwwUo8JqaxCWLR0czWsdfblsDqJnz1PSzUN3ovu0vseMvcMVXJay6+68
   0vtAwk/ODkrcuijp57vVQ7F4oBqWiuPnkbjlR6x9P1TOWTkA/TlVLWhdD
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="22947903"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="22947903"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 14:32:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="12850176"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 15 Mar 2024 14:32:24 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlFA5-000Ep7-1P;
	Fri, 15 Mar 2024 21:32:21 +0000
Date: Sat, 16 Mar 2024 05:32:06 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/next 26635/27507] mm/page_alloc.c:3425:6:
 sparse: sparse: symbol 'memcg_check_throttle' was not declared. Should it be
 static?
Message-ID: <202403160542.1OfxcRga-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/next
head:   fdd5d0bfc620bd5147ff5b260822c7645aeddad6
commit: 516ef24612c03b2a7d95b05e1f949acb3c54227c [26635/27507] rue/mm: memprealloc provide dynamic watermark for cgroups with different priority
config: x86_64-randconfig-121-20240312 (https://download.01.org/0day-ci/archive/20240316/202403160542.1OfxcRga-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240316/202403160542.1OfxcRga-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403160542.1OfxcRga-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/page_alloc.c:110:1: sparse: sparse: symbol 'pcpu_drain_mutex' was not declared. Should it be static?
>> mm/page_alloc.c:3425:6: sparse: sparse: symbol 'memcg_check_throttle' was not declared. Should it be static?
   mm/page_alloc.c:3442:9: sparse: sparse: context imbalance in 'memcg_check_throttle' - different lock contexts for basic block
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:318:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:318:27: sparse: sparse: restricted gfp_t degrades to integer

vim +/memcg_check_throttle +3425 mm/page_alloc.c

  3423	
  3424	extern unsigned int total_throttle_time;
> 3425	void memcg_check_throttle(struct task_struct *curr,
  3426				  struct alloc_context *ac, gfp_t gfp_mask)
  3427	{
  3428		struct zone *zone;
  3429		struct zoneref *z;
  3430		int wmark_ratio, mark, interval, free_pages;
  3431		unsigned int ms;
  3432		struct mem_cgroup *memcg;
  3433		struct oom_control oc = {.gfp_mask = gfp_mask};
  3434	
  3435		memcg = mem_cgroup_from_task(curr);
  3436		wmark_ratio = memcg_get_wratio_from_current(NULL, memcg);
  3437		/* Just return for ratio 0 */
  3438		if (!wmark_ratio)
  3439			return;
  3440	
  3441		z = ac->preferred_zoneref;
  3442		for_next_zone_zonelist_nodemask(zone, z, ac->zonelist,
  3443						ac->high_zoneidx, ac->nodemask) {
  3444	
  3445			if (cpusets_enabled() &&
  3446				!__cpuset_zone_allowed(zone, gfp_mask))
  3447				continue;
  3448	
  3449			/* For offline process, just set throttle */
  3450			if (wmark_ratio > 0) {
  3451				interval = zone->_watermark[WMARK_LOW] -
  3452						zone->_watermark[WMARK_MIN];
  3453				mark = zone->_watermark[WMARK_MIN] +
  3454						wmark_ratio * interval / 100;
  3455				free_pages = zone_page_state(zone, NR_FREE_PAGES);
  3456	
  3457				if (free_pages < mark) {
  3458					ms = total_throttle_time * (mark - free_pages)
  3459						/ interval;
  3460					curr->mem_throttle_ms =
  3461						clamp(ms, 0U, total_throttle_time);
  3462					set_notify_resume(curr);
  3463					break;
  3464				}
  3465			} else {
  3466				/*
  3467				 * For online process, trigger priority reclaim
  3468				 * when it break standard watermark[MIN].
  3469				 */
  3470				mark = zone->_watermark[WMARK_MIN];
  3471				free_pages = zone_page_state(zone, NR_FREE_PAGES);
  3472	
  3473				if (free_pages < mark &&
  3474				    spin_trylock(&priority_reclaim_lock) && memcg) {
  3475					oc.memcg = memcg;
  3476					mem_cgroup_priority_reclaim(&oc);
  3477					spin_unlock(&priority_reclaim_lock);
  3478					break;
  3479				}
  3480			}
  3481		}
  3482	}
  3483	#endif
  3484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
