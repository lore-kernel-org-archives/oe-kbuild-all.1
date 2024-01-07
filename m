Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A61F11720
	for <oe-kbuild-all@lists.linux.dev>; Sun,  7 Jan 2024 19:41:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g++VTIG3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704656510; x=1736192510;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QmjMldtzAidhN95QpEXbmAHcTVDV0q+0Sg6GPDhYnr0=;
  b=g++VTIG3VHQgXJuNrKv4PttDF2X0r9j/YcXsALsx8TmLJRwoaSFpSys2
   rxJoaOgtHlD/cJ7l5j8Vp4m6VH2jhV2qE5H7orpHoek+3sHiA32DqDITz
   XM1eXnDfQD3skIWQvmLy5UliB6yZthgd1IG5zhqn8HEnQdBpebDhSE6Q7
   uKsuaUADiwjNL7NJG8iO1jZnEDtAIIDKQBtJTlnNdb45SCWeKK6qvx8er
   bTkb6MliOOsWDR++ScjAG8YLpEMLpZJMcRNIFnYamBplUQd288RIV8X+5
   lhKAm4UxtlNkEbeJQQK6hdBtd4LvwGFUhA9MXTwJpyxH5Ya3a13qjw8xz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10946"; a="428936274"
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="428936274"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2024 11:41:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,339,1695711600"; 
   d="scan'208";a="15719616"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 07 Jan 2024 11:41:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rMZ1m-00044W-1b;
	Sun, 07 Jan 2024 19:41:46 +0000
Date: Mon, 8 Jan 2024 03:41:03 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-btree-cleanups 7/8] fs/xfs/libxfs/xfs_btree.c:1256:3:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202401080354.YCpgZXI0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-btree-cleanups
head:   96e3cee93fdff88908e5d39ee41b44b390a23baf
commit: 40f7bff05193f552b08efc497c5e81f9112348e5 [7/8] xfs: split out a btree type from the geom flags
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20240108/202401080354.YCpgZXI0-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 7e186d366d6c7def0543acc255931f617e76dff0)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240108/202401080354.YCpgZXI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401080354.YCpgZXI0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_btree.c:1256:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1256 |                 __u32 __owner = (__u32)owner;
         |                 ^
   1 warning generated.


vim +1256 fs/xfs/libxfs/xfs_btree.c

