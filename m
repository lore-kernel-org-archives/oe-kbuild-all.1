Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5741B3952
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Dec 2024 11:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733312158; cv=none; b=iik115jwUwOi+np/e8PJZnWB/4EF249pRwTJxbxohobxqK40nK1ljjF00Y8CxZdVf9fJ8lvDg4ahRCvX+9JcSJq6SXgdkdIPc5+aNLa7kV8q6skS3CAMj7R+2bmgzFskgrIzWoIuQ7Z+fu5wgyl4wfafZUiHqypBNotR58vAgmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733312158; c=relaxed/simple;
	bh=zavG+FYb+P9TxhWWNRoPlwzobFKFqBHboIysg65ArtI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cWbb5xcdzBlGSb1g5x28UNrLDLbQUe7aOqVde7qLAUFTeewVcR9V0aRvzIWz1rsg+aHo+PVVWzAFd7MK1KkB7zckdJL7vmmI6y1+gbSVqU+mHwpl8RxL1XgJiDZfcBRAY5DeUOc7EuCN8jrPIP0WdjAamLTqSbUJWvIFYzSDrtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzoqzGmR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzoqzGmR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733312156; x=1764848156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zavG+FYb+P9TxhWWNRoPlwzobFKFqBHboIysg65ArtI=;
  b=nzoqzGmRtUIUPdGZxDeC3AEpyb1p9BFITI9301kDdQXZaf9g0mQ1Yy99
   UTRrvK7HEW4E/PHNeLgaTZ3Dt2AIK2ZTb5JuVOEketwZyuBriUE42EZSL
   xRrAD44+g4DV60l2DFQo8tMHrsosob3fbrKWpp4TvIrRQStQ0F4SGSpDj
   p1GAZ6/UGV/LyerfGRgGz4U55/gfOvPjrgY0kotcJOX/t4HYCugP52l22
   qA3yXvfGSyFWlibcot1oLZ/rqKUNR1E+cm4OBxp/i+PQs9+f0VJ/iYApz
   Kd/QtbDNcaWOCuURGkvkAElHZu5+l2mV1/+ddE7k3fXFhWGLAfH7dq0uP
   g==;
X-CSE-ConnectionGUID: daFNW99JTsGrn9ggR5YSyA==
X-CSE-MsgGUID: r08u02BrRU2o9ax2RjYAjw==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="58986285"
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="58986285"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 03:23:07 -0800
X-CSE-ConnectionGUID: Len2ohHfQs6xeoXXy8zyCw==
X-CSE-MsgGUID: BlPVTBadS8eodV/divgxGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,207,1728975600"; 
   d="scan'208";a="131192023"
Received: from lkp-server02.sh.intel.com (HELO 1f5a171d57e2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Dec 2024 03:23:03 -0800
Received: from kbuild by 1f5a171d57e2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tInTA-0002wh-2K;
	Wed, 04 Dec 2024 11:23:00 +0000
Date: Wed, 4 Dec 2024 19:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	lin.x.wang@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 1/1]
 drivers/acpi/nfit/core.c:2955:41: error: implicit declaration of function
 'pxm_to_node'; did you mean 'xa_to_node'?
Message-ID: <202412041933.2Ux3AJLF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jonathan,

