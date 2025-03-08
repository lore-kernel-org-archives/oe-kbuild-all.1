Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46D51B0F3C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Mar 2025 09:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741427961; cv=none; b=IqkbEqVdhvrGV8g7wx6+sq/d3vyZEEDy2ThWjZENgHeRoQrjYEgTgGhwSdtvsTw9onrsl0Kev794yOoPKxdec6yVxlBrjleJ1f+uZmHzunxlKh1zDPrhGFL1b1CR0W88PROD5uMKQIV/1eNgcH7Pnju0xFsahfLwLENgFCNVpGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741427961; c=relaxed/simple;
	bh=AunmVokRyAPunNThAG/ahsUkKf3z8Vnt6O9w802bppM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oxSd+ubcqZjH2oR7p/GD72kuWaLELmRoFCFxJ0ldSvAGnyGKps70rP6Qmio5dxAcrjBgsfzo75lZoDfEKyyob9nj+iSV/ifqSoiLx1CHQBppuoQW2N5g7fdObmURA12XXqQ2CgUyLndt4ifU9jAEhOJ21iBPU3UOgfT9ylb3BDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wq4z4esg; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wq4z4esg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741427958; x=1772963958;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AunmVokRyAPunNThAG/ahsUkKf3z8Vnt6O9w802bppM=;
  b=Wq4z4esg9AYh8gLCTpBqnER0kBYywinHv2PKmwprlqkavPJv/hCRuAFb
   WNdBZ6WW9dnjpOQd6xoLHThNMVH5f2/GFW1jSN1mlaTe+Gk0k1lRUXBnT
   wp+7cwfS5g1k6zy6nKCHms91N1btt/TjTJmRE9gOhbEripwGv9EbCCtfL
   PvYqq5oe0kbsGiRS6fZfkLicgFZ7Zr+EAt4iKPK8NDP9a48NIKmZN2xEi
   0amCVok+3xpP/14UekFwCS5gr7NmjjYzJ1UH1nV1D6yFgcihvQP3v8WHK
   L0ye3eqqCbPa4DRbz0DQzuRKB3nNc4JLLCEj3LIKM9dP+hX/79H+Q4F1W
   A==;
X-CSE-ConnectionGUID: ysYbBppGSDSnhqhiwObrog==
X-CSE-MsgGUID: muV+tKqHT76CJLTbCxCwbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="59883595"
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="59883595"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2025 01:59:17 -0800
X-CSE-ConnectionGUID: sprNnomyTT22BEl2vvaHYA==
X-CSE-MsgGUID: wqjRXPXrRYyRqo3D8liHvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,231,1736841600"; 
   d="scan'208";a="124458507"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 08 Mar 2025 01:59:16 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqqxd-0001mi-2Y;
	Sat, 08 Mar 2025 09:59:13 +0000
Date: Sat, 8 Mar 2025 17:58:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ben Skeggs <bskeggs@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Dave Airlie <airlied@redhat.com>
Subject: [jfern:nova-core-experiments 90/411]
 drivers/gpu/drm/nouveau/nvif/object.c:211:21: sparse: sparse: incorrect type
 in assignment (different address spaces)
Message-ID: <202503081728.ycQI0ztA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git nova-core-experiments
head:   3b93174b3502247b0c46bd54a7cf5f4105274edb
commit: 71f0599fca83fa9895c0d34643a8a134ba5a6f39 [90/411] drm/nouveau/nvif: rework device "map" api
config: arc-randconfig-r131-20250308 (https://download.01.org/0day-ci/archive/20250308/202503081728.ycQI0ztA-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250308/202503081728.ycQI0ztA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503081728.ycQI0ztA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/nouveau/nvif/object.c:211:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *ptr @@     got void [noderef] __iomem * @@
   drivers/gpu/drm/nouveau/nvif/object.c:211:21: sparse:     expected void *ptr
   drivers/gpu/drm/nouveau/nvif/object.c:211:21: sparse:     got void [noderef] __iomem *
>> drivers/gpu/drm/nouveau/nvif/object.c:226:18: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void *[assigned] ptr @@
   drivers/gpu/drm/nouveau/nvif/object.c:226:18: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/object.c:226:18: sparse:     got void *[assigned] ptr
   drivers/gpu/drm/nouveau/nvif/object.c:248:41: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *ptr @@     got void * @@
   drivers/gpu/drm/nouveau/nvif/object.c:248:41: sparse:     expected void [noderef] __iomem *ptr
   drivers/gpu/drm/nouveau/nvif/object.c:248:41: sparse:     got void *

vim +211 drivers/gpu/drm/nouveau/nvif/object.c

   201	
   202	int
   203	nvif_object_map_cpu(struct nvif_object *object,
   204			    const struct nvif_mapinfo *impl, struct nvif_map *map)
   205	{
   206		struct nvif_client *client = object->client;
   207		void *ptr = NULL;
   208	
   209		switch (impl->type) {
   210		case NVIF_MAP_IO:
 > 211			ptr = client->driver->map(client->priv, impl->handle, impl->length);
   212			break;
   213		case NVIF_MAP_VA:
   214			ptr = (void **)(unsigned long)impl->handle;
   215			break;
   216		default:
   217			WARN_ON(1);
   218			return -EINVAL;
   219		}
   220	
   221		if (!ptr)
   222			return -EFAULT;
   223	
   224		map->object = object;
   225		map->impl = impl;
 > 226		map->ptr = ptr;
   227	
   228		object->map.ptr = map->ptr; /*FIXME: needed by nvif_rd/wr */
   229		return 0;
   230	}
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
