Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67001BD039
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 17:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723656931; cv=none; b=idyOOZpQ3wijuyPeBkdmM2bMzw6meC4COiHs8tE8v1S8lW/7ljFOKD19GeTU9JL/9fEArc0kYYKalfV+Y+6juZ+qQ82o8YTKqxSGb4PJqa0tZaAdJTEJxllmjog0mF6iIu+cKdtEJ6rqa8Dkb4D3+t5CnPCVUGQ+bUdO4mDbnWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723656931; c=relaxed/simple;
	bh=hACOkO4S52RPzSOqia5rGDOjKKiJN+QxobnAjDaBWrc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lJmcDX2EfylUV2lHgAVpriSrBCKi2VPpmnqBHtcUOFutrpl5ONfDH3qcSQukEwv914H8ozFNj3fTAJMHQBpbwif8ezzxTAItU8sFOj9u2soT8bssR7BwWj0/J0DKs6NarbU8JWirNm1K04kvNZpsgN0XMRW/BWINzbdg/GY40B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBKXfVTf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBKXfVTf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723656930; x=1755192930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hACOkO4S52RPzSOqia5rGDOjKKiJN+QxobnAjDaBWrc=;
  b=NBKXfVTfXP3sIN4D41363dfbw0i3V3om1KOliYXP82jPPOlabAOCXmu/
   br0QlXbOfv4ROeQX3/IlN/LZZVMeye+Qfvccv4+58CIChT5NWdyfpf3lt
   4gU95eYEMjrX+6KWDxh0RnurmvYQsPLSoh38Wk2BR/sXXsPmlLTbL97bi
   0SQkGceM/A0ixBf4F64ihA6Z5Ho4FRoY5S80T98GRmUg3S+rRu+opANCz
   tix4EeRN6xaDY6TBlSlKaWf6n5FxKfCZ8Rn7W3QWs/37sjjyrd4IiksgK
   L1/pUpa4qHWdEkhbXLFVYfgSBsIjKe1+jyzFqJgUkxN5yazimXVbywRa2
   w==;
X-CSE-ConnectionGUID: vucSMPuGQJedwCMiaDmvyQ==
X-CSE-MsgGUID: pfzVpuxURGWPwsy7a23Peg==
X-IronPort-AV: E=McAfee;i="6700,10204,11164"; a="21749035"
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="21749035"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 10:35:26 -0700
X-CSE-ConnectionGUID: Osx7aLLnRI6HdcbkPcAEfg==
X-CSE-MsgGUID: N8lMgBQoQKmbGoBxfDML/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,146,1719903600"; 
   d="scan'208";a="59839067"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Aug 2024 10:35:26 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seHu7-0002eY-1y;
	Wed, 14 Aug 2024 17:35:23 +0000
Date: Thu, 15 Aug 2024 01:34:40 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 228/253] fs/xfs/xfs_fsrefs.c:783:1: warning:
 'xfs_fsrefs_rtdev' defined but not used
