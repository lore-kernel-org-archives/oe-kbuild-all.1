Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F0745562F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Sep 2026 23:03:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788390187; cv=none; b=OwUwu62z27nOdToRVckzLACGDAvpMTw1LMWgeMwB+Eya9/0OpXBzCFicIso4L2NMoj1Wrqoq6rXbOGs0KTfKktVTtRttun8Bo2oIekPETiKVce1JpCae/WdgnNd+wq9tTEX8PGgM9Dkb/uZnU7HC94ap1GJgCCy1EC0NBl4WnVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788390187; c=relaxed/simple;
	bh=P/DQhsSQnBfItkAv58NkItIJfkjwqtfbywgUC2FaLsA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HZUowq8FRl1bciIE/F6PkyA4Hj9qsmPop1wOSbsR16+98XVJeBv8WDAZgA6bm3a2lCkBwCYB4KEv949mK95+poCA+2mC+DGyLugdGhvaz2G0Jyy+2p0v/FdYt7c2W21rYUVByyjAnUY7ofjXXVuEOjt84JHz+z/fVaCCZr1F8d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaQo9dC/; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaQo9dC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788390185; x=1819926185;
  h=date:from:to:cc:subject:message-id;
  bh=P/DQhsSQnBfItkAv58NkItIJfkjwqtfbywgUC2FaLsA=;
  b=kaQo9dC/o54bTne1R3T2PdNTeitU2DW2iNTOs2wB8XjDi0NC58Ikd1mQ
   f1jWfYqzUttos7oFND/Or3HHBU50KMdI3D2gpCxq5yWTTCmoWHolIvMwL
   3AcrqaoM+LeX6uVMwze7bV5a06Rj5kogLGgONDBYMRLqZyrScMvWEJCkr
   +A7s6P3JQI4W+twYg4zKKLdhmIdpnj6gNATLOuYuScMb8tYcmhK5MXtpF
   3Qz64372NcQj9V17+X/wIgjeaSxu5Kf6y1su6/pBWbLP/qtN1Ha0zSLfO
   jW5MZlX22q4b/A+tnjRep0qkfEx2lyeeiojLixk76OQOdM6Nxo3VnWbaX
   g==;
X-CSE-ConnectionGUID: KRX/5cYHT3eTLgn03f47ew==
X-CSE-MsgGUID: w2VtlHwBSE+6wqtB4vZAqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="89073408"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="89073408"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 16:03:05 -0700
X-CSE-ConnectionGUID: dZRCeyobRFG3rlgZtDV8vQ==
X-CSE-MsgGUID: eWQDQlpjQveAS1n2bZE+4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="274830467"
Received: from lkp-server01.sh.intel.com (HELO bfac249b2189) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Sep 2026 16:03:02 -0700
Received: from kbuild by bfac249b2189 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x1tyt-000000003QQ-3Tp3;
	Wed, 02 Sep 2026 23:02:59 +0000
Date: Thu, 03 Sep 2026 07:02:20 +0800
From: kernel test robot <lkp@intel.com>
To: Kelvin Zhang <zhangxp1998@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:feature/subpage 6/11] include/linux/f2fs_fs.h:355:10:
 error: expected specifier-qualifier-list before '*' token
