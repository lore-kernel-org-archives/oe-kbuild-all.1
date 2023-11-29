Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377316131
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 03:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gJuPNO9n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701228654; x=1732764654;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eQlJWfpd7qYuOV49yAKtJLDxsZeHEmrnwNmaneA6oxs=;
  b=gJuPNO9nH15Pt0222PgRTZ0A18ncSFkMZVClFlN6W+zl1+gTlm2mT11+
   ewN0sW8Oqv7UxNtej949QG9sjmf+X8/jaz77FnPLMx8Sf4OQh4QptdgQS
   nbWHR3se89/FF+TFO7DIN1upvOxeiX79PWVNKJ01WeG9IhVMK/jIykxNg
   ZJlTjmjmn1osxThmmrnsT6ENX9RU43ln6WZ5WJSpFnT1BdsuDd/1kGvuG
   KdG86EQcC6Ojb0+WbMCaZAJbcUfOFObIt/cOFq7aoxA5AWyyUY6cTl83p
   +YaRWQ2V6fiw2mNpTtFcE0KyPeSPvbhp40bCXcBzj4zPHSs4WgY4m3+ld
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10908"; a="372455510"
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="372455510"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 19:30:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,234,1695711600"; 
   d="scan'208";a="10208686"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Nov 2023 19:30:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8BHj-0008Vd-1V;
	Wed, 29 Nov 2023 03:30:47 +0000
Date: Wed, 29 Nov 2023 11:29:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:reconstruct-defer-work-6.7 5/7]
 fs/xfs/xfs_attr_item.c:585:3: error: a label can only be part of a statement
 and a declaration is not a statement
Message-ID: <202311290958.eJ9V7jkb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git reconstruct-defer-work-6.7
head:   6b40cbdb0348d7c82b1729fba6d5352da1b949d3
commit: 36ee9012d43da805843689ce1c3e8a493a820d22 [5/7] xfs: recreate work items when recovering intent items
config: x86_64-buildonly-randconfig-005-20231129 (https://download.01.org/0day-ci/archive/20231129/202311290958.eJ9V7jkb-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231129/202311290958.eJ9V7jkb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311290958.eJ9V7jkb-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/xfs_attr_item.c: In function 'xfs_attri_recover_work':
>> fs/xfs/xfs_attr_item.c:585:3: error: a label can only be part of a statement and a declaration is not a statement
     585 |   int   local;
         |   ^~~


vim +585 fs/xfs/xfs_attr_item.c

   541	
   542	static inline struct xfs_attr_intent *
   543	xfs_attri_recover_work(
   544		struct xfs_mount		*mp,
   545		struct xfs_defer_pending	*dfp,
   546		struct xfs_attri_log_format	*attrp,
   547		struct xfs_inode		*ip,
   548		struct xfs_attri_log_nameval	*nv)
   549	{
   550		struct xfs_attr_intent		*attr;
   551		struct xfs_da_args		*args;
   552	
   553		attr = kmem_zalloc(sizeof(struct xfs_attr_intent) +
   554				   sizeof(struct xfs_da_args), KM_NOFS);
   555		args = (struct xfs_da_args *)(attr + 1);
   556	
   557		INIT_LIST_HEAD(&attr->xattri_list);
   558		attr->xattri_da_args = args;
   559		attr->xattri_op_flags = attrp->alfi_op_flags &
   560							XFS_ATTRI_OP_FLAGS_TYPE_MASK;
   561	
   562		/*
   563		 * We're reconstructing the deferred work state structure from the
   564		 * recovered log item.  Grab a reference to the name/value buffer and
   565		 * attach it to the new work state.
   566		 */
   567		attr->xattri_nameval = xfs_attri_log_nameval_get(nv);
   568		ASSERT(attr->xattri_nameval);
   569	
   570		args->dp = ip;
   571		args->geo = mp->m_attr_geo;
   572		args->whichfork = XFS_ATTR_FORK;
   573		args->name = nv->name.i_addr;
   574		args->namelen = nv->name.i_len;
   575		args->hashval = xfs_da_hashname(args->name, args->namelen);
   576		args->attr_filter = attrp->alfi_attr_filter & XFS_ATTRI_FILTER_MASK;
   577		args->op_flags = XFS_DA_OP_RECOVERY | XFS_DA_OP_OKNOENT |
   578				 XFS_DA_OP_LOGGED;
   579	
   580		ASSERT(xfs_sb_version_haslogxattrs(&mp->m_sb));
   581	
   582		switch (attr->xattri_op_flags) {
   583		case XFS_ATTRI_OP_FLAGS_SET:
   584		case XFS_ATTRI_OP_FLAGS_REPLACE:
 > 585			int			local;
   586	
   587			args->value = nv->value.i_addr;
   588			args->valuelen = nv->value.i_len;
   589			args->total = xfs_attr_calc_size(args, &local);
   590			if (xfs_inode_hasattr(args->dp))
   591				attr->xattri_dela_state = xfs_attr_init_replace_state(args);
   592			else
   593				attr->xattri_dela_state = xfs_attr_init_add_state(args);
   594			break;
   595		case XFS_ATTRI_OP_FLAGS_REMOVE:
   596			attr->xattri_dela_state = xfs_attr_init_remove_state(args);
   597			break;
   598		}
   599	
   600		xfs_defer_recover_work_item(dfp, &attr->xattri_list);
   601		return attr;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
