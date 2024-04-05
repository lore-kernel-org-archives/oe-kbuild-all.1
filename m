Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 786C6535B6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Apr 2024 11:39:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712317186; cv=none; b=cKDlZHsPGy7L6sc6hVIJpqI2LTFRKB/5AkskV5Us8M2qfW8pn62mXyw3YKShCkCvfujzCnRdj/8cMFIrXm+3idi4ukl1zgiyOiQU2452BdsHRddYkQ4iAcDRye8wxKiMT6w0aw7uvnQiT+vXpYFRgb8/YYvzbB/vPn05yP6BenI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712317186; c=relaxed/simple;
	bh=SXww4ggCLsDahTC58dZOhY+9dTSbdtKObzydug1CUi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fw5qNchkY0wafTl8A1qvHoK9cPk98OkYHLFeR/OJ7Rpks0nuWlEYA86LQvFXG0BAiXaroKoHSv8hq9YxAXl+W1PGqobsnz+m/wdO96pW85Q77WVTa4xT1iooQjZcYJ6lNyiZuQwMNWjaH5llbbyN01Aqdx9ZAh8GVyaFO+cT/HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oBtN048p; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oBtN048p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712317184; x=1743853184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SXww4ggCLsDahTC58dZOhY+9dTSbdtKObzydug1CUi4=;
  b=oBtN048pLPKYbHa5IGmDtHGKMXBPZSzxvNdIhdA2L42Fotep5HZ0V911
   dn6lGHkT/VA5nEX/iYXGHxISN5J20gvXSURR2lSAv8qEF6D9EHL9iMyCo
   7ZuMC2Ak1eHTqv4/bKVfXVwskSjZG82IpEIoyA0cjdkrlT4cy6AYpPpq4
   4Et1YE++Ir0M2CcAbBNGpUazWwLf3QEcpsOedLWqKDLqQJhlfQSW12Lxo
   9Yr0jMo8TZtaIZqwvki13eyAIeUvXtAueXDisH82k8MQJ7o/bCrfTS7k4
   780Taghh5rx2/Nj3zsV/l8EISZir5CW1E5WBl24M1zwNX0njYd35LXoOq
   Q==;
X-CSE-ConnectionGUID: T4ziIg5pQZ2d0t0wl/I+CQ==
X-CSE-MsgGUID: X0oUuSXWQyW430RPYdyFfA==
X-IronPort-AV: E=McAfee;i="6600,9927,11034"; a="7481517"
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="7481517"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2024 04:39:44 -0700
X-CSE-ConnectionGUID: XkOOgWsiSo6l5MJG7Pfozg==
X-CSE-MsgGUID: JaGLREURSRKPHB8UyL3pYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,181,1708416000"; 
   d="scan'208";a="19169279"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 05 Apr 2024 04:39:43 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rshv2-0002Di-26;
	Fri, 05 Apr 2024 11:39:40 +0000
Date: Fri, 5 Apr 2024 19:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 126/162] fs/xfs/xfs_handle.c:804:27:
 sparse: sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202404051936.5RNctx1k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   85240c8c44aab15d3c6506be48f62eb9b7807f29
