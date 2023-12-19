Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B297D18E0C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 12:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iwDJbELB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702990665; x=1734526665;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ms4P2Harksju0hTUbudJFrsaSGi/t+j+JR8EaFTbUAQ=;
  b=iwDJbELB8N+72rebYSpXBYwAP/rVWRU/TdJUELOk7xVqa5Vb0sIHpdo6
   B8IIRS/11DIls72ko1gjnti1Fi8PS5aasJobhRPYJcKHH2ucDAuPHVVGo
   dBVDLthDq31rlafXgfM5oyg6VsUzdQcxQn7otRh6gEpzqSZhVjGeNpo+S
   vXlIWEAKv7Bx9dt8cZ6Y2WkJnqKWDHqzMDCbhGnNIlA6IuVNw51WNw9by
   KIDCYMNM1e5Y6xYe2LiVCm93sogOZFeNj9WfaOomI/kzEqlw7qyhd+2Q/
   0Coq7hNgAWi41t4t2OmcflJevobIhexbwnDUXCyT2NvHA9Yq8owwbXEus
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="9100706"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="9100706"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 04:57:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="1023134941"
X-IronPort-AV: E=Sophos;i="6.04,288,1695711600"; 
   d="scan'208";a="1023134941"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Dec 2023 04:57:40 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFZfG-0005KX-0Q;
	Tue, 19 Dec 2023 12:57:38 +0000
Date: Tue, 19 Dec 2023 20:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:xfs-attr-cleanup 5/8] fs/xfs/libxfs/xfs_attr.c:1075:11:
 warning: variable 'error' is uninitialized when used here
Message-ID: <202312192042.O6TJSHFu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git xfs-attr-cleanup
head:   fcf98eafb96221bd1bb0b4abb1fe5c8eff25284e
commit: e173532340de2953d2c918132c3c9bcf74d9399a [5/8] xfs: remove xfs_attr_shortform_lookup
config: i386-buildonly-randconfig-002-20231219 (https://download.01.org/0day-ci/archive/20231219/202312192042.O6TJSHFu-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312192042.O6TJSHFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312192042.O6TJSHFu-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_attr.c:1075:11: warning: variable 'error' is uninitialized when used here [-Wuninitialized]
                           return error;
                                  ^~~~~
   fs/xfs/libxfs/xfs_attr.c:1069:13: note: initialize the variable 'error' to silence this warning
           int                     error;
                                        ^
                                         = 0
   1 warning generated.


vim +/error +1075 fs/xfs/libxfs/xfs_attr.c

e01b7eed5d0a9b fs/xfs/libxfs/xfs_attr.c Carlos Maiolino   2020-09-07  1059  
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1060  /*
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1061   * Add a name to the shortform attribute list structure
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1062   * This is the external routine.
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1063   */
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1064  static int
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1065  xfs_attr_shortform_addname(
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1066  	struct xfs_da_args	*args)
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1067  {
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1068  	int			newsize, forkoff;
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1069  	int			error;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1070  
5a5881cdeec2c0 fs/xfs/xfs_attr.c        Dave Chinner      2012-03-22  1071  	trace_xfs_attr_sf_addname(args);
5a5881cdeec2c0 fs/xfs/xfs_attr.c        Dave Chinner      2012-03-22  1072  
e173532340de29 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2023-12-17  1073  	if (xfs_attr_sf_findname(args)) {
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1074  		if (!(args->op_flags & XFS_DA_OP_REPLACE))
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12 @1075  			return error;
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1076  
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1077  		error = xfs_attr_sf_removename(args);
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1078  		if (error)
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1079  			return error;
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1080  
7b38460dc8e4ea fs/xfs/libxfs/xfs_attr.c Darrick J. Wong   2018-04-17  1081  		/*
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1082  		 * Since we have removed the old attr, clear XFS_DA_OP_REPLACE
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1083  		 * so that the new attr doesn't fit in shortform format, the
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1084  		 * leaf format add routine won't trip over the attr not being
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1085  		 * around.
7b38460dc8e4ea fs/xfs/libxfs/xfs_attr.c Darrick J. Wong   2018-04-17  1086  		 */
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1087  		args->op_flags &= ~XFS_DA_OP_REPLACE;
e173532340de29 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2023-12-17  1088  	} else {
e173532340de29 fs/xfs/libxfs/xfs_attr.c Christoph Hellwig 2023-12-17  1089  		if (args->op_flags & XFS_DA_OP_REPLACE)
e7f358dee4e5cf fs/xfs/libxfs/xfs_attr.c Dave Chinner      2022-05-12  1090  			return error;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1091  	}
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1092  
d8cc890d4095f1 fs/xfs/xfs_attr.c        Nathan Scott      2005-11-02  1093  	if (args->namelen >= XFS_ATTR_SF_ENTSIZE_MAX ||
d8cc890d4095f1 fs/xfs/xfs_attr.c        Nathan Scott      2005-11-02  1094  	    args->valuelen >= XFS_ATTR_SF_ENTSIZE_MAX)
2451337dd04390 fs/xfs/libxfs/xfs_attr.c Dave Chinner      2014-06-25  1095  		return -ENOSPC;
d8cc890d4095f1 fs/xfs/xfs_attr.c        Nathan Scott      2005-11-02  1096  
e01b7eed5d0a9b fs/xfs/libxfs/xfs_attr.c Carlos Maiolino   2020-09-07  1097  	newsize = xfs_attr_sf_totsize(args->dp);
e01b7eed5d0a9b fs/xfs/libxfs/xfs_attr.c Carlos Maiolino   2020-09-07  1098  	newsize += xfs_attr_sf_entsize_byname(args->namelen, args->valuelen);
d8cc890d4095f1 fs/xfs/xfs_attr.c        Nathan Scott      2005-11-02  1099  
d8cc890d4095f1 fs/xfs/xfs_attr.c        Nathan Scott      2005-11-02  1100  	forkoff = xfs_attr_shortform_bytesfit(args->dp, newsize);
d8cc890d4095f1 fs/xfs/xfs_attr.c        Nathan Scott      2005-11-02  1101  	if (!forkoff)
2451337dd04390 fs/xfs/libxfs/xfs_attr.c Dave Chinner      2014-06-25  1102  		return -ENOSPC;
d8cc890d4095f1 fs/xfs/xfs_attr.c        Nathan Scott      2005-11-02  1103  
d8cc890d4095f1 fs/xfs/xfs_attr.c        Nathan Scott      2005-11-02  1104  	xfs_attr_shortform_add(args, forkoff);
d99831ff393ff2 fs/xfs/xfs_attr.c        Eric Sandeen      2014-06-22  1105  	return 0;
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1106  }
^1da177e4c3f41 fs/xfs/xfs_attr.c        Linus Torvalds    2005-04-16  1107  

:::::: The code at line 1075 was first introduced by commit
:::::: e7f358dee4e5cf1ce8b11ff2e65d5ccb1ced24db xfs: use XFS_DA_OP flags in deferred attr ops

:::::: TO: Dave Chinner <dchinner@redhat.com>
:::::: CC: Dave Chinner <david@fromorbit.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
