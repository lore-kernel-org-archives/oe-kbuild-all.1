Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CE13125AE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jan 2024 06:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LcpDs7et"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704607626; x=1736143626;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D1MNZkNQ/fwXVFjTNheg5oxU/1LUa+t9VKYQy3RrWF4=;
  b=LcpDs7etfykv2Wk7wu3CrH4Z0nPFl5vpnnlzfh66RvLJkilx+7uZNgUq
   TkZA/rRt6r1+l6h1T8n8MiW+d6CqTiZqBhAGuYm7854tVhwr6E3D/sbiX
   abz3CvdizNjvBSVeis1FObAtM4JYhIMb5zdiCdiawsyzeWrK1LWzpkBkH
   rx22AKE/dqxhj1bHQLC9gPlSTIpkOb9Pf0FtVtp4Kxn8MMtMUx54x9dYT
   EqzWCMbQm9TA6/MeA5yMVSk07OkWHoPzefJhwTIdBwCV4Lr2ZxRYIV9vV
   5CGMP3f6BBXjxyzlSDqiwYnrQiIKmBT0offq3CuGnA9HtATJBO5L11Bb1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="4458186"
X-IronPort-AV: E=Sophos;i="6.04,338,1695711600"; 
   d="scan'208";a="4458186"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2024 22:07:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10945"; a="730824370"
X-IronPort-AV: E=Sophos;i="6.04,338,1695711600"; 
   d="scan'208";a="730824370"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 06 Jan 2024 22:07:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMMJI-0003Sm-1w;
	Sun, 07 Jan 2024 06:07:00 +0000
Date: Sun, 7 Jan 2024 14:06:43 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:filelock-6.9 8/11] fs/smb/client/file.c:1313:46: error:
 'struct file_lock' has no member named 'fl_flags'
