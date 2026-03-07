Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02FE318EC9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 23:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772925199; cv=none; b=e9O2NDdQJMCqU68FLj1g87k/3tkKgvrXuUCO0ewa5cTsSnLPgRYzjdbByxM8m6LeRbe4RuWruC6gG6liNZcud/yJE+e+WE9e5SFWEnET5jPIdO6rKL2rqL8ZjDA1EoDUZDN6ptG4HaCDCSNRZdjp5w1s/wWxjbAVcvh6MANYGRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772925199; c=relaxed/simple;
	bh=sQ2d8brU9oYMf2D8snpJK9etQdVcSbs6Lyg0QcFuvCo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fexU+krE/xQ/L+AXIuj+b/jwLgQQcUGOdyC63vS+TEpzhjZRBXOo/wBxMd8fyIRCrpv7xbQBtUGsL/SgremCwNwB74c2kjOw/LTO+MT0CbLfw5KOJx9FFq8lLSLZWvUcBplxtz7gPcZEfOCoGFX03ePfWiV6aG+H6L2paNcv+Rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SWNC69Jh; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWNC69Jh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772925196; x=1804461196;
  h=date:from:to:cc:subject:message-id;
  bh=sQ2d8brU9oYMf2D8snpJK9etQdVcSbs6Lyg0QcFuvCo=;
  b=SWNC69JhNhDg66iniSIUGS477RqqJTVvjusy9MpOBzANdKuZ347rJzTn
   h9K0vERHqFdpdLTqsnq53vkrLZBKS9gSW3lBwHQ71kjMzqQeX8wL7l9BI
   Z+zpBE0Lwy4dKVm8QAA2DzCXNxpvHbACYd0/b2sjZ9SjU//LcPZfeFZ+3
   coe4OrXZK9ccNx6BkFvmvMVsqReosfq80eXst3V87FkVRUfOU55fogwJe
   lwc5PlALDpgydPNJXBMeQ8c/WVexSLp+uNsN2dQPWB1eEMdLuPSrjApqN
   2BCV1aABiXax00cfiIDRW4Udn5TV51kEOFRhXdbAFjZqwO47zMyxzvCHk
   A==;
X-CSE-ConnectionGUID: 2Yv0+uc9SNio/mtZ8BfopA==
X-CSE-MsgGUID: +NASAZRuSrufoTZTr4P8tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="84629271"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="84629271"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 15:13:15 -0800
X-CSE-ConnectionGUID: F4ZUSknXRFaBVxz35s3WbQ==
X-CSE-MsgGUID: 96OHd/ViQeihQalFUOO4KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="219307958"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 07 Mar 2026 15:13:14 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vz0pb-000000002Z3-1RX0;
	Sat, 07 Mar 2026 23:13:11 +0000
Date: Sun, 08 Mar 2026 00:12:23 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm64/boot/dts/apm/apm-mustang.dtb: /hwmonslimpro: failed to match any
 schema with compatible: ['apm,xgene-slimpro-hwmon']
Message-ID: <202603080045.qGIJYa6N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   db15f4990be1b8865ae651c9d748d43c91bb9d13
commit: 7a0e28e5b2aa25919b9f32f7ef9d1e425aefabca [3/3] arm64: dts: apm: Move slimpro nodes out of "simple-bus" node
config: arm64-randconfig-2052-20260226 (https://download.01.org/0day-ci/archive/20260308/202603080045.qGIJYa6N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603080045.qGIJYa6N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603080045.qGIJYa6N-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /cpus/cpu@1: failed to match any schema with compatible: ['apm,potenza']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /cpus/cpu@100: failed to match any schema with compatible: ['apm,potenza']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /cpus/cpu@101: failed to match any schema with compatible: ['apm,potenza']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /cpus/cpu@200: failed to match any schema with compatible: ['apm,potenza']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /cpus/cpu@201: failed to match any schema with compatible: ['apm,potenza']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /cpus/cpu@300: failed to match any schema with compatible: ['apm,potenza']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /cpus/cpu@301: failed to match any schema with compatible: ['apm,potenza']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: refclk (fixed-clock): #clock-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: /i2cslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-i2c']
>> arch/arm64/boot/dts/apm/apm-mustang.dtb: /hwmonslimpro: failed to match any schema with compatible: ['apm,xgene-slimpro-hwmon']
   arch/arm64/boot/dts/apm/apm-mustang.dtb: soc (simple-bus): reboot@17000014: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: pcppll@17000100 (apm,xgene-pcppll-clock): 'type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/apm,xgene-socpll-clock.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: socpll@17000120 (apm,xgene-socpll-clock): 'type' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/apm,xgene-socpll-clock.yaml
   arch/arm64/boot/dts/apm/apm-mustang.dtb: socplldiv2 (fixed-factor-clock): 'clock-names' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/clock/fixed-factor-clock.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
