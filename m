Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00DA52DC783
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 11:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788090517; cv=none; b=UqzQZAAda35hnQyFNhyW8Wth6ApV/zpUKhRqngYZ4u2WCdgVC48GrfoQ9e16UDnLZ5mMDAwYopKXaRi4wenK/fhdVxPdHcIKi7Nmz8JI3JWq0fB1pPWP/rKiHAZDEPkOerhwJMScv7PYNrG5NvjXJ4KjJddJALBTxqSeVPenpRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788090517; c=relaxed/simple;
	bh=8x/ch8FiFvOb8AAPLMbN/jh2/THCJdpaithyjKrv9/w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JL8U3GbibSFBiZRS2FT4PINQSDl13QYHcAjRU5ce5gi63KFtS1B4fVMfboQHTNz/ylwnG/TfMABu1qbpX880IQ875mQbLqa44A3D/Q3oZ/c5dKMb9tphdvqou+T4NBYQimEZ5lq8DleIYFYimQbwd72zA1iQOBoh6YC9epWHTX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EtRRBhwK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EtRRBhwK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788090514; x=1819626514;
  h=date:from:to:cc:subject:message-id;
  bh=8x/ch8FiFvOb8AAPLMbN/jh2/THCJdpaithyjKrv9/w=;
  b=EtRRBhwKPWWvW0Lugw/6ukeXhXblZHnyw92kYdcE1vJqD+THO4oForE/
   TquJnhZBzcT3Z6h0WgZplarHUF5qLlhkl2lsEdXoMTfPFCGTgPRNQ88s0
   nhaGPWXppX7toaA43kSHqu9yPdT6rsZZgIBh9fgMVnF1jWhZeLiaDEzFj
   3BjsHQnyOUptbjOQ0c5BDhCjS48H03e+c2tGdCLaWL3J3P5Hrl1LvQF5v
   UHkUgdgC2dlVrEFluO4cSArMAPSazek5XlJL1EMQ/F4p/2d3DzaiFYKl7
   iyvK4qC8xkfcj5XgHvD6poKNmG1PbTqo/OVJk+AsHugGvViqXy1IenMgh
   A==;
X-CSE-ConnectionGUID: oO8vuiytTBy7VG5e9oWDeg==
X-CSE-MsgGUID: bILlnM1RSR2SXd6OndpICw==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="106047665"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="106047665"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 04:48:33 -0700
X-CSE-ConnectionGUID: NMUbNAg6S2+31cz+oFGMlQ==
X-CSE-MsgGUID: OojBHUZwQG6S8w53mDfhfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="272757635"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Aug 2026 04:48:31 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0e1U-00000000Dpo-2bM2;
	Sun, 30 Aug 2026 11:48:28 +0000
Date: Sun, 30 Aug 2026 19:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: Kelvin Zhang <zhangxp1998@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:feature/subpage 5/10] include/linux/f2fs_fs.h:347:24:
 error: flexible array member in union
Message-ID: <202608301900.19vrzwch-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/subpage
head:   3a537197e7b9327a386b4c5deab273a387072d1f
commit: 0afae9798e90aeeeebfaaf8878c16c2a5f1dbc9f [5/10] f2fs: describe {i,d,id}node block layout dynamically
config: m68k-randconfig-r072-20260830 (https://download.01.org/0day-ci/archive/20260830/202608301900.19vrzwch-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608301900.19vrzwch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608301900.19vrzwch-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:10:
>> include/linux/f2fs_fs.h:347:24: error: flexible array member in union
     347 |                 __le32 i_addr[];                /* data block pointers */
         |                        ^~~~~~
   include/linux/f2fs_fs.h:360:16: error: flexible array member in a struct with no named members
     360 |         __le32 addr[];                  /* array of data block address */
         |                ^~~~
   include/linux/f2fs_fs.h:365:16: error: flexible array member in a struct with no named members
     365 |         __le32 nid[];                   /* array of data block address */
         |                ^~~
   include/linux/f2fs_fs.h:404:31: error: flexible array member in a struct with no named members
     404 |         struct f2fs_nat_entry entries[];
         |                               ^~~~~~~
   include/linux/f2fs_fs.h:448:31: error: flexible array member in a struct with no named members
     448 |         struct f2fs_sit_entry entries[];
         |                               ^~~~~~~
   In file included from fs/f2fs/dir.c:15:
   fs/f2fs/f2fs.h: In function 'blkaddr_in_node':
>> fs/f2fs/f2fs.h:3314:1: warning: control reaches end of non-void function [-Wreturn-type]
    3314 | }
         | ^
