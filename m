Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794133744;
	b=P7pA80Cd9n6O27LJagv5bpRkQ2bxDLwehCHORyR2aC93xK7vcPfO6mdXfGbf/oXwyIY4
	 rNHC8oq/Li8wr3Ijvwj1vxhrdlU643Lhm5fsHwtwv00w8xDIGRCjMVbEV1621e7fwVsrn
	 c4m9ldm1F4mNrult4sQ/fzDqm831UDjhEVZKFQZH8LOt4lN6LsJSXx68k3xV0z6ZCO3GT
	 iVc8smr7pGn7O0DX1uBjMBiAHR3yTr4l2/d/yQN6KyUcu0Tsxfm4dIqEygnyVp3cjiQ9S
	 BqnyAJ23TJ5A2gZSxO4r48i3JbVVsTVLaduq7oT/MDy0DYITbqTBUB+lgS6iAALERjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794133744;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=ps7MkOQnZI3zZe9CsA3g0VqKn1scwkIaPq5Bo0EKcq8=;
	b=T1fO/owBzHVZc+QfIJaSmNubZ1NO6vaU6+FOsCEDNJBGJH1tob6SwbDhkP7oHAiNrUz0
	 pbGQ1liU+9+TxzqS9FBCpT4Y/VaVm1HE+hXPH2r4kL81F+b0SdVrGz0AvgwioSlXc8STh
	 h8VOYRSGb1eRlK1fNovYLXtiNIR+HUIYfIm02SXRM1ARogxSadFCqK/GKNlGV97OHuhBn
	 As480GaIZh1A+YPu5ZA/5wMbtMYXoLUI3Dg4X0hCr1TBlXPXwX4fILMTgbZ6+ugG8ke++
	 1BOewpYtv7EaWH/puuzDmSaoql25U9e04x1Ehmm88HnMJRya85Ce8SAAGg/dU34vucQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fw+G9vQx;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FC6606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 10:28:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17FC6606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fw+G9vQx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794133741; x=1825669741;
  h=date:from:to:cc:subject:message-id;
  bh=axAH2i9RjWh7kmrjuHUed/AgY2qY8hhvA81LEA+2O0E=;
  b=Fw+G9vQxJDaqwjdsR0S8YYN2balQcHRr/F28mOeTLDBfo6JuE8SbpzUq
   WW9oHAHX5CzwOMBECZEyZJBfjuH6xKfRylH5K4iA7CWh787GNOleLMPkE
   BVYly3i3OzxWsMcsHhy//IbRFVmUV4zoNpnb7sy7WdFy+jyq6lFqon1F6
   i6+QVvpE84x+QFojjUJwTnRVy3O5HV6ng6awI5EPZbbWiUGF3O5DWbGwA
   MCdgzjo/9JmTP+KZ4zrJWEeKOHRS+sSiEqW46Oiwp++xPZCd8WAuTv6ul
   npK8WiqrL4lLwHQolF+OepvL1y7X5He91A+nImjDsM1zAUpgSB5O0GJCE
   Q==;
X-CSE-ConnectionGUID: YbHCTK5CTsCHD0pFJtp4gw==
X-CSE-MsgGUID: IZnIEIIfQmGe+WxdXZbfxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11959"; a="2752930"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2752930"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 02:29:00 -0800
X-CSE-ConnectionGUID: wd/VRXIeQP+05mTtva55Vw==
X-CSE-MsgGUID: lEGRR0lVQfifIoeNXHAkWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="8208208"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 08 Nov 2026 02:28:57 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ08t-00000000BPh-3NQn;
	Sun, 08 Nov 2026 10:28:55 +0000
Date: Sun, 08 Nov 2026 11:28:53 +0100
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.4-rc 127/154]
 arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pwm-fan
 (pwm-fan): '#thermal-sensor-cells' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202611081123.jgz1yP74-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/frank-w/BPI-R2-4.14 7.4-rc
head:   674a64f97be4d25967f31216ffe7eaefdabf827f
commit: a524d78d5441de9e0a77f292678af66d8cea02f4 [127/154] clk: mediatek: add clock driver for mt7987 from sdk
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261108/202611081123.jgz1yP74-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081123.jgz1yP74-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081123.jgz1yP74-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clksys/syscon@10060000: failed to match any schema with compatible: ['mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clksys/syscon@10060000: failed to match any schema with compatible: ['mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys0', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clksys/syscon@10060000/pcs: failed to match any schema with compatible: ['mediatek,mt7987-sgmii']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clksys/syscon@10070000: failed to match any schema with compatible: ['mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clksys/syscon@10070000: failed to match any schema with compatible: ['mediatek,mt7987-sgmiisys', 'mediatek,mt7987-sgmiisys1', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clksys/syscon@10070000/pcs: failed to match any schema with compatible: ['mediatek,mt7987-sgmii']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clksys/mcusys@10400000: failed to match any schema with compatible: ['mediatek,mt7987-mcusys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clksys/syscon@15000000: failed to match any schema with compatible: ['mediatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clksys/syscon@15000000: failed to match any schema with compatible: ['mediatek,mt7987-ethdma', 'mediatek,mt7987-ethsys', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc_clksys/syscon@15000000/reset-controller: failed to match any schema with compatible: ['ti,syscon-reset']
>> arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: pwm-fan (pwm-fan): '#thermal-sensor-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /reserved-memory/wmcpu-reserved@50000000: failed to match any schema with compatible: ['mediatek,wmcpu-reserved']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc (simple-bus): wed: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: soc (simple-bus): trng@1020f000: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/hwver@8000000: failed to match any schema with compatible: ['mediatek,hwver', 'syscon']
   arch/arm64/boot/dts/mediatek/mt7987a-bananapi-bpi-r4-lite.dtb: /soc/infra_bus_prot@1000310c: failed to match any schema with compatible: ['mediatek,infracfg_ao_bus_hang_prot']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
