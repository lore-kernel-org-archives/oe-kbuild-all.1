Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6DD58222
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 11:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731844291; cv=none; b=lch+GUkS+2Jj+iCBfsYCWvDsGccyaCF0gS8T/SsFCueHbLCQB0u6cigYXGQeVD/TneF5M8PJmJT8J3fTLd4QdFGaNEjxnqoiYYbNZq6wIEuDTH1lBi6SOQ1hyHZcnoSX0WwlXKuSqqo9bIALl89gWIu14ckNKWcCtCgAd6fCkJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731844291; c=relaxed/simple;
	bh=RjwYyQFQqzftlfzBgrS4DB+BuTAWIwFjJyZUwrT0K2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d21VzT47NRBkV9SecjlJ++0jbSAGLaBCrwKaKEgx3NW5xRaOZEsVZwpCs4vBqFUzNm2agWnOGqeZKU1BDGLronFDNDkzM4p28daVRWi4oPoMzGLqcdhFZwO/giMNHB/KPuLJ9h6GITN0iouL/Q1ol7SI0X3jlwvCQ87iNkHj4Og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nx5Uy04w; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nx5Uy04w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731844289; x=1763380289;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RjwYyQFQqzftlfzBgrS4DB+BuTAWIwFjJyZUwrT0K2Y=;
  b=Nx5Uy04wJ5t5HsgvyE6oOwW0NzDLeCm3xIsbKvYYnZTWJ2kYlUx9eo7f
   9+M9AGnjjVubQnsTmHuoo4Z92vvhk7qxda7EJ5DsuEh9GnqF0Wdv/4EqB
   TYHmONRRgNqyPTYXMiO2D1H7iCkZtch+meJOvpBM02eI2e+D0qGlamp7m
   nGqUn/LhFKFI8wIUzE+ITSOj4IURcBrai4wRrUFRFYeUXB2tCezbAiCuL
   aqUNOl7dLMtaG4MWN1guOet0cbcZjrp8sD1gOqIi8BgXCu5+L7Nl2cyBA
   Hgewvj5H6FirCkGufAFs6++9mp7CMDyDiIvftudw6LEBfZTYjLXPXoktT
   A==;
X-CSE-ConnectionGUID: yCF6jThaSA+dRGzdLwoSJQ==
X-CSE-MsgGUID: JKA3888aSFWRqzfeXPpI/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31901894"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="31901894"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 03:51:28 -0800
X-CSE-ConnectionGUID: kPus8B4SQI6tSJekvYeMBg==
X-CSE-MsgGUID: H7HPJmc1QHK/wQYJXjnQlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="126512617"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Nov 2024 03:51:27 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCdoK-0001if-2L;
	Sun, 17 Nov 2024 11:51:24 +0000
Date: Sun, 17 Nov 2024 19:50:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 8/8] mm/page_alloc.c:6789:16: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202411171911.POI6BaMW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   567aa1247226333483826cdf0ed838625458f3b8
commit: 42596c7b41c85be2647f23da66cda4b0a0c242e1 [8/8] ANDROID: fix ABI breakage caused by per_cpu_pages
config: i386-randconfig-062-20241112 (https://download.01.org/0day-ci/archive/20241117/202411171911.POI6BaMW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171911.POI6BaMW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171911.POI6BaMW-lkp@intel.com/

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
