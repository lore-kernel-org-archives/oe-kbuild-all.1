Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3602F0696
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Dec 2025 18:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765390127; cv=none; b=B+sCi+m2lhtf4GgSxQa1fbxsF8RZN2vO3Vlb93Ilbpv5UkzksprItrm1B6qHRnkgINcgq3Ehxg3tB9naysP+PuEsCqk4AfOqFvKTGqqDRMm0bxrEZi+0jIo82IcDwZYgbYY/REivYv3KkVteHs5Vr6yNFdxVCIdALIpfjhasuBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765390127; c=relaxed/simple;
	bh=pPYVASkRwvIs/QNE1ThX1F3nS3+2hOX/u+VfsKWrtow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ros6HgLTTMF8WeNnl2jPvHjOGJThI+ts4EgTKOF8NaJYmJxFL0aVE2wVTFJjjl7HbkSTqMI+0addM+WABxGbqKHv+Na8wTmI8GXG7GcQEOR5ILGZHkGlYlMaGZwtGI4ys47xd8V7C0R9rgYwAfHnBbaTd7msv1bz6uEWBCqocd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mGqjU58G; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mGqjU58G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765390125; x=1796926125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pPYVASkRwvIs/QNE1ThX1F3nS3+2hOX/u+VfsKWrtow=;
  b=mGqjU58GUdBwFnwxo+VOKjassHgcBx5psqufw1kzyObNut7qJN46MNqc
   KR8o+7w46D837FxpuDVOZUhYPjuk7PZhOZocR55BbC7d0i1sA22g2f0/B
   IW0OqdrmfXaevBX4PbexRPjB5/V5n8J8ZnaDF3gIMZnDDfU2HDPwo9mPx
   ayc6EM7qg7Zj6touT4fr9O/J13viXf360GtPgq2T0o4sTdc/pm8Z/wPJ6
   haM9vslmr8EeL4i3RsvoSwBNbt0SB3OdgVk2W81wSXfrgovQtyiQGAZOk
   OAt+70u4YS2MQ86qRRHgc/xH4Xmcl3kjTDPeXoHPwQ/GG9zujyu9tVBSB
   Q==;
X-CSE-ConnectionGUID: uipDVCjYTjmGqelQv3PbLg==
X-CSE-MsgGUID: 7B6ryUVRQXeJCHzL4JYYmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78480223"
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="78480223"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 10:08:45 -0800
X-CSE-ConnectionGUID: jHe2Rz1mQmO62Uqeb3ZfCw==
X-CSE-MsgGUID: +3Tg+4LjTyiZ3V0DtFWKnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,264,1758610800"; 
   d="scan'208";a="201065400"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Dec 2025 10:08:44 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTOcC-000000003c1-2mRi;
	Wed, 10 Dec 2025 18:08:40 +0000
Date: Thu, 11 Dec 2025 02:08:34 +0800
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>
Subject: fs/notify/fsnotify.c:616:46: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202512110148.r10YSxsY-lkp@intel.com>
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
config: parisc-randconfig-r113-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110148.r10YSxsY-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110148.r10YSxsY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110148.r10YSxsY-lkp@intel.com/

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
>> fs/notify/fsnotify.c:616:46: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector *const *connp @@     got struct fsnotify_mark_connector [noderef] __rcu ** @@
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
   fs/notify/fsnotify.c:632:54: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected struct fsnotify_mark_connector *const *connp @@     got struct fsnotify_mark_connector [noderef] __rcu *const * @@
   fs/notify/fsnotify.c:632:54: sparse:     expected struct fsnotify_mark_connector *const *connp
   fs/notify/fsnotify.c:632:54: sparse:     got struct fsnotify_mark_connector [noderef] __rcu *const *

vim +616 fs/notify/fsnotify.c

