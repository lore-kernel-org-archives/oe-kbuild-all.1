Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FFF1A256E
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jan 2026 13:49:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768744201; cv=none; b=LwrOzjJ3jUxXMQPy3cwyGiMDm9SA0JfoZGu3rDohBeRl6dgdnVUEsn/S96ZnZVty19ddIdgDAIKpi+gHy06hWYgYhV2sKc3XmBRseJ5OW49joQ2DtG0rte86Eu+5JZtgs32wsSUuUyW18Xi2Js3UC7EAaDbyYyMIzVZQprkHkHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768744201; c=relaxed/simple;
	bh=rP+iRZ+KF7PXaA5fVdW3r2J85Ey66f3aAMytmiNX/UM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=I6P6VnxgVRtCZZfiHdJuXarO/HPQYVYG2Y/D01TIStjauIKW3IvLYSgAjcHLVVT4HvGKO0XkE6qn/rmEceT0jIcnW1HeiDfLJ7MKdEshNtqOlEtqvBGaab/f8ovOwnLNRpryIJKmoF5zRY6GdSPQLIR6U/yu4WQjqwG5zzN8j1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kUPQbK5e; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUPQbK5e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768744198; x=1800280198;
  h=date:from:to:cc:subject:message-id;
  bh=rP+iRZ+KF7PXaA5fVdW3r2J85Ey66f3aAMytmiNX/UM=;
  b=kUPQbK5eQqgedm6SYlgFxbb/7RsHIU0k3uGFrVliU2QXwi2F5tYMtAEY
   AjkhAdGCZK6+WMvBw3nhqja0Q4XCxUMYGvcwK4OepjcQHLcBAdlIqejwg
   lYIFVqTH3Kbdj+RpVR0WZEY/r8rZhgYEWSlyYI5oW9qbJkhwwt40capBp
   Nl4gvIv5jiJcD1xg+YJSj3sQcOstl/nqL70LEtHMAgAP4ETcdYODng+IL
   85hYcRVw2KJyBtsBHw5Q2YbazbioU/RyJ4BOWh8/aOJh44tfdHlo3wh0u
   9wcdDrIIr0Up6ZRKPceedru3TQkvBeRUP5Zy5V6Ijz4j545mDCIT18ZC/
   Q==;
X-CSE-ConnectionGUID: uqQnqruWTC+BjKurCOok1Q==
X-CSE-MsgGUID: LUzbvHpBTey/1mHVFkKZ+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="69180690"
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="69180690"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 05:49:57 -0800
X-CSE-ConnectionGUID: Cu5lOW7MSNuhpFtGAw4Lpw==
X-CSE-MsgGUID: 90EYj+9nTmKhcMr1yoRP0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,235,1763452800"; 
   d="scan'208";a="210142257"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jan 2026 05:49:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhTA8-00000000Myu-1nEq;
	Sun, 18 Jan 2026 13:49:52 +0000
Date: Sun, 18 Jan 2026 21:49:03 +0800
From: kernel test robot <lkp@intel.com>
To: Sabrina Dubroca <sd@queasysnail.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Steffen Klassert <steffen.klassert@secunet.com>
Subject: net/xfrm/xfrm_state.c:3320:17: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202601182145.5gGEy2jq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e84d960149e71e8d5e4db69775ce31305898ed0c
commit: f2bc8231fd43a02f9d97252b3435869727054d60 xfrm: check all hash buckets for leftover states during netns deletion
date:   3 months ago
config: arc-randconfig-r131-20260118 (https://download.01.org/0day-ci/archive/20260118/202601182145.5gGEy2jq-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260118/202601182145.5gGEy2jq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601182145.5gGEy2jq-lkp@intel.com/

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
   net/xfrm/xfrm_state.c:362:9: sparse: sparse: context imbalance in 'xfrm_get_type' - unexpected unlock
   include/linux/rcupdate.h:898:9: sparse: sparse: context imbalance in 'xfrm_register_type_offload' - unexpected unlock
   include/linux/rcupdate.h:898:9: sparse: sparse: context imbalance in 'xfrm_unregister_type_offload' - unexpected unlock
   net/xfrm/xfrm_state.c:445:9: sparse: sparse: context imbalance in 'xfrm_set_type_offload' - unexpected unlock
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
   net/xfrm/xfrm_state.c:2094:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:2113:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c:2315:17: sparse: sparse: dereference of noderef expression
   net/xfrm/xfrm_state.c: note: in included file:
   include/net/xfrm.h:1971:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/net/xfrm.h:1971:16: sparse:    struct sock [noderef] __rcu *
   include/net/xfrm.h:1971:16: sparse:    struct sock *

vim +3320 net/xfrm/xfrm_state.c

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