--
   In file included from fs/f2fs/namei.c:9:
>> include/linux/f2fs_fs.h:347:24: error: flexible array member in union
     347 |                 __le32 i_addr[];                /* data block pointers */
         |                        ^~~~~~
   include/linux/f2fs_fs.h:360:16: error: flexible array member in a struct with no named members
     360 |         __le32 addr[];                  /* array of data block address */
         |                ^~~~
   include/linux/f2fs_fs.h:365:16: error: flexible array member in a struct with no named members
     365 |         __le32 nid[];                   /* array of data block address */
         |                ^~~
   include/linux/f2fs_fs.h:404:31: error: flexible array member in a struct with no named members
     404 |         struct f2fs_nat_entry entries[];
         |                               ^~~~~~~
   include/linux/f2fs_fs.h:448:31: error: flexible array member in a struct with no named members
     448 |         struct f2fs_sit_entry entries[];
         |                               ^~~~~~~
--
   In file included from fs/f2fs/node.c:9:
>> include/linux/f2fs_fs.h:347:24: error: flexible array member in union
     347 |                 __le32 i_addr[];                /* data block pointers */
         |                        ^~~~~~
   include/linux/f2fs_fs.h:360:16: error: flexible array member in a struct with no named members
     360 |         __le32 addr[];                  /* array of data block address */
         |                ^~~~
   include/linux/f2fs_fs.h:365:16: error: flexible array member in a struct with no named members
     365 |         __le32 nid[];                   /* array of data block address */
         |                ^~~
   include/linux/f2fs_fs.h:404:31: error: flexible array member in a struct with no named members
     404 |         struct f2fs_nat_entry entries[];
         |                               ^~~~~~~
   include/linux/f2fs_fs.h:448:31: error: flexible array member in a struct with no named members
     448 |         struct f2fs_sit_entry entries[];
         |                               ^~~~~~~
   In file included from fs/f2fs/node.c:18:
   fs/f2fs/node.h: In function 'get_nid':
>> fs/f2fs/node.h:395:1: warning: control reaches end of non-void function [-Wreturn-type]
     395 | }
         | ^
   In file included from fs/f2fs/node.c:17:
   fs/f2fs/f2fs.h: In function 'blkaddr_in_node':
>> fs/f2fs/f2fs.h:3314:1: warning: control reaches end of non-void function [-Wreturn-type]
    3314 | }
         | ^
   fs/f2fs/f2fs.h: In function 'inline_xattr_addr':
   fs/f2fs/f2fs.h:3660:1: warning: control reaches end of non-void function [-Wreturn-type]
    3660 | }
         | ^
--
   In file included from fs/f2fs/segment.c:9:
>> include/linux/f2fs_fs.h:347:24: error: flexible array member in union
     347 |                 __le32 i_addr[];                /* data block pointers */
         |                        ^~~~~~
   include/linux/f2fs_fs.h:360:16: error: flexible array member in a struct with no named members
     360 |         __le32 addr[];                  /* array of data block address */
         |                ^~~~
   include/linux/f2fs_fs.h:365:16: error: flexible array member in a struct with no named members
     365 |         __le32 nid[];                   /* array of data block address */
         |                ^~~
   include/linux/f2fs_fs.h:404:31: error: flexible array member in a struct with no named members
     404 |         struct f2fs_nat_entry entries[];
         |                               ^~~~~~~
   include/linux/f2fs_fs.h:448:31: error: flexible array member in a struct with no named members
     448 |         struct f2fs_sit_entry entries[];
         |                               ^~~~~~~
   fs/f2fs/segment.c: In function 'f2fs_flush_sit_entries':
   fs/f2fs/segment.c:4865:37: warning: variable 'sit_offset' set but not used [-Wunused-but-set-variable]
    4865 |                         int offset, sit_offset;
         |                                     ^~~~~~~~~~
   In file included from fs/f2fs/segment.c:22:
   fs/f2fs/f2fs.h: In function 'blkaddr_in_node':
>> fs/f2fs/f2fs.h:3314:1: warning: control reaches end of non-void function [-Wreturn-type]
    3314 | }
         | ^
--
   In file included from fs/f2fs/xattr.c:19:
