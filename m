Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5B11FD9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Jan 2024 06:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X7AAA3xd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704522504; x=1736058504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6shwhaL4z0ytc/kW8TSr8nWz+O52b4WmNPprTUA/1jU=;
  b=X7AAA3xdDSgrZN5uwN4LDLvC6/xMfxKrcLSPsyfoYHE4ZhQiS0b5pRs1
   M6+hIe4X56WWGp2sMk1Dq3t3jubZodlfQ+Te8cCTi22qFJeP3D3j+ritj
   em+bHCd3GTA8Y3z6uJQSSmwpEEP4oHcQynwk0aMFu4XlqN8b4RYXkR468
   QHIv+wjN13NdA9rRbb7zGBC9eZpaqwkF3RxQj0H+iKBpOuMX25herQZLL
   ZgfEU0G9yN1x8oHcp4bqvyXPSXwY2UmdtfGvmnejjfsa7SU9hZLsM/ESu
   C3AWc9O6g7A1+GR9yxU8uEeNh2vjMHfpzQDBh5PVRJl2KZCbjXpDPBwZa
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="377129599"
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="377129599"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2024 22:28:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10944"; a="924405583"
X-IronPort-AV: E=Sophos;i="6.04,336,1695711600"; 
   d="scan'208";a="924405583"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 05 Jan 2024 22:28:20 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rM0AM-00027K-2A;
	Sat, 06 Jan 2024 06:28:18 +0000
Date: Sat, 6 Jan 2024 14:27:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:filelock-6.9 10/11] fs/afs/flock.c:115:29: error: expected
 '=', ',', ';', 'asm' or '__attribute__' before '.' token
