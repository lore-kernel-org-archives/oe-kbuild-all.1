Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 557F02AF0B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Dec 2024 04:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733200834; cv=none; b=cPMRFmlDI3F+FOlB0BoON6rXgTqRjt82hCD85yJIYlMO40fvHUvPjt5rd90y+RxHYjh9MExNZDsSsq/Rq7B7kgU1C3gWCoqURMF97/JzQvbXDBh71kaiaMu7djWdT5bIYld4+/CbrvU0+soWYQYCl0EAwUSdql6RZbpINi81c9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733200834; c=relaxed/simple;
	bh=qXaZOqZAX41HmboO1A0arabg58JEe4k0kOy7iH7SWB8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wo+O9i7zoNUBO/tKG1hFLLWQfMKEJZMpvruPUzrgjDC4pccoO8zTV8aV17c1+bCnGMNaCiCZ7cGHUWzRxpg+KmQJFcYkoNhy5Tka961PM/L2W2uSlYnX8duX3NQIOk3pDeHFiwuPl0MJ5x56OdvXb7BU5kwLveXLMkJsVi/46zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEwHWv5f; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEwHWv5f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733200833; x=1764736833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qXaZOqZAX41HmboO1A0arabg58JEe4k0kOy7iH7SWB8=;
  b=BEwHWv5fa3r8T3WdKahyp6Mla3YVjJ4UScde+el8mU0nQPEobj2uw/Sw
   DUje+baoJplijwpeZfKvr3WHvWviAEDCBKJXIoWr2xxcYjmRfWpNosLMF
   O07GRN4pVem4KERm4rw4JgBi1VE2593pvov3W2zSKkMONjbCc2wfeofCP
   d5TDg5ztga4tmsfUp+mOts+lZ7Xq8Sy/VysNyuo249HA2slfJc81+iIED
   mE88MrRZKp2vtY7jrJBQTsLAWDdds0yvwE5PClvvi96ElJbHItimVd4S5
   Des7DUoUGiI388cxDol7SU+XA2X8XwI1YZeGL9nZ6zkqKRb8IwGy7R9q1
   Q==;
X-CSE-ConnectionGUID: a8jSGLnETYS8BCKxGOigOw==
X-CSE-MsgGUID: 1B5RkCAjRnqvis9kb4E6Yg==
X-IronPort-AV: E=McAfee;i="6700,10204,11274"; a="37172482"
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="37172482"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 20:40:32 -0800
X-CSE-ConnectionGUID: kWu2Bss6Q+Wxo65qoyFVAQ==
X-CSE-MsgGUID: VpeSe1ooRby/Ui0jMkvQFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,204,1728975600"; 
   d="scan'208";a="124150346"
Received: from lkp-server01.sh.intel.com (HELO 388c121a226b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 02 Dec 2024 20:40:30 -0800
Received: from kbuild by 388c121a226b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tIKi4-00007P-0r;
	Tue, 03 Dec 2024 04:40:28 +0000
Date: Tue, 3 Dec 2024 12:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:chromeos-6.6-ea7682dbe6cf 104/520]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb:
 regulators: vrf18: Unevaluated properties are not allowed ('compatible' was
 unexpected)
Message-ID: <202412031210.fAnHUkBi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common chromeos-6.6-ea7682dbe6cf
head:   ac7a77c24fbce62cf3a673f994358d50cb59808a
commit: f99ae53d82d287e60e236395ffa09d77106292fc [104/520] CHROMIUM: arm64: dts: mediatek: mt8186: support early corsola devices
config: arm64-randconfig-051-20241116 (https://download.01.org/0day-ci/archive/20241203/202412031210.fAnHUkBi-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241203/202412031210.fAnHUkBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412031210.fAnHUkBi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,elm' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-rev0-sku196609', 'google,steelix-rev0-sku196608', 'google,steelix-rev1-sku196609', 'google,steelix-rev1-sku196608', 'google,steelix-rev0', 'google,steelix-rev1', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /: failed to match any schema with compatible: ['google,steelix-rev0-sku196609', 'google,steelix-rev0-sku196608', 'google,steelix-rev1-sku196609', 'google,steelix-rev1-sku196608', 'google,steelix-rev0', 'google,steelix-rev1', 'google,steelix', 'mediatek,mt8186']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: soc: thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic: failed to match any schema with compatible: ['mediatek,mt6366', 'mediatek,mt6358']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/codec: failed to match any schema with compatible: ['mediatek,mt6366-sound', 'mediatek,mt6358-sound']
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: regulators: vrf18: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/regulator/mediatek,mt6358-regulator.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/pwrap@1000d000/pmic/rtc: failed to match any schema with compatible: ['mediatek,mt6366-rtc', 'mediatek,mt6358-rtc']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/timer@10017000: failed to match any schema with compatible: ['mediatek,mt8186-timer', 'mediatek,mt6765-timer']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: dp-bridge@5c: '#sound-dai-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/display/bridge/ite,it6505.yaml#
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: /soc/thermal-sensor@1100b000: failed to match any schema with compatible: ['mediatek,mt8186-lvts']
   arch/arm64/boot/dts/mediatek/mt8186-corsola-rusty-rev0-sku196608.dtb: ec@0: typec:connector@0:ports: 'port@0' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/google,cros-ec.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
