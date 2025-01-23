Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5751C1D31A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Jan 2025 22:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737671802; cv=none; b=fnV86IMtxF6neDGCoiV0wgOuCJiJusk0C7wrndVBjUefetfXgJan+uHgvbqzDpBd7eZou40Z3d20TQqVoErtYEIYKt/7umCquaZxuSfJXSG15xJOA0FKGIQC5jokdWdm2tNWJjaXBpo/Qt7N5hkmlRBjSr9bQtbMR/l/dMmGhlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737671802; c=relaxed/simple;
	bh=z3imnnBxsQSbjIK/axSXeXuTZ6+V0VSPoU7RJgp/tzc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QeSTJbQAeAEK6lUes+pIwQ9IlL8wo+pTc6P89Y4iZ64vNcA4gf8xzIIFR+Hb9SpgQgR2i/rFI7aWca1Mcdfc8htYPMtByZ5LxyX2/m+tZ3DA3nbVf/Ch2nr++JquWx274naMEw4BP6Oc+euBnFCTIeS7/ikrLdHAY50P8Y/I3tM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G05YFwRC; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G05YFwRC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737671800; x=1769207800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z3imnnBxsQSbjIK/axSXeXuTZ6+V0VSPoU7RJgp/tzc=;
  b=G05YFwRCYNhEJ1r8pinm402n5cvnn2qm77w90s1wWMSxm6vwrEv30fz6
   snW4zJSYe7HcWpUHHokqIeXYugN8iqDezKcZqYVkHr0qT3WILLGmpHGuo
   SCVNn17hyz/QHOMtKttQPtbI15BmqQYNIvRyPSKd2IMarqIwHZ6IysxR2
   /zfwlW6F9xynu9vvZBhZjBJiuK1gBqYr4Oxe0//ftCw4RvV8m/FQZvbZv
   yZhoPxEMcKuZ0dp6Qqw+dAVk9B64n6E3+hn6y+8c4a+EJ/y8OSQe9HteT
   J91eDX033Ie7wJUcEFBJwg1EvE1/HNYVaPesVkL9WwWR3szdKMMbzzdV0
   A==;
X-CSE-ConnectionGUID: YYiR7n72TYSjWYPle+kY8g==
X-CSE-MsgGUID: dhIHAvqAQEKk6IoFtmvIBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="37894793"
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="37894793"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 14:36:39 -0800
X-CSE-ConnectionGUID: eJAA+CC/QYyki4yAO76BGA==
X-CSE-MsgGUID: vmd0eDqqTZCZACQv3hQCVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,229,1732608000"; 
   d="scan'208";a="112594576"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Jan 2025 14:36:38 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tb5oS-000bnV-2h;
	Thu, 23 Jan 2025 22:36:36 +0000
Date: Fri, 24 Jan 2025 06:35:38 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 2/2] mm/vmscan.c:4372:6: warning: no
 previous prototype for 'isolate_folio'
Message-ID: <202501240645.ysfaM2ej-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   51fe955bf6dfda4550402c3f4335814f77b4e297
commit: 0e47a7391b3e2e57c4769f14a7be0ba7b56b10ca [2/2] ANDROID: mm: export isolate_folio and reclaim_pages
config: i386-buildonly-randconfig-006-20250124 (https://download.01.org/0day-ci/archive/20250124/202501240645.ysfaM2ej-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250124/202501240645.ysfaM2ej-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501240645.ysfaM2ej-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:4372:6: warning: no previous prototype for 'isolate_folio' [-Wmissing-prototypes]
    4372 | bool isolate_folio(struct lruvec *lruvec, struct folio *folio, struct scan_control *sc)
         |      ^~~~~~~~~~~~~


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
