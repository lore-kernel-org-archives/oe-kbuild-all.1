Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77561E5B7B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 18:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758308268; cv=none; b=erWJla891NMOvdPbsu4GWb57ZeMjSXKxsAlADFq2H2cMtz0FHeS4Zgm2VZ40r0wmTSzlpxcuZzf0zGwiOQDNQwlyZblePkrrUAErQIbcc7ErL7meBKnni9wK4zFAqOdzrwCnP6MMgGQrhr880D6ncYSqvi2keSlLXO1wMKi6TwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758308268; c=relaxed/simple;
	bh=+ZZ7O+fjrGOKhX/dt9GTjRrGBI+XqsXTAl4vOqsFhgA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tCkGopFosEKkhwEGmzXvZSgV7SjeCHTkudiv2JObH5CgPk4qQzZRsVB8WiRP0mg1Dm0q6CgFsXxuUjTYSI/rID3AnslS9ca6m8MVtqFifUiItEleJK4hPFHwbeR41takZsFF8nmY07EtZwzUQhfX2GgYmNPb8gmfXmVisg5QniE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckc1cNk4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckc1cNk4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758308265; x=1789844265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ZZ7O+fjrGOKhX/dt9GTjRrGBI+XqsXTAl4vOqsFhgA=;
  b=ckc1cNk4Sa+Lh9TKi5R28agYuP/nHWAZqiEOU6fA9A8NjLRRXYfRvz73
   vTRrI0DosSFEegzBYv3QxrJVCIim1y+4WuXbeXwNl3nHGw+Dx5WlbBplh
   YjvanxilzgmDNV6DrevdBmOUNC3oQcs9rgJFAau9nQ48Fmi4VUZHsS58S
   KUKzLqTAk+1hnk4hUpqeJUqLAKDoGQGRuD2XX6+EQO/L437Jf6G1H27Xp
   0z/CmE5C28/aff7+HgSxu9rjZCIf5IB6qroHtx0PkN+cn3ySIotOQ/PuU
   4oU69E4e7n45tYQ5p/xYbRz/wTBTqEft7jIEwVadMwHoJ3UAx2ewYrSQU
   Q==;
X-CSE-ConnectionGUID: WThr3gPjQD+O9jo3p9kHcQ==
X-CSE-MsgGUID: FZ/C5+BxSQKtjCVWddVq/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11558"; a="60590735"
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="60590735"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2025 11:57:19 -0700
X-CSE-ConnectionGUID: fQs+wvsnSlGl/XQtCKTcSQ==
X-CSE-MsgGUID: edJ3NhK9QOCcLWtm/VBX4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,278,1751266800"; 
   d="scan'208";a="175460522"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Sep 2025 11:57:17 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzgIE-0004iG-01;
	Fri, 19 Sep 2025 18:57:14 +0000
Date: Sat, 20 Sep 2025 02:56:24 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:cap-analysis 13/13] fs/xfs/xfs_inode.c:156:6: warning:
 rw_semaphore 'VFS_I().i_rwsem' is not held on every path through here
Message-ID: <202509200215.D0fhysMM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git cap-analysis
head:   f0fefaa266b6cdc474b78bb5842ee7959505e166
commit: f0fefaa266b6cdc474b78bb5842ee7959505e166 [13/13] WIP: xfs: enable capability analysis
config: riscv-randconfig-002-20250920 (https://download.01.org/0day-ci/archive/20250920/202509200215.D0fhysMM-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7c861bcedf61607b6c087380ac711eb7ff918ca6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250920/202509200215.D0fhysMM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509200215.D0fhysMM-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_trans_ail.c:325:2: warning: calling function 'xfs_ail_check' requires holding spinlock 'ailp->ail_lock' exclusively [-Wthread-safety-analysis]
     325 |         xfs_ail_check(ailp, lip);
         |         ^
   1 warning generated.
--
>> fs/xfs/xfs_extent_busy.c:573:26: warning: expecting spinlock 'xfs_group_hold(busyp->group)..xg_busy_extents->eb_lock' to be held at start of each loop [-Wthread-safety-analysis]
     573 |                 struct xfs_group        *xg = xfs_group_hold(busyp->group);
         |                                               ^
   fs/xfs/xfs_extent_busy.c:577:3: note: spinlock acquired here
     577 |                 spin_lock(&eb->eb_lock);
         |                 ^
>> fs/xfs/xfs_extent_busy.c:590:3: warning: releasing spinlock 'xfs_group_hold((busyp->list.next - #undefined).group)..xg_busy_extents->eb_lock' that was not held [-Wthread-safety-analysis]
     590 |                 spin_unlock(&eb->eb_lock);
         |                 ^
>> fs/xfs/xfs_extent_busy.c:593:1: warning: spinlock 'xfs_group_hold(busyp->group)..xg_busy_extents->eb_lock' is not held on every path through here [-Wthread-safety-analysis]
     593 | }
         | ^
   fs/xfs/xfs_extent_busy.c:577:3: note: spinlock acquired here
     577 |                 spin_lock(&eb->eb_lock);
         |                 ^
   3 warnings generated.
