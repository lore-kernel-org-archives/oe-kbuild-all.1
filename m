Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C30A1A5B90
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 04:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749010409; cv=none; b=Fv02UY9i3lP+72XgyhRVh3MvcBgZj4nYP274SD1VIf1rh0M4k+VxxMiJJNn9DTBcr/9rFWnh+GEA86CrC9eUW3URtXb++ySPdEzIOw/CaifsOoLtQAvw3cUnyUmeIJiH3/piyS9sdo+0qqNJMzrjyr4Zc7ta7pPMqLvfMl3IJX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749010409; c=relaxed/simple;
	bh=yMuWpbCxYItTvYIFBlGZHkf+n4la7sVudlTPcEONqmk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cH0i0IWMo6m2P2nh9ubf6Nk4xRABzq6GGIMGf5/rQlIlRgo1FUS19toqh0eZNNCR53AzCUwDYHCaQy11qYhSRjvrWADE8eGkrPwE29IipDiSQ8TPEeBCa3k3aDgEmYjyDqk3vFeU2zRLtU/rmTjmiHpVHUrOU4UN9Ph50cYfGjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X6Cj1e65; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X6Cj1e65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749010408; x=1780546408;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yMuWpbCxYItTvYIFBlGZHkf+n4la7sVudlTPcEONqmk=;
  b=X6Cj1e65jGj0aLUdGmE/qyDV9ALDzIAFZTyHkwpvOMbnPj4w7g/hUOye
   13RhATnHmo8v6p1BMMwfbjdpXwe0gBScWw0HqoglQJTr/ynQeZKO0x74c
   2WEpEW0+zF4s1MG+S3AV2E3NrOwZOTpitrsJWjLmty3LIuyFrHlxY58/4
   lE9fDaOqciqrVH3LMCECpA9Z88yWIm9UBqs1KS2t6wEXl02vO0EdoBa2Z
   rHXAgZ77FmtcQMMXw4ijBVUyWTofhc6/Ejd7WW8DyyVeWpn5q2uJ6Sdg+
   J2KZuMYtGoNPhYbeDm/Omz70pYhsYfljmRJNzmUvN2OgjMuIr4TtB2lrq
   Q==;
X-CSE-ConnectionGUID: MWcWLOQaTdWWwcM1jm6xYg==
X-CSE-MsgGUID: d5UKc9zDS3Oktf25+gkVIw==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="73605466"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="73605466"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 21:13:27 -0700
X-CSE-ConnectionGUID: v0LX/Ib6RZKm3bvejwpzqA==
X-CSE-MsgGUID: RgRK8F7mQYCJOwVuK1hyQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="146039856"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa008.jf.intel.com with ESMTP; 03 Jun 2025 21:13:27 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMfVE-0001d0-1U;
	Wed, 04 Jun 2025 04:13:24 +0000
Date: Wed, 4 Jun 2025 12:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Long Li <leo.lilong@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2882/2882] fs/xfs/libxfs/xfs_alloc.c:91:1:
 warning: no previous prototype for 'xfs_ag_fixup_aside'
Message-ID: <202506041220.e30nmQAk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   b5ec139da1a4916dfc9644ee3d9426dbd6f23c13
commit: 12a5c9f8f69c682f3aaf799a18f4a3631cc9bfbc [2882/2882] xfs: fix xfs shutdown since we reserve more blocks in agfl fixup
config: x86_64-buildonly-randconfig-2003-20250502 (https://download.01.org/0day-ci/archive/20250604/202506041220.e30nmQAk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041220.e30nmQAk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041220.e30nmQAk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/xfs/libxfs/xfs_alloc.c:91:1: warning: no previous prototype for 'xfs_ag_fixup_aside' [-Wmissing-prototypes]
      91 | xfs_ag_fixup_aside(
         | ^~~~~~~~~~~~~~~~~~


vim +/xfs_ag_fixup_aside +91 fs/xfs/libxfs/xfs_alloc.c

    83	
    84	/*
    85	 * Twice fixup for the same ag may happen within exact one tp, and the consume
    86	 * of agfl after first fixup may trigger second fixup's failure, then xfs will
    87	 * shutdown. To avoid that, we reserve blocks which can satisfy the second
    88	 * fixup.
    89	 */
    90	xfs_extlen_t
  > 91	xfs_ag_fixup_aside(
    92		struct xfs_mount	*mp)
    93	{
    94		xfs_extlen_t ret;
    95	
    96		ret = 2 * mp->m_ag_maxlevels;
    97		if (xfs_has_rmapbt(mp))
    98			ret += mp->m_rmap_maxlevels;
    99	
   100		return ret;
   101	}
   102	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
