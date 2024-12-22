Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5001DFF8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Dec 2024 23:47:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734911231; cv=none; b=WrlPNICMw0TfSv9yaNcWEmK4XwSBPtQM88wUBYqrR2o6IZhx7PsiNgXWjlaJqjTO2bjcj9shRfqyNO2WeRbYDmvJbZIILelIz0ZfNwwjKGmxmcrW2Y4XWaRceIgTBB9yfn0pLsR3E7KwstUpkZlucJJKpherLLlRhe5QcTjK2uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734911231; c=relaxed/simple;
	bh=hFlXGqEwFwBc/SZtSjQvO+ySmK+JGs8tqmfZVPMTKow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F1AlbRhuIQrnzfeEkx//QFvapVAMnuIgzNlTaIfoR83raNbB5xeqnyiaPbGDLn1lLlB42/sNGNoO7JyHa4PRTjIlDr/7MPpxnfHp1MKq5IOqXOl9tnMo7GR2aDoflvOgwX8S9amgbRkUDfwBzt0iVFTpIMv7FGeTzMyoKmHw6FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OqJcEFMu; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OqJcEFMu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734911229; x=1766447229;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hFlXGqEwFwBc/SZtSjQvO+ySmK+JGs8tqmfZVPMTKow=;
  b=OqJcEFMuOUKmsAvoSXBdPvDxJgbJny8xg34Naj1F3CynV7WRJmClnHtI
   2UBaxcPsLT1Zn5c3t0jdiaA3IxbfoXvnX0xxD4cbSZ4W0DCmkxeTCsUEM
   8XdzHlNaLyhsHQVm7u/kYkbwD7FJwu5sS512g7zZOjPSrhjbdm/GZbtpC
   No3Tw+q41c5TOQHPlZyhNKz5UGAkTDC/QcJjnEDJc26s5+GAjJBbxU6jG
   coyCXvDv6fGeXjFdiMv7uUtn5sRCyja1SmEaumL0OMsgrst2rFS3kCWTY
   cU5O7CHWFy6PZ5NBhStI7DO9mk9eYarVm9A6qDX9MV1txNzNlBsaVVqYT
   A==;
X-CSE-ConnectionGUID: XA9A/yLpQGy6ecajwRBgdA==
X-CSE-MsgGUID: tDZHwc/RQF6iAk/KIPfb7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11294"; a="35258923"
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="35258923"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2024 15:47:09 -0800
X-CSE-ConnectionGUID: B/3pPc05QMqOUaz1i//CWg==
X-CSE-MsgGUID: L6s511F0SOqsKi6qKRCFAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,256,1728975600"; 
   d="scan'208";a="129895195"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 22 Dec 2024 15:47:08 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPVf7-0003HL-0f;
	Sun, 22 Dec 2024 23:47:05 +0000
Date: Mon, 23 Dec 2024 07:47:00 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 18819/19518]
 arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: pinctrl@40f04200:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202412230746.i5IZgdww-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   cbdedad12232506c3f28f566960694f41d95acd3
