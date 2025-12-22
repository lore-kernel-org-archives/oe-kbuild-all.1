Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B297E105
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 04:30:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766377817; cv=none; b=phqFaBfION4GuIVNqfSr+YHHzS9JQtsA8nlvmK4qM33XPNr0PueR/Hvmhovse428Rz8LSKZEaN3ahYXznXInqET95BGeVrJKN6xIfmpTGbGMtZdn5nNBMffujyLiVSVohDIcjTAj/0m8cj+xHnobaTt+UK7mQNIdsatrcVFk39s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766377817; c=relaxed/simple;
	bh=/FfDXGOpwD2/zMy+WSoClNpBnnwc0bo+fAnZt+g8eSg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uR58SSNGgQ3P4QTwDEpwtodsE3c2jlDFSQ2QvIVD/iEMLsCSbQxzC6AVRXRFwXDp/k75eRRsMCmUIP+LLiiRgA1IHbRHEmJhWm1yhFMJylDNQ7VZNpxfisW1WSS+etYfLSq5gZYxJKcCV7Rt/yPzeUzx06IrLTnAHft8AiIIorU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwXepuaz; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwXepuaz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766377816; x=1797913816;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/FfDXGOpwD2/zMy+WSoClNpBnnwc0bo+fAnZt+g8eSg=;
  b=CwXepuaz6DrtPITi7gMcTwjo8Vpqs9lPNRP7MZoXk4m/ynT1TPqKQqxa
   28FPd0iFkcoL/qFZxhygWbii9euLh5uu+IQsBcrPaiDyzgRsJXElxIM6+
   XANDhGWJl68N3dqP4H6nUljCRYlAOWQll1AcmiXItU6IFkmvA2bGm7tkq
   /5s6ShSqAkPW3HTscF75o6XkOIGnXXS2///1hDtem13a7F2+cFx/rQ0X0
   tKOwnyv05RCGzD9OYhZ7BBOFHADjOoJfs5RkyN8dhs88sVWrnGfjBEVxo
   nrLY4sGlf00dWTAUYE9pBpXmj7LLxPvHygak/KdSIw+ATdEwyJTtRRBs+
   A==;
X-CSE-ConnectionGUID: IifQ4xXURySOMcPFIdFCng==
X-CSE-MsgGUID: 13WK5EBjTlyxnMvlFb4ZKQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="72081618"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="72081618"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 20:30:16 -0800
X-CSE-ConnectionGUID: BImzOO70RXuTWgue//rBtw==
X-CSE-MsgGUID: pyz8x/LbQUyDo0hnQyPMXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="230445471"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 21 Dec 2025 20:30:14 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXXYh-000000005MG-1EWg;
	Mon, 22 Dec 2025 04:30:11 +0000
Date: Mon, 22 Dec 2025 05:30:01 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 3/3] fs/fs-writeback.c:1349:6:
 warning: no previous prototype for function 'redirty_tail_locked'
Message-ID: <202512220545.jDxxyINJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   54e1389bda8399711722cd321abe212a2327e9a3
commit: 55cf94258af72fd493779ab2b7a4278d5c8d1d21 [3/3] ANDROID: writeback: export symbols to do a hierarchical writeback control
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251222/202512220545.jDxxyINJ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project ecaf673850beb241957352bd61e95ed34256635f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220545.jDxxyINJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220545.jDxxyINJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fs-writeback.c:138:6: warning: no previous prototype for function 'wb_wakeup' [-Wmissing-prototypes]
     138 | void wb_wakeup(struct bdi_writeback *wb)
         |      ^
   fs/fs-writeback.c:138:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     138 | void wb_wakeup(struct bdi_writeback *wb)
         | ^
         | static 
>> fs/fs-writeback.c:1349:6: warning: no previous prototype for function 'redirty_tail_locked' [-Wmissing-prototypes]
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         |      ^
   fs/fs-writeback.c:1349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1349 | void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
         | ^
         | static 
   2 warnings generated.


vim +/redirty_tail_locked +1349 fs/fs-writeback.c

  1339	
  1340	/*
  1341	 * Redirty an inode: set its when-it-was dirtied timestamp and move it to the
  1342	 * furthest end of its superblock's dirty-inode list.
  1343	 *
  1344	 * Before stamping the inode's ->dirtied_when, we check to see whether it is
  1345	 * already the most-recently-dirtied inode on the b_dirty list.  If that is
  1346	 * the case then the inode must have been redirtied while it was being written
  1347	 * out and we don't reset its dirtied_when.
  1348	 */
> 1349	void redirty_tail_locked(struct inode *inode, struct bdi_writeback *wb)
  1350	{
  1351		struct list_head *target_list = &wb->b_dirty;
  1352		assert_spin_locked(&inode->i_lock);
  1353	
  1354		inode->i_state &= ~I_SYNC_QUEUED;
  1355		/*
  1356		 * When the inode is being freed just don't bother with dirty list
  1357		 * tracking. Flush worker will ignore this inode anyway and it will
  1358		 * trigger assertions in inode_io_list_move_locked().
  1359		 */
  1360		if (inode->i_state & I_FREEING) {
  1361			list_del_init(&inode->i_io_list);
  1362			wb_io_lists_depopulated(wb);
  1363			return;
  1364		}
  1365		trace_android_vh_redirty_tail_locked(&target_list, inode, wb);
  1366		if (!list_empty(target_list)) {
  1367			struct inode *tail;
  1368	
  1369			tail = wb_inode(target_list->next);
  1370			if (time_before(inode->dirtied_when, tail->dirtied_when))
  1371				inode->dirtied_when = jiffies;
  1372		}
  1373		inode_io_list_move_locked(inode, wb, target_list);
  1374	}
  1375	EXPORT_SYMBOL_GPL(redirty_tail_locked);
  1376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
