Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BF72475CF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 05:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766037465; cv=none; b=CMRALKkx8a4z2BU0oPP/+mXOzv2Kog/l9fg83qtPaeOsLtdby+bi8E0YQdfYzUOCBr7h2C0mAirU81khoBNOpioeZKmhVxA0fG4hzxazLK+njBmhUtCCmJNMq7SLXoQoxpH8hrutgklg39qO5E/95In80Ni6ddJjGBlt2+k0V7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766037465; c=relaxed/simple;
	bh=WDX1+YmmaIw9yaUukhlp2+liyUykokAxW1FhHZpav/c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uLZkPtki15RRHBzJ9qA2Y36EcBiRGu+OUHXaAQc88igtI3EXyRcm/Qs2wmjfPY/nZY1pwYvpL090ig+TXEyqGTXWw/h6kpHMpx9BWejFWlpn0vvVU3RzltYIhfoWzGrPTpZ1M0DQKizDbXGbUy6aYLIiMHfMGt5Rpq13S7V+2Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=la+dKWIV; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="la+dKWIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766037462; x=1797573462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WDX1+YmmaIw9yaUukhlp2+liyUykokAxW1FhHZpav/c=;
  b=la+dKWIVsThVmfoNWuu3vFXRZvfn/4XxCqaVdQldZKyx+GBN9ASGxRzv
   bmY5KzteL2eWL80zd79c8H1sDOe+Bi2TJhLwL8QVqd6MMotVusTNLxON0
   vhSpzBtAVixLiUZ9JNgpE6Jz8EOtetdLe8gjt78u6fER/qlQ8ci5AYHgW
   19LJq+OXzqNWLKGymYG1IHiBTRe5tV9VEvQeXbanOYOa3PWmADStovQbd
   hxucG/hPgyTA1hiJm00+ZjdPqH+SbyyS1/yRmSlTMiEASAkjX8eanjdH6
   B5hSAPF7x6qWTcR5nSvxA0siGuI1ggzXYoEaizMUEYdlNIdCFi6vf3cMq
   Q==;
X-CSE-ConnectionGUID: RQ+2CB/2TLuqMoTPrOH7Fg==
X-CSE-MsgGUID: QF2QwhXbRUirkhxgq8t5sw==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="68056701"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="68056701"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 21:57:40 -0800
X-CSE-ConnectionGUID: OCw47u0FQxyu4ZWXHEgrtw==
X-CSE-MsgGUID: 9CRhzMy8SIuu72eKCihAUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="197757484"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Dec 2025 21:57:38 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW715-000000001eR-2Hn6;
	Thu, 18 Dec 2025 05:57:35 +0000
