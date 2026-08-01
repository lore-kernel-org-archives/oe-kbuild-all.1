Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346381FF7C7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Aug 2026 16:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785602930; cv=none; b=NK+qXHAoalMu8rqxRfi2fUKzjnfblKzrd5hyYa9EvBiDkdZaoKHrpU/xdd60/mlxnfFRE1YmG+HMQ1VaVr3Nc/AucY8vTduXm1+fpfsjCQztHLYTSM/uVH2DafuQmKYFP1Bc/++ja8W5IOlKteXbpu9mW5mZ57OTf4FM7buhD3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785602930; c=relaxed/simple;
	bh=izRQs1+Q4r41Uox6BllN65H7NXDYBZimzfhThd/Md3Y=;
	h=Date:From:To:Cc:Subject:Message-ID; b=actgfFnf6Nm2TCZddGkcroigiTFg7PxNKJ6SekN+aYVM6q6UpnGNZ31LksoPNfLzu6LHK0sB7tIj20Wg+52tblZjc6GuXw/WMmor0jE5qnC/oTJ4++kDgmejg2+IHM381SvHnQtZm8cTe4N3d98EJ/iJdOlgOH2Wvkq0xTOxygs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQb97CZ4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQb97CZ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785602928; x=1817138928;
  h=date:from:to:cc:subject:message-id;
  bh=izRQs1+Q4r41Uox6BllN65H7NXDYBZimzfhThd/Md3Y=;
  b=KQb97CZ4oqMONeGZ9YCmb2F1rEDXsHJ0ZNvlgs4PdXf7fh/q75U0OlFM
   UK9kcgYApuY144S4K/x47bSyRUjyi86j4AoDxKcJTlPnsvwfNy7Sy2jY4
   Kit2Nu0lOgXif8cylrTLUniulXD6BCy8AZiZ2nXOisJCEgztnxRAP18t4
   Lnu5JKgr3hSRsG9XTTPvZoqF8h+NEaLMkKUn68LhQ0pEaNeg4i3S0VN7K
   WkWNd+owylUCXhkxiu+1KIst22z7uHIJ4XXDmC7t/nYAZ5C/tPKnzSWi6
   jvlsiPnjyWCOFYy0H6HigCln6I7HmGxTCRNi0X8kcRQS6GxYqm01sbVu1
   g==;
X-CSE-ConnectionGUID: gg/S8v7FQoOM/w801zm0oQ==
X-CSE-MsgGUID: km3HEdRzSBGLEtOTTxsFNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11862"; a="85972525"
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="85972525"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2026 09:48:47 -0700
X-CSE-ConnectionGUID: XqF3WQjYQruqHmiyUsTSSA==
X-CSE-MsgGUID: ydPwGAsWTGaqCZU640VERA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,198,1779174000"; 
   d="scan'208";a="262804763"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 01 Aug 2026 09:48:46 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wqCtA-000000003Uw-0N27;
	Sat, 01 Aug 2026 16:48:44 +0000
Date: Sat, 01 Aug 2026 18:48:22 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/159] htmldocs: Warning:
 anolis/changelog/changelog.5.10.134-17 references a file that doesn't exist:
 Documentation/dax
Message-ID: <202608011855.XDXx8KJ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Qinyun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8604b0d9bc72c082338f572a56f18732ece59a5a
commit: fe8f11ee359281843344fa5de03bb89360319831 [0/159] anolis: sync changelog from release branch.
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260801/202608011855.XDXx8KJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608011855.XDXx8KJ2-lkp@intel.com/

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
