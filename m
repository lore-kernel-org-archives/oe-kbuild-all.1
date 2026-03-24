Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881923890E4
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Mar 2026 02:57:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774321071; cv=none; b=XVmZuAL2la9YV6sC52QD2ayAQfosVwfO5FhPdOIch3obMf3Rbns8yB4fx2ErUc5ZLQycrXkOqwXKb+vwO50foa561VVBHj7kmEo1eAWlq/vTMJSVAK2sKtjHbUHvlmXP7/ueilPV/w82d8Nn4sYwLK6zQYFuUR8OyRTRHn+J+3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774321071; c=relaxed/simple;
	bh=WBt9RKg+7CuE1P11vnLv76oqEm1p6duTHTzMtmsHOLo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B6OujgedzWZMQDf2bkbsBooWkAYWs/FODO4OPtXV49Ay1OqImLtq84f1I3cTWkB7GJlfKB2a2/aCw9hCIvubRq6OhKwet0XlHppRu1aflP6X0u4O4F9OPNwmuhGmyywgoPe5jy8EHkFEmc1VasTg8rXk2coZksdm7AVgpPWTTow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mdm8g6jH; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mdm8g6jH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774321070; x=1805857070;
  h=date:from:to:cc:subject:message-id;
  bh=WBt9RKg+7CuE1P11vnLv76oqEm1p6duTHTzMtmsHOLo=;
  b=mdm8g6jHgIU+u/b9/Br2BOgS40u1uvmE1TJjIQrcx08JPF80L80No+Gh
   OdeMw6ORSo8MuuHkXP5aQ7zDYOk08UOz/RYskHACnJzKJDaCgk8heLV0y
   tQPCZ3pdCwgm1/C56TWF5txEWHYQW3Tje8j9a6jezkyLdqtMjKH+5ommT
   A8pqX4OTjestOI9yKNdK3SZ8Ajd28VU/slC3sq3YS6LLJGSZF3frQcJDu
   d7Ayf9zgWONGec8Tc2h/BGwgeGQO4lV5crMOPfufzaxI87F2Wv605PclW
   1tcH7GSEhhE5+FhQ0uG9HRHE38BZJzj2Fq5JxDXfq50F6CCl3hFpIYI7c
   g==;
X-CSE-ConnectionGUID: krbCgYzPT8SpHVpxmH0RQw==
X-CSE-MsgGUID: 9UO1T1OZRsyqe5Fo8s+hhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86024695"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86024695"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 19:57:47 -0700
X-CSE-ConnectionGUID: aT64vd1/Remj4wGvLgSUFg==
X-CSE-MsgGUID: eucK23PUQ9GwY1CvJv5MDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219340735"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Mar 2026 19:57:46 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4rxf-000000003hL-3HOf;
	Tue, 24 Mar 2026 02:57:43 +0000
Date: Tue, 24 Mar 2026 10:57:41 +0800
From: kernel test robot <lkp@intel.com>
To: Yongpeng Yang <yangyongpeng@xiaomi.com>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <chao@kernel.org>
Subject: [chao:dev-test 2/13] fs/f2fs/node.h:425:49: warning: passing
 argument 2 of 'f2fs_inode_chksum_set' discards 'const' qualifier from pointer
 target type
Message-ID: <202603241038.CjgCL2TZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
head:   b559609da002e5c06340a56ff23ad93cac4f4f9a
commit: 819157dce25d2c894a6c24f04e418dc680477c2a [2/13] f2fs: refactor node footer flag setting related code
config: arc-randconfig-001-20260324 (https://download.01.org/0day-ci/archive/20260324/202603241038.CjgCL2TZ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260324/202603241038.CjgCL2TZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603241038.CjgCL2TZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/dir.c:15:
   fs/f2fs/node.h: In function 'set_mark':
>> fs/f2fs/node.h:425:49: warning: passing argument 2 of 'f2fs_inode_chksum_set' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     425 |         f2fs_inode_chksum_set(F2FS_F_SB(folio), folio);
         |                                                 ^~~~~
   In file included from fs/f2fs/dir.c:14:
   fs/f2fs/f2fs.h:3806:68: note: expected 'struct folio *' but argument is of type 'const struct folio *'
    3806 | void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct folio *folio);
         |                                                      ~~~~~~~~~~~~~~^~~~~


vim +425 fs/f2fs/node.h

819157dce25d2c Yongpeng Yang           2026-03-18  419  
819157dce25d2c Yongpeng Yang           2026-03-18  420  static inline void set_mark(const struct folio *folio, bool mark, int type)
819157dce25d2c Yongpeng Yang           2026-03-18  421  {
819157dce25d2c Yongpeng Yang           2026-03-18  422  	__set_mark(folio, mark, type);
54c55c4e4fc7ec Weichao Guo             2018-03-09  423  
54c55c4e4fc7ec Weichao Guo             2018-03-09  424  #ifdef CONFIG_F2FS_CHECK_FS
e3f1b76d877c14 Matthew Wilcox (Oracle  2025-07-08 @425) 	f2fs_inode_chksum_set(F2FS_F_SB(folio), folio);

:::::: The code at line 425 was first introduced by commit
:::::: e3f1b76d877c14897b4776fc5dd08af3c7751976 f2fs: Pass a folio to f2fs_inode_chksum_set()

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
