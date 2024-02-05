Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178FC10A13
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Feb 2024 06:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707112826; cv=none; b=bI//gRQtrnc4Jffpwdc7CgsvGb0C1U1fpDk+gNTvaluww8W/ekYB4GbJVW/IWvk4/ne/pEIJipMN+swFX3uvXta0VqZQs1aPu8bcU+HFP5qHextUZIQZ2OdYCxHJo5KEfOMZwnjOCRn3uVq95CEjwbelKWiTMKOftQpv1QAM/2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707112826; c=relaxed/simple;
	bh=/7xFaw3/Zb6J98Ip2iGXSKiDkJI4cW6NvatttrpeXLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=R+yY29DD5X75Q9btp6a8kU6PmlfviioSeSkZN4yOhuMPUf9iqUK+tfVDVNrIZ3DuqbO0DeWJDPyQwJmzdAw31uBmUw0S2Xf3IwgHdQhBLFlybqJXqPtB97Zp+OlUjycYyLIi7RIIoDKdB2jF30ushnS0FdldFKuzuQjia49Dahs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hP/BZh3O; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hP/BZh3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707112824; x=1738648824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/7xFaw3/Zb6J98Ip2iGXSKiDkJI4cW6NvatttrpeXLE=;
  b=hP/BZh3Ow1zLvPJzIiq+wLTuAmxkN4Q1jzwAyQn5eX9dgVrWoP8ZLeIr
   nGhcW2XjWhDgtrANIxWKol5SKyGV3fr5b9SCX+gClVq0HI+4qRmONBGUh
   U0tmjEj6CAB6nIaMSwDadxiMNnfdFVzoOTddXAzfyjwy477bieTySmcdK
   0zC8c6lXyuczHY0WEJnrLZgOffVkpCgToNeUy/lCGL9UiAdRUGQ3inH3r
   iULr9CKMbFacvhtbyBnzRuUP4oV1C/yNfk6aMn4bKo1+PPYENfUk+YRY/
   Wo0IQP1CWrhdAoPO0SKsj8a+b8hGu+rqONmejPnhiF+MO3ap3stZ0zUCs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="11193005"
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="11193005"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2024 22:00:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,242,1701158400"; 
   d="scan'208";a="5375221"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 04 Feb 2024 22:00:13 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWs1a-0000BE-22;
	Mon, 05 Feb 2024 06:00:10 +0000
Date: Mon, 5 Feb 2024 14:00:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>, NeilBrown <neilb@suse.de>
Subject: [brauner-vfs:vfs.file 7/48] fs/ceph/locks.c:276:54: error: implicit
 declaration of function 'lock_is_unlock'; did you mean 'lock_pin_lock'?
