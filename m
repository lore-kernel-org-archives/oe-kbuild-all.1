Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC292F99A6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 10:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765621415; cv=none; b=QUIlUDyG2FAVShYPIPXFt/lOIu6xQewHOLuUmSNJGYHYP+0CRsgaLGCv/LYDpHb+FaL9cccLRfJDmomUZU1RjbG+4POoZgxRyhWUp/IDD+y9T/0yrCOXi91nldHlTc4KQbZr1HmOIkDNB/+v7hmuAmmpjjg6zbI9LvwL/jKdaR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765621415; c=relaxed/simple;
	bh=pGQ2irWldH0LdKrDykfI+hEpFzV9z8RNjTtNYA+QagM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nDErtHntBmvxWz7fdQtv5LLnrKmlKx4/Fd8wbKioKPE/t+vEPZi9bMJa5SnlmMDcoRAyG74u0SHg9GkU7fRqjIeBU/2O+7Lz3ot+Ptq9RmYsJ246F1LoxN+3NKc7zQxkpQHQZYI6MZuIp0emiRohopaI8FxDCTxv5is8lckaqfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ETJ5fMME; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ETJ5fMME"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765621414; x=1797157414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pGQ2irWldH0LdKrDykfI+hEpFzV9z8RNjTtNYA+QagM=;
  b=ETJ5fMMEdAX6fPb4E2K90zDOqQGTYg50GTLVXytflJsP9RaF8DxFOE1P
   CbhfMCYkBP1Ge2mX+VEFrcRthkzOxzplERbzMZPKEmRrBGwBa9aQ72Y1R
   xzcH598UebLu89BRicsnnfPD3vyUraACoXV9Ify4HpYtkJHFWWPiEERSA
   eLCaq/PJF1+DjgJWY6Tw17KYG1Qmjm40n13CJs8eH89t8SsK0/Y2hPW4B
   fmvdj1hef4jbzvkzXFpnVu4UmxllEvBd9gF2uxzOA2FKR0/PyG2cT/K2i
   BPs/Q6dZGebhiXqfCrnXOoRO3witklMBXnvcB6towW/I8CcDpfwOfGFyV
   A==;
X-CSE-ConnectionGUID: FN/u+mggQgiuYxwPj+tqSg==
X-CSE-MsgGUID: tVMLbjdeTfym6Q6FwCtn6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="78978198"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="78978198"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 02:23:31 -0800
X-CSE-ConnectionGUID: MPoGdyLxS9a5xv13rNwfog==
X-CSE-MsgGUID: z1v1AIJ4Tx212ErR00U1mg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="201712387"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 02:23:30 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUMme-000000007V8-0Tzy;
	Sat, 13 Dec 2025 10:23:28 +0000
Date: Sat, 13 Dec 2025 18:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Johannes Berg <johannes.berg@intel.com>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:105:58: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202512131838.lGPe9MHr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a859eca0e4cc96f63ff125dbe5388d961558b0e9
commit: b8c9c3b822fe8e033b9802516f6466099d915488 um: stop using PCI port I/O
date:   6 months ago
config: um-randconfig-r121-20251213 (https://download.01.org/0day-ci/archive/20251213/202512131838.lGPe9MHr-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131838.lGPe9MHr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131838.lGPe9MHr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:105:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:105:58: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:105:58: sparse:     got void *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:111:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:111:58: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:111:58: sparse:     got void *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:158:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] emap @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:158:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:158:25: sparse:     got void *[assigned] emap
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:175:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *map @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:175:19: sparse:     expected void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:175:19: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:228:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void *map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:228:28: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:228:28: sparse:     got void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:237:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void *map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:237:28: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:237:28: sparse:     got void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:244:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *map @@     got void *map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:244:21: sparse:     expected void [noderef] __iomem *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:244:21: sparse:     got void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:333:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:333:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:333:25: sparse:     got void *[assigned] map

vim +105 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c

07bbc1c5f49b64 Ben Skeggs 2017-11-01  101  
be55287aa5ba68 Ben Skeggs 2017-11-01  102  static void
be55287aa5ba68 Ben Skeggs 2017-11-01  103  nv50_instobj_wr32(struct nvkm_memory *memory, u64 offset, u32 data)
be55287aa5ba68 Ben Skeggs 2017-11-01  104  {
be55287aa5ba68 Ben Skeggs 2017-11-01 @105  	iowrite32_native(data, nv50_instobj(memory)->map + offset);
be55287aa5ba68 Ben Skeggs 2017-11-01  106  }
be55287aa5ba68 Ben Skeggs 2017-11-01  107  

:::::: The code at line 105 was first introduced by commit
:::::: be55287aa5ba6895e9d4d3ed2f08a1be7a065957 drm/nouveau/imem/nv50: embed nvkm_instobj directly into nv04_instobj

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
