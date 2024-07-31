Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5A31805E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jul 2024 19:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722453721; cv=none; b=gHl7RfUepxU1gj2U1I+Q17jC6Im/rkEfmmGH5iNqHytbmQz4m6szS9ER4XHUA2IFGbc2QOOM3/cql7Sgc2cAHvxiwn1lduKyAiLtmwH3el9bYdx+SPpQdi9OTG91TANbt6oD5s5DLAsz1f6bskmIHi8qoFrgKRIddV83R5AoGVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722453721; c=relaxed/simple;
	bh=xnSTTqLy26wm96qZHrb8UorwR7mB6Pph+t24qt6vyOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RAPInYNfF5Gg9g8vbFsX8sgeKu+2zINvAyFHl6+Fe+nvvAbPhL4fUMsv7EDEjdy0KdqExw8wse3/QNHmLQWx8QhjFVb4SGd5f0vMcgTsUnux7B7xlx2KQ8owPZgGjCCMy6KZBmd1W35RC1UjyrbZbb3q63RbKQZoeQtIjWTO6p0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KN/9bujz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KN/9bujz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722453719; x=1753989719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xnSTTqLy26wm96qZHrb8UorwR7mB6Pph+t24qt6vyOw=;
  b=KN/9bujzhtZoAqGbzojl2UuojNOQrezofOfyZlSNH4RQxRCQ1/jESxf9
   yLRRNElNK0VC2MLU6EW2G6qtNRbkBZrfrtazoU2+1HhmqYbRLbplsDMb+
   91D7fpLJkOq/GSa9W/FCIqD7UubFF1DBmOGEVRTaLI9KZ2CPbe4o2aOqy
   gVGEu7r+ZrfTRnONQTtVqdW2PHdqyHcbpZNRjECDRiiDLnXPTEsomDP9/
   vPX5rA1nLFatXvu1AaUdbiDyZIA0IBCpx6Tndilc3el3S8Tgc18RkbGp7
   LrVihA0QhmDddHsBbLj61cUTEz4mcdLWunH0qtJaM2imtvvtvor7/DMuu
   w==;
X-CSE-ConnectionGUID: jlW+UIbnRwGMD6AZFoTP8w==
X-CSE-MsgGUID: lmtG4X4KRF6gQmjX9expUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11150"; a="37831445"
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="37831445"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2024 12:21:58 -0700
X-CSE-ConnectionGUID: bxL/LGRUQYKvjd3K92Wvcw==
X-CSE-MsgGUID: buNhoeA4SrecQJRV9I0jlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,251,1716274800"; 
   d="scan'208";a="59620338"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 Jul 2024 12:21:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sZEtW-000ujs-2i;
	Wed, 31 Jul 2024 19:21:54 +0000
Date: Thu, 1 Aug 2024 03:20:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-per-rtg-bitmap 16/16] fs/xfs/libxfs/xfs_types.c:158
 xfs_verify_rtbno() warn: always true condition '(rtx >= (0)) => (0-u64max >=
 0)'
Message-ID: <202408010311.hEbWQg5J-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap
head:   8b529e4989033bbdaa794c3ed2632d2684994e17
commit: 8b529e4989033bbdaa794c3ed2632d2684994e17 [16/16] xfs: use per-RTG bitmaps and summaries
config: x86_64-randconfig-161-20240731 (https://download.01.org/0day-ci/archive/20240801/202408010311.hEbWQg5J-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408010311.hEbWQg5J-lkp@intel.com/

smatch warnings:
fs/xfs/libxfs/xfs_types.c:158 xfs_verify_rtbno() warn: always true condition '(rtx >= (0)) => (0-u64max >= 0)'

vim +158 fs/xfs/libxfs/xfs_types.c

   138	
   139	/*
   140	 * Verify that a realtime block number pointer neither points outside the
   141	 * allocatable areas of the rtgroup nor off the end of the realtime
   142	 * device.
   143	 */
   144	inline bool
   145	xfs_verify_rtbno(
   146		struct xfs_mount	*mp,
   147		xfs_rtblock_t		rtbno)
   148	{
   149		if (rtbno >= mp->m_sb.sb_rblocks)
   150			return false;
   151	
   152		if (xfs_has_rtgroups(mp)) {
   153			xfs_rgnumber_t	rgno = xfs_rtb_to_rgno(mp, rtbno);
   154			xfs_rtxnum_t	rtx = xfs_rtb_to_rtx(mp, rtbno);
   155	
   156			if (rgno >= mp->m_sb.sb_rgcount)
   157				return false;
 > 158			if (rtx >= xfs_rtgroup_extents(mp, rgno))
   159				return false;
   160			if (xfs_has_rtsb(mp) && rgno == 0 && rtx == 0)
   161				return false;
   162		}
   163		return true;
   164	}
   165	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
