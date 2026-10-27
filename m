Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793095618;
	b=gy/Br+ZKxAaHW8YDQFcj18Akd5ZtT9/sfzAMnZia/GjECseaLYnPLKuDgNJ+c5dKPMfh
	 aYaaAJ7JXNcg4fu0mEEh3sQ/5jcU6b81PD3HtXR9L8qM4m+6jRlIYvM5vHzo8aeXumOh1
	 e0HBJuTq8DWJPE4ZCps+mxY2Ce0HiGrjwYfAj0OYChCdzkRRapiLQVv0rwaTt18O18sZW
	 3+DPSq/mCyxpDyn3nHzsgOWkhgenDoBNwec35vMphiF25gqGppzDBqzxk/Rq+1466v1Sm
	 gzM8/PIM2C8MthjofFFFw3rleZPOcOr1Th4PiUu7WX7HMtsLrlUBm/Ewj4flhCWeVzA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793095618;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=43yJKQZoeXXSCwOVI+AYnBX5iDDQ8oiyeFR9GHm8WXo=;
	b=NXzg35r2vUqSJTknxw6fW+OvuhwU/ILB9iFpBBxyjFOkqmybnGjbMHj9lEUa3Awn76YT
	 n3cQT7ju2QkOzL1n2VrKCbm91+e5orEtYO+tPpNh1y/YVbCQejfHEbfpFNgelwo3Tk4+R
	 5h2U7+J6GVouuE1/uVnfRgsi1VSDmcKh1OgxZ/jEl95NenC6OWWwedaM+qRv4DOCw1Y76
	 avCFVy7vIs8HRGKcu0LVuJUKS+Ql45EAJ2qvtUndttbMiTi9hnTzdHhoz55X7kRU4QSDF
	 TV7brDcd2zz2s+260wMUL/Ovp2W9zcIp8JkeIKpWNYsFhq+mYPG6RmBcsKIGMmlhBuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nyhLa+E1;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E9A606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 10:06:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7E9A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nyhLa+E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793095618; x=1824631618;
  h=date:from:to:cc:subject:message-id;
  bh=NO4sAHf4qFSXyB8D2Shn8++WDjfGm6hXLFqyDZO4rTo=;
  b=nyhLa+E1Tj84sbKsMQ3rryxJyOjNqTeQ480zyePEMb1REDpA7AD8mNiz
   8THVvif3KQqJz4LzZuhUL4KNWuWLtf9RrlPpIJvsz+L15+Nq2l+FM4dHJ
   hZE1R0kWcxd+FLStk+bSsrSZ/9zm90tSJ5z/NfWHExfs7PpAKZfY9mMGi
   +U3djLLNfRuiceFt3aqxOJ1OuXW7/hjH5Bh/l3jevof7mL4C8NSMf6xFU
   lIhZPoOz7zWexxcpFxgcnGn6uzBVrRoEPtlOGelNhB49ANI+M4NuElHSF
   jHiFmr0gJzj7RnFeLHDOByVSbL/t+VKm68xv2ho28DvlLaBm2ToXahcRW
   Q==;
X-CSE-ConnectionGUID: aNCzJXffQF6j40qyttqhvg==
X-CSE-MsgGUID: lWliw80lTyiX1ZB156HcIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1822944"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1822944"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 03:06:58 -0700
X-CSE-ConnectionGUID: 66PUABL4SZ2SGA71dJOHWQ==
X-CSE-MsgGUID: vekUAlt6RBS4L4VJkIS15w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6351524"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 27 Oct 2026 03:06:56 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLe50-000000004TH-09DB;
	Tue, 27 Oct 2026 10:06:54 +0000
Date: Tue, 27 Oct 2026 11:06:27 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 mm/page_alloc.c:6789:16: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202610271107.YfAcC0zm-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android13-5.10-2026-10
head:   a4c2f82969bc5fa7fcc21ede4b690ece7ff72335
commit: 42596c7b41c85be2647f23da66cda4b0a0c242e1 [1/1] ANDROID: fix ABI breakage caused by per_cpu_pages
config: arm64-randconfig-r2309-20261018 (https://download.01.org/0day-ci/archive/20261027/202610271107.YfAcC0zm-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610271107.YfAcC0zm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610271107.YfAcC0zm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/page_alloc.c:6789:16: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct per_cpu_pageset_ext *ps_ext @@     got struct per_cpu_pageset_ext [noderef] __percpu * @@
   mm/page_alloc.c:6789:16: sparse:     expected struct per_cpu_pageset_ext *ps_ext
   mm/page_alloc.c:6789:16: sparse:     got struct per_cpu_pageset_ext [noderef] __percpu *
>> mm/page_alloc.c:6790:23: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct per_cpu_pageset [noderef] __percpu *pageset @@     got struct per_cpu_pageset * @@
   mm/page_alloc.c:6790:23: sparse:     expected struct per_cpu_pageset [noderef] __percpu *pageset
   mm/page_alloc.c:6790:23: sparse:     got struct per_cpu_pageset *
   mm/page_alloc.c:3365:28: sparse: sparse: context imbalance in 'free_unref_page_commit' - unexpected unlock
   mm/page_alloc.c:3687:20: sparse: sparse: context imbalance in '__rmqueue_pcplist' - different lock contexts for basic block
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
