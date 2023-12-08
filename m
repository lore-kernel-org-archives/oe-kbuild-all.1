Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB74A5F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Dec 2023 01:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHOTwPlr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701997210; x=1733533210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1KFDf/Or9O7KvOutPqrqlRAt9BJo5Ds3HbRkPdPzBHs=;
  b=NHOTwPlrRO5uQ9zwRttYOQVGlbyXGW/cf0epvRkKSxUHP5kAxS8AWnJc
   h/12OzPV7zOQkC5xB49hOJg404kv9tEyh5vU3kB0lwFK8r5Ra1hCFeCKh
   yhF3KpPW7nXYCZDwegHldrvOWkjquG1opXwq95xPtcoMpctS14YSrNz0o
   jJC0TKnAOkbH74a6bevn7016XcC76wvXblNbR5jU7lHSzBAy4J1eIbj/F
   xZVUObAXcrfpfOJy/N77GCNwn4loRmfQfmUw1q/b8Mh+Yr5pknGjWsfjj
   eAN0JqbMlJ3oy6dosPgoGUduebpG5nx0cmN310DQjYAnaBR4koXMgYXA8
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="7694245"
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="7694245"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 16:59:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,259,1695711600"; 
   d="scan'208";a="13311751"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 07 Dec 2023 16:59:54 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBPDb-000D3T-2O;
	Fri, 08 Dec 2023 00:59:51 +0000
Date: Fri, 8 Dec 2023 08:59:08 +0800
From: kernel test robot <lkp@intel.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:104:58: sparse:
 sparse: incorrect type in argument 2 (different address spaces)
Message-ID: <202312080839.kiCSYLXC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9ace34a8e446c1a566f3b0a3e0c4c483987e39a6
commit: 894fa235eb4ca0bfa692dbe4932c2f940cdc8c1e powerpc: inline iomap accessors
date:   3 years ago
config: powerpc-randconfig-r113-20231106 (https://download.01.org/0day-ci/archive/20231208/202312080839.kiCSYLXC-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231208/202312080839.kiCSYLXC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312080839.kiCSYLXC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:104:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:104:58: sparse:     expected void [noderef] __iomem *addr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:104:58: sparse:     got void *
>> drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:110:58: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem *addr @@     got void * @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:110:58: sparse:     expected void const [noderef] __iomem *addr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:110:58: sparse:     got void *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:157:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] emap @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:157:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:157:25: sparse:     got void *[assigned] emap
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:174:19: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *map @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:174:19: sparse:     expected void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:174:19: sparse:     got void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:225:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void *map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:225:28: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:225:28: sparse:     got void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:233:28: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected void [noderef] __iomem * @@     got void *map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:233:28: sparse:     expected void [noderef] __iomem *
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:233:28: sparse:     got void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:240:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *map @@     got void *map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:240:21: sparse:     expected void [noderef] __iomem *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:240:21: sparse:     got void *map
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:327:25: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *[assigned] map @@
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:327:25: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c:327:25: sparse:     got void *[assigned] map

vim +104 drivers/gpu/drm/nouveau/nvkm/subdev/instmem/nv50.c

07bbc1c5f49b64 Ben Skeggs 2017-11-01  100  
be55287aa5ba68 Ben Skeggs 2017-11-01  101  static void
be55287aa5ba68 Ben Skeggs 2017-11-01  102  nv50_instobj_wr32(struct nvkm_memory *memory, u64 offset, u32 data)
be55287aa5ba68 Ben Skeggs 2017-11-01  103  {
be55287aa5ba68 Ben Skeggs 2017-11-01 @104  	iowrite32_native(data, nv50_instobj(memory)->map + offset);
be55287aa5ba68 Ben Skeggs 2017-11-01  105  }
be55287aa5ba68 Ben Skeggs 2017-11-01  106  
be55287aa5ba68 Ben Skeggs 2017-11-01  107  static u32
be55287aa5ba68 Ben Skeggs 2017-11-01  108  nv50_instobj_rd32(struct nvkm_memory *memory, u64 offset)
be55287aa5ba68 Ben Skeggs 2017-11-01  109  {
be55287aa5ba68 Ben Skeggs 2017-11-01 @110  	return ioread32_native(nv50_instobj(memory)->map + offset);
be55287aa5ba68 Ben Skeggs 2017-11-01  111  }
be55287aa5ba68 Ben Skeggs 2017-11-01  112  

:::::: The code at line 104 was first introduced by commit
:::::: be55287aa5ba6895e9d4d3ed2f08a1be7a065957 drm/nouveau/imem/nv50: embed nvkm_instobj directly into nv04_instobj

:::::: TO: Ben Skeggs <bskeggs@redhat.com>
:::::: CC: Ben Skeggs <bskeggs@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