Message-ID: <202401061443.SeY2q0FE-lkp@intel.com>
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
commit: a93f3917a4e31e2a760cca892ba86ff5b38e16e1 [10/11] filelock: move fl_type into fl_core
config: i386-randconfig-054-20240106 (https://download.01.org/0day-ci/archive/20240106/202401061443.SeY2q0FE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240106/202401061443.SeY2q0FE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401061443.SeY2q0FE-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/afs/flock.c: In function 'afs_next_locker':
>> fs/afs/flock.c:115:29: error: expected '=', ',', ';', 'asm' or '__attribute__' before '.' token
     115 |         unsigned int fl_core.fl_type = F_RDLCK;
         |                             ^
>> fs/afs/flock.c:115:29: error: expected expression before '.' token
>> fs/afs/flock.c:120:17: error: 'fl_core' undeclared (first use in this function)
     120 |                 fl_core.fl_type = F_WRLCK;
         |                 ^~~~~~~
   fs/afs/flock.c:120:17: note: each undeclared identifier is reported only once for each function it appears in
   fs/afs/flock.c: In function 'afs_do_setlk':
   fs/afs/flock.c:527:17: error: 'struct file_lock' has no member named 'fl_flags'
     527 |             !(fl->fl_flags & FL_SLEEP)) {
         |                 ^~
   fs/afs/flock.c:624:17: error: 'struct file_lock' has no member named 'fl_flags'
     624 |         if (!(fl->fl_flags & FL_SLEEP)) {
         |                 ^~
   In file included from include/linux/kernel.h:31,
                    from fs/afs/internal.h:9,
                    from fs/afs/flock.c:8:
   fs/afs/flock.c: In function 'afs_lock':
   fs/afs/flock.c:772:39: error: 'struct file_lock' has no member named 'fl_flags'
     772 |                fl->fl_core.fl_type, fl->fl_flags,
         |                                       ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   fs/afs/internal.h:1652:9: note: in expansion of macro 'printk'
    1652 |         printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
         |         ^~~~~~
   fs/afs/internal.h:1654:25: note: in expansion of macro 'dbgprintk'
    1654 | #define kenter(FMT,...) dbgprintk("==> %s("FMT")",__func__ ,##__VA_ARGS__)
         |                         ^~~~~~~~~
   fs/afs/internal.h:1672:17: note: in expansion of macro 'kenter'
    1672 |                 kenter(FMT,##__VA_ARGS__);              \
         |                 ^~~~~~
   fs/afs/flock.c:770:9: note: in expansion of macro '_enter'
     770 |         _enter("{%llx:%llu},%d,{t=%x,fl=%x,r=%Ld:%Ld}",
         |         ^~~~~~
   fs/afs/flock.c: In function 'afs_flock':
   fs/afs/flock.c:807:39: error: 'struct file_lock' has no member named 'fl_flags'
     807 |                fl->fl_core.fl_type, fl->fl_flags);
         |                                       ^~
   include/linux/printk.h:427:33: note: in definition of macro 'printk_index_wrap'
     427 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   fs/afs/internal.h:1652:9: note: in expansion of macro 'printk'
    1652 |         printk("[%-6.6s] "FMT"\n", current->comm ,##__VA_ARGS__)
         |         ^~~~~~
   fs/afs/internal.h:1654:25: note: in expansion of macro 'dbgprintk'
    1654 | #define kenter(FMT,...) dbgprintk("==> %s("FMT")",__func__ ,##__VA_ARGS__)
         |                         ^~~~~~~~~
   fs/afs/internal.h:1672:17: note: in expansion of macro 'kenter'
    1672 |                 kenter(FMT,##__VA_ARGS__);              \
         |                 ^~~~~~
   fs/afs/flock.c:805:9: note: in expansion of macro '_enter'
     805 |         _enter("{%llx:%llu},%d,{t=%x,fl=%x}",
         |         ^~~~~~
   fs/afs/flock.c:816:17: error: 'struct file_lock' has no member named 'fl_flags'
     816 |         if (!(fl->fl_flags & FL_FLOCK))
         |                 ^~


vim +115 fs/afs/flock.c

   105	
   106	/*
   107	 * If an error is specified, reject every pending lock that matches the
   108	 * authentication and type of the lock we failed to get.  If there are any
   109	 * remaining lockers, try to wake up one of them to have a go.
   110	 */
   111	static void afs_next_locker(struct afs_vnode *vnode, int error)
   112	{
   113		struct file_lock *p, *_p, *next = NULL;
   114		struct key *key = vnode->lock_key;
 > 115		unsigned int fl_core.fl_type = F_RDLCK;
   116	
   117		_enter("");
   118	
   119		if (vnode->lock_type == AFS_LOCK_WRITE)
 > 120			fl_core.fl_type = F_WRLCK;
   121	
   122		list_for_each_entry_safe(p, _p, &vnode->pending_locks, fl_u.afs.link) {
   123			if (error &&
   124			    p->fl_core.fl_type == fl_core.fl_type &&
   125			    afs_file_key(p->fl_file) == key) {
   126				list_del_init(&p->fl_u.afs.link);
   127				p->fl_u.afs.state = error;
   128				wake_up(&p->fl_wait);
   129			}
   130	
   131			/* Select the next locker to hand off to. */
   132			if (next &&
   133			    (next->fl_core.fl_type == F_WRLCK || p->fl_core.fl_type == F_RDLCK))
   134				continue;
   135			next = p;
   136		}
   137	
   138		vnode->lock_key = NULL;
   139		key_put(key);
   140	
   141		if (next) {
   142			afs_set_lock_state(vnode, AFS_VNODE_LOCK_SETTING);
   143			next->fl_u.afs.state = AFS_LOCK_YOUR_TRY;
   144			trace_afs_flock_op(vnode, next, afs_flock_op_wake);
   145			wake_up(&next->fl_wait);
   146		} else {
   147			afs_set_lock_state(vnode, AFS_VNODE_LOCK_NONE);
   148			trace_afs_flock_ev(vnode, NULL, afs_flock_no_lockers, 0);
   149		}
   150	
   151		_leave("");
   152	}
   153	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
