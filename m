Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6280C476071
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 14:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786718132; cv=none; b=F/mbnd1KqZVFjYIvn3jFoIQLuP31EF94BS+VxDSxVE5KdmeWm/Pm4ab9PEJqokDxi8faN12yVxOB46nM116SIoaZs73KwYzGCELdEoqvZWm7ykL0hYPedbpY6MQqEJlrmM1g5qox9/I/FhSC6zGP1LHL7MvJA08j2am+HnubxBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786718132; c=relaxed/simple;
	bh=2tbNp6aW/4qut5v+WJUhTVtC1lyrsjaw6zeDcjrZ+eQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L9fSQQaeuNkinboxYwxkTn6U/nofatnuB0u7pOPL2z2mg9xgx8zdq53+PnU7y0PSpHEHf2Oim2t2jsDuE65MuOGCXhQSnEOYXZCc6iXfsGCNH5vUAjTpryWDdP+dwt7sG51swPtOidAUS0Cfjeyfq2u+JbSJ/BSKgD5rKGmlYDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TH7IY7yu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TH7IY7yu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786718128; x=1818254128;
  h=date:from:to:cc:subject:message-id;
  bh=2tbNp6aW/4qut5v+WJUhTVtC1lyrsjaw6zeDcjrZ+eQ=;
  b=TH7IY7yu/r3NTK3wXXT+zd6C/Kfn0t6QRLfsTmrUFDG6kIRZFQYWszeu
   R1hCK8SW9bZWM4VnlvSOpyeHZjiOEUvHSNEt6tEtutlpbRliPRWHGJqDD
   pWjhtkBOSquc5p3cgr54OlKFcR4AZ85TRCbQZNk93dSh1y4X48A5mLrEL
   VarsmeX6z36TeGAoCgoZnhYTPwtUWRLfFUoVGCExFOIxHjwY+im+iCvdh
   +PGP58HN+O2c4Pi2EZHuWojDjqsEzvurgSsFf0CNZdq2OyIf5hfdW+EGj
   66CQ57i3ob8c5QSXdC2uEWBhqUrfNuABLTbqDVYCui/Tx6kFWxtjjDEcl
   A==;
X-CSE-ConnectionGUID: xyFVJVH3QbyA+7gcjvz88w==
X-CSE-MsgGUID: nELX3o4HS8SEatAo6UCg/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="112842093"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="112842093"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 07:35:26 -0700
X-CSE-ConnectionGUID: mUuGaWB2R0q/idLOyz2KlQ==
X-CSE-MsgGUID: xVx2N6AVQiK6uUG9jS85lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="262478321"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Aug 2026 07:35:25 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wut0E-00000000ZF4-3ZUJ;
	Fri, 14 Aug 2026 14:35:22 +0000
Date: Fri, 14 Aug 2026 22:35:19 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:headers 17/18] fs/nfs/pnfs.c:1508:2: error:
 call to undeclared function 'filemap_fdatawait'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202608142241.oTd7Tj14-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/willy/pagecache headers
