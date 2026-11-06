Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793977413;
	b=KgvmeVfkUXyiz/OSK9Uw1ilxMzaDzUKI4qeevzIraEIAis5shIgweT8dLDrf6pdazn9I
	 eae1keGE+bqwyoBp0equM3iSiL2Ovaq7V1VEtedJFogNQZg3twJLsEkID+XOnYBRjYgPP
	 SUj1jTN6v8cvaLDrGt+QT6/zkBhW3ImwMzUeAaxjZNyOUbTt+TChGBk8C6b8hSOMRm8MG
	 fCQanNOnnfugHEjjPDtc+RlnKkDt9KJXRjYD+Na8K9Mdd7qgdmYdLO/0/tFJ+AvOQsy/h
	 Ii+T+L1fODugocqSZMAlrarXI1IYGqn2lSjIKW+EMym8E92+hVDMYqh11Wd6YsxHYSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793977413;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=roDJ2kCMm043SkfVvpF6EIQLq0kDZM1u4/8rAyBC04c=;
	b=F2MAzhYBic3Y6nY4+vLmmtd86rOwdakBePLCJGPWZNifCeFSKdxeWuzaGnF14vTjms4E
	 nkVkoH5Jwo2BIpmZ8KTtweHbL1K5WQHlz6p4cXQttLnSePP4zHUjDJWNuItHrf+myfgL7
	 v6ngUDvJ+FFcnsE9s6ep7s7pYNlEozyLcePLwsggMCvQTL5HtMzndgVAEXf9fWJInLlV/
	 yG3EjXO8/Vh0A7jaTSIYf2BWzjq7hh0VSPFlnpdxh59r1nnwA6fEC1YSFwCUI8oBxMqX3
	 wI8S1OksdRGcwD94X6qcAJ5kksd1KvEs97U+SXiYbEDIw8wbRdA7KmcO1acKyD3pjNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kD2z1Ovn;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA92606D827
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 15:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDA92606D827
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kD2z1Ovn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793977412; x=1825513412;
  h=date:from:to:cc:subject:message-id;
  bh=Q0XKChgDF9FD992ltHHLoIJA3EHv5FY4bi+0rQAjMww=;
  b=kD2z1OvnlGvn7j1YUhV+WwW04K8GgcxVEKXyN4CcXECS3uPl5yaWzZtW
   RtGcn4akRGRwbcJULXZdSAFKBz2pg2MLLUavw8ThHC/YKRouDW1UPfAlh
   2lUBIHYkdxIf6f1lbr2S3ET71SGzZDwMIv59oZXSNtfANAz26RcDDRzcA
   m1MUIuOc/rO16kZWwalVLP2FNj/IHEbFv83iNvhrUbw2vm6oKz/jDgvtQ
   CbYOAuOjsilUe8MqhPyltcWe/Y18QS7L+5yMTC9xX0J/312eDXdISVPoA
   Sj7AimE8hU+eSomJOUaLypgS125YP/A7KOOq9vqE4rc/+YjeI72NCqFUR
   g==;
X-CSE-ConnectionGUID: YizuT4jeTEK7cvCkT9hVDQ==
X-CSE-MsgGUID: x1GrOMHZQwO7vWS8GxseMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2691864"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2691864"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 07:03:31 -0800
X-CSE-ConnectionGUID: HLIfKmTWQHmSDnyStfMU4g==
X-CSE-MsgGUID: kwGl4RvKS+W8/hxcfIzYBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7350158"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 06 Nov 2026 07:03:28 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPLTR-00000000AIJ-0OyK;
	Fri, 06 Nov 2026 15:03:25 +0000
Date: Fri, 06 Nov 2026 16:02:49 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>,
 Ivan Vecera <ivecera@redhat.com>, Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 3512/4145]
 arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dtb: timer@40250000
 (st,stm32mp25-timers): 'timer@14' does not match any of the regexes:
 '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
Message-ID: <202611061647.GjBNA8uI-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Rob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ddfe51b0a0f5dc9e415cc2c8ad8db17532dd426b
commit: 17c58242988d2b4363fe9d506d387d7d13d50842 [3512/4145] dt-bindings: Use hex unit address patterns
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261106/202611061647.GjBNA8uI-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061647.GjBNA8uI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061647.GjBNA8uI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dtb: timer@40270000 (st,stm32mp25-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp25xx-dhcos-bb.dtb: timer@40320000 (st,stm32mp25-timers): 'timer@19' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dtb: timer@40270000 (st,stm32mp25-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc.dtb: timer@40320000 (st,stm32mp25-timers): 'timer@19' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dtb: timer@40270000 (st,stm32mp25-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm.dtb: timer@40320000 (st,stm32mp25-timers): 'timer@19' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: timer@40270000 (st,stm32mp25-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257f-dk.dtb: timer@40320000 (st,stm32mp25-timers): 'timer@19' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@40270000 (st,stm32mp25-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257f-ev1.dtb: timer@40320000 (st,stm32mp25-timers): 'timer@19' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtb: timer@40270000 (st,stm32mp25-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp255c-dhcos-dhsbc-overlay-imx219-x10.dtb: timer@40320000 (st,stm32mp25-timers): 'timer@19' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb: timer@40270000 (st,stm32mp25-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-am-1280800w8tzqw-t00h.dtb: timer@40320000 (st,stm32mp25-timers): 'timer@19' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
--
>> arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb: timer@40250000 (st,stm32mp25-timers): 'timer@14' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb: timer@40260000 (st,stm32mp25-timers): 'timer@15' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb: timer@40270000 (st,stm32mp25-timers): 'timer@16' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml
   arch/arm64/boot/dts/st/stm32mp257d-engicam-microgea-rmm-overlay-rk050hr345-ct106a.dtb: timer@40320000 (st,stm32mp25-timers): 'timer@19' does not match any of the regexes: '^pinctrl-[0-9]+$', '^timer@([0-9a-f]|1[0-3])$'
   	from schema $id: http://devicetree.org/schemas/mfd/st,stm32-timers.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
