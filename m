Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49E583242BA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 17:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780592586; cv=none; b=X9puk3YBJV03/vAH7n4XanwWrj+CVcTp/QWxOFt7h0FoE6MNqQ9jI4NthMOgavF2+8G0B4BA/mkPwwcdWkqOmr/Ek1psf8HcDDa8gVRGei7wSOsnhAMJhFZJG5toXEE+a7/Y/2cmwijL4H+gD5NcQi7FQL6liGwg0e8EInS0t9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780592586; c=relaxed/simple;
	bh=l20v8rSWdcg+pFBarDZqL8SpzpgFzu+Eh17Aub0WWNM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=iWdQGn1myCJHf//GYuzpPjJfuJSyEsC3EHmFOVV6F7P/tgKBtpR2HPOKY1hsPEIQ5CAYc2uzPORvcJiOcSq/CqoK+/8tIgDr96ZW7UX02qVGauiyLPV5va5rcf6cxt8szI17y5f1tMcTscI63FIXW5IEZq0/fqCA0dyJqgLoWRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAWjsz+/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAWjsz+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780592585; x=1812128585;
  h=date:from:to:cc:subject:message-id;
  bh=l20v8rSWdcg+pFBarDZqL8SpzpgFzu+Eh17Aub0WWNM=;
  b=EAWjsz+/4RfjBAcTVs4P4T5XUQ/WfPwx1kbl1Nyruy39UwxCBMAroOW4
   n1RAWnoIkl6iuunDa4aR8gKTKGJ+hQ5MOuz2BivdId//jPHwDJUQnYd8k
   s5GYA+lphd5kVJISw1DXQAS3xbIf/Snk6JgZKi527H/dhqMUW1cuo/GC4
   23gJDwFIEQYzL3A1Rptp7ngoPi7b+tgEirK8DH3IA1ZUaB6pBfEE7sfl0
   dgR595wEl+yVy56o8rZnbFdcIGaGMsHYGpECtq3rl5KpbP7qD6UGQPOoX
   vxDIVRh1sIXs1pyv9aGKX07u+kEisj2av6nxwIBbpmFQLTtegE+3Ljas+
   g==;
X-CSE-ConnectionGUID: JOTIZHL7TDCK/vquwo3U7w==
X-CSE-MsgGUID: L81n64OXRBi4eKOZ/63LAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="98997185"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="98997185"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 10:03:04 -0700
X-CSE-ConnectionGUID: ujrHosJHQwShdVuZR+E0JQ==
X-CSE-MsgGUID: kmNZhp99T6Ww65xOrduorw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="244708948"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 04 Jun 2026 10:03:03 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVBT9-000000002MX-3XxM;
	Thu, 04 Jun 2026 17:02:59 +0000
Date: Thu, 04 Jun 2026 19:02:15 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Thierry Reding <treding@nvidia.com>
Subject: [linux-next:master 8422/10715]
 arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb:
 front-camera@48 (aptina,mi1040): 'orientation' does not match any of the
 regexes: '^pinctrl-[0-9]+$'
Message-ID: <202606041953.rMXFx1cc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a225caacc36546a09586e3ece36c0313146e7da9
commit: a5acde8adb4d4d921a004b8df995d50255253afa [8422/10715] ARM: tegra: grouper: Add support for front camera
config: arm-randconfig-2051-20260531 (https://download.01.org/0day-ci/archive/20260604/202606041953.rMXFx1cc-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260604/202606041953.rMXFx1cc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606041953.rMXFx1cc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: pmic@3c (maxim,max77663): regulators:sd0: Unevaluated properties are not allowed ('nvidia,tegra-cpu-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: pmic@3c (maxim,max77663): regulators:sd1: Unevaluated properties are not allowed ('nvidia,tegra-core-regulator' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77620.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: audio-codec@1c (realtek,rt5640): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /pcie@3000: failed to match any schema with compatible: ['nvidia,tegra30-pcie']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /gmi@70009000: failed to match any schema with compatible: ['nvidia,tegra30-gmi']
>> arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: front-camera@48 (aptina,mi1040): 'orientation' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/media/i2c/onnn,mt9m114.yaml
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra30-kbc', 'nvidia,tegra20-kbc']
   arch/arm/boot/dts/nvidia/tegra30-asus-nexus7-grouper-E1565.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra30-ahub']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