Message-ID: <202401071416.BHlKxcVO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git filelock-6.9
head:   fbf183d9e9c1309edc5fca747309c7c595c12090
commit: 586ee3906f3c1613803f09e75c9459424992edce [8/11] filelock: move fl_flags into fl_core
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20240107/202401071416.BHlKxcVO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240107/202401071416.BHlKxcVO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401071416.BHlKxcVO-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/smb/client/file.c: In function 'cifs_lock_test':
>> fs/smb/client/file.c:1313:46: error: 'struct file_lock' has no member named 'fl_flags'
    1313 |                                         flock->fl_flags, &conf_lock,
         |                                              ^~
   fs/smb/client/file.c: In function 'cifs_posix_lock_test':
   fs/smb/client/file.c:1404:19: error: 'struct file_lock' has no member named 'fl_flags'
    1404 |         if ((flock->fl_flags & FL_POSIX) == 0)
         |                   ^~
   fs/smb/client/file.c: In function 'cifs_posix_lock_set':
   fs/smb/client/file.c:1432:19: error: 'struct file_lock' has no member named 'fl_flags'
    1432 |         if ((flock->fl_flags & FL_POSIX) == 0)
         |                   ^~
   fs/smb/client/file.c: In function 'cifs_read_flock':
   fs/smb/client/file.c:1664:18: error: 'struct file_lock' has no member named 'fl_flags'
    1664 |         if (flock->fl_flags & FL_POSIX)
         |                  ^~
   fs/smb/client/file.c:1666:18: error: 'struct file_lock' has no member named 'fl_flags'
    1666 |         if (flock->fl_flags & FL_FLOCK)
         |                  ^~
   fs/smb/client/file.c:1668:18: error: 'struct file_lock' has no member named 'fl_flags'
    1668 |         if (flock->fl_flags & FL_SLEEP) {
         |                  ^~
   fs/smb/client/file.c:1672:18: error: 'struct file_lock' has no member named 'fl_flags'
    1672 |         if (flock->fl_flags & FL_ACCESS)
         |                  ^~
   fs/smb/client/file.c:1674:18: error: 'struct file_lock' has no member named 'fl_flags'
    1674 |         if (flock->fl_flags & FL_LEASE)
         |                  ^~
   fs/smb/client/file.c:1676:18: error: 'struct file_lock' has no member named 'fl_flags'
    1676 |         if (flock->fl_flags &
         |                  ^~
   In file included from include/linux/kernel.h:31,
                    from arch/x86/include/asm/percpu.h:27,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from fs/smb/client/file.c:11:
   fs/smb/client/file.c:1679:65: error: 'struct file_lock' has no member named 'fl_flags'
    1679 |                 cifs_dbg(FYI, "Unknown lock flags 0x%x\n", flock->fl_flags);
         |                                                                 ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/linux/printk.h:634:9: note: in expansion of macro 'no_printk'
     634 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   fs/smb/client/cifs_debug.h:65:17: note: in expansion of macro 'pr_debug_once'
      65 |                 pr_debug_ ## ratefunc("%s: " fmt,                       \
         |                 ^~~~~~~~~
   fs/smb/client/cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:1679:17: note: in expansion of macro 'cifs_dbg'
    1679 |                 cifs_dbg(FYI, "Unknown lock flags 0x%x\n", flock->fl_flags);
         |                 ^~~~~~~~
   fs/smb/client/file.c:1679:65: error: 'struct file_lock' has no member named 'fl_flags'
    1679 |                 cifs_dbg(FYI, "Unknown lock flags 0x%x\n", flock->fl_flags);
         |                                                                 ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/once_lite.h:31:25: note: in expansion of macro 'printk'
      31 |                         func(__VA_ARGS__);                              \
         |                         ^~~~
   include/linux/once_lite.h:11:9: note: in expansion of macro 'DO_ONCE_LITE_IF'
      11 |         DO_ONCE_LITE_IF(true, func, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~~~~
   include/linux/printk.h:594:9: note: in expansion of macro 'DO_ONCE_LITE'
     594 |         DO_ONCE_LITE(printk, fmt, ##__VA_ARGS__)
         |         ^~~~~~~~~~~~
   include/linux/printk.h:611:9: note: in expansion of macro 'printk_once'
     611 |         printk_once(KERN_ERR pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~~~
   fs/smb/client/cifs_debug.h:68:17: note: in expansion of macro 'pr_err_once'
      68 |                 pr_err_ ## ratefunc("VFS: " fmt, ##__VA_ARGS__);        \
         |                 ^~~~~~~
   fs/smb/client/cifs_debug.h:77:17: note: in expansion of macro 'cifs_dbg_func'
      77 |                 cifs_dbg_func(once, type, fmt, ##__VA_ARGS__);          \
         |                 ^~~~~~~~~~~~~
   fs/smb/client/file.c:1679:17: note: in expansion of macro 'cifs_dbg'
    1679 |                 cifs_dbg(FYI, "Unknown lock flags 0x%x\n", flock->fl_flags);
         |                 ^~~~~~~~
   fs/smb/client/file.c:1679:65: error: 'struct file_lock' has no member named 'fl_flags'
    1679 |                 cifs_dbg(FYI, "Unknown lock flags 0x%x\n", flock->fl_flags);
         |                                                                 ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:129:17: note: in expansion of macro 'printk'
     129 |                 printk(fmt, ##__VA_ARGS__);             \
         |                 ^~~~~~
   include/linux/printk.h:634:9: note: in expansion of macro 'no_printk'
     634 |         no_printk(KERN_DEBUG pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~~~~
   fs/smb/client/cifs_debug.h:70:17: note: in expansion of macro 'pr_debug_once'
      70 |                 pr_debug_ ## ratefunc(fmt, ##__VA_ARGS__);              \
--
   fs/smb/client/smb2file.c: In function 'smb2_unlock_range':
>> fs/smb/client/smb2file.c:231:36: error: 'struct file_lock' has no member named 'fl_flags'
     231 |                         if (!(flock->fl_flags & (FL_FLOCK | FL_OFDLCK)))
         |                                    ^~
--
   fs/fuse/file.c: In function 'fuse_setlk':
>> fs/fuse/file.c:2572:25: error: 'struct file_lock' has no member named 'fl_flags'
    2572 |         int opcode = (fl->fl_flags & FL_SLEEP) ? FUSE_SETLKW : FUSE_SETLK;
         |                         ^~
   fs/fuse/file.c:2583:16: error: 'struct file_lock' has no member named 'fl_flags'
    2583 |         if ((fl->fl_flags & FL_CLOSE_POSIX) == FL_CLOSE_POSIX)
         |                ^~
--
   fs/ocfs2/locks.c: In function 'ocfs2_do_flock':
>> fs/ocfs2/locks.c:57:24: error: 'struct file_lock' has no member named 'fl_flags'
      57 |                 request.fl_flags = FL_FLOCK;
         |                        ^
   fs/ocfs2/locks.c: In function 'ocfs2_flock':
   fs/ocfs2/locks.c:103:17: error: 'struct file_lock' has no member named 'fl_flags'
     103 |         if (!(fl->fl_flags & FL_FLOCK))
         |                 ^~
   fs/ocfs2/locks.c: In function 'ocfs2_lock':
   fs/ocfs2/locks.c:121:17: error: 'struct file_lock' has no member named 'fl_flags'
     121 |         if (!(fl->fl_flags & FL_POSIX))
         |                 ^~


vim +1313 fs/smb/client/file.c

161ebf9fcca967 fs/cifs/file.c Pavel Shilovsky 2011-10-29  1292  
9a5101c8968c7b fs/cifs/file.c Pavel Shilovsky 2011-11-07  1293  /*
9a5101c8968c7b fs/cifs/file.c Pavel Shilovsky 2011-11-07  1294   * Check if there is another lock that prevents us to set the lock (mandatory
9a5101c8968c7b fs/cifs/file.c Pavel Shilovsky 2011-11-07  1295   * style). If such a lock exists, update the flock structure with its
9a5101c8968c7b fs/cifs/file.c Pavel Shilovsky 2011-11-07  1296   * properties. Otherwise, set the flock type to F_UNLCK if we can cache brlocks
9a5101c8968c7b fs/cifs/file.c Pavel Shilovsky 2011-11-07  1297   * or leave it the same if we can't. Returns 0 if we don't need to request to
9a5101c8968c7b fs/cifs/file.c Pavel Shilovsky 2011-11-07  1298   * the server or 1 otherwise.
9a5101c8968c7b fs/cifs/file.c Pavel Shilovsky 2011-11-07  1299   */
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1300  static int
fbd35acadd728e fs/cifs/file.c Pavel Shilovsky 2012-02-24  1301  cifs_lock_test(struct cifsFileInfo *cfile, __u64 offset, __u64 length,
fbd35acadd728e fs/cifs/file.c Pavel Shilovsky 2012-02-24  1302  	       __u8 type, struct file_lock *flock)
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1303  {
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1304  	int rc = 0;
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1305  	struct cifsLockInfo *conf_lock;
2b0143b5c986be fs/cifs/file.c David Howells   2015-03-17  1306  	struct cifsInodeInfo *cinode = CIFS_I(d_inode(cfile->dentry));
106dc538abac88 fs/cifs/file.c Pavel Shilovsky 2012-02-28  1307  	struct TCP_Server_Info *server = tlink_tcon(cfile->tlink)->ses->server;
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1308  	bool exist;
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1309  
1b4b55a1d9404f fs/cifs/file.c Pavel Shilovsky 2012-09-19  1310  	down_read(&cinode->lock_sem);
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1311  
55157dfbb566e2 fs/cifs/file.c Pavel Shilovsky 2012-02-28  1312  	exist = cifs_find_lock_conflict(cfile, offset, length, type,
9645759ce6b390 fs/cifs/file.c Ronnie Sahlberg 2018-10-04 @1313  					flock->fl_flags, &conf_lock,
9645759ce6b390 fs/cifs/file.c Ronnie Sahlberg 2018-10-04  1314  					CIFS_LOCK_OP);
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1315  	if (exist) {
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1316  		flock->fl_start = conf_lock->offset;
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1317  		flock->fl_end = conf_lock->offset + conf_lock->length - 1;
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1318  		flock->fl_pid = conf_lock->pid;
106dc538abac88 fs/cifs/file.c Pavel Shilovsky 2012-02-28  1319  		if (conf_lock->type & server->vals->shared_lock_type)
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1320  			flock->fl_type = F_RDLCK;
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1321  		else
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1322  			flock->fl_type = F_WRLCK;
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1323  	} else if (!cinode->can_cache_brlcks)
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1324  		rc = 1;
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1325  	else
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1326  		flock->fl_type = F_UNLCK;
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1327  
1b4b55a1d9404f fs/cifs/file.c Pavel Shilovsky 2012-09-19  1328  	up_read(&cinode->lock_sem);
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1329  	return rc;
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1330  }
85160e03a79e0d fs/cifs/file.c Pavel Shilovsky 2011-10-22  1331  

:::::: The code at line 1313 was first introduced by commit
:::::: 9645759ce6b39013231f4fa312834935c93fe5bc cifs: OFD locks do not conflict with eachothers

:::::: TO: Ronnie Sahlberg <lsahlber@redhat.com>
:::::: CC: Steve French <stfrench@microsoft.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
