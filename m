Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43A035837D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921566; cv=none; b=dCEooqQMCfeDuk9tAXIGaT8b3AEjPzTGXEwR+6oVbnsRvPyFHI6H85Z+Sb6tUvDQ5/aoE/rVggtgT6Pn+XNj2D507HGCTQluT/R0N46T//Ss8bEX5rYiT44g7BdZZdKZPyG7+nPmIsldPER90y7pCDmaY0sW613TWE3ZFEN9dQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921566; c=relaxed/simple;
	bh=eLIPULsLlWVKRtRiJGTPo2DzN0cjgLz7nwt32fgDNgs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XByyrsketbidzWxv9ksdGVFP11UBeB2O8fBOxOJSpJ/4/u9qjxiyyTNfwUzkOLTfZAEUw9W4PjgejDfuwW4rz/DKTNc/wi5cELM62oC045iTCBcOVMdMKqq91FYCUK+9QbOEuVdKKU7xxpDtu5W/L0hjd5g+Z3bnBJPbVg1RPWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PWLhPe7m; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PWLhPe7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773921562; x=1805457562;
  h=date:from:to:cc:subject:message-id;
  bh=eLIPULsLlWVKRtRiJGTPo2DzN0cjgLz7nwt32fgDNgs=;
  b=PWLhPe7m7nNTMawUmYyJL7PNbMm/JJubW5hDYM2kyKqwQng2RvrJ9wQi
   4EtN20rypCRItb+2HFYl+NYNf3if7NotW/qvpWx47zzqYgG+6k5bafxKj
   jzvWm7hLinlSZRVKx07rebSchnVLUltX1YKUzaMLQjTtUfkUT8VnH4Yqw
   rv+aOH0UIHf94vcEAhkt2V2UxVdseN1j2yU27zZbIEtbDaN3XQGk/bLyA
   686jAkMQaHRalVJyKbDHxWF87Gl/hvWs7h3w74158YDeiAGgZXk8Iu3Mb
   +Krtp9JAJ++VZq0AYLJ8k+3WU4OnZxuUtCDplpvqXyJygB5krxwAtUEil
   A==;
X-CSE-ConnectionGUID: pOHBIIOdS8+oMnXq4L3syw==
X-CSE-MsgGUID: dpfhf1dhTPW2dt2Maaj+ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="78593924"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="78593924"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 04:59:21 -0700
X-CSE-ConnectionGUID: f6/Flc6zRWe1Id/sB5XJNA==
X-CSE-MsgGUID: ClTrssgpQ52k6O8xl5xKRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="220332808"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 19 Mar 2026 04:59:18 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3C20-000000004oj-3ZRW;
	Thu, 19 Mar 2026 11:59:16 +0000
Date: Thu, 19 Mar 2026 12:59:07 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 0/4] htmldocs: Warning:
 arch/x86/Kconfig references a file that doesn't exist:
 file:Documentation/arch/x86/buslock.rst
Message-ID: <202603191229.IiXYxjtt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7ae03274141ace633a6e590dcce9b01cc2e9c06b
commit: a5b6787ab3e6b6798c078c619aa1958ffd718f93 [0/4] x86/split_lock: Move Split and Bus lock code to a dedicated file
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260319/202603191229.IiXYxjtt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603191229.IiXYxjtt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
   Warning: anolis/changelog/005-changelog.5.10.134-17 references a file that doesn't exist: Documentation/dax
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
>> Warning: arch/x86/Kconfig references a file that doesn't exist: file:Documentation/arch/x86/buslock.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
--
   Warning: anolis/changelog/000-changelog.base references a file that doesn't exist: Documentation/filesystem/dax
   Warning: anolis/changelog/005-changelog.5.10.134-17 references a file that doesn't exist: Documentation/dax
   Warning: anolis/rpm/kernel.spec.template references a file that doesn't exist: linux-%{KVERREL}/tools/perf/Documentation/examples.txt
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
>> Warning: arch/x86/Kconfig references a file that doesn't exist: file:Documentation/arch/x86/buslock.rst
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: drivers/net/ethernet/nebula-matrix/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/nebula-matrix/m18110.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
