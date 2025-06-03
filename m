Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687631F4CA4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Jun 2025 07:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934227; cv=none; b=TsHPYlRiN4b+vw3VpIvfJwzzbX2QmhlpRC6UK6B02whrisrfFxm+n7JR8FaN4vuzKsp3QPgNKu5s3iKhJc99cBbPrybMNb6s4EaBNQQrk4+YdUjQ9Lu00tk2U/nt2z0iZ1PKuNRhiDV7vOhc3EuM3YmgVzqI42SOsdrowY/B45s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934227; c=relaxed/simple;
	bh=GzHD+K1TibBLfrf0Roq/wd4+ehK3jnAFVcNeP2UNPvc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fGL6p1JQln+oBn4UOz6SjByGCbYdd34qj73plnHNYByJiRUcxSBYCZGVZsMhdsQzvIvnPSXwuyfNY7XMO0I4nIT71i65K9AcdBWkXkMwlxQyOsIezEW7y8CXrxmEOPxXwj1IH2vGDCEw2Tg7wZ6eoVKR83j0jcSmFlYaS+YstoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X38uV0Q8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X38uV0Q8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748934223; x=1780470223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GzHD+K1TibBLfrf0Roq/wd4+ehK3jnAFVcNeP2UNPvc=;
  b=X38uV0Q83NFspYJ4lvQ7C4m8QrUclmIdo2OfZkrv+QJ+qcXVI55mRGrk
   jT6tq2fFqsG3XhbBivBvR3pUdCpagfdvex/iadgx7d54I4dDdG+MSXDJO
   vZ/KbJ+/VYWwcdCeJR+L61aMKUEPWxtxktNK39u9IVvCmgQNl9jozDjyR
   fXHcwTKJv1I3eDglB+XMB4HmkFRhxqlqdcKs+q0SR3ksdnF3Ra3IN0exB
   PuYRYVbhb9a6eTr91p9um04poyTRWlom3dmkQ3p+T8kphPnOh3UsrF46j
   zUUcpnZzdNDbdSXG4p4iJCM9dy1KmN9mDNRICa+LwPPp9tZP5pNDmYe0c
   A==;
X-CSE-ConnectionGUID: 6AKNRwkWQWugdrt/Jul2DA==
X-CSE-MsgGUID: WmreZqkiSf6nfO6TXQCUog==
X-IronPort-AV: E=McAfee;i="6700,10204,11451"; a="62349344"
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="62349344"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2025 00:03:42 -0700
X-CSE-ConnectionGUID: bQoOrfoNQgOayG5ZqrHJAw==
X-CSE-MsgGUID: w2EK9Py+Q22Zd5YUP1CDHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,205,1744095600"; 
   d="scan'208";a="148631546"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 03 Jun 2025 00:03:39 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMLgP-0002G9-2T;
	Tue, 03 Jun 2025 07:03:37 +0000
Date: Tue, 3 Jun 2025 15:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 139/139]
 arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mmdvfs-mux: failed to match
 any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