f5eb8e7ca58bc1 fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  1223  
5f95064be02d1b fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  1224  static void
5f95064be02d1b fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  1225  __xfs_btree_init_block(
b64f3a390d3477 fs/xfs/xfs_btree.c        Dave Chinner      2012-11-13  1226  	struct xfs_mount	*mp,
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1227  	struct xfs_btree_block	*buf,
c1f1f8904b933c fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  1228  	const struct xfs_btree_ops *ops,
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1229  	xfs_daddr_t		blkno,
b64f3a390d3477 fs/xfs/xfs_btree.c        Dave Chinner      2012-11-13  1230  	__u16			level,
b64f3a390d3477 fs/xfs/xfs_btree.c        Dave Chinner      2012-11-13  1231  	__u16			numrecs,
c1f1f8904b933c fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  1232  	__u64			owner)
f5eb8e7ca58bc1 fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  1233  {
c1f1f8904b933c fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  1234  	bool			crc = ops->geom_flags & XFS_BTGEO_CRC_BLOCKS;
c1f1f8904b933c fs/xfs/libxfs/xfs_btree.c Darrick J. Wong   2023-03-06  1235  	__u32			magic = xfs_btree_magic(mp, ops);
f88ae46b09e93e fs/xfs/libxfs/xfs_btree.c Eric Sandeen      2017-01-27  1236  
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1237  	buf->bb_magic = cpu_to_be32(magic);
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1238  	buf->bb_level = cpu_to_be16(level);
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1239  	buf->bb_numrecs = cpu_to_be16(numrecs);
f5eb8e7ca58bc1 fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  1240  
40f7bff05193f5 fs/xfs/libxfs/xfs_btree.c Christoph Hellwig 2024-01-06  1241  	switch (ops->type) {
40f7bff05193f5 fs/xfs/libxfs/xfs_btree.c Christoph Hellwig 2024-01-06  1242  	case XFS_BTREE_TYPE_INODE:
40f7bff05193f5 fs/xfs/libxfs/xfs_btree.c Christoph Hellwig 2024-01-06  1243  	case XFS_BTREE_TYPE_MEM:
d5cf09baced0ef fs/xfs/libxfs/xfs_btree.c Christoph Hellwig 2014-07-30  1244  		buf->bb_u.l.bb_leftsib = cpu_to_be64(NULLFSBLOCK);
d5cf09baced0ef fs/xfs/libxfs/xfs_btree.c Christoph Hellwig 2014-07-30  1245  		buf->bb_u.l.bb_rightsib = cpu_to_be64(NULLFSBLOCK);
f88ae46b09e93e fs/xfs/libxfs/xfs_btree.c Eric Sandeen      2017-01-27  1246  		if (crc) {
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1247  			buf->bb_u.l.bb_blkno = cpu_to_be64(blkno);
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1248  			buf->bb_u.l.bb_owner = cpu_to_be64(owner);
ce748eaa65f2e9 fs/xfs/libxfs/xfs_btree.c Eric Sandeen      2015-07-29  1249  			uuid_copy(&buf->bb_u.l.bb_uuid, &mp->m_sb.sb_meta_uuid);
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1250  			buf->bb_u.l.bb_pad = 0;
b58fa554e9b940 fs/xfs/xfs_btree.c        Dave Chinner      2013-08-28  1251  			buf->bb_u.l.bb_lsn = 0;
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1252  		}
40f7bff05193f5 fs/xfs/libxfs/xfs_btree.c Christoph Hellwig 2024-01-06  1253  		break;
40f7bff05193f5 fs/xfs/libxfs/xfs_btree.c Christoph Hellwig 2024-01-06  1254  	case XFS_BTREE_TYPE_AG:
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1255  		/* owner is a 32 bit value on short blocks */
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21 @1256  		__u32 __owner = (__u32)owner;
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1257  
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1258  		buf->bb_u.s.bb_leftsib = cpu_to_be32(NULLAGBLOCK);
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1259  		buf->bb_u.s.bb_rightsib = cpu_to_be32(NULLAGBLOCK);
f88ae46b09e93e fs/xfs/libxfs/xfs_btree.c Eric Sandeen      2017-01-27  1260  		if (crc) {
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1261  			buf->bb_u.s.bb_blkno = cpu_to_be64(blkno);
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1262  			buf->bb_u.s.bb_owner = cpu_to_be32(__owner);
ce748eaa65f2e9 fs/xfs/libxfs/xfs_btree.c Eric Sandeen      2015-07-29  1263  			uuid_copy(&buf->bb_u.s.bb_uuid, &mp->m_sb.sb_meta_uuid);
b58fa554e9b940 fs/xfs/xfs_btree.c        Dave Chinner      2013-08-28  1264  			buf->bb_u.s.bb_lsn = 0;
ee1a47ab0e7760 fs/xfs/xfs_btree.c        Christoph Hellwig 2013-04-21  1265  		}
40f7bff05193f5 fs/xfs/libxfs/xfs_btree.c Christoph Hellwig 2024-01-06  1266  		break;
f5eb8e7ca58bc1 fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  1267  	}
f5eb8e7ca58bc1 fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  1268  }
f5eb8e7ca58bc1 fs/xfs/xfs_btree.c        Christoph Hellwig 2008-10-30  1269  

:::::: The code at line 1256 was first introduced by commit
:::::: ee1a47ab0e77600fcbdf1c87d461bd8f3f63150d xfs: add support for large btree blocks

:::::: TO: Christoph Hellwig <hch@lst.de>
:::::: CC: Ben Myers <bpm@sgi.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
