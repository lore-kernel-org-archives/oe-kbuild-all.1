Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B144834214F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Nov 2025 16:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762359312; cv=none; b=lZBLBM4KrXNBCXFXzbOvMkLncSHQhrCQlQMqIHlnoWbhyy7+C4LJLlOn8DXArrFUFYwmcDSxCVxw80hNhW+EQZD/0tSZyhsqozUt/S/CXXxJIcGkVPQXvyzIDyMbtUSLfeyW49GUW1YE0dbMAXcBPTAJCR7c1iR+mHdDuucLuAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762359312; c=relaxed/simple;
	bh=OP7/bNyaiNiBdwQ1Nzvd3+x6lz6g2h+xoZfbewdQdls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=izIuBKKDIT6oqw+rUqvSUHLdTpH/t3BcIUrDInaAUs9uAbg6nW1YwvwgaI+Ay/JmlpGWLelrGdIlInzY7HmKx1mRiUNoZ4opH68WD2QDKU8yMXlvD5wG14+y04YoWonchRAuqy78KQorTSwKaDUUgNQ4k9ZCm8zW3E7phcUJf3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHiGIScr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHiGIScr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762359309; x=1793895309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OP7/bNyaiNiBdwQ1Nzvd3+x6lz6g2h+xoZfbewdQdls=;
  b=ZHiGIScru06a1IYMePamwFE71PUF4MsRwr5ICp+JwqXuFbn8yFdziJQI
   omJRKZIhcmnDmNTYF5/HY7Ycr3sB/hUFk4sQG6mUUrAM8M6CSklR7YOne
   tHjfd+pi+yPG7EoMDQDWy0MF8KbA/VqwCpVcUGGNWtvXjuyXoG7BBIIyc
   U/sOZKIitMkwb8VH8VY7XkVTgWjCqC6Trnwl9+qebzIo0v19qHPY6HFzl
   lYCOxON5Xi0oi37+B0RrwNb9D+nVw3uvl0TMGgRfrN18I+gVMrc9sV2Y0
   RAvli5ZnLLqKEeTgJ5WXpNjk1v9Fr9/K466TxK/47ZCOOHPmZ0wmhcr4S
   g==;
X-CSE-ConnectionGUID: qMrbZojYQSmdxMPdKJLDZg==
X-CSE-MsgGUID: LCu9/PfETrGUl4btwypwJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64513861"
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="64513861"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 08:15:08 -0800
X-CSE-ConnectionGUID: V4bg/AFyT/urZHjcpLuGeQ==
X-CSE-MsgGUID: Rlvt4aiNRz+O+EzPpZajUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="187664702"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 05 Nov 2025 08:15:08 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGg9Z-000Spo-0s;
	Wed, 05 Nov 2025 16:14:36 +0000
Date: Thu, 6 Nov 2025 00:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-github:vfs.all 10/12] include/linux/fs.h:1431:1: error:
 version control conflict marker in file