commit: bfb94a70e7a4ca92d7e895de9c485f01a5a8cd0b [126/162] xfs: Add parent pointer ioctls
config: alpha-randconfig-r123-20240405 (https://download.01.org/0day-ci/archive/20240405/202404051936.5RNctx1k-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240405/202404051936.5RNctx1k-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404051936.5RNctx1k-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/xfs_handle.c:804:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __user *to @@     got void * @@
   fs/xfs/xfs_handle.c:804:27: sparse:     expected void [noderef] __user *to
   fs/xfs/xfs_handle.c:804:27: sparse:     got void *

vim +804 fs/xfs/xfs_handle.c

   720	
   721	/* Retrieve the parent pointers for a given inode. */
   722	STATIC int
   723	xfs_getparents(
   724		struct xfs_getparents_ctx	*gpx)
   725	{
   726		struct xfs_getparents		*gp = &gpx->gph.gph_request;
   727		struct xfs_inode		*ip = gpx->ip;
   728		struct xfs_mount		*mp = ip->i_mount;
   729		size_t				bufsize;
   730		int				error;
   731	
   732		/* Check size of buffer requested by user */
   733		if (gp->gp_bufsize > XFS_XATTR_LIST_MAX)
   734			return -ENOMEM;
   735		if (gp->gp_bufsize < xfs_getparents_rec_sizeof(1))
   736			return -EINVAL;
   737	
   738		if (gp->gp_iflags & ~XFS_GETPARENTS_IFLAGS_ALL)
   739			return -EINVAL;
   740		if (gp->__pad)
   741			return -EINVAL;
   742	
   743		bufsize = round_down(gp->gp_bufsize, sizeof(uint32_t));
   744		gpx->krecords = kvzalloc(bufsize, GFP_KERNEL);
   745		if (!gpx->krecords) {
   746			bufsize = min(bufsize, PAGE_SIZE);
   747			gpx->krecords = kvzalloc(bufsize, GFP_KERNEL);
   748			if (!gpx->krecords)
   749				return -ENOMEM;
   750		}
   751	
   752		gpx->context.dp = ip;
   753		gpx->context.resynch = 1;
   754		gpx->context.put_listent = xfs_getparents_put_listent;
   755		gpx->context.bufsize = bufsize;
   756		/* firstu is used to track the bytes filled in the buffer */
   757		gpx->context.firstu = 0;
   758	
   759		/* Copy the cursor provided by caller */
   760		memcpy(&gpx->context.cursor, &gp->gp_cursor,
   761				sizeof(struct xfs_attrlist_cursor));
   762		gp->gp_count = 0;
   763		gp->gp_oflags = 0;
   764	
   765		trace_xfs_getparents_begin(ip, gp, &gpx->context.cursor);
   766	
   767		error = xfs_attr_list(&gpx->context);
   768		if (error)
   769			goto out_free_buf;
   770		if (gpx->context.seen_enough < 0) {
   771			error = gpx->context.seen_enough;
   772			goto out_free_buf;
   773		}
   774	
   775		/* Update the caller with the current cursor position */
   776		memcpy(&gp->gp_cursor, &gpx->context.cursor,
   777				sizeof(struct xfs_attrlist_cursor));
   778	
   779		/* Is this the root directory? */
   780		if (ip->i_ino == mp->m_sb.sb_rootino)
   781			gp->gp_oflags |= XFS_GETPARENTS_OFLAG_ROOT;
   782	
   783		if (gpx->context.seen_enough == 0) {
   784			/*
   785			 * If we did not run out of buffer space, then we reached the
   786			 * end of the pptr recordset, so set the DONE flag.
   787			 */
   788			gp->gp_oflags |= XFS_GETPARENTS_OFLAG_DONE;
   789		} else if (gp->gp_count == 0) {
   790			/*
   791			 * If we ran out of buffer space before copying any parent
   792			 * pointers at all, the caller's buffer was too short.  Tell
   793			 * userspace that, erm, the message is too long.
   794			 */
   795			error = -EMSGSIZE;
   796			goto out_free_buf;
   797		}
   798	
   799		trace_xfs_getparents_end(ip, gp, &gpx->context.cursor);
   800	
   801		ASSERT(gpx->context.firstu <= gpx->gph.gph_request.gp_bufsize);
   802	
   803		/* Copy the records to userspace. */
 > 804		if (copy_to_user((void *)gpx->gph.gph_request.gp_buffer,
   805					gpx->krecords, gpx->context.firstu))
   806			error = -EFAULT;
   807	
   808	out_free_buf:
   809		kvfree(gpx->krecords);
   810		gpx->krecords = NULL;
   811		return error;
   812	}
   813	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
