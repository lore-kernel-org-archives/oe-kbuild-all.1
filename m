Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65D1330D26
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Feb 2026 07:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770707553; cv=none; b=rJzrPt/WLdnuztMX51F/b6u6ebzOJovXOTbNtxPO5wkjMZjM8L58V2AaEmhMOxXHktz+xPIWiP2/XzT8L6pDDAJ/v1YD6Efxw5DHRqrNiWibDg0ZD7xoB3mLIndxyHaZi2ke8fYmKwUVyXGqfNhgd7vRp1rsIzMKcgFeEH12Q0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770707553; c=relaxed/simple;
	bh=Qj2J2ttjzeGzSVX0hAsuo/aEyHBvMuwSwwH4t7+cUBM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rzgLSE3dhtCLkFt5c7ZEYJVUmla8WbTRdcFbMeYc1q393L7EYK6rNoxisY/Qel6UOGAh7/ayZVGphgRKL5p8ylfYag5oSm2no35W4DOfqrm5zlvIjYkAFYazYOxsZh0UV3frBEfsl19dBhft04QLNsf305YIz55NTnxMBTec35o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JvNS4SpH; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JvNS4SpH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770707548; x=1802243548;
  h=date:from:to:cc:subject:message-id;
  bh=Qj2J2ttjzeGzSVX0hAsuo/aEyHBvMuwSwwH4t7+cUBM=;
  b=JvNS4SpHWW8X1q03lBz2XuMfsh3jxA+vjcueKqiuaCqU81FYjc8FwVM+
   ieXRQzovVVuQB1DASiyw7wDNIrMz4ZGtq+sXaHeQdnimeIpxnHk2h7o9e
   ou9b4v5RuHosj+QsHCav+TAWf9cvMrzwaerf4hWttENvLXLd7+8+29NL3
   sLh2uOwVJGPTJRSz7D1Ekdm9458P9eGhEvxU9OFmjR2CmYi8yAH0IohnW
   Np2FVDZjHnsMEu6U6klm6Tp/BaWNMZjoWBjERisUFLla2eedvBw/JBqZy
   u1CVseRc/2PLBMHagYbUH6WduJu4f0dGexn5AwK9SZ0iFx7DHr36wJcmJ
   Q==;
X-CSE-ConnectionGUID: +U5wH9ViTdabVbRFUb4qyw==
X-CSE-MsgGUID: gNiHZv00T8mceCe/jfOOLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11696"; a="71727633"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="71727633"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2026 23:12:28 -0800
X-CSE-ConnectionGUID: k805+Uw8QAi52vKZvtZ4Tg==
X-CSE-MsgGUID: LbjyQZIRTda4rk0gSk/5CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="216008664"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Feb 2026 23:12:27 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vphv6-00000000oke-2trf;
	Tue, 10 Feb 2026 07:12:24 +0000
Date: Tue, 10 Feb 2026 15:11:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:container 12/14] fs/namespace.c:3533:33:
 error: 'ns' undeclared; did you mean 'fns'?
Message-ID: <202602101543.HVID9xbh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git container
head:   f62d2a134716e021cfca8d7860048f9c71bd53c4
commit: 3b3cfa4dc210573e079a64da95f7ddd6e6436479 [12/14] vfs: Allow mounting to other namespaces
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20260210/202602101543.HVID9xbh-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260210/202602101543.HVID9xbh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602101543.HVID9xbh-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/namespace.c: In function 'do_move_mount':
>> fs/namespace.c:3533:33: error: 'ns' undeclared (first use in this function); did you mean 'fns'?
    3533 |                 if (!is_anon_ns(ns) || mnt_has_parent(old))
         |                                 ^~
         |                                 fns
   fs/namespace.c:3533:33: note: each undeclared identifier is reported only once for each function it appears in
>> fs/namespace.c:3535:35: error: 'p' undeclared (first use in this function); did you mean 'mp'?
    3535 |         } else if (old->mnt_ns == p->mnt_ns) {
         |                                   ^
         |                                   mp
>> fs/namespace.c:3534:25: error: label 'out' used but not defined
    3534 |                         goto out;
         |                         ^~~~
   fs/namespace.c: In function 'set_container_root':
   fs/namespace.c:4442:17: error: too many arguments to function 'move_from_ns'
    4442 |                 move_from_ns(mnt, &tmp); /* Obtain the namespace's ref */
         |                 ^~~~~~~~~~~~
   In file included from fs/pnode.h:11,
                    from fs/namespace.c:39:
   fs/mount.h:199:20: note: declared here
     199 | static inline void move_from_ns(struct mount *mnt)
         |                    ^~~~~~~~~~~~


vim +3533 fs/namespace.c

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