>> include/linux/f2fs_fs.h:347:24: error: flexible array member in union
     347 |                 __le32 i_addr[];                /* data block pointers */
         |                        ^~~~~~
   include/linux/f2fs_fs.h:360:16: error: flexible array member in a struct with no named members
     360 |         __le32 addr[];                  /* array of data block address */
         |                ^~~~
   include/linux/f2fs_fs.h:365:16: error: flexible array member in a struct with no named members
     365 |         __le32 nid[];                   /* array of data block address */
         |                ^~~
   include/linux/f2fs_fs.h:404:31: error: flexible array member in a struct with no named members
     404 |         struct f2fs_nat_entry entries[];
         |                               ^~~~~~~
   include/linux/f2fs_fs.h:448:31: error: flexible array member in a struct with no named members
     448 |         struct f2fs_sit_entry entries[];
         |                               ^~~~~~~
   In file included from fs/f2fs/xattr.c:23:
   fs/f2fs/f2fs.h: In function 'inline_xattr_addr':
   fs/f2fs/f2fs.h:3660:1: warning: control reaches end of non-void function [-Wreturn-type]
    3660 | }
         | ^
--
   In file included from f2fs/dir.c:10:
>> include/linux/f2fs_fs.h:347:24: error: flexible array member in union
     347 |                 __le32 i_addr[];                /* data block pointers */
         |                        ^~~~~~
   include/linux/f2fs_fs.h:360:16: error: flexible array member in a struct with no named members
     360 |         __le32 addr[];                  /* array of data block address */
         |                ^~~~
   include/linux/f2fs_fs.h:365:16: error: flexible array member in a struct with no named members
     365 |         __le32 nid[];                   /* array of data block address */
         |                ^~~
   include/linux/f2fs_fs.h:404:31: error: flexible array member in a struct with no named members
     404 |         struct f2fs_nat_entry entries[];
         |                               ^~~~~~~
   include/linux/f2fs_fs.h:448:31: error: flexible array member in a struct with no named members
     448 |         struct f2fs_sit_entry entries[];
         |                               ^~~~~~~
   In file included from f2fs/dir.c:15:
   f2fs/f2fs.h: In function 'blkaddr_in_node':
   f2fs/f2fs.h:3314:1: warning: control reaches end of non-void function [-Wreturn-type]
    3314 | }
         | ^
--
   In file included from f2fs/node.c:9:
>> include/linux/f2fs_fs.h:347:24: error: flexible array member in union
     347 |                 __le32 i_addr[];                /* data block pointers */
         |                        ^~~~~~
   include/linux/f2fs_fs.h:360:16: error: flexible array member in a struct with no named members
     360 |         __le32 addr[];                  /* array of data block address */
         |                ^~~~
   include/linux/f2fs_fs.h:365:16: error: flexible array member in a struct with no named members
     365 |         __le32 nid[];                   /* array of data block address */
         |                ^~~
   include/linux/f2fs_fs.h:404:31: error: flexible array member in a struct with no named members
     404 |         struct f2fs_nat_entry entries[];
         |                               ^~~~~~~
   include/linux/f2fs_fs.h:448:31: error: flexible array member in a struct with no named members
     448 |         struct f2fs_sit_entry entries[];
         |                               ^~~~~~~
   In file included from f2fs/node.c:18:
   f2fs/node.h: In function 'get_nid':
   f2fs/node.h:395:1: warning: control reaches end of non-void function [-Wreturn-type]
     395 | }
         | ^
   In file included from f2fs/node.c:17:
   f2fs/f2fs.h: In function 'blkaddr_in_node':
   f2fs/f2fs.h:3314:1: warning: control reaches end of non-void function [-Wreturn-type]
    3314 | }
         | ^
   f2fs/f2fs.h: In function 'inline_xattr_addr':
   f2fs/f2fs.h:3660:1: warning: control reaches end of non-void function [-Wreturn-type]
    3660 | }
         | ^
--
   In file included from f2fs/segment.c:9:
>> include/linux/f2fs_fs.h:347:24: error: flexible array member in union
     347 |                 __le32 i_addr[];                /* data block pointers */
         |                        ^~~~~~
   include/linux/f2fs_fs.h:360:16: error: flexible array member in a struct with no named members
     360 |         __le32 addr[];                  /* array of data block address */
         |                ^~~~
   include/linux/f2fs_fs.h:365:16: error: flexible array member in a struct with no named members
     365 |         __le32 nid[];                   /* array of data block address */
         |                ^~~
   include/linux/f2fs_fs.h:404:31: error: flexible array member in a struct with no named members
     404 |         struct f2fs_nat_entry entries[];
         |                               ^~~~~~~
   include/linux/f2fs_fs.h:448:31: error: flexible array member in a struct with no named members
     448 |         struct f2fs_sit_entry entries[];
         |                               ^~~~~~~
   f2fs/segment.c: In function 'f2fs_flush_sit_entries':
   f2fs/segment.c:4865:37: warning: variable 'sit_offset' set but not used [-Wunused-but-set-variable]
    4865 |                         int offset, sit_offset;
         |                                     ^~~~~~~~~~
   In file included from f2fs/segment.c:22:
   f2fs/f2fs.h: In function 'blkaddr_in_node':
   f2fs/f2fs.h:3314:1: warning: control reaches end of non-void function [-Wreturn-type]
    3314 | }
         | ^
