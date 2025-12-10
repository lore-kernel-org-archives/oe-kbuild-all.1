Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 230AB327209
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 17:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765387543; cv=none; b=Ddq7HZd84FjrcQNzkt6f58OFtNr5EjT97cQteefICDsF5cRkwJ2qaWB46CtGsp0uesddm0kQUuH5pFb1NR8dDf6FZFsl5VOXWehEdZpo8bpHoU/ZrpK7d2EZIOgN0SdelORTXz2CgQ7FUVGzv00jvhnbBUSBCWIhPINQ5yZtgLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765387543; c=relaxed/simple;
	bh=krcDC7gsacx2RHKVo2BTwEI3IBbs1kxm9wS/PWKC8hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rx7HzMpB/7OGkYA6C0uhvbumCjZAH8XH2n+xRYVcmI1Sla5nJ17btUzYz9A4WPKTRiCNMwQS/AJ5KuUcUlNWRCa2vlww/b35ELiaXg4Wwfg6DSnrNiVvVT97FgQi0p6qjWM84bi0c0bIq08unNs0zB0pv4jKNUfMIl8z4we+Y30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HLg/6N4H; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HLg/6N4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765387543; x=1796923543;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=krcDC7gsacx2RHKVo2BTwEI3IBbs1kxm9wS/PWKC8hg=;
  b=HLg/6N4HW9Ftzdo7X4me1IrpnlIHg91dc/RW66CJBii99DIQrvt62XLB
   fbLbLUmBt0RGjhk9j3FIR36/pu3KR9YP9dAYbJQz0BdYgbw9utTgSV4Pp
   8+Gew/WYdDUO9wnJyJauCCqqvBEnzkBRDqj0jV4OffSvZxalq7U+hXSyQ
   YUvm3UUTk4zl3W7a0D9rGsUhWrf1dBpHW/JaiMYlxyDgMnVemixfOA1Qk
   AQwJMpAbfOcUpI00aPmUhW3kmgOMWap8QxT2GuLRN4bKMeJtuC16J0UnU
   FUrVsMI5YYW6GwlVCVMOfyO51d2dNVhX/SmNkChCgCM5kNa2RJwzeqtTl
   g==;
X-CSE-ConnectionGUID: 9WvXM80pSyyb5nNFnkBb8Q==
X-CSE-MsgGUID: +OIli6s3QAWjK8ElpOyojA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67321628"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="67321628"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 09:25:41 -0800
X-CSE-ConnectionGUID: JJEropD/Tq+ysa6v/+M64g==
X-CSE-MsgGUID: hOFuyfDXSWaqpx4XqvJqlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="227214948"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Dec 2025 09:25:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTNwW-000000003Vx-3hYa;
	Wed, 10 Dec 2025 17:25:36 +0000
Date: Thu, 11 Dec 2025 01:25:05 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: fs/notify/fsnotify.c:632:54: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202512110132.CWJBYMh4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0048fbb4011ec55c32d3148b2cda56433f273375
commit: b944249bcea97f2f6229852ae3f05f7acdcb0681 fsnotify: add mount notification infrastructure
date:   10 months ago
config: arm-randconfig-r133-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110132.CWJBYMh4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110132.CWJBYMh4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110132.CWJBYMh4-lkp@intel.com/

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
