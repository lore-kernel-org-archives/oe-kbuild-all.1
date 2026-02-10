Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA652522A1
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 01:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770686947; cv=none; b=IP5V4HEDcdRQKjUvI1ZGksIlWYqOFvA505RrHfkGGFUgcA/LeFoQoSacLqaufIJFUj9w5uz1sJUWqZY4mvt1aBzuWc50G6SJLHSov4QbzJ30v+gAKQwkMct6NeSHcU0wrgLM/GdoziOGyCAeC1WgfF5Vd9CNMwzoxEBPfOb/HME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770686947; c=relaxed/simple;
	bh=UPntcEwXYIx+HO7FmW2rNuxI/epDJGeaNjmSr+U+LT4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tBKCLsmqg0/VsXGrfvZ001AzhRI8fhr/xAPt84fB3Pg+3zugTeWQUovyczdaVT9Ae1GFg6x38dy5Qve5ZVcPPCULpjChDfOCD13RbYRDucEGJBNCAYhQdvU+PFC0eh4nQ8EUezdCXpn0fFanEUsfYdKUprM8JSYhaYxz+S+VH/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WqnZpWs+; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WqnZpWs+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770686945; x=1802222945;
  h=date:from:to:cc:subject:message-id;
  bh=UPntcEwXYIx+HO7FmW2rNuxI/epDJGeaNjmSr+U+LT4=;
  b=WqnZpWs+7Ihu2TVG2mXTWlPmFLVWbOMxSAIuZEDxTr69cXqxMF52+Ujs
   SGjRMgU0/vRaKKOaCRsy4SN6/pByvx5JgTdN1Z2Kese4qGHdDo/4xpRh2
   NT6qKBnk5+CGDJLXhYDk5LaFZV/DG7k0msbkUuchFxrdesbvs5aUro6+f
   PYI4lw1HhmBshXcEn63lPt4F5qn7jZVGko0bnvYNxqZaJ1uNfERJ+gER3
   gttYpJCL51xVmuH71GT9R+itjFAvjQMN+6INhW+TieyZrNWpmjt/43RVn
   gjTOqEngAJ0jjgb61otvdXcZAC4JBXIWoHPUWCNOzU4wP90uvbdSs5rQF
   A==;
X-CSE-ConnectionGUID: yILcHkGnQvSotYpNwP1wlQ==
X-CSE-MsgGUID: MWzUAGBpQkS2fMZdlEJaaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71910497"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71910497"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 17:29:05 -0800
X-CSE-ConnectionGUID: yS/lQfr/QlifhBMO8jP8BA==
X-CSE-MsgGUID: F6Tw4JChTSGDfmMPPvXMNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="211068648"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 09 Feb 2026 17:29:04 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vpcYn-000000000XJ-0XAV;
	Tue, 10 Feb 2026 01:29:01 +0000
Date: Tue, 10 Feb 2026 02:28:57 +0100
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 12/14] fs/namespace.c:3533:19:
 error: use of undeclared identifier 'ns'
Message-ID: <202602100229.v9IoI6RD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   9977221e4d17485700c9229681297e628847d16b
commit: 3b3cfa4dc210573e079a64da95f7ddd6e6436479 [12/14] vfs: Allow mounting to other namespaces
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20260210/202602100229.v9IoI6RD-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602100229.v9IoI6RD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602100229.v9IoI6RD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/namespace.c:3533:19: error: use of undeclared identifier 'ns'
    3533 |                 if (!is_anon_ns(ns) || mnt_has_parent(old))
         |                                 ^
>> fs/namespace.c:3535:28: error: use of undeclared identifier 'p'
    3535 |         } else if (old->mnt_ns == p->mnt_ns) {
         |                                   ^
>> fs/namespace.c:3534:9: error: use of undeclared label 'out'
    3534 |                         goto out;
         |                              ^
   fs/namespace.c:4442:21: error: too many arguments to function call, expected single argument 'mnt', have 2 arguments
    4442 |                 move_from_ns(mnt, &tmp); /* Obtain the namespace's ref */
         |                 ~~~~~~~~~~~~      ^~~~
   fs/mount.h:199:20: note: 'move_from_ns' declared here
     199 | static inline void move_from_ns(struct mount *mnt)
         |                    ^            ~~~~~~~~~~~~~~~~~
   4 errors generated.


vim +/ns +3533 fs/namespace.c

  3513	
  3514	static int do_move_mount(const struct path *old_path,
  3515				 const struct path *new_path,
  3516				 enum mnt_tree_flags_t flags)
  3517	{
  3518		struct mount *old = real_mount(old_path->mnt);
  3519		int err;
  3520		bool beneath = flags & MNT_TREE_BENEATH;
  3521	
  3522		if (!path_mounted(old_path))
  3523			return -EINVAL;
  3524	
  3525		if (d_is_dir(new_path->dentry) != d_is_dir(old_path->dentry))
  3526			return -EINVAL;
  3527	
  3528		LOCK_MOUNT_MAYBE_BENEATH(mp, new_path, beneath);
  3529		if (IS_ERR(mp.parent))
  3530			return PTR_ERR(mp.parent);
  3531	
  3532		if (flags & MNT_TREE_CONTAINER) {
> 3533			if (!is_anon_ns(ns) || mnt_has_parent(old))
> 3534				goto out;
> 3535		} else if (old->mnt_ns == p->mnt_ns) {
  3536			/* if the source is in the same namespace as the mountpoint... */
  3537			/* ... it should be detachable from parent */
  3538			if (!mnt_has_parent(old) || IS_MNT_LOCKED(old))
  3539				return -EINVAL;
  3540			/* ... which should not be shared */
  3541			if (IS_MNT_SHARED(old->mnt_parent))
  3542				return -EINVAL;
  3543			/* ... and the target should be in our namespace */
  3544			if (!check_mnt(mp.parent))
  3545				return -EINVAL;
  3546		} else {
  3547			/*
  3548			 * otherwise the source must be the root of some anon namespace.
  3549			 */
  3550			if (!anon_ns_root(old))
  3551				return -EINVAL;
  3552			/*
  3553			 * Bail out early if the target is within the same namespace -
  3554			 * subsequent checks would've rejected that, but they lose
  3555			 * some corner cases if we check it early.
  3556			 */
  3557			if (old->mnt_ns == mp.parent->mnt_ns)
  3558				return -EINVAL;
  3559			/*
  3560			 * Target should be either in our namespace or in an acceptable
  3561			 * anon namespace, sensu check_anonymous_mnt().
  3562			 */
  3563			if (!may_use_mount(mp.parent))
  3564				return -EINVAL;
  3565		}
  3566	
  3567		if (beneath) {
  3568			struct mount *over = real_mount(new_path->mnt);
  3569	
  3570			if (mp.parent != over->mnt_parent)
  3571				over = mp.parent->overmount;
  3572			err = can_move_mount_beneath(old, over, mp.mp);
  3573			if (err)
  3574				return err;
  3575		}
  3576	
  3577		/*
  3578		 * Don't move a mount tree containing unbindable mounts to a destination
  3579		 * mount which is shared.
  3580		 */
  3581		if (IS_MNT_SHARED(mp.parent) && tree_contains_unbindable(old))
  3582			return -EINVAL;
  3583		if (!check_for_nsfs_mounts(old))
  3584			return -ELOOP;
  3585		if (mount_is_ancestor(old, mp.parent))
  3586			return -ELOOP;
  3587	
  3588		return attach_recursive_mnt(old, &mp);
  3589	}
  3590	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
