Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A95334E75E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 15:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987141; cv=none; b=GE7pODhVhb1Dp6g2zvwHOKsviLGeIiDTXPVwyV5yitk3gk8n33WzCDtbrH/kReis5os502tGlYXIdheudX4rsCiMV/h34BW90BveBfDm7Azm3vyIqoa/z8KePGG3woA5pJTiOKn7uycQx3SOzFiiYs+VqDiCii1nSvQlL5B9kZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987141; c=relaxed/simple;
	bh=JEEMESs8WoaqEtgyUZHrNbby9FqWwERVv2PccHLdBH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZcbcXRlhjIxCurEhrtv6peNW9qT7DSm8UthNXKkCP+qdCrgLRsf4f1ALr+kIxCyxU51iqJYk+dXGtggKGVAE543UmTNO0ckcGl4o4HIqDoBIDn89B5e3xWK/D1l3StKW3UdgWpt76NpjeQP7yWZQmbDjRt86l92kQ1/MB4ZpC2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=fail smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PGU9OrIZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PGU9OrIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765987139; x=1797523139;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JEEMESs8WoaqEtgyUZHrNbby9FqWwERVv2PccHLdBH8=;
  b=PGU9OrIZ1QM/8ruu+BNn7gAGKBUioaagZHNjpENitEPs19E99dR9UfE1
   nkoj+FpaSCPGonqpToZ8WaIfY+8PEifTx8XUr+kGT/7l0oq5WzbIXPYVU
   9D2MQUYu+Spzk8/C+jrSQbPmxWKgT8vpnfPfedfb8BH55i5QWuS0fYTkH
   5CFUgYkopHWPH0iFyzGIhClE5LoSsyXniCNF0inRpPLJcMV/ZP+6T7SBc
   LiJH4g7zgaP3ncAF5rAjjB/IUc8iL/JCiRnEpiyWCsrytFoh5Tyyrv05+
   aLjEOAHgwL9m59xsnDEzKgbO0OMjCjFqFyaftDto4IEdSVyAQH0D+3E3r
   w==;
X-CSE-ConnectionGUID: xmXI+U84SYKeIVBXYNgoCg==
X-CSE-MsgGUID: qxegcvEETXeGRo8nHuuAXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="78566104"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="78566104"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 07:58:56 -0800
X-CSE-ConnectionGUID: NYn6yBqRQZmu6uPpltuZfA==
X-CSE-MsgGUID: EZbOZWD5SI+n7rgYcZ4NEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="202529327"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Dec 2025 07:58:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVtvP-000000000rb-3kxv;
	Wed, 17 Dec 2025 15:58:51 +0000
Date: Wed, 17 Dec 2025 23:58:34 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 4/30] fs/xfs/libxfs/xfs_ag.c:91:12:
 error: use of undeclared identifier 'EFSCORRUPTED'
