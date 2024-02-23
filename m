Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34F02D2E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Feb 2024 03:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708659822; cv=none; b=fVIOwrzO19P8i33RTB7gDK80W29o3NsOFlrqHmo36moq9OKRYF5VAl319qaRou/oawcIMEByT8pw/o1idmJcSQl6qfnlf+5YsM3jFIuGIcLP5sFLDlqAy5J9ajt1AI8mugsdskQd+DYz0hmAXxe+nvs3ZvZBNCDHYhssr1I2eUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708659822; c=relaxed/simple;
	bh=9ymyFd8qP5AJmeZOnPiaCJNQWKqgv6JctuyNuH9ZU9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P/vNdWqdVzUJpN4iUNuF1+zXG9V6saLs+STcrH45ubNmJBoRLgzrX+ODxEwiS4UC0GSq9liKDZJjrAl2tRwBAuipytrS1LLFjl6RT2QVoCyvuJv4V0h5Zzy2kbRoP028gztgvRVQ4SQBsCTjlWwaRKRic+xbY1eWHbDagIXvIT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1wtvbMg; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1wtvbMg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708659821; x=1740195821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ymyFd8qP5AJmeZOnPiaCJNQWKqgv6JctuyNuH9ZU9Q=;
  b=j1wtvbMgrpmWMM3urGqi+RUH6scRP1By1fpezuucKd0IlbYXzmySXP4M
   U+6AV1c7qpixVnvX9piViav+QOA9gwi1dr/m1dB7SQVOcAKnZ89XBH8oE
   4/nz8DK7CvTv2Na0WITxi1mrWPvUfOwTEZE5e0EGfQqCaKoMX/W3JhGYa
   yjhxKUWve4iqflzbALBAywcnwcK30QCZ7+wODZiv2qWEN1KmSLbpvXItu
   lsSYD1dSDCjRMmxc9XtOrroh0poMSLddwPockqkIyswKvWYCZOBUlL5Iv
   zngGrd4JboN/yITkeR4Vb2TNZgjgdiHDZyt3+JDL67D2SNZNAVyn65MOA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2820964"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2820964"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 19:43:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5667630"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 22 Feb 2024 19:43:38 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rdMTI-00071w-0s;
	Fri, 23 Feb 2024 03:43:36 +0000
Date: Fri, 23 Feb 2024 11:42:48 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 168/290] fs/xfs/xfs_exchmaps_item.c:347
 xfs_xmi_validate() warn: unsigned 'xlf->xmi_isize1' is never less than zero.
Message-ID: <202402231124.lgjVgoUc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   c89b9c47d9854d63bcf3b735701f0e3f46e84015
commit: d2cbfa09f80bbaa369d45a791b4364a002dd778a [168/290] xfs: create deferred log items for file mapping exchanges
config: i386-randconfig-141-20240222 (https://download.01.org/0day-ci/archive/20240223/202402231124.lgjVgoUc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402231124.lgjVgoUc-lkp@intel.com/

smatch warnings:
fs/xfs/xfs_exchmaps_item.c:347 xfs_xmi_validate() warn: unsigned 'xlf->xmi_isize1' is never less than zero.
fs/xfs/xfs_exchmaps_item.c:347 xfs_xmi_validate() warn: unsigned 'xlf->xmi_isize2' is never less than zero.

vim +347 fs/xfs/xfs_exchmaps_item.c

   323	
   324	/* Is this recovered XMI ok? */
   325	static inline bool
   326	xfs_xmi_validate(
   327		struct xfs_mount		*mp,
   328		struct xfs_xmi_log_item		*xmi_lip)
   329	{
   330		struct xfs_xmi_log_format	*xlf = &xmi_lip->xmi_format;
   331	
   332		if (!xfs_sb_version_haslogexchmaps(&mp->m_sb) &&
   333		    !xfs_exchmaps_can_use_without_log_assistance(mp))
   334			return false;
   335	
   336		if (xmi_lip->xmi_format.__pad != 0)
   337			return false;
   338	
   339		if (xlf->xmi_flags & ~XFS_EXCHMAPS_LOGGED_FLAGS)
   340			return false;
   341	
   342		if (!xfs_verify_ino(mp, xlf->xmi_inode1) ||
   343		    !xfs_verify_ino(mp, xlf->xmi_inode2))
   344			return false;
   345	
   346		if ((xlf->xmi_flags & XFS_EXCHMAPS_SET_SIZES) &&
 > 347		     (xlf->xmi_isize1 < 0 || xlf->xmi_isize2 < 0))
   348			return false;
   349	
   350		if (!xfs_verify_fileext(mp, xlf->xmi_startoff1, xlf->xmi_blockcount))
   351			return false;
   352	
   353		return xfs_verify_fileext(mp, xlf->xmi_startoff2, xlf->xmi_blockcount);
   354	}
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
