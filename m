Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D4424676D
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 18:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756749984; cv=none; b=ZYUpBx3vbloxHfzVw4loWZt797JQMDi7dF1TXlbBvY+T3mQVO7xxKqIw6xcBj2fX3ulLWdCWZShH6R2vqZ1TYudrggv6ZMnVzC8nyf0mERGfoS0445dgFKU6xj36jOOzRYJDwkvPrxKO7Nq60bmfAY9Wx8lcIJbTwefQCLAsHfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756749984; c=relaxed/simple;
	bh=uUrMCCoahgsp2fFEzqr+NUanToNpHpP6+MeMPPF1G2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QX05huGQAghvOYeL5uNnMMz+Bj/8hVtC7Ebg8V7oQlXKjpp8hLNtxOG/iklPbDx8euvmHCjgHYe3iQG2pySait6mwPxkf96jIo93srHpUo2x2/9qLXiUMNFPGGFMcW1W1ycauRnsvXP0ORE4bx/4EyjKLECi34AFq9LnmrWyPMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fn2ZT4qL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fn2ZT4qL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756749983; x=1788285983;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uUrMCCoahgsp2fFEzqr+NUanToNpHpP6+MeMPPF1G2g=;
  b=fn2ZT4qL9gjQ5sYz0VrEDnZWrJo9ay23Mjxx5Uk5GjhiUYH0A7I52Xy/
   QtiTN8zabzPwDggI4s1NI378WTQhQw/NMNMRieEyQ1nCXIDsDWwV6lwFx
   EpTAyrhPMBB8FR4AvmG2OxQbeRZrhP2UXE0jFPKhao/nPOhrSacuqt9wl
   rG/ZQ3jqglcM/8PfXWCrHZVcSJWUITxvHIvD6Quel0iI3LTPYoXXyTTQ9
   cSYA1vdmok8+iBMVM/kmwqidotWJWPf0qcoV/er+LvdLe0ULcRYak91B5
   zqHwX0SttggUrwwwSPVGW4QQJ5rdZA+tAwfz5goD/yD4W1UgB/XkCawI3
   w==;
X-CSE-ConnectionGUID: JsLSMv8zS+WjSLcFhpRPCg==
X-CSE-MsgGUID: FMafB9dWTXOJ+N5OjoOp6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="62829892"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="62829892"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 11:06:23 -0700
X-CSE-ConnectionGUID: /LWNagmvR+WXPt2GowwhoA==
X-CSE-MsgGUID: m3/uuR9kRKWQXrNRpxDtmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="175207631"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 01 Sep 2025 11:06:21 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ut8uk-0000t9-1O;
	Mon, 01 Sep 2025 18:06:05 +0000
Date: Tue, 2 Sep 2025 02:04:19 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/syzbot 3/4] fs/f2fs/node.c:1528:22: warning: unused
 variable 'ri'
Message-ID: <202509020150.NY6I0ILp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   e78352f91a47b493a1627cfb57e13c845a5da6ef
commit: 55c4622c9b2238d6a793200235bdec0f45003e35 [3/4] f2fs: fix to do sanity check on node footer before node folio writeback
config: s390-randconfig-002-20250902 (https://download.01.org/0day-ci/archive/20250902/202509020150.NY6I0ILp-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020150.NY6I0ILp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020150.NY6I0ILp-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/node.c: In function 'sanity_check_node_footer':
   fs/f2fs/node.c:1528:3: error: a label can only be part of a statement and a declaration is not a statement
    1528 |   struct f2fs_inode *ri = &F2FS_NODE(folio)->i;
         |   ^~~~~~
   fs/f2fs/node.c:1529:3: error: expected expression before 'umode_t'
    1529 |   umode_t m = le16_to_cpu(ri->i_mode);
         |   ^~~~~~~
   In file included from include/linux/stat.h:7,
                    from include/linux/fs.h:11,
                    from fs/f2fs/node.c:8:
   fs/f2fs/node.c:1532:17: error: 'm' undeclared (first use in this function); did you mean 'tm'?
    1532 |    if (!S_ISLNK(m) && !S_ISREG(m) && !S_ISDIR(m) &&
         |                 ^
   include/uapi/linux/stat.h:21:23: note: in definition of macro 'S_ISLNK'
      21 | #define S_ISLNK(m) (((m) & S_IFMT) == S_IFLNK)
         |                       ^
   fs/f2fs/node.c:1532:17: note: each undeclared identifier is reported only once for each function it appears in
    1532 |    if (!S_ISLNK(m) && !S_ISREG(m) && !S_ISDIR(m) &&
         |                 ^
   include/uapi/linux/stat.h:21:23: note: in definition of macro 'S_ISLNK'
      21 | #define S_ISLNK(m) (((m) & S_IFMT) == S_IFLNK)
         |                       ^
>> fs/f2fs/node.c:1528:22: warning: unused variable 'ri' [-Wunused-variable]
    1528 |   struct f2fs_inode *ri = &F2FS_NODE(folio)->i;
         |                      ^~


vim +/ri +1528 fs/f2fs/node.c

  1502	
  1503	static int sanity_check_node_footer(struct f2fs_sb_info *sbi,
  1504						struct folio *folio, pgoff_t nid,
  1505						enum node_type ntype)
  1506	{
  1507		bool is_inode;
  1508	
  1509		if (unlikely(nid != nid_of_node(folio)))
  1510			goto out_err;
  1511	
  1512		is_inode = IS_INODE(folio);
  1513	
  1514		switch (ntype) {
  1515		case NODE_TYPE_INODE:
  1516			if (!is_inode)
  1517				goto out_err;
  1518			break;
  1519		case NODE_TYPE_XATTR:
  1520			if (is_inode || !f2fs_has_xattr_block(ofs_of_node(folio)))
  1521				goto out_err;
  1522			break;
  1523		case NODE_TYPE_NON_INODE:
  1524			if (is_inode)
  1525				goto out_err;
  1526			break;
  1527		case NODE_TYPE_UNKNOWN:
> 1528			struct f2fs_inode *ri = &F2FS_NODE(folio)->i;
  1529			umode_t m = le16_to_cpu(ri->i_mode);
  1530	
  1531			if (is_inode) {
> 1532				if (!S_ISLNK(m) && !S_ISREG(m) && !S_ISDIR(m) &&
  1533					!S_ISCHR(m) && !S_ISBLK(m) && !S_ISFIFO(m) &&
  1534					!S_ISSOCK(m))
  1535					goto out_err;
  1536	
  1537				if (f2fs_has_xattr_block(ofs_of_node(folio)))
  1538					goto out_err;
  1539			}
  1540			break;
  1541		default:
  1542			break;
  1543		}
  1544		if (time_to_inject(sbi, FAULT_INCONSISTENT_FOOTER))
  1545			goto out_err;
  1546		return 0;
  1547	out_err:
  1548		f2fs_warn(sbi, "inconsistent node block, node_type:%d, nid:%lu, "
  1549			  "node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
  1550			  ntype, nid, nid_of_node(folio), ino_of_node(folio),
  1551			  ofs_of_node(folio), cpver_of_node(folio),
  1552			  next_blkaddr_of_node(folio));
  1553		set_sbi_flag(sbi, SBI_NEED_FSCK);
  1554		f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
  1555		return -EFSCORRUPTED;
  1556	}
  1557	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
