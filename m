Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C1B17493
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Feb 2024 06:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707029717; cv=none; b=GygwgMcenRSycAt+GfAGVS8DGPTAv4DcrK41q/t3qFvk3x9EH/iFMd0G30UQw/yoPz4ANGoHsOT9JBv6hKMxe9of+aB7ufGTGcZljaglqvZwPMOelPwSbLb58UbjDbatbFCfqqVrKgrb9vzxSTpaAWw3Okf2GwcxQYlkz5kvHYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707029717; c=relaxed/simple;
	bh=0brfFjqI00nD7+jKQ2hUiX53kudEThogOEz/Nv+0htg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JzmvUlDvxo0SyrujJgT/RFS/5kEIULZ7OMm2PxMx5oLk/BJ2bTGd/MQDfWHbKdnoww8FVrNrq7Ic9duy/UWVlz06I++Yxruan5N0GcDjtRvcsGMUJskpJWW7UgzC8VsqbrsiynWBDY7qATC414qBJeeQE0N+91DdGQ5LIjMEUmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESuNZFeZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESuNZFeZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707029715; x=1738565715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0brfFjqI00nD7+jKQ2hUiX53kudEThogOEz/Nv+0htg=;
  b=ESuNZFeZCSr/XzE2eFEJ1MjaIeZO1FW4QHFwj9XOu0mAm0qbTx5i2rJ9
   1JvbFmnTfoOV79olt7G0LMBzyeTlKP0/p//YZrW7sJ56baq+/1oXIE2MH
   Rz0AbtUm2MWKLq06BvJ12to2yTKcFBrvzcbit239oFCPFlm/jUAXVyo9n
   1whtQzjaPqOFdWsCqXHPbbcFILYRpeCEnRT4S1iyWPXUX1lzJwv+mGX8R
   hY2ThS5XITP7WINYhgPnTZTVUGDyGClcFnstMTCYA6qZ1omabYUjvRq6o
   AJlyGi0tBT0FJ5GCfISIVy3AVXCNBPz0PMvujjm5l3kdFrtvT/U8gNXyl
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="528904"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="528904"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 22:55:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="767610"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 03 Feb 2024 22:55:12 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWWPF-00065w-1W;
	Sun, 04 Feb 2024 06:55:09 +0000
Date: Sun, 4 Feb 2024 14:54:57 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>, NeilBrown <neilb@suse.de>
Subject: [brauner-vfs:vfs.file 7/48] fs/ceph/locks.c:447:13: warning: unused
 variable 'l'
