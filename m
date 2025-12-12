Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B895F2E093F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 08:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765528122; cv=none; b=ohCCBc4pSHo0ANwLPHx2ztEgvWLNId43OVxx+6keU1jLNRlXubmWWOvcwBCdSufHewvH3kZJg9ZD/LBZZcDOAf8TqjImb0zwRukNE2vWbOy78TUz10B44DmTqHG6ZqQcfFSjyJ4YztYYgpqo/XH5HCZP9XS9/v2LUY0Ofi2WN2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765528122; c=relaxed/simple;
	bh=UEzlMowS9zjfh4fWYeqBprcB/JHm4/k656amT+IMtHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TgygMsL52LhMGCydRhIz23cOesSgbI+xox5IBSF6Bv08iXSzNIJb72JSlnfo/nTLkjBFTaZzFALvIVJMe7slpPLsssxFoFZmV52f7doWvCw+FXZtA2sqCuPlXvAS0RDbO4Vupah1uN/ZYt2gJEDRRhwfghZxSVpTgd4zrb2m8tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mvrBjlLc; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mvrBjlLc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765528121; x=1797064121;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UEzlMowS9zjfh4fWYeqBprcB/JHm4/k656amT+IMtHg=;
  b=mvrBjlLcnY7b8r0kBW9IikhS9woERgOXOQanZD91wYyCQ8eEuhFqxCJ6
   ZwyAscg/N+aSbbu+GKunA8/Bz7OG2GAQfYb2fkfKdUkgwf8PnCesLn4sx
   dQQJ/P4FMUCOSVGHo/WVmEambt8HpY+nQYcnhOYPREYUytDaI9/CzVtEa
   vQiCC8EvEp3URXPdiuuEEAgy3/jv2Uv8jnGDyXwxhA9CgbkkuRNCRbiXp
   cay/JABeMeq+B382w8ZxLrIoRfckiATNZzK0ao3R5T+WQCQg7JIfKSGDl
   d2oJRHB0FT/OAB2lcxO232EqTd79g083pmbHJSlYOvRBOeyMy2Ebnlqg0
   Q==;
X-CSE-ConnectionGUID: xPnU7iRZQbqKy58IyjCWaw==
X-CSE-MsgGUID: l/Yr1yFzTI+Ij+XnM/c6Sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67399889"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="67399889"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 00:28:40 -0800
X-CSE-ConnectionGUID: CMdh/VOPQviyJJy/AgD/lw==
X-CSE-MsgGUID: i6bvkQWRQxC0tNCkA4aDEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="234425165"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 12 Dec 2025 00:28:40 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTyVw-000000005nJ-3GdM;
	Fri, 12 Dec 2025 08:28:36 +0000
Date: Fri, 12 Dec 2025 16:28:10 +0800
From: kernel test robot <lkp@intel.com>
To: Harish Chegondi <harish.chegondi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: drivers/gpu/drm/xe/xe_eu_stall.c:123:11: sparse: sparse: symbol
 'eu_stall_sampling_rates' was not declared. Should it be static?
Message-ID: <202512121601.WjiIw7bJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: cd5bbb2532f276626d1416b237676772bb61f11e drm/xe/uapi: Add a device query to get EU stall sampling information
date:   10 months ago
config: x86_64-randconfig-123-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121601.WjiIw7bJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121601.WjiIw7bJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121601.WjiIw7bJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/xe/xe_eu_stall.c:123:11: sparse: sparse: symbol 'eu_stall_sampling_rates' was not declared. Should it be static?

vim +/eu_stall_sampling_rates +123 drivers/gpu/drm/xe/xe_eu_stall.c

   122	
 > 123	const u64 eu_stall_sampling_rates[] = {251, 251 * 2, 251 * 3, 251 * 4, 251 * 5, 251 * 6, 251 * 7};
   124	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
