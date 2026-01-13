Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDA635B132
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 05:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768282711; cv=none; b=NxMXvKDsFtcDWtnV1W4nKxvvHezHAqjsnjWfFDZwBVDyfDTJuFPajmlsUxYc6XSQ6GX3bBQYisWrZAVEYTEk3NA3zot9AIIKUiOZP78tiF2TfDcqLk2+6j7sL9A9po7OUWP0dfbdNreCKb/anvOFByN7EcBpr37wP/DVNDuNCds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768282711; c=relaxed/simple;
	bh=z4283oX5AXsa2q27771Kwah+zmxsNJRU7fSmPchGos0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H+nIKRSyLVK7HeW7EgHohSqYUkXIrs9vxCnSMzDqGfhRkOhR4eDF/LcFaBybIpedcgMaCUDHiqkoibkBJNBrrEJqqIV4mgpe9HnM3u25QP3kVAS0vxfSA2hmUGJTYbCde2eApqVLiEDP1vmDaiLmFdGG92Dv1JncGzb/wdxDKOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrYV6AhP; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrYV6AhP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768282709; x=1799818709;
  h=date:from:to:cc:subject:message-id;
  bh=z4283oX5AXsa2q27771Kwah+zmxsNJRU7fSmPchGos0=;
  b=KrYV6AhPju/gXiZZnj5Q0Jfd5dPHRn4Vxs+nWkFrZepKdrb9n4K3HrfG
   caeJJQceOdPswOIPSZYWU524G8E4KzT3Dp41Y8bWKxNdluOQj0kss3g5R
   JuRs69ayokXBlauAD5KmjKQl6hoFTBe/KYtkcLn6HrWi4d4mwAT1AsGaT
   rDa5WuqrHWZEmTQ/j6rNNojczfKq6EP//PNoc1veMPaLOZD2+UAKE/BDf
   FTUa2BchA/VDxBAVSAMD0ttGxgxoEaq9gPk+erafN9H3wXgX4LSQ8bhmT
   blgvXxlqUezdvsD/xrG4GH8CN8MG7bAcZsD3zUWOLSEtpyb7yztxQJQl+
   g==;
X-CSE-ConnectionGUID: /r+NSTtiR0enpnU6yaJm8Q==
X-CSE-MsgGUID: SXwcdl4aQ4CymGtZvSbFkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="80206153"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="80206153"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 21:38:28 -0800
X-CSE-ConnectionGUID: iFJTQjo3RXuaY/ncQg8PTQ==
X-CSE-MsgGUID: q2q7Ik0NQZierJSjbmAoZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="234996664"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jan 2026 21:38:26 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfX6l-00000000EHW-3kMG;
	Tue, 13 Jan 2026 05:38:23 +0000
Date: Tue, 13 Jan 2026 13:38:12 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>
Subject: fs/notify/fsnotify.c:632:54: sparse: sparse: incorrect type
 in argument 1 (different address spaces)