Message-ID: <202402051353.X9p1BSS2-lkp@intel.com>
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
config: arc-randconfig-002-20240204 (https://download.01.org/0day-ci/archive/20240205/202402051353.X9p1BSS2-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240205/202402051353.X9p1BSS2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402051353.X9p1BSS2-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/ceph/locks.c: In function 'ceph_lock':
>> fs/ceph/locks.c:276:54: error: implicit declaration of function 'lock_is_unlock'; did you mean 'lock_pin_lock'? [-Werror=implicit-function-declaration]
     276 |                 if (op == CEPH_MDS_OP_SETFILELOCK && lock_is_unlock(fl))
         |                                                      ^~~~~~~~~~~~~~
         |                                                      lock_pin_lock
>> fs/ceph/locks.c:281:13: error: implicit declaration of function 'lock_is_read'; did you mean 'lock_is_held'? [-Werror=implicit-function-declaration]
     281 |         if (lock_is_read(fl))
         |             ^~~~~~~~~~~~
         |             lock_is_held
>> fs/ceph/locks.c:283:18: error: implicit declaration of function 'lock_is_write'; did you mean 'op_is_write'? [-Werror=implicit-function-declaration]
     283 |         else if (lock_is_write(fl))
         |                  ^~~~~~~~~~~~~
         |                  op_is_write
   fs/ceph/locks.c: In function 'ceph_count_locks':
>> fs/ceph/locks.c:388:17: error: implicit declaration of function 'for_each_file_lock'; did you mean 'for_each_node_mask'? [-Werror=implicit-function-declaration]
     388 |                 for_each_file_lock(lock, &ctx->flc_posix)
         |                 ^~~~~~~~~~~~~~~~~~
         |                 for_each_node_mask
>> fs/ceph/locks.c:389:25: error: lvalue required as increment operand
     389 |                         ++(*fcntl_count);
         |                         ^~
   fs/ceph/locks.c:391:25: error: lvalue required as increment operand
     391 |                         ++(*flock_count);
         |                         ^~
   fs/ceph/locks.c: In function 'ceph_encode_locks_to_buffer':
>> fs/ceph/locks.c:456:50: error: expected ';' before '{' token
     456 |         for_each_file_lock(lock, &ctx->flc_posix) {
         |                                                  ^~
         |                                                  ;
   fs/ceph/locks.c:447:13: warning: unused variable 'l' [-Wunused-variable]
     447 |         int l = 0;
         |             ^
   fs/ceph/locks.c:446:13: warning: unused variable 'seen_flock' [-Wunused-variable]
     446 |         int seen_flock = 0;
         |             ^~~~~~~~~~
   fs/ceph/locks.c:445:13: warning: unused variable 'seen_fcntl' [-Wunused-variable]
     445 |         int seen_fcntl = 0;
         |             ^~~~~~~~~~
   fs/ceph/locks.c: At top level:
   fs/ceph/locks.c:401:12: warning: 'lock_to_ceph_filelock' defined but not used [-Wunused-function]
     401 | static int lock_to_ceph_filelock(struct inode *inode,
         |            ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +276 fs/ceph/locks.c

   241	
   242	/*
   243	 * Attempt to set an fcntl lock.
   244	 * For now, this just goes away to the server. Later it may be more awesome.
   245	 */
   246	int ceph_lock(struct file *file, int cmd, struct file_lock *fl)
   247	{
   248		struct inode *inode = file_inode(file);
   249		struct ceph_inode_info *ci = ceph_inode(inode);
   250		struct ceph_client *cl = ceph_inode_to_client(inode);
   251		int err = 0;
   252		u16 op = CEPH_MDS_OP_SETFILELOCK;
   253		u8 wait = 0;
   254		u8 lock_cmd;
   255	
   256		if (!(fl->fl_flags & FL_POSIX))
   257			return -ENOLCK;
   258	
   259		if (ceph_inode_is_shutdown(inode))
   260			return -ESTALE;
   261	
   262		doutc(cl, "fl_owner: %p\n", fl->fl_owner);
   263	
   264		/* set wait bit as appropriate, then make command as Ceph expects it*/
   265		if (IS_GETLK(cmd))
   266			op = CEPH_MDS_OP_GETFILELOCK;
   267		else if (IS_SETLKW(cmd))
   268			wait = 1;
   269	
   270		spin_lock(&ci->i_ceph_lock);
   271		if (ci->i_ceph_flags & CEPH_I_ERROR_FILELOCK) {
   272			err = -EIO;
   273		}
   274		spin_unlock(&ci->i_ceph_lock);
   275		if (err < 0) {
 > 276			if (op == CEPH_MDS_OP_SETFILELOCK && lock_is_unlock(fl))
   277				posix_lock_file(file, fl, NULL);
   278			return err;
   279		}
   280	
 > 281		if (lock_is_read(fl))
   282			lock_cmd = CEPH_LOCK_SHARED;
 > 283		else if (lock_is_write(fl))
   284			lock_cmd = CEPH_LOCK_EXCL;
   285		else
   286			lock_cmd = CEPH_LOCK_UNLOCK;
   287	
   288		if (op == CEPH_MDS_OP_SETFILELOCK && lock_is_unlock(fl)) {
   289			err = try_unlock_file(file, fl);
   290			if (err <= 0)
   291				return err;
   292		}
   293	
   294		err = ceph_lock_message(CEPH_LOCK_FCNTL, op, inode, lock_cmd, wait, fl);
   295		if (!err) {
   296			if (op == CEPH_MDS_OP_SETFILELOCK && F_UNLCK != fl->fl_type) {
   297				doutc(cl, "locking locally\n");
   298				err = posix_lock_file(file, fl, NULL);
   299				if (err) {
   300					/* undo! This should only happen if
   301					 * the kernel detects local
   302					 * deadlock. */
   303					ceph_lock_message(CEPH_LOCK_FCNTL, op, inode,
   304							  CEPH_LOCK_UNLOCK, 0, fl);
   305					doutc(cl, "got %d on posix_lock_file, undid lock\n",
   306					      err);
   307				}
   308			}
   309		}
   310		return err;
   311	}
   312	
   313	int ceph_flock(struct file *file, int cmd, struct file_lock *fl)
   314	{
   315		struct inode *inode = file_inode(file);
   316		struct ceph_inode_info *ci = ceph_inode(inode);
   317		struct ceph_client *cl = ceph_inode_to_client(inode);
   318		int err = 0;
   319		u8 wait = 0;
   320		u8 lock_cmd;
   321	
   322		if (!(fl->fl_flags & FL_FLOCK))
   323			return -ENOLCK;
   324	
   325		if (ceph_inode_is_shutdown(inode))
   326			return -ESTALE;
   327	
   328		doutc(cl, "fl_file: %p\n", fl->fl_file);
   329	
   330		spin_lock(&ci->i_ceph_lock);
   331		if (ci->i_ceph_flags & CEPH_I_ERROR_FILELOCK) {
   332			err = -EIO;
   333		}
   334		spin_unlock(&ci->i_ceph_lock);
   335		if (err < 0) {
   336			if (lock_is_unlock(fl))
   337				locks_lock_file_wait(file, fl);
   338			return err;
   339		}
   340	
   341		if (IS_SETLKW(cmd))
   342			wait = 1;
   343	
   344		if (lock_is_read(fl))
   345			lock_cmd = CEPH_LOCK_SHARED;
   346		else if (lock_is_write(fl))
   347			lock_cmd = CEPH_LOCK_EXCL;
   348		else
   349			lock_cmd = CEPH_LOCK_UNLOCK;
   350	
   351		if (lock_is_unlock(fl)) {
   352			err = try_unlock_file(file, fl);
   353			if (err <= 0)
   354				return err;
   355		}
   356	
   357		err = ceph_lock_message(CEPH_LOCK_FLOCK, CEPH_MDS_OP_SETFILELOCK,
   358					inode, lock_cmd, wait, fl);
   359		if (!err && F_UNLCK != fl->fl_type) {
   360			err = locks_lock_file_wait(file, fl);
   361			if (err) {
   362				ceph_lock_message(CEPH_LOCK_FLOCK,
   363						  CEPH_MDS_OP_SETFILELOCK,
   364						  inode, CEPH_LOCK_UNLOCK, 0, fl);
   365				doutc(cl, "got %d on locks_lock_file_wait, undid lock\n",
   366				      err);
   367			}
   368		}
   369		return err;
   370	}
   371	
   372	/*
   373	 * Fills in the passed counter variables, so you can prepare pagelist metadata
   374	 * before calling ceph_encode_locks.
   375	 */
   376	void ceph_count_locks(struct inode *inode, int *fcntl_count, int *flock_count)
   377	{
   378		struct ceph_client *cl = ceph_inode_to_client(inode);
   379		struct file_lock *lock;
   380		struct file_lock_context *ctx;
   381	
   382		*fcntl_count = 0;
   383		*flock_count = 0;
   384	
   385		ctx = locks_inode_context(inode);
   386		if (ctx) {
   387			spin_lock(&ctx->flc_lock);
 > 388			for_each_file_lock(lock, &ctx->flc_posix)
 > 389				++(*fcntl_count);
   390			for_each_file_lock(lock, &ctx->flc_flock)
   391				++(*flock_count);
   392			spin_unlock(&ctx->flc_lock);
   393		}
   394		doutc(cl, "counted %d flock locks and %d fcntl locks\n",
   395		      *flock_count, *fcntl_count);
   396	}
   397	
   398	/*
   399	 * Given a pointer to a lock, convert it to a ceph filelock
   400	 */
   401	static int lock_to_ceph_filelock(struct inode *inode,
   402					 struct file_lock *lock,
   403					 struct ceph_filelock *cephlock)
   404	{
   405		struct ceph_client *cl = ceph_inode_to_client(inode);
   406		int err = 0;
   407	
   408		cephlock->start = cpu_to_le64(lock->fl_start);
   409		cephlock->length = cpu_to_le64(lock->fl_end - lock->fl_start + 1);
   410		cephlock->client = cpu_to_le64(0);
   411		cephlock->pid = cpu_to_le64((u64)lock->fl_pid);
   412		cephlock->owner = cpu_to_le64(secure_addr(lock->fl_owner));
   413	
   414		switch (lock->fl_type) {
   415		case F_RDLCK:
   416			cephlock->type = CEPH_LOCK_SHARED;
   417			break;
   418		case F_WRLCK:
   419			cephlock->type = CEPH_LOCK_EXCL;
   420			break;
   421		case F_UNLCK:
   422			cephlock->type = CEPH_LOCK_UNLOCK;
   423			break;
   424		default:
   425			doutc(cl, "Have unknown lock type %d\n", lock->fl_type);
   426			err = -EINVAL;
   427		}
   428	
   429		return err;
   430	}
   431	
   432	/*
   433	 * Encode the flock and fcntl locks for the given inode into the ceph_filelock
   434	 * array. Must be called with inode->i_lock already held.
   435	 * If we encounter more of a specific lock type than expected, return -ENOSPC.
   436	 */
   437	int ceph_encode_locks_to_buffer(struct inode *inode,
   438					struct ceph_filelock *flocks,
   439					int num_fcntl_locks, int num_flock_locks)
   440	{
   441		struct file_lock *lock;
   442		struct file_lock_context *ctx = locks_inode_context(inode);
   443		struct ceph_client *cl = ceph_inode_to_client(inode);
   444		int err = 0;
   445		int seen_fcntl = 0;
   446		int seen_flock = 0;
   447		int l = 0;
   448	
   449		doutc(cl, "encoding %d flock and %d fcntl locks\n", num_flock_locks,
   450		      num_fcntl_locks);
   451	
   452		if (!ctx)
   453			return 0;
   454	
   455		spin_lock(&ctx->flc_lock);
 > 456		for_each_file_lock(lock, &ctx->flc_posix) {
   457			++seen_fcntl;
   458			if (seen_fcntl > num_fcntl_locks) {
   459				err = -ENOSPC;
   460				goto fail;
   461			}
   462			err = lock_to_ceph_filelock(inode, lock, &flocks[l]);
   463			if (err)
   464				goto fail;
   465			++l;
   466		}
   467		for_each_file_lock(lock, &ctx->flc_flock) {
   468			++seen_flock;
   469			if (seen_flock > num_flock_locks) {
   470				err = -ENOSPC;
   471				goto fail;
   472			}
   473			err = lock_to_ceph_filelock(inode, lock, &flocks[l]);
   474			if (err)
   475				goto fail;
   476			++l;
   477		}
   478	fail:
   479		spin_unlock(&ctx->flc_lock);
   480		return err;
   481	}
   482	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