--
   In file included from f2fs/xattr.c:19:
>> include/linux/f2fs_fs.h:347:24: error: flexible array member in union
     347 |                 __le32 i_addr[];                /* data block pointers */
         |                        ^~~~~~
   include/linux/f2fs_fs.h:360:16: error: flexible array member in a struct with no named members
     360 |         __le32 addr[];                  /* array of data block address */
         |                ^~~~
   include/linux/f2fs_fs.h:365:16: error: flexible array member in a struct with no named members
     365 |         __le32 nid[];                   /* array of data block address */
         |                ^~~
   include/linux/f2fs_fs.h:404:31: error: flexible array member in a struct with no named members
     404 |         struct f2fs_nat_entry entries[];
         |                               ^~~~~~~
   include/linux/f2fs_fs.h:448:31: error: flexible array member in a struct with no named members
     448 |         struct f2fs_sit_entry entries[];
         |                               ^~~~~~~
   In file included from f2fs/xattr.c:23:
   f2fs/f2fs.h: In function 'inline_xattr_addr':
   f2fs/f2fs.h:3660:1: warning: control reaches end of non-void function [-Wreturn-type]
    3660 | }
         | ^


vim +347 include/linux/f2fs_fs.h

   297	
   298	struct f2fs_inode {
   299		__le16 i_mode;			/* file mode */
   300		__u8 i_advise;			/* file hints */
   301		__u8 i_inline;			/* file inline flags */
   302		__le32 i_uid;			/* user ID */
   303		__le32 i_gid;			/* group ID */
   304		__le32 i_links;			/* links count */
   305		__le64 i_size;			/* file size in bytes */
   306		__le64 i_blocks;		/* file size in blocks */
   307		__le64 i_atime;			/* access time */
   308		__le64 i_ctime;			/* change time */
   309		__le64 i_mtime;			/* modification time */
   310		__le32 i_atime_nsec;		/* access time in nano scale */
   311		__le32 i_ctime_nsec;		/* change time in nano scale */
   312		__le32 i_mtime_nsec;		/* modification time in nano scale */
   313		__le32 i_generation;		/* file version (for NFS) */
   314		union {
   315			__le32 i_current_depth;	/* only for directory depth */
   316			__le16 i_gc_failures;	/*
   317						 * # of gc failures on pinned file.
   318						 * only for regular files.
   319						 */
   320		};
   321		__le32 i_xattr_nid;		/* nid to save xattr */
   322		__le32 i_flags;			/* file attributes */
   323		__le32 i_pino;			/* parent inode number */
   324		__le32 i_namelen;		/* file name length */
   325		__u8 i_name[F2FS_NAME_LEN];	/* file name for SPOR */
   326		__u8 i_dir_level;		/* dentry_level for large dir */
   327	
   328		struct f2fs_extent i_ext;	/* caching a largest extent */
   329	
   330		union {
   331			struct {
   332				__le16 i_extra_isize;	/* extra inode attribute size */
   333				__le16 i_inline_xattr_size;	/* inline xattr size, unit: 4 bytes */
   334				__le32 i_projid;	/* project id */
   335				__le32 i_inode_checksum;/* inode meta checksum */
   336				__le64 i_crtime;	/* creation time */
   337				__le32 i_crtime_nsec;	/* creation time in nano scale */
   338				__le64 i_compr_blocks;	/* # of compressed blocks */
   339				__u8 i_compress_algorithm;	/* compress algorithm */
   340				__u8 i_log_cluster_size;	/* log of cluster size */
   341				__le16 i_compress_flag;		/* compress flag */
   342							/* 0 bit: chksum flag
   343							 * [8,15] bits: compress level
   344							 */
   345				__le32 i_extra_end[0];	/* for attribute size calculation */
   346			} __packed;
 > 347			__le32 i_addr[];		/* data block pointers */
   348		};
   349		/*
   350		 * __le32 i_nid[DEF_NIDS_PER_INODE];
   351		 *
   352		 * It is stored immediately before the node footer at the end of the
   353		 * filesystem block. Its offset depends on the filesystem block size, so
   354		 * locate it dynamically with F2FS_INODE_NIDS().
   355		 */
   356	} __packed;
   357	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
