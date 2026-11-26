Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795660883;
	b=ImK1yeg5rTe/oCk9nXdqGQdWqPwgKehHKA3LyC4llcT6iJTv9qFSMnT9zX60EBr7BwHE
	 DvnzGNbiDqDUOJTJzw5YtpzSVBnrUtCoRohRhpFZSu0xnJ+pOLx6ZPNS5cIui8ZIH0qXh
	 AC3gdCe2+POIhbUk9gtAeHW8S0cJjIQlsN3ecVL3Cgs/oCo+K0E7+9rdgN38S7i/+i62f
	 zSQ0cXz2L2iW2RQD+HOM6/xQvKYt78DFTgF9P8jR8eazcnbUlryyBvTgWjR7gBE0BKttU
	 ywzrd42Tz+/KzlAoOLWwUSwbFW7VzPmDpLAkO6/dc6i318wDq1EBon+dO9NucoFJvlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795660883;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=16ZuTqAcZ8KAfqE9UkOGZrGXGIRCKI4DGNHZTkYkd24=;
	b=BkMbJ6kShx+UJDYxGO2Ahu28NYiH95vF/Tf5qp0g766X3rg4O9iiiJ2f8w6/j7e6OWr2
	 LP17uZDjPTfvkY5GzGWCH9FDMuVGG4m2nxI50f3S34YZccZWt2CWymCkjRHNICdSU4eBF
	 lfJIQql7N2WXywem7g9WUljinNmceaY2n7oVe3/U5ZOOmg0QSL87EAEk0Hh0MY0W+UddJ
	 /KyTlSKwb7fomvKfX3IjLA0JWXI2hCDVFF3hLGOrzl4IlDtPhESPbJPndtFgcEYvRAP1K
	 q7AvD363pjiI8/EriMatlqmHznGG1xOZW7m55aBqRavh/kvEfdnsrDY1OilFGALrpaQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jZKOyoTu;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56420606A31E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Nov 2026 02:41:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56420606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=jZKOyoTu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795660883; x=1827196883;
  h=date:from:to:cc:subject:message-id;
  bh=3pEOtaBk4gQkXC9KmwpDHzzy1xATxR4r+VSIF2hZzXg=;
  b=jZKOyoTuYDfZxaGPKhddU8QsUMTJehK4aLUGLJqdXxID8rnmAtxbrv/l
   ozwjflcDa231Z0O76P+ggkfTZnNEOntSIaXEWhpNGaf3Wt70DMYJMdmC9
   spS/xiBhCFghHn4qHCDbwM6vI4Z6wND6d/RP+mPE+miRAGX2hNn2pAptK
   dE+Z7frSNWP+czhuK1vgAg+aapDZeZ6FLeJ6IQIz+9cPt3Zeo8B+F37w7
   OQRoVsuvIyRNYO8NtPBcpnoko/CqrYVsMxyQqpbUUcZq4deGog9Xvuklx
   Qz8b+olSughVDD8jkVZbWfq1zw45qEQXfFeeYeLJFWRJcM/oQkiwS/LCP
   w==;
X-CSE-ConnectionGUID: 3SG+v5DDRyu8H1HRJYP5yA==
X-CSE-MsgGUID: rQAqTHvmTwWtmhY0vH8ZAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4573616"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4573616"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 18:41:22 -0800
X-CSE-ConnectionGUID: C4zL3QgeTAKr4kqj7fP0zA==
X-CSE-MsgGUID: KRg+hXMcTVOdHLX7hg2MHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12259350"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 25 Nov 2026 18:41:21 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWPQF-000000000Cd-1J1l;
	Thu, 26 Nov 2026 02:41:19 +0000
Date: Thu, 26 Nov 2026 03:40:28 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 1/1]
 fs/kernfs/dir.c:481: warning: Function parameter or struct member
 'drop_supers' not described in 'kernfs_drain'
Message-ID: <20261126033645.Mlrw3sK7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   96e6653e8ca7d0446e82ff4170986314fd2fece2
commit: ed25e03619a903b30b39688f75788d9e94c79572 [1/1] UPSTREAM: kernfs: Send IN_DELETE_SELF and IN_IGNORED
config: x86_64-randconfig-2200-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126033645.Mlrw3sK7-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126033645.Mlrw3sK7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261126033645.Mlrw3sK7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/kernfs/dir.c:481: warning: Function parameter or struct member 'drop_supers' not described in 'kernfs_drain'


vim +481 fs/kernfs/dir.c

