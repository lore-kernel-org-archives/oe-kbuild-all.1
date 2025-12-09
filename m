Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CAC2FB0A4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 20:55:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765313715; cv=none; b=n6N0084hodkiCJzYrnUSANa6KJArmZriYUDOVlO0Me/a8uSj5ePqPftTQCCT+kTkWZ30IAz46/Wm4iO5kW+1TwftQWwy+/lylJzG71y/3qyyhIQpVJKTzxm3mTJm3nYzsWcNrKr6H2XAuvOdqlTc0Nq+MicMDP8viZ7xgbJQlIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765313715; c=relaxed/simple;
	bh=ad30BrmZXgZVcYqv1VFZYjo0mMbHRUDA6ViGHJSgxtE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VzRp4cifO731XyvGrysjMsnXdwhnSgWBGrx0g1v6Wk86BmB3GF/n8nSSyJc7/jTwBEhoQ73RDsMBr4+FIpNB/djVn5TWQy0gn1mpnb+SU7WmyNrfaz8BoJNKEx8eMyAyP0cSdvO69P0qQ3khX9HGI8hXHzupUTCpdmu+N7rQJwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqYdPZVN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqYdPZVN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765313713; x=1796849713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ad30BrmZXgZVcYqv1VFZYjo0mMbHRUDA6ViGHJSgxtE=;
  b=fqYdPZVNT4OXaXXVdYIbUAABg/LThoxrhfT1ZPQiYpJ6kCSHJABbOYJP
   sP+OrXTrrNKYSMK1LxU4osIIKjs2EmicML3LSeWcXrMf7uSjIbHI5wABb
   idkYXQJIT11V5zKFItQubHQ+UP+CMJTwqchqJzX+MbP1CuG92224aQgnf
   qx+si7ippZkv/nWgOp6//5O+A4zlItXDofhrnzt9XZOQZWwX+sfPA4ltE
   8MYzXBtCqPsE/Xn6K/q+Y1baAFuvhxPCWJT5LH6gD2SwF7J3PsKKmOsok
   3T6K4s6yUwaSoVCDT3i+5+jwFksmA37xAittoat8K/1rSCWIaMt7OINlH
   Q==;
X-CSE-ConnectionGUID: ehSJ/zUvQX6ViLKp8o0WLw==
X-CSE-MsgGUID: 2WmdOZk3Tp6MjGckqodS2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="71144230"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="71144230"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 12:55:12 -0800
X-CSE-ConnectionGUID: uRHlVK/5TcqLfYhAfGzCxg==
X-CSE-MsgGUID: 16yGJb+0QfC+g/+AvJ6ZJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="227360490"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 Dec 2025 12:55:12 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT4jl-000000000NB-30vW;
	Tue, 09 Dec 2025 20:55:09 +0000
Date: Tue, 9 Dec 2025 21:54:59 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3398/3398] htmldocs: Warning:
 drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file
 that doesn't exist: Documentation/ioctl/ioctl-number.txt
Message-ID: <202512092129.rSRtn0GX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   ea8b5fbcdf7f5ce2d966ae6aa4e95e2ebde6cb03
commit: d48b7d951d22f7f97d68ae7b580769827683d404 [3398/3398] drivers: initial support for xsc drivers from Yunsilicon Technology
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092129.rSRtn0GX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092129.rSRtn0GX-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/admin-guide/perf/hisi-pcie-pmu.rst
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/riscv/kvm/vcpu.c references a file that doesn't exist: Documentation/virtual/kvm/vcpu-requests.rst
   Warning: crypto/asymmetric_keys/pgp_preload.c references a file that doesn't exist: Documentation/security/keys-crypto.txt
   Warning: drivers/irqchip/Kconfig references a file that doesn't exist: Documentation/loongarch/irq-chip-model.rst
>> Warning: drivers/net/ethernet/yunsilicon/xsc/common/xsc_ioctl.h references a file that doesn't exist: Documentation/ioctl/ioctl-number.txt
   Warning: openEuler/MAINTAINERS references a file that doesn't exist: Documentation/admin-guide/perf/hisi-pcie-pmu.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ./Documentation/ABI/testing/sysfs-bus-iio:396
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3  ./Documentation/ABI/testing/sysfs-bus-iio:397

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
