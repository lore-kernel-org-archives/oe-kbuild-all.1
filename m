Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C058632C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 23:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745279785; cv=none; b=ESl6y/3nbLSUbV2pqLsxZUMfMFitPOetk0fIhW2J+uAqWFMf0RhWz1FylprvldzjL5lALCF80obFakbDdtLOS6hQ1eG72PTuJkX/PbVD2D+adUtwyI5VhfYqxzBdE6RdiPNFaIHVx6AAe/FcLJT+MnwxwKWImuy3kiSkGZZFmr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745279785; c=relaxed/simple;
	bh=Ha5JhT9x/oEIbmUQQmDcrgdEShNenD0nQYKmH7OK4x4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WccmdNaeItijCZyC4G0EGsb2yUS9LbHrZswRxnQvFBES5veNOZwOGlpyXdCzstqLq1qcNM8itGEjuDGDEOOyoW0931cZgVENuEGlQNPoGdl4GtfB07vWjg5gbvoMcJ3BxW/FMqNjy3p7eDglbDRj+3mdhLKaQoXri0LWGtfL6QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HrD9zgJq; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HrD9zgJq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745279780; x=1776815780;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ha5JhT9x/oEIbmUQQmDcrgdEShNenD0nQYKmH7OK4x4=;
  b=HrD9zgJqdmfwWo8hwfuK9MvCmL9mh2C0L23yi6hhg3XRrUaNX/3ImV0S
   0urphi97ZcNPrTDO/zvvqxPVfxkJYrkuXzVC7KEP2E+LePTHcNJMT09gg
   JKLFa/bIdKVSugqRcY3Nk2P6OgwHkl+B8pIJhj4OozfFqgQTc3k7tZhZw
   21bAd2vLBWqBcNBVZFms5kseWoLbsJnHMgMAm9QRwu8gC5KKh77My6Zp1
   tY06LztY/FoqJt/RdICKoMZnsoXRtpGB4yT6cRzjHQrJXlI0z2ZgRk4Zq
   q9fwt5yB2PqLoZ2K+aeGWmL+SOfY67ECmg3q+i/M8iAg1vu1JjtgOo7xF
   A==;
X-CSE-ConnectionGUID: 7qbsSDBBTgyY6rI6u5ZK3g==
X-CSE-MsgGUID: Oq+wBmCDQ5y1+Qlpd+Jfgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="46833340"
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="46833340"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 16:56:19 -0700
X-CSE-ConnectionGUID: qg88fy+fSk+m6ejlvJ+N5Q==
X-CSE-MsgGUID: rp/o1dJySsy2MIbujZxLBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,229,1739865600"; 
   d="scan'208";a="162909942"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Apr 2025 16:56:18 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u70zo-0000T9-0H;
	Mon, 21 Apr 2025 23:56:16 +0000
Date: Tue, 22 Apr 2025 07:56:05 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:atomic-writes-6.15 21/21] fs/xfs/xfs_mount.c:771:
 undefined reference to `__umoddi3'
Message-ID: <202504220730.1EIgQwzf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git atomic-writes-6.15
head:   3e0eba388360eebaf124e2abab90a054698f08af
commit: 3e0eba388360eebaf124e2abab90a054698f08af [21/21] xfs: allow sysadmins to specify a maximum atomic write limit at mount time
config: i386-buildonly-randconfig-004-20250422 (https://download.01.org/0day-ci/archive/20250422/202504220730.1EIgQwzf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250422/202504220730.1EIgQwzf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504220730.1EIgQwzf-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_mount.o: in function `xfs_set_max_atomic_write_opt':
>> fs/xfs/xfs_mount.c:771: undefined reference to `__umoddi3'
   ld: fs/xfs/xfs_zone_gc.o: in function `xfs_zoned_need_gc':
   fs/xfs/xfs_zone_gc.c:186: undefined reference to `__divmoddi4'
   ld: fs/xfs/xfs_zone_gc.c:186: undefined reference to `__divdi3'


vim +771 fs/xfs/xfs_mount.c

   742	
   743	/*
   744	 * Try to set the atomic write maximum to a new value that we got from
   745	 * userspace via mount option.
   746	 */
   747	int
   748	xfs_set_max_atomic_write_opt(
   749		struct xfs_mount	*mp,
   750		unsigned long long	new_max_bytes)
   751	{
   752		const xfs_filblks_t	new_max_fsbs = XFS_B_TO_FSBT(mp, new_max_bytes);
   753		const xfs_extlen_t	max_write = xfs_calc_atomic_write_max(mp);
   754		const xfs_extlen_t	max_group =
   755			max(xfs_calc_perag_awu_max(mp), xfs_calc_rtgroup_awu_max(mp));
   756		int			error;
   757	
   758		if (new_max_bytes == 0)
   759			goto set_limit;
   760	
   761		ASSERT(max_write <= U32_MAX);
   762	
   763		/* generic_atomic_write_valid enforces power of two length */
   764		if (!is_power_of_2(new_max_bytes)) {
   765			xfs_warn(mp,
   766	 "max atomic write size of %llu bytes is not a power of 2",
   767					new_max_bytes);
   768			return -EINVAL;
   769		}
   770	
 > 771		if (new_max_bytes % mp->m_sb.sb_blocksize > 0) {
   772			xfs_warn(mp,
   773	 "max atomic write size of %llu bytes not aligned with fsblock",
   774					new_max_bytes);
   775			return -EINVAL;
   776		}
   777	
   778		if (new_max_fsbs > max_write) {
   779			xfs_warn(mp,
   780	 "max atomic write size of %lluk cannot be larger than max write size %lluk",
   781					new_max_bytes >> 10,
   782					XFS_FSB_TO_B(mp, max_write) >> 10);
   783			return -EINVAL;
   784		}
   785	
   786		if (new_max_fsbs > max_group) {
   787			xfs_warn(mp,
   788	 "max atomic write size of %lluk cannot be larger than allocation group size %lluk",
   789					new_max_bytes >> 10,
   790					XFS_FSB_TO_B(mp, max_group) >> 10);
   791			return -EINVAL;
   792		}
   793	
   794	set_limit:
   795		error = xfs_calc_atomic_write_reservation(mp, new_max_fsbs);
   796		if (error) {
   797			xfs_warn(mp,
   798	 "cannot support completing atomic writes of %lluk",
   799					new_max_bytes >> 10);
   800			return error;
   801		}
   802	
   803		xfs_calc_atomic_write_unit_max(mp);
   804		mp->m_awu_max_bytes = new_max_bytes;
   805		return 0;
   806	}
   807	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
