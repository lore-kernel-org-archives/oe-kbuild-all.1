Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EB92500D2
	for <oe-kbuild-all@lists.linux.dev>; Mon, 25 Nov 2024 16:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732550540; cv=none; b=Dambs+jputAhPMyWu9lrRufwWQgbgwRrtpkfzXbWCZc7+RzDIq86CLx/anQH9UgXVdVTWJghIZ37G/6TEEIGnCLH+Bt0W3YNBW19zWRln3vV2g4+x6J2YxARJYkYZssaYH7WIZpl3aO/KoZyHEAUFGEYGvm0VRQUQA+dsXsm3MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732550540; c=relaxed/simple;
	bh=rh4KXf99PV/KsYHexS4WOziSo9Umz75QcefgVQPvtjI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VEoLrx8g/QCkN51OX3ng7qffPmM082KHADqC2NXWl6OXLxv+npyJZriFKIkCBgh8Sl/j/MVZWxb7zd4eqifn43/gPaYnUgz/fWBHYi/aPnhFg1Iw1ayFK5n30awv7yjOPGUaDF9ErGUtHLRIgfsrS4/VQPFiAyRYDXa9hUpkSY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y+LEsSYb; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y+LEsSYb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732550537; x=1764086537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rh4KXf99PV/KsYHexS4WOziSo9Umz75QcefgVQPvtjI=;
  b=Y+LEsSYbJqdMF0lwGxTwdQRY9ZOsf8QxFEAvttA5eLQQaS5oNrL2pEzM
   pH1HGrjWX2GGkEc15J0OYRBEyecNQ3bbM7ZS+ALd0GZVkgiQt51pS43rV
   /wz0/raP7N0jKPw32DkydXgZFEmSWSapuwJsH4v8ZXkDBhgffNfndQyDS
   LDCHtla6grAA2a3nexZqvX/M4RWnabqAN/bZ44yIAk7EyeT9TJBVy53GN
   GrjvP2BiT00A2dMsm3XK48fr56nihuCKWsrRcgkae+TgId7TozSdcJQLM
   M2an7WB0Duf+/cKUV0LCHz6Eud3RRkQpBTNrIYi0R9RjTwHxjohza9dPF
   g==;
X-CSE-ConnectionGUID: 3VQ2iyuvQpmhaKBwrLSl9Q==
X-CSE-MsgGUID: jC5X3zBOQACaX/98FCBetQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="32794747"
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="32794747"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 08:02:17 -0800
X-CSE-ConnectionGUID: m9ZQ/Tz+SJqXpBXxire6gw==
X-CSE-MsgGUID: L9jvDYIdSwCPZr0BTNeVeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,183,1728975600"; 
   d="scan'208";a="91493975"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 25 Nov 2024 08:02:15 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFbXR-0006Zd-2y;
	Mon, 25 Nov 2024 16:02:13 +0000
Date: Tue, 26 Nov 2024 00:02:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 8/8] mm/page_alloc.c:6789:16: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202411260043.nDeQ6fK3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   c5dfdf5a4f3132d26b8f31bb3b3baeee66622e73
commit: 42596c7b41c85be2647f23da66cda4b0a0c242e1 [8/8] ANDROID: fix ABI breakage caused by per_cpu_pages
config: i386-randconfig-062-20241112 (https://download.01.org/0day-ci/archive/20241126/202411260043.nDeQ6fK3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241126/202411260043.nDeQ6fK3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411260043.nDeQ6fK3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_alloc.c:6789:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct per_cpu_pageset_ext *ps_ext @@     got struct per_cpu_pageset_ext [noderef] __percpu * @@
   mm/page_alloc.c:6789:16: sparse:     expected struct per_cpu_pageset_ext *ps_ext
   mm/page_alloc.c:6789:16: sparse:     got struct per_cpu_pageset_ext [noderef] __percpu *
>> mm/page_alloc.c:6790:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct per_cpu_pageset [noderef] __percpu *pageset @@     got struct per_cpu_pageset * @@
   mm/page_alloc.c:6790:23: sparse:     expected struct per_cpu_pageset [noderef] __percpu *pageset
   mm/page_alloc.c:6790:23: sparse:     got struct per_cpu_pageset *
   mm/page_alloc.c:3365:28: sparse: sparse: context imbalance in 'free_unref_page_commit' - unexpected unlock
   mm/page_alloc.c:3687:20: sparse: sparse: context imbalance in '__rmqueue_pcplist' - wrong count at exit
   mm/page_alloc.c: note: in included file (through include/linux/mm.h):
   include/linux/gfp.h:369:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:369:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:369:27: sparse: sparse: restricted gfp_t degrades to integer
   include/linux/gfp.h:369:27: sparse: sparse: restricted gfp_t degrades to integer

vim +6789 mm/page_alloc.c

  6783	
  6784	void __meminit setup_zone_pageset(struct zone *zone)
  6785	{
  6786		int cpu;
  6787		struct per_cpu_pageset_ext *ps_ext;
  6788	
> 6789		ps_ext = alloc_percpu(struct per_cpu_pageset_ext);
> 6790		zone->pageset = &ps_ext->pageset;
  6791		for_each_possible_cpu(cpu)
  6792			zone_pageset_init(zone, cpu);
  6793	}
  6794	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