Message-ID: <202601131336.7rTQaDDl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: b944249bcea97f2f6229852ae3f05f7acdcb0681 fsnotify: add mount notification infrastructure
date:   11 months ago
config: i386-randconfig-061-20260113 (https://download.01.org/0day-ci/archive/20260113/202601131336.7rTQaDDl-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601131336.7rTQaDDl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601131336.7rTQaDDl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/notify/fsnotify.c:433:16: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/notify/fsnotify.c:433:16: sparse:    struct fsnotify_mark_connector [noderef] __rcu *
   fs/notify/fsnotify.c:433:16: sparse:    struct fsnotify_mark_connector *
   fs/notify/fsnotify.c:435:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/notify/fsnotify.c:435:24: sparse:    struct hlist_node [noderef] __rcu *
   fs/notify/fsnotify.c:435:24: sparse:    struct hlist_node *
   fs/notify/fsnotify.c:445:24: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/notify/fsnotify.c:445:24: sparse:    struct hlist_node [noderef] __rcu *
   fs/notify/fsnotify.c:445:24: sparse:    struct hlist_node *
   fs/notify/fsnotify.c:616:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector *const *connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
   fs/notify/fsnotify.c:616:46: sparse:     expected struct fsnotify_mark_connector *const *connp
   fs/notify/fsnotify.c:616:46: sparse:     got struct fsnotify_mark_connector [noderef] __rcu **
   fs/notify/fsnotify.c:620:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector *const *connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
   fs/notify/fsnotify.c:620:46: sparse:     expected struct fsnotify_mark_connector *const *connp
   fs/notify/fsnotify.c:620:46: sparse:     got struct fsnotify_mark_connector [noderef] __rcu **
   fs/notify/fsnotify.c:624:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector *const *connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
   fs/notify/fsnotify.c:624:46: sparse:     expected struct fsnotify_mark_connector *const *connp
   fs/notify/fsnotify.c:624:46: sparse:     got struct fsnotify_mark_connector [noderef] __rcu **
   fs/notify/fsnotify.c:628:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector *const *connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
   fs/notify/fsnotify.c:628:46: sparse:     expected struct fsnotify_mark_connector *const *connp
   fs/notify/fsnotify.c:628:46: sparse:     got struct fsnotify_mark_connector [noderef] __rcu **
>> fs/notify/fsnotify.c:632:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector *const *connp @@     got struct fsnotify_mark_connector [noderef] __rcu *const * @@
   fs/notify/fsnotify.c:632:54: sparse:     expected struct fsnotify_mark_connector *const *connp
   fs/notify/fsnotify.c:632:54: sparse:     got struct fsnotify_mark_connector [noderef] __rcu *const *

vim +632 fs/notify/fsnotify.c

   520	
   521	/*
   522	 * fsnotify - This is the main call to fsnotify.
   523	 *
   524	 * The VFS calls into hook specific functions in linux/fsnotify.h.
   525	 * Those functions then in turn call here.  Here will call out to all of the
   526	 * registered fsnotify_group.  Those groups can then use the notification event
   527	 * in whatever means they feel necessary.
   528	 *
   529	 * @mask:	event type and flags
   530	 * @data:	object that event happened on
   531	 * @data_type:	type of object for fanotify_data_XXX() accessors
   532	 * @dir:	optional directory associated with event -
   533	 *		if @file_name is not NULL, this is the directory that
   534	 *		@file_name is relative to
   535	 * @file_name:	optional file name associated with event
   536	 * @inode:	optional inode associated with event -
   537	 *		If @dir and @inode are both non-NULL, event may be
   538	 *		reported to both.
   539	 * @cookie:	inotify rename cookie
   540	 */
   541	int fsnotify(__u32 mask, const void *data, int data_type, struct inode *dir,
   542		     const struct qstr *file_name, struct inode *inode, u32 cookie)
   543	{
   544		const struct path *path = fsnotify_data_path(data, data_type);
   545		struct super_block *sb = fsnotify_data_sb(data, data_type);
   546		const struct fsnotify_mnt *mnt_data = fsnotify_data_mnt(data, data_type);
   547		struct fsnotify_sb_info *sbinfo = sb ? fsnotify_sb_info(sb) : NULL;
   548		struct fsnotify_iter_info iter_info = {};
   549		struct mount *mnt = NULL;
   550		struct inode *inode2 = NULL;
   551		struct dentry *moved;
   552		int inode2_type;
   553		int ret = 0;
   554		__u32 test_mask, marks_mask = 0;
   555	
   556		if (path)
   557			mnt = real_mount(path->mnt);
   558	
   559		if (!inode) {
   560			/* Dirent event - report on TYPE_INODE to dir */
   561			inode = dir;
   562			/* For FS_RENAME, inode is old_dir and inode2 is new_dir */
   563			if (mask & FS_RENAME) {
   564				moved = fsnotify_data_dentry(data, data_type);
   565				inode2 = moved->d_parent->d_inode;
   566				inode2_type = FSNOTIFY_ITER_TYPE_INODE2;
   567			}
   568		} else if (mask & FS_EVENT_ON_CHILD) {
   569			/*
   570			 * Event on child - report on TYPE_PARENT to dir if it is
   571			 * watching children and on TYPE_INODE to child.
   572			 */
   573			inode2 = dir;
   574			inode2_type = FSNOTIFY_ITER_TYPE_PARENT;
   575		}
   576	
   577		/*
   578		 * Optimization: srcu_read_lock() has a memory barrier which can
   579		 * be expensive.  It protects walking the *_fsnotify_marks lists.
   580		 * However, if we do not walk the lists, we do not have to do
   581		 * SRCU because we have no references to any objects and do not
   582		 * need SRCU to keep them "alive".
   583		 */
   584		if ((!sbinfo || !sbinfo->sb_marks) &&
   585		    (!mnt || !mnt->mnt_fsnotify_marks) &&
   586		    (!inode || !inode->i_fsnotify_marks) &&
   587		    (!inode2 || !inode2->i_fsnotify_marks) &&
   588		    (!mnt_data || !mnt_data->ns->n_fsnotify_marks))
   589			return 0;
   590	
   591		if (sb)
   592			marks_mask |= READ_ONCE(sb->s_fsnotify_mask);
   593		if (mnt)
   594			marks_mask |= READ_ONCE(mnt->mnt_fsnotify_mask);
   595		if (inode)
   596			marks_mask |= READ_ONCE(inode->i_fsnotify_mask);
   597		if (inode2)
   598			marks_mask |= READ_ONCE(inode2->i_fsnotify_mask);
   599		if (mnt_data)
   600			marks_mask |= READ_ONCE(mnt_data->ns->n_fsnotify_mask);
   601	
   602		/*
   603		 * If this is a modify event we may need to clear some ignore masks.
   604		 * In that case, the object with ignore masks will have the FS_MODIFY
   605		 * event in its mask.
   606		 * Otherwise, return if none of the marks care about this type of event.
   607		 */
   608		test_mask = (mask & ALL_FSNOTIFY_EVENTS);
   609		if (!(test_mask & marks_mask))
   610			return 0;
   611	
   612		iter_info.srcu_idx = srcu_read_lock(&fsnotify_mark_srcu);
   613	
   614		if (sbinfo) {
   615			iter_info.marks[FSNOTIFY_ITER_TYPE_SB] =
   616				fsnotify_first_mark(&sbinfo->sb_marks);
   617		}
   618		if (mnt) {
   619			iter_info.marks[FSNOTIFY_ITER_TYPE_VFSMOUNT] =
   620				fsnotify_first_mark(&mnt->mnt_fsnotify_marks);
   621		}
   622		if (inode) {
   623			iter_info.marks[FSNOTIFY_ITER_TYPE_INODE] =
   624				fsnotify_first_mark(&inode->i_fsnotify_marks);
   625		}
   626		if (inode2) {
   627			iter_info.marks[inode2_type] =
   628				fsnotify_first_mark(&inode2->i_fsnotify_marks);
   629		}
   630		if (mnt_data) {
   631			iter_info.marks[FSNOTIFY_ITER_TYPE_MNTNS] =
 > 632				fsnotify_first_mark(&mnt_data->ns->n_fsnotify_marks);
   633		}
   634	
   635		/*
   636		 * We need to merge inode/vfsmount/sb mark lists so that e.g. inode mark
   637		 * ignore masks are properly reflected for mount/sb mark notifications.
   638		 * That's why this traversal is so complicated...
   639		 */
   640		while (fsnotify_iter_select_report_types(&iter_info)) {
   641			ret = send_to_group(mask, data, data_type, dir, file_name,
   642					    cookie, &iter_info);
   643	
   644			if (ret && (mask & ALL_FSNOTIFY_PERM_EVENTS))
   645				goto out;
   646	
   647			fsnotify_iter_next(&iter_info);
   648		}
   649		ret = 0;
   650	out:
   651		srcu_read_unlock(&fsnotify_mark_srcu, iter_info.srcu_idx);
   652	
   653		return ret;
   654	}
   655	EXPORT_SYMBOL_GPL(fsnotify);
   656	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
