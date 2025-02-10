Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F32E189902
	for <oe-kbuild-all@lists.linux.dev>; Mon, 10 Feb 2025 10:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182620; cv=none; b=VfAiedsYC/oYD9Om7ceciwbDnbEQ+DneSjTXUtT9aYsPW91UMA/5co1K1CJzUMFU20lw8ZgAD5cQN0D8cQgijEjQGk2nuPFFVTLplmpFiHKJ26WcRjQKldME5GRs3Ziyj0SiD9Y5itl6z/Hoy4SK8QySal25qMjuwAvXsT3+QZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182620; c=relaxed/simple;
	bh=zENedeGsbW7Vf2/3d4/ZqTUSrFMvcGh6Vho2Q2ObaJI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nq7/z0oVb5AuFITuTTVf0L1dbadVbl+MGhS0S9Prr7FUtV9RXoa9up3Ey4PxhA12OMtCf2bxjF3e4rJ4FwmemdLfqWYgU9DLy17Y00BlGMcB4ymbp30Z3VFhBNuzDvJMBDxJdyzLD/XktHtNa5aJj9IDv9F5fKVpB0nrvzyBTYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n3dQ5Omw; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n3dQ5Omw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739182618; x=1770718618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zENedeGsbW7Vf2/3d4/ZqTUSrFMvcGh6Vho2Q2ObaJI=;
  b=n3dQ5Omw3vXO6eRTSGYV7+Zz/c18O9FpCGzH/ArDVEr9TncOnYHDtuP/
   7sHryzVYDJMVbwOZqGLgYgwSGqj+lr0Oh/Mm56JDb5qvdAQ5jLOp8W/wN
   4pC4F2QJ+tcJbnfOR8/Tvw2HdfEpN2F5dSjX5YelwY4LJTLkqj1FSRovI
   k19m6RmL4mHO0Gq8ZRBrbYR0qaGuoYMGZuv3smlQQfcZ3DhOXtJ1P5Ew6
   YlT52DLv8mDFSe9Br9nOeHkjUUBh7fC/2h+91AGlcL45RzXRCHgMWC7fz
   8v6lXqe4ptHFHr2BxulxZuiKKwGpiYm4pvxMTL+go1EMB9M040yM/yumP
   A==;
X-CSE-ConnectionGUID: yK8zXk44QyCaLzvz1zkojQ==
X-CSE-MsgGUID: 3bO/fW3cQwKCtaZ30VwpVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="39867565"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="39867565"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2025 02:16:57 -0800
X-CSE-ConnectionGUID: c4BF87f9S/+dCqpXmc4hxA==
X-CSE-MsgGUID: RnvfWg53TT68SAenBJHQCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,274,1732608000"; 
   d="scan'208";a="112083314"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Feb 2025 02:16:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thQqU-0012ZH-18;
	Mon, 10 Feb 2025 10:16:54 +0000
Date: Mon, 10 Feb 2025 18:16:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2734/2734] htmldocs: Warning:
 arch/x86/kernel/cpu/resctrl/monitor.c references a file that doesn't exist:
 Documentation/x86/resctrl.rst
Message-ID: <202502101814.m8lSF3rK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Fenghua,

First bad commit (maybe != root cause):

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   9534dcd94e7f28129d5a3db85ebaf7bd9e1136c6
commit: a6c0245e15d65203dbe3b21d47e8618b4444bf27 [2734/2734] x86/resctrl: Correct MBM total and local values
reproduce: (https://download.01.org/0day-ci/archive/20250210/202502101814.m8lSF3rK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502101814.m8lSF3rK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/x86/amd_hsmp.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/riscv/kvm/vcpu.c references a file that doesn't exist: Documentation/virtual/kvm/vcpu-requests.rst
>> Warning: arch/x86/kernel/cpu/resctrl/monitor.c references a file that doesn't exist: Documentation/x86/resctrl.rst
   Warning: crypto/asymmetric_keys/pgp_preload.c references a file that doesn't exist: Documentation/security/keys-crypto.txt
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
   Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: openEuler/MAINTAINERS references a file that doesn't exist: Documentation/networking/hinic3.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
