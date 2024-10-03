Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C201A4F3B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Oct 2024 16:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971903; cv=none; b=dCYGvDluOMOmCQODGasAzBRSSUzYi11JWGwXY80d2C/BWu/nduq25uwoWRZ2oRXgfs+5g535IXXle+tn6E7REtqJVJmoLE6dVQhmqnx2+k1/GuK9Besr1L0y85YZsjcCBd/O26lCwLFl5kY8OKq4c6oeFrgqEPCyoU7utuYdelg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971903; c=relaxed/simple;
	bh=lsC+rxoDrooy+H5GFpdScn847L/Ccf4mHl97tkG+NXc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ehqh3538m2X0dRWnvhfLpr/RYX3SSaUc8eJeWPRE8iny8Uhvi8TZSvgrhZqH3SodGkYrOqCN6/6kfB5hyUN4bdruwv0VhmIyP3C57SKZEcu3GGbG5aL75jlqWLElVsL9L0nxBzIo5sng4qL5ZRiGrPEkgu0bl2x0by8MHM7RBmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j1IUGRNK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j1IUGRNK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727971901; x=1759507901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lsC+rxoDrooy+H5GFpdScn847L/Ccf4mHl97tkG+NXc=;
  b=j1IUGRNK6v1Eu6qlHH59vpd03J6tkZD9J3r1+Wydq15DFEgh7q5zuNnP
   cRG8jbhlUxz90Srj8Y9JVKCe/YcRSrCz4BNUoKhKi9rkKJvOTXDWRuvxK
   Tvs0dG4iOyQ7pZUeL7HQYPdJylMA/2H0zHcb5ouC69uyLlaeRMzIepNfm
   /qoFDhsjmATMcbnB5oBB+dss2CRRahNY54Y632hgdLIbr4fwDItAmM1z2
   wOI3J5TapjOiZfQ5cQNwVqPPRBuKk3VNauEV0W0462mMemYRpPsNVronq
   M4398Z/0NlwiyjVbJZ+4o/7NK1gvU1PcoxJi12VQP1Q4p7y5U+rEC9uMm
   Q==;
X-CSE-ConnectionGUID: UX2h034URmi0CspPG/9gbQ==
X-CSE-MsgGUID: RZDVP8ZyRrOLZbimX2tUPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11214"; a="26647135"
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="26647135"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2024 09:11:40 -0700
X-CSE-ConnectionGUID: t+76QB2bQ62DF/UJ+XVwMw==
X-CSE-MsgGUID: OyPXZ3y2Sradu7zqhiSEbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,174,1725346800"; 
   d="scan'208";a="74517038"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Oct 2024 09:11:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1swOQT-0000d5-1H;
	Thu, 03 Oct 2024 16:11:37 +0000
Date: Fri, 4 Oct 2024 00:10:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 8/8] mm/page_alloc.c:6789:16: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202410040021.MkdPygGb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   da07655d41d0ecb4a9aa350359c3e7920999fba6
commit: 42596c7b41c85be2647f23da66cda4b0a0c242e1 [8/8] ANDROID: fix ABI breakage caused by per_cpu_pages
config: x86_64-randconfig-122-20241003 (https://download.01.org/0day-ci/archive/20241004/202410040021.MkdPygGb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241004/202410040021.MkdPygGb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410040021.MkdPygGb-lkp@intel.com/

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
