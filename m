Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793850262;
	b=rKSLQcH08wyqYPSgWYA1+MkwWSBkvAwFghja+T9tNtgi0z4RjdnYZRxgbUQ5wwcxf6Co
	 lXGFBXOhhEVSk7p0WibQ6jFCfhDoupaPhO8JdQd40vnfKqUAJmtkVDOxfJDmyG6JgkMgC
	 J/zDMqZ5a/UgnfPfs7toA5PDkccCea+f4G8jRh8yIP27hFSBwo8AlG+bYXibWm1dHsBzE
	 7nlyOlOlLHGaWd5Pl7kB54eLcFDYCZL+QKcQD6rgd3pT3vmfmDYVzKXTdZ/5CyJeTIIsV
	 wVIA0dF9vNqHjbdXAHi3MMVJPIWndiCp2JXbGuvBp6xH2Uq/38Ztyi86V1nbUrcOwig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793850262;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WqiHrW3u1/iPrndWRYwsyrHya0VOz/uSVL2KuATA52k=;
	b=z6bJO9ODFq0RsQYuCbw8bVBXLMDld7vBQMZZ0PAAI5I++pPZjRcBmorEeFYd+nJ3aedr
	 hRB3m+/DKQ5eH4cq6t4MqOKoWokG4D+9BDfeLlh7XmmiDyyNLFTFBCVhVObX95kef8uyD
	 yd1Ho5QLV6OzdE3JSH2xAkn7nT1DWIM5zCcovR2nLggRz0D7kgo3Hrg8b8EyHqoFN+U/h
	 DUKAJJsno+ANQfUKAdi6JTvSL7EkbtTwyMio1875NpY8IBCLRY1pDnqaO+naTDDVmw0PA
	 eY1L1CQg51tTxSp8JnGSE2KrhBcSSfNbHDWeeb9HL4MlqsQgQEtee6RqT9F219WuQlw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZKrjvofc;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80507606A328
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 03:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80507606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZKrjvofc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793850261; x=1825386261;
  h=date:from:to:cc:subject:message-id;
  bh=ylKlBwVd6lAaX18/p8JZngtXi6JJAhNujNphoDOAeI0=;
  b=ZKrjvofceh8EUY4woVHNGaiuim6HJTHMAbZSH4dVtUlyxKCLIMHsfqEu
   J76Znh1VNSvZ43H5cOY0StZegUC2ARjOPHk+VwvDCbDxLTjZn5XiByiuT
   Csvxryf5iyJuFn8OzGPMIHNd3aAbjp2eW4wsNtXdKn2HlDRMjdl8CLj6k
   dgtr3gTDZr1E2wgED93OupCojeWZAJq0KgYj4TN9+stnlaa3n3kCx58Xx
   igjHe0j6xMm0bOTtkhoa/PMcqTLllxbPTLoBUSZmDlroWn9cQzR8eHUNS
   nBqgDcjwXkzF3imiN19urDZVrWT0pHuNaCnZG0Azj/dAdkl6XoeNAHmAq
   w==;
X-CSE-ConnectionGUID: rgTjsQ/yS6uZYgGvSz5kSw==
X-CSE-MsgGUID: NSTk5BSWTLKf1k7CkRvh1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2525917"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2525917"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 19:44:20 -0800
X-CSE-ConnectionGUID: SxSKTDo7SiC7Ut0x77zx0A==
X-CSE-MsgGUID: 21LB72DnRzKOLp3+DgjotQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7300744"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 04 Nov 2026 19:44:19 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOoOe-000000009Ud-3OgF;
	Thu, 05 Nov 2026 03:44:16 +0000
Date: Thu, 05 Nov 2026 04:43:16 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-wireless-next-main 32/32]
 arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: i2c-gpio-touchkey
 (i2c-gpio): $nodename:0: 'i2c-gpio-touchkey' does not match
 '^i2c(@.+|-[a-z0-9]+)?$'
Message-ID: <202611050454.85FsLtIo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common upstream-wireless-next-main
head:   b8e5b0ae8ff47240366d38e5d12c65f878724316
commit: 346e9112f3dab91a5cf3100a99ec256ff0b7f0fe [32/32] ARM: dts: qcom: msm8960: expressatt: Add coreriver,tc360-touchkey
config: arm-randconfig-2055-20260908 (https://download.01.org/0day-ci/archive/20261105/202611050454.85FsLtIo-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
dtschema: 2026.10.dev5+gd1fbcafd6
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050454.85FsLtIo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 346e9112f3da ("ARM: dts: qcom: msm8960: expressatt: Add coreriver,tc360-touchkey")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050454.85FsLtIo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:0: 'iface' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
   arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: usb@12500000 (qcom,ci-hdrc): clock-names:1: 'core' was expected
   	from schema $id: http://devicetree.org/schemas/usb/ci-hdrc-usb2.yaml
>> arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: i2c-gpio-touchkey (i2c-gpio): $nodename:0: 'i2c-gpio-touchkey' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml
>> arch/arm/boot/dts/qcom/qcom-msm8960-samsung-expressatt.dtb: i2c-gpio-touchkey (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'touchkey@20' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
