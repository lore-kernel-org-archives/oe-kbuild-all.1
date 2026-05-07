Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9B244BCB2
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 18:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778178333; cv=none; b=o3wkdk4ez7ewTAOoRy8moSqBmUI+8mx86DffeMkLaAMN7Y6fk3mESmfB6ptIglnsVg+JVooCsaGxjm2picGF3OW/y9YdZgmaroZA334Laknzzlfu7AwZ8c0ETvrugqBdBiPX75h73Lvoos0KJjIABEyFSPzE4xm28syzfrp6PB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778178333; c=relaxed/simple;
	bh=/XW8aMsW0stlcqQgg63Kw/paM6VGx5AjcBYSl2V0Mx8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ljGt7T5A+oPpTeVFvx81IY9gj++QGS2l/nohZdECZefWqmmWLNghuWur3llyeaqq0+Cwiktha5q+px+i0DSPrnpcuuwdPyZI24cLhZiI5aD0Gg54tLUbjo37psj9cncK9WyQLMZjRVn5UxvE4iwqddBSAM3Fn51bpnPpV5aJR2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbQubAQ0; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbQubAQ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778178332; x=1809714332;
  h=date:from:to:cc:subject:message-id;
  bh=/XW8aMsW0stlcqQgg63Kw/paM6VGx5AjcBYSl2V0Mx8=;
  b=bbQubAQ0UgrREGFD8VZwNfi1tt4/tLXoddE+xYNCS9Toejk6Sw6MAito
   WAcO0vGSj1ZA0ebkCYh9W+FiUljhCTKK4PiyNlP84J+mdYbPkQ6IqRhUQ
   fT3yKl+6z2YZdem5m+dfj37BnHw3xwaMmdonluiDs7m99eYITlb+3m/ei
   4f/VYxxYKLp50zojF3ZBTbyU47K4sicHqsrE7A37Rtt4Wb61IhhSjIsT3
   l063MCZHreaguMAQR0+5rawHOM5BiFkpUbFzmf8ZTHK4EdHsyf3IwvvGJ
   tMg+svLti/ViQindx6QlSXanLjA8W+sjR0lwB9Bkvicl3+rF3wL52FwuN
   w==;
X-CSE-ConnectionGUID: UPYJ/fB/TC+J7n8Zu5noyQ==
X-CSE-MsgGUID: KeCiP0DSSu+Hs9a+yr18gg==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="79131001"
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="79131001"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 11:25:31 -0700
X-CSE-ConnectionGUID: 2UvX5WOgRumEx9FRq0HHAw==
X-CSE-MsgGUID: Y+TpKSPCTQu0tYK2+QtFEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,222,1770624000"; 
   d="scan'208";a="233477007"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2026 11:25:30 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wL3Pb-000000000Mb-3mTa;
	Thu, 07 May 2026 18:25:27 +0000
Date: Fri, 08 May 2026 02:25:18 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ljs:project/cow-context 13/18] mm/cow_context.c:1036:32:
 sparse: sparse: incorrect type in initializer (different modifiers)
Message-ID: <202605080227.tM7oRZ18-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: 946de43e9e6fda480bae62d92b3172787d2ef45a [13/18] mm: add the ability to traverse the CoW context
config: alpha-randconfig-r134-20260507 (https://download.01.org/0day-ci/archive/20260508/202605080227.tM7oRZ18-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260508/202605080227.tM7oRZ18-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605080227.tM7oRZ18-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/cow_context.c:436:30: sparse: sparse: cast to non-scalar
   mm/cow_context.c:713:23: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head *entry @@     got struct list_head [noderef] * @@
   mm/cow_context.c:713:23: sparse:     expected struct list_head *entry
   mm/cow_context.c:713:23: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:740:17: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head const *head @@     got struct list_head [noderef] * @@
   mm/cow_context.c:740:17: sparse:     expected struct list_head const *head
   mm/cow_context.c:740:17: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:768:23: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head *new @@     got struct list_head [noderef] * @@
   mm/cow_context.c:768:23: sparse:     expected struct list_head *new
   mm/cow_context.c:768:23: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:768:43: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct list_head *head @@     got struct list_head [noderef] * @@
   mm/cow_context.c:768:43: sparse:     expected struct list_head *head
   mm/cow_context.c:768:43: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:781:25: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head *list @@     got struct list_head [noderef] * @@
   mm/cow_context.c:781:25: sparse:     expected struct list_head *list
   mm/cow_context.c:781:25: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:782:25: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head *list @@     got struct list_head [noderef] * @@
   mm/cow_context.c:782:25: sparse:     expected struct list_head *list
   mm/cow_context.c:782:25: sparse:     got struct list_head [noderef] *
>> mm/cow_context.c:1036:32: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct list_head *__ptr @@     got struct list_head [noderef] * @@
   mm/cow_context.c:1036:32: sparse:     expected struct list_head *__ptr
   mm/cow_context.c:1036:32: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:1046:24: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct list_head *__head @@     got struct list_head [noderef] * @@
   mm/cow_context.c:1046:24: sparse:     expected struct list_head *__head
   mm/cow_context.c:1046:24: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:1046:24: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct list_head *__ptr @@     got struct list_head [noderef] * @@
   mm/cow_context.c:1046:24: sparse:     expected struct list_head *__ptr
   mm/cow_context.c:1046:24: sparse:     got struct list_head [noderef] *

vim +1036 mm/cow_context.c

  1000	
  1001	static void traverse_contexts(struct cow_context *root, traverse_fn_t *callback,
  1002				      void *arg1, void *arg2)
  1003	{
  1004		struct cow_context *parent = NULL;
  1005		struct cow_context *curr = root;
  1006		struct cow_context *next = NULL;
  1007	
  1008		lockdep_assert_in_rcu_read_lock();
  1009	
  1010		/* Visit root first. */
  1011		if (!callback(root, arg1, arg2))
  1012			return;
  1013	
  1014		/*
  1015		 * Depth-first traversal:
  1016		 *
  1017		 *          ..... 7......
  1018		 *         .      v      .
  1019		 *        . ------*------ .
  1020		 *       . /             \ .
  1021		 *      . *<3............ *<6
  1022		 *     . / \ .         . / \ .
  1023		 *    . *   * .       . *   * .
  1024		 *   .  ^   ^  .     .  ^   ^  .
  1025		 *  ....1...2....   ....4...5....
  1026		 *
  1027		 * Loop steps:
  1028		 *
  1029		 * 1. If not just moved to parent, try to descend to left-most child of
  1030		 *    current node.
  1031		 * 2. Visit current node. If it is the root node, abort.
  1032		 * 3. Try to traverse to next sibling. If cannot, traverse parent.
  1033		 */
  1034		for (; ; curr = next) {
  1035			if (curr != parent) {
> 1036				next = list_first_or_null_rcu(&curr->children,
  1037						struct cow_context, siblings);
  1038				if (next)
  1039					continue;
  1040			}
  1041	
  1042			if (curr == root || !callback(curr, arg1, arg2))
  1043				break;
  1044	
  1045			parent = curr->parent;
  1046			next = list_next_or_null_rcu(&parent->children,
  1047						     &curr->siblings, struct cow_context,
  1048						     siblings) ?: parent;
  1049		}
  1050	}
  1051	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
