Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A73C28C06
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jan 2023 21:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674078017; x=1705614017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RWqKm+/IkS9OGvT5vZ6WeT2sPICkk1YG4Bx3iyut/Po=;
  b=AJAmAgF9YsgD7UdMyTJreksHYuwDl0kxE0/CyeRVM7haHFYS4Q6HM77a
   1W9DvhpT1m8TSQAZ/w03ADUUHEaYaNOeVbyDLYtzv2H4b2p9WHh8/StbF
   TvYfvIP/tcF6VIEJm8De/ZFhdVLNpF9OCBe8zVrbP4i4ICoHgXv++XU/j
   cifNi4OPXpPxfkbAK9QZ5RvkFsSexkCEfmeEzz0nkD8A1g1SHeSRBFlur
   mmYq7TKuiyAzzek9i5D6pHn9RNWgk48FE9ArOsPZa53VDLVsQAeG2VxIv
   lJugUwWChm25TrpCngUnW/K5O7P1D9Ea3j7MkhNNTBYP4u3dCDtWiP9KZ
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="326374074"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="326374074"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 13:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="637444283"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="637444283"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 18 Jan 2023 13:40:15 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIGAI-0000jm-1c;
	Wed, 18 Jan 2023 21:40:14 +0000
Date: Thu, 19 Jan 2023 05:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfile-page-caching 132/266]
 fs/xfs/scrub/inode_repair.c:706:3: error: expected expression
Message-ID: <202301190559.LMcENRZy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   5ac6d5f53f18d0486ac3713be490eb8c186ff344
commit: 3e068efd772aa4b48cc261f81a68ff0e2049ccdc [132/266] xfs: zap broken inode forks
config: x86_64-randconfig-a003 (https://download.01.org/0day-ci/archive/20230119/202301190559.LMcENRZy-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=3e068efd772aa4b48cc261f81a68ff0e2049ccdc
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs xfile-page-caching
        git checkout 3e068efd772aa4b48cc261f81a68ff0e2049ccdc
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> fs/xfs/scrub/inode_repair.c:706:3: error: expected expression
                   int                     attr_size;
                   ^
>> fs/xfs/scrub/inode_repair.c:713:3: error: use of undeclared identifier 'attr_size'; did you mean 'afork_size'?
                   attr_size = be16_to_cpu(afork_ptr->hdr.totsize);
                   ^~~~~~~~~
                   afork_size
   fs/xfs/scrub/inode_repair.c:695:9: note: 'afork_size' declared here
           int                             afork_size;
                                           ^
   fs/xfs/scrub/inode_repair.c:714:7: error: use of undeclared identifier 'attr_size'
                   if (attr_size > afork_size)
                       ^
   fs/xfs/scrub/inode_repair.c:719:8: error: use of undeclared identifier 'attr_size'
                                                           attr_size) != NULL;
                                                           ^
   4 errors generated.


vim +706 fs/xfs/scrub/inode_repair.c

   684	
   685	/*
   686	 * Check the attr fork for things that will fail the ifork verifiers or the
   687	 * ifork formatters.
   688	 */
   689	STATIC bool
   690	xrep_dinode_check_afork(
   691		struct xfs_scrub		*sc,
   692		struct xfs_dinode		*dip)
   693	{
   694		struct xfs_attr_shortform	*afork_ptr;
   695		int				afork_size;
   696	
   697		if (XFS_DFORK_BOFF(dip) == 0)
   698			return dip->di_aformat != XFS_DINODE_FMT_EXTENTS ||
   699			       xfs_dfork_attr_extents(dip) != 0;
   700	
   701		afork_size = XFS_DFORK_SIZE(dip, sc->mp, XFS_ATTR_FORK);
   702		afork_ptr = XFS_DFORK_PTR(dip, XFS_ATTR_FORK);
   703	
   704		switch (XFS_DFORK_FORMAT(dip, XFS_ATTR_FORK)) {
   705		case XFS_DINODE_FMT_LOCAL:
 > 706			int			attr_size;
   707	
   708			/* Fork has to be large enough to extract the xattr size. */
   709			if (afork_size < sizeof(struct xfs_attr_sf_hdr))
   710				return true;
   711	
   712			/* xattr structure cannot be larger than the fork */
 > 713			attr_size = be16_to_cpu(afork_ptr->hdr.totsize);
   714			if (attr_size > afork_size)
   715				return true;
   716	
   717			/* xattr structure must pass verification. */
   718			return xfs_attr_shortform_verify_struct(afork_ptr,
   719								attr_size) != NULL;
   720		case XFS_DINODE_FMT_EXTENTS:
   721			if (xrep_dinode_bad_extents_fork(sc, dip, afork_size,
   722						XFS_ATTR_FORK))
   723				return true;
   724			break;
   725		case XFS_DINODE_FMT_BTREE:
   726			if (xrep_dinode_bad_btree_fork(sc, dip, afork_size,
   727						XFS_ATTR_FORK))
   728				return true;
   729			break;
   730		default:
   731			return true;
   732		}
   733	
   734		return false;
   735	}
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
