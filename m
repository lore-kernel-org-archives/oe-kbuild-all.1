Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78A114A0A4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jul 2024 08:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721724205; cv=none; b=EZoSGhoaHBT4emaz0QaNK0vwHfmsP3s8y90Vgmw/ASNBKg6eGExfaC2L/89eaL+z1EWrVeHKc0BgfffbmwKn7B7wU3EqxeC0nMVvnSBgZaqLWmadoaewkB2DJ+xtmC6a2DrbTaIsO7Yuu2q672f69mhMZRKhYJhea1ktUayn+AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721724205; c=relaxed/simple;
	bh=LRDftGw3up6SvJy7YRCEAhX/4++emo8HJIupFyKQeW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qJd3yKGoksFaIY6zgfvXcH9/79EmHNliWQwZS2JhLA52nwqjqRKwv/rz5Vtun3bm5AnUcmHZ5QLZkVlVpN7HUVW0sr2q3EBpvNcHCLKa4cS9Gbrt9CvKbxYIC4KR3fCgNGfpg/E5ybnH3Y2Ez/9Z8c6AIDhSmE9ybRIHsP9s06c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJrqbpEM; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJrqbpEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721724204; x=1753260204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LRDftGw3up6SvJy7YRCEAhX/4++emo8HJIupFyKQeW8=;
  b=eJrqbpEMRW/NgmdKMuiwaiigyEah2fJxuf+srAQ5X8/uD+UXH8BCGWpG
   1wCWi0aRuyYgwk8WHjRug2q+Tmifnf0MZPfwvUfrh5/dI6qlnplmiXVi1
   EMo91kxXUI01+GpHcjjhPEfhIC8Z/px5gjLYqtYdzjZ8d9PcjTEYx7eXt
   GvDL/l+x06ZXQo51JkfZOSVxwo2+DpvnCA5QPJHRHU7Pj4LsBeleF5MN4
   Y85f8PNHrKcpX79yUtJMNjkTc7ZGk+LLRYAQuu2c2oleCQ4Wx8z04pf9N
   ifadAj+RhhBS4O2FLNlZpvZ5pDYBDWskiXEceEyjIIVvztGtHEefu7BXm
   w==;
X-CSE-ConnectionGUID: wI7tU0NJRe+dNjwaJW04fw==
X-CSE-MsgGUID: FJGrKYdhQ4OuznGvIO0vFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="44757535"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="44757535"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2024 01:43:23 -0700
X-CSE-ConnectionGUID: tyVXtfiNRLKH7AV6jo+SDA==
X-CSE-MsgGUID: 9jrwoS2lSGegYNpIDla7+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="57281724"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jul 2024 01:43:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWB7A-000lnQ-0U;
	Tue, 23 Jul 2024 08:43:20 +0000
Date: Tue, 23 Jul 2024 16:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 181/326]
 fs/xfs/libxfs/xfs_rtgroup.c:504:47: error: use of undeclared identifier
 'xfs_rtg_lock_class'; did you mean 'xfs_rtginode_lock_class'?
Message-ID: <202407231623.akwigxLZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   34a8467cd7c47cc944cc6fa11ea4b46671c935d1
commit: b1307d2905e0d20637fe7a3416217dc53c4e83cb [181/326] xfs: add a lockdep class key for rtgroup inodes
config: i386-randconfig-001-20240723 (https://download.01.org/0day-ci/archive/20240723/202407231623.akwigxLZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240723/202407231623.akwigxLZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407231623.akwigxLZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/libxfs/xfs_rtgroup.c:502:7: warning: declaration of 'enum xfs_rtg_inodes' will not be visible outside of this function [-Wvisibility]
     502 |         enum xfs_rtg_inodes     type)
         |              ^
   fs/xfs/libxfs/xfs_rtgroup.c:502:22: error: variable has incomplete type 'enum xfs_rtg_inodes'
     502 |         enum xfs_rtg_inodes     type)
         |                                 ^
   fs/xfs/libxfs/xfs_rtgroup.c:502:7: note: forward declaration of 'enum xfs_rtg_inodes'
     502 |         enum xfs_rtg_inodes     type)
         |              ^