commit: 4981b8a2d9fafa0d8060c83ffb19cd55c6798046 [18819/19518] arm64: dts: ti: k3-j7200: use ti,j7200-padconf compatible
config: arm64-randconfig-053-20241214 (https://download.01.org/0day-ci/archive/20241223/202412230746.i5IZgdww-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241223/202412230746.i5IZgdww-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412230746.i5IZgdww-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi:35.39-40.5: Warning (unit_address_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4080: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j7200-main.dtsi:49.39-53.5: Warning (unit_address_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: pinctrl@40f04200: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,j7200-padconf', 'pinctrl-single'] is too long
   	'ti,j7200-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	'ti,j7200-padconf' is not one of ['ti,am437-padconf', 'ti,am654-padconf', 'ti,dra7-padconf', 'ti,omap2420-padconf', 'ti,omap2430-padconf', 'ti,omap3-padconf', 'ti,omap4-padconf', 'ti,omap5-padconf']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/bus@28380000/pinctrl@40f04200: failed to match any schema with compatible: ['ti,j7200-padconf', 'pinctrl-single']
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: pinctrl@40f04280: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,j7200-padconf', 'pinctrl-single'] is too long
   	'ti,j7200-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	'ti,j7200-padconf' is not one of ['ti,am437-padconf', 'ti,am654-padconf', 'ti,dra7-padconf', 'ti,omap2420-padconf', 'ti,omap2430-padconf', 'ti,omap3-padconf', 'ti,omap4-padconf', 'ti,omap5-padconf']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/bus@28380000/pinctrl@40f04280: failed to match any schema with compatible: ['ti,j7200-padconf', 'pinctrl-single']
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: pinctrl@4301c000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,j7200-padconf', 'pinctrl-single'] is too long
   	'ti,j7200-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	'ti,j7200-padconf' is not one of ['ti,am437-padconf', 'ti,am654-padconf', 'ti,dra7-padconf', 'ti,omap2420-padconf', 'ti,omap2430-padconf', 'ti,omap3-padconf', 'ti,omap4-padconf', 'ti,omap5-padconf']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/bus@28380000/pinctrl@4301c000: failed to match any schema with compatible: ['ti,j7200-padconf', 'pinctrl-single']
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: pinctrl@4301c038: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,j7200-padconf', 'pinctrl-single'] is too long
   	'ti,j7200-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	'ti,j7200-padconf' is not one of ['ti,am437-padconf', 'ti,am654-padconf', 'ti,dra7-padconf', 'ti,omap2420-padconf', 'ti,omap2430-padconf', 'ti,omap3-padconf', 'ti,omap4-padconf', 'ti,omap5-padconf']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/bus@28380000/pinctrl@4301c038: failed to match any schema with compatible: ['ti,j7200-padconf', 'pinctrl-single']
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: pinctrl@4301c068: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,j7200-padconf', 'pinctrl-single'] is too long
   	'ti,j7200-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	'ti,j7200-padconf' is not one of ['ti,am437-padconf', 'ti,am654-padconf', 'ti,dra7-padconf', 'ti,omap2420-padconf', 'ti,omap2430-padconf', 'ti,omap3-padconf', 'ti,omap4-padconf', 'ti,omap5-padconf']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/bus@28380000/pinctrl@4301c068: failed to match any schema with compatible: ['ti,j7200-padconf', 'pinctrl-single']
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: pinctrl@4301c174: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,j7200-padconf', 'pinctrl-single'] is too long
   	'ti,j7200-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	'ti,j7200-padconf' is not one of ['ti,am437-padconf', 'ti,am654-padconf', 'ti,dra7-padconf', 'ti,omap2420-padconf', 'ti,omap2430-padconf', 'ti,omap3-padconf', 'ti,omap4-padconf', 'ti,omap5-padconf']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/bus@28380000/pinctrl@4301c174: failed to match any schema with compatible: ['ti,j7200-padconf', 'pinctrl-single']
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: syscon@47000000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: hbmc-mux: $nodename:0: 'hbmc-mux' does not match '^mux-controller(@.*|-[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/mux/mux-controller.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: pinctrl@104200: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,j7200-padconf', 'pinctrl-single'] is too long
   	'ti,j7200-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	'ti,j7200-padconf' is not one of ['ti,am437-padconf', 'ti,am654-padconf', 'ti,dra7-padconf', 'ti,omap2420-padconf', 'ti,omap2430-padconf', 'ti,omap3-padconf', 'ti,omap4-padconf', 'ti,omap5-padconf']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/pinctrl@104200: failed to match any schema with compatible: ['ti,j7200-padconf', 'pinctrl-single']
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: pinctrl@104280: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,j7200-padconf', 'pinctrl-single'] is too long
   	'ti,j7200-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	'ti,j7200-padconf' is not one of ['ti,am437-padconf', 'ti,am654-padconf', 'ti,dra7-padconf', 'ti,omap2420-padconf', 'ti,omap2430-padconf', 'ti,omap3-padconf', 'ti,omap4-padconf', 'ti,omap5-padconf']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
   arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/pinctrl@104280: failed to match any schema with compatible: ['ti,j7200-padconf', 'pinctrl-single']
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: pinctrl@11c000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,j7200-padconf', 'pinctrl-single'] is too long
   	'ti,j7200-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	'ti,j7200-padconf' is not one of ['ti,am437-padconf', 'ti,am654-padconf', 'ti,dra7-padconf', 'ti,omap2420-padconf', 'ti,omap2430-padconf', 'ti,omap3-padconf', 'ti,omap4-padconf', 'ti,omap5-padconf']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/pinctrl@11c000: failed to match any schema with compatible: ['ti,j7200-padconf', 'pinctrl-single']
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: pinctrl@11c11c: compatible: 'oneOf' conditional failed, one must be fixed:
   	['ti,j7200-padconf', 'pinctrl-single'] is too long
   	'ti,j7200-padconf' is not one of ['pinctrl-single', 'pinconf-single']
   	'ti,j7200-padconf' is not one of ['ti,am437-padconf', 'ti,am654-padconf', 'ti,dra7-padconf', 'ti,omap2420-padconf', 'ti,omap2430-padconf', 'ti,omap3-padconf', 'ti,omap4-padconf', 'ti,omap5-padconf']
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#
>> arch/arm64/boot/dts/ti/k3-j7200-common-proc-board.dtb: /bus@100000/pinctrl@11c11c: failed to match any schema with compatible: ['ti,j7200-padconf', 'pinctrl-single']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
