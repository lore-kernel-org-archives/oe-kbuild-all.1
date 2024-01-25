Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A905604A9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jan 2024 11:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706180797; cv=none; b=eGaW+ag2G4zYaEI9+tpDeWV29G1QIgkDJbkdJ6vT4oUcxK0734LIYGvnMdrxHGBFzzlupC8Nr4nSwrRr3qsykT+CGMZzaN9aODglYafiPpd9vk6F6lF7FogVEnDi1M2IDdaubj4L4nk0N+/YettMi+2CpB4XiNYLbX2n9FtDxF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706180797; c=relaxed/simple;
	bh=Pre2RA5xZSkD9zqjdca/hSFer0Fb9s5a5Xl65BH24rg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n5Z8pzCYOPjPTtb0GvwVq42s+VdEknkJ8VXAdMX7amovpNLE1EkzBSbFcaz5aBi4JU0k3HkVyQNBdhWB6jyWQWgfH6R2tXhDvAqOBkWYMLS1LtM5JoAMgA7hQ2TRilZkM3fSN1LPibRASCkZFGPkzesrSGCs1TdRQxj0kJzqOaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KewOR6PL; arc=none smtp.client-ip=192.55.52.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KewOR6PL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706180795; x=1737716795;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Pre2RA5xZSkD9zqjdca/hSFer0Fb9s5a5Xl65BH24rg=;
  b=KewOR6PLM48SXS3hwfBIP+03KbILnpRqWS/9fh+JbSyxzud+KnU6t9/R
   fQgNXh2ZvTBKtYtisNk6ah5qnPqKa8UPumDYIOBEz/HnkWxifot2ZGkxK
   OKZCAdQyLzi3kAJdeECgCiRtacNZufcfLYsGFbpOKK+r+Ts6/0MzkyJnc
   gqOsISLEGitYG9pkt+CbNciuCTcYiJGkobWQR8XJDwcI3kmg9ai/LQ7AO
   +uIFaFw+/R2ngptRWKxFx0Z3pAFnEEu4v49Fr5S6uYFkiK/qF6wjhU626
   93RGJP9gSS88bYGSHnNZy/jEH9xobB+qZBZDgH4d5rfZUxkQNLOtPKRDB
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="400986689"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="400986689"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2024 03:06:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909967085"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="909967085"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 25 Jan 2024 03:06:32 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rSxZ0-0008v7-2L;
	Thu, 25 Jan 2024 11:06:30 +0000
Date: Thu, 25 Jan 2024 19:05:42 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned 73/78] fs/xfs/xfs_zone_alloc.c:1119: undefined
 reference to `__udivdi3'
Message-ID: <202401251934.BzYtaeWa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   2a66845b1dc0db79953d9f3a5044e688fc1f44bc
commit: a019b519aae7368aba9b31d867638525a8701ec0 [73/78] xfs: add proactive gc and write throtteling
config: i386-randconfig-053-20240125 (https://download.01.org/0day-ci/archive/20240125/202401251934.BzYtaeWa-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240125/202401251934.BzYtaeWa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401251934.BzYtaeWa-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_zone_alloc.o: in function `xfs_zoned_gc':
>> fs/xfs/xfs_zone_alloc.c:1119: undefined reference to `__udivdi3'


vim +1119 fs/xfs/xfs_zone_alloc.c

  1104	
  1105	static void
  1106	xfs_zoned_gc(
  1107		struct xfs_mount	*mp)
  1108	{
  1109		struct xfs_rtgroup	*rtg;
  1110		uint64_t		used;
  1111		uint64_t		free;
  1112	
  1113		rtg = xfs_zone_reclaim_pick(mp);
  1114		if (rtg) {
  1115			used = *xfs_zone_used_counter(rtg);
  1116			free = rtg->rtg_blockcount - used;
  1117	
  1118			if (free)
> 1119				mp->m_reclaim_ratio = 100 * used / free;
  1120	
  1121			xfs_zone_reclaim(rtg);
  1122			xfs_rtgroup_rele(rtg);
  1123		}
  1124	}
  1125	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
