Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793352697;
	b=fQO/IoeD/9Au8pqy21GTo7Gvr2c62WhUyElzCZtvBVcEnZ9KVEFFpTfjnvGRkkcDAX7p
	 m9ZyUN4Xc3H1dGP6ts+QsU1x0bPg2ch5EHxBBS9GoCYF8rW5bHt+aBdPiYCERpM0OTU8O
	 9ri4IPeBvWXMqEWnIy+8eblSJnqENSV221pdk2HWU4x7CmLBAVACTyw0eNG/uiLpMx888
	 Oe1omo+dq83UVi6a5oapDon8+KavPqG17WOTSLZW5mMbpM1WeUQIBvFdlLI606k8lljOu
	 CzoeKdCH1yxVtmOUtwjMzUMB1BAIMiSrmjFQcEaKkcol/PfbR2Al7NrQ7fNxPo2k0kA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793352697;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=NrZDOYpWAT07/28L0MUie3GVea5qot7VqtCGFz6v3Sc=;
	b=0yq/Rjxaxqr9m8yWaOLKZbles+vGrR6H6V4+s9HfnKzWqThCyDDo3Z65cjCFeoaPx1dV
	 o1K3hIjvSg3SmUmlDg/Nxmpv+TNCsd3ovbjadVQbYi7KNdORqh0X2o18/0dSBND6yrGkS
	 g3gHj9KO8SfJ5tc7j8R+f3ZcI+5qpavRJ9t32tNtHjp+/pyHVsAgQhZPqTxXofohe3aPY
	 UtrHkKbCeq1uzXL7ofBic5gleqpYv0CUSrsJdwn8srgmPsMCkQkETVpnZ1bIxTQxqMBDP
	 7jCqOLiQJG87LcSWqsao1Lsx+6sKWz3PrWiuH1eClgerK4bhw+6YedyQj0yXC/tlg/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QYw5mMkN;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97D0606A31C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 09:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C97D0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=QYw5mMkN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793352696; x=1824888696;
  h=date:from:to:cc:subject:message-id;
  bh=tce9CV+vfyM1rVVxAX+6zsoxfvif8WSz7pVyNRgyRSQ=;
  b=QYw5mMkNNFmzwsFlFeXI15w2I7Kj+C6xpKkxqCN0+rePU5WbpjE2tphV
   CkzdWvrlB70iqnm5xcmV/2Cp4LQmDDt2SiKINNkP/HurAaVFSijWZCtkQ
   Xj+KIVb/UKvJQ6fXfKaVBBIUkMMEgOMY6mMwWTv1STMMuTAfe9ZgaXI0/
   60xnTisjsKj1ZXB9fZNNK/RkZBJ+KlM+FF9EQO6d22IG7raXlieMa3h/w
   MSe3zxrr0Wum3rZMuk4nIZBjp0qpP3mdUcnvWg4JadJSvbryo0ftdD2j4
   Q+8wr3QBAit/pcUG3Xbn1T9iYs3TYLHLOYe8Mx9gCHRXXraEX1oP/hcNg
   Q==;
X-CSE-ConnectionGUID: 0s3aDKfZSPCyD/oBgtHR4w==
X-CSE-MsgGUID: 5B8gr45iRJelBC5SC9nNig==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="1992508"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="1992508"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 02:31:36 -0700
X-CSE-ConnectionGUID: PaaOVOaTQYqLSDgru7EaWA==
X-CSE-MsgGUID: BNYzSoDUSs+KVRMCAhYkHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="7215815"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 30 Oct 2026 02:31:35 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMixR-000000005XJ-0boW;
	Fri, 30 Oct 2026 09:31:33 +0000
Date: Fri, 30 Oct 2026 10:31:15 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10-2026-10 1/1]
 mm/page_alloc.c:6789:16: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202610301055.m6jINhw7-lkp@intel.com>
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
config: arm64-randconfig-r2309-20261018 (https://download.01.org/0day-ci/archive/20261030/202610301055.m6jINhw7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261030/202610301055.m6jINhw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610301055.m6jINhw7-lkp@intel.com/

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
