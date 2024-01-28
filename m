Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10DB10F4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Jan 2024 01:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706404753; cv=none; b=Ng5NwOC8UihprTH3SGITeYXO3hBRCKccR1brrERVSgYoLWXlsT6C9AQxVkwq9euIb3OaT+qqH4QuoUui5Qc1bMSW9HA2HovI04YlM8YKBGg7QEfLFNdr4Ybt1fpRAmH/ShBc21ekdF0rSkn/aTT7xTAI73FHk81uRCeuzrpsr7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706404753; c=relaxed/simple;
	bh=USXRTPvgnC2kp7k0vP1d0AcN9hqEiO9oNBtG2fcj+Q4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ozeqwYpDT5/yncw/Gy+pxzGnnaB8n6/2/3IWmFAm+qYkjROdQlP5krXw7i7SY9+hULXbIwpDwXZzXLHOheWbBVPn6WFetYX54d1XAY99HJWfALRiOhZmNhsDtcrccadowA/tK//wbWoypDxqvnZbYwlqP5bTtAFv+5cG6EfObig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lMq3KJdq; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lMq3KJdq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706404751; x=1737940751;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=USXRTPvgnC2kp7k0vP1d0AcN9hqEiO9oNBtG2fcj+Q4=;
  b=lMq3KJdqa2w6qi6jockWD5lpj+0jXi+m5RyUcIXJ67EJHbu4ju4yj91A
   thsylOSUh27I/Isc14AM21bR4uD0uzaX/GxqQtS8emPYUFculrNIbKTYd
   mCXN44z2IxlHDDMj82C+dKl7tsAFXA+5YDgzBTCOpOQnCyju7XUVq3LCV
   RMfJ6Ve5AeUasVHgwfWTNUPSWGHxcrQ0i5lN7nIs1m5Xdw36jKOsmoU5s
   yDYh7ZKAFVBeqrcHVGHiGWKWcOFA2E+d8gXsn+B+kyt6e0xWL/nRF6xyj
   XK553qLOgY58GZkUS0A8kmTvdQ50wgfuG/pbXaqdGZBQyJI/nH/cgiqsv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="401595120"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="401595120"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 17:19:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10966"; a="930730711"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="930730711"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 27 Jan 2024 17:19:09 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTtpD-0002wM-0M;
	Sun, 28 Jan 2024 01:19:07 +0000
Date: Sun, 28 Jan 2024 09:18:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:kdevops 11/42] fs/fuse/file.c:2512:7: error: 'struct
 file_lock' has no member named 'fl_pid'; did you mean 'fl_end'?
