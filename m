Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6CC1FA5
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Apr 2023 10:28:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681036112; x=1712572112;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KeAYlYw7dsAnc5vKGOV1bGhO0jIbNq+Wkl3LMvGtLRg=;
  b=DmOCSVIWV4ZpWqBWc49YinZ2nzfQLSYbPcIy8rFcjtN3BCrKSg1mofXo
   VxViIdDpfM4bAaDu+Ox7GEVVvo5vXYOPyngOubHe4BbGqwlYRqgYta0Gv
   +tR5FIB3tAkkMx8gpcMqG+9Txgj2pDbbXaISP4xVzJ9a6QTik3LtvRFzh
   y7S850MRjLdK8bSVxhaDVbhtQJwwBICHsIvAm+UqqflL6Q0/xUTT0tzsD
   nW1xn+Sj/VnsNPSsw+tZTkCVvJSMN9pdooBpkT8wNFXuLAF4lczpI3oUv
   AX/08YL1ape18E2rpOfXwxDwwhMKmGt/C3+Bev/5J1gk6JztevyoTl7bW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="343215826"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="343215826"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2023 03:28:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10674"; a="718304038"
X-IronPort-AV: E=Sophos;i="5.98,331,1673942400"; 
   d="scan'208";a="718304038"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 09 Apr 2023 03:28:28 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1plSHb-000UT9-2l;
	Sun, 09 Apr 2023 10:28:27 +0000