d9a6f30bb89309 Amir Goldstein          2018-04-20  520  
90586523eb4b34 Eric Paris              2009-05-21  521  /*
40a100d3adc1ad Amir Goldstein          2020-07-22  522   * fsnotify - This is the main call to fsnotify.
40a100d3adc1ad Amir Goldstein          2020-07-22  523   *
40a100d3adc1ad Amir Goldstein          2020-07-22  524   * The VFS calls into hook specific functions in linux/fsnotify.h.
40a100d3adc1ad Amir Goldstein          2020-07-22  525   * Those functions then in turn call here.  Here will call out to all of the
40a100d3adc1ad Amir Goldstein          2020-07-22  526   * registered fsnotify_group.  Those groups can then use the notification event
40a100d3adc1ad Amir Goldstein          2020-07-22  527   * in whatever means they feel necessary.
40a100d3adc1ad Amir Goldstein          2020-07-22  528   *
40a100d3adc1ad Amir Goldstein          2020-07-22  529   * @mask:	event type and flags
40a100d3adc1ad Amir Goldstein          2020-07-22  530   * @data:	object that event happened on
40a100d3adc1ad Amir Goldstein          2020-07-22  531   * @data_type:	type of object for fanotify_data_XXX() accessors
40a100d3adc1ad Amir Goldstein          2020-07-22  532   * @dir:	optional directory associated with event -
40a100d3adc1ad Amir Goldstein          2020-07-22  533   *		if @file_name is not NULL, this is the directory that
40a100d3adc1ad Amir Goldstein          2020-07-22  534   *		@file_name is relative to
40a100d3adc1ad Amir Goldstein          2020-07-22  535   * @file_name:	optional file name associated with event
40a100d3adc1ad Amir Goldstein          2020-07-22  536   * @inode:	optional inode associated with event -
29335033c574a1 Gabriel Krisman Bertazi 2021-10-25  537   *		If @dir and @inode are both non-NULL, event may be
29335033c574a1 Gabriel Krisman Bertazi 2021-10-25  538   *		reported to both.
40a100d3adc1ad Amir Goldstein          2020-07-22  539   * @cookie:	inotify rename cookie
90586523eb4b34 Eric Paris              2009-05-21  540   */
40a100d3adc1ad Amir Goldstein          2020-07-22  541  int fsnotify(__u32 mask, const void *data, int data_type, struct inode *dir,
40a100d3adc1ad Amir Goldstein          2020-07-22  542  	     const struct qstr *file_name, struct inode *inode, u32 cookie)
90586523eb4b34 Eric Paris              2009-05-21  543  {
b54cecf5e2293d Amir Goldstein          2020-06-07  544  	const struct path *path = fsnotify_data_path(data, data_type);
29335033c574a1 Gabriel Krisman Bertazi 2021-10-25  545  	struct super_block *sb = fsnotify_data_sb(data, data_type);
b944249bcea97f Miklos Szeredi          2025-01-29  546  	const struct fsnotify_mnt *mnt_data = fsnotify_data_mnt(data, data_type);
b944249bcea97f Miklos Szeredi          2025-01-29  547  	struct fsnotify_sb_info *sbinfo = sb ? fsnotify_sb_info(sb) : NULL;
3427ce71554123 Miklos Szeredi          2017-10-30  548  	struct fsnotify_iter_info iter_info = {};
60f7ed8c7c4d06 Amir Goldstein          2018-09-01  549  	struct mount *mnt = NULL;
e54183fa7047c1 Amir Goldstein          2021-11-29  550  	struct inode *inode2 = NULL;
e54183fa7047c1 Amir Goldstein          2021-11-29  551  	struct dentry *moved;
e54183fa7047c1 Amir Goldstein          2021-11-29  552  	int inode2_type;
9385a84d7e1f65 Jan Kara                2016-11-10  553  	int ret = 0;
b944249bcea97f Miklos Szeredi          2025-01-29  554  	__u32 test_mask, marks_mask = 0;
90586523eb4b34 Eric Paris              2009-05-21  555  
71d734103edfa2 Mel Gorman              2020-07-08  556  	if (path)
aa93bdc5500cc9 Amir Goldstein          2020-03-19  557  		mnt = real_mount(path->mnt);
3a9fb89f4cd04c Eric Paris              2009-12-17  558  
40a100d3adc1ad Amir Goldstein          2020-07-22  559  	if (!inode) {
40a100d3adc1ad Amir Goldstein          2020-07-22  560  		/* Dirent event - report on TYPE_INODE to dir */
40a100d3adc1ad Amir Goldstein          2020-07-22  561  		inode = dir;
e54183fa7047c1 Amir Goldstein          2021-11-29  562  		/* For FS_RENAME, inode is old_dir and inode2 is new_dir */
e54183fa7047c1 Amir Goldstein          2021-11-29  563  		if (mask & FS_RENAME) {
e54183fa7047c1 Amir Goldstein          2021-11-29  564  			moved = fsnotify_data_dentry(data, data_type);
e54183fa7047c1 Amir Goldstein          2021-11-29  565  			inode2 = moved->d_parent->d_inode;
e54183fa7047c1 Amir Goldstein          2021-11-29  566  			inode2_type = FSNOTIFY_ITER_TYPE_INODE2;
e54183fa7047c1 Amir Goldstein          2021-11-29  567  		}
40a100d3adc1ad Amir Goldstein          2020-07-22  568  	} else if (mask & FS_EVENT_ON_CHILD) {
40a100d3adc1ad Amir Goldstein          2020-07-22  569  		/*
fecc4559780d52 Amir Goldstein          2020-12-02  570  		 * Event on child - report on TYPE_PARENT to dir if it is
fecc4559780d52 Amir Goldstein          2020-12-02  571  		 * watching children and on TYPE_INODE to child.
40a100d3adc1ad Amir Goldstein          2020-07-22  572  		 */
e54183fa7047c1 Amir Goldstein          2021-11-29  573  		inode2 = dir;
e54183fa7047c1 Amir Goldstein          2021-11-29  574  		inode2_type = FSNOTIFY_ITER_TYPE_PARENT;
40a100d3adc1ad Amir Goldstein          2020-07-22  575  	}
497b0c5a7c0688 Amir Goldstein          2020-07-16  576  
7c49b8616460eb Dave Hansen             2015-09-04  577  	/*
7c49b8616460eb Dave Hansen             2015-09-04  578  	 * Optimization: srcu_read_lock() has a memory barrier which can
7c49b8616460eb Dave Hansen             2015-09-04  579  	 * be expensive.  It protects walking the *_fsnotify_marks lists.
7c49b8616460eb Dave Hansen             2015-09-04  580  	 * However, if we do not walk the lists, we do not have to do
7c49b8616460eb Dave Hansen             2015-09-04  581  	 * SRCU because we have no references to any objects and do not
7c49b8616460eb Dave Hansen             2015-09-04  582  	 * need SRCU to keep them "alive".
7c49b8616460eb Dave Hansen             2015-09-04  583  	 */
07a3b8d0bf726a Amir Goldstein          2024-03-17  584  	if ((!sbinfo || !sbinfo->sb_marks) &&
497b0c5a7c0688 Amir Goldstein          2020-07-16  585  	    (!mnt || !mnt->mnt_fsnotify_marks) &&
9b93f33105f5f9 Amir Goldstein          2020-07-16  586  	    (!inode || !inode->i_fsnotify_marks) &&
b944249bcea97f Miklos Szeredi          2025-01-29  587  	    (!inode2 || !inode2->i_fsnotify_marks) &&
b944249bcea97f Miklos Szeredi          2025-01-29  588  	    (!mnt_data || !mnt_data->ns->n_fsnotify_marks))
7c49b8616460eb Dave Hansen             2015-09-04  589  		return 0;
71d734103edfa2 Mel Gorman              2020-07-08  590  
b944249bcea97f Miklos Szeredi          2025-01-29  591  	if (sb)
b944249bcea97f Miklos Szeredi          2025-01-29  592  		marks_mask |= READ_ONCE(sb->s_fsnotify_mask);
71d734103edfa2 Mel Gorman              2020-07-08  593  	if (mnt)
35ceae44742e11 Jan Kara                2024-07-17  594  		marks_mask |= READ_ONCE(mnt->mnt_fsnotify_mask);
9b93f33105f5f9 Amir Goldstein          2020-07-16  595  	if (inode)
35ceae44742e11 Jan Kara                2024-07-17  596  		marks_mask |= READ_ONCE(inode->i_fsnotify_mask);
e54183fa7047c1 Amir Goldstein          2021-11-29  597  	if (inode2)
35ceae44742e11 Jan Kara                2024-07-17  598  		marks_mask |= READ_ONCE(inode2->i_fsnotify_mask);
b944249bcea97f Miklos Szeredi          2025-01-29  599  	if (mnt_data)
b944249bcea97f Miklos Szeredi          2025-01-29  600  		marks_mask |= READ_ONCE(mnt_data->ns->n_fsnotify_mask);
71d734103edfa2 Mel Gorman              2020-07-08  601  
613a807fe7c793 Eric Paris              2010-07-28  602  	/*
31a371e419c885 Amir Goldstein          2022-06-29  603  	 * If this is a modify event we may need to clear some ignore masks.
31a371e419c885 Amir Goldstein          2022-06-29  604  	 * In that case, the object with ignore masks will have the FS_MODIFY
04e317ba72d079 Amir Goldstein          2022-02-23  605  	 * event in its mask.
04e317ba72d079 Amir Goldstein          2022-02-23  606  	 * Otherwise, return if none of the marks care about this type of event.
613a807fe7c793 Eric Paris              2010-07-28  607  	 */
71d734103edfa2 Mel Gorman              2020-07-08  608  	test_mask = (mask & ALL_FSNOTIFY_EVENTS);
04e317ba72d079 Amir Goldstein          2022-02-23  609  	if (!(test_mask & marks_mask))
613a807fe7c793 Eric Paris              2010-07-28  610  		return 0;
75c1be487a690d Eric Paris              2010-07-28  611  
9385a84d7e1f65 Jan Kara                2016-11-10  612  	iter_info.srcu_idx = srcu_read_lock(&fsnotify_mark_srcu);
75c1be487a690d Eric Paris              2010-07-28  613  
07a3b8d0bf726a Amir Goldstein          2024-03-17  614  	if (sbinfo) {
1c9007d62bea6f Amir Goldstein          2021-11-29  615  		iter_info.marks[FSNOTIFY_ITER_TYPE_SB] =
07a3b8d0bf726a Amir Goldstein          2024-03-17 @616  			fsnotify_first_mark(&sbinfo->sb_marks);
07a3b8d0bf726a Amir Goldstein          2024-03-17  617  	}
9bdda4e9cf2dce Amir Goldstein          2018-09-01  618  	if (mnt) {
1c9007d62bea6f Amir Goldstein          2021-11-29  619  		iter_info.marks[FSNOTIFY_ITER_TYPE_VFSMOUNT] =
3427ce71554123 Miklos Szeredi          2017-10-30  620  			fsnotify_first_mark(&mnt->mnt_fsnotify_marks);
7131485a93679f Eric Paris              2009-12-17  621  	}
9b93f33105f5f9 Amir Goldstein          2020-07-16  622  	if (inode) {
1c9007d62bea6f Amir Goldstein          2021-11-29  623  		iter_info.marks[FSNOTIFY_ITER_TYPE_INODE] =
9b93f33105f5f9 Amir Goldstein          2020-07-16  624  			fsnotify_first_mark(&inode->i_fsnotify_marks);
9b93f33105f5f9 Amir Goldstein          2020-07-16  625  	}
e54183fa7047c1 Amir Goldstein          2021-11-29  626  	if (inode2) {
e54183fa7047c1 Amir Goldstein          2021-11-29  627  		iter_info.marks[inode2_type] =
e54183fa7047c1 Amir Goldstein          2021-11-29  628  			fsnotify_first_mark(&inode2->i_fsnotify_marks);
497b0c5a7c0688 Amir Goldstein          2020-07-16  629  	}
b944249bcea97f Miklos Szeredi          2025-01-29  630  	if (mnt_data) {
b944249bcea97f Miklos Szeredi          2025-01-29  631  		iter_info.marks[FSNOTIFY_ITER_TYPE_MNTNS] =
b944249bcea97f Miklos Szeredi          2025-01-29  632  			fsnotify_first_mark(&mnt_data->ns->n_fsnotify_marks);
b944249bcea97f Miklos Szeredi          2025-01-29  633  	}
75c1be487a690d Eric Paris              2010-07-28  634  
8edc6e1688fc8f Jan Kara                2014-11-13  635  	/*
60f7ed8c7c4d06 Amir Goldstein          2018-09-01  636  	 * We need to merge inode/vfsmount/sb mark lists so that e.g. inode mark
60f7ed8c7c4d06 Amir Goldstein          2018-09-01  637  	 * ignore masks are properly reflected for mount/sb mark notifications.
8edc6e1688fc8f Jan Kara                2014-11-13  638  	 * That's why this traversal is so complicated...
8edc6e1688fc8f Jan Kara                2014-11-13  639  	 */
d9a6f30bb89309 Amir Goldstein          2018-04-20  640  	while (fsnotify_iter_select_report_types(&iter_info)) {
b54cecf5e2293d Amir Goldstein          2020-06-07  641  		ret = send_to_group(mask, data, data_type, dir, file_name,
b54cecf5e2293d Amir Goldstein          2020-06-07  642  				    cookie, &iter_info);
613a807fe7c793 Eric Paris              2010-07-28  643  
ff8bcbd03da881 Eric Paris              2010-10-28  644  		if (ret && (mask & ALL_FSNOTIFY_PERM_EVENTS))
ff8bcbd03da881 Eric Paris              2010-10-28  645  			goto out;
ff8bcbd03da881 Eric Paris              2010-10-28  646  
d9a6f30bb89309 Amir Goldstein          2018-04-20  647  		fsnotify_iter_next(&iter_info);
90586523eb4b34 Eric Paris              2009-05-21  648  	}
ff8bcbd03da881 Eric Paris              2010-10-28  649  	ret = 0;
ff8bcbd03da881 Eric Paris              2010-10-28  650  out:
9385a84d7e1f65 Jan Kara                2016-11-10  651  	srcu_read_unlock(&fsnotify_mark_srcu, iter_info.srcu_idx);
c4ec54b40d33f8 Eric Paris              2009-12-17  652  
98b5c10d320adf Jean-Christophe Dubois  2010-03-23  653  	return ret;
90586523eb4b34 Eric Paris              2009-05-21  654  }
90586523eb4b34 Eric Paris              2009-05-21  655  EXPORT_SYMBOL_GPL(fsnotify);
90586523eb4b34 Eric Paris              2009-05-21  656  

:::::: The code at line 616 was first introduced by commit
:::::: 07a3b8d0bf726a1e49b050bbc6bd72f031e505fe fsnotify: lazy attach fsnotify_sb_info state to sb

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