Message-ID: <202401280917.L8op897x-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git kdevops
head:   c5d95cb3372545ee787fd317010a6213b2ba740c
commit: 28c6b852f23ef8478f37a63df89778175e127b89 [11/42] filelock: split common fields into struct file_lock_core
config: i386-randconfig-011-20240128 (https://download.01.org/0day-ci/archive/20240128/202401280917.L8op897x-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240128/202401280917.L8op897x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401280917.L8op897x-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/fuse/file.c: In function 'convert_fuse_file_lock':
>> fs/fuse/file.c:2512:7: error: 'struct file_lock' has no member named 'fl_pid'; did you mean 'fl_end'?
    2512 |   fl->fl_pid = pid_nr_ns(find_pid_ns(ffl->pid, fc->pid_ns), &init_pid_ns);
         |       ^~~~~~
         |       fl_end
>> fs/fuse/file.c:2519:4: error: 'struct file_lock' has no member named 'fl_type'
    2519 |  fl->fl_type = ffl->type;
         |    ^~
   fs/fuse/file.c: In function 'fuse_lk_fill':
>> fs/fuse/file.c:2533:42: error: 'const struct file_lock' has no member named 'fl_owner'
    2533 |  inarg->owner = fuse_lock_owner_id(fc, fl->fl_owner);
         |                                          ^~
>> fs/fuse/file.c:2536:21: error: 'const struct file_lock' has no member named 'fl_type'
    2536 |  inarg->lk.type = fl->fl_type;
         |                     ^~
   fs/fuse/file.c: In function 'fuse_setlk':
>> fs/fuse/file.c:2573:18: error: 'struct file_lock' has no member named 'fl_flags'
    2573 |  int opcode = (fl->fl_flags & FL_SLEEP) ? FUSE_SETLKW : FUSE_SETLK;
         |                  ^~
   fs/fuse/file.c:2574:22: error: 'struct file_lock' has no member named 'fl_type'
    2574 |  struct pid *pid = fl->fl_type != F_UNLCK ? task_tgid(current) : NULL;
         |                      ^~
   fs/fuse/file.c:2584:9: error: 'struct file_lock' has no member named 'fl_flags'
    2584 |  if ((fl->fl_flags & FL_CLOSE_POSIX) == FL_CLOSE_POSIX)
         |         ^~


vim +2512 fs/fuse/file.c

55752a3aba1387 Miklos Szeredi      2019-01-24  2489  
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2490  static int convert_fuse_file_lock(struct fuse_conn *fc,
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2491  				  const struct fuse_file_lock *ffl,
7142125937e148 Miklos Szeredi      2006-06-25  2492  				  struct file_lock *fl)
7142125937e148 Miklos Szeredi      2006-06-25  2493  {
7142125937e148 Miklos Szeredi      2006-06-25  2494  	switch (ffl->type) {
7142125937e148 Miklos Szeredi      2006-06-25  2495  	case F_UNLCK:
7142125937e148 Miklos Szeredi      2006-06-25  2496  		break;
7142125937e148 Miklos Szeredi      2006-06-25  2497  
7142125937e148 Miklos Szeredi      2006-06-25  2498  	case F_RDLCK:
7142125937e148 Miklos Szeredi      2006-06-25  2499  	case F_WRLCK:
7142125937e148 Miklos Szeredi      2006-06-25  2500  		if (ffl->start > OFFSET_MAX || ffl->end > OFFSET_MAX ||
7142125937e148 Miklos Szeredi      2006-06-25  2501  		    ffl->end < ffl->start)
7142125937e148 Miklos Szeredi      2006-06-25  2502  			return -EIO;
7142125937e148 Miklos Szeredi      2006-06-25  2503  
7142125937e148 Miklos Szeredi      2006-06-25  2504  		fl->fl_start = ffl->start;
7142125937e148 Miklos Szeredi      2006-06-25  2505  		fl->fl_end = ffl->end;
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2506  
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2507  		/*
9d5b86ac13c573 Benjamin Coddington 2017-07-16  2508  		 * Convert pid into init's pid namespace.  The locks API will
9d5b86ac13c573 Benjamin Coddington 2017-07-16  2509  		 * translate it into the caller's pid namespace.
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2510  		 */
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2511  		rcu_read_lock();
9d5b86ac13c573 Benjamin Coddington 2017-07-16 @2512  		fl->fl_pid = pid_nr_ns(find_pid_ns(ffl->pid, fc->pid_ns), &init_pid_ns);
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2513  		rcu_read_unlock();
7142125937e148 Miklos Szeredi      2006-06-25  2514  		break;
7142125937e148 Miklos Szeredi      2006-06-25  2515  
7142125937e148 Miklos Szeredi      2006-06-25  2516  	default:
7142125937e148 Miklos Szeredi      2006-06-25  2517  		return -EIO;
7142125937e148 Miklos Szeredi      2006-06-25  2518  	}
7142125937e148 Miklos Szeredi      2006-06-25 @2519  	fl->fl_type = ffl->type;
7142125937e148 Miklos Szeredi      2006-06-25  2520  	return 0;
7142125937e148 Miklos Szeredi      2006-06-25  2521  }
7142125937e148 Miklos Szeredi      2006-06-25  2522  
7078187a795f86 Miklos Szeredi      2014-12-12  2523  static void fuse_lk_fill(struct fuse_args *args, struct file *file,
a9ff4f87056cd3 Miklos Szeredi      2007-10-18  2524  			 const struct file_lock *fl, int opcode, pid_t pid,
7078187a795f86 Miklos Szeredi      2014-12-12  2525  			 int flock, struct fuse_lk_in *inarg)
7142125937e148 Miklos Szeredi      2006-06-25  2526  {
6131ffaa1f0914 Al Viro             2013-02-27  2527  	struct inode *inode = file_inode(file);
9c8ef5614da226 Miklos Szeredi      2006-06-25  2528  	struct fuse_conn *fc = get_fuse_conn(inode);
7142125937e148 Miklos Szeredi      2006-06-25  2529  	struct fuse_file *ff = file->private_data;
7078187a795f86 Miklos Szeredi      2014-12-12  2530  
7078187a795f86 Miklos Szeredi      2014-12-12  2531  	memset(inarg, 0, sizeof(*inarg));
7078187a795f86 Miklos Szeredi      2014-12-12  2532  	inarg->fh = ff->fh;
7078187a795f86 Miklos Szeredi      2014-12-12 @2533  	inarg->owner = fuse_lock_owner_id(fc, fl->fl_owner);
7078187a795f86 Miklos Szeredi      2014-12-12  2534  	inarg->lk.start = fl->fl_start;
7078187a795f86 Miklos Szeredi      2014-12-12  2535  	inarg->lk.end = fl->fl_end;
7078187a795f86 Miklos Szeredi      2014-12-12 @2536  	inarg->lk.type = fl->fl_type;
7078187a795f86 Miklos Szeredi      2014-12-12  2537  	inarg->lk.pid = pid;
a9ff4f87056cd3 Miklos Szeredi      2007-10-18  2538  	if (flock)
7078187a795f86 Miklos Szeredi      2014-12-12  2539  		inarg->lk_flags |= FUSE_LK_FLOCK;
d5b4854357f478 Miklos Szeredi      2019-09-10  2540  	args->opcode = opcode;
d5b4854357f478 Miklos Szeredi      2019-09-10  2541  	args->nodeid = get_node_id(inode);
d5b4854357f478 Miklos Szeredi      2019-09-10  2542  	args->in_numargs = 1;
d5b4854357f478 Miklos Szeredi      2019-09-10  2543  	args->in_args[0].size = sizeof(*inarg);
d5b4854357f478 Miklos Szeredi      2019-09-10  2544  	args->in_args[0].value = inarg;
7142125937e148 Miklos Szeredi      2006-06-25  2545  }
7142125937e148 Miklos Szeredi      2006-06-25  2546  
7142125937e148 Miklos Szeredi      2006-06-25  2547  static int fuse_getlk(struct file *file, struct file_lock *fl)
7142125937e148 Miklos Szeredi      2006-06-25  2548  {
6131ffaa1f0914 Al Viro             2013-02-27  2549  	struct inode *inode = file_inode(file);
fcee216beb9c15 Max Reitz           2020-05-06  2550  	struct fuse_mount *fm = get_fuse_mount(inode);
7078187a795f86 Miklos Szeredi      2014-12-12  2551  	FUSE_ARGS(args);
7078187a795f86 Miklos Szeredi      2014-12-12  2552  	struct fuse_lk_in inarg;
7142125937e148 Miklos Szeredi      2006-06-25  2553  	struct fuse_lk_out outarg;
7142125937e148 Miklos Szeredi      2006-06-25  2554  	int err;
7142125937e148 Miklos Szeredi      2006-06-25  2555  
7078187a795f86 Miklos Szeredi      2014-12-12  2556  	fuse_lk_fill(&args, file, fl, FUSE_GETLK, 0, 0, &inarg);
d5b4854357f478 Miklos Szeredi      2019-09-10  2557  	args.out_numargs = 1;
d5b4854357f478 Miklos Szeredi      2019-09-10  2558  	args.out_args[0].size = sizeof(outarg);
d5b4854357f478 Miklos Szeredi      2019-09-10  2559  	args.out_args[0].value = &outarg;
fcee216beb9c15 Max Reitz           2020-05-06  2560  	err = fuse_simple_request(fm, &args);
7142125937e148 Miklos Szeredi      2006-06-25  2561  	if (!err)
fcee216beb9c15 Max Reitz           2020-05-06  2562  		err = convert_fuse_file_lock(fm->fc, &outarg.lk, fl);
7142125937e148 Miklos Szeredi      2006-06-25  2563  
7142125937e148 Miklos Szeredi      2006-06-25  2564  	return err;
7142125937e148 Miklos Szeredi      2006-06-25  2565  }
7142125937e148 Miklos Szeredi      2006-06-25  2566  
a9ff4f87056cd3 Miklos Szeredi      2007-10-18  2567  static int fuse_setlk(struct file *file, struct file_lock *fl, int flock)
7142125937e148 Miklos Szeredi      2006-06-25  2568  {
6131ffaa1f0914 Al Viro             2013-02-27  2569  	struct inode *inode = file_inode(file);
fcee216beb9c15 Max Reitz           2020-05-06  2570  	struct fuse_mount *fm = get_fuse_mount(inode);
7078187a795f86 Miklos Szeredi      2014-12-12  2571  	FUSE_ARGS(args);
7078187a795f86 Miklos Szeredi      2014-12-12  2572  	struct fuse_lk_in inarg;
7142125937e148 Miklos Szeredi      2006-06-25 @2573  	int opcode = (fl->fl_flags & FL_SLEEP) ? FUSE_SETLKW : FUSE_SETLK;
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2574  	struct pid *pid = fl->fl_type != F_UNLCK ? task_tgid(current) : NULL;
fcee216beb9c15 Max Reitz           2020-05-06  2575  	pid_t pid_nr = pid_nr_ns(pid, fm->fc->pid_ns);
7142125937e148 Miklos Szeredi      2006-06-25  2576  	int err;
7142125937e148 Miklos Szeredi      2006-06-25  2577  
8fb47a4fbf858a J. Bruce Fields     2011-07-20  2578  	if (fl->fl_lmops && fl->fl_lmops->lm_grant) {
48e90761b570ff Miklos Szeredi      2008-07-25  2579  		/* NLM needs asynchronous locks, which we don't support yet */
48e90761b570ff Miklos Szeredi      2008-07-25  2580  		return -ENOLCK;
48e90761b570ff Miklos Szeredi      2008-07-25  2581  	}
48e90761b570ff Miklos Szeredi      2008-07-25  2582  
7142125937e148 Miklos Szeredi      2006-06-25  2583  	/* Unlock on close is handled by the flush method */
50f2112cf7a3e6 Benjamin Coddington 2017-04-11  2584  	if ((fl->fl_flags & FL_CLOSE_POSIX) == FL_CLOSE_POSIX)
7142125937e148 Miklos Szeredi      2006-06-25  2585  		return 0;
7142125937e148 Miklos Szeredi      2006-06-25  2586  
0b6e9ea041e6c9 Seth Forshee        2014-07-02  2587  	fuse_lk_fill(&args, file, fl, opcode, pid_nr, flock, &inarg);
fcee216beb9c15 Max Reitz           2020-05-06  2588  	err = fuse_simple_request(fm, &args);
7142125937e148 Miklos Szeredi      2006-06-25  2589  
a4d27e75ffb7b8 Miklos Szeredi      2006-06-25  2590  	/* locking is restartable */
a4d27e75ffb7b8 Miklos Szeredi      2006-06-25  2591  	if (err == -EINTR)
a4d27e75ffb7b8 Miklos Szeredi      2006-06-25  2592  		err = -ERESTARTSYS;
7078187a795f86 Miklos Szeredi      2014-12-12  2593  
7142125937e148 Miklos Szeredi      2006-06-25  2594  	return err;
7142125937e148 Miklos Szeredi      2006-06-25  2595  }
7142125937e148 Miklos Szeredi      2006-06-25  2596  

:::::: The code at line 2512 was first introduced by commit
:::::: 9d5b86ac13c573795525ecac6ed2db39ab23e2a8 fs/locks: Remove fl_nspid and use fs-specific l_pid for remote locks

:::::: TO: Benjamin Coddington <bcodding@redhat.com>
:::::: CC: Jeff Layton <jlayton@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
