Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD766525A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 15 Feb 2023 12:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676463948; x=1707999948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UGZzn66B181OWa8SAToQXY19M0Y0VzMtn2LcLCnyw58=;
  b=bbdEtNcB2MvU3WSWW7IZnxrjNirZE02CneGJNEFp9oK7OSI0Sl5QyPl5
   ro4uzVEV3+01sr+XLnbIv5s/dPACfF4vi54oW37LPqqhi6mUVrBuZH7KX
   tNIlpGIaiSKfYyXXH9gog1S/512JYmMBMTA604iI3mKRObQ7DtT1DgBck
   fOuoLgEKSt45bQWKTGMTYG5au/jsLmy1zYT9gjTbWlInL19OzKGnCjMRB
   j1F9chXRAS/ipdgo8sdx8lf3dhEXhpr3jTaTluWOeljH+V3Cd3wMcoTDb
   m8WJgy0ugYKNmxik557HYcs7t2Tx2hTFwVOS/lcH9+m5Iqec0TJ3tSS5J
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="311044315"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="311044315"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2023 04:25:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10621"; a="619412519"
X-IronPort-AV: E=Sophos;i="5.97,299,1669104000"; 
   d="scan'208";a="619412519"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 15 Feb 2023 04:25:46 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSGr3-0009LZ-0e;
	Wed, 15 Feb 2023 12:25:45 +0000
Date: Wed, 15 Feb 2023 20:25:17 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:pptrs-online-dir-check 86/86] fs/xfs/scrub/dir.c:1063:
 undefined reference to `xfblob_load'
Message-ID: <202302152005.h21DIFY2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git pptrs-online-dir-check
head:   742799e0756242478440147ff6400f90b599b6d4
commit: 742799e0756242478440147ff6400f90b599b6d4 [86/86] xfs: deferred scrub of dirents
config: x86_64-randconfig-a014-20230213 (https://download.01.org/0day-ci/archive/20230215/202302152005.h21DIFY2-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/commit/?id=742799e0756242478440147ff6400f90b599b6d4
        git remote add djwong-xfs https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git
        git fetch --no-tags djwong-xfs pptrs-online-dir-check
        git checkout 742799e0756242478440147ff6400f90b599b6d4
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302152005.h21DIFY2-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/scrub/dir.o: in function `xchk_dir_finish_slow_dirents':
>> fs/xfs/scrub/dir.c:1063: undefined reference to `xfblob_load'
   ld: fs/xfs/scrub/dir.o: in function `xchk_dir_check_pptr_fast':
>> fs/xfs/scrub/dir.c:207: undefined reference to `xfblob_store'
   ld: fs/xfs/scrub/dir.o: in function `xchk_directory':
>> fs/xfs/scrub/dir.c:1145: undefined reference to `xfblob_destroy'
>> ld: fs/xfs/scrub/dir.c:1125: undefined reference to `xfblob_create'
   ld: fs/xfs/scrub/listxattr.o: in function `xchk_xattr_find_leftmost_leaf':
   fs/xfs/scrub/listxattr.c:184: undefined reference to `xbitmap_set'
   ld: fs/xfs/scrub/listxattr.c:195: undefined reference to `xbitmap_test'
   ld: fs/xfs/scrub/listxattr.c:210: undefined reference to `xbitmap_set'
   ld: fs/xfs/scrub/listxattr.o: in function `xchk_xattr_walk_node':
   fs/xfs/scrub/listxattr.c:237: undefined reference to `xbitmap_init'
   ld: fs/xfs/scrub/listxattr.c:261: undefined reference to `xbitmap_test'
   ld: fs/xfs/scrub/listxattr.c:270: undefined reference to `xbitmap_set'
   ld: fs/xfs/scrub/listxattr.c:278: undefined reference to `xbitmap_destroy'
   ld: fs/xfs/scrub/parent.o: in function `xchk_parent_scan_attr':
   fs/xfs/scrub/parent.c:578: undefined reference to `xfblob_store'
   ld: fs/xfs/scrub/parent.o: in function `xchk_parent_slow_pptr':
   fs/xfs/scrub/parent.c:654: undefined reference to `xfblob_load'
   ld: fs/xfs/scrub/parent.o: in function `xchk_parent_finish_slow_pptrs':
   fs/xfs/scrub/parent.c:759: undefined reference to `xfblob_truncate'
   ld: fs/xfs/scrub/parent.o: in function `xchk_parent_pptr':
   fs/xfs/scrub/parent.c:789: undefined reference to `xfblob_create'
   ld: fs/xfs/scrub/parent.c:806: undefined reference to `xfblob_destroy'