fd7b9f7b9776b1 Tejun Heo    2013-11-28  469  
fd7b9f7b9776b1 Tejun Heo    2013-11-28  470  /**
81c173cb5e87fb Tejun Heo    2014-02-03  471   * kernfs_drain - drain kernfs_node
81c173cb5e87fb Tejun Heo    2014-02-03  472   * @kn: kernfs_node to drain
fd7b9f7b9776b1 Tejun Heo    2013-11-28  473   *
24b3e3dd9c9c74 Randy Dunlap 2022-11-11  474   * Drain existing usages and nuke all existing mmaps of @kn.  Multiple
81c173cb5e87fb Tejun Heo    2014-02-03  475   * removers may invoke this function concurrently on @kn and all will
81c173cb5e87fb Tejun Heo    2014-02-03  476   * return after draining is complete.
fd7b9f7b9776b1 Tejun Heo    2013-11-28  477   */
ed25e03619a903 T.J. Mercier 2026-02-25  478  static void kernfs_drain(struct kernfs_node *kn, bool drop_supers)
393c3714081a53 Minchan Kim  2021-11-18  479  	__releases(&kernfs_root(kn)->kernfs_rwsem)
393c3714081a53 Minchan Kim  2021-11-18  480  	__acquires(&kernfs_root(kn)->kernfs_rwsem)
fd7b9f7b9776b1 Tejun Heo    2013-11-28 @481  {
abd54f028ec309 Tejun Heo    2014-02-03  482  	struct kernfs_root *root = kernfs_root(kn);
fd7b9f7b9776b1 Tejun Heo    2013-11-28  483  
393c3714081a53 Minchan Kim  2021-11-18  484  	lockdep_assert_held_write(&root->kernfs_rwsem);
81c173cb5e87fb Tejun Heo    2014-02-03  485  	WARN_ON_ONCE(kernfs_active(kn));
abd54f028ec309 Tejun Heo    2014-02-03  486  
2d7f9f8c181570 Tejun Heo    2022-08-27  487  	/*
2d7f9f8c181570 Tejun Heo    2022-08-27  488  	 * Skip draining if already fully drained. This avoids draining and its
2d7f9f8c181570 Tejun Heo    2022-08-27  489  	 * lockdep annotations for nodes which have never been activated
2d7f9f8c181570 Tejun Heo    2022-08-27  490  	 * allowing embedding kernfs_remove() in create error paths without
2d7f9f8c181570 Tejun Heo    2022-08-27  491  	 * worrying about draining.
2d7f9f8c181570 Tejun Heo    2022-08-27  492  	 */
2d7f9f8c181570 Tejun Heo    2022-08-27  493  	if (atomic_read(&kn->active) == KN_DEACTIVATED_BIAS &&
2d7f9f8c181570 Tejun Heo    2022-08-27  494  	    !kernfs_should_drain_open_files(kn))
2d7f9f8c181570 Tejun Heo    2022-08-27  495  		return;
2d7f9f8c181570 Tejun Heo    2022-08-27  496  
393c3714081a53 Minchan Kim  2021-11-18  497  	up_write(&root->kernfs_rwsem);
ed25e03619a903 T.J. Mercier 2026-02-25  498  	if (drop_supers)
ed25e03619a903 T.J. Mercier 2026-02-25  499  		up_read(&root->kernfs_supers_rwsem);
35beab0635f3cd Tejun Heo    2014-02-03  500  
182fd64b663422 Tejun Heo    2014-02-03  501  	if (kernfs_lockdep(kn)) {
35beab0635f3cd Tejun Heo    2014-02-03  502  		rwsem_acquire(&kn->dep_map, 0, 0, _RET_IP_);
35beab0635f3cd Tejun Heo    2014-02-03  503  		if (atomic_read(&kn->active) != KN_DEACTIVATED_BIAS)
324a56e16e44ba Tejun Heo    2013-12-11  504  			lock_contended(&kn->dep_map, _RET_IP_);
35beab0635f3cd Tejun Heo    2014-02-03  505  	}
abd54f028ec309 Tejun Heo    2014-02-03  506  
abd54f028ec309 Tejun Heo    2014-02-03  507  	wait_event(root->deactivate_waitq,
abd54f028ec309 Tejun Heo    2014-02-03  508  		   atomic_read(&kn->active) == KN_DEACTIVATED_BIAS);
fd7b9f7b9776b1 Tejun Heo    2013-11-28  509  
182fd64b663422 Tejun Heo    2014-02-03  510  	if (kernfs_lockdep(kn)) {
324a56e16e44ba Tejun Heo    2013-12-11  511  		lock_acquired(&kn->dep_map, _RET_IP_);
5facae4f3549b5 Qian Cai     2019-09-19  512  		rwsem_release(&kn->dep_map, _RET_IP_);
fd7b9f7b9776b1 Tejun Heo    2013-11-28  513  	}
35beab0635f3cd Tejun Heo    2014-02-03  514  
bdb2fd7fc56e19 Tejun Heo    2022-08-27  515  	if (kernfs_should_drain_open_files(kn))
0e67db2f9fe919 Tejun Heo    2016-12-27  516  		kernfs_drain_open_files(kn);
ccf02aaf8167bb Tejun Heo    2014-02-03  517  
ed25e03619a903 T.J. Mercier 2026-02-25  518  	if (drop_supers)
ed25e03619a903 T.J. Mercier 2026-02-25  519  		down_read(&root->kernfs_supers_rwsem);
393c3714081a53 Minchan Kim  2021-11-18  520  	down_write(&root->kernfs_rwsem);
a6607930b6cd82 Tejun Heo    2014-02-03  521  }
fd7b9f7b9776b1 Tejun Heo    2013-11-28  522  

:::::: The code at line 481 was first introduced by commit
:::::: fd7b9f7b9776b11df629e9dd3865320bf57ce588 sysfs, kernfs: move dir core code to fs/kernfs/dir.c

:::::: TO: Tejun Heo <tj@kernel.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