--
>> fs/xfs/xfs_log.c:481:7: warning: expecting spinlock 'log->l_icloglock' to be held at start of each loop [-Wthread-safety-analysis]
     481 |                 if (atomic_read(&iclog->ic_refcnt)) {
         |                     ^
   fs/xfs/xfs_log.c:490:3: note: spinlock acquired here
     490 |                 spin_lock(&log->l_icloglock);
         |                 ^
>> fs/xfs/xfs_log.c:486:3: warning: releasing spinlock 'log->l_icloglock' that was not held [-Wthread-safety-analysis]
     486 |                 spin_unlock(&log->l_icloglock);
         |                 ^
   fs/xfs/xfs_log.c:493:20: warning: expecting spinlock 'log->l_icloglock' to be held at start of each loop [-Wthread-safety-analysis]
     493 |         } while ((iclog = iclog->ic_next) != log->l_iclog);
         |                           ^
   fs/xfs/xfs_log.c:490:3: note: spinlock acquired here
     490 |                 spin_lock(&log->l_icloglock);
         |                 ^
>> fs/xfs/xfs_log.c:496:1: warning: spinlock 'log->l_icloglock' is still held at the end of function [-Wthread-safety-analysis]
     496 | }
         | ^
   fs/xfs/xfs_log.c:490:3: note: spinlock acquired here
     490 |                 spin_lock(&log->l_icloglock);
         |                 ^
   4 warnings generated.
