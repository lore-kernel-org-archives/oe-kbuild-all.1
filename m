Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 748061CA9F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 07:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sj12YX1h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704439162; x=1735975162;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TkTVdNa3HbU8WkjJEUviTxHO9l3HKHQCZ0WbP8391jY=;
  b=Sj12YX1hEtSLVQCn68r5jZII3T+plNzC0dDwYZotyZSMsevLLYtLe0RD
   O+/fe3CxYr1GgYU15kuksVrGawrX8KDq+NVJBqsEwJnLLjWGqw5eMGzyY
   7BOl4nl+wsyCqXEYXAxUh2d+MipE1O9z7C0H8fsaAr3Xk9P2P475sklGr
   OBm52pxbP7+CDcff2TWHcmQpZS2wXp/yKcqvHdFrgqV/2MNX9XvevI74R
   iM0yJV4QQosLoMCPGIXozFrNTZrJxjy+CHtRyegDKB1/bLOzwBXXPL9+X
   jOD46fFbzR4/qLeC7M61IfBDvnLAQtRv7MzxK5kZGCkRwNes2DH1jGW/T
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="400210707"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="400210707"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 23:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="29053402"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Jan 2024 23:19:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLeU8-0000vU-2J;
	Fri, 05 Jan 2024 07:19:16 +0000
Date: Fri, 5 Jan 2024 15:18:15 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:leases 8/8] fs/nfs/nfs4proc.c:7020:15: error: 'struct
 file_lock' has no member named 'fl_flags'
