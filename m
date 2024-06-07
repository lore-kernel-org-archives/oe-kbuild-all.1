Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8376200A3
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 14:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717770805; cv=none; b=N7PNCV6usoWTdT8JwI9mRFfNU6pQB/MFJbkzUZ0m08YQSBtuOv2dfxSFoDDD2V78yLlNDYSomwzexGMAlukpNpY8beZOuJCepvjBNR0XlK9/cBlGnfI0x+LyhgB7vFSx0DLJCLRprQ2PGYkXOnmk/ky384IUZIY+pUrcgMOWiT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717770805; c=relaxed/simple;
	bh=svLBPb6Kiu7LTa/+VC309dKoYyCmEGY2MRg10rFdSII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mpl+rQkZSrYY4bPRH4q/KvUKNM7LONqFi9jtI2zS57Sl91lV0M6z5C3AKdDUcaGJcRJqs3KLTP5vSfgG1DPe+8bgEGXCoUbLIVtVRVpwU1gqZgvshKTL7Xg3hCwucgT8gU/GFCVlTwL7ielHw95oDVEj7xKuScwMavFAk87e9io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVa+BIhb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVa+BIhb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717770803; x=1749306803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=svLBPb6Kiu7LTa/+VC309dKoYyCmEGY2MRg10rFdSII=;
  b=EVa+BIhbjl9TH65ejJ+wy4RQ3Q5A2HJ+HVoLdtbNnVl1/lmzzKIJw9Zj
   WbC+XM61yJlS+GYlWiDNgE0tGhomehyTtLwVGtBxs3WYESUHInmdxF2LW
   wiSR2AsIy6O0FfkhVXGm0PR6cOShEvu6CU0Wn46lb9PUsOLGPkFLzkCFz
   1URHwwpHhoBpA/Bmk3dap1J1QiMeZ/gz30PWj7eY0T5hrR1LLQnCpw5a/
   9Eq03X8cj6Cjr110vcaW0vPmI9Xlk4oKt8lK6qF+av1GsuCktmAN5Vv4p
   phEFWcGm3DE0GhN927ckWSRtxIxednQUz/DL9LamBb5swMCpRdIxFhmie
   A==;
X-CSE-ConnectionGUID: SB1zW3LqT0SIqc0RZAJZRA==
X-CSE-MsgGUID: 5rMZlmV1SauZeh7rHKRZEg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="31989302"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="31989302"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 07:33:22 -0700
X-CSE-ConnectionGUID: NsRVKQTCSsaIiisPhkjSDw==
X-CSE-MsgGUID: jj7xgnQ3RJC/THqJbZXQOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="69504105"
Received: from lkp-server01.sh.intel.com (HELO 7b447d911354) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jun 2024 07:33:20 -0700
Received: from kbuild by 7b447d911354 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFaeb-00001p-2c;
	Fri, 07 Jun 2024 14:33:17 +0000
Date: Fri, 7 Jun 2024 22:32:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [amlogic:v6.11/arm64-dt 4/18] dtbs_check:
 arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb:
 /soc/video-codec@c8820000: failed to match any schema with compatible:
 ['amlogic,gxlx-vdec', 'amlogic,gx-vdec']
Message-ID: <202406072245.puJljZCe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git v6.11/arm64-dt
head:   e822ce43968daf9da4368617d2c948c22ccf93f9
commit: f6386b5afa81724164263c30c48de733e0aab74c [4/18] arm64: dts: meson: add GXLX/S905L/p271 support
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
dtschema version: 2024.6.dev1+g833054f
reproduce: (https://download.01.org/0day-ci/archive/20240607/202406072245.puJljZCe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406072245.puJljZCe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:363.31-774.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:363.31-774.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: /soc/bus@c1100000/adc@8680: failed to match any schema with compatible: ['amlogic,meson-gxlx-saradc', 'amlogic,meson-saradc']
>> arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: /soc/video-codec@c8820000: failed to match any schema with compatible: ['amlogic,gxlx-vdec', 'amlogic,gx-vdec']
   arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson-gxlx-s905l-p271.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
