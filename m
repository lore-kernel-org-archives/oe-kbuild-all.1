Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81A2153E7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 05:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762232472; cv=none; b=BRNnvV3R60uhSs9SnBcBe83O+a+d/4vhHLFBYExPTkTIACGo88JHu0gywwRujvdpmkkysPxP4uoj2D7Qo4SEuYcjHtWRIamFUzMtGsiLPlZ/ct1+R2M2/TNQ/Lbblfvx76RjYa7Sku965Qw9B/mA02nSCHh+62l7ddkA3gzd91g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762232472; c=relaxed/simple;
	bh=FYhasoSbRsIgV430c5jbWK6vtao3JUajOe8VXeds9fk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CrCKB13lD1TnucQAzowYcaEVvFy7ew9c14sJBEfPzbRojtrVRbPhxl0tZFNqIeBDRztZrkFKp+qm+e0WDszsPp6oNw6+MB2g7uJ2iOItqSFtfTdT0rRjlZ+c/I6MAAV61b91iuTJmO8j6tLi6DJA/cbjqY+jgvkxz3ak3TuGrAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D36pArHR; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D36pArHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762232471; x=1793768471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FYhasoSbRsIgV430c5jbWK6vtao3JUajOe8VXeds9fk=;
  b=D36pArHRAOcNrkiMF7gLDyMkxn/8fKuMevJTbimzxLsmOXPX32SvpL9f
   jlnGDpX46GJaSLgjbi8SVInsYrIfqThCiQxNnQmU4UUwXDn9duuM3f6t2
   FG3CAxEkjI5Q9xdZ1p1L+++QnBCw0Uc4+4o96eTdoigcyz03p/TzS1e+3
   2NNGyZFnd2ql9bY5cmjupW1+VukMK2/uGnsF4xzWqUxHLWvBwd8LkS/gL
   lJ3cuc9YKbcZN89k5cTqDGv9BjVrjAM9lncrljjersigb+DJDZ8qJ7RmZ
   FIiOGyYP1TUaHaeoxjYdElFi57+s+X+e/ivR3KX9E9XqlFVpmN6/4hQ2U
   A==;
X-CSE-ConnectionGUID: CI4vWy2fR7uixrgHH/T8rQ==
X-CSE-MsgGUID: cd1RYso9Q+GqpajOf9t3bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="75769145"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="75769145"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 21:01:10 -0800
X-CSE-ConnectionGUID: u5A6wQVwQF21sfBnzR1xIw==
X-CSE-MsgGUID: zbUiDSbnRuWIv8kRP1EVaQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 03 Nov 2025 21:01:10 -0800
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vG9AJ-0000000020A-3DNB;
	Tue, 04 Nov 2025 05:01:07 +0000
Date: Tue, 4 Nov 2025 06:00:41 +0100
From: kernel test robot <lkp@intel.com>
To: Raphael Gallais-Pou <rgallaispou@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4999/5383]
 arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/display-controller@9d11000:
 failed to match any schema with compatible: ['st,stih407-compositor']
Message-ID: <202511040612.x75Lb4wA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   98bd8b16ae57e8f25c95d496fcde3dfdd8223d41
commit: 7891011fbc9a5e0c07af7c032ba04a2e16587c2e [4999/5383] ARM: dts: sti: extract display subsystem out of soc
config: arm-randconfig-2052-20251101 (https://download.01.org/0day-ci/archive/20251104/202511040612.x75Lb4wA-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 20c323aa0e5dea6f3d340c721c5cee30801db850)
dtschema version: 2025.9.dev13+gc72762e0c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511040612.x75Lb4wA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511040612.x75Lb4wA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d80000: failed to match any schema with compatible: ['st,stih407-uni-player-hdmi']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d81000: failed to match any schema with compatible: ['st,stih407-uni-player-pcm-out']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d82000: failed to match any schema with compatible: ['st,stih407-uni-player-dac']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-player@8d85000: failed to match any schema with compatible: ['st,stih407-uni-player-spdif']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-reader@8d83000: failed to match any schema with compatible: ['st,stih407-uni-reader-pcm_in']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/sti-uni-reader@8d84000: failed to match any schema with compatible: ['st,stih407-uni-reader-hdmi']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/usb@9a03c00: failed to match any schema with compatible: ['st,st-ohci-300x']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/usb@9a03e00: failed to match any schema with compatible: ['st,st-ehci-300x']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/usb@9a83c00: failed to match any schema with compatible: ['st,st-ohci-300x']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/usb@9a83e00: failed to match any schema with compatible: ['st,st-ehci-300x']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/display-controller@9d11000: failed to match any schema with compatible: ['st,stih407-compositor']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/encoder@8d08000: failed to match any schema with compatible: ['st,stih407-tvout']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: encoder@8d08000 (st,stih407-tvout): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/hdmi@8d04000: failed to match any schema with compatible: ['st,stih407-hdmi']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/analog@8d02000: failed to match any schema with compatible: ['st,stih407-hda']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/plane@9c00000: failed to match any schema with compatible: ['st,stih407-hqvdp']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/bdisp@9f10000: failed to match any schema with compatible: ['st,stih407-bdisp']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /soc/hva@8c85000: failed to match any schema with compatible: ['st,st-hva']
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpus: cpu@0: 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpus: cpu@1: 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpu@0 (arm,cortex-a9): 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpu@0 (arm,cortex-a9): Unevaluated properties are not allowed ('#cooling-cells', 'clock-names', 'clocks', 'device_type', 'st,syscfg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpu@1 (arm,cortex-a9): 'enable-method' is a dependency of 'cpu-release-addr'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: cpu@1 (arm,cortex-a9): Unevaluated properties are not allowed ('#cooling-cells', 'device_type' were unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/st/stih410-b2260.dtb: /restart-controller: failed to match any schema with compatible: ['st,stih407-restart']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /softreset-controller: failed to match any schema with compatible: ['st,stih407-softreset']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /miphy28lp: failed to match any schema with compatible: ['st,miphy28lp-phy']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /st231-gp0: failed to match any schema with compatible: ['st,st231-rproc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /st231-delta: failed to match any schema with compatible: ['st,st231-rproc']
   arch/arm/boot/dts/st/stih410-b2260.dtb: /delta0: failed to match any schema with compatible: ['st,st-delta']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: /display-subsystem: failed to match any schema with compatible: ['st,sti-display-subsystem']
>> arch/arm/boot/dts/st/stih410-b2260.dtb: display-subsystem (st,sti-display-subsystem): 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
