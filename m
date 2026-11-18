Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794970035;
	b=IviaeliC1WzyskQJcZ95gHtvAHQDQ4V8MrHW8z6NJJbQlmcG5gsdljOhOr8gbRp2M5nx
	 O5ZEW/c/ol4/UyNkxyTSHQ/GUvD0ntjOTbid8V1xNhNopXpYma36kQXwZdC1aZEQG2/3g
	 I9ZUA8pUKOzPwgzVqlXlWqi5BMPcAAcXz7yR+Qt4vd72VWdH4UgAxz9/kCsBdGnjOytqO
	 WF5sg1jgfdhIS+4uZx9CaLFX3le/ReNH0ZUP+YL4BD6NhWOiygZApOwQfPTRYPRfQb1UT
	 zHrK9hCP/Dksk0bYaMfiu35Ql+ncoI3ldHC0GNiDBJAA4zeudRLuUzoSZcExrKSZ6mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794970035;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bewDgXJJMnWpAJPeG9Dg/SFLJ2zbr/y4kuVwErwaDH8=;
	b=zh54Bw+0+q35GY7CGx94FJH4moFwqGJmuJo2F8ksiZ5ciTgj9TfXXZL2+wLKDEPW6Qj6
	 B9vherX9XTqkkaLZSmKdj3cudNUDKnmAITy+yOHOMTO7fRqKCnPFzkFmzaqkTSlfR9VaX
	 3UfRHNNCxX5dOkkkO6O6fmr1GRDJyUF773RRa/fmJ1bz0lKs9Vn9qbc2ZZYd2Iqm339B5
	 xQJpp8ii1tjDQF183Om2PlpvnbNMbzbeZi603/5hpWHqox0+2/H3uu21KIJyNT77a+A2D
	 IoPFuPM0bDU5PUt6iDhFKkwNLXkgf3Mca9riHAkEa0bUl4+qT9F9eSDsuKFJrrBH91w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UcvtTbsy;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EC7F606A31C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Nov 2026 02:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4EC7F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UcvtTbsy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794970033; x=1826506033;
  h=date:from:to:cc:subject:message-id;
  bh=b51Ufcytra+F9I13AN3mngf72IBqGSMMybkNvBJpM3A=;
  b=UcvtTbsy9l0ye5CAYLjG62hvbzARC6ZDaXKkD61dFJJYEtIQFA5YDuND
   qgT8EDY6K8cDgsYjadXiKhfGN72V7DxzjqhkI6WJByKOFwp2brIFyet4j
   5e8O8+lCcFrYIFg+F7uGkoeFr3tF2C96RKmN7AHZWHPXaZ5tcGllxSZOP
   ILCYvd2IldvJkeXBFy2i+xp39GMyrbWxjhQVA+ibM0laSuyLrZpuJkaN9
   jdChMEwNSC0fvQiuCU92W/kqcWIkdnhRw/YJN9ZzKij17pC2hIoUy1eOI
   h7ARWTyfNtmyAmbj6uESeL58VqqEREEA/2nSdTX/tCnvfqCV4Q8WfM5ae
   Q==;
X-CSE-ConnectionGUID: q5CefmPvQ6C+nrthlvF9hw==
X-CSE-MsgGUID: Z8jvRfpoQoexaSDmdtroNw==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3613988"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3613988"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 18:47:13 -0800
X-CSE-ConnectionGUID: xPUOh8kIRrOTKjDxG4/Rbw==
X-CSE-MsgGUID: C2b8dWOASgO9yhm/hEQp/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="9888490"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 17 Nov 2026 18:47:11 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTVhT-000000003Iw-3nPH;
	Wed, 18 Nov 2026 02:47:07 +0000
Date: Wed, 18 Nov 2026 03:46:25 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 318/318]
 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000
 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71,
 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4],
 [0, 85, 4], [0, 140, 4]] is ...
Message-ID: <20261118034510.mhOoBLKp-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   c29a11a6da74fe6ffbc7bc4bbcb21f2e579e814d
commit: c83255f3cf22d13c5b9736668cbe38a098fd6d5a [318/318] arm64: dts: allwinner: a523: Add missing GPIO interrupt
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261118/20261118034510.mhOoBLKp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261118/20261118034510.mhOoBLKp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261118034510.mhOoBLKp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-735.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-735.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-735.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
--
   arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi:107.6-735.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml
>> arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dtb: pinctrl@2000000 (allwinner,sun55i-a523-pinctrl): interrupts: [[0, 67, 4], [0, 69, 4], [0, 71, 4], [0, 73, 4], [0, 75, 4], [0, 77, 4], [0, 79, 4], [0, 81, 4], [0, 83, 4], [0, 85, 4], [0, 140, 4]] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
