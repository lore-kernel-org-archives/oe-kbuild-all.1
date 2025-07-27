Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3C41EA80
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Jul 2025 04:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753590902; cv=none; b=pQ+HhjFdi4FAhj78BduGqQbbojGatMUn3o78P8sKPJqCVCnbchvpFGUwzFehVamekHGnZRf5euPjdkiTFwEagoO4+1G8b6sH3zWDMRAXgBI+WO//lX7ak6XGIHAg6CMLv+l/c3exMpfOiavvMYxncQXEEPwMRfmizR6Rw+X5PxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753590902; c=relaxed/simple;
	bh=G71H9glQA+gcSEjmsoN4qpLiJcO2mHWrXo3w/O8T3ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lBUzHL7/9MPRGn+UIEysrOTi1GmLgNPcKQcEkcTL/M8ZXL17nWL0U29wYQjIh9s3l26SmQmRRpYylB97JpgaupxPBxrqnAqh1picz1Gjm0vNe+kqhRd4hwQfb7tPBTgxIeqJHkkczXr6MU84z3kDWxNfyu3KcuO16lpvyUz3Gwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iEEOvAmm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iEEOvAmm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753590901; x=1785126901;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G71H9glQA+gcSEjmsoN4qpLiJcO2mHWrXo3w/O8T3ZY=;
  b=iEEOvAmm0FRizjF7fM/ShY7x0IJj8OeN55YXgnZCccEhzHtW8uDl3Vc4
   1GYwIQaYu1Hns2eDoXGwVrHxyZGmM/nXHf6JRdinMI6vqvC5xYl2IxS3D
   zEcViM8IrCovl3Swdbp+rjUAjzdUrY20AigVEjccPOH528mFFnB4eEY8R
   gSFLrBkF7dcrj0YtylsfiRmgqz6TH7PQWAcscbdPy/XfYV0nwP3EGSVtF
   mZxVY4u/VXKc/H+1EYkbNIbFy2iek2NNURqodV9wBrEWkeZDaQEEOwJvZ
   I1NLxe4EFXgDRa6iv7dFzeGpFuXYiwblmk3YXKioKkNYNlwBp0HNi1P7P
   A==;
X-CSE-ConnectionGUID: 6qEwtW6tTJqMZnS5hJWDfg==
X-CSE-MsgGUID: k3hR0OcpTImiHgEXdfZErA==
X-IronPort-AV: E=McAfee;i="6800,10657,11504"; a="73324782"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="73324782"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2025 21:35:00 -0700
X-CSE-ConnectionGUID: 6AkfX2fMRAij7Aswq5xVdA==
X-CSE-MsgGUID: abAiW891Qsq9UhpISklwhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="192830928"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 26 Jul 2025 21:34:59 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uft69-000MT5-0C;
	Sun, 27 Jul 2025 04:34:57 +0000
Date: Sun, 27 Jul 2025 12:34:10 +0800
From: kernel test robot <lkp@intel.com>
To: Lee Jones <lee@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 12241/12319]
 arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: pmic@2d (ti,tps65911):
 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes:
 '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
Message-ID: <202507271211.hvhQM36m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d7af19298454ed155f5cf67201a70f5cf836c842
commit: 74d46cdd1bf2546772b9a70828cf1c3c84f23f4d [12241/12319] Merge branch 'for-mfd-next' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git
config: arm-randconfig-051-20250725 (https://download.01.org/0day-ci/archive/20250727/202507271211.hvhQM36m-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250727/202507271211.hvhQM36m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507271211.hvhQM36m-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml#
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: hdmi@54280000 (nvidia,tegra30-hdmi): 'nvidia,hpd-gpio' is a required property
   	from schema $id: http://devicetree.org/schemas/display/tegra/nvidia,tegra20-hdmi.yaml#
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: audio-codec@1c (realtek,rt5640): Unevaluated properties are not allowed ('clock-names', 'clocks', 'realtek,ldo1-en-gpios' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: pmic@2d (ti,tps65911): 'pmic-sleep-hog', 'wakeup-source' do not match any of the regexes: '^(vcc(io|[1-7])-supply)$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
>> arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: pmic@2d (ti,tps65911): regulators:vddctrl: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65910.yaml#
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: core-regulator@60 (ti,tps62361): Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/ti,tps62360.yaml#
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']
   arch/arm/boot/dts/nvidia/tegra30-asus-p1801-t.dtb: /bridge: failed to match any schema with compatible: ['mstar,tsumu88adt3-lf-1']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
