Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17767247280
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 03:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765423421; cv=none; b=tI+lMCvWNKDjCE6zUVVnQwJvQfrNqvc6zKbPo3a04IaU3DFwEF511qOK0+RXsQvZ4jYogNc4jpRheMskoWE7buN6ZwExMxPpCpFdkTG/ajh3z+0EbtX+6rJtwXLPEgascUhOYbrpDO84RaglUFqBLRqOVLMrxOT8HDF6Iy+grQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765423421; c=relaxed/simple;
	bh=Wy+6U+t5d5b1s5dGAnb9n/BEosI+Kz5jnkdTMZitbSs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m5HUoap0nRM6UsFwrpPtu3Dbv5sjrI/uaw57oITeq3UST9+Exl/LWW6dBy950387K9sMLIpEIoJSM54Dn1MeyRQlvArT5I4YxC2x5YK5NWWM2I5lOyvV7bYNgDr2HCA/Euwl59LAifIbr/GdTKjFQ62ghO5y6qCEbTlTkAfCu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Be4iVSZn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Be4iVSZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765423421; x=1796959421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Wy+6U+t5d5b1s5dGAnb9n/BEosI+Kz5jnkdTMZitbSs=;
  b=Be4iVSZnLDI2FCKlMSrtM55fEv6oOEEpUMJ/AHLbaH4P5pS3wM5zEWz/
   vAtapBTYZI4pR+JiEMvAkZz7hqG1g1o4W6rbbJwx3onYoLmZOSrSANAI0
   1mTLP4LLpMWNtlOfjaXzECb2MzHBxQy7jcbov+VY1zRq9MZQZ/iIRb8cM
   GuXoJbg9k2TRRtR6RgGf32cObMXr22PiN9ptAXmq5kgoSau2GuxgnDBrE
   tiV4ixTfurVRTYfS3RcurS7Q/jsQ5b2cVcuUCdEblvKg8+txxWG1+EuOv
   b9fiNOliQomgr8GVCHnJvwSLDzm+UknuVz0X4M/jrGex9MFw4Cwkd0hcC
   A==;
X-CSE-ConnectionGUID: FU/szNfdS+e3XdzJcbiZJg==
X-CSE-MsgGUID: L+FtwY3FT2+OTmNkPFNggQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="90048673"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="90048673"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:23:40 -0800
X-CSE-ConnectionGUID: kDk5wK15RS6ymY7T6DTrAg==
X-CSE-MsgGUID: Cqo5SbyjQDW2UH81rnJsAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196692403"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 19:23:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXHD-000000000tW-3WTh;
	Thu, 11 Dec 2025 03:23:35 +0000
Date: Thu, 11 Dec 2025 04:23:05 +0100
From: kernel test robot <lkp@intel.com>
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [linux-next:master 819/14200]
 arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: da9211@68 (dlg,da9211): 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202512110447.7G98UHjs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   008d3547aae5bc86fac3eda317489169c3fda112
commit: 6277a486a7faaa6c87f4bf1d59a2de233a093248 [819/14200] regulator: dt-bindings: Convert Dialog DA9211 Regulators to DT schema
config: arm64-randconfig-2051-20251210 (https://download.01.org/0day-ci/archive/20251211/202512110447.7G98UHjs-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512110447.7G98UHjs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110447.7G98UHjs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: pinctrl@1000b000 (mediatek,mt8173-pinctrl): 'i2c0', 'i2c1', 'i2c2', 'i2c3', 'i2c4', 'i2c6', 'mmc0', 'mmc0default', 'mmc1', 'mmc1default', 'spi0', 'usb_iddig_pull_down', 'usb_iddig_pull_up', 'xxx' do not match any of the regexes: '^pinctrl-[0-9]+$', 'pins$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/mediatek,mt65xx-pinctrl.yaml
>> arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: da9211@68 (dlg,da9211): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/dlg,da9211.yaml
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: syscon@14000000 (mediatek,mt8173-mmsys): 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/mediatek/mediatek,mmsys.yaml
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14001000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma', 'mediatek,mt8173-mdp']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rdma@14002000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rdma']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rsz@14003000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']
   arch/arm64/boot/dts/mediatek/mt8173-evb.dtb: /soc/rsz@14004000: failed to match any schema with compatible: ['mediatek,mt8173-mdp-rsz']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