Message-ID: <202506031418.WHQhups6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   c76c68baa3b1801d81033deae4c36dd8dfe350f5
commit: 1ff04cadee53f8e01edef4f91a561c3836982d4e [139/139] CHROMIUM: arm64: dts: mediatek: mt8196: add mmdebug and mmdvfs_debug node
config: arm64-randconfig-051-20250529 (https://download.01.org/0day-ci/archive/20250603/202506031418.WHQhups6-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250603/202506031418.WHQhups6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506031418.WHQhups6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc (simple-bus): apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc (simple-bus): vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc (simple-bus): mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: soc (simple-bus): opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[49], [50], [51], [52], [53], [54], [55], [56], [57], [58]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-evb.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc (simple-bus): mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc (simple-bus): opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc (simple-bus): apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-rev0.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: soc (simple-bus): apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: soc (simple-bus): mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: soc (simple-bus): vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: soc (simple-bus): opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku0.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: soc (simple-bus): apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: soc (simple-bus): opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: soc (simple-bus): vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku1.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: soc (simple-bus): vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: soc (simple-bus): apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: soc (simple-bus): opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku2.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: soc (simple-bus): opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: soc (simple-bus): vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: soc (simple-bus): mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku3.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: soc (simple-bus): mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: soc (simple-bus): opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: soc (simple-bus): apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku4.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: soc (simple-bus): mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: soc (simple-bus): opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: soc (simple-bus): vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: soc (simple-bus): apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku5.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: soc (simple-bus): vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: soc (simple-bus): apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: soc (simple-bus): opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: soc (simple-bus): mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku6.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: soc (simple-bus): vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: soc (simple-bus): opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: soc (simple-bus): mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-hylia-sku7.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: soc (simple-bus): apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: soc (simple-bus): opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: soc (simple-bus): mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku0.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: soc (simple-bus): mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: soc (simple-bus): vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: soc (simple-bus): apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku1.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: soc (simple-bus): vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: soc (simple-bus): apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: soc (simple-bus): opp-table-apu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: soc (simple-bus): mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku2.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']
--
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /reserved-memory/vcp-reserved-memory@a0200000: failed to match any schema with compatible: ['mediatek,me-vcp-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /reserved-memory/mali-protected@a2000000: failed to match any schema with compatible: ['mali-reserved']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /reserved-memory/secure-region@a3000000: failed to match any schema with compatible: ['mediatek,dynamic-restricted-region']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /reserved-memory/apu-smmu-reserve-memory0: failed to match any schema with compatible: ['mediatek,apu-smmu-resv-mem']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /ged: failed to match any schema with compatible: ['mediatek,ged']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /gpu-dcs: failed to match any schema with compatible: ['mediatek,gpu-dcs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /gpu-loading-mode: failed to match any schema with compatible: ['mediatek,gpu-loading-mode']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /protected-memory-allocator: failed to match any schema with compatible: ['arm,protected-memory-allocator']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /gpufreq-wrapper: failed to match any schema with compatible: ['mediatek,gpufreq-wrapper']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /mgm: failed to match any schema with compatible: ['arm,physical-memory-group-manager']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /mmdvfs-mux: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-mux']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /mmdvfs-user: failed to match any schema with compatible: ['mediatek,mtk-mmdvfs-user']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /mmdvfs-debug: failed to match any schema with compatible: ['mediatek,mmdvfs-debug']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /mmdebug-vcp: failed to match any schema with compatible: ['mediatek,mmdebug-vcp']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: soc (simple-bus): vmm: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: soc (simple-bus): apusys-apummu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: soc (simple-bus): mtk-apu-mem-data: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: soc (simple-bus): mvpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: soc (simple-bus): sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: soc (simple-bus): mtk-apu-mem-code: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: soc (simple-bus): vdisp-ctrl: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/therm-intf@114000: failed to match any schema with compatible: ['mediatek,therm_intf']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/slbc@117800: failed to match any schema with compatible: ['mediatek,mt8196-slbc']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/qos@11bb00: failed to match any schema with compatible: ['mediatek,mt8196-qos']
>> arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/gpu-fdvfs@13f800: failed to match any schema with compatible: ['mediatek,gpu-fdvfs']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/cm-mgr@c100000: failed to match any schema with compatible: ['mediatek,mt8196-cm-mgr']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: cm-mgr@c100000 (mediatek,mt8196-cm-mgr): required-opps: [[52], [53], [54], [55], [56], [57], [58], [59], [60], [61]] is too long
   	from schema $id: http://devicetree.org/schemas/opp/opp.yaml#
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@c1e0000: failed to match any schema with compatible: ['mediatek,mt8196-ccipll-pll-ctrl', 'mediatek,mt8196-ccipll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@c1e0400: failed to match any schema with compatible: ['mediatek,mt8196-armpll-ll-pll-ctrl', 'mediatek,mt8196-armpll_ll_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@c1e0800: failed to match any schema with compatible: ['mediatek,mt8196-armpll-bl-pll-ctrl', 'mediatek,mt8196-armpll_bl_pll_ctrl', 'syscon']
   arch/arm64/boot/dts/mediatek/mt8196-rauru-navi-sku5.dtb: /soc/syscon@c1e0c00: failed to match any schema with compatible: ['mediatek,mt8196-armpll-b-pll-ctrl', 'mediatek,mt8196-armpll_b_pll_ctrl', 'syscon']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