vim +1063 fs/xfs/scrub/dir.c

  1047	
  1048	/* Check all the dirents that we deferred the first time around. */
  1049	STATIC int
  1050	xchk_dir_finish_slow_dirents(
  1051		struct xchk_dir		*sd)
  1052	{
  1053		xfarray_idx_t		array_cur;
  1054		int			error;
  1055	
  1056		foreach_xfarray_idx(sd->dir_entries, array_cur) {
  1057			struct xchk_dirent	dirent;
  1058	
  1059			error = xfarray_load(sd->dir_entries, array_cur, &dirent);
  1060			if (error)
  1061				return error;
  1062	
> 1063			error = xfblob_load(sd->dir_names, dirent.name_cookie,
  1064					sd->namebuf, dirent.namelen);
  1065			if (error)
  1066				return error;
  1067			sd->namebuf[MAXNAMELEN - 1] = 0;
  1068	
  1069			error = xchk_dir_slow_dirent(sd, &dirent);
  1070			if (error)
  1071				return error;
  1072		}
  1073	
  1074		return 0;
  1075	}
  1076	
  1077	/* Scrub a whole directory. */
  1078	int
  1079	xchk_directory(
  1080		struct xfs_scrub	*sc)
  1081	{
  1082		struct xchk_dir		*sd;
  1083		int			error;
  1084	
  1085		if (!S_ISDIR(VFS_I(sc->ip)->i_mode))
  1086			return -ENOENT;
  1087	
  1088		/* Plausible size? */
  1089		if (sc->ip->i_disk_size < xfs_dir2_sf_hdr_size(0)) {
  1090			xchk_ino_set_corrupt(sc, sc->ip->i_ino);
  1091			return 0;
  1092		}
  1093	
  1094		/* Check directory tree structure */
  1095		error = xchk_da_btree(sc, XFS_DATA_FORK, xchk_dir_rec, NULL);
  1096		if (error)
  1097			return error;
  1098	
  1099		if (sc->sm->sm_flags & XFS_SCRUB_OFLAG_CORRUPT)
  1100			return 0;
  1101	
  1102		/* Check the freespace. */
  1103		error = xchk_directory_blocks(sc);
  1104		if (error)
  1105			return error;
  1106	
  1107		if (sc->sm->sm_flags & XFS_SCRUB_OFLAG_CORRUPT)
  1108			return 0;
  1109	
  1110		sd = kvzalloc(sizeof(struct xchk_dir), XCHK_GFP_FLAGS);
  1111		if (!sd)
  1112			return -ENOMEM;
  1113		sd->sc = sc;
  1114	
  1115		if (xfs_has_parent(sc->mp)) {
  1116			/*
  1117			 * Set up some staging memory for dirents that we can't check
  1118			 * due to locking contention.
  1119			 */
  1120			error = xfarray_create(sc->mp, "directory entries", 0,
  1121					sizeof(struct xchk_dirent), &sd->dir_entries);
  1122			if (error)
  1123				goto out_sd;
  1124	
> 1125			error = xfblob_create(sc->mp, "dirent names", &sd->dir_names);
  1126			if (error)
  1127				goto out_entries;
  1128		}
  1129	
  1130		/* Look up every name in this directory by hash. */
  1131		error = xchk_dir_walk(sc, sc->ip, xchk_dir_actor, sd);
  1132		if (error == -ECANCELED)
  1133			error = 0;
  1134		if (error)
  1135			goto out_names;
  1136	
  1137		if (xfs_has_parent(sc->mp)) {
  1138			error = xchk_dir_finish_slow_dirents(sd);
  1139			if (error)
  1140				goto out_names;
  1141		}
  1142	
  1143	out_names:
  1144		if (sd->dir_names)
> 1145			xfblob_destroy(sd->dir_names);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