Date: Thu, 18 Dec 2025 13:56:57 +0800
From: kernel test robot <lkp@intel.com>
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Steffen Klassert <steffen.klassert@secunet.com>
Subject: net/xfrm/xfrm_state.c:3320:17: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202512181339.zJcCBObf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: f2bc8231fd43a02f9d97252b3435869727054d60 xfrm: check all hash buckets for leftover states during netns deletion
date:   8 weeks ago
config: m68k-randconfig-r111-20251218 (https://download.01.org/0day-ci/archive/20251218/202512181339.zJcCBObf-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181339.zJcCBObf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181339.zJcCBObf-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/xfrm/xfrm_state.c:1737:9: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1744:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:1744:17: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:1744:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1751:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:1751:17: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:1751:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1871:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:1871:17: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:1871:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:1874:17: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:1874:17: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:1874:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2506:9: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: cast removes address space '__rcu' of expression
   net/xfrm/xfrm_state.c:2605:25: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected struct hlist_head *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:2605:25: sparse:     expected struct hlist_head *h
   net/xfrm/xfrm_state.c:2605:25: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3270:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *state_bydst @@     got struct hlist_head * @@
   net/xfrm/xfrm_state.c:3270:31: sparse:     expected struct hlist_head [noderef] __rcu *state_bydst
   net/xfrm/xfrm_state.c:3270:31: sparse:     got struct hlist_head *
   net/xfrm/xfrm_state.c:3273:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *state_bysrc @@     got struct hlist_head * @@
   net/xfrm/xfrm_state.c:3273:31: sparse:     expected struct hlist_head [noderef] __rcu *state_bysrc
   net/xfrm/xfrm_state.c:3273:31: sparse:     got struct hlist_head *
   net/xfrm/xfrm_state.c:3276:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *state_byspi @@     got struct hlist_head * @@
   net/xfrm/xfrm_state.c:3276:31: sparse:     expected struct hlist_head [noderef] __rcu *state_byspi
   net/xfrm/xfrm_state.c:3276:31: sparse:     got struct hlist_head *
   net/xfrm/xfrm_state.c:3279:31: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct hlist_head [noderef] __rcu *state_byseq @@     got struct hlist_head * @@
   net/xfrm/xfrm_state.c:3279:31: sparse:     expected struct hlist_head [noderef] __rcu *state_byseq
   net/xfrm/xfrm_state.c:3279:31: sparse:     got struct hlist_head *
   net/xfrm/xfrm_state.c:3297:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_byseq @@
   net/xfrm/xfrm_state.c:3297:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3297:33: sparse:     got struct hlist_head [noderef] __rcu *state_byseq
   net/xfrm/xfrm_state.c:3299:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_byspi @@
   net/xfrm/xfrm_state.c:3299:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3299:33: sparse:     got struct hlist_head [noderef] __rcu *state_byspi
   net/xfrm/xfrm_state.c:3301:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_bysrc @@
   net/xfrm/xfrm_state.c:3301:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3301:33: sparse:     got struct hlist_head [noderef] __rcu *state_bysrc
   net/xfrm/xfrm_state.c:3303:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_bydst @@
   net/xfrm/xfrm_state.c:3303:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3303:33: sparse:     got struct hlist_head [noderef] __rcu *state_bydst
>> net/xfrm/xfrm_state.c:3320:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:3320:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_state.c:3320:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3321:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:3321:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_state.c:3321:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3322:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:3322:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_state.c:3322:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3323:17: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head const *h @@     got struct hlist_head [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:3323:17: sparse:     expected struct hlist_head const *h
   net/xfrm/xfrm_state.c:3323:17: sparse:     got struct hlist_head [noderef] __rcu *
   net/xfrm/xfrm_state.c:3327:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_byseq @@
   net/xfrm/xfrm_state.c:3327:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3327:33: sparse:     got struct hlist_head [noderef] __rcu *state_byseq
   net/xfrm/xfrm_state.c:3328:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_byspi @@
   net/xfrm/xfrm_state.c:3328:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3328:33: sparse:     got struct hlist_head [noderef] __rcu *state_byspi
   net/xfrm/xfrm_state.c:3329:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_bysrc @@
   net/xfrm/xfrm_state.c:3329:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3329:33: sparse:     got struct hlist_head [noderef] __rcu *state_bysrc
   net/xfrm/xfrm_state.c:3330:33: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct hlist_head *n @@     got struct hlist_head [noderef] __rcu *state_bydst @@
   net/xfrm/xfrm_state.c:3330:33: sparse:     expected struct hlist_head *n
   net/xfrm/xfrm_state.c:3330:33: sparse:     got struct hlist_head [noderef] __rcu *state_bydst
   net/xfrm/xfrm_state.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/uio.h, ...):
   include/linux/rcupdate.h:898:9: sparse: sparse: context imbalance in 'xfrm_register_type' - unexpected unlock
   include/linux/rcupdate.h:898:9: sparse: sparse: context imbalance in 'xfrm_unregister_type' - unexpected unlock
   net/xfrm/xfrm_state.c:362:13: sparse: sparse: context imbalance in 'xfrm_get_type' - unexpected unlock
   include/linux/rcupdate.h:898:9: sparse: sparse: context imbalance in 'xfrm_register_type_offload' - unexpected unlock
   include/linux/rcupdate.h:898:9: sparse: sparse: context imbalance in 'xfrm_unregister_type_offload' - unexpected unlock
   include/linux/rcupdate.h:898:9: sparse: sparse: context imbalance in 'xfrm_set_type_offload' - unexpected unlock
   net/xfrm/xfrm_state.c:934:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:976:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:1655:9: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:58:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct refcount_struct [usertype] *r @@     got struct refcount_struct [noderef] __rcu * @@
   net/xfrm/xfrm_state.c:58:39: sparse:     expected struct refcount_struct [usertype] *r
   net/xfrm/xfrm_state.c:58:39: sparse:     got struct refcount_struct [noderef] __rcu *
   net/xfrm/xfrm_state.c:1778:9: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:1814:9: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:2315:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c: note: in included file:
   include/net/xfrm.h:1971:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/net/xfrm.h:1971:16: sparse:    struct sock [noderef] __rcu *
   include/net/xfrm.h:1971:16: sparse:    struct sock *

vim +3320 net/xfrm/xfrm_state.c

  3257	
  3258	int __net_init xfrm_state_init(struct net *net)
  3259	{
  3260		unsigned int sz;
  3261	
  3262		if (net_eq(net, &init_net))
  3263			xfrm_state_cache = KMEM_CACHE(xfrm_state,
  3264						      SLAB_HWCACHE_ALIGN | SLAB_PANIC);
  3265	
  3266		INIT_LIST_HEAD(&net->xfrm.state_all);
  3267	
  3268		sz = sizeof(struct hlist_head) * 8;
  3269	
  3270		net->xfrm.state_bydst = xfrm_hash_alloc(sz);
  3271		if (!net->xfrm.state_bydst)
  3272			goto out_bydst;
  3273		net->xfrm.state_bysrc = xfrm_hash_alloc(sz);
  3274		if (!net->xfrm.state_bysrc)
  3275			goto out_bysrc;
  3276		net->xfrm.state_byspi = xfrm_hash_alloc(sz);
  3277		if (!net->xfrm.state_byspi)
  3278			goto out_byspi;
  3279		net->xfrm.state_byseq = xfrm_hash_alloc(sz);
  3280		if (!net->xfrm.state_byseq)
  3281			goto out_byseq;
  3282	
  3283		net->xfrm.state_cache_input = alloc_percpu(struct hlist_head);
  3284		if (!net->xfrm.state_cache_input)
  3285			goto out_state_cache_input;
  3286	
  3287		net->xfrm.state_hmask = ((sz / sizeof(struct hlist_head)) - 1);
  3288	
  3289		net->xfrm.state_num = 0;
  3290		INIT_WORK(&net->xfrm.state_hash_work, xfrm_hash_resize);
  3291		spin_lock_init(&net->xfrm.xfrm_state_lock);
  3292		seqcount_spinlock_init(&net->xfrm.xfrm_state_hash_generation,
  3293				       &net->xfrm.xfrm_state_lock);
  3294		return 0;
  3295	
  3296	out_state_cache_input:
  3297		xfrm_hash_free(net->xfrm.state_byseq, sz);
  3298	out_byseq:
> 3299		xfrm_hash_free(net->xfrm.state_byspi, sz);
  3300	out_byspi:
  3301		xfrm_hash_free(net->xfrm.state_bysrc, sz);
  3302	out_bysrc:
  3303		xfrm_hash_free(net->xfrm.state_bydst, sz);
  3304	out_bydst:
  3305		return -ENOMEM;
  3306	}
  3307	
  3308	void xfrm_state_fini(struct net *net)
  3309	{
  3310		unsigned int sz;
  3311		int i;
  3312	
  3313		flush_work(&net->xfrm.state_hash_work);
  3314		xfrm_state_flush(net, 0, false);
  3315		flush_work(&xfrm_state_gc_work);
  3316	
  3317		WARN_ON(!list_empty(&net->xfrm.state_all));
  3318	
  3319		for (i = 0; i <= net->xfrm.state_hmask; i++) {
> 3320			WARN_ON(!hlist_empty(net->xfrm.state_byseq + i));
  3321			WARN_ON(!hlist_empty(net->xfrm.state_byspi + i));
  3322			WARN_ON(!hlist_empty(net->xfrm.state_bysrc + i));
  3323			WARN_ON(!hlist_empty(net->xfrm.state_bydst + i));
  3324		}
  3325	
  3326		sz = (net->xfrm.state_hmask + 1) * sizeof(struct hlist_head);
  3327		xfrm_hash_free(net->xfrm.state_byseq, sz);
  3328		xfrm_hash_free(net->xfrm.state_byspi, sz);
  3329		xfrm_hash_free(net->xfrm.state_bysrc, sz);
  3330		xfrm_hash_free(net->xfrm.state_bydst, sz);
  3331		free_percpu(net->xfrm.state_cache_input);
  3332	}
  3333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