--
>> fs/xfs/xfs_inode.c:156:6: warning: rw_semaphore 'VFS_I().i_rwsem' is not held on every path through here [-Wthread-safety-analysis]
     156 |         if (lock_flags & XFS_MMAPLOCK_EXCL) {
         |             ^
   fs/xfs/xfs_inode.c:152:3: note: rw_semaphore acquired here
     152 |                 down_read_nested(&VFS_I(ip)->i_rwsem,
         |                 ^
>> fs/xfs/xfs_inode.c:156:6: warning: rw_semaphore 'VFS_I().i_rwsem' is not held on every path through here [-Wthread-safety-analysis]
     156 |         if (lock_flags & XFS_MMAPLOCK_EXCL) {
         |             ^
   fs/xfs/xfs_inode.c:149:3: note: rw_semaphore acquired here
     149 |                 down_write_nested(&VFS_I(ip)->i_rwsem,
         |                 ^
>> fs/xfs/xfs_inode.c:164:6: warning: rw_semaphore 'VFS_I().i_mapping->invalidate_lock' is not held on every path through here [-Wthread-safety-analysis]
     164 |         if (lock_flags & XFS_ILOCK_EXCL)
         |             ^
   fs/xfs/xfs_inode.c:160:3: note: rw_semaphore acquired here
     160 |                 down_read_nested(&VFS_I(ip)->i_mapping->invalidate_lock,
         |                 ^
>> fs/xfs/xfs_inode.c:164:6: warning: rw_semaphore 'VFS_I().i_mapping->invalidate_lock' is not held on every path through here [-Wthread-safety-analysis]
     164 |         if (lock_flags & XFS_ILOCK_EXCL)
         |             ^
   fs/xfs/xfs_inode.c:157:3: note: rw_semaphore acquired here
     157 |                 down_write_nested(&VFS_I(ip)->i_mapping->invalidate_lock,
         |                 ^
>> fs/xfs/xfs_inode.c:168:1: warning: rw_semaphore '->i_lock' is not held on every path through here [-Wthread-safety-analysis]
     168 | }
         | ^
   fs/xfs/xfs_inode.c:167:3: note: rw_semaphore acquired here
     167 |                 down_read_nested(&ip->i_lock, XFS_ILOCK_DEP(lock_flags));
         |                 ^
>> fs/xfs/xfs_inode.c:168:1: warning: rw_semaphore '->i_lock' is not held on every path through here [-Wthread-safety-analysis]
     168 | }
         | ^
   fs/xfs/xfs_inode.c:165:3: note: rw_semaphore acquired here
     165 |                 down_write_nested(&ip->i_lock, XFS_ILOCK_DEP(lock_flags));
         |                 ^
   fs/xfs/xfs_inode.c:199:6: warning: rw_semaphore 'VFS_I().i_rwsem' is not held on every path through here [-Wthread-safety-analysis]
     199 |         if (lock_flags & XFS_MMAPLOCK_EXCL) {
         |             ^
   fs/xfs/xfs_inode.c:195:8: note: rw_semaphore acquired here
     195 |                 if (!down_read_trylock(&VFS_I(ip)->i_rwsem))
         |                      ^
   fs/xfs/xfs_inode.c:199:6: warning: rw_semaphore 'VFS_I().i_rwsem' is not held on every path through here [-Wthread-safety-analysis]
     199 |         if (lock_flags & XFS_MMAPLOCK_EXCL) {
         |             ^
   fs/xfs/xfs_inode.c:192:8: note: rw_semaphore acquired here
     192 |                 if (!down_write_trylock(&VFS_I(ip)->i_rwsem))
         |                      ^
   fs/xfs/xfs_inode.c:207:6: warning: rw_semaphore 'VFS_I().i_mapping->invalidate_lock' is not held on every path through here [-Wthread-safety-analysis]
     207 |         if (lock_flags & XFS_ILOCK_EXCL) {
         |             ^
   fs/xfs/xfs_inode.c:203:8: note: rw_semaphore acquired here
     203 |                 if (!down_read_trylock(&VFS_I(ip)->i_mapping->invalidate_lock))
         |                      ^
   fs/xfs/xfs_inode.c:207:6: warning: rw_semaphore 'VFS_I().i_mapping->invalidate_lock' is not held on every path through here [-Wthread-safety-analysis]
     207 |         if (lock_flags & XFS_ILOCK_EXCL) {
         |             ^
   fs/xfs/xfs_inode.c:200:8: note: rw_semaphore acquired here
     200 |                 if (!down_write_trylock(&VFS_I(ip)->i_mapping->invalidate_lock))
         |                      ^
   fs/xfs/xfs_inode.c:214:9: warning: rw_semaphore '->i_lock' is not held on every path through here [-Wthread-safety-analysis]
     214 |         return 1;
         |                ^
   fs/xfs/xfs_inode.c:211:8: note: rw_semaphore acquired here
     211 |                 if (!down_read_trylock(&ip->i_lock))
         |                      ^
   fs/xfs/xfs_inode.c:214:9: warning: rw_semaphore '->i_lock' is not held on every path through here [-Wthread-safety-analysis]
     214 |         return 1;
         |                ^
   fs/xfs/xfs_inode.c:208:8: note: rw_semaphore acquired here
     208 |                 if (!down_write_trylock(&ip->i_lock))
         |                      ^
>> fs/xfs/xfs_inode.c:218:3: warning: releasing rw_semaphore 'VFS_I().i_mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
     218 |                 up_write(&VFS_I(ip)->i_mapping->invalidate_lock);
         |                 ^
   fs/xfs/xfs_inode.c:220:3: warning: releasing rw_semaphore 'VFS_I().i_mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
     220 |                 up_read(&VFS_I(ip)->i_mapping->invalidate_lock);
         |                 ^
>> fs/xfs/xfs_inode.c:223:3: warning: releasing rw_semaphore 'VFS_I().i_rwsem' that was not held [-Wthread-safety-analysis]
     223 |                 up_write(&VFS_I(ip)->i_rwsem);
         |                 ^
   fs/xfs/xfs_inode.c:225:3: warning: releasing rw_semaphore 'VFS_I().i_rwsem' that was not held [-Wthread-safety-analysis]
     225 |                 up_read(&VFS_I(ip)->i_rwsem);
         |                 ^
   fs/xfs/xfs_inode.c:250:3: warning: releasing rw_semaphore 'VFS_I().i_rwsem' that was not held [-Wthread-safety-analysis]
     250 |                 up_write(&VFS_I(ip)->i_rwsem);
         |                 ^
   fs/xfs/xfs_inode.c:252:3: warning: releasing rw_semaphore 'VFS_I().i_rwsem' that was not held [-Wthread-safety-analysis]
     252 |                 up_read(&VFS_I(ip)->i_rwsem);
         |                 ^
   fs/xfs/xfs_inode.c:255:3: warning: releasing rw_semaphore 'VFS_I().i_mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
     255 |                 up_write(&VFS_I(ip)->i_mapping->invalidate_lock);
         |                 ^
   fs/xfs/xfs_inode.c:257:3: warning: releasing rw_semaphore 'VFS_I().i_mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
     257 |                 up_read(&VFS_I(ip)->i_mapping->invalidate_lock);
         |                 ^
>> fs/xfs/xfs_inode.c:260:3: warning: releasing rw_semaphore '->i_lock' that was not held [-Wthread-safety-analysis]
     260 |                 up_write(&ip->i_lock);
         |                 ^
   fs/xfs/xfs_inode.c:262:3: warning: releasing rw_semaphore '->i_lock' that was not held [-Wthread-safety-analysis]
     262 |                 up_read(&ip->i_lock);
         |                 ^
   fs/xfs/xfs_inode.c:281:3: warning: releasing rw_semaphore '->i_lock' that was not held [-Wthread-safety-analysis]
     281 |                 downgrade_write(&ip->i_lock);
         |                 ^
   fs/xfs/xfs_inode.c:282:6: warning: rw_semaphore '->i_lock' is not held on every path through here [-Wthread-safety-analysis]
     282 |         if (lock_flags & XFS_MMAPLOCK_EXCL)
         |             ^
   fs/xfs/xfs_inode.c:281:3: note: rw_semaphore acquired here
     281 |                 downgrade_write(&ip->i_lock);
         |                 ^
   fs/xfs/xfs_inode.c:283:3: warning: releasing rw_semaphore 'VFS_I().i_mapping->invalidate_lock' that was not held [-Wthread-safety-analysis]
     283 |                 downgrade_write(&VFS_I(ip)->i_mapping->invalidate_lock);
         |                 ^
   fs/xfs/xfs_inode.c:284:6: warning: rw_semaphore 'VFS_I().i_mapping->invalidate_lock' is not held on every path through here [-Wthread-safety-analysis]
     284 |         if (lock_flags & XFS_IOLOCK_EXCL)
         |             ^
   fs/xfs/xfs_inode.c:283:3: note: rw_semaphore acquired here
     283 |                 downgrade_write(&VFS_I(ip)->i_mapping->invalidate_lock);
         |                 ^
   fs/xfs/xfs_inode.c:285:3: warning: releasing rw_semaphore 'VFS_I().i_rwsem' that was not held [-Wthread-safety-analysis]
     285 |                 downgrade_write(&VFS_I(ip)->i_rwsem);
         |                 ^
   fs/xfs/xfs_inode.c:287:2: warning: rw_semaphore 'VFS_I().i_rwsem' is not held on every path through here [-Wthread-safety-analysis]
     287 |         trace_xfs_ilock_demote(ip, lock_flags, _RET_IP_);
         |         ^
   fs/xfs/xfs_inode.c:285:3: note: rw_semaphore acquired here
     285 |                 downgrade_write(&VFS_I(ip)->i_rwsem);
         |                 ^
   28 warnings generated.


vim +156 fs/xfs/xfs_inode.c

ca76a761ea2497 Kaixu Xia               2022-06-19  108  
fa96acadf1eb71 Dave Chinner            2012-10-08  109  /*
6552321831dce8 Christoph Hellwig       2016-11-30  110   * In addition to i_rwsem in the VFS inode, the xfs inode contains 2
2433480a7e1d0c Jan Kara                2021-04-12  111   * multi-reader locks: invalidate_lock and the i_lock.  This routine allows
6552321831dce8 Christoph Hellwig       2016-11-30  112   * various combinations of the locks to be obtained.
fa96acadf1eb71 Dave Chinner            2012-10-08  113   *
653c60b633a901 Dave Chinner            2015-02-23  114   * The 3 locks should always be ordered so that the IO lock is obtained first,
653c60b633a901 Dave Chinner            2015-02-23  115   * the mmap lock second and the ilock last in order to prevent deadlock.
fa96acadf1eb71 Dave Chinner            2012-10-08  116   *
653c60b633a901 Dave Chinner            2015-02-23  117   * Basic locking order:
653c60b633a901 Dave Chinner            2015-02-23  118   *
2433480a7e1d0c Jan Kara                2021-04-12  119   * i_rwsem -> invalidate_lock -> page_lock -> i_ilock
653c60b633a901 Dave Chinner            2015-02-23  120   *
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  121   * mmap_lock locking order:
653c60b633a901 Dave Chinner            2015-02-23  122   *
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  123   * i_rwsem -> page lock -> mmap_lock
2433480a7e1d0c Jan Kara                2021-04-12  124   * mmap_lock -> invalidate_lock -> page_lock
653c60b633a901 Dave Chinner            2015-02-23  125   *
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  126   * The difference in mmap_lock locking order mean that we cannot hold the
2433480a7e1d0c Jan Kara                2021-04-12  127   * invalidate_lock over syscall based read(2)/write(2) based IO. These IO paths
2433480a7e1d0c Jan Kara                2021-04-12  128   * can fault in pages during copy in/out (for buffered IO) or require the
2433480a7e1d0c Jan Kara                2021-04-12  129   * mmap_lock in get_user_pages() to map the user pages into the kernel address
2433480a7e1d0c Jan Kara                2021-04-12  130   * space for direct IO. Similarly the i_rwsem cannot be taken inside a page
2433480a7e1d0c Jan Kara                2021-04-12  131   * fault because page faults already hold the mmap_lock.
653c60b633a901 Dave Chinner            2015-02-23  132   *
653c60b633a901 Dave Chinner            2015-02-23  133   * Hence to serialise fully against both syscall and mmap based IO, we need to
2433480a7e1d0c Jan Kara                2021-04-12  134   * take both the i_rwsem and the invalidate_lock. These locks should *only* be
2433480a7e1d0c Jan Kara                2021-04-12  135   * both taken in places where we need to invalidate the page cache in a race
653c60b633a901 Dave Chinner            2015-02-23  136   * free manner (e.g. truncate, hole punch and other extent manipulation
653c60b633a901 Dave Chinner            2015-02-23  137   * functions).
fa96acadf1eb71 Dave Chinner            2012-10-08  138   */
fa96acadf1eb71 Dave Chinner            2012-10-08  139  void
fa96acadf1eb71 Dave Chinner            2012-10-08  140  xfs_ilock(
fa96acadf1eb71 Dave Chinner            2012-10-08  141  	xfs_inode_t		*ip,
fa96acadf1eb71 Dave Chinner            2012-10-08  142  	uint			lock_flags)
fa96acadf1eb71 Dave Chinner            2012-10-08  143  {
fa96acadf1eb71 Dave Chinner            2012-10-08  144  	trace_xfs_ilock(ip, lock_flags, _RET_IP_);
fa96acadf1eb71 Dave Chinner            2012-10-08  145  
ca76a761ea2497 Kaixu Xia               2022-06-19  146  	xfs_lock_flags_assert(lock_flags);
fa96acadf1eb71 Dave Chinner            2012-10-08  147  
6552321831dce8 Christoph Hellwig       2016-11-30  148  	if (lock_flags & XFS_IOLOCK_EXCL) {
6552321831dce8 Christoph Hellwig       2016-11-30  149  		down_write_nested(&VFS_I(ip)->i_rwsem,
6552321831dce8 Christoph Hellwig       2016-11-30  150  				  XFS_IOLOCK_DEP(lock_flags));
6552321831dce8 Christoph Hellwig       2016-11-30  151  	} else if (lock_flags & XFS_IOLOCK_SHARED) {
6552321831dce8 Christoph Hellwig       2016-11-30  152  		down_read_nested(&VFS_I(ip)->i_rwsem,
6552321831dce8 Christoph Hellwig       2016-11-30  153  				 XFS_IOLOCK_DEP(lock_flags));
6552321831dce8 Christoph Hellwig       2016-11-30  154  	}
fa96acadf1eb71 Dave Chinner            2012-10-08  155  
2433480a7e1d0c Jan Kara                2021-04-12 @156  	if (lock_flags & XFS_MMAPLOCK_EXCL) {
2433480a7e1d0c Jan Kara                2021-04-12  157  		down_write_nested(&VFS_I(ip)->i_mapping->invalidate_lock,
2433480a7e1d0c Jan Kara                2021-04-12  158  				  XFS_MMAPLOCK_DEP(lock_flags));
2433480a7e1d0c Jan Kara                2021-04-12  159  	} else if (lock_flags & XFS_MMAPLOCK_SHARED) {
2433480a7e1d0c Jan Kara                2021-04-12  160  		down_read_nested(&VFS_I(ip)->i_mapping->invalidate_lock,
2433480a7e1d0c Jan Kara                2021-04-12  161  				 XFS_MMAPLOCK_DEP(lock_flags));
2433480a7e1d0c Jan Kara                2021-04-12  162  	}
653c60b633a901 Dave Chinner            2015-02-23  163  
fa96acadf1eb71 Dave Chinner            2012-10-08 @164  	if (lock_flags & XFS_ILOCK_EXCL)
785dd131525060 Matthew Wilcox (Oracle  2024-02-19  165) 		down_write_nested(&ip->i_lock, XFS_ILOCK_DEP(lock_flags));
fa96acadf1eb71 Dave Chinner            2012-10-08  166  	else if (lock_flags & XFS_ILOCK_SHARED)
785dd131525060 Matthew Wilcox (Oracle  2024-02-19  167) 		down_read_nested(&ip->i_lock, XFS_ILOCK_DEP(lock_flags));
fa96acadf1eb71 Dave Chinner            2012-10-08 @168  }
fa96acadf1eb71 Dave Chinner            2012-10-08  169  
fa96acadf1eb71 Dave Chinner            2012-10-08  170  /*
fa96acadf1eb71 Dave Chinner            2012-10-08  171   * This is just like xfs_ilock(), except that the caller
fa96acadf1eb71 Dave Chinner            2012-10-08  172   * is guaranteed not to sleep.  It returns 1 if it gets
fa96acadf1eb71 Dave Chinner            2012-10-08  173   * the requested locks and 0 otherwise.  If the IO lock is
fa96acadf1eb71 Dave Chinner            2012-10-08  174   * obtained but the inode lock cannot be, then the IO lock
fa96acadf1eb71 Dave Chinner            2012-10-08  175   * is dropped before returning.
fa96acadf1eb71 Dave Chinner            2012-10-08  176   *
fa96acadf1eb71 Dave Chinner            2012-10-08  177   * ip -- the inode being locked
fa96acadf1eb71 Dave Chinner            2012-10-08  178   * lock_flags -- this parameter indicates the inode's locks to be
fa96acadf1eb71 Dave Chinner            2012-10-08  179   *       to be locked.  See the comment for xfs_ilock() for a list
fa96acadf1eb71 Dave Chinner            2012-10-08  180   *	 of valid values.
fa96acadf1eb71 Dave Chinner            2012-10-08  181   */
fa96acadf1eb71 Dave Chinner            2012-10-08  182  int
fa96acadf1eb71 Dave Chinner            2012-10-08  183  xfs_ilock_nowait(
fa96acadf1eb71 Dave Chinner            2012-10-08  184  	xfs_inode_t		*ip,
fa96acadf1eb71 Dave Chinner            2012-10-08  185  	uint			lock_flags)
fa96acadf1eb71 Dave Chinner            2012-10-08  186  {
fa96acadf1eb71 Dave Chinner            2012-10-08  187  	trace_xfs_ilock_nowait(ip, lock_flags, _RET_IP_);
fa96acadf1eb71 Dave Chinner            2012-10-08  188  
ca76a761ea2497 Kaixu Xia               2022-06-19  189  	xfs_lock_flags_assert(lock_flags);
fa96acadf1eb71 Dave Chinner            2012-10-08  190  
fa96acadf1eb71 Dave Chinner            2012-10-08  191  	if (lock_flags & XFS_IOLOCK_EXCL) {
6552321831dce8 Christoph Hellwig       2016-11-30  192  		if (!down_write_trylock(&VFS_I(ip)->i_rwsem))
fa96acadf1eb71 Dave Chinner            2012-10-08  193  			goto out;
fa96acadf1eb71 Dave Chinner            2012-10-08  194  	} else if (lock_flags & XFS_IOLOCK_SHARED) {
6552321831dce8 Christoph Hellwig       2016-11-30  195  		if (!down_read_trylock(&VFS_I(ip)->i_rwsem))
fa96acadf1eb71 Dave Chinner            2012-10-08  196  			goto out;
fa96acadf1eb71 Dave Chinner            2012-10-08  197  	}
653c60b633a901 Dave Chinner            2015-02-23  198  
653c60b633a901 Dave Chinner            2015-02-23  199  	if (lock_flags & XFS_MMAPLOCK_EXCL) {
2433480a7e1d0c Jan Kara                2021-04-12  200  		if (!down_write_trylock(&VFS_I(ip)->i_mapping->invalidate_lock))
653c60b633a901 Dave Chinner            2015-02-23  201  			goto out_undo_iolock;
653c60b633a901 Dave Chinner            2015-02-23  202  	} else if (lock_flags & XFS_MMAPLOCK_SHARED) {
2433480a7e1d0c Jan Kara                2021-04-12  203  		if (!down_read_trylock(&VFS_I(ip)->i_mapping->invalidate_lock))
653c60b633a901 Dave Chinner            2015-02-23  204  			goto out_undo_iolock;
653c60b633a901 Dave Chinner            2015-02-23  205  	}
653c60b633a901 Dave Chinner            2015-02-23  206  
fa96acadf1eb71 Dave Chinner            2012-10-08  207  	if (lock_flags & XFS_ILOCK_EXCL) {
785dd131525060 Matthew Wilcox (Oracle  2024-02-19  208) 		if (!down_write_trylock(&ip->i_lock))
653c60b633a901 Dave Chinner            2015-02-23  209  			goto out_undo_mmaplock;
fa96acadf1eb71 Dave Chinner            2012-10-08  210  	} else if (lock_flags & XFS_ILOCK_SHARED) {
785dd131525060 Matthew Wilcox (Oracle  2024-02-19  211) 		if (!down_read_trylock(&ip->i_lock))
653c60b633a901 Dave Chinner            2015-02-23  212  			goto out_undo_mmaplock;
fa96acadf1eb71 Dave Chinner            2012-10-08  213  	}
fa96acadf1eb71 Dave Chinner            2012-10-08  214  	return 1;
fa96acadf1eb71 Dave Chinner            2012-10-08  215  
653c60b633a901 Dave Chinner            2015-02-23  216  out_undo_mmaplock:
653c60b633a901 Dave Chinner            2015-02-23  217  	if (lock_flags & XFS_MMAPLOCK_EXCL)
2433480a7e1d0c Jan Kara                2021-04-12 @218  		up_write(&VFS_I(ip)->i_mapping->invalidate_lock);
653c60b633a901 Dave Chinner            2015-02-23  219  	else if (lock_flags & XFS_MMAPLOCK_SHARED)
2433480a7e1d0c Jan Kara                2021-04-12  220  		up_read(&VFS_I(ip)->i_mapping->invalidate_lock);
fa96acadf1eb71 Dave Chinner            2012-10-08  221  out_undo_iolock:
fa96acadf1eb71 Dave Chinner            2012-10-08  222  	if (lock_flags & XFS_IOLOCK_EXCL)
6552321831dce8 Christoph Hellwig       2016-11-30 @223  		up_write(&VFS_I(ip)->i_rwsem);
fa96acadf1eb71 Dave Chinner            2012-10-08  224  	else if (lock_flags & XFS_IOLOCK_SHARED)
6552321831dce8 Christoph Hellwig       2016-11-30  225  		up_read(&VFS_I(ip)->i_rwsem);
fa96acadf1eb71 Dave Chinner            2012-10-08  226  out:
fa96acadf1eb71 Dave Chinner            2012-10-08  227  	return 0;
fa96acadf1eb71 Dave Chinner            2012-10-08  228  }
fa96acadf1eb71 Dave Chinner            2012-10-08  229  
fa96acadf1eb71 Dave Chinner            2012-10-08  230  /*
fa96acadf1eb71 Dave Chinner            2012-10-08  231   * xfs_iunlock() is used to drop the inode locks acquired with
fa96acadf1eb71 Dave Chinner            2012-10-08  232   * xfs_ilock() and xfs_ilock_nowait().  The caller must pass
fa96acadf1eb71 Dave Chinner            2012-10-08  233   * in the flags given to xfs_ilock() or xfs_ilock_nowait() so
fa96acadf1eb71 Dave Chinner            2012-10-08  234   * that we know which locks to drop.
fa96acadf1eb71 Dave Chinner            2012-10-08  235   *
fa96acadf1eb71 Dave Chinner            2012-10-08  236   * ip -- the inode being unlocked
fa96acadf1eb71 Dave Chinner            2012-10-08  237   * lock_flags -- this parameter indicates the inode's locks to be
fa96acadf1eb71 Dave Chinner            2012-10-08  238   *       to be unlocked.  See the comment for xfs_ilock() for a list
fa96acadf1eb71 Dave Chinner            2012-10-08  239   *	 of valid values for this parameter.
fa96acadf1eb71 Dave Chinner            2012-10-08  240   *
fa96acadf1eb71 Dave Chinner            2012-10-08  241   */
fa96acadf1eb71 Dave Chinner            2012-10-08  242  void
fa96acadf1eb71 Dave Chinner            2012-10-08  243  xfs_iunlock(
fa96acadf1eb71 Dave Chinner            2012-10-08  244  	xfs_inode_t		*ip,
fa96acadf1eb71 Dave Chinner            2012-10-08  245  	uint			lock_flags)
fa96acadf1eb71 Dave Chinner            2012-10-08  246  {
ca76a761ea2497 Kaixu Xia               2022-06-19  247  	xfs_lock_flags_assert(lock_flags);
fa96acadf1eb71 Dave Chinner            2012-10-08  248  
fa96acadf1eb71 Dave Chinner            2012-10-08  249  	if (lock_flags & XFS_IOLOCK_EXCL)
6552321831dce8 Christoph Hellwig       2016-11-30  250  		up_write(&VFS_I(ip)->i_rwsem);
fa96acadf1eb71 Dave Chinner            2012-10-08  251  	else if (lock_flags & XFS_IOLOCK_SHARED)
6552321831dce8 Christoph Hellwig       2016-11-30  252  		up_read(&VFS_I(ip)->i_rwsem);
fa96acadf1eb71 Dave Chinner            2012-10-08  253  
653c60b633a901 Dave Chinner            2015-02-23  254  	if (lock_flags & XFS_MMAPLOCK_EXCL)
2433480a7e1d0c Jan Kara                2021-04-12  255  		up_write(&VFS_I(ip)->i_mapping->invalidate_lock);
653c60b633a901 Dave Chinner            2015-02-23  256  	else if (lock_flags & XFS_MMAPLOCK_SHARED)
2433480a7e1d0c Jan Kara                2021-04-12  257  		up_read(&VFS_I(ip)->i_mapping->invalidate_lock);
653c60b633a901 Dave Chinner            2015-02-23  258  
fa96acadf1eb71 Dave Chinner            2012-10-08  259  	if (lock_flags & XFS_ILOCK_EXCL)
785dd131525060 Matthew Wilcox (Oracle  2024-02-19 @260) 		up_write(&ip->i_lock);
fa96acadf1eb71 Dave Chinner            2012-10-08  261  	else if (lock_flags & XFS_ILOCK_SHARED)
785dd131525060 Matthew Wilcox (Oracle  2024-02-19  262) 		up_read(&ip->i_lock);
fa96acadf1eb71 Dave Chinner            2012-10-08  263  
fa96acadf1eb71 Dave Chinner            2012-10-08  264  	trace_xfs_iunlock(ip, lock_flags, _RET_IP_);
fa96acadf1eb71 Dave Chinner            2012-10-08  265  }
fa96acadf1eb71 Dave Chinner            2012-10-08  266  

:::::: The code at line 156 was first introduced by commit
:::::: 2433480a7e1d0c057442b284c336cfaa61523117 xfs: Convert to use invalidate_lock

:::::: TO: Jan Kara <jack@suse.cz>
:::::: CC: Jan Kara <jack@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
