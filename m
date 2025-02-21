Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31321E3DCF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 06:41:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740120102; cv=none; b=Pwx+nQlpt2z+Nd8TLE9eGvHENv/XrHq3qCse8yzTUR7FHKXzO+DYPXrE4x3Xz3nywZwURFzOAm3YiPw7P3qZ7Db8y+Nhm8CilcJk75Kv96TvvnvQHU7xG17hk8Qy3f1CuXnVv76gSy9pF4sCi9Mzi74CYIWJf9V75UUMDeeDTcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740120102; c=relaxed/simple;
	bh=YBE10lw/KY2mWsZO5Ipl44wv7wLNBnITdo/s6Cl4z0g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XpmghXzwRnNHf5RVtFyl1R2aD84Ja+iQiYQ2ZdJ/TA1mKkjowWKtvFHf0KNbab5/07sxIc6j72eTozNBGuTBmN3Pswa43tv9YzfaBIEYMSQU9+8aCy3namP6CsLN1dpIdrWHyx1/PIE+pzK2N5p3yWOh6NvJwLL+OoFlf9pVESY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Il+8wWGK; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Il+8wWGK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740120101; x=1771656101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YBE10lw/KY2mWsZO5Ipl44wv7wLNBnITdo/s6Cl4z0g=;
  b=Il+8wWGKIK/T3QhNG6BnlqVitnagHlmGjLBsUx/S5xW4RI2Fqqzqj8MY
   FjoyHrycgREGMKvvi0rVYBzQatJVztGhjuePWKcZxGJ7t0ufOnDx/g0qQ
   9q/daEhqji/MNESN4QWV88kQSO1AYWARcw/mDT+08+1nYAo+ropqIhQ+6
   bqH9pmbsCvlqlYdjX5xi8GSiAppQJjhnIxK0/d6XJ/m5v+k2w/je78T16
   ujgYUlfqdGWy0txREVdri/jZ9ZPk3AzGuLEdlPFrMK2VKW3cQtRl4+nli
   XYQ8f8MXwwTb7xfuG0jbUk4JIwc8rE5D8A75arZSH1D9d26MuhRswvd9R
   A==;
X-CSE-ConnectionGUID: 10A99fnbRjCj4TJgH9AsFQ==
X-CSE-MsgGUID: X1NkcrxVSjKfzd/0hkDV3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="52358011"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="52358011"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Feb 2025 22:41:40 -0800
X-CSE-ConnectionGUID: zVZNgTkvSkSlnXuXsjU9XA==
X-CSE-MsgGUID: UZWAd2hIRPWpnLmP8jbNmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="116172862"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 20 Feb 2025 22:41:40 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlMjB-0005Cx-0o;
	Fri, 21 Feb 2025 06:41:37 +0000
Date: Fri, 21 Feb 2025 14:41:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-lts 1/1]
 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb:
 /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/pwm@20: failed to match
 any schema with compatible: ['maxim,max31790']
Message-ID: <202502211427.qAOZ6dF2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-lts
head:   721365424acefbefb05831eeb599f7e5a1a42457
commit: c62ceade98a0f453f3a1a542c5702a069bdc778d [1/1] ARM: dts: aspeed: yosemite4: correct the compatible string for max31790
config: arm-randconfig-051-20250220 (https://download.01.org/0day-ci/archive/20250221/202502211427.qAOZ6dF2-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
dtschema version: 2025.2
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211427.qAOZ6dF2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211427.qAOZ6dF2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/adc@1d: failed to match any schema with compatible: ['ti,adc128d818']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@35: ti,mode: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/adc@35: failed to match any schema with compatible: ['ti,adc128d818']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@37: ti,mode: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/adc@37: failed to match any schema with compatible: ['ti,adc128d818']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@1f: ti,mode: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/adc@1f: failed to match any schema with compatible: ['ti,adc128d818']
>> arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/pwm@20: failed to match any schema with compatible: ['maxim,max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/pwm@23: failed to match any schema with compatible: ['maxim,max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@0/gpio@61: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: adc@1f: ti,mode: b'\x02' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml#
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/adc@1f: failed to match any schema with compatible: ['ti,adc128d818']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/pwm@20: failed to match any schema with compatible: ['maxim,max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/pwm@23: failed to match any schema with compatible: ['maxim,max31790']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/bus@1e78a000/i2c-bus@780/i2c-mux@71/i2c@1/gpio@61: failed to match any schema with compatible: ['nxp,pca9552']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']
   arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: /ahb/apb/fsi@1e79b000: failed to match any schema with compatible: ['aspeed,ast2600-fsi-master', 'fsi-master']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
