Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A74884FDE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Mar 2024 14:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711030611; cv=none; b=UNZITPeQrabFpV1mTfOMdJ2w51H9JuZ7o1Gk+I26b7+jmNDZw/DsPfvp0mNN7AD8Vjs8V4R6iGEpR8QouvktIu4qbtn4MQH0j2FDh/9xIiuKauDuRZkFYrLHSYOlbRj+GjXxahfHQ6UPmkRWORoW3mPQRsVGunpeE2Uz1R+FuQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711030611; c=relaxed/simple;
	bh=vikI76whCRsvYjmTNEuSF+7Mob08famwZbArH2gQLG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pHban+fBy9hukZ+ey/mG4qqEgztoM3FY4xDmLDI8Uz52tw4jm/rgCerLt3Ap+oWTGBEbM5FCr50UoDGs5XuF1wJ2ypHTKBy3/R/M3jjGg8Yr4hxTpzjs/U4tPdubpmApiXxwlMy7/5QkRftBQ6VNwvgDR+JML5opA7KpoHfLQ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A0B1Ruld; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A0B1Ruld"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711030610; x=1742566610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vikI76whCRsvYjmTNEuSF+7Mob08famwZbArH2gQLG4=;
  b=A0B1RuldSqPqgZN/LMv+i02weeowhp9ipO/AHFgKUC2aP7wUiTsQ/b+M
   Nrhz0kJrJDyUG8eioT1pHqFh98xnGwdMoOsJXET7MzSUTf/1TqtPdTUPi
   RaEiJiSN2iNbMau3hr8V2za0gw4KKVxigwvCc2e9vY+SrBfdsvYEs/msS
   mbwUIW0TdbvWWsZ3jqec7PrpEV60dc+Sj5GRiXqvEj1/Kq6+FN8oGFZHF
   Vq/c4VDrEeJxpI5ZRQ7GFB5e1eA8HUfWUAjTqONorB7ohbuc28RhriVJf
   LZGMMAi45MmgDAdPY+D+EptR3aL8JofLKOzZqu6kIzO8ZPvtbpeEmXD2b
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11019"; a="9804527"
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="9804527"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2024 07:16:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,143,1708416000"; 
   d="scan'208";a="14523998"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Mar 2024 07:16:48 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rnJDq-000JV5-19;
	Thu, 21 Mar 2024 14:16:46 +0000
Date: Thu, 21 Mar 2024 22:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:vectorized-scrub 261/307] fs/xfs/xfs_attr_item.h:62:6:
 warning: conflicting types for 'xfs_attr_defer_add' due to enum/integer
 mismatch; have 'void(struct xfs_da_args *, enum xfs_attr_defer_op)'
Message-ID: <202403212222.a5J8mAq4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git vectorized-scrub
head:   9caa68cf2446064f22252e4f87e40dca15c5e983
commit: 767e7f79c1faa47d8848189b73c0c439bf59edf9 [261/307] xfs: parent pointer attribute creation
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20240321/202403212222.a5J8mAq4-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240321/202403212222.a5J8mAq4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403212222.a5J8mAq4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/libxfs/xfs_attr.c:27:
>> fs/xfs/xfs_attr_item.h:62:6: warning: conflicting types for 'xfs_attr_defer_add' due to enum/integer mismatch; have 'void(struct xfs_da_args *, enum xfs_attr_defer_op)' [-Wenum-int-mismatch]
      62 | void xfs_attr_defer_add(struct xfs_da_args *args, enum xfs_attr_defer_op op);
         |      ^~~~~~~~~~~~~~~~~~
   In file included from fs/xfs/libxfs/xfs_attr.c:21:
   fs/xfs/libxfs/xfs_attr.h:552:6: note: previous declaration of 'xfs_attr_defer_add' with type 'void(struct xfs_da_args *, unsigned int)'
     552 | void xfs_attr_defer_add(struct xfs_da_args *args, unsigned int op_flags);
         |      ^~~~~~~~~~~~~~~~~~


vim +62 fs/xfs/xfs_attr_item.h

b6bc883912df67 Darrick J. Wong 2024-03-20  61  
b6bc883912df67 Darrick J. Wong 2024-03-20 @62  void xfs_attr_defer_add(struct xfs_da_args *args, enum xfs_attr_defer_op op);
b768c885474e31 Darrick J. Wong 2024-01-09  63  void xfs_parent_defer_update(struct xfs_da_args *args,
b768c885474e31 Darrick J. Wong 2024-01-09  64  		enum xfs_attr_defer_op op);
b6bc883912df67 Darrick J. Wong 2024-03-20  65  

:::::: The code at line 62 was first introduced by commit
:::::: b6bc883912df67c5a9707337e47dd407557eefc0 xfs: move xfs_attr_defer_add to xfs_attr_item.c

:::::: TO: Darrick J. Wong <djwong@kernel.org>
:::::: CC: Darrick J. Wong <djwong@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
