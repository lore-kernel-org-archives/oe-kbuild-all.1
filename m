Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5F91D6195
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771746698; cv=none; b=Pc/9oyor4LV6nNCoRV5NdTv7gK5M7MirGQnPxHwTKZExa/j09DPmYJBlHuMylBwBNnQhumVBcZeDLz/v0TLMJYCMQVcwg7CPTxlvFpXCgzXsksZk0i9sb5Q2c3kpDdhnVx0v3roMk71SuEKKga8chPhjnlQeU3bplRjJcbPGpjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771746698; c=relaxed/simple;
	bh=XC8xBQiDh0Wj2oTLXgVECN2VSZbZ4MUauK9ZN7ZgGQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dGzLeuiPLcdPKgnt/aH39cHEz2gV0CUyONtM5DgirU9maNg4DOaRKdJOPNXRvvr188t3s3h0oV0cY9EFuocx+9K+z4VhuyXgkuJbfOtBiyYu1jIXjdQiQOUXh3W+oAT049p/vTQ4q4rGb5eb45G55anqDbafD232nvsANnpB6Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W/T82fAW; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W/T82fAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771746696; x=1803282696;
  h=date:from:to:cc:subject:message-id;
  bh=XC8xBQiDh0Wj2oTLXgVECN2VSZbZ4MUauK9ZN7ZgGQo=;
  b=W/T82fAWnOEZOp37q/iHMMxjaCRlTPh/0nltADqCY82z3mPWcWBJjrgk
   48YyeG0Cu2nhzlhl4DkWoHaY0LX1+vkYJ06MkpAiuToa1WV2ssBpRxPTY
   e1zw8kNkA3BtR2FY02KMV0TKqrrm1Dld3kNfhGiHXGOEacFoxfmWf16NZ
   IyKmMaAybEZTm3/o9K916k4T96VaGW8UpZ7+tkyXM1M5g+H8FYf3QiF9x
   u5mh/L/yqVsTWr3GIZpWKcA1olaAe4exXIZWv85U2+jWHwCsiw6qB1InW
   FA9ehTlS72bdTHznXOhqyuKHc2PdZ/cNW3lPsfJvNLoBXkVxAgoNNTNcQ
   Q==;
X-CSE-ConnectionGUID: IaZXauA2Q362+4jXw7TmyQ==
X-CSE-MsgGUID: 6tY/bWY0TzO5Y+nhQiHGdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="71803458"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="71803458"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 23:51:35 -0800
X-CSE-ConnectionGUID: 2Q6l+nptQ2ugjUclFx3khg==
X-CSE-MsgGUID: IoMRAzU4Q8GebYOipNhi7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="215389244"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 21 Feb 2026 23:51:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu4FX-000000015OG-3Ikp;
	Sun, 22 Feb 2026 07:51:31 +0000
Date: Sun, 22 Feb 2026 15:51:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:rootns 4/16] fs/namespace.c:6192:9: error:
 'ret' undeclared; did you mean 'net'?
Message-ID: <202602221507.tYFWiCW3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git rootns
head:   e262a74aea4b2561d2238508f7ce2498c2980c51
commit: b0a7cde1c2a3f754d35c059d0455105b4a2df66a [4/16] fork: Handle copy_process() and do_exit()
config: sh-defconfig (https://download.01.org/0day-ci/archive/20260222/202602221507.tYFWiCW3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221507.tYFWiCW3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221507.tYFWiCW3-lkp@intel.com/

Note: the jarkko-tpmdd/rootns HEAD e262a74aea4b2561d2238508f7ce2498c2980c51 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/namespace.c: In function 'init_mount_tree':
>> fs/namespace.c:6192:9: error: 'ret' undeclared (first use in this function); did you mean 'net'?
    6192 |         ret = init_srcu_struct(&init_rootns.member_srcu);
         |         ^~~
         |         net
   fs/namespace.c:6192:9: note: each undeclared identifier is reported only once for each function it appears in


vim +6192 fs/namespace.c

  6124	
  6125	static void __init init_mount_tree(void)
  6126	{
  6127		struct vfsmount *mnt, *nullfs_mnt;
  6128		struct mount *mnt_root;
  6129		struct path root;
  6130	
  6131		/*
  6132		 * We create two mounts:
  6133		 *
  6134		 * (1) nullfs with mount id 1
  6135		 * (2) mutable rootfs with mount id 2
  6136		 *
  6137		 * with (2) mounted on top of (1).
  6138		 */
  6139		nullfs_mnt = vfs_kern_mount(&nullfs_fs_type, 0, "nullfs", NULL);
  6140		if (IS_ERR(nullfs_mnt))
  6141			panic("VFS: Failed to create nullfs");
  6142	
  6143		mnt = vfs_kern_mount(&rootfs_fs_type, 0, "rootfs", initramfs_options);
  6144		if (IS_ERR(mnt))
  6145			panic("Can't create rootfs");
  6146	
  6147		VFS_WARN_ON_ONCE(real_mount(nullfs_mnt)->mnt_id != 1);
  6148		VFS_WARN_ON_ONCE(real_mount(mnt)->mnt_id != 2);
  6149	
  6150		/* The namespace root is the nullfs mnt. */
  6151		mnt_root		= real_mount(nullfs_mnt);
  6152		init_mnt_ns.root	= mnt_root;
  6153	
  6154		/* Mount mutable rootfs on top of nullfs. */
  6155		root.mnt		= nullfs_mnt;
  6156		root.dentry		= nullfs_mnt->mnt_root;
  6157	
  6158		LOCK_MOUNT_EXACT(mp, &root);
  6159		if (unlikely(IS_ERR(mp.parent)))
  6160			panic("VFS: Failed to mount rootfs on nullfs");
  6161		scoped_guard(mount_writer)
  6162			attach_mnt(real_mount(mnt), mp.parent, mp.mp);
  6163	
  6164		pr_info("VFS: Finished mounting rootfs on nullfs\n");
  6165	
  6166		/*
  6167		 * We've dropped all locks here but that's fine. Not just are we
  6168		 * the only task that's running, there's no other mount
  6169		 * namespace in existence and the initial mount namespace is
  6170		 * completely empty until we add the mounts we just created.
  6171		 */
  6172		for (struct mount *p = mnt_root; p; p = next_mnt(p, mnt_root)) {
  6173			mnt_add_to_ns(&init_mnt_ns, p);
  6174			init_mnt_ns.nr_mounts++;
  6175		}
  6176	
  6177		init_task.nsproxy->mnt_ns = &init_mnt_ns;
  6178		get_mnt_ns(&init_mnt_ns);
  6179	
  6180		/* The root and pwd always point to the mutable rootfs. */
  6181		root.mnt	= mnt;
  6182		root.dentry	= mnt->mnt_root;
  6183		set_fs_pwd(current->fs, &root);
  6184		set_fs_root(current->fs, &root);
  6185	
  6186	#ifdef CONFIG_ROOTNS
  6187		init_task.rootns_member.next = &init_rootns.members,
  6188		init_task.rootns_member.prev = &init_rootns.members,
  6189		init_rootns.cred = kernel_cred();
  6190		path_get(&root);
  6191		init_rootns.root = root;
> 6192		ret = init_srcu_struct(&init_rootns.member_srcu);
  6193		if (ret) {
  6194			path_put(&init_rootns.root);
  6195			init_rootns.root = (struct path){};
  6196			init_rootns.cred = NULL;
  6197			pr_err("rootns: failed to initialize init SRCU: %d\n", ret);
  6198		}
  6199	#endif
  6200	
  6201		ns_tree_add(&init_mnt_ns);
  6202	}
  6203	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
