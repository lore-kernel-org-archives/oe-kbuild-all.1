Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6AC46AF0A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 19:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785440036; cv=none; b=FM/hZ/ScV00t3KGhJBLy3sS5QCSJxIa4ihWi8ZPs/M++tT2qcuPpgxAnHtb1MX//pZHxLFXy0F4PelNtQ0c15PIrMTBLg7+4tN777JWfYU1vQpAG14Gngz8512fUw17JZFtW3YjGztT/0UdKwFmK3v4f+/FKgdeil7x80GUkjxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785440036; c=relaxed/simple;
	bh=cH2GnlV7YIf6VzjReq7zFU8cIhszr9XUHhJIAXVGWEc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kX2hzpV218ugHnqhGiym1pPNhK/2ssdCj09gpmoQbhbSVkYQEP7Z+QDaEfkfLwMSDdRbM5et4pVa7Y5RWeua+BeGlRLcN84MrA+tSqOYRHhhqUkwk/Kfhx3QHg+/HOMOxGmew7wMXZFQx6pGOjSpNjJNde39jPbK4mgVt6H7sqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=knfvs0ji; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="knfvs0ji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785440033; x=1816976033;
  h=date:from:to:cc:subject:message-id;
  bh=cH2GnlV7YIf6VzjReq7zFU8cIhszr9XUHhJIAXVGWEc=;
  b=knfvs0jiCGvZR4hcZDCMga0lE7L/dG+taS7lf9dr9sSNsijmRCxkTOjZ
   fRlT2+g/LXaTUkEYoWKKZ2Df7XiyAT/43hFB8GeDCo8+5N3HYl45YNyiq
   FoCIqsSgOmLUnT9fuvfXHUE5NHKy/EI7lyUxlu5D2v4oH2RFqizmkINV1
   RmfS8AhL9rZw/LtotDY2e8J9u7S7HIQ02691M+IhkA22dHaG1GvPGjyLo
   AXUil4aXJYR7SmT7tary9ozyqXfFcTaOxZ4+kF5h8he88QclJtLrVa5v4
   CdyMHp4vItRXnLF+ZJQBjWioMPt6DtFar2C40A/IdrhrCP7wN4Rj/mfYw
   A==;
X-CSE-ConnectionGUID: ALVNNVe6QHGv5s1+AWIWqA==
X-CSE-MsgGUID: XTZfQlGlRE6te84JgNisBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="96653644"
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="96653644"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 12:33:51 -0700
X-CSE-ConnectionGUID: 1qV8rNPVT+2w55g8Pb+0gQ==
X-CSE-MsgGUID: 1LHKTEq3R9aKkKhvmXlyzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,195,1779174000"; 
   d="scan'208";a="284978228"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 30 Jul 2026 12:33:49 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpWVi-00000000hWF-46Yv;
	Thu, 30 Jul 2026 19:33:44 +0000
Date: Fri, 31 Jul 2026 03:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <djwong@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:llm-fixes-26 145/152]
 fs/xfs/scrub/inode_repair.c:584:42: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202607310357.kvo4TqJT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git llm-fixes-26
head:   7f719c581807433d0c722404bea24449515f2c41
commit: a8cbef31a928e0bc0c07cf1c04878f47c0014b6c [145/152] xfs: zero out di_metatype when removing the metadir file iflag
config: mips-randconfig-r132-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310357.kvo4TqJT-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project bacfe2950f8218268fcc0a8765644ea0c15f0360)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310357.kvo4TqJT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310357.kvo4TqJT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/inode_repair.c:584:42: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __be16 [usertype] di_metatype @@     got restricted __be32 [usertype] @@
   fs/xfs/scrub/inode_repair.c:584:42: sparse:     expected restricted __be16 [usertype] di_metatype
   fs/xfs/scrub/inode_repair.c:584:42: sparse:     got restricted __be32 [usertype]

vim +584 fs/xfs/scrub/inode_repair.c

   539	
   540	/* Fix any conflicting flags that the verifiers complain about. */
   541	STATIC void
   542	xrep_dinode_flags(
   543		struct xfs_scrub	*sc,
   544		struct xfs_dinode	*dip,
   545		bool			isrt)
   546	{
   547		struct xfs_mount	*mp = sc->mp;
   548		uint64_t		flags2 = be64_to_cpu(dip->di_flags2);
   549		uint16_t		flags = be16_to_cpu(dip->di_flags);
   550		uint16_t		mode = be16_to_cpu(dip->di_mode);
   551	
   552		trace_xrep_dinode_flags(sc, dip);
   553	
   554		if (isrt)
   555			flags |= XFS_DIFLAG_REALTIME;
   556		else
   557			flags &= ~XFS_DIFLAG_REALTIME;
   558	
   559		/*
   560		 * For regular files on a reflink filesystem, set the REFLINK flag to
   561		 * protect shared extents.  A later stage will actually check those
   562		 * extents and clear the flag if possible.
   563		 */
   564		if (xfs_has_reflink(mp) && S_ISREG(mode))
   565			flags2 |= XFS_DIFLAG2_REFLINK;
   566		else
   567			flags2 &= ~(XFS_DIFLAG2_REFLINK | XFS_DIFLAG2_COWEXTSIZE);
   568		if (!xfs_has_bigtime(mp))
   569			flags2 &= ~XFS_DIFLAG2_BIGTIME;
   570		if (!xfs_has_large_extent_counts(mp))
   571			flags2 &= ~XFS_DIFLAG2_NREXT64;
   572		if (flags2 & XFS_DIFLAG2_NREXT64)
   573			dip->di_nrext64_pad = 0;
   574		else if (dip->di_version >= 3)
   575			dip->di_v3_pad = 0;
   576	
   577		if (flags2 & XFS_DIFLAG2_METADATA) {
   578			xfs_failaddr_t	fa;
   579	
   580			fa = xfs_dinode_verify_metadir(sc->mp, dip, mode, flags,
   581					flags2);
   582			if (fa) {
   583				flags2 &= ~XFS_DIFLAG2_METADATA;
 > 584				dip->di_metatype = cpu_to_be32(XFS_METAFILE_UNKNOWN);
   585			}
   586		}
   587	
   588		dip->di_flags = cpu_to_be16(flags);
   589		dip->di_flags2 = cpu_to_be64(flags2);
   590	}
   591	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