FYI, the error/warning still remains.

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   f1811f6442501fe34d2339158aed4f85a64f0398
commit: a8b2bf6b3dcb0532ad923d4ee47daf0f476566d9 [1/1] ACPI: Do not create new NUMA domains from ACPI static tables that are not SRAT
config: arm64-randconfig-001-20241203 (https://download.01.org/0day-ci/archive/20241204/202412041933.2Ux3AJLF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241204/202412041933.2Ux3AJLF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412041933.2Ux3AJLF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/nfit/core.c:1770:13: warning: no previous prototype for 'nfit_intel_shutdown_status' [-Wmissing-prototypes]
    1770 | __weak void nfit_intel_shutdown_status(struct nfit_mem *nfit_mem)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/acpi/nfit/core.c: In function 'acpi_nfit_register_region':
>> drivers/acpi/nfit/core.c:2955:41: error: implicit declaration of function 'pxm_to_node'; did you mean 'xa_to_node'? [-Werror=implicit-function-declaration]
    2955 |                 ndr_desc->target_node = pxm_to_node(spa->proximity_domain);
         |                                         ^~~~~~~~~~~
         |                                         xa_to_node
   cc1: some warnings being treated as errors


vim +2955 drivers/acpi/nfit/core.c

  2922	
  2923	static int acpi_nfit_register_region(struct acpi_nfit_desc *acpi_desc,
  2924			struct nfit_spa *nfit_spa)
  2925	{
  2926		static struct nd_mapping_desc mappings[ND_MAX_MAPPINGS];
  2927		struct acpi_nfit_system_address *spa = nfit_spa->spa;
  2928		struct nd_blk_region_desc ndbr_desc;
  2929		struct nd_region_desc *ndr_desc;
  2930		struct nfit_memdev *nfit_memdev;
  2931		struct nvdimm_bus *nvdimm_bus;
  2932		struct resource res;
  2933		int count = 0, rc;
  2934	
  2935		if (nfit_spa->nd_region)
  2936			return 0;
  2937	
  2938		if (spa->range_index == 0 && !nfit_spa_is_virtual(spa)) {
  2939			dev_dbg(acpi_desc->dev, "detected invalid spa index\n");
  2940			return 0;
  2941		}
  2942	
  2943		memset(&res, 0, sizeof(res));
  2944		memset(&mappings, 0, sizeof(mappings));
  2945		memset(&ndbr_desc, 0, sizeof(ndbr_desc));
  2946		res.start = spa->address;
  2947		res.end = res.start + spa->length - 1;
  2948		ndr_desc = &ndbr_desc.ndr_desc;
  2949		ndr_desc->res = &res;
  2950		ndr_desc->provider_data = nfit_spa;
  2951		ndr_desc->attr_groups = acpi_nfit_region_attribute_groups;
  2952		if (spa->flags & ACPI_NFIT_PROXIMITY_VALID) {
  2953			ndr_desc->numa_node = acpi_map_pxm_to_online_node(
  2954							spa->proximity_domain);
> 2955			ndr_desc->target_node = pxm_to_node(spa->proximity_domain);
  2956		} else {
  2957			ndr_desc->numa_node = NUMA_NO_NODE;
  2958			ndr_desc->target_node = NUMA_NO_NODE;
  2959		}
  2960	
  2961		/*
  2962		 * Persistence domain bits are hierarchical, if
  2963		 * ACPI_NFIT_CAPABILITY_CACHE_FLUSH is set then
  2964		 * ACPI_NFIT_CAPABILITY_MEM_FLUSH is implied.
  2965		 */
  2966		if (acpi_desc->platform_cap & ACPI_NFIT_CAPABILITY_CACHE_FLUSH)
  2967			set_bit(ND_REGION_PERSIST_CACHE, &ndr_desc->flags);
  2968		else if (acpi_desc->platform_cap & ACPI_NFIT_CAPABILITY_MEM_FLUSH)
  2969			set_bit(ND_REGION_PERSIST_MEMCTRL, &ndr_desc->flags);
  2970	
  2971		list_for_each_entry(nfit_memdev, &acpi_desc->memdevs, list) {
  2972			struct acpi_nfit_memory_map *memdev = nfit_memdev->memdev;
  2973			struct nd_mapping_desc *mapping;
  2974	
  2975			if (memdev->range_index != spa->range_index)
  2976				continue;
  2977			if (count >= ND_MAX_MAPPINGS) {
  2978				dev_err(acpi_desc->dev, "spa%d exceeds max mappings %d\n",
  2979						spa->range_index, ND_MAX_MAPPINGS);
  2980				return -ENXIO;
  2981			}
  2982			mapping = &mappings[count++];
  2983			rc = acpi_nfit_init_mapping(acpi_desc, mapping, ndr_desc,
  2984					memdev, nfit_spa);
  2985			if (rc)
  2986				goto out;
  2987		}
  2988	
  2989		ndr_desc->mapping = mappings;
  2990		ndr_desc->num_mappings = count;
  2991		rc = acpi_nfit_init_interleave_set(acpi_desc, ndr_desc, spa);
  2992		if (rc)
  2993			goto out;
  2994	
  2995		nvdimm_bus = acpi_desc->nvdimm_bus;
  2996		if (nfit_spa_type(spa) == NFIT_SPA_PM) {
  2997			rc = acpi_nfit_insert_resource(acpi_desc, ndr_desc);
  2998			if (rc) {
  2999				dev_warn(acpi_desc->dev,
  3000					"failed to insert pmem resource to iomem: %d\n",
  3001					rc);
  3002				goto out;
  3003			}
  3004	
  3005			nfit_spa->nd_region = nvdimm_pmem_region_create(nvdimm_bus,
  3006					ndr_desc);
  3007			if (!nfit_spa->nd_region)
  3008				rc = -ENOMEM;
  3009		} else if (nfit_spa_is_volatile(spa)) {
  3010			nfit_spa->nd_region = nvdimm_volatile_region_create(nvdimm_bus,
  3011					ndr_desc);
  3012			if (!nfit_spa->nd_region)
  3013				rc = -ENOMEM;
  3014		} else if (nfit_spa_is_virtual(spa)) {
  3015			nfit_spa->nd_region = nvdimm_pmem_region_create(nvdimm_bus,
  3016					ndr_desc);
  3017			if (!nfit_spa->nd_region)
  3018				rc = -ENOMEM;
  3019		}
  3020	
  3021	 out:
  3022		if (rc)
  3023			dev_err(acpi_desc->dev, "failed to register spa range %d\n",
  3024					nfit_spa->spa->range_index);
  3025		return rc;
  3026	}
  3027	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
