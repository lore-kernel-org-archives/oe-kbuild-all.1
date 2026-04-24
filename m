Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AC3364954
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Apr 2026 12:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777034345; cv=none; b=K55nvVFn5AZQa0uDAo7a65wKqMG5PCBiMmV9zxbDui/tEo+bbI4TCPbRvl4dDYXNr6QG+zKOWUP5AeWtCL6FONeiTR67hYAgz3W9KAkmGIvph2nLQp2BWlW3QzhLzjft7lp9k5UV6Sk/7WTHXW49jmGJx/8KiJ3UNPSJNgs/17I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777034345; c=relaxed/simple;
	bh=H4anm1BfUlbYB5Fdvw2R50zniNdl3DsSmi+/eZPUMx0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=at05AcVJP4uquEQr7KSi51maWsjJxf6XyMyh7AU5tU/IUvbZtAfRs7ZzoOpudN5N297inWy2Rl+oqjX8ZpLUM5c/5oREyUcf9jHmNhmCsv3v8dJ043YxBM4eKywPSZAjqBkbArrdPdaHQNnj+yiqYHnN8ouVirUvxI8jDSHvEh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WsMxTCS/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WsMxTCS/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777034344; x=1808570344;
  h=date:from:to:cc:subject:message-id;
  bh=H4anm1BfUlbYB5Fdvw2R50zniNdl3DsSmi+/eZPUMx0=;
  b=WsMxTCS/r4H8eMCIBMInL2ZgnVDnOM80RKaUJoS8hsQvFDYajQg2KoZd
   7LhwX8AmEFZriek9781KVBL++JtvL1OFsnKWkHgPPJaL+N2odUOHklxZs
   Mse9uOWPDGWXZOXCyq3OjA03SvNjyP1naY7GL8Lr77ZMuqWsxBJObxxi0
   l8hsw6qiattX9247pR7fAPpFCZITJvVW6h1pwf5RL0XmSV06AmGFzv7Xh
   zr8exxiGHIXHDvhDD0xHUVadwu46TlRcokv7HeHTOqFl5KV9llIc7nnkC
   FKNHxqjbYlbhM1PhOADM626BV2WheYbvJ7DcdLc5+qiMmI6PSmXB4uiJJ
   A==;
X-CSE-ConnectionGUID: ZMqvQmoVSJ2Ykvuhcn0RmA==
X-CSE-MsgGUID: rfDRN18pROOpbDgJNaUGwQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="81619803"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="81619803"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 05:39:03 -0700
X-CSE-ConnectionGUID: a5WI7JRgTFqFnLoQJ/jyaA==
X-CSE-MsgGUID: p8qeIi2fQ+Ge8nAFyAuv5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="234735818"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2026 05:39:01 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGFoB-000000003Fh-2wvE;
	Fri, 24 Apr 2026 12:38:59 +0000
Date: Fri, 24 Apr 2026 14:38:34 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/2] htmldocs: Warning:
 anolis/changelog/changelog.5.10.134-17 references a file that doesn't exist:
 Documentation/dax
Message-ID: <202604241421.LUdVy3Zt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qinyun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   e5b00516ece60ce220f481acdcb970b904fc28a7
commit: fe8f11ee359281843344fa5de03bb89360319831 [0/2] anolis: sync changelog from release branch.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260424/202604241421.LUdVy3Zt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241421.LUdVy3Zt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
   Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
>> Warning: anolis/changelog/changelog.5.10.134-17 references a file that doesn't exist: Documentation/dax
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
--
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
   Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
>> Warning: anolis/changelog/changelog.5.10.134-17 references a file that doesn't exist: Documentation/dax
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
