Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291D12E973F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Feb 2026 17:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771523566; cv=none; b=F1JZqS9JxvvjzvRjC8GiYzkt9Mkisyzx4Dz6D9ISOW5/1OIlmcdIul/cf3YEkbxVEHsUcJhPIc5fM21ScubhxYm81qwpV7kXp4S3mR++vVuVDKaTxp1iby/4EdVEMVTtoK+o1uT+VSPFvqJ3HTisTzOO/l4TpDEzecGNJZfg0N8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771523566; c=relaxed/simple;
	bh=rewaKEPWQgRL6T7y5NXhHQDs9qR4wr0rnEN8a1RRycI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E3lGGH6P4BW2JcTynt2tP7lHsPa/h9pFobXH2+vpj1KJNrpY5IUxy2RUH+excKyskrajZhC70jpSLm4KZeeDe1lrQXzXZxLwaxW/mYrAohrbpW0KN9Y67oLshj+NMVXzWSaCuThiB7Nc8yHBLMwQvoWwQR8iIYQyG8Vuk3idBhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=g3/ogsVE; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="g3/ogsVE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771523565; x=1803059565;
  h=date:from:to:cc:subject:message-id;
  bh=rewaKEPWQgRL6T7y5NXhHQDs9qR4wr0rnEN8a1RRycI=;
  b=g3/ogsVEOjnR5iu3FHSjVOM/XEPd2RD3ehTidv0dhjYDbZjRTuiX2f9b
   2cGGJ5w9XI8muLusqqhEy+wa+JNAQnvdSnxXJB/JHbfY/LsJ173nzZUgh
   KdfnRBiZ8vq/XvbbymrV8IHMoZJXYjONa60fVG6l7w1DYtP62WsJI5Atl
   iEDPRFPpccYyUgssSAhHxCQdNni1K0IKXhOub6JPTnjFqFVvBIGyBX2r1
   k8XUibjtZTlp95TuKq6r4hiKyT7tQkdIOOZBMByjiwDcH/AFWTeuomfPK
   0jZQV5EKSb8axTLSjB2+ti4RVihZWkSzwJg+L0mbQjbfiQIRiA/C9QOjk
   Q==;
X-CSE-ConnectionGUID: E50HfgUdRHiJ+SutLp8XZw==
X-CSE-MsgGUID: 1bwHhOWDSm21pmc89zbLrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11706"; a="83334576"
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="83334576"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2026 09:52:44 -0800
X-CSE-ConnectionGUID: q5d9fzArT0iGG+jPKFlOJA==
X-CSE-MsgGUID: 0aZzNUAYQpq9gcehlel5Vg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,300,1763452800"; 
   d="scan'208";a="252283372"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 19 Feb 2026 09:52:42 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vt8Ce-000000013Qe-0oBA;
	Thu, 19 Feb 2026 17:52:40 +0000
Date: Fri, 20 Feb 2026 01:52:07 +0800
From: kernel test robot <lkp@intel.com>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Herve Codina <herve.codina@bootlin.com>
Subject: [drm-misc:drm-misc-next 5/25]
 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:108:55: sparse: sparse:
 incorrect type in initializer (different base types)
Message-ID: <202602200130.LjofC7YE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   948e195dfaa56e48eabda591f97630502ff7e27e
commit: 0ff223d991477fa4677dcb0f1fb00065847e2212 [5/25] drm/tilcdc: Convert legacy panel binding via DT overlay at boot time
config: arm-randconfig-r111-20260219 (https://download.01.org/0day-ci/archive/20260220/202602200130.LjofC7YE-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e86750b29fa0ff207cd43213d66dabe565417638)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260220/202602200130.LjofC7YE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602200130.LjofC7YE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:108:55: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:108:55: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:108:55: sparse:     got restricted __be32 [usertype]
   drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:115:55: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned int [usertype] @@     got restricted __be32 [usertype] @@
   drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:115:55: sparse:     expected unsigned int [usertype]
   drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c:115:55: sparse:     got restricted __be32 [usertype]

vim +108 drivers/gpu/drm/tilcdc/tilcdc_panel_legacy.c

    41	
    42	static int __init tilcdc_panel_copy_props(struct device_node *old_panel,
    43						  struct device_node *new_panel)
    44	{
    45		struct device_node *old_timing __free(device_node) = NULL;
    46		struct device_node *new_timing __free(device_node) = NULL;
    47		struct device_node *panel_info __free(device_node) = NULL;
    48		struct device_node *child __free(device_node) = NULL;
    49		u32 invert_pxl_clk = 0, sync_edge = 0;
    50		struct of_changeset ocs;
    51		struct property *prop;
    52		int ret;
    53	
    54		child = of_get_child_by_name(old_panel, "display-timings");
    55		if (!child)
    56			return -EINVAL;
    57	
    58		/* The default display timing is the one specified as native-mode.
    59		 * If no native-mode is specified then the first node is assumed
    60		 * to be the native mode.
    61		 */
    62		old_timing = of_parse_phandle(child, "native-mode", 0);
    63		if (!old_timing) {
    64			old_timing = of_get_next_child(child, NULL);
    65			if (!old_timing)
    66				return -EINVAL;
    67		}
    68	
    69		panel_info = of_get_child_by_name(old_panel, "panel-info");
    70		if (!panel_info)
    71			return -EINVAL;
    72	
    73		of_changeset_init(&ocs);
    74	
    75		/* Copy all panel properties to the new panel node */
    76		for_each_property_of_node(old_panel, prop) {
    77			if (!strncmp(prop->name, "compatible", sizeof("compatible")))
    78				continue;
    79	
    80			ret = tilcdc_panel_update_prop(&ocs, new_panel, prop->name,
    81						       prop->value, prop->length);
    82			if (ret)
    83				goto destroy_ocs;
    84		}
    85	
    86		new_timing = of_changeset_create_node(&ocs, new_panel, "panel-timing");
    87		if (!new_timing) {
    88			ret = -ENODEV;
    89			goto destroy_ocs;
    90		}
    91	
    92		/* Copy all panel timing properties to the new panel node */
    93		for_each_property_of_node(old_timing, prop) {
    94			ret = tilcdc_panel_update_prop(&ocs, new_timing, prop->name,
    95						       prop->value, prop->length);
    96			if (ret)
    97				goto destroy_ocs;
    98		}
    99	
   100		/* Looked only for these two parameter as all the other are always
   101		 * set to default and not related to common DRM properties.
   102		 */
   103		of_property_read_u32(panel_info, "invert-pxl-clk", &invert_pxl_clk);
   104		of_property_read_u32(panel_info, "sync-edge", &sync_edge);
   105	
   106		if (!invert_pxl_clk) {
   107			ret = tilcdc_panel_update_prop(&ocs, new_timing, "pixelclk-active",
 > 108						       &(u32){cpu_to_be32(1)}, sizeof(u32));
   109			if (ret)
   110				goto destroy_ocs;
   111		}
   112	
   113		if (!sync_edge) {
   114			ret = tilcdc_panel_update_prop(&ocs, new_timing, "syncclk-active",
   115						       &(u32){cpu_to_be32(1)}, sizeof(u32));
   116			if (ret)
   117				goto destroy_ocs;
   118		}
   119	
   120		/* Remove compatible property to avoid any driver compatible match */
   121		of_changeset_remove_property(&ocs, old_panel,
   122					     of_find_property(old_panel, "compatible", NULL));
   123	
   124		of_changeset_apply(&ocs);
   125		return 0;
   126	
   127	destroy_ocs:
   128		of_changeset_destroy(&ocs);
   129		return ret;
   130	}
   131	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
