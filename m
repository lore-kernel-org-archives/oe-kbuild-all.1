Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7933C37417A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 10:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773916102; cv=none; b=vAQPWjwx0blfHlKupX3AtTlJ1pSpbDAgu6vR9tHfIXsqdb7VOS40zVk/8y/60mZvRBvnY7jd2MO7hwj+9XSlfZTuTjWTDNWVb9QkwKDn1Oab2YQ0HYxeGu3qKtD/SdbTwqq5IejMOODuFeT+qHQZX5IWl1A8Xpq49nSxyIzi3gA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773916102; c=relaxed/simple;
	bh=nKzW/9vdtM5LrpugOZ9Uj7R7yt5nYRV3tJBhoImN754=;
	h=Date:From:To:Cc:Subject:Message-ID; b=llv1xsOyFmt1WirWrWeIdaWRGatBrGVzZJTJ7RLGyXdcEmWtWMkE/CBTZiu3xzXccj/3aKmHChITBTOn4kzaY+bIeAFkK31jtY+M7jFUqCNnjHcKPr6/XJUFnzWoM5Tz6N4YRF9nywwg4oT4540VVBBuM1dtLrWWTMLzfNxVmxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Am/r3Qq7; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Am/r3Qq7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773916100; x=1805452100;
  h=date:from:to:cc:subject:message-id;
  bh=nKzW/9vdtM5LrpugOZ9Uj7R7yt5nYRV3tJBhoImN754=;
  b=Am/r3Qq7BNkOK12snQ+TL1Y/fm4tjLjxxUCGOGCCOCbU+39qIQinVf7B
   D+zwUwP8f9jS6Pw5YAUN/HmhlFYQurNr2WxidyPXgEHF7GY4Jf+GbOcQz
   XJSOr2dUhOfEAb3si5msz9nogLEOCntUGE3Zup+9s+hIOkeCZtRf3qQzC
   ivhlYN5z+EwIvqAMhLpHB5rS4PTzB6SXgRWVgEo0/mHb1RkCSOM00T82h
   yL+92MZCnQAFcOXrrvp7vYmr9fxHJeQTrp1KlWDkXf2Ll7YnLZP5zFjrK
   dy+M0pH6Td1C01IxRfKwoTtZizO67MxFAyJhKKS8llkNK9dmp5bx7MsZT
   w==;
X-CSE-ConnectionGUID: 9akikAyySLmCjpo6now4kA==
X-CSE-MsgGUID: lIR9LLq2RLeurMdGhkyd0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="75059312"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="75059312"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 03:28:19 -0700
X-CSE-ConnectionGUID: tgvxIBgSSGCKNx/tXp3Hig==
X-CSE-MsgGUID: EGqmnB3aRReY6tJmGQmeWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="218843447"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 19 Mar 2026 03:28:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Abw-000000004oL-21tx;
	Thu, 19 Mar 2026 10:28:16 +0000
Date: Thu, 19 Mar 2026 11:27:56 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/4] htmldocs: Warning:
 anolis/changelog/changelog.5.10.134-17 references a file that doesn't exist:
 Documentation/dax
Message-ID: <202603191136.EEKF7IZn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qinyun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7ae03274141ace633a6e590dcce9b01cc2e9c06b
commit: fe8f11ee359281843344fa5de03bb89360319831 [0/4] anolis: sync changelog from release branch.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260319/202603191136.EEKF7IZn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191136.EEKF7IZn-lkp@intel.com/

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
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
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
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
