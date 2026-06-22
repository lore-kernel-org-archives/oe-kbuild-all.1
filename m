Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5F1352029
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Jun 2026 07:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782111954; cv=none; b=mZPoIcAb+Zq/bFpntTXDTNy2+vXq6jxz1RUa9NEt0dtzdUy/edFywF776dUTiQfuWRTkFfBGaIVdyLSEgZiNJ2+os0FtA3A/UUaf5s2bG1K0sUn8MWwz73w/xZ+GwFEpjP0K7/J/7dalFABG51/7Lz6XcWUu8eblrj21xqlBKbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782111954; c=relaxed/simple;
	bh=qFdNqIfdbP2ss7017RcujBT0NqR6/FexxzCiEF/zEkY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k8FG66qjCCKs2de87NMAwxnEFrW+4nxK4NSVS31gac0F9BGr6kUK4iAiOy2oEXm2CAGzvociYlIFC77eP17F31119b520Sy+G2mILEHBdf+lEQn/AaE+Sc2oFTSj7E8DhKlY/IMR9v6kZlE7E2V+fbS2Ob2q/ik5vW/Mwi+J6fM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ixLy45Jf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ixLy45Jf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782111953; x=1813647953;
  h=date:from:to:cc:subject:message-id;
  bh=qFdNqIfdbP2ss7017RcujBT0NqR6/FexxzCiEF/zEkY=;
  b=ixLy45JfimpXwk7Lvu/8/JA+WBFFpv7ykcybhEEbczyCZSW94sB5nd5s
   IBMtNn6kKOAZ25gkyatKyeYeIbmX5rXJ7vh78k2t84P+TABpqDiMn4gCC
   27qznrheUGQSBrIwwpQBLtVAiWaTITYWovplL5at3kJVjmhguNk36ezsZ
   p6NBgvuUiSxKJ7kIqA3HQkg8ghVToGmAQ4LPpOqNtVEesmlH8uTDNYOms
   hnxUy0ZtKjQB+SGRnltkdkVww1YKEZ88FZ4YhiACqRTHOiPMl9UNvUoGL
   jpFGqHKB9661ulM1Lz3AjR8pTjNaJkYpuU7v2/7RiKpbwDbpmE61ACY5y
   Q==;
X-CSE-ConnectionGUID: ACzlfMitS8u2FQujsRYFnA==
X-CSE-MsgGUID: Hj3msssUT/Kqt9KtzffAYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11824"; a="82878063"
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="82878063"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 00:05:52 -0700
X-CSE-ConnectionGUID: 5l48xY7jQfegbBDfmlZcTQ==
X-CSE-MsgGUID: TD9uV4MQRLihIWRlxXOkmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,218,1774335600"; 
   d="scan'208";a="273220202"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Jun 2026 00:05:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbYj5-0000000060j-455W;
	Mon, 22 Jun 2026 07:05:47 +0000
Date: Mon, 22 Jun 2026 09:04:49 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/27] htmldocs: Warning:
 anolis/changelog/changelog.5.10.134-17 references a file that doesn't exist:
 Documentation/dax
Message-ID: <202606220909.L6zBivbb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qinyun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   adb3ec6f94e47cb5edefdc73edd6eab1dde70fef
commit: fe8f11ee359281843344fa5de03bb89360319831 [0/27] anolis: sync changelog from release branch.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260622/202606220909.L6zBivbb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606220909.L6zBivbb-lkp@intel.com/

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
