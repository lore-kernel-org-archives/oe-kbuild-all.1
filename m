Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EDC2907
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 17:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727112725; cv=none; b=O0hT3cgp/fgy6lrH2BJ7TL5vll2BZuP7BM28aPSIgJjyitLC+epUcvpKkk8owGcG0kG7ZDGGzC/pfegV35iEc3B0qrY0nMhoYafq3LPfqjYsTtc8Q9vGGI+qroovgUGDV4vXzeHujC1e35mGGqXtNAeJlbzB1d/DONWXyw/pTio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727112725; c=relaxed/simple;
	bh=SG26CRpeWhM9hWJcylZek7AFR6z1m7zlnFpHv8Ks8WU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eEolp6J6LWfA+p+OAq8E7dLfeYA+J+1I5Xt6Zvi2hRe2770OI+nyXHMknRI4hFOJhlsRDlLTq7jC3m5DPwykhSDMLXwNUqlSVNOcb5uLpLMkYIdKtmWUXT0EcbZWOd58qUP+HKPOtyOveuK9DF77dSIgH+muI5vQ2j/L33+ODc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AgkSDMfs; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AgkSDMfs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727112722; x=1758648722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SG26CRpeWhM9hWJcylZek7AFR6z1m7zlnFpHv8Ks8WU=;
  b=AgkSDMfs6myTOPO2JB/myfzNh/MKsQECCo7gTAOdXC6vKpFgzPYn+S6v
   ETs8VxBjoumFSiBPOkvi+iW7PTxU4LVAVhvBC9AQfuRqy/13CiFze8d39
   NIZXSL1yMRNUmfYoHhxdja0+etVFC2Go7oAedxFow4p8ABEvRe9XnVcf5
   MDQ/8ZvOZ3H8lxw5IeDsOtx9f+4xfUQpQ8IBFPMyh6HBLmYtbfYYlgWdt
   68/y8F2OCUqI3IF6t5857Zro6080U8wfg5M+PNJKDKODJv6qbw7f9wA0e
   ScHH5NpcAepL95gQwwKL35loa47jHBx6hyV5qie9z5url3xd2FO9yxceh
   A==;
X-CSE-ConnectionGUID: zXycaJZRTTeBMkYzgpyymQ==
X-CSE-MsgGUID: v6lQEVKmSf6AnpVVDZgEag==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="43545715"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="43545715"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 10:31:40 -0700
X-CSE-ConnectionGUID: bx6innqaROyG4AgK6/PiYw==
X-CSE-MsgGUID: NIG9TJ2BT2GbazD9BPyscQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="75901463"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 Sep 2024 10:31:38 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssmuM-000HT0-13;
	Mon, 23 Sep 2024 17:31:34 +0000
Date: Tue, 24 Sep 2024 01:30:50 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 347/2441]
 drivers/acpi/nfit/core.c:2955:41: error: implicit declaration of function
 'pxm_to_node'; did you mean 'xa_to_node'?
Message-ID: <202409240106.tIj6z1jJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   63759dec7a1be60e43e98e4257de936b546e4656
commit: a8b2bf6b3dcb0532ad923d4ee47daf0f476566d9 [347/2441] ACPI: Do not create new NUMA domains from ACPI static tables that are not SRAT
config: x86_64-buildonly-randconfig-005-20240923 (https://download.01.org/0day-ci/archive/20240924/202409240106.tIj6z1jJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240924/202409240106.tIj6z1jJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240106.tIj6z1jJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/libnvdimm.h:13,
                    from drivers/acpi/nfit/core.c:6:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:8,
                    from include/linux/libnvdimm.h:9:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
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