Date: Sun, 9 Apr 2023 18:27:36 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <ira.weiny@intel.com>,
	Ben Widawsky <ben.widawsky@intel.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [cxl:for-6.5/dcd-preview 13/15] drivers/cxl/core/region.c:2685:
 undefined reference to `unregister_dax_mapping'
Message-ID: <202304091820.MRgQy5nG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git for-6.5/dcd-preview
head:   f425bc34c600e2a3721d6560202962ec41622815
commit: 3113a430f1ccbad8340234cf38b00f271ccee103 [13/15] cxl/mem: Add support to handle DCD add and release capacity events.
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230409/202304091820.MRgQy5nG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git/commit/?id=3113a430f1ccbad8340234cf38b00f271ccee103
        git remote add cxl https://git.kernel.org/pub/scm/linux/kernel/git/cxl/cxl.git
        git fetch --no-tags cxl for-6.5/dcd-preview
        git checkout 3113a430f1ccbad8340234cf38b00f271ccee103
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304091820.MRgQy5nG-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/cxl/core/region.o: in function `cxl_release_dc_extent':
>> drivers/cxl/core/region.c:2685: undefined reference to `unregister_dax_mapping'
>> ld: drivers/cxl/core/region.c:2692: undefined reference to `unregister_dev_dax'
   ld: drivers/cxl/core/region.o: in function `cxl_add_dc_extent':
>> drivers/cxl/core/region.c:2748: undefined reference to `devm_create_dev_dax'
>> ld: drivers/cxl/core/region.c:2754: undefined reference to `alloc_dev_dax_range'


vim +2685 drivers/cxl/core/region.c

  2633	
  2634	int cxl_release_dc_extent(struct cxl_dev_state *cxlds,
  2635				  struct resource *rel_dpa_res)
  2636	{
  2637		struct cxl_memdev *cxlmd = cxlds->cxlmd;
  2638		struct cxl_endpoint_decoder *cxled;
  2639		struct cxl_dc_region *cxlr_dc;
  2640		struct dax_region *dax_region;
  2641		resource_size_t dpa_offset;
  2642		struct cxl_region *cxlr;
  2643		struct range hpa_range;
  2644		struct dev_dax *dev_dax;
  2645		resource_size_t hpa;
  2646		struct device *dev;
  2647		int ranges, rc = 0;
  2648	
  2649		/*
  2650		 * Find the cxl endpoind decoder with which has the extent dpa range and
  2651		 * get the cxl_region, dax_region refrences.
  2652		 */
  2653		dev = device_find_child(&cxlmd->endpoint->dev, rel_dpa_res,
  2654					match_ep_decoder_by_range);
  2655		if (!dev) {
  2656			dev_err(cxlds->dev, "%pr not mapped\n",	rel_dpa_res);
  2657			return PTR_ERR(dev);
  2658		}
  2659	
  2660		cxled = to_cxl_endpoint_decoder(dev);
  2661		hpa_range = cxled->cxld.hpa_range;
  2662		cxlr = cxled->cxld.region;
  2663		cxlr_dc = cxlr->cxlr_dc;
  2664	
  2665		/* DPA to HPA translation */
  2666		if (cxled->cxld.interleave_ways == 1) {
  2667			dpa_offset = rel_dpa_res->start - cxled->dpa_res->start;
  2668			hpa = hpa_range.start + dpa_offset;
  2669		} else {
  2670			dev_err(cxlds->dev, "Interleaving DC not supported\n");
  2671			return -EINVAL;
  2672		}
  2673	
  2674		dev_dax = xa_load(&cxlr_dc->dax_dev_list, hpa);
  2675		if (!dev_dax)
  2676			return -EINVAL;
  2677	
  2678		dax_region = dev_dax->region;
  2679		ranges = dev_dax->nr_range;
  2680	
  2681		while (ranges) {
  2682			int i = ranges - 1;
  2683			struct dax_mapping *mapping = dev_dax->ranges[i].mapping;
  2684	
> 2685			devm_release_action(dax_region->dev, unregister_dax_mapping,
  2686									&mapping->dev);
  2687			ranges--;
  2688		}
  2689	
  2690		dev_dbg(cxlds->dev, "removing devdax device:%s\n",
  2691							dev_name(&dev_dax->dev));
> 2692		devm_release_action(dax_region->dev, unregister_dev_dax,
  2693								&dev_dax->dev);
  2694		xa_erase(&cxlr_dc->dax_dev_list, hpa);
  2695	
  2696		return rc;
  2697	}
  2698	
  2699	int cxl_add_dc_extent(struct cxl_dev_state *cxlds, struct resource *alloc_dpa_res)
  2700	{
  2701		struct dev_dax_data data;
  2702		struct dev_dax *dev_dax;
  2703		struct cxl_endpoint_decoder *cxled;
  2704		struct cxl_memdev *cxlmd = cxlds->cxlmd;
  2705		struct device *dev;
  2706		struct range hpa_range;
  2707		struct cxl_region *cxlr;
  2708		struct cxl_dc_region *cxlr_dc;
  2709		struct cxl_dax_region *cxlr_dax;
  2710		struct dax_region *dax_region;
  2711		resource_size_t dpa_offset;
  2712		resource_size_t hpa;
  2713		int rc;
  2714	
  2715		/*
  2716		 * Find the cxl endpoind decoder with which has the extent dpa range and
  2717		 * get the cxl_region, dax_region refrences.
  2718		 */
  2719		dev = device_find_child(&cxlmd->endpoint->dev, alloc_dpa_res,
  2720					match_ep_decoder_by_range);
  2721		if (!dev) {
  2722			dev_err(cxlds->dev, "%pr not mapped\n",	alloc_dpa_res);
  2723			return PTR_ERR(dev);
  2724		}
  2725	
  2726		cxled = to_cxl_endpoint_decoder(dev);
  2727		hpa_range = cxled->cxld.hpa_range;
  2728		cxlr = cxled->cxld.region;
  2729		cxlr_dc = cxlr->cxlr_dc;
  2730		cxlr_dax = cxlr_dc->cxlr_dax;
  2731		dax_region = dev_get_drvdata(&cxlr_dax->dev);
  2732	
  2733		/* DPA to HPA translation */
  2734		if (cxled->cxld.interleave_ways == 1) {
  2735			dpa_offset = alloc_dpa_res->start - cxled->dpa_res->start;
  2736			hpa = hpa_range.start + dpa_offset;
  2737		} else {
  2738			dev_err(cxlds->dev, "Interleaving DC not supported\n");
  2739			return -EINVAL;
  2740		}
  2741	
  2742		data = (struct dev_dax_data) {
  2743			.dax_region = dax_region,
  2744			.id = -1,
  2745			.size = 0,
  2746		};
  2747	
> 2748		dev_dax = devm_create_dev_dax(&data);
  2749		if (IS_ERR(dev_dax))
  2750			return PTR_ERR(dev_dax);
  2751	
  2752		if (IS_ALIGNED(resource_size(alloc_dpa_res), max_t(unsigned long,
  2753					dev_dax->align, memremap_compat_align()))) {
> 2754			rc = alloc_dev_dax_range(dev_dax, hpa,
  2755						resource_size(alloc_dpa_res));
  2756			return rc;
  2757		}
  2758	
  2759		rc = xa_insert(&cxlr_dc->dax_dev_list, hpa, dev_dax, GFP_KERNEL);
  2760	
  2761		return rc;
  2762	}
  2763	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
