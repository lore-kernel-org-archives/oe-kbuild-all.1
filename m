Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D4B4C7F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  1 Aug 2025 00:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754006532; cv=none; b=GXB19rMuZ4bDvgA+S7UxJriqChX9uE0oATsZ6mXb3A6AM/blyfENha8eMKZ5Wr6WuZVbF+99pwhfoPk8J/1xypivgbWamcXVudmXFVpc96BtSASwscC7SSaduAlcmws/r7pUkD2hkMob4PVaANrUy16urL4NW7wHuRMA2+AFy90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754006532; c=relaxed/simple;
	bh=DbrJ/fPRqh8PyPGS16NCivtiy8cYGt7RrQ/x+Zv6/I0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jDwQbH2CzPmEpNv73/FAcgHuitTLSFYKRcluzSVolUDufsgP6xg6EPiEvZBervsJry5rda3phHIn1gWQk1Sj3R6FfEf+cd5uKn3him4Sw8/yBQiJljviwVWEqpMYwM6uCaBMkOiQ0LzKXHyuKeOeIvTUlMV7B2I2s0Y0U+mu/gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lj8RoCMY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lj8RoCMY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754006530; x=1785542530;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbrJ/fPRqh8PyPGS16NCivtiy8cYGt7RrQ/x+Zv6/I0=;
  b=lj8RoCMYekcQzIYZD00Re1X2gUHm5hANlfMUFV0W5mM7tyrzzA4fpnlr
   sm0ZkqWhiV+nsyVF15AUuPlbzPWQUGSizOPDApZCgaIpnG6Y7Uc3ujXPQ
   Ncuw7eXGxDC6Y+rk2yZmssrd8fH8XydNlsZQceQVErzWVfVUkW61snGqq
   Qy/taLi684mxkvME+D2+rPDThEOQByXoMIN4XKpViJVh/y5uzEsxSKrIy
   3JV+7NmTXF+nDKaCDOQaPilseTCNT9I9TNzUIdPH7KTGkoimydJY/LlfK
   GkVeSwChkX5dtEMMjzdZoUtSE23Dxe1jyvTl81Ft+FZJP3nRx1BWOqUgR
   A==;
X-CSE-ConnectionGUID: kS3ByWZRTIeqe3Q29Qzj6A==
X-CSE-MsgGUID: 1FWVjDn/TUG/MBrn1IHl3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="56043919"
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="56043919"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2025 17:02:09 -0700
X-CSE-ConnectionGUID: Nq7R6UbbRNejqtCAlaNguw==
X-CSE-MsgGUID: oyLexCHpSxWfHNOcerTBXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,255,1747724400"; 
   d="scan'208";a="200566730"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa001.jf.intel.com with ESMTP; 31 Jul 2025 17:02:09 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uhdDq-00017L-1C;
	Fri, 01 Aug 2025 00:02:06 +0000
Date: Fri, 1 Aug 2025 02:01:55 +0200
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-SST-ANBZ22493 0/1] htmldocs:
 Warning: anolis/changelog/000-changelog.base references a file that doesn't
 exist: Documentation/filesystem/dax
Message-ID: <202508010243.fP9eIR3s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-SST-ANBZ22493
head:   6e920c19ef4a8f89209c5ac5530a793323f633b5
commit: 88f66936c77127ed35d2e026e9a7bedf16385ff0 [0/1] anolis: spec: add script to generate kernel changelogs
reproduce: (https://download.01.org/0day-ci/archive/20250801/202508010243.fP9eIR3s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508010243.fP9eIR3s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
>> Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
