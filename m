Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5AB2882C2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 11:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753182770; cv=none; b=Vk9/Fpy2nfLv8A/oGgdPv1kmg7eFw2bZPfoBDk5SKXGibfviM8htW/RwMSPTyPtvH8K/yBA8Va9vHwR1Yw17v3x0yjE+6CZu1Mh6rvEJBbMf2hiJ4mSVmHX4zy8/j0lyT6Nmv08bQdWGIWxu74FyXwwVup2UrtSdHwXrXRfBPRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753182770; c=relaxed/simple;
	bh=bpZzjzWFWd5hSwt2vg4GfiINCc7IKqpm6Q+iyg88gVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ECWx4CsAPrbTFrcYFW4NsldyHzxF4y89EdEtkSIs1sx/QgK+GwQhppBfeh8ceFAyuvAQvzDds237zKPGizxm9TRQ6ExRa5GANzWyhTymuudiVdfJYlflxTq4GAwfZHhr/xzUrOwj0beszs2JgU0i+p6pHW/zAKJ05aLZXR9oBvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H6FiOPP1; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H6FiOPP1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753182769; x=1784718769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bpZzjzWFWd5hSwt2vg4GfiINCc7IKqpm6Q+iyg88gVA=;
  b=H6FiOPP1/VPkHVpctREDS8huGghUDpHpQrSfLodha6YHbYP7CPQcHeqP
   xmUG0haEnWL5+j7S/ezxK5rZBOfG9F/GfqUbd1ONtM/tT3ArAYer2kr6h
   cCPEk6UAmUhYzxfj5uNTIt469BRQAX3efdYN8eaJBKHGwChDaF/Cjryd1
   qgUt3SINBgiqI+jbYXl5jjt4xkbzvGM+bQSQfwqiRQLV/CsfDy0G6Ukny
   Lhbw859iC3XT6EWv7XMbgM6Nqy/ZF3zwXcmbH+Xy3VKEuhRt8p+HSHbbM
   OBNLfzztARCQv0PT2iiZmxSUf+UdV8RBxmzi0+qSf2hrZ8/mLy9htqVYo
   A==;
X-CSE-ConnectionGUID: y+9abv/KTC2LflDi5hFFIA==
X-CSE-MsgGUID: 0beK3PZdRVWfvpNnJZ/uSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="55383826"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="55383826"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 04:12:49 -0700
X-CSE-ConnectionGUID: 7hQ977oRQOSWFov9MFAEXw==
X-CSE-MsgGUID: SQRV4j87SRaKnJLn23F3dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="158774638"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 22 Jul 2025 04:12:48 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueAvN-000HjH-2x;
	Tue, 22 Jul 2025 11:12:45 +0000
Date: Tue, 22 Jul 2025 19:12:44 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.16.y 17/44]
 arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: pwm-fan (pwm-fan):
 'pulses-per-revolutions' does not match any of the regexes:
 '^pinctrl-[0-9]+$'
Message-ID: <202507221926.9DhOlt5i-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.16.y
head:   ac46a60ec2fb958f1dc2e5871e122abb98ac0da9
commit: f78109660665c4a06dcb3773ca3e97cd131f4610 [17/44] ODROID-HC4: arm64/dts: add 'meson64_odroidhc4.dts' for compability
config: arm64-randconfig-051-20250722 (https://download.01.org/0day-ci/archive/20250722/202507221926.9DhOlt5i-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221926.9DhOlt5i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221926.9DhOlt5i-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (unit_address_vs_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (unit_address_vs_reg): /soc/bus@ff800000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:271.33-1545.7: Warning (simple_bus_reg): /soc/bus@ff600000/bus@34400/pinctrl@40: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:1759.27-2031.6: Warning (simple_bus_reg): /soc/bus@ff800000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:2230.23-2270.6: Warning (avoid_unnecessary_addr_size): /soc/bus@ffd00000/dsi@7000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/amlogic/meson64_odroidhc4.dtb: pwm-fan (pwm-fan): 'pulses-per-revolutions' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/hwmon/pwm-fan.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