Message-ID: <202609030729.7FKoWEcV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/subpage
head:   05dd03eec5caa963c1e263a691bf1dbf8a000ab0
commit: 35efac586a7c1770bcc04911f78bcb8eb8b9bf3d [6/11] f2fs: describe {i, d, id}node block layout dynamically
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20260903/202609030729.7FKoWEcV-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260903/202609030729.7FKoWEcV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609030729.7FKoWEcV-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:10:
>> include/linux/f2fs_fs.h:353:49: warning: '/*' within comment [-Wcomment]
     353 |          * __le32 i_nid[DEF_NIDS_PER_INODE];    /* direct(2), indirect(2),
>> include/linux/f2fs_fs.h:355:10: error: expected specifier-qualifier-list before '*' token
     355 |          *
         |          ^
   In file included from fs/f2fs/dir.c:15:
   fs/f2fs/f2fs.h:2254:9: warning: 'DEF_ADDRS_PER_BLOCK' redefined
    2254 | #define DEF_ADDRS_PER_BLOCK(sbi)        ((sbi)->addrs_per_block)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/f2fs_fs.h:279:9: note: this is the location of the previous definition
     279 | #define DEF_ADDRS_PER_BLOCK     ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
         |         ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:2255:9: warning: 'NIDS_PER_BLOCK' redefined
    2255 | #define NIDS_PER_BLOCK(sbi)             ((sbi)->nids_per_block)
         |         ^~~~~~~~~~~~~~
   include/linux/f2fs_fs.h:282:9: note: this is the location of the previous definition
     282 | #define NIDS_PER_BLOCK          ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
         |         ^~~~~~~~~~~~~~
   fs/f2fs/f2fs.h: In function 'addrs_per_page':
   fs/f2fs/f2fs.h:3647:58: error: 'DEF_ADDRS_PER_BLOCK' undeclared (first use in this function)
    3647 |                         get_inline_xattr_addrs(inode)) : DEF_ADDRS_PER_BLOCK;
         |                                                          ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3647:58: note: 'DEF_ADDRS_PER_BLOCK' is a function-like macro and might be used incorrectly
   fs/f2fs/f2fs.h:3647:58: note: each undeclared identifier is reported only once for each function it appears in
   In file included from fs/f2fs/dir.c:16:
   fs/f2fs/node.h: In function 'IS_DNODE':
   fs/f2fs/node.h:360:36: error: 'NIDS_PER_BLOCK' undeclared (first use in this function)
     360 |         if (ofs == 3 || ofs == 4 + NIDS_PER_BLOCK ||
         |                                    ^~~~~~~~~~~~~~
   fs/f2fs/node.h:360:36: note: 'NIDS_PER_BLOCK' is a function-like macro and might be used incorrectly
--
   In file included from fs/f2fs/inode.c:9:
>> include/linux/f2fs_fs.h:353:49: warning: '/*' within comment [-Wcomment]
     353 |          * __le32 i_nid[DEF_NIDS_PER_INODE];    /* direct(2), indirect(2),
>> include/linux/f2fs_fs.h:355:10: error: expected specifier-qualifier-list before '*' token
     355 |          *
         |          ^
   In file included from fs/f2fs/inode.c:17:
   fs/f2fs/f2fs.h:2254:9: warning: 'DEF_ADDRS_PER_BLOCK' redefined
    2254 | #define DEF_ADDRS_PER_BLOCK(sbi)        ((sbi)->addrs_per_block)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/f2fs_fs.h:279:9: note: this is the location of the previous definition
     279 | #define DEF_ADDRS_PER_BLOCK     ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
         |         ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:2255:9: warning: 'NIDS_PER_BLOCK' redefined
    2255 | #define NIDS_PER_BLOCK(sbi)             ((sbi)->nids_per_block)
         |         ^~~~~~~~~~~~~~
   include/linux/f2fs_fs.h:282:9: note: this is the location of the previous definition
     282 | #define NIDS_PER_BLOCK          ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
         |         ^~~~~~~~~~~~~~
   fs/f2fs/f2fs.h: In function 'addrs_per_page':
   fs/f2fs/f2fs.h:3647:58: error: 'DEF_ADDRS_PER_BLOCK' undeclared (first use in this function)
    3647 |                         get_inline_xattr_addrs(inode)) : DEF_ADDRS_PER_BLOCK;
         |                                                          ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3647:58: note: 'DEF_ADDRS_PER_BLOCK' is a function-like macro and might be used incorrectly
   fs/f2fs/f2fs.h:3647:58: note: each undeclared identifier is reported only once for each function it appears in
   In file included from fs/f2fs/inode.c:18:
   fs/f2fs/node.h: In function 'IS_DNODE':
   fs/f2fs/node.h:360:36: error: 'NIDS_PER_BLOCK' undeclared (first use in this function)
     360 |         if (ofs == 3 || ofs == 4 + NIDS_PER_BLOCK ||
         |                                    ^~~~~~~~~~~~~~
   fs/f2fs/node.h:360:36: note: 'NIDS_PER_BLOCK' is a function-like macro and might be used incorrectly
   In file included from fs/f2fs/inode.c:20:
   fs/f2fs/inode.c: In function 'sanity_check_inode':
   fs/f2fs/xattr.h:88:26: error: 'DEF_ADDRS_PER_INODE' undeclared (first use in this function)
      88 |                         (DEF_ADDRS_PER_INODE -                          \
         |                          ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/inode.c:340:44: note: in expansion of macro 'MAX_INLINE_XATTR_SIZE'
     340 |                 (fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE ||
         |                                            ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.h:88:26: note: 'DEF_ADDRS_PER_INODE' is a function-like macro and might be used incorrectly
   fs/f2fs/inode.c:340:44: note: in expansion of macro 'MAX_INLINE_XATTR_SIZE'
     340 |                 (fi->i_inline_xattr_size > MAX_INLINE_XATTR_SIZE ||
         |                                            ^~~~~~~~~~~~~~~~~~~~~
--
   In file included from fs/f2fs/hash.c:14:
>> include/linux/f2fs_fs.h:353:49: warning: '/*' within comment [-Wcomment]
     353 |          * __le32 i_nid[DEF_NIDS_PER_INODE];    /* direct(2), indirect(2),
>> include/linux/f2fs_fs.h:355:10: error: expected specifier-qualifier-list before '*' token
     355 |          *
         |          ^
   In file included from fs/f2fs/hash.c:18:
   fs/f2fs/f2fs.h:2254:9: warning: 'DEF_ADDRS_PER_BLOCK' redefined
    2254 | #define DEF_ADDRS_PER_BLOCK(sbi)        ((sbi)->addrs_per_block)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/f2fs_fs.h:279:9: note: this is the location of the previous definition
     279 | #define DEF_ADDRS_PER_BLOCK     ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
         |         ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:2255:9: warning: 'NIDS_PER_BLOCK' redefined
    2255 | #define NIDS_PER_BLOCK(sbi)             ((sbi)->nids_per_block)
         |         ^~~~~~~~~~~~~~
   include/linux/f2fs_fs.h:282:9: note: this is the location of the previous definition
     282 | #define NIDS_PER_BLOCK          ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
         |         ^~~~~~~~~~~~~~
   fs/f2fs/f2fs.h: In function 'addrs_per_page':
   fs/f2fs/f2fs.h:3647:58: error: 'DEF_ADDRS_PER_BLOCK' undeclared (first use in this function)
    3647 |                         get_inline_xattr_addrs(inode)) : DEF_ADDRS_PER_BLOCK;
         |                                                          ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3647:58: note: 'DEF_ADDRS_PER_BLOCK' is a function-like macro and might be used incorrectly
   fs/f2fs/f2fs.h:3647:58: note: each undeclared identifier is reported only once for each function it appears in
--
   In file included from fs/f2fs/super.c:23:
>> include/linux/f2fs_fs.h:353:49: warning: '/*' within comment [-Wcomment]
     353 |          * __le32 i_nid[DEF_NIDS_PER_INODE];    /* direct(2), indirect(2),
>> include/linux/f2fs_fs.h:355:10: error: expected specifier-qualifier-list before '*' token
     355 |          *
         |          ^
   In file included from fs/f2fs/super.c:34:
   fs/f2fs/f2fs.h:2254:9: warning: 'DEF_ADDRS_PER_BLOCK' redefined
    2254 | #define DEF_ADDRS_PER_BLOCK(sbi)        ((sbi)->addrs_per_block)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/f2fs_fs.h:279:9: note: this is the location of the previous definition
     279 | #define DEF_ADDRS_PER_BLOCK     ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
         |         ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:2255:9: warning: 'NIDS_PER_BLOCK' redefined
    2255 | #define NIDS_PER_BLOCK(sbi)             ((sbi)->nids_per_block)
         |         ^~~~~~~~~~~~~~
   include/linux/f2fs_fs.h:282:9: note: this is the location of the previous definition
     282 | #define NIDS_PER_BLOCK          ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
         |         ^~~~~~~~~~~~~~
   fs/f2fs/f2fs.h: In function 'addrs_per_page':
   fs/f2fs/f2fs.h:3647:58: error: 'DEF_ADDRS_PER_BLOCK' undeclared (first use in this function)
    3647 |                         get_inline_xattr_addrs(inode)) : DEF_ADDRS_PER_BLOCK;
         |                                                          ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3647:58: note: 'DEF_ADDRS_PER_BLOCK' is a function-like macro and might be used incorrectly
   fs/f2fs/f2fs.h:3647:58: note: each undeclared identifier is reported only once for each function it appears in
   In file included from fs/f2fs/super.c:35:
   fs/f2fs/node.h: In function 'IS_DNODE':
   fs/f2fs/node.h:360:36: error: 'NIDS_PER_BLOCK' undeclared (first use in this function)
     360 |         if (ofs == 3 || ofs == 4 + NIDS_PER_BLOCK ||
         |                                    ^~~~~~~~~~~~~~
   fs/f2fs/node.h:360:36: note: 'NIDS_PER_BLOCK' is a function-like macro and might be used incorrectly
   In file included from fs/f2fs/super.c:37:
   fs/f2fs/super.c: In function 'f2fs_parse_param':
   fs/f2fs/xattr.h:88:26: error: 'DEF_ADDRS_PER_INODE' undeclared (first use in this function)
      88 |                         (DEF_ADDRS_PER_INODE -                          \
         |                          ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/super.c:858:41: note: in expansion of macro 'MAX_INLINE_XATTR_SIZE'
     858 |                         result.int_32 > MAX_INLINE_XATTR_SIZE) {
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/xattr.h:88:26: note: 'DEF_ADDRS_PER_INODE' is a function-like macro and might be used incorrectly
   fs/f2fs/super.c:858:41: note: in expansion of macro 'MAX_INLINE_XATTR_SIZE'
     858 |                         result.int_32 > MAX_INLINE_XATTR_SIZE) {
         |                                         ^~~~~~~~~~~~~~~~~~~~~
   fs/f2fs/super.c: In function 'max_file_blocks':
   fs/f2fs/super.c:3889:30: error: 'DEF_ADDRS_PER_BLOCK' undeclared (first use in this function)
    3889 |                 leaf_count = DEF_ADDRS_PER_BLOCK;
         |                              ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/super.c:3889:30: note: 'DEF_ADDRS_PER_BLOCK' is a function-like macro and might be used incorrectly
   fs/f2fs/super.c:3895:23: error: 'NIDS_PER_BLOCK' undeclared (first use in this function)
    3895 |         leaf_count *= NIDS_PER_BLOCK;
         |                       ^~~~~~~~~~~~~~
   fs/f2fs/super.c:3895:23: note: 'NIDS_PER_BLOCK' is a function-like macro and might be used incorrectly
--
   In file included from fs/f2fs/gc.c:11:
>> include/linux/f2fs_fs.h:353:49: warning: '/*' within comment [-Wcomment]
     353 |          * __le32 i_nid[DEF_NIDS_PER_INODE];    /* direct(2), indirect(2),
>> include/linux/f2fs_fs.h:355:10: error: expected specifier-qualifier-list before '*' token
     355 |          *
         |          ^
   In file included from fs/f2fs/gc.c:19:
   fs/f2fs/f2fs.h:2254:9: warning: 'DEF_ADDRS_PER_BLOCK' redefined
    2254 | #define DEF_ADDRS_PER_BLOCK(sbi)        ((sbi)->addrs_per_block)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/f2fs_fs.h:279:9: note: this is the location of the previous definition
     279 | #define DEF_ADDRS_PER_BLOCK     ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
         |         ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:2255:9: warning: 'NIDS_PER_BLOCK' redefined
    2255 | #define NIDS_PER_BLOCK(sbi)             ((sbi)->nids_per_block)
         |         ^~~~~~~~~~~~~~
   include/linux/f2fs_fs.h:282:9: note: this is the location of the previous definition
     282 | #define NIDS_PER_BLOCK          ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
         |         ^~~~~~~~~~~~~~
   fs/f2fs/f2fs.h: In function 'addrs_per_page':
   fs/f2fs/f2fs.h:3647:58: error: 'DEF_ADDRS_PER_BLOCK' undeclared (first use in this function)
    3647 |                         get_inline_xattr_addrs(inode)) : DEF_ADDRS_PER_BLOCK;
         |                                                          ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3647:58: note: 'DEF_ADDRS_PER_BLOCK' is a function-like macro and might be used incorrectly
   fs/f2fs/f2fs.h:3647:58: note: each undeclared identifier is reported only once for each function it appears in
   In file included from fs/f2fs/gc.c:20:
   fs/f2fs/node.h: In function 'IS_DNODE':
   fs/f2fs/node.h:360:36: error: 'NIDS_PER_BLOCK' undeclared (first use in this function)
     360 |         if (ofs == 3 || ofs == 4 + NIDS_PER_BLOCK ||
         |                                    ^~~~~~~~~~~~~~
   fs/f2fs/node.h:360:36: note: 'NIDS_PER_BLOCK' is a function-like macro and might be used incorrectly
   fs/f2fs/gc.c: In function 'f2fs_start_bidx_of_node':
   fs/f2fs/gc.c:1126:42: error: 'NIDS_PER_BLOCK' undeclared (first use in this function)
    1126 |         unsigned int indirect_blks = 2 * NIDS_PER_BLOCK + 4;
         |                                          ^~~~~~~~~~~~~~
   fs/f2fs/gc.c:1126:42: note: 'NIDS_PER_BLOCK' is a function-like macro and might be used incorrectly
   fs/f2fs/gc.c: In function 'is_alive':
   fs/f2fs/gc.c:1182:29: error: 'DEF_ADDRS_PER_BLOCK' undeclared (first use in this function)
    1182 |                 max_addrs = DEF_ADDRS_PER_BLOCK;
         |                             ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/gc.c:1182:29: note: 'DEF_ADDRS_PER_BLOCK' is a function-like macro and might be used incorrectly
--
   In file included from fs/f2fs/node.c:9:
>> include/linux/f2fs_fs.h:353:49: warning: '/*' within comment [-Wcomment]
     353 |          * __le32 i_nid[DEF_NIDS_PER_INODE];    /* direct(2), indirect(2),
>> include/linux/f2fs_fs.h:355:10: error: expected specifier-qualifier-list before '*' token
     355 |          *
         |          ^
   In file included from fs/f2fs/node.c:17:
   fs/f2fs/f2fs.h:2254:9: warning: 'DEF_ADDRS_PER_BLOCK' redefined
    2254 | #define DEF_ADDRS_PER_BLOCK(sbi)        ((sbi)->addrs_per_block)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/f2fs_fs.h:279:9: note: this is the location of the previous definition
     279 | #define DEF_ADDRS_PER_BLOCK     ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
         |         ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:2255:9: warning: 'NIDS_PER_BLOCK' redefined
    2255 | #define NIDS_PER_BLOCK(sbi)             ((sbi)->nids_per_block)
         |         ^~~~~~~~~~~~~~
   include/linux/f2fs_fs.h:282:9: note: this is the location of the previous definition
     282 | #define NIDS_PER_BLOCK          ((F2FS_BLKSIZE - sizeof(struct node_footer)) / sizeof(__le32))
         |         ^~~~~~~~~~~~~~
   fs/f2fs/f2fs.h: In function 'addrs_per_page':
   fs/f2fs/f2fs.h:3647:58: error: 'DEF_ADDRS_PER_BLOCK' undeclared (first use in this function)
    3647 |                         get_inline_xattr_addrs(inode)) : DEF_ADDRS_PER_BLOCK;
         |                                                          ^~~~~~~~~~~~~~~~~~~
   fs/f2fs/f2fs.h:3647:58: note: 'DEF_ADDRS_PER_BLOCK' is a function-like macro and might be used incorrectly
   fs/f2fs/f2fs.h:3647:58: note: each undeclared identifier is reported only once for each function it appears in
   In file included from fs/f2fs/node.c:18:
   fs/f2fs/node.h: In function 'IS_DNODE':
   fs/f2fs/node.h:360:36: error: 'NIDS_PER_BLOCK' undeclared (first use in this function)
     360 |         if (ofs == 3 || ofs == 4 + NIDS_PER_BLOCK ||
         |                                    ^~~~~~~~~~~~~~
   fs/f2fs/node.h:360:36: note: 'NIDS_PER_BLOCK' is a function-like macro and might be used incorrectly
   In file included from include/linux/nodemask.h:92,
                    from include/linux/list_lru.h:12,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from fs/f2fs/node.c:8:
   fs/f2fs/node.c: In function 'f2fs_ra_node_pages':
   fs/f2fs/node.c:694:29: error: 'NIDS_PER_BLOCK' undeclared (first use in this function)
     694 |         end = min(end, (int)NIDS_PER_BLOCK);
         |                             ^~~~~~~~~~~~~~
   include/linux/minmax.h:92:35: note: in definition of macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                                   ^
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/node.c:694:15: note: in expansion of macro 'min'
     694 |         end = min(end, (int)NIDS_PER_BLOCK);
         |               ^~~
   fs/f2fs/node.c:694:29: note: 'NIDS_PER_BLOCK' is a function-like macro and might be used incorrectly
   include/linux/minmax.h:92:35: note: in definition of macro '__careful_cmp_once'
      92 |         auto ux = (x); auto uy = (y);                   \
         |                                   ^
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/node.c:694:15: note: in expansion of macro 'min'
     694 |         end = min(end, (int)NIDS_PER_BLOCK);
         |               ^~~
   In file included from <command-line>:
   include/linux/compiler.h:165:17: error: '__UNIQUE_ID_y__473' undeclared (first use in this function); did you mean '__UNIQUE_ID_x__472'?
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |                 ^~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/minmax.h:93:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |         ^~~~~~~~~~~~~~~~
   include/linux/minmax.h:49:25: note: in expansion of macro 'is_signed_type'
      49 | #define __sign_use(ux) (is_signed_type(typeof(ux)) ? \
         |                         ^~~~~~~~~~~~~~
   include/linux/minmax.h:75:27: note: in expansion of macro '__sign_use'
      75 |         (__sign_use(ux) & __sign_use(uy))
         |                           ^~~~~~~~~~
   include/linux/minmax.h:93:27: note: in expansion of macro '__types_ok'
      93 |         BUILD_BUG_ON_MSG(!__types_ok(ux, uy),           \
         |                           ^~~~~~~~~~
   include/linux/minmax.h:98:9: note: in expansion of macro '__careful_cmp_once'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |         ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:16:23: note: in expansion of macro '___PASTE'
      16 | #define __PASTE(a, b) ___PASTE(a, b)
         |                       ^~~~~~~~
   include/linux/compiler.h:165:9: note: in expansion of macro '__PASTE'
     165 |         __PASTE(__UNIQUE_ID_,                                   \
         |         ^~~~~~~
   include/linux/minmax.h:98:55: note: in expansion of macro '__UNIQUE_ID'
      98 |         __careful_cmp_once(op, x, y, __UNIQUE_ID(x_), __UNIQUE_ID(y_))
         |                                                       ^~~~~~~~~~~
   include/linux/minmax.h:105:25: note: in expansion of macro '__careful_cmp'
     105 | #define min(x, y)       __careful_cmp(min, x, y)
         |                         ^~~~~~~~~~~~~
   fs/f2fs/node.c:694:15: note: in expansion of macro 'min'
     694 |         end = min(end, (int)NIDS_PER_BLOCK);
         |               ^~~
   include/linux/minmax.h:71:17: error: first argument to '__builtin_choose_expr' not a constant
..


vim +355 include/linux/f2fs_fs.h

   300	
   301	struct f2fs_inode {
   302		__le16 i_mode;			/* file mode */
   303		__u8 i_advise;			/* file hints */
   304		__u8 i_inline;			/* file inline flags */
   305		__le32 i_uid;			/* user ID */
   306		__le32 i_gid;			/* group ID */
   307		__le32 i_links;			/* links count */
   308		__le64 i_size;			/* file size in bytes */
   309		__le64 i_blocks;		/* file size in blocks */
   310		__le64 i_atime;			/* access time */
   311		__le64 i_ctime;			/* change time */
   312		__le64 i_mtime;			/* modification time */
   313		__le32 i_atime_nsec;		/* access time in nano scale */
   314		__le32 i_ctime_nsec;		/* change time in nano scale */
   315		__le32 i_mtime_nsec;		/* modification time in nano scale */
   316		__le32 i_generation;		/* file version (for NFS) */
   317		union {
   318			__le32 i_current_depth;	/* only for directory depth */
   319			__le16 i_gc_failures;	/*
   320						 * # of gc failures on pinned file.
   321						 * only for regular files.
   322						 */
   323		};
   324		__le32 i_xattr_nid;		/* nid to save xattr */
   325		__le32 i_flags;			/* file attributes */
   326		__le32 i_pino;			/* parent inode number */
   327		__le32 i_namelen;		/* file name length */
   328		__u8 i_name[F2FS_NAME_LEN];	/* file name for SPOR */
   329		__u8 i_dir_level;		/* dentry_level for large dir */
   330	
   331		struct f2fs_extent i_ext;	/* caching a largest extent */
   332	
   333		union {
   334			struct {
   335				__le16 i_extra_isize;	/* extra inode attribute size */
   336				__le16 i_inline_xattr_size;	/* inline xattr size, unit: 4 bytes */
   337				__le32 i_projid;	/* project id */
   338				__le32 i_inode_checksum;/* inode meta checksum */
   339				__le64 i_crtime;	/* creation time */
   340				__le32 i_crtime_nsec;	/* creation time in nano scale */
   341				__le64 i_compr_blocks;	/* # of compressed blocks */
   342				__u8 i_compress_algorithm;	/* compress algorithm */
   343				__u8 i_log_cluster_size;	/* log of cluster size */
   344				__le16 i_compress_flag;		/* compress flag */
   345							/* 0 bit: chksum flag
   346							 * [8,15] bits: compress level
   347							 */
   348				__le32 i_extra_end[0];	/* for attribute size calculation */
   349			} __packed;
   350			DECLARE_FLEX_ARRAY(__le32, i_addr); /* data block pointers */
   351		};
   352		/*
 > 353		 * __le32 i_nid[DEF_NIDS_PER_INODE];	/* direct(2), indirect(2),
   354		 *					double_indirect(1) node id */
 > 355		 *
   356		 * It is stored immediately before the node footer at the end of the
   357		 * filesystem block. Its offset depends on the filesystem block size, so
   358		 * locate it dynamically with F2FS_INODE_NIDS().
   359		 */
   360	} __packed;
   361	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
