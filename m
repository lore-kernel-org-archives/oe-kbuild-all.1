Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722DA101E1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Jul 2023 17:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688405062; x=1719941062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RbNZuhrsmTA4NWpNazrBmfp8/RAtCZC5n/bjRSe3lEI=;
  b=QBSWI8dbBFacxleF3yXsnDNxq4V8xCm3eE2xbEV0L99hQThWa7MQIp70
   jvY1yUMVxEYcwsGR4MW6ycsjYMOhK7vkHD/vcLVETzXJqojcHYcqeFBLi
   ZO2SDx2BX1cEYa18tbv0wQqv+H/zaERHG26aaKDJl1WYDc37tOlG1bUkd
   4OMupbqVJp8A9blebvG2kU5c7LoYQaBEgLeogQZI8eLRpS5W9+hdwUrZi
   ARbXZegAPCve1nXu/WGHwp+iDbudChIcmZJzeoKqP09d2iS6t1rQFbPdD
   SkE2s2PvSNTeeCqTAteEXFgD8ExdC7loDrVzwKXpeIZR4fG4g1qW1an2J
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="347722226"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="347722226"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 10:24:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="1049148769"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="1049148769"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 03 Jul 2023 10:24:17 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGNHc-000HW9-20;
	Mon, 03 Jul 2023 17:24:16 +0000
Date: Tue, 4 Jul 2023 01:24:09 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	linux-doc@vger.kernel.org
Subject: [akpm-mm:mm-unstable 34/89] htmldocs:
 Documentation/filesystems/locking.rst:119: WARNING: Malformed table.
Message-ID: <202307040106.IrPEpc3T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   f30ee81787a5abee6c7c72b0fcc30d428319c449
commit: 8ce96a1a798d4e4234f00573df405ad0fd4625d6 [34/89] libfs: add directory operations for stable offsets
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040106.IrPEpc3T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307040106.IrPEpc3T-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Documentation/filesystems/locking.rst:119: WARNING: Malformed table.

vim +119 Documentation/filesystems/locking.rst

    58	
    59		int (*create) (struct mnt_idmap *, struct inode *,struct dentry *,umode_t, bool);
    60		struct dentry * (*lookup) (struct inode *,struct dentry *, unsigned int);
    61		int (*link) (struct dentry *,struct inode *,struct dentry *);
    62		int (*unlink) (struct inode *,struct dentry *);
    63		int (*symlink) (struct mnt_idmap *, struct inode *,struct dentry *,const char *);
    64		int (*mkdir) (struct mnt_idmap *, struct inode *,struct dentry *,umode_t);
    65		int (*rmdir) (struct inode *,struct dentry *);
    66		int (*mknod) (struct mnt_idmap *, struct inode *,struct dentry *,umode_t,dev_t);
    67		int (*rename) (struct mnt_idmap *, struct inode *, struct dentry *,
    68				struct inode *, struct dentry *, unsigned int);
    69		int (*readlink) (struct dentry *, char __user *,int);
    70		const char *(*get_link) (struct dentry *, struct inode *, struct delayed_call *);
    71		void (*truncate) (struct inode *);
    72		int (*permission) (struct mnt_idmap *, struct inode *, int, unsigned int);
    73		struct posix_acl * (*get_inode_acl)(struct inode *, int, bool);
    74		int (*setattr) (struct mnt_idmap *, struct dentry *, struct iattr *);
    75		int (*getattr) (struct mnt_idmap *, const struct path *, struct kstat *, u32, unsigned int);
    76		ssize_t (*listxattr) (struct dentry *, char *, size_t);
    77		int (*fiemap)(struct inode *, struct fiemap_extent_info *, u64 start, u64 len);
    78		void (*update_time)(struct inode *, struct timespec *, int);
    79		int (*atomic_open)(struct inode *, struct dentry *,
    80					struct file *, unsigned open_flag,
    81					umode_t create_mode);
    82		int (*tmpfile) (struct mnt_idmap *, struct inode *,
    83				struct file *, umode_t);
    84		int (*fileattr_set)(struct mnt_idmap *idmap,
    85				    struct dentry *dentry, struct fileattr *fa);
    86		int (*fileattr_get)(struct dentry *dentry, struct fileattr *fa);
    87		struct posix_acl * (*get_acl)(struct mnt_idmap *, struct dentry *, int);
    88		struct offset_ctx *(*get_offset_ctx)(struct inode *inode);
    89	
    90	locking rules:
    91		all may block
    92	
    93	==============	=============================================
    94	ops		i_rwsem(inode)
    95	==============	=============================================
    96	lookup:		shared
    97	create:		exclusive
    98	link:		exclusive (both)
    99	mknod:		exclusive
   100	symlink:	exclusive
   101	mkdir:		exclusive
   102	unlink:		exclusive (both)
   103	rmdir:		exclusive (both)(see below)
   104	rename:		exclusive (all)	(see below)
   105	readlink:	no
   106	get_link:	no
   107	setattr:	exclusive
   108	permission:	no (may not block if called in rcu-walk mode)
   109	get_inode_acl:	no
   110	get_acl:	no
   111	getattr:	no
   112	listxattr:	no
   113	fiemap:		no
   114	update_time:	no
   115	atomic_open:	shared (exclusive if O_CREAT is set in open flags)
   116	tmpfile:	no
   117	fileattr_get:	no or exclusive
   118	fileattr_set:	exclusive
 > 119	get_offset_ctx: no
   120	==============	=============================================
   121	
   122	
   123		Additionally, ->rmdir(), ->unlink() and ->rename() have ->i_rwsem
   124		exclusive on victim.
   125		cross-directory ->rename() has (per-superblock) ->s_vfs_rename_sem.
   126	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
