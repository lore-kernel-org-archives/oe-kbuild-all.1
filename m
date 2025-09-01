Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E1B1A7264
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Sep 2025 20:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756757196; cv=none; b=kPa58wQdnDiBd5DTqCT5G/42ZbTzts38L6hnyAJfCrdLAoRQc7hHv5oJEfizZpdNu0XMZHWbVH0eZWjVUGLCO0aDayH+ApXYnC9Qg4Z2/HyN3ZLHPMkDeh+3ZT2wq1eacCa7fwc+l/v1i3hp/ZybndAN6kjdh6We3+bltjF+QPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756757196; c=relaxed/simple;
	bh=rL13/Q83wmLacmqii2/LHYDv3bSWlz1ySCx4PwOVloE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H+mDGxLwoSlhUxFAyZd1Wt4T8DLT4O4qoc+q38afrsQ1TxbnJ/lEMNdDLniBUDih7rwwJqhHYZwvNVraIzr0eH0dABMUuF2Se6bzVvVivAx/UvR+2L1sZafWLWwOF37bGAcUAD5+cFdTghmWZnRd/NVevcZKzH8o4YZ1FaI2i94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QfgJ3viZ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QfgJ3viZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756757195; x=1788293195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rL13/Q83wmLacmqii2/LHYDv3bSWlz1ySCx4PwOVloE=;
  b=QfgJ3viZhc/k78qHeb2U52yVndJd4XzDhMyI+a+QMcqvXC5PJ2xLQ/dF
   oFnpZ7d8UAlgK88ti5i8kyA02FJ3dlK7p40gbtqlSbHMdkq7mSIu9UFhp
   NqNEQTjpp8vYrGAO0yZ48aViNUdv3R8p1O/rRRMvMjFGRR0tfT+QmGUmX
   1m9uWwBMR1OaCs+25Jt8TlVsOnNntu7npeJdFLt/ZMtlsucS8HXZxQ7sz
   7ZDasm8RX5zxi9qME5w9jgxB1lDv/2yBrZ4nmSBwuzNpMq3/utMlMYMd/
   N7brXfgcfApBRkuqy2K0l7QtMKN92t4uxHJuQqLq4rXzTtV+wbZrOFi8f
   Q==;
X-CSE-ConnectionGUID: 6w32DgzNRdu5PZW0GSuqjA==
X-CSE-MsgGUID: D6/WqAFtSyaw+Hk8dHw71Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11540"; a="46598282"
X-IronPort-AV: E=Sophos;i="6.18,230,1751266800"; 
   d="scan'208";a="46598282"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2025 13:06:34 -0700
X-CSE-ConnectionGUID: jLzj2F2+SSmVujrsSJqa3w==
X-CSE-MsgGUID: 2j6e4MhMRUKzrACDQyiJ9w==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 01 Sep 2025 13:06:33 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utAnP-00010J-13;
	Mon, 01 Sep 2025 20:06:31 +0000
Date: Tue, 2 Sep 2025 04:05:20 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/syzbot 3/4] fs/f2fs/node.c:1528:3: error: a label can
 only be part of a statement and a declaration is not a statement
Message-ID: <202509020309.KOSXlxMX-lkp@intel.com>
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
config: s390-randconfig-002-20250902 (https://download.01.org/0day-ci/archive/20250902/202509020309.KOSXlxMX-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250902/202509020309.KOSXlxMX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509020309.KOSXlxMX-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/node.c: In function 'sanity_check_node_footer':
>> fs/f2fs/node.c:1528:3: error: a label can only be part of a statement and a declaration is not a statement
    1528 |   struct f2fs_inode *ri = &F2FS_NODE(folio)->i;
         |   ^~~~~~
>> fs/f2fs/node.c:1529:3: error: expected expression before 'umode_t'
    1529 |   umode_t m = le16_to_cpu(ri->i_mode);
         |   ^~~~~~~
   In file included from include/linux/stat.h:7,
                    from include/linux/fs.h:11,
                    from fs/f2fs/node.c:8:
>> fs/f2fs/node.c:1532:17: error: 'm' undeclared (first use in this function); did you mean 'tm'?
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
   fs/f2fs/node.c:1528:22: warning: unused variable 'ri' [-Wunused-variable]
    1528 |   struct f2fs_inode *ri = &F2FS_NODE(folio)->i;
         |                      ^~


vim +1528 fs/f2fs/node.c

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
> 1529			umode_t m = le16_to_cpu(ri->i_mode);
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
