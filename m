Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F84D277CAB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Nov 2025 04:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763611672; cv=none; b=ORyjKNBRGllQsFg8GvK/hkrLO+C8HDj6RJYxDiTaIbX/AvKMeSC1Mvi1+G05nqPpQ+IpwpYfYQi2EuYCc6XtvfCWcCeU5/KgbucbTdZSvZ0qSql8BzYIkM806N/lolGY8g6tbeVZHj8dvMtIiVEjxw0bqw96DC4rlMY8ZFfZwHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763611672; c=relaxed/simple;
	bh=1n9N+VmWchBBcvyrGlqe3PBayS80EaT9Pl3Ll33hFqY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ol0wm7gWUuSUj3ZC+rXiMnhM7DMGGwJK8itX5qxruE2IDOCLTVaspvhz96QNHUcq81k4YVd9ScEa02P5PUcd7zydrwMuPP45yPXYX5JnNSPJP7gFRueH7WRIm2wOL5dwp/qoiUmiU9IIvZkIEWsclPgf8qyu0vw8wzbdSWG5k40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JZv4R3L9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JZv4R3L9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763611670; x=1795147670;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1n9N+VmWchBBcvyrGlqe3PBayS80EaT9Pl3Ll33hFqY=;
  b=JZv4R3L9/IaxHUAfqgOLagrx3pU4aVw06KbkSew10ml3XvLjO1xBaw9v
   PIWtBsiq8eWef0dNVwQCZyIPAyLIRLBTynmz00JCcw2c7MzfDe1KgpjtZ
   P8gkg56raKsjMpxgyrB+xCaqN/ESfYLp3znQEuicG7D4QYvehfItOsvoO
   Os27ag2rd7cCH5LXbytWmbv2LA1h3MN2WfR+b+U1jpNHgy/Mv6E4kFXPD
   a322qav4v+4n6lm8UpGJUvrNXWcGOpn8MRNDex0QHd0lMDTt+cNAkfIwS
   EvBCroqE64VQlhGqNqayQ6oEDcAwpLm/hBVGKh6pwknvHklFI+t8MvCon
   w==;
X-CSE-ConnectionGUID: oqIvTDGET1KcUAxhOU1uWg==
X-CSE-MsgGUID: fAfsoLLORU68LM8mWYzfhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="69537050"
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="69537050"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 20:07:49 -0800
X-CSE-ConnectionGUID: 6POQgReiREiHVZERdhClMA==
X-CSE-MsgGUID: uNbEN78UQwm4WfvjaQGuWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,317,1754982000"; 
   d="scan'208";a="191045523"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 19 Nov 2025 20:07:48 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vLvxS-000000001OV-19tn;
	Thu, 20 Nov 2025 04:07:46 +0000
Date: Thu, 20 Nov 2025 05:07:03 +0100
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [linux-next:master 8321/10183]
 arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: wdt@28330000
 (toshiba,visconti-wdt): $nodename:0: 'wdt@28330000' does not match
 '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
Message-ID: <202511200547.iQcGzYhF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   fe4d0dea039f2befb93f27569593ec209843b0f5
commit: 017bca91639f01302382013033b685ec8759aba4 [8321/10183] dt-bindings: watchdog: Allow node names named 'pmic'
config: arm64-randconfig-2052-20251119 (https://download.01.org/0day-ci/archive/20251120/202511200547.iQcGzYhF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev17+geee71adb5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251120/202511200547.iQcGzYhF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511200547.iQcGzYhF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): 'pwm_mux' does not match any of the regexes: '-pins$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
   arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/toshiba,visconti-dwmac.yaml
>> arch/arm64/boot/dts/toshiba/tmpv7708-rm-mbrc.dtb: wdt@28330000 (toshiba,visconti-wdt): $nodename:0: 'wdt@28330000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml
--
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): $nodename:0: 'pmux@24190000' does not match '^(pinctrl|pinmux)(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: pmux@24190000 (toshiba,tmpv7708-pinctrl): spi0-pins:groups: ['spi0_grp', 'spi0_cs0_grp'] is too long
   	from schema $id: http://devicetree.org/schemas/pinctrl/toshiba,visconti-pinctrl.yaml
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: mmc-slot@0 (mmc-spi-slot): $nodename:0: 'mmc-slot@0' does not match '^mmc(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mmc/mmc-spi-slot.yaml
   arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: ethernet@28000000 (toshiba,visconti-dwmac): Unevaluated properties are not allowed ('mdio0' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/toshiba,visconti-dwmac.yaml
>> arch/arm64/boot/dts/toshiba/tmpv7708-visrobo-vrb.dtb: wdt@28330000 (toshiba,visconti-wdt): $nodename:0: 'wdt@28330000' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/watchdog/toshiba,visconti-wdt.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
