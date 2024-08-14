Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A7936134
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Aug 2024 09:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723626221; cv=none; b=CW4CFktRuc7gy25KPRllckwnsUHGdoMriU+SgB/Rz8mdn1R7Xm80Jy1tkdXYGYgpD0vuEz/+CPs6HqDZ46zudCzmfAzXngWiVrD3EgPPf35DJYqzaBQgBIrsmetgHsR2bfa4r6L/hl9suzEBUkkS150pvErj2xhVW0+q/pjXqTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723626221; c=relaxed/simple;
	bh=50O29vqM4XcjU/ri+sw/NYLx5/1+PDAL0c2+cJvlEEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aZZAywg+lzz19bheOJ1JtF8v4LQMTmdvsLkux+QD0V5VAFPX4y3Vw5EgAOYVv+CNYIaTGFa0aDULtXU/kM15z0GukvlUFusM+ESdk2wVxow6Wlsefy6EQ8GmrYJc6b/38WHktFYKxqbRjmiKFkDROKk+Zjb2GYSqMyo6vfA9HVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Th7sVSu3; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Th7sVSu3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723626221; x=1755162221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=50O29vqM4XcjU/ri+sw/NYLx5/1+PDAL0c2+cJvlEEk=;
  b=Th7sVSu3bNnuuNnE+nJ7oYMsN5s1pJ8YPhktadglh8Z8oVPdgj1gtJxk
   jjsxYIwG7HkEwvBb5jnhQskU+grXw3HFB0AcyUVQEacZcXMICzGxG1Wqh
   yaKtMuXbDlEi9i/jkQC/N/PxKv9dYZevrLJhdQOPX446zzcYXSnvFAHH+
   lG1UszUpDm+6e4H+P435kGi/mHH7uI1PLD9bMj5QtStZcYOk+pk8zVOqs
   VTjnoAw8+Gm9bFjxts+kq1BLmrnBBqk7Z/pR6qiN76t2j3IV1yRlTcJgX
   xk/zUCQ38zmN9V+Oc68OUfNTHdGd4eNNDfR3FQ8IhXbQss8aE9Vtad3Te
   A==;
X-CSE-ConnectionGUID: lbGDubjoRc6s8K6vWS6xig==
X-CSE-MsgGUID: t01S4hzTSdaSeoM9VSOdug==
X-IronPort-AV: E=McAfee;i="6700,10204,11163"; a="21701145"
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="21701145"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2024 02:03:40 -0700
X-CSE-ConnectionGUID: abWFC6qLTuuk5orQGhP3RA==
X-CSE-MsgGUID: +HheLs/4QDyiQqr8dRYPbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,288,1716274800"; 
   d="scan'208";a="63793620"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Aug 2024 02:03:38 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1se9up-0001TG-1a;
	Wed, 14 Aug 2024 09:03:35 +0000
Date: Wed, 14 Aug 2024 17:02:49 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:hch-wtf 146/253] fs/xfs/scrub/bmap.c:327:10: error:
 expected expression
Message-ID: <202408141631.YqGt0Kmg-lkp@intel.com>
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
commit: 0c8212b43f2e700349eedd8b080b9389f4748baf [146/253] xfs: allow queued realtime intents to drain before scrubbing
config: i386-buildonly-randconfig-002-20240814 (https://download.01.org/0day-ci/archive/20240814/202408141631.YqGt0Kmg-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240814/202408141631.YqGt0Kmg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408141631.YqGt0Kmg-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/scrub/bmap.c:320:10: error: call to undeclared function 'xchk_rtgroup_init_existing'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     320 |         error = xchk_rtgroup_init_existing(info->sc,
         |                 ^
   fs/xfs/scrub/bmap.c:320:10: note: did you mean 'xchk_ag_init_existing'?
   fs/xfs/scrub/common.h:115:1: note: 'xchk_ag_init_existing' declared here
     115 | xchk_ag_init_existing(
         | ^
>> fs/xfs/scrub/bmap.c:327:10: error: expected expression
     327 |         error = xchk_rtgroup_lock(info->sc, &info->sc->sr, XCHK_RTGLOCK_ALL);
         |                 ^
   fs/xfs/scrub/common.h:149:48: note: expanded from macro 'xchk_rtgroup_lock'
     149 | # define xchk_rtgroup_lock(sc, sr, lockflags)           do { } while (0)
         |                                                         ^
   2 errors generated.


vim +327 fs/xfs/scrub/bmap.c

   310	
   311	/* Cross-reference a single rtdev extent record. */
   312	STATIC void
   313	xchk_bmap_rt_iextent_xref(
   314		struct xfs_inode	*ip,
   315		struct xchk_bmap_info	*info,
   316		struct xfs_bmbt_irec	*irec)
   317	{
   318		int			error;
   319	
 > 320		error = xchk_rtgroup_init_existing(info->sc,
   321				xfs_rtb_to_rgno(ip->i_mount, irec->br_startblock),
   322				&info->sc->sr);
   323		if (!xchk_fblock_process_error(info->sc, info->whichfork,
   324				irec->br_startoff, &error))
   325			return;
   326	
 > 327		error = xchk_rtgroup_lock(info->sc, &info->sc->sr, XCHK_RTGLOCK_ALL);
   328		if (!xchk_fblock_process_error(info->sc, info->whichfork,
   329				irec->br_startoff, &error))
   330			goto out_free;
   331	
   332		xchk_xref_is_used_rt_space(info->sc, irec->br_startblock,
   333				irec->br_blockcount);
   334	
   335	out_free:
   336		xchk_rtgroup_free(info->sc, &info->sc->sr);
   337	}
   338	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