Message-ID: <202402041412.6YvtlflL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.file
head:   1499e59af376949b062cdc039257f811f6c1697f
commit: 7c82f310391564a8ca1b8f996ddaa6204eb65253 [7/48] ceph: convert to using new filelock helpers
config: arc-randconfig-002-20240204 (https://download.01.org/0day-ci/archive/20240204/202402041412.6YvtlflL-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240204/202402041412.6YvtlflL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402041412.6YvtlflL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/ceph/locks.c: In function 'ceph_lock':
   fs/ceph/locks.c:276:54: error: implicit declaration of function 'lock_is_unlock'; did you mean 'lock_pin_lock'? [-Werror=implicit-function-declaration]
     276 |                 if (op == CEPH_MDS_OP_SETFILELOCK && lock_is_unlock(fl))
         |                                                      ^~~~~~~~~~~~~~
         |                                                      lock_pin_lock
   fs/ceph/locks.c:281:13: error: implicit declaration of function 'lock_is_read'; did you mean 'lock_is_held'? [-Werror=implicit-function-declaration]
     281 |         if (lock_is_read(fl))
         |             ^~~~~~~~~~~~
         |             lock_is_held
   fs/ceph/locks.c:283:18: error: implicit declaration of function 'lock_is_write'; did you mean 'op_is_write'? [-Werror=implicit-function-declaration]
     283 |         else if (lock_is_write(fl))
         |                  ^~~~~~~~~~~~~
         |                  op_is_write
   fs/ceph/locks.c: In function 'ceph_count_locks':
   fs/ceph/locks.c:388:17: error: implicit declaration of function 'for_each_file_lock'; did you mean 'for_each_node_mask'? [-Werror=implicit-function-declaration]
     388 |                 for_each_file_lock(lock, &ctx->flc_posix)
         |                 ^~~~~~~~~~~~~~~~~~
         |                 for_each_node_mask
   fs/ceph/locks.c:389:25: error: lvalue required as increment operand
     389 |                         ++(*fcntl_count);
         |                         ^~
   fs/ceph/locks.c:391:25: error: lvalue required as increment operand
     391 |                         ++(*flock_count);
         |                         ^~
   fs/ceph/locks.c: In function 'ceph_encode_locks_to_buffer':
   fs/ceph/locks.c:456:50: error: expected ';' before '{' token
     456 |         for_each_file_lock(lock, &ctx->flc_posix) {
         |                                                  ^~
         |                                                  ;
>> fs/ceph/locks.c:447:13: warning: unused variable 'l' [-Wunused-variable]
     447 |         int l = 0;
         |             ^
>> fs/ceph/locks.c:446:13: warning: unused variable 'seen_flock' [-Wunused-variable]
     446 |         int seen_flock = 0;
         |             ^~~~~~~~~~
>> fs/ceph/locks.c:445:13: warning: unused variable 'seen_fcntl' [-Wunused-variable]
     445 |         int seen_fcntl = 0;
         |             ^~~~~~~~~~
   fs/ceph/locks.c: At top level:
>> fs/ceph/locks.c:401:12: warning: 'lock_to_ceph_filelock' defined but not used [-Wunused-function]
     401 | static int lock_to_ceph_filelock(struct inode *inode,
         |            ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/l +447 fs/ceph/locks.c

40819f6fb227c1 Greg Farnum 2010-08-02  397  
c6db8472336379 Yan, Zheng  2017-09-11  398  /*
c6db8472336379 Yan, Zheng  2017-09-11  399   * Given a pointer to a lock, convert it to a ceph filelock
c6db8472336379 Yan, Zheng  2017-09-11  400   */
38d46409c4639a Xiubo Li    2023-06-12 @401  static int lock_to_ceph_filelock(struct inode *inode,
38d46409c4639a Xiubo Li    2023-06-12  402  				 struct file_lock *lock,
c6db8472336379 Yan, Zheng  2017-09-11  403  				 struct ceph_filelock *cephlock)
c6db8472336379 Yan, Zheng  2017-09-11  404  {
38d46409c4639a Xiubo Li    2023-06-12  405  	struct ceph_client *cl = ceph_inode_to_client(inode);
c6db8472336379 Yan, Zheng  2017-09-11  406  	int err = 0;
38d46409c4639a Xiubo Li    2023-06-12  407  
c6db8472336379 Yan, Zheng  2017-09-11  408  	cephlock->start = cpu_to_le64(lock->fl_start);
c6db8472336379 Yan, Zheng  2017-09-11  409  	cephlock->length = cpu_to_le64(lock->fl_end - lock->fl_start + 1);
c6db8472336379 Yan, Zheng  2017-09-11  410  	cephlock->client = cpu_to_le64(0);
c6db8472336379 Yan, Zheng  2017-09-11  411  	cephlock->pid = cpu_to_le64((u64)lock->fl_pid);
c6db8472336379 Yan, Zheng  2017-09-11  412  	cephlock->owner = cpu_to_le64(secure_addr(lock->fl_owner));
c6db8472336379 Yan, Zheng  2017-09-11  413  
c6db8472336379 Yan, Zheng  2017-09-11  414  	switch (lock->fl_type) {
c6db8472336379 Yan, Zheng  2017-09-11  415  	case F_RDLCK:
c6db8472336379 Yan, Zheng  2017-09-11  416  		cephlock->type = CEPH_LOCK_SHARED;
c6db8472336379 Yan, Zheng  2017-09-11  417  		break;
c6db8472336379 Yan, Zheng  2017-09-11  418  	case F_WRLCK:
c6db8472336379 Yan, Zheng  2017-09-11  419  		cephlock->type = CEPH_LOCK_EXCL;
c6db8472336379 Yan, Zheng  2017-09-11  420  		break;
c6db8472336379 Yan, Zheng  2017-09-11  421  	case F_UNLCK:
c6db8472336379 Yan, Zheng  2017-09-11  422  		cephlock->type = CEPH_LOCK_UNLOCK;
c6db8472336379 Yan, Zheng  2017-09-11  423  		break;
c6db8472336379 Yan, Zheng  2017-09-11  424  	default:
38d46409c4639a Xiubo Li    2023-06-12  425  		doutc(cl, "Have unknown lock type %d\n", lock->fl_type);
c6db8472336379 Yan, Zheng  2017-09-11  426  		err = -EINVAL;
c6db8472336379 Yan, Zheng  2017-09-11  427  	}
c6db8472336379 Yan, Zheng  2017-09-11  428  
c6db8472336379 Yan, Zheng  2017-09-11  429  	return err;
c6db8472336379 Yan, Zheng  2017-09-11  430  }
c6db8472336379 Yan, Zheng  2017-09-11  431  
06a1ad438b7b8d Jeff Layton 2020-09-29  432  /*
39be95e9c8c0b5 Jim Schutt  2013-05-15  433   * Encode the flock and fcntl locks for the given inode into the ceph_filelock
1c8c601a8c0dc5 Jeff Layton 2013-06-21  434   * array. Must be called with inode->i_lock already held.
39be95e9c8c0b5 Jim Schutt  2013-05-15  435   * If we encounter more of a specific lock type than expected, return -ENOSPC.
40819f6fb227c1 Greg Farnum 2010-08-02  436   */
39be95e9c8c0b5 Jim Schutt  2013-05-15  437  int ceph_encode_locks_to_buffer(struct inode *inode,
39be95e9c8c0b5 Jim Schutt  2013-05-15  438  				struct ceph_filelock *flocks,
40819f6fb227c1 Greg Farnum 2010-08-02  439  				int num_fcntl_locks, int num_flock_locks)
40819f6fb227c1 Greg Farnum 2010-08-02  440  {
40819f6fb227c1 Greg Farnum 2010-08-02  441  	struct file_lock *lock;
d4e78663f6bc83 Jeff Layton 2022-11-16  442  	struct file_lock_context *ctx = locks_inode_context(inode);
38d46409c4639a Xiubo Li    2023-06-12  443  	struct ceph_client *cl = ceph_inode_to_client(inode);
40819f6fb227c1 Greg Farnum 2010-08-02  444  	int err = 0;
fca4451acfdcf8 Greg Farnum 2010-09-17 @445  	int seen_fcntl = 0;
fca4451acfdcf8 Greg Farnum 2010-09-17 @446  	int seen_flock = 0;
39be95e9c8c0b5 Jim Schutt  2013-05-15 @447  	int l = 0;
40819f6fb227c1 Greg Farnum 2010-08-02  448  
38d46409c4639a Xiubo Li    2023-06-12  449  	doutc(cl, "encoding %d flock and %d fcntl locks\n", num_flock_locks,
40819f6fb227c1 Greg Farnum 2010-08-02  450  	      num_fcntl_locks);
39be95e9c8c0b5 Jim Schutt  2013-05-15  451  
bd61e0a9c852de Jeff Layton 2015-01-16  452  	if (!ctx)
bd61e0a9c852de Jeff Layton 2015-01-16  453  		return 0;
bd61e0a9c852de Jeff Layton 2015-01-16  454  
6109c85037e534 Jeff Layton 2015-01-16  455  	spin_lock(&ctx->flc_lock);
7c82f310391564 Jeff Layton 2024-01-31  456  	for_each_file_lock(lock, &ctx->flc_posix) {
fca4451acfdcf8 Greg Farnum 2010-09-17  457  		++seen_fcntl;
fca4451acfdcf8 Greg Farnum 2010-09-17  458  		if (seen_fcntl > num_fcntl_locks) {
fca4451acfdcf8 Greg Farnum 2010-09-17  459  			err = -ENOSPC;
fca4451acfdcf8 Greg Farnum 2010-09-17  460  			goto fail;
fca4451acfdcf8 Greg Farnum 2010-09-17  461  		}
38d46409c4639a Xiubo Li    2023-06-12  462  		err = lock_to_ceph_filelock(inode, lock, &flocks[l]);
40819f6fb227c1 Greg Farnum 2010-08-02  463  		if (err)
40819f6fb227c1 Greg Farnum 2010-08-02  464  			goto fail;
39be95e9c8c0b5 Jim Schutt  2013-05-15  465  		++l;
40819f6fb227c1 Greg Farnum 2010-08-02  466  	}
7c82f310391564 Jeff Layton 2024-01-31  467  	for_each_file_lock(lock, &ctx->flc_flock) {
fca4451acfdcf8 Greg Farnum 2010-09-17  468  		++seen_flock;
fca4451acfdcf8 Greg Farnum 2010-09-17  469  		if (seen_flock > num_flock_locks) {
fca4451acfdcf8 Greg Farnum 2010-09-17  470  			err = -ENOSPC;
fca4451acfdcf8 Greg Farnum 2010-09-17  471  			goto fail;
fca4451acfdcf8 Greg Farnum 2010-09-17  472  		}
38d46409c4639a Xiubo Li    2023-06-12  473  		err = lock_to_ceph_filelock(inode, lock, &flocks[l]);
40819f6fb227c1 Greg Farnum 2010-08-02  474  		if (err)
40819f6fb227c1 Greg Farnum 2010-08-02  475  			goto fail;
39be95e9c8c0b5 Jim Schutt  2013-05-15  476  		++l;
40819f6fb227c1 Greg Farnum 2010-08-02  477  	}
40819f6fb227c1 Greg Farnum 2010-08-02  478  fail:
6109c85037e534 Jeff Layton 2015-01-16  479  	spin_unlock(&ctx->flc_lock);
40819f6fb227c1 Greg Farnum 2010-08-02  480  	return err;
40819f6fb227c1 Greg Farnum 2010-08-02  481  }
40819f6fb227c1 Greg Farnum 2010-08-02  482  

:::::: The code at line 447 was first introduced by commit
:::::: 39be95e9c8c0b5668c9f8806ffe29bf9f4bc0f40 ceph: ceph_pagelist_append might sleep while atomic

:::::: TO: Jim Schutt <jaschut@sandia.gov>
:::::: CC: Alex Elder <elder@inktank.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