Message-ID: <202401051558.BnXx4qmm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jeff,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git leases
head:   bfa9c95ea16416c581e8940d6d36de21aca94011
commit: bfa9c95ea16416c581e8940d6d36de21aca94011 [8/8] filelock: move fl_flags into fl_core
config: x86_64-randconfig-123-20240105 (https://download.01.org/0day-ci/archive/20240105/202401051558.BnXx4qmm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401051558.BnXx4qmm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051558.BnXx4qmm-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/nfs/nfs4proc.c: In function 'nfs4_do_unlck':
>> fs/nfs/nfs4proc.c:7020:15: error: 'struct file_lock' has no member named 'fl_flags'
    7020 |         if (fl->fl_flags & FL_CLOSE)
         |               ^~
   fs/nfs/nfs4proc.c: In function 'nfs4_proc_unlck':
   fs/nfs/nfs4proc.c:7046:41: error: 'struct file_lock' has no member named 'fl_flags'
    7046 |         unsigned char fl_flags = request->fl_flags;
         |                                         ^~
   fs/nfs/nfs4proc.c:7050:16: error: 'struct file_lock' has no member named 'fl_flags'
    7050 |         request->fl_flags |= FL_EXISTS;
         |                ^~
   fs/nfs/nfs4proc.c:7081:16: error: 'struct file_lock' has no member named 'fl_flags'
    7081 |         request->fl_flags = fl_flags;
         |                ^~
   fs/nfs/nfs4proc.c: In function 'nfs4_lock_done':
   fs/nfs/nfs4proc.c:7192:33: error: 'struct file_lock' has no member named 'fl_flags'
    7192 |                         data->fl.fl_flags &= ~(FL_SLEEP | FL_ACCESS);
         |                                 ^
   fs/nfs/nfs4proc.c: In function '_nfs4_proc_setlk':
   fs/nfs/nfs4proc.c:7399:41: error: 'struct file_lock' has no member named 'fl_flags'
    7399 |         unsigned char fl_flags = request->fl_flags;
         |                                         ^~
   fs/nfs/nfs4proc.c:7402:16: error: 'struct file_lock' has no member named 'fl_flags'
    7402 |         request->fl_flags |= FL_ACCESS;
         |                ^~
   fs/nfs/nfs4proc.c:7411:24: error: 'struct file_lock' has no member named 'fl_flags'
    7411 |                 request->fl_flags = fl_flags & ~FL_SLEEP;
         |                        ^~
   fs/nfs/nfs4proc.c:7421:16: error: 'struct file_lock' has no member named 'fl_flags'
    7421 |         request->fl_flags = fl_flags;
         |                ^~
   fs/nfs/nfs4proc.c: In function 'nfs4_proc_lock':
   fs/nfs/nfs4proc.c:7572:21: error: 'struct file_lock' has no member named 'fl_flags'
    7572 |         if ((request->fl_flags & FL_POSIX) &&
         |                     ^~
--
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


vim +7020 fs/nfs/nfs4proc.c

963d8fe5333912 Trond Myklebust       2006-01-03  6991  
a5d16a4d090bd2 Trond Myklebust       2006-01-03  6992  static struct rpc_task *nfs4_do_unlck(struct file_lock *fl,
a5d16a4d090bd2 Trond Myklebust       2006-01-03  6993  		struct nfs_open_context *ctx,
a5d16a4d090bd2 Trond Myklebust       2006-01-03  6994  		struct nfs4_lock_state *lsp,
a5d16a4d090bd2 Trond Myklebust       2006-01-03  6995  		struct nfs_seqid *seqid)
a5d16a4d090bd2 Trond Myklebust       2006-01-03  6996  {
a5d16a4d090bd2 Trond Myklebust       2006-01-03  6997  	struct nfs4_unlockdata *data;
5138fde01161cd Trond Myklebust       2007-07-14  6998  	struct rpc_message msg = {
5138fde01161cd Trond Myklebust       2007-07-14  6999  		.rpc_proc = &nfs4_procedures[NFSPROC4_CLNT_LOCKU],
5138fde01161cd Trond Myklebust       2007-07-14  7000  		.rpc_cred = ctx->cred,
5138fde01161cd Trond Myklebust       2007-07-14  7001  	};
c970aa85e71bd5 Trond Myklebust       2007-07-14  7002  	struct rpc_task_setup task_setup_data = {
c970aa85e71bd5 Trond Myklebust       2007-07-14  7003  		.rpc_client = NFS_CLIENT(lsp->ls_state->inode),
5138fde01161cd Trond Myklebust       2007-07-14  7004  		.rpc_message = &msg,
c970aa85e71bd5 Trond Myklebust       2007-07-14  7005  		.callback_ops = &nfs4_locku_ops,
101070ca2fe671 Trond Myklebust       2008-02-19  7006  		.workqueue = nfsiod_workqueue,
c970aa85e71bd5 Trond Myklebust       2007-07-14  7007  		.flags = RPC_TASK_ASYNC,
c970aa85e71bd5 Trond Myklebust       2007-07-14  7008  	};
85e39feead948b Olga Kornievskaia     2021-06-23  7009  
118f09eda21d39 Olga Kornievskaia     2022-05-25  7010  	if (nfs_server_capable(lsp->ls_state->inode, NFS_CAP_MOVEABLE))
85e39feead948b Olga Kornievskaia     2021-06-23  7011  		task_setup_data.flags |= RPC_TASK_MOVEABLE;
a5d16a4d090bd2 Trond Myklebust       2006-01-03  7012  
fa940720ceff2d Weston Andros Adamson 2013-08-13  7013  	nfs4_state_protect(NFS_SERVER(lsp->ls_state->inode)->nfs_client,
fa940720ceff2d Weston Andros Adamson 2013-08-13  7014  		NFS_SP4_MACH_CRED_CLEANUP, &task_setup_data.rpc_client, &msg);
fa940720ceff2d Weston Andros Adamson 2013-08-13  7015  
137d6acaa64afa Frank Filz            2007-07-09  7016  	/* Ensure this is an unlock - when canceling a lock, the
137d6acaa64afa Frank Filz            2007-07-09  7017  	 * canceled lock is passed in, and it won't be an unlock.
137d6acaa64afa Frank Filz            2007-07-09  7018  	 */
137d6acaa64afa Frank Filz            2007-07-09  7019  	fl->fl_type = F_UNLCK;
f30cb757f680f9 Benjamin Coddington   2017-04-11 @7020  	if (fl->fl_flags & FL_CLOSE)
f30cb757f680f9 Benjamin Coddington   2017-04-11  7021  		set_bit(NFS_CONTEXT_UNLOCK, &ctx->flags);
137d6acaa64afa Frank Filz            2007-07-09  7022  
a5d16a4d090bd2 Trond Myklebust       2006-01-03  7023  	data = nfs4_alloc_unlockdata(fl, ctx, lsp, seqid);
a5d16a4d090bd2 Trond Myklebust       2006-01-03  7024  	if (data == NULL) {
a5d16a4d090bd2 Trond Myklebust       2006-01-03  7025  		nfs_free_seqid(seqid);
a5d16a4d090bd2 Trond Myklebust       2006-01-03  7026  		return ERR_PTR(-ENOMEM);
a5d16a4d090bd2 Trond Myklebust       2006-01-03  7027  	}
a5d16a4d090bd2 Trond Myklebust       2006-01-03  7028  
fba83f34119a74 Anna Schumaker        2018-05-04  7029  	nfs4_init_sequence(&data->arg.seq_args, &data->res.seq_res, 1, 0);
1174dd1f890b7f Trond Myklebust       2010-12-21  7030  	msg.rpc_argp = &data->arg;
1174dd1f890b7f Trond Myklebust       2010-12-21  7031  	msg.rpc_resp = &data->res;
c970aa85e71bd5 Trond Myklebust       2007-07-14  7032  	task_setup_data.callback_data = data;
c970aa85e71bd5 Trond Myklebust       2007-07-14  7033  	return rpc_run_task(&task_setup_data);
a5d16a4d090bd2 Trond Myklebust       2006-01-03  7034  }
a5d16a4d090bd2 Trond Myklebust       2006-01-03  7035  

:::::: The code at line 7020 was first introduced by commit
:::::: f30cb757f680f965ba8a2e53cb3588052a01aeb5 NFS: Always wait for I/O completion before unlock

:::::: TO: Benjamin Coddington <bcodding@redhat.com>
:::::: CC: Trond Myklebust <trond.myklebust@primarydata.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
