Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6C744B68F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Feb 2026 19:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772133379; cv=none; b=kEhrB5rg5qKjn13XsElZlv1WXxJKpfxORbTCQGD51eWeeMa5X0naMeB2Ko+f1n1rvkduYqReEcm4HXABaSZUjTpGE67aJEF8E06jAfnwpVevpbYU2oHBQprCiknFBfv7KUMU+w2HxX8O2vo3nKjF/0o8eKaLPR/7YfDO7mQJCww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772133379; c=relaxed/simple;
	bh=sIFuQejimBVvLKR3VTyE4CsENi62nbBdr11RGnk7nls=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AgUe9z+OOhq6hFG8fFeI8qr6aSwSZ2F7HcnpDPZd14IazzDWUV4cjnyTD4QzrvM31QJO4QxMmeaGLVAO9lnNzyaHnplakma1ItlUuKC+pV5m1FKLf30jzZXmLAI+wYSqaSBV3RgeOLBbEa7yLL6tz7YiiKXDpknuc//qDbhpC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dpi0N4Uf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dpi0N4Uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772133377; x=1803669377;
  h=date:from:to:cc:subject:message-id;
  bh=sIFuQejimBVvLKR3VTyE4CsENi62nbBdr11RGnk7nls=;
  b=Dpi0N4Uf64c2l7faSpSdXslrKGdWpuJOZ9yE2qCMd1ZqDsmDdUCcedCb
   9lizc+yELwpuaStnuUM0nzIck+h6rEnBLK23C+7qjwk7p53Fl5hnU6qfR
   9PTkfBbr65iRqaNIzkN2rY9e0KAJ0/TagGm+2ewZdrgV9AgnZzdrtmqPq
   HzCHL0Wb2TiJQ+aHG+tXMox5IuZ0YacdQtoa59KWi+n7059GfWtkEfH26
   tMnJJeElI/M14Ejl/a/hhL9RK84oW0SpaxbIyic6sLcp9xNOVoOLZq2/U
   PxJhjsCaqkBlV/T5UC44NERaYQr7Nl+7hnR5lCJ1S89g5ASiyoGpI/HPJ
   g==;
X-CSE-ConnectionGUID: gYO8w1xqQ3GjCuSfDOd0Xg==
X-CSE-MsgGUID: zN4qm3tkS62Icb8YGnNI5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="72908884"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="72908884"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 11:16:17 -0800
X-CSE-ConnectionGUID: bBAzXI6QT0ePBvJb3a4TcQ==
X-CSE-MsgGUID: 5zez6Q67Qe66J7dJproH1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="215792269"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 26 Feb 2026 11:16:16 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvgqL-000000000HN-3xwT;
	Thu, 26 Feb 2026 19:16:13 +0000
Date: Thu, 26 Feb 2026 20:16:05 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 204/204]
 Documentation/devicetree/bindings/arm/ete.yaml:44:60: mapping values are not
 allowed here
Message-ID: <202602261436.XfYv0vwo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   428f501f574bae8d1bb15211ccfdac399e4f4e7d
commit: 4198bdb2cff86af72de536067e11d8783928c881 [204/204] ANDROID: coresight: Update ETE DT yaml file
config: arm-randconfig-2052-20260226 (https://download.01.org/0day-ci/archive/20260226/202602261436.XfYv0vwo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema: 2025.13.dev7+gd16dc68b0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602261436.XfYv0vwo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602261436.XfYv0vwo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> make[2]: *** [Documentation/devicetree/bindings/Makefile:20: Documentation/devicetree/bindings/arm/ete.example.dts] Error 1
   make[2]: *** Deleting file 'Documentation/devicetree/bindings/arm/ete.example.dts'
   make[2]: *** [Documentation/devicetree/bindings/Makefile:59: Documentation/devicetree/bindings/processed-schema-examples.json] Error 123
   make[2]: Target '__build' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=n] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for NET_PTP_CLASSIFY
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_TTM
   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   WARNING: unmet direct dependencies detected for HMM_MIRROR
   Depends on [n]: MMU [=n]
   Selected by [y]:
   - GKI_HIDDEN_GPU_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=n] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=n] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for PAGE_POOL
   Depends on [n]: NET [=n]
   Selected by [y]:
   - GKI_HIDDEN_NET_CONFIGS [=y]

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/arm/ete.yaml:44:60: mapping values are not allowed here

vim +44 Documentation/devicetree/bindings/arm/ete.yaml

     9	
    10	maintainers:
    11	  - Suzuki K Poulose <suzuki.poulose@arm.com>
    12	  - Mathieu Poirier <mathieu.poirier@linaro.org>
    13	
    14	description: |
    15	  Arm Embedded Trace Extension(ETE) is a per CPU trace component that
    16	  allows tracing the CPU execution. It overlaps with the CoreSight ETMv4
    17	  architecture and has extended support for future architecture changes.
    18	  The trace generated by the ETE could be stored via legacy CoreSight
    19	  components (e.g, TMC-ETR) or other means (e.g, using a per CPU buffer
    20	  Arm Trace Buffer Extension (TRBE)). Since the ETE can be connected to
    21	  legacy CoreSight components, a node must be listed per instance, along
    22	  with any optional connection graph as per the coresight bindings.
    23	  See bindings/arm/coresight.txt.
    24	
    25	properties:
    26	  $nodename:
    27	    pattern: "^ete([0-9a-f]+)$"
    28	  compatible:
    29	    items:
    30	      - const: arm,embedded-trace-extension
    31	
    32	  cpu:
    33	    description: |
    34	      Handle to the cpu this ETE is bound to.
    35	    $ref: /schemas/types.yaml#/definitions/phandle
    36	
    37	  out-ports:
    38	    description: |
    39	      Output connections from the ETE to legacy CoreSight trace bus.
    40	    $ref: /schemas/graph.yaml#/properties/ports
    41	    properties:
    42	      port:
    43	        description: Output connection from the ETE to legacy CoreSight Trace bus.
  > 44	        $ref: /schemas/graph.yaml#/properties/port required:
    45	
    46	required:
    47	  - compatible
    48	  - cpu
    49	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
