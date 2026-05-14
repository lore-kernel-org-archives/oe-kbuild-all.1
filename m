Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 546462C1594
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 May 2026 14:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778770443; cv=none; b=QbYoWthTsW5XqEckWCNdWcunWw6necQTKtg0g8TaMqQ3vhZrbf71okKjX+aFMyR6XZdMZgUzGKsm5CWk2Ttn2usWL0hmJlMj3TsVfpxzMh/ky9OMIGwXCA1CZWHvlcEMEJpguHpNXk0VHg3W842/w+V4uZzpvi4c2wIfZMxPb2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778770443; c=relaxed/simple;
	bh=vvXUiUfkUMmS8qxPKfLbJo0SFdGzmm1Wpb4fnkmYdlM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=YDx3YrERpAJRgRFM9lR2Mwx8nNWxh1yKo5W85kD1Or0R3VPugps+rqPKwneqC+UZPL+2/jp5bCnRXtbt2k07ET5q9Hc0WabKnw+4K1HGijAV1+kTmNRFHLSAWcYEPWAWQzUTfB7json4ia/7tOZmn1i8ZNmNXSNxxY+J5Um+Wic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eGgfYhP7; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eGgfYhP7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778770441; x=1810306441;
  h=date:from:to:cc:subject:message-id;
  bh=vvXUiUfkUMmS8qxPKfLbJo0SFdGzmm1Wpb4fnkmYdlM=;
  b=eGgfYhP7KQjKJH53nqZcs/UByECP1pXOXixM9rYX5OPYibXF0HEMqHfN
   m+5LxeAFRFMKghQfYVpRTvb/HroQLvy9CYoxSutFTnZMUIo85wPuxjeOg
   plcPI8YAOxQTcpsS6uigvUohVYNV9BuXXy+0mxm5eCVV9QXlYLP0Y6eRE
   2hejUsdnbrjoRgLAbCO7RonfcTzO+vB/EVEJkS+QNskZ7+oKIb4SxjEP8
   q/pmA8MXrc/z6nIsHNHuA/3f6nj6NW2Dy8TK4ODo9butB3DYolqhxjQSu
   ojAx6pQmmEDZlvlNNH7xtH5l1aG5yFr1mIgiwtkCTveCGJlmN6RabidMD
   A==;
X-CSE-ConnectionGUID: 3dMJdtzlSpGwZtUIaFdQdA==
X-CSE-MsgGUID: zRZ3Ho9hRTG5MrI2BnsaMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="91098310"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="91098310"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 07:54:00 -0700
X-CSE-ConnectionGUID: AnkfC9g4RRWye7NSdop1sQ==
X-CSE-MsgGUID: nP/544UwTJuzGFP9qaPLqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="237539570"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 14 May 2026 07:53:59 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNXRk-000000008p3-2KqD;
	Thu, 14 May 2026 14:53:56 +0000
Date: Thu, 14 May 2026 16:53:27 +0200
From: kernel test robot <lkp@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
 "Rob Herring (Arm)" <robh@kernel.org>
Subject: [linux-next:master 2643/4394]
 arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb:
 external-memory-controller@7001b000 (nvidia,tegra132-emc): compatible:0:
 'nvidia,tegra132-emc' is not one of ['nvidia,tegra114-emc',
 'nvidia,tegra124-emc']
Message-ID: <202605141604.vbYFAEJo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   e98d21c170b01ddef366f023bbfcf6b31509fa83
commit: a4f97f9467661602bd6bf614bcee884502794d43 [2643/4394] dt-bindings: memory: Document Tegra114 External Memory Controller
config: arm64-randconfig-2055-20260514 (https://download.01.org/0day-ci/archive/20260514/202605141604.vbYFAEJo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260514/202605141604.vbYFAEJo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605141604.vbYFAEJo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /pcie@1003000: failed to match any schema with compatible: ['nvidia,tegra124-pcie']
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /i2c@7000d000/pmic@40: failed to match any schema with compatible: ['ams,as3722']
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra132-mc']
>> arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: external-memory-controller@7001b000 (nvidia,tegra132-emc): compatible:0: 'nvidia,tegra132-emc' is not one of ['nvidia,tegra114-emc', 'nvidia,tegra124-emc']
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: external-memory-controller@7001b000 (nvidia,tegra132-emc): compatible: ['nvidia,tegra132-emc', 'nvidia,tegra124-emc'] is too long
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-emc.yaml
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /external-memory-controller@7001b000: failed to match any schema with compatible: ['nvidia,tegra132-emc', 'nvidia,tegra124-emc']
   arch/arm64/boot/dts/nvidia/tegra132-norrin.dtb: /ahub@70300000: failed to match any schema with compatible: ['nvidia,tegra124-ahub']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