Message-ID: <202408150153.WAvhjlbL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git hch-wtf
head:   dabb7872a6f25b04b590e544cc0f5f3ac560194e
commit: ef5c3b973479908b0569a054e9fc538f2764730d [228/253] xfs: export reference count information to userspace
config: x86_64-randconfig-002-20240814 (https://download.01.org/0day-ci/archive/20240815/202408150153.WAvhjlbL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240815/202408150153.WAvhjlbL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408150153.WAvhjlbL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/xfs_fsrefs.c:783:1: warning: 'xfs_fsrefs_rtdev' defined but not used [-Wunused-function]
     783 | xfs_fsrefs_rtdev(
         | ^~~~~~~~~~~~~~~~


vim +/xfs_fsrefs_rtdev +783 fs/xfs/xfs_fsrefs.c

   652	
   653	/* Execute a getfsrefs query against the realtime device. */
   654	STATIC int
   655	xfs_fsrefs_rtdev(
   656		struct xfs_trans	*tp,
   657		const struct xfs_fsrefs	*keys,
   658		struct xfs_fsrefs_info	*info)
   659	{
   660		struct xfs_mount	*mp = tp->t_mountp;
   661		struct xfs_rtgroup	*rtg;
   662		xfs_rtblock_t		start_rtb;
   663		xfs_rtblock_t		end_rtb;
   664		uint64_t		eofs;
   665		xfs_rgnumber_t		start_rg, end_rg;
   666		int			error = 0;
   667	
   668		eofs = XFS_FSB_TO_BB(mp, xfs_blen_to_rtbxlen(mp, mp->m_sb.sb_rextents));
   669		if (keys[0].fcr_physical >= eofs)
   670			return 0;
   671		start_rtb = XFS_BB_TO_FSBT(mp, keys[0].fcr_physical);
   672		end_rtb = XFS_BB_TO_FSB(mp, min(eofs - 1, keys[1].fcr_physical));
   673	
   674		info->refc_cur = NULL;
   675	
   676		/*
   677		 * Convert the fsrefs low/high keys to rtgroup based keys.  Initialize
   678		 * low to the fsrefs low key and max out the high key to the end of the
   679		 * rtgroup.
   680		 */
   681		start_rg = xfs_rtb_to_rgno(mp, start_rtb);
   682		info->low.rc_startblock = xfs_rtb_to_rgbno(mp, start_rtb);
   683		info->low.rc_blockcount = XFS_BB_TO_FSBT(mp, keys[0].fcr_length);
   684		info->low.rc_refcount = 0;
   685		info->low.rc_domain = XFS_REFC_DOMAIN_SHARED;
   686	
   687		/* Adjust the low key if we are continuing from where we left off. */
   688		if (info->low.rc_blockcount > 0) {
   689			info->low.rc_startblock += info->low.rc_blockcount;
   690	
   691			start_rtb += info->low.rc_blockcount;
   692			if (xfs_rtb_to_daddr(mp, start_rtb) >= eofs)
   693				return 0;
   694		}
   695	
   696		info->high.rc_startblock = -1U;
   697		info->high.rc_blockcount = 0;
   698		info->high.rc_refcount = 0;
   699		info->high.rc_domain = XFS_REFC_DOMAIN_SHARED;
   700	
   701		end_rg = xfs_rtb_to_rgno(mp, end_rtb);
   702	
   703		for_each_rtgroup_range(mp, start_rg, end_rg, rtg) {
   704			/*
   705			 * Set the rtgroup high key from the fsrefs high key if this
   706			 * is the last rtgroup that we're querying.
   707			 */
   708			info->rtg = rtg;
   709			if (rtg->rtg_rgno == end_rg)
   710				info->high.rc_startblock =
   711						xfs_rtb_to_rgbno(mp, end_rtb);
   712	
   713			if (info->refc_cur) {
   714				xfs_rtgroup_unlock(info->refc_cur->bc_ino.rtg,
   715						XFS_RTGLOCK_FSREFS);
   716				xfs_btree_del_cursor(info->refc_cur, XFS_BTREE_NOERROR);
   717				info->refc_cur = NULL;
   718			}
   719	
   720			trace_xfs_fsrefs_low_key(mp, info->dev, rtg->rtg_rgno,
   721					&info->low);
   722			trace_xfs_fsrefs_high_key(mp, info->dev, rtg->rtg_rgno,
   723					&info->high);
   724	
   725			xfs_rtgroup_lock(rtg, XFS_RTGLOCK_FSREFS);
   726			info->refc_cur = xfs_rtrefcountbt_init_cursor(mp, tp, rtg,
   727						rtg->rtg_inodes[XFS_RTG_REFCOUNT]);
   728	
   729			/*
   730			 * Fill the query with refcount records and synthesize
   731			 * singly-owned block records from free space data.
   732			 */
   733			error = xfs_refcount_query_range(info->refc_cur,
   734					&info->low, &info->high,
   735					xfs_fsrefs_rtdev_refcountbt_helper, info);
   736			if (error && error != -ECANCELED)
   737				break;
   738	
   739			/*
   740			 * Set the rtgroup low key to the start of the rtgroup prior to
   741			 * moving on to the next rtgroup.
   742			 */
   743			if (rtg->rtg_rgno == start_rg)
   744				memset(&info->low, 0, sizeof(info->low));
   745	
   746			/*
   747			 * If this is the last rtgroup, report any gap at the end of it
   748			 * before we drop the reference to the perag when the loop
   749			 * terminates.
   750			 */
   751			if (rtg->rtg_rgno == end_rg) {
   752				xfs_rtblock_t	next_rtbno;
   753	
   754				info->last = true;
   755				next_rtbno = XFS_BB_TO_FSBT(mp, info->next_daddr);
   756				error = xfs_fsrefs_rtdev_fill_refcount_gap(tp, info,
   757						next_rtbno, end_rtb);
   758				if (error)
   759					break;
   760			}
   761			info->rtg = NULL;
   762		}
   763	
   764		if (info->refc_cur) {
   765			xfs_rtgroup_unlock(info->refc_cur->bc_ino.rtg,
   766					XFS_RTGLOCK_FSREFS);
   767			xfs_btree_del_cursor(info->refc_cur, error);
   768			info->refc_cur = NULL;
   769		}
   770		if (info->rtg) {
   771			xfs_rtgroup_rele(info->rtg);
   772			info->rtg = NULL;
   773		} else if (rtg) {
   774			/* loop termination case */
   775			xfs_rtgroup_rele(rtg);
   776		}
   777	
   778		return error;
   779	}
   780	#else
   781	/* XXX this code is really broken */
   782	STATIC int
 > 783	xfs_fsrefs_rtdev(
   784		struct xfs_trans	*tp,
   785		const struct xfs_fsrefs	*keys,
   786		struct xfs_fsrefs_info	*info)
   787	{
   788		return -EL3HLT;
   789	}
   790	#define xfs_fsrefs_rtdev_rtbitmap	xfs_fsrefs_rtdev
   791	#endif
   792	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