Message-ID: <202512172303.hE7QLIHR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   446cbdd65d84009edd9f121171953c5a5a880ce2
commit: 71e560adf7eb3432536ada866f108bdad0aaff25 [4/30] uapi: promote EFSCORRUPTED and EUCLEAN to errno.h
config: mips-jazz_defconfig (https://download.01.org/0day-ci/archive/20251217/202512172303.hE7QLIHR-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251217/202512172303.hE7QLIHR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512172303.hE7QLIHR-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_ag.c:91:12: error: use of undeclared identifier 'EFSCORRUPTED'
      91 |                 error = -EFSCORRUPTED;
         |                          ^
   fs/xfs/libxfs/xfs_ag.c:207:11: error: use of undeclared identifier 'EFSCORRUPTED'
     207 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_ag.c:777:11: error: use of undeclared identifier 'EFSCORRUPTED'
     777 |                 return -EFSCORRUPTED;
         |                         ^
   3 errors generated.
--
>> fs/xfs/libxfs/xfs_alloc.c:281:10: error: use of undeclared identifier 'EFSCORRUPTED'
     281 |         return -EFSCORRUPTED;
         |                 ^
   fs/xfs/libxfs/xfs_alloc.c:520:11: error: use of undeclared identifier 'EFSCORRUPTED'
     520 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_alloc.c:607:12: error: use of undeclared identifier 'EFSCORRUPTED'
     607 |                         return -EFSCORRUPTED;
         |                                 ^
   fs/xfs/libxfs/xfs_alloc.c:630:12: error: use of undeclared identifier 'EFSCORRUPTED'
     630 |                         return -EFSCORRUPTED;
         |                                 ^
   fs/xfs/libxfs/xfs_alloc.c:683:11: error: use of undeclared identifier 'EFSCORRUPTED'
     683 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_alloc.c:693:12: error: use of undeclared identifier 'EFSCORRUPTED'
     693 |                         return -EFSCORRUPTED;
         |                                 ^
   fs/xfs/libxfs/xfs_alloc.c:699:12: error: use of undeclared identifier 'EFSCORRUPTED'
     699 |                         return -EFSCORRUPTED;
         |                                 ^
   fs/xfs/libxfs/xfs_alloc.c:707:12: error: use of undeclared identifier 'EFSCORRUPTED'
     707 |                         return -EFSCORRUPTED;
         |                                 ^
   fs/xfs/libxfs/xfs_alloc.c:713:12: error: use of undeclared identifier 'EFSCORRUPTED'
     713 |                         return -EFSCORRUPTED;
         |                                 ^
   fs/xfs/libxfs/xfs_alloc.c:727:12: error: use of undeclared identifier 'EFSCORRUPTED'
     727 |                         return -EFSCORRUPTED;
         |                                 ^
   fs/xfs/libxfs/xfs_alloc.c:744:12: error: use of undeclared identifier 'EFSCORRUPTED'
     744 |                         return -EFSCORRUPTED;
         |                                 ^
   fs/xfs/libxfs/xfs_alloc.c:750:12: error: use of undeclared identifier 'EFSCORRUPTED'
     750 |                         return -EFSCORRUPTED;
         |                                 ^
>> fs/xfs/libxfs/xfs_alloc.c:832:27: error: use of undeclared identifier 'EFSBADCRC'
     832 |                 xfs_verifier_error(bp, -EFSBADCRC, __this_address);
         |                                         ^
   fs/xfs/libxfs/xfs_alloc.c:836:28: error: use of undeclared identifier 'EFSCORRUPTED'
     836 |                         xfs_verifier_error(bp, -EFSCORRUPTED, fa);
         |                                                 ^
   fs/xfs/libxfs/xfs_alloc.c:854:27: error: use of undeclared identifier 'EFSCORRUPTED'
     854 |                 xfs_verifier_error(bp, -EFSCORRUPTED, fa);
         |                                         ^
   fs/xfs/libxfs/xfs_alloc.c:888:6: error: use of undeclared identifier 'EFSCORRUPTED'
     888 |         if (xfs_metadata_is_sick(error))
         |             ^
   fs/xfs/libxfs/xfs_health.h:290:24: note: expanded from macro 'xfs_metadata_is_sick'
     290 |         (unlikely((error) == -EFSCORRUPTED || (error) == -EFSBADCRC))
         |                               ^
   fs/xfs/libxfs/xfs_alloc.c:888:6: error: use of undeclared identifier 'EFSBADCRC'
   fs/xfs/libxfs/xfs_health.h:290:52: note: expanded from macro 'xfs_metadata_is_sick'
     290 |         (unlikely((error) == -EFSCORRUPTED || (error) == -EFSBADCRC))
         |                                                           ^
   fs/xfs/libxfs/xfs_alloc.c:912:11: error: use of undeclared identifier 'EFSCORRUPTED'
     912 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_alloc.c:1029:11: error: use of undeclared identifier 'EFSCORRUPTED'
    1029 |                 return -EFSCORRUPTED;
         |                         ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> fs/xfs/libxfs/xfs_alloc_btree.c:306:27: error: use of undeclared identifier 'EFSBADCRC'
     306 |                 xfs_verifier_error(bp, -EFSBADCRC, __this_address);
         |                                         ^
>> fs/xfs/libxfs/xfs_alloc_btree.c:310:28: error: use of undeclared identifier 'EFSCORRUPTED'
     310 |                         xfs_verifier_error(bp, -EFSCORRUPTED, fa);
         |                                                 ^
   fs/xfs/libxfs/xfs_alloc_btree.c:326:27: error: use of undeclared identifier 'EFSCORRUPTED'
     326 |                 xfs_verifier_error(bp, -EFSCORRUPTED, fa);
         |                                         ^
   3 errors generated.
--
>> fs/xfs/libxfs/xfs_attr.c:822:11: error: use of undeclared identifier 'EFSCORRUPTED'
     822 |                 return -EFSCORRUPTED;
         |                         ^
   1 error generated.
--
>> fs/xfs/libxfs/xfs_attr_leaf.c:423:27: error: use of undeclared identifier 'EFSCORRUPTED'
     423 |                 xfs_verifier_error(bp, -EFSCORRUPTED, fa);
         |                                         ^
>> fs/xfs/libxfs/xfs_attr_leaf.c:451:27: error: use of undeclared identifier 'EFSBADCRC'
     451 |                 xfs_verifier_error(bp, -EFSBADCRC, __this_address);
         |                                         ^
   fs/xfs/libxfs/xfs_attr_leaf.c:455:28: error: use of undeclared identifier 'EFSCORRUPTED'
     455 |                         xfs_verifier_error(bp, -EFSCORRUPTED, fa);
         |                                                 ^
   fs/xfs/libxfs/xfs_attr_leaf.c:490:11: error: use of undeclared identifier 'EFSCORRUPTED'
     490 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_attr_leaf.c:981:13: error: use of undeclared identifier 'EFSCORRUPTED'
     981 |                         error = -EFSCORRUPTED;
         |                                  ^
   fs/xfs/libxfs/xfs_attr_leaf.c:2416:11: error: use of undeclared identifier 'EFSCORRUPTED'
    2416 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_attr_leaf.c:2436:11: error: use of undeclared identifier 'EFSCORRUPTED'
    2436 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_attr_leaf.c:2441:11: error: use of undeclared identifier 'EFSCORRUPTED'
    2441 |                 return -EFSCORRUPTED;
         |                         ^
   8 errors generated.
--
>> fs/xfs/libxfs/xfs_attr_remote.c:154:12: error: use of undeclared identifier 'EFSBADCRC'
     154 |                         return -EFSBADCRC;
         |                                 ^
>> fs/xfs/libxfs/xfs_attr_remote.c:158:12: error: use of undeclared identifier 'EFSCORRUPTED'
     158 |                         return -EFSCORRUPTED;
         |                                 ^
   fs/xfs/libxfs/xfs_attr_remote.c:166:11: error: use of undeclared identifier 'EFSCORRUPTED'
     166 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_attr_remote.c:220:28: error: use of undeclared identifier 'EFSCORRUPTED'
     220 |                         xfs_verifier_error(bp, -EFSCORRUPTED, fa);
         |                                                 ^
   fs/xfs/libxfs/xfs_attr_remote.c:229:28: error: use of undeclared identifier 'EFSCORRUPTED'
     229 |                         xfs_verifier_error(bp, -EFSCORRUPTED, __this_address);
         |                                                 ^
   fs/xfs/libxfs/xfs_attr_remote.c:240:27: error: use of undeclared identifier 'EFSCORRUPTED'
     240 |                 xfs_verifier_error(bp, -EFSCORRUPTED, __this_address);
         |                                         ^
   fs/xfs/libxfs/xfs_attr_remote.c:320:13: error: use of undeclared identifier 'EFSCORRUPTED'
     320 |                                 return -EFSCORRUPTED;
         |                                         ^
   fs/xfs/libxfs/xfs_attr_remote.c:436:8: error: use of undeclared identifier 'EFSCORRUPTED'
     436 |                         if (xfs_metadata_is_sick(error))
         |                             ^
   fs/xfs/libxfs/xfs_health.h:290:24: note: expanded from macro 'xfs_metadata_is_sick'
     290 |         (unlikely((error) == -EFSCORRUPTED || (error) == -EFSBADCRC))
         |                               ^
   fs/xfs/libxfs/xfs_attr_remote.c:436:8: error: use of undeclared identifier 'EFSBADCRC'
   fs/xfs/libxfs/xfs_health.h:290:52: note: expanded from macro 'xfs_metadata_is_sick'
     290 |         (unlikely((error) == -EFSCORRUPTED || (error) == -EFSBADCRC))
         |                                                           ^
   fs/xfs/libxfs/xfs_attr_remote.c:576:11: error: use of undeclared identifier 'EFSCORRUPTED'
     576 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_attr_remote.c:688:12: error: use of undeclared identifier 'EFSCORRUPTED'
     688 |                         return -EFSCORRUPTED;
         |                                 ^
   11 errors generated.
--
   In file included from fs/xfs/libxfs/xfs_bmap.c:22:
>> fs/xfs/xfs_bmap_util.h:30:10: error: use of undeclared identifier 'EFSCORRUPTED'
      30 |         return -EFSCORRUPTED;
         |                 ^
>> fs/xfs/libxfs/xfs_bmap.c:242:11: error: use of undeclared identifier 'EFSCORRUPTED'
     242 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_bmap.c:597:6: error: use of undeclared identifier 'EFSCORRUPTED'
     597 |         if (xfs_metadata_is_sick(error))
         |             ^
   fs/xfs/libxfs/xfs_health.h:290:24: note: expanded from macro 'xfs_metadata_is_sick'
     290 |         (unlikely((error) == -EFSCORRUPTED || (error) == -EFSBADCRC))
         |                               ^
>> fs/xfs/libxfs/xfs_bmap.c:597:6: error: use of undeclared identifier 'EFSBADCRC'
   fs/xfs/libxfs/xfs_health.h:290:52: note: expanded from macro 'xfs_metadata_is_sick'
     290 |         (unlikely((error) == -EFSCORRUPTED || (error) == -EFSBADCRC))
         |                                                           ^
   fs/xfs/libxfs/xfs_bmap.c:907:13: error: use of undeclared identifier 'EFSCORRUPTED'
     907 |                         error = -EFSCORRUPTED;
         |                                  ^
   fs/xfs/libxfs/xfs_bmap.c:991:10: error: use of undeclared identifier 'EFSCORRUPTED'
     991 |         return -EFSCORRUPTED;
         |                 ^
   fs/xfs/libxfs/xfs_bmap.c:1119:10: error: use of undeclared identifier 'EFSCORRUPTED'
    1119 |         return -EFSCORRUPTED;
         |                 ^
   fs/xfs/libxfs/xfs_bmap.c:1147:33: error: use of undeclared identifier 'EFSCORRUPTED'
    1147 |                 xfs_inode_verifier_error(ip, -EFSCORRUPTED, __func__, block,
         |                                               ^
   fs/xfs/libxfs/xfs_bmap.c:1150:11: error: use of undeclared identifier 'EFSCORRUPTED'
    1150 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_bmap.c:1162:34: error: use of undeclared identifier 'EFSCORRUPTED'
    1162 |                         xfs_inode_verifier_error(ip, -EFSCORRUPTED,
         |                                                       ^
   fs/xfs/libxfs/xfs_bmap.c:1210:12: error: use of undeclared identifier 'EFSCORRUPTED'
    1210 |                 error = -EFSCORRUPTED;
         |                          ^
   fs/xfs/libxfs/xfs_bmap.c:1222:6: error: use of undeclared identifier 'EFSCORRUPTED'
    1222 |         if (xfs_metadata_is_sick(error))
         |             ^
   fs/xfs/libxfs/xfs_health.h:290:24: note: expanded from macro 'xfs_metadata_is_sick'
     290 |         (unlikely((error) == -EFSCORRUPTED || (error) == -EFSBADCRC))
         |                               ^
   fs/xfs/libxfs/xfs_bmap.c:1222:6: error: use of undeclared identifier 'EFSBADCRC'
   fs/xfs/libxfs/xfs_health.h:290:52: note: expanded from macro 'xfs_metadata_is_sick'
     290 |         (unlikely((error) == -EFSCORRUPTED || (error) == -EFSBADCRC))
         |                                                           ^
   fs/xfs/libxfs/xfs_bmap.c:1304:11: error: use of undeclared identifier 'EFSCORRUPTED'
    1304 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_bmap.c:1402:11: error: use of undeclared identifier 'EFSCORRUPTED'
    1402 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_bmap.c:1562:14: error: use of undeclared identifier 'EFSCORRUPTED'
    1562 |                                 error = -EFSCORRUPTED;
         |                                          ^
   fs/xfs/libxfs/xfs_bmap.c:1570:14: error: use of undeclared identifier 'EFSCORRUPTED'
    1570 |                                 error = -EFSCORRUPTED;
         |                                          ^
   fs/xfs/libxfs/xfs_bmap.c:1578:14: error: use of undeclared identifier 'EFSCORRUPTED'
    1578 |                                 error = -EFSCORRUPTED;
         |                                          ^
   fs/xfs/libxfs/xfs_bmap.c:1609:14: error: use of undeclared identifier 'EFSCORRUPTED'
    1609 |                                 error = -EFSCORRUPTED;
         |                                          ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
--
>> fs/xfs/libxfs/xfs_bmap_btree.c:437:27: error: use of undeclared identifier 'EFSBADCRC'
     437 |                 xfs_verifier_error(bp, -EFSBADCRC, __this_address);
         |                                         ^
>> fs/xfs/libxfs/xfs_bmap_btree.c:441:28: error: use of undeclared identifier 'EFSCORRUPTED'
     441 |                         xfs_verifier_error(bp, -EFSCORRUPTED, fa);
         |                                                 ^
   fs/xfs/libxfs/xfs_bmap_btree.c:457:27: error: use of undeclared identifier 'EFSCORRUPTED'
     457 |                 xfs_verifier_error(bp, -EFSCORRUPTED, fa);
         |                                         ^
   3 errors generated.
--
>> fs/xfs/libxfs/xfs_btree.c:313:11: error: use of undeclared identifier 'EFSCORRUPTED'
     313 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_btree.c:326:11: error: use of undeclared identifier 'EFSCORRUPTED'
     326 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_btree.c:332:12: error: use of undeclared identifier 'EFSCORRUPTED'
     332 |                         return -EFSCORRUPTED;
         |                                 ^
   fs/xfs/libxfs/xfs_btree.c:337:12: error: use of undeclared identifier 'EFSCORRUPTED'
     337 |                         return -EFSCORRUPTED;
         |                                 ^
   fs/xfs/libxfs/xfs_btree.c:342:12: error: use of undeclared identifier 'EFSCORRUPTED'
     342 |                         return -EFSCORRUPTED;
         |                                 ^
   fs/xfs/libxfs/xfs_btree.c:488:11: error: use of undeclared identifier 'EFSCORRUPTED'
     488 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_btree.c:579:11: error: use of undeclared identifier 'EFSCORRUPTED'
     579 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_btree.c:605:8: error: use of undeclared identifier 'EFSCORRUPTED'
     605 |                         if (xfs_metadata_is_sick(error))
         |                             ^
   fs/xfs/libxfs/xfs_health.h:290:24: note: expanded from macro 'xfs_metadata_is_sick'
     290 |         (unlikely((error) == -EFSCORRUPTED || (error) == -EFSBADCRC))
         |                               ^
>> fs/xfs/libxfs/xfs_btree.c:605:8: error: use of undeclared identifier 'EFSBADCRC'
   fs/xfs/libxfs/xfs_health.h:290:52: note: expanded from macro 'xfs_metadata_is_sick'
     290 |         (unlikely((error) == -EFSCORRUPTED || (error) == -EFSBADCRC))
         |                                                           ^
   fs/xfs/libxfs/xfs_btree.c:1405:6: error: use of undeclared identifier 'EFSCORRUPTED'
    1405 |         if (xfs_metadata_is_sick(error))
         |             ^
   fs/xfs/libxfs/xfs_health.h:290:24: note: expanded from macro 'xfs_metadata_is_sick'
     290 |         (unlikely((error) == -EFSCORRUPTED || (error) == -EFSBADCRC))
         |                               ^
   fs/xfs/libxfs/xfs_btree.c:1405:6: error: use of undeclared identifier 'EFSBADCRC'
   fs/xfs/libxfs/xfs_health.h:290:52: note: expanded from macro 'xfs_metadata_is_sick'
     290 |         (unlikely((error) == -EFSCORRUPTED || (error) == -EFSBADCRC))
         |                                                           ^
   fs/xfs/libxfs/xfs_btree.c:1722:12: error: use of undeclared identifier 'EFSCORRUPTED'
    1722 |                 error = -EFSCORRUPTED;
         |                          ^
   fs/xfs/libxfs/xfs_btree.c:1816:12: error: use of undeclared identifier 'EFSCORRUPTED'
    1816 |                 error = -EFSCORRUPTED;
         |                          ^
   fs/xfs/libxfs/xfs_btree.c:1931:10: error: use of undeclared identifier 'EFSCORRUPTED'
    1931 |         return -EFSCORRUPTED;
         |                 ^
   fs/xfs/libxfs/xfs_btree.c:2000:11: error: use of undeclared identifier 'EFSCORRUPTED'
    2000 |                 return -EFSCORRUPTED;
         |                         ^
   fs/xfs/libxfs/xfs_btree.c:2045:14: error: use of undeclared identifier 'EFSCORRUPTED'
    2045 |                                         return -EFSCORRUPTED;
         |                                                 ^
   fs/xfs/libxfs/xfs_btree.c:2124:13: error: use of undeclared identifier 'EFSCORRUPTED'
    2124 |                                 return -EFSCORRUPTED;
         |                                         ^
   fs/xfs/libxfs/xfs_btree.c:2569:13: error: use of undeclared identifier 'EFSCORRUPTED'
    2569 |                         error = -EFSCORRUPTED;
         |                                  ^
   fs/xfs/libxfs/xfs_btree.c:2739:12: error: use of undeclared identifier 'EFSCORRUPTED'
    2739 |                 error = -EFSCORRUPTED;
         |                          ^
   fatal error: too many errors emitted, stopping now [-ferror-limit=]
   20 errors generated.
..


vim +/EFSCORRUPTED +91 fs/xfs/libxfs/xfs_ag.c

c4d5660afbdcd3 Dave Chinner    2023-02-13   34  
9bbafc71919adf Dave Chinner    2021-06-02   35  /*
9bbafc71919adf Dave Chinner    2021-06-02   36   * xfs_initialize_perag_data
9bbafc71919adf Dave Chinner    2021-06-02   37   *
9bbafc71919adf Dave Chinner    2021-06-02   38   * Read in each per-ag structure so we can count up the number of
9bbafc71919adf Dave Chinner    2021-06-02   39   * allocated inodes, free inodes and used filesystem blocks as this
9bbafc71919adf Dave Chinner    2021-06-02   40   * information is no longer persistent in the superblock. Once we have
9bbafc71919adf Dave Chinner    2021-06-02   41   * this information, write it into the in-core superblock structure.
9bbafc71919adf Dave Chinner    2021-06-02   42   */
9bbafc71919adf Dave Chinner    2021-06-02   43  int
9bbafc71919adf Dave Chinner    2021-06-02   44  xfs_initialize_perag_data(
9bbafc71919adf Dave Chinner    2021-06-02   45  	struct xfs_mount	*mp,
9bbafc71919adf Dave Chinner    2021-06-02   46  	xfs_agnumber_t		agcount)
9bbafc71919adf Dave Chinner    2021-06-02   47  {
9bbafc71919adf Dave Chinner    2021-06-02   48  	xfs_agnumber_t		index;
509201163fca3d Dave Chinner    2021-06-02   49  	struct xfs_perag	*pag;
509201163fca3d Dave Chinner    2021-06-02   50  	struct xfs_sb		*sbp = &mp->m_sb;
9bbafc71919adf Dave Chinner    2021-06-02   51  	uint64_t		ifree = 0;
9bbafc71919adf Dave Chinner    2021-06-02   52  	uint64_t		ialloc = 0;
9bbafc71919adf Dave Chinner    2021-06-02   53  	uint64_t		bfree = 0;
9bbafc71919adf Dave Chinner    2021-06-02   54  	uint64_t		bfreelst = 0;
9bbafc71919adf Dave Chinner    2021-06-02   55  	uint64_t		btree = 0;
9bbafc71919adf Dave Chinner    2021-06-02   56  	uint64_t		fdblocks;
9bbafc71919adf Dave Chinner    2021-06-02   57  	int			error = 0;
9bbafc71919adf Dave Chinner    2021-06-02   58  
9bbafc71919adf Dave Chinner    2021-06-02   59  	for (index = 0; index < agcount; index++) {
9bbafc71919adf Dave Chinner    2021-06-02   60  		/*
08d3e84feeb8cb Dave Chinner    2022-07-07   61  		 * Read the AGF and AGI buffers to populate the per-ag
08d3e84feeb8cb Dave Chinner    2022-07-07   62  		 * structures for us.
9bbafc71919adf Dave Chinner    2021-06-02   63  		 */
99b13c7f0bd35d Dave Chinner    2022-07-07   64  		pag = xfs_perag_get(mp, index);
08d3e84feeb8cb Dave Chinner    2022-07-07   65  		error = xfs_alloc_read_agf(pag, NULL, 0, NULL);
08d3e84feeb8cb Dave Chinner    2022-07-07   66  		if (!error)
549d3c9a29921f Darrick J. Wong 2024-04-15   67  			error = xfs_ialloc_read_agi(pag, NULL, 0, NULL);
99b13c7f0bd35d Dave Chinner    2022-07-07   68  		if (error) {
99b13c7f0bd35d Dave Chinner    2022-07-07   69  			xfs_perag_put(pag);
9bbafc71919adf Dave Chinner    2021-06-02   70  			return error;
99b13c7f0bd35d Dave Chinner    2022-07-07   71  		}
a95fee40e3d433 Dave Chinner    2022-07-07   72  
9bbafc71919adf Dave Chinner    2021-06-02   73  		ifree += pag->pagi_freecount;
9bbafc71919adf Dave Chinner    2021-06-02   74  		ialloc += pag->pagi_count;
9bbafc71919adf Dave Chinner    2021-06-02   75  		bfree += pag->pagf_freeblks;
9bbafc71919adf Dave Chinner    2021-06-02   76  		bfreelst += pag->pagf_flcount;
9bbafc71919adf Dave Chinner    2021-06-02   77  		btree += pag->pagf_btreeblks;
9bbafc71919adf Dave Chinner    2021-06-02   78  		xfs_perag_put(pag);
9bbafc71919adf Dave Chinner    2021-06-02   79  	}
9bbafc71919adf Dave Chinner    2021-06-02   80  	fdblocks = bfree + bfreelst + btree;
9bbafc71919adf Dave Chinner    2021-06-02   81  
9bbafc71919adf Dave Chinner    2021-06-02   82  	/*
9bbafc71919adf Dave Chinner    2021-06-02   83  	 * If the new summary counts are obviously incorrect, fail the
9bbafc71919adf Dave Chinner    2021-06-02   84  	 * mount operation because that implies the AGFs are also corrupt.
9bbafc71919adf Dave Chinner    2021-06-02   85  	 * Clear FS_COUNTERS so that we don't unmount with a dirty log, which
9bbafc71919adf Dave Chinner    2021-06-02   86  	 * will prevent xfs_repair from fixing anything.
9bbafc71919adf Dave Chinner    2021-06-02   87  	 */
9bbafc71919adf Dave Chinner    2021-06-02   88  	if (fdblocks > sbp->sb_dblocks || ifree > ialloc) {
9bbafc71919adf Dave Chinner    2021-06-02   89  		xfs_alert(mp, "AGF corruption. Please run xfs_repair.");
50645ce8822d23 Darrick J. Wong 2024-02-22   90  		xfs_fs_mark_sick(mp, XFS_SICK_FS_COUNTERS);
9bbafc71919adf Dave Chinner    2021-06-02  @91  		error = -EFSCORRUPTED;
9bbafc71919adf Dave Chinner    2021-06-02   92  		goto out;
9bbafc71919adf Dave Chinner    2021-06-02   93  	}
9bbafc71919adf Dave Chinner    2021-06-02   94  
9bbafc71919adf Dave Chinner    2021-06-02   95  	/* Overwrite incore superblock counters with just-read data */
9bbafc71919adf Dave Chinner    2021-06-02   96  	spin_lock(&mp->m_sb_lock);
9bbafc71919adf Dave Chinner    2021-06-02   97  	sbp->sb_ifree = ifree;
9bbafc71919adf Dave Chinner    2021-06-02   98  	sbp->sb_icount = ialloc;
9bbafc71919adf Dave Chinner    2021-06-02   99  	sbp->sb_fdblocks = fdblocks;
9bbafc71919adf Dave Chinner    2021-06-02  100  	spin_unlock(&mp->m_sb_lock);
9bbafc71919adf Dave Chinner    2021-06-02  101  
9bbafc71919adf Dave Chinner    2021-06-02  102  	xfs_reinit_percpu_counters(mp);
9bbafc71919adf Dave Chinner    2021-06-02  103  out:
9bbafc71919adf Dave Chinner    2021-06-02  104  	xfs_fs_mark_healthy(mp, XFS_SICK_FS_COUNTERS);
9bbafc71919adf Dave Chinner    2021-06-02  105  	return error;
9bbafc71919adf Dave Chinner    2021-06-02  106  }
b16817b66b6c97 Dave Chinner    2018-05-13  107  

:::::: The code at line 91 was first introduced by commit
:::::: 9bbafc71919adfdf83fafd2ce909853b493e7d86 xfs: move xfs_perag_get/put to xfs_ag.[ch]

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Dave Chinner <david@fromorbit.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