Message-ID: <202511060019.qS7wEBmN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/brauner/linux.git vfs.all
head:   3742991d3be2fa7808d3e569366a10d7eb287b55
commit: 3fef0b63fe1c3cd51b1daae6f8b946a947d73331 [10/12] Merge branch 'vfs-6.19.fs_header' into vfs.all
config: alpha-allnoconfig (https://download.01.org/0day-ci/archive/20251106/202511060019.qS7wEBmN-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511060019.qS7wEBmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511060019.qS7wEBmN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/huge_mm.h:7,
                    from include/linux/mm.h:1081,
                    from include/linux/pid_namespace.h:7,
                    from include/linux/ptrace.h:10,
                    from arch/alpha/kernel/asm-offsets.c:12:
>> include/linux/fs.h:1431:1: error: version control conflict marker in file
    1431 | <<<<<<< HEAD
         | ^~~~~~~
>> include/linux/fs.h:1464:8: error: redefinition of 'struct sb_writers'
    1464 | struct sb_writers {
         |        ^~~~~~~~~~
   In file included from include/linux/fs_super.h:5,
                    from include/linux/fs.h:5:
   include/linux/fs_super_types.h:52:8: note: originally defined here
      52 | struct sb_writers {
         |        ^~~~~~~~~~
>> include/linux/fs.h:1474:8: error: redefinition of 'struct super_block'
    1474 | struct super_block {
         |        ^~~~~~~~~~~
   include/linux/fs_super_types.h:129:8: note: originally defined here
     129 | struct super_block {
         |        ^~~~~~~~~~~
>> include/linux/fs.h:1618:1: error: expected identifier or '(' before '||' token
    1618 | ||||||| dcb6fa37fd7b
         | ^~
   include/linux/fs.h:1651:8: error: redefinition of 'struct sb_writers'
    1651 | struct sb_writers {
         |        ^~~~~~~~~~
   include/linux/fs.h:1464:8: note: originally defined here
    1464 | struct sb_writers {
         |        ^~~~~~~~~~
   include/linux/fs.h:1661:8: error: redefinition of 'struct super_block'
    1661 | struct super_block {
         |        ^~~~~~~~~~~
   include/linux/fs.h:1474:8: note: originally defined here
    1474 | struct super_block {
         |        ^~~~~~~~~~~
   include/linux/fs.h:1804:1: error: version control conflict marker in file
    1804 | =======
         | ^~~~~~~
>> include/linux/fs.h:1805:13: error: too many decimal points in number
    1805 | >>>>>>> vfs-6.19.fs_header
         |             ^~~~~~~~~~~~~~
   include/linux/fs.h: In function 'i_uid_read':
>> include/linux/fs.h:1818:26: error: implicit declaration of function 'i_user_ns' [-Wimplicit-function-declaration]
    1818 |         return from_kuid(i_user_ns(inode), inode->i_uid);
         |                          ^~~~~~~~~
>> include/linux/fs.h:1818:26: error: passing argument 1 of 'from_kuid' makes pointer from integer without a cast [-Wint-conversion]
    1818 |         return from_kuid(i_user_ns(inode), inode->i_uid);
         |                          ^~~~~~~~~~~~~~~~
         |                          |
         |                          int
   In file included from include/linux/capability.h:17,
                    from include/linux/cred.h:11,
                    from include/linux/sched/signal.h:10,
                    from include/linux/ptrace.h:7:
   include/linux/uidgid.h:149:54: note: expected 'struct user_namespace *' but argument is of type 'int'
     149 | static inline uid_t from_kuid(struct user_namespace *to, kuid_t kuid)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~^~
   include/linux/fs.h: In function 'i_gid_read':
>> include/linux/fs.h:1823:26: error: passing argument 1 of 'from_kgid' makes pointer from integer without a cast [-Wint-conversion]
    1823 |         return from_kgid(i_user_ns(inode), inode->i_gid);
         |                          ^~~~~~~~~~~~~~~~
         |                          |
         |                          int
   include/linux/uidgid.h:154:54: note: expected 'struct user_namespace *' but argument is of type 'int'
     154 | static inline gid_t from_kgid(struct user_namespace *to, kgid_t kgid)
         |                               ~~~~~~~~~~~~~~~~~~~~~~~^~
   include/linux/fs.h: In function 'i_uid_write':
>> include/linux/fs.h:1828:34: error: passing argument 1 of 'make_kuid' makes pointer from integer without a cast [-Wint-conversion]
    1828 |         inode->i_uid = make_kuid(i_user_ns(inode), uid);
         |                                  ^~~~~~~~~~~~~~~~
         |                                  |
         |                                  int
   include/linux/uidgid.h:139:55: note: expected 'struct user_namespace *' but argument is of type 'int'
     139 | static inline kuid_t make_kuid(struct user_namespace *from, uid_t uid)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/fs.h: In function 'i_gid_write':
>> include/linux/fs.h:1833:34: error: passing argument 1 of 'make_kgid' makes pointer from integer without a cast [-Wint-conversion]
    1833 |         inode->i_gid = make_kgid(i_user_ns(inode), gid);
         |                                  ^~~~~~~~~~~~~~~~
         |                                  |
         |                                  int
   include/linux/uidgid.h:144:55: note: expected 'struct user_namespace *' but argument is of type 'int'
     144 | static inline kgid_t make_kgid(struct user_namespace *from, gid_t gid)
         |                                ~~~~~~~~~~~~~~~~~~~~~~~^~~~
   include/linux/fs.h: In function 'i_uid_into_vfsuid':
>> include/linux/fs.h:1847:35: error: passing argument 2 of 'make_vfsuid' makes pointer from integer without a cast [-Wint-conversion]
    1847 |         return make_vfsuid(idmap, i_user_ns(inode), inode->i_uid);
         |                                   ^~~~~~~~~~~~~~~~
         |                                   |
         |                                   int
   In file included from include/linux/fs.h:44:
   include/linux/mnt_idmapping.h:128:45: note: expected 'struct user_namespace *' but argument is of type 'int'
     128 |                      struct user_namespace *fs_userns, kuid_t kuid);
         |                      ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/fs.h: In function 'i_uid_update':
>> include/linux/fs.h:1884:51: error: passing argument 2 of 'from_vfsuid' makes pointer from integer without a cast [-Wint-conversion]
    1884 |                 inode->i_uid = from_vfsuid(idmap, i_user_ns(inode),
         |                                                   ^~~~~~~~~~~~~~~~
         |                                                   |
         |                                                   int
   include/linux/mnt_idmapping.h:134:43: note: expected 'struct user_namespace *' but argument is of type 'int'
     134 |                    struct user_namespace *fs_userns, vfsuid_t vfsuid);
         |                    ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/fs.h: In function 'i_gid_into_vfsgid':
>> include/linux/fs.h:1899:35: error: passing argument 2 of 'make_vfsgid' makes pointer from integer without a cast [-Wint-conversion]
    1899 |         return make_vfsgid(idmap, i_user_ns(inode), inode->i_gid);
         |                                   ^~~~~~~~~~~~~~~~
         |                                   |
         |                                   int
   include/linux/mnt_idmapping.h:131:45: note: expected 'struct user_namespace *' but argument is of type 'int'
     131 |                      struct user_namespace *fs_userns, kgid_t kgid);
         |                      ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/fs.h: In function 'i_gid_update':
>> include/linux/fs.h:1936:51: error: passing argument 2 of 'from_vfsgid' makes pointer from integer without a cast [-Wint-conversion]
    1936 |                 inode->i_gid = from_vfsgid(idmap, i_user_ns(inode),
         |                                                   ^~~~~~~~~~~~~~~~
         |                                                   |
         |                                                   int
   include/linux/mnt_idmapping.h:137:43: note: expected 'struct user_namespace *' but argument is of type 'int'
     137 |                    struct user_namespace *fs_userns, vfsgid_t vfsgid);
         |                    ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/fs.h: In function 'inode_fsuid_set':
>> include/linux/fs.h:1951:44: error: passing argument 2 of 'mapped_fsuid' makes pointer from integer without a cast [-Wint-conversion]
    1951 |         inode->i_uid = mapped_fsuid(idmap, i_user_ns(inode));
         |                                            ^~~~~~~~~~~~~~~~
         |                                            |
         |                                            int
   include/linux/mnt_idmapping.h:229:58: note: expected 'struct user_namespace *' but argument is of type 'int'
     229 |                                   struct user_namespace *fs_userns)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/fs.h: In function 'inode_fsgid_set':
>> include/linux/fs.h:1965:44: error: passing argument 2 of 'mapped_fsgid' makes pointer from integer without a cast [-Wint-conversion]
    1965 |         inode->i_gid = mapped_fsgid(idmap, i_user_ns(inode));
         |                                            ^~~~~~~~~~~~~~~~
         |                                            |
         |                                            int
   include/linux/mnt_idmapping.h:248:58: note: expected 'struct user_namespace *' but argument is of type 'int'
     248 |                                   struct user_namespace *fs_userns)
         |                                   ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~
   include/linux/fs.h: At top level:
   include/linux/fs.h:3391:1: error: version control conflict marker in file
    3391 | <<<<<<< HEAD
         | ^~~~~~~
>> include/linux/fs.h:3393:18: error: conflicting types for 'sb_min_blocksize'; have 'int(struct super_block *, int)'
    3393 | int __must_check sb_min_blocksize(struct super_block *sb, int size);
         |                  ^~~~~~~~~~~~~~~~
   include/linux/fs_super.h:226:5: note: previous declaration of 'sb_min_blocksize' with type 'int(struct super_block *, int)'
     226 | int sb_min_blocksize(struct super_block *sb, int size);
         |     ^~~~~~~~~~~~~~~~
   include/linux/fs.h:3395:1: error: expected identifier or '(' before '||' token
    3395 | ||||||| dcb6fa37fd7b
         | ^~
   include/linux/fs.h:3397:12: error: conflicting types for 'sb_min_blocksize'; have 'int(struct super_block *, int)'
    3397 | extern int sb_min_blocksize(struct super_block *, int);
         |            ^~~~~~~~~~~~~~~~
   include/linux/fs_super.h:226:5: note: previous declaration of 'sb_min_blocksize' with type 'int(struct super_block *, int)'
     226 | int sb_min_blocksize(struct super_block *sb, int size);
         |     ^~~~~~~~~~~~~~~~
   include/linux/fs.h:3399:1: error: version control conflict marker in file
    3399 | =======
         | ^~~~~~~
   include/linux/fs.h:3400:13: error: too many decimal points in number
    3400 | >>>>>>> vfs-6.19.fs_header
         |             ^~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:182: arch/alpha/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +1431 include/linux/fs.h

  1430	
> 1431	<<<<<<< HEAD
  1432	/* sb->s_iflags */
  1433	#define SB_I_CGROUPWB	0x00000001	/* cgroup-aware writeback enabled */
  1434	#define SB_I_NOEXEC	0x00000002	/* Ignore executables on this fs */
  1435	#define SB_I_NODEV	0x00000004	/* Ignore devices on this fs */
  1436	#define SB_I_STABLE_WRITES 0x00000008	/* don't modify blks until WB is done */
  1437	
  1438	/* sb->s_iflags to limit user namespace mounts */
  1439	#define SB_I_USERNS_VISIBLE		0x00000010 /* fstype already mounted */
  1440	#define SB_I_IMA_UNVERIFIABLE_SIGNATURE	0x00000020
  1441	#define SB_I_UNTRUSTED_MOUNTER		0x00000040
  1442	#define SB_I_EVM_HMAC_UNSUPPORTED	0x00000080
  1443	
  1444	#define SB_I_SKIP_SYNC	0x00000100	/* Skip superblock at global sync */
  1445	#define SB_I_PERSB_BDI	0x00000200	/* has a per-sb bdi */
  1446	#define SB_I_TS_EXPIRY_WARNED 0x00000400 /* warned about timestamp range expiry */
  1447	#define SB_I_RETIRED	0x00000800	/* superblock shouldn't be reused */
  1448	#define SB_I_NOUMASK	0x00001000	/* VFS does not apply umask */
  1449	#define SB_I_NOIDMAP	0x00002000	/* No idmapped mounts on this superblock */
  1450	#define SB_I_ALLOW_HSM	0x00004000	/* Allow HSM events on this superblock */
  1451	
  1452	/* Possible states of 'frozen' field */
  1453	enum {
  1454		SB_UNFROZEN = 0,		/* FS is unfrozen */
  1455		SB_FREEZE_WRITE	= 1,		/* Writes, dir ops, ioctls frozen */
  1456		SB_FREEZE_PAGEFAULT = 2,	/* Page faults stopped as well */
  1457		SB_FREEZE_FS = 3,		/* For internal FS use (e.g. to stop
  1458						 * internal threads if needed) */
  1459		SB_FREEZE_COMPLETE = 4,		/* ->freeze_fs finished successfully */
  1460	};
  1461	
  1462	#define SB_FREEZE_LEVELS (SB_FREEZE_COMPLETE - 1)
  1463	
> 1464	struct sb_writers {
  1465		unsigned short			frozen;		/* Is sb frozen? */
  1466		int				freeze_kcount;	/* How many kernel freeze requests? */
  1467		int				freeze_ucount;	/* How many userspace freeze requests? */
  1468		const void			*freeze_owner;	/* Owner of the freeze */
  1469		struct percpu_rw_semaphore	rw_sem[SB_FREEZE_LEVELS];
  1470	};
  1471	
  1472	struct mount;
  1473	
> 1474	struct super_block {
  1475		struct list_head	s_list;		/* Keep this first */
  1476		dev_t			s_dev;		/* search index; _not_ kdev_t */
  1477		unsigned char		s_blocksize_bits;
  1478		unsigned long		s_blocksize;
  1479		loff_t			s_maxbytes;	/* Max file size */
  1480		struct file_system_type	*s_type;
  1481		const struct super_operations	*s_op;
  1482		const struct dquot_operations	*dq_op;
  1483		const struct quotactl_ops	*s_qcop;
  1484		const struct export_operations *s_export_op;
  1485		unsigned long		s_flags;
  1486		unsigned long		s_iflags;	/* internal SB_I_* flags */
  1487		unsigned long		s_magic;
  1488		struct dentry		*s_root;
  1489		struct rw_semaphore	s_umount;
  1490		int			s_count;
  1491		atomic_t		s_active;
  1492	#ifdef CONFIG_SECURITY
  1493		void                    *s_security;
  1494	#endif
  1495		const struct xattr_handler * const *s_xattr;
  1496	#ifdef CONFIG_FS_ENCRYPTION
  1497		const struct fscrypt_operations	*s_cop;
  1498		struct fscrypt_keyring	*s_master_keys; /* master crypto keys in use */
  1499	#endif
  1500	#ifdef CONFIG_FS_VERITY
  1501		const struct fsverity_operations *s_vop;
  1502	#endif
  1503	#if IS_ENABLED(CONFIG_UNICODE)
  1504		struct unicode_map *s_encoding;
  1505		__u16 s_encoding_flags;
  1506	#endif
  1507		struct hlist_bl_head	s_roots;	/* alternate root dentries for NFS */
  1508		struct mount		*s_mounts;	/* list of mounts; _not_ for fs use */
  1509		struct block_device	*s_bdev;	/* can go away once we use an accessor for @s_bdev_file */
  1510		struct file		*s_bdev_file;
  1511		struct backing_dev_info *s_bdi;
  1512		struct mtd_info		*s_mtd;
  1513		struct hlist_node	s_instances;
  1514		unsigned int		s_quota_types;	/* Bitmask of supported quota types */
  1515		struct quota_info	s_dquot;	/* Diskquota specific options */
  1516	
  1517		struct sb_writers	s_writers;
  1518	
  1519		/*
  1520		 * Keep s_fs_info, s_time_gran, s_fsnotify_mask, and
  1521		 * s_fsnotify_info together for cache efficiency. They are frequently
  1522		 * accessed and rarely modified.
  1523		 */
  1524		void			*s_fs_info;	/* Filesystem private info */
  1525	
  1526		/* Granularity of c/m/atime in ns (cannot be worse than a second) */
  1527		u32			s_time_gran;
  1528		/* Time limits for c/m/atime in seconds */
  1529		time64_t		   s_time_min;
  1530		time64_t		   s_time_max;
  1531	#ifdef CONFIG_FSNOTIFY
  1532		u32			s_fsnotify_mask;
  1533		struct fsnotify_sb_info	*s_fsnotify_info;
  1534	#endif
  1535	
  1536		/*
  1537		 * q: why are s_id and s_sysfs_name not the same? both are human
  1538		 * readable strings that identify the filesystem
  1539		 * a: s_id is allowed to change at runtime; it's used in log messages,
  1540		 * and we want to when a device starts out as single device (s_id is dev
  1541		 * name) but then a device is hot added and we have to switch to
  1542		 * identifying it by UUID
  1543		 * but s_sysfs_name is a handle for programmatic access, and can't
  1544		 * change at runtime
  1545		 */
  1546		char			s_id[32];	/* Informational name */
  1547		uuid_t			s_uuid;		/* UUID */
  1548		u8			s_uuid_len;	/* Default 16, possibly smaller for weird filesystems */
  1549	
  1550		/* if set, fs shows up under sysfs at /sys/fs/$FSTYP/s_sysfs_name */
  1551		char			s_sysfs_name[UUID_STRING_LEN + 1];
  1552	
  1553		unsigned int		s_max_links;
  1554		unsigned int		s_d_flags;	/* default d_flags for dentries */
  1555	
  1556		/*
  1557		 * The next field is for VFS *only*. No filesystems have any business
  1558		 * even looking at it. You had been warned.
  1559		 */
  1560		struct mutex s_vfs_rename_mutex;	/* Kludge */
  1561	
  1562		/*
  1563		 * Filesystem subtype.  If non-empty the filesystem type field
  1564		 * in /proc/mounts will be "type.subtype"
  1565		 */
  1566		const char *s_subtype;
  1567	
  1568		const struct dentry_operations *__s_d_op; /* default d_op for dentries */
  1569	
  1570		struct shrinker *s_shrink;	/* per-sb shrinker handle */
  1571	
  1572		/* Number of inodes with nlink == 0 but still referenced */
  1573		atomic_long_t s_remove_count;
  1574	
  1575		/* Read-only state of the superblock is being changed */
  1576		int s_readonly_remount;
  1577	
  1578		/* per-sb errseq_t for reporting writeback errors via syncfs */
  1579		errseq_t s_wb_err;
  1580	
  1581		/* AIO completions deferred from interrupt context */
  1582		struct workqueue_struct *s_dio_done_wq;
  1583		struct hlist_head s_pins;
  1584	
  1585		/*
  1586		 * Owning user namespace and default context in which to
  1587		 * interpret filesystem uids, gids, quotas, device nodes,
  1588		 * xattrs and security labels.
  1589		 */
  1590		struct user_namespace *s_user_ns;
  1591	
  1592		/*
  1593		 * The list_lru structure is essentially just a pointer to a table
  1594		 * of per-node lru lists, each of which has its own spinlock.
  1595		 * There is no need to put them into separate cachelines.
  1596		 */
  1597		struct list_lru		s_dentry_lru;
  1598		struct list_lru		s_inode_lru;
  1599		struct rcu_head		rcu;
  1600		struct work_struct	destroy_work;
  1601	
  1602		struct mutex		s_sync_lock;	/* sync serialisation lock */
  1603	
  1604		/*
  1605		 * Indicates how deep in a filesystem stack this SB is
  1606		 */
  1607		int s_stack_depth;
  1608	
  1609		/* s_inode_list_lock protects s_inodes */
  1610		spinlock_t		s_inode_list_lock ____cacheline_aligned_in_smp;
  1611		struct list_head	s_inodes;	/* all inodes */
  1612	
  1613		spinlock_t		s_inode_wblist_lock;
  1614		struct list_head	s_inodes_wb;	/* writeback inodes */
  1615		long			s_min_writeback_pages;
  1616	} __randomize_layout;
  1617	
> 1618	||||||| dcb6fa37fd7b
  1619	/* sb->s_iflags */
  1620	#define SB_I_CGROUPWB	0x00000001	/* cgroup-aware writeback enabled */
  1621	#define SB_I_NOEXEC	0x00000002	/* Ignore executables on this fs */
  1622	#define SB_I_NODEV	0x00000004	/* Ignore devices on this fs */
  1623	#define SB_I_STABLE_WRITES 0x00000008	/* don't modify blks until WB is done */
  1624	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
