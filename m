Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B26E190674
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732526609; cv=none; b=Fm8ScXVhP2496bEzy6e5tc3NtLkJk4QoKDfGF3N67vmSNuYLWAEjv7zzpjZUi3xP6qx4P6diZlo963MwopN+UdxdFLdCv5hs7PpYAGoVNUbnD84YrjYmlh8blBAboLNA1neCBcysCYKCChvL2z9s0XtS2OSP33kpN+ojbxUPBEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732526609; c=relaxed/simple;
	bh=qQLtBeQsrAqgQ+CstFPKN+HRS2G0khV21ksSBgUdYO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iEuv3wEgkTnZoC8noiq/hpBsg7GE/BL7hx0fO7/dRk6/xAvjZiX4APcac1tW3Fwpu/8kUPpxYHZnM7/XwevP5aTtpRXoQx/9ZYxcJA+vqEJFnNkS2BsZOdSw16DTMnpW9xtK+iMZCoULpzQnREE3UmnoC8vKodCm0T5kMdAE+3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RdAqeRAj; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RdAqeRAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732526608; x=1764062608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qQLtBeQsrAqgQ+CstFPKN+HRS2G0khV21ksSBgUdYO0=;
  b=RdAqeRAjeK0La0QgoAlWkVaxxij3m58TAaRxoUJgT6K3zd3DUiFmkVmm
   tTZeVnz1pBPriWR0d9AAZvn9jQPB0/OWwuLJGovZ59ANqSB80NO2iH74C
   g7aH3QDGNeRCuL2qDjEbbRa+v9OdWGssuH+OF1X/JP0dhZpMrW3kmvyLv
   MxkSab4OhsgPhHaYTVzZU1NuAbHp4Ced9G4Q90eIuyKpYDbIqlldrIohX
   S//9y4i9kQTmR2tW84U0RdjVqvGpNolCcc2/dUnmY1A3U674U3YUJov86
   58JL++89XVPyf0KWnkkNLYJkXcWfYxo3J2N3i2yBEPOjY0xTlXGa3FeZC
   Q==;
X-CSE-ConnectionGUID: yseafTssS2m4XWJwt+mKXw==
X-CSE-MsgGUID: zURCDEpPSLKUgCFpDTwDRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11266"; a="20212531"
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="20212531"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 01:23:27 -0800
X-CSE-ConnectionGUID: ITagBsfKR5+hUuifB7vYGg==
X-CSE-MsgGUID: 11rjMfd0QFGEiBAJBg1MXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,182,1728975600"; 
   d="scan'208";a="91999376"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2024 01:23:26 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFVJT-000675-1x;
	Mon, 25 Nov 2024 09:23:23 +0000
Date: Mon, 25 Nov 2024 17:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:xfs-6.13-fixes 159/160] fs/xfs/xfs_dquot_item.c:231:51:
 error: expected identifier or '(' before 'void'
Message-ID: <202411251732.6yA3God9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfs-6.13-fixes
head:   90f5ef1b89eb33844fc8254ba587ba0616c0bf26
commit: 96b52de46213f7649b154a413fd9dfcf65b2f109 [159/160] xfs: attach dquot buffer to dquot log item buffer
config: mips-ip22_defconfig (https://download.01.org/0day-ci/archive/20241125/202411251732.6yA3God9-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241125/202411251732.6yA3God9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411251732.6yA3God9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_dquot_item.c:231:51: error: expected identifier or '(' before 'void'
     231 | # define xfs_qm_dquot_logitem_precommit(...)    ((void)0)
         |                                                   ^~~~
   fs/xfs/xfs_dquot_item.c:235:1: note: in expansion of macro 'xfs_qm_dquot_logitem_precommit'
     235 | xfs_qm_dquot_logitem_precommit(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/xfs_dquot_item.c:231:56: error: expected ')' before numeric constant
     231 | # define xfs_qm_dquot_logitem_precommit(...)    ((void)0)
         |                                                        ^
   fs/xfs/xfs_dquot_item.c:235:1: note: in expansion of macro 'xfs_qm_dquot_logitem_precommit'
     235 | xfs_qm_dquot_logitem_precommit(
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/xfs/xfs_dquot_item.c:253:27: error: 'xfs_qm_dquot_logitem_precommit' undeclared here (not in a function); did you mean 'xfs_qm_dquot_logitem_format'?
     253 |         .iop_precommit  = xfs_qm_dquot_logitem_precommit,
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                           xfs_qm_dquot_logitem_format


vim +231 fs/xfs/xfs_dquot_item.c

   208	
   209	#ifdef DEBUG_EXPENSIVE
   210	static void
   211	xfs_qm_dquot_logitem_precommit_check(
   212		struct xfs_dquot	*dqp)
   213	{
   214		struct xfs_mount	*mp = dqp->q_mount;
   215		struct xfs_disk_dquot	ddq = { };
   216		xfs_failaddr_t		fa;
   217	
   218		xfs_dquot_to_disk(&ddq, dqp);
   219		fa = xfs_dquot_verify(mp, &ddq, dqp->q_id);
   220		if (fa) {
   221			XFS_CORRUPTION_ERROR("Bad dquot during logging",
   222					XFS_ERRLEVEL_LOW, mp, &ddq, sizeof(ddq));
   223			xfs_alert(mp,
   224	 "Metadata corruption detected at %pS, dquot 0x%x",
   225					fa, dqp->q_id);
   226			xfs_force_shutdown(mp, SHUTDOWN_CORRUPT_INCORE);
   227			ASSERT(fa == NULL);
   228		}
   229	}
   230	#else
 > 231	# define xfs_qm_dquot_logitem_precommit(...)	((void)0)
   232	#endif
   233	
   234	static int
   235	xfs_qm_dquot_logitem_precommit(
   236		struct xfs_trans	*tp,
   237		struct xfs_log_item	*lip)
   238	{
   239		struct xfs_dq_logitem	*qlip = DQUOT_ITEM(lip);
   240		struct xfs_dquot	*dqp = qlip->qli_dquot;
   241		int			error;
   242	
   243		error = xfs_dquot_attach_buf(tp, dqp);
   244		if (error)
   245			return error;
   246	
   247		xfs_qm_dquot_logitem_precommit_check(dqp);
   248		return 0;
   249	}
   250	
   251	static const struct xfs_item_ops xfs_dquot_item_ops = {
   252		.iop_size	= xfs_qm_dquot_logitem_size,
 > 253		.iop_precommit	= xfs_qm_dquot_logitem_precommit,
   254		.iop_format	= xfs_qm_dquot_logitem_format,
   255		.iop_pin	= xfs_qm_dquot_logitem_pin,
   256		.iop_unpin	= xfs_qm_dquot_logitem_unpin,
   257		.iop_release	= xfs_qm_dquot_logitem_release,
   258		.iop_committing	= xfs_qm_dquot_logitem_committing,
   259		.iop_push	= xfs_qm_dquot_logitem_push,
   260	};
   261	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
