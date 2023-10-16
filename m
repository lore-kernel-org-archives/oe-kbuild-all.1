Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0B2347DD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 19:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q+BMO5EO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697485516; x=1729021516;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+DmQd1exhKV527T50oQqMyR6jRWQGvuGUmW3Vi5C+30=;
  b=Q+BMO5EORDksI6WekMGjUOb4mMuT4UtJy8Ov3XuA3Pv5++6L5d+11ZoC
   HUNsZLR9ry+7MIbuUgQ28bMVKqWdlNxpegeqfAdNXJbxFJPGI+s9ez6P3
   npBi2LSi/Q8b5mxCTgluvL71sQTB9Edl/rZyTODqiHbql5n3h/Y2UEjaS
   u5R3hCHzl9d4u8+MRjdLoUgpP2PdM7ghFSIK7OjpFotmsvkFV623LkFHL
   nSI23yxTuUJj/cI82YtdwXDwYkxhSj7SxR7BfaWvT89vzDO4oT+e9GPEe
   75RYipQMrTU6qwUTE20TXm7ZBVIBVoSnDr486rpB6UQtd6v+6JjqGwMWH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="384496108"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="384496108"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 12:45:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="749389103"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="749389103"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 16 Oct 2023 12:45:14 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsTWa-0008d8-0W;
	Mon, 16 Oct 2023 19:45:12 +0000
Date: Tue, 17 Oct 2023 03:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 8/8] mm/page_alloc.c:6789:16: sparse:
 sparse: incorrect type in assignment (different address spaces)
Message-ID: <202310170348.mAd1UCKv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   a2070840fa45c2e9da5e2a9aae79840f8158174a
commit: 42596c7b41c85be2647f23da66cda4b0a0c242e1 [8/8] ANDROID: fix ABI breakage caused by per_cpu_pages
config: i386-randconfig-063-20231016 (https://download.01.org/0day-ci/archive/20231017/202310170348.mAd1UCKv-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170348.mAd1UCKv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170348.mAd1UCKv-lkp@intel.com/

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