head:   33e73a1e8175a4735e962dec9465e64e85d0a63d
commit: 7191691f80efdfec4c2f8d87da800a18b7753e08 [17/18] nfs: Remove pagemap.h from includes
config: loongarch-defconfig (https://download.01.org/0day-ci/archive/20260814/202608142241.oTd7Tj14-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 844a18e753e822736c9805ab779144b647a2c186)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608142241.oTd7Tj14-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608142241.oTd7Tj14-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/nfs/pnfs.c:1508:2: error: call to undeclared function 'filemap_fdatawait'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1508 |         filemap_fdatawait(inode->i_mapping);
         |         ^
   1 error generated.
--
>> fs/nfs/nfs42proc.c:398:15: error: call to undeclared function 'invalidate_inode_pages2_range'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     398 |         WARN_ON_ONCE(invalidate_inode_pages2_range(mapping, pos >> PAGE_SHIFT,
         |                      ^
   fs/nfs/nfs42proc.c:398:15: note: did you mean 'truncate_inode_pages_range'?
   include/linux/mm.h:4317:6: note: 'truncate_inode_pages_range' declared here
    4317 | void truncate_inode_pages_range(struct address_space *mapping, loff_t lstart,
         |      ^
   1 error generated.
--
>> fs/nfsd/nfs4proc.c:2015:13: error: call to undeclared function 'filemap_check_wb_err'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2015 |                         status = filemap_check_wb_err(dst->f_mapping, since);
         |                                  ^
   1 error generated.
--
>> fs/nfs/blocklayout/blocklayout.c:894:9: error: call to undeclared function 'page_cache_next_miss'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     894 |                 end = page_cache_next_miss(mapping, idx + 1, ULONG_MAX);
         |                       ^
   1 error generated.


vim +/filemap_fdatawait +1508 fs/nfs/pnfs.c

cbe8260369c9f8 Benny Halevy    2011-05-22  1491  
240286725d8543 Trond Myklebust 2013-03-20  1492  int
240286725d8543 Trond Myklebust 2013-03-20  1493  pnfs_commit_and_return_layout(struct inode *inode)
240286725d8543 Trond Myklebust 2013-03-20  1494  {
240286725d8543 Trond Myklebust 2013-03-20  1495  	struct pnfs_layout_hdr *lo;
240286725d8543 Trond Myklebust 2013-03-20  1496  	int ret;
240286725d8543 Trond Myklebust 2013-03-20  1497  
240286725d8543 Trond Myklebust 2013-03-20  1498  	spin_lock(&inode->i_lock);
240286725d8543 Trond Myklebust 2013-03-20  1499  	lo = NFS_I(inode)->layout;
240286725d8543 Trond Myklebust 2013-03-20  1500  	if (lo == NULL) {
240286725d8543 Trond Myklebust 2013-03-20  1501  		spin_unlock(&inode->i_lock);
240286725d8543 Trond Myklebust 2013-03-20  1502  		return 0;
240286725d8543 Trond Myklebust 2013-03-20  1503  	}
240286725d8543 Trond Myklebust 2013-03-20  1504  	pnfs_get_layout_hdr(lo);
240286725d8543 Trond Myklebust 2013-03-20  1505  	/* Block new layoutgets and read/write to ds */
240286725d8543 Trond Myklebust 2013-03-20  1506  	lo->plh_block_lgets++;
240286725d8543 Trond Myklebust 2013-03-20  1507  	spin_unlock(&inode->i_lock);
240286725d8543 Trond Myklebust 2013-03-20 @1508  	filemap_fdatawait(inode->i_mapping);
240286725d8543 Trond Myklebust 2013-03-20  1509  	ret = pnfs_layoutcommit_inode(inode, true);
240286725d8543 Trond Myklebust 2013-03-20  1510  	if (ret == 0)
240286725d8543 Trond Myklebust 2013-03-20  1511  		ret = _pnfs_return_layout(inode);
240286725d8543 Trond Myklebust 2013-03-20  1512  	spin_lock(&inode->i_lock);
240286725d8543 Trond Myklebust 2013-03-20  1513  	lo->plh_block_lgets--;
240286725d8543 Trond Myklebust 2013-03-20  1514  	spin_unlock(&inode->i_lock);
240286725d8543 Trond Myklebust 2013-03-20  1515  	pnfs_put_layout_hdr(lo);
240286725d8543 Trond Myklebust 2013-03-20  1516  	return ret;
240286725d8543 Trond Myklebust 2013-03-20  1517  }
240286725d8543 Trond Myklebust 2013-03-20  1518  

:::::: The code at line 1508 was first introduced by commit
:::::: 240286725d854331422cb15957f8d9bf2741d4e3 NFSv4.1: Add a helper pnfs_commit_and_return_layout

:::::: TO: Trond Myklebust <Trond.Myklebust@netapp.com>
:::::: CC: Trond Myklebust <Trond.Myklebust@netapp.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