>> fs/xfs/libxfs/xfs_rtgroup.c:504:47: error: use of undeclared identifier 'xfs_rtg_lock_class'; did you mean 'xfs_rtginode_lock_class'?
     504 |         lockdep_set_class_and_subclass(&ip->i_lock, &xfs_rtg_lock_class, type);
         |                                                      ^~~~~~~~~~~~~~~~~~
         |                                                      xfs_rtginode_lock_class
   include/linux/lockdep.h:170:48: note: expanded from macro 'lockdep_set_class_and_subclass'
     170 |         lockdep_init_map_type(&(lock)->dep_map, #key, key, sub, \
         |                                                       ^
   fs/xfs/libxfs/xfs_rtgroup.c:462:30: note: 'xfs_rtginode_lock_class' declared here
     462 | static struct lock_class_key xfs_rtginode_lock_class;
         |                              ^
>> fs/xfs/libxfs/xfs_rtgroup.c:505:31: error: use of undeclared identifier 'xfs_rtginode_cmp_fn'; did you mean 'xfs_rtginode_ilock_cmp_fn'?
     505 |         lock_set_cmp_fn(&ip->i_lock, xfs_rtginode_cmp_fn,
         |                                      ^~~~~~~~~~~~~~~~~~~
         |                                      xfs_rtginode_ilock_cmp_fn
   include/linux/lockdep.h:396:78: note: expanded from macro 'lock_set_cmp_fn'
     396 | #define lock_set_cmp_fn(lock, ...)      lockdep_set_lock_cmp_fn(&(lock)->dep_map, __VA_ARGS__)
         |                                                                                   ^
   fs/xfs/libxfs/xfs_rtgroup.c:465:1: note: 'xfs_rtginode_ilock_cmp_fn' declared here
     465 | xfs_rtginode_ilock_cmp_fn(
         | ^
>> fs/xfs/libxfs/xfs_rtgroup.c:506:4: error: use of undeclared identifier 'xfs_rtginode_print_fn'; did you mean 'xfs_rtginode_ilock_print_fn'?
     506 |                         xfs_rtginode_print_fn);
         |                         ^~~~~~~~~~~~~~~~~~~~~
         |                         xfs_rtginode_ilock_print_fn
   include/linux/lockdep.h:396:78: note: expanded from macro 'lock_set_cmp_fn'
     396 | #define lock_set_cmp_fn(lock, ...)      lockdep_set_lock_cmp_fn(&(lock)->dep_map, __VA_ARGS__)
         |                                                                                   ^
   fs/xfs/libxfs/xfs_rtgroup.c:482:1: note: 'xfs_rtginode_ilock_print_fn' declared here
     482 | xfs_rtginode_ilock_print_fn(
         | ^
   1 warning and 4 errors generated.


vim +504 fs/xfs/libxfs/xfs_rtgroup.c

   490	
   491	/*
   492	 * Most of the time each of the RTG inode locks are only taken one at a time.
   493	 * But when committing deferred ops, more than one of a kind can be taken.
   494	 * However, deferred rt ops will be committed in rgno order so there is no
   495	 * potential for deadlocks.  The code here is needed to tell lockdep about this
   496	 * order.
   497	 */
   498	static inline void
   499	xfs_rtginode_lockdep_setup(
   500		struct xfs_inode	*ip,
   501		xfs_rgnumber_t		rgno,
   502		enum xfs_rtg_inodes	type)
   503	{
 > 504		lockdep_set_class_and_subclass(&ip->i_lock, &xfs_rtg_lock_class, type);
 > 505		lock_set_cmp_fn(&ip->i_lock, xfs_rtginode_cmp_fn,
 > 506				xfs_rtginode_print_fn);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
