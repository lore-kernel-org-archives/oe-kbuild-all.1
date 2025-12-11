Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C591FF1B5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 03:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765422521; cv=none; b=pPUgwY1LzNoXqXKen/woNxKdxBQmJnVNUGWSnBkuBzx1hKBJ3s/NuZq7C/xvkASwwWVr2pLNR23OJGbzuGU6YgnKpHzR3SU6tYdKWipiFWVS4wBeUvDjMbvC8je9CRB+UoIVC+bgjpLB+iHCHfNh6DPD15UwQQwIUxWDQoXB5TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765422521; c=relaxed/simple;
	bh=XAzELj1sr/u47XgYnstAoTzPlFlgGd3Si6ExTq9U8aU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KM3fr19Lygum9Lwr8KbBCwR7Vr8f3XKitXITx8ApV/gs3FsizBkuop9hmdc2oPUOK/nOMbjHbwARYp6Qqq1HVs/Eo5Fb21tR1bC6tsgEKkzbWZlxPD1FlKXMOaqBDxJp+LFRQXBPZ1hPP7/rbeyMt2xjsGWY3FqPhCq7yzPNISs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UhW6kYqB; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UhW6kYqB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765422519; x=1796958519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XAzELj1sr/u47XgYnstAoTzPlFlgGd3Si6ExTq9U8aU=;
  b=UhW6kYqBE52ePN63XA2nYACE8m/KZZU+vHd59tjEqPKX3RNXiv+bOsM/
   /WEzFxVrhwG7jkVssr8YpbdL/z8gikWkwG/wkFv67pS8CTYTTUuxqowwz
   REoJKU4NTvNtlkBQlnNvQBZvRGoVq+u8aAhPFxT2akduvO5cuNVuvkxWM
   ThA+cmWZNvwkCB5LZ4M+HlpZ8yIXfqheCxmk6kToBt3+ieOz7xepDdRCj
   uFroH2CEPdM2+ydHB9vNQXCd74YqFm9Ds0TQikwC5V6vc0/1nrbQxoUAD
   z5oEcft2CQILLHt9WAB+kFzFOF3Oz6eRp4SJuMZg9g9lUX9Ba1YwjQJy3
   A==;
X-CSE-ConnectionGUID: ofA3lp+bRF+j58tY4IZ7pg==
X-CSE-MsgGUID: hjaIiWN/S8qpjOmhlT8/bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67571334"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67571334"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:08:38 -0800
X-CSE-ConnectionGUID: L5G/ubuKTXOM0Bv/lBnBVQ==
X-CSE-MsgGUID: u3qoa3nCSja16D2Gkzpmtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="220031072"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 10 Dec 2025 19:08:37 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTX2h-000000000tI-2hIE;
	Thu, 11 Dec 2025 03:08:35 +0000
Date: Thu, 11 Dec 2025 04:08:10 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] htmldocs: Warning:
 arch/x86/Kconfig references a file that doesn't exist:
 Documentation/x86/user-interrupts.rst
Message-ID: <202512110442.eiKMlyLn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sohil,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   31d0ea3bf1bd93e960f341e4da1ff033eacefab2
commit: d194d7311815d728c2b9f10c3f103edc141906ef [3/3] x86/cpu: Enumerate User Interrupts support
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110442.eiKMlyLn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110442.eiKMlyLn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
>> Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ./Documentation/ABI/testing/sysfs-bus-iio:396
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:3  ./Documentation/ABI/testing/sysfs-bus-iio:397
   Warning: /sys/bus/iio/devices/iio:deviceX/in_anglvel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:4  ./Documentation/ABI/testing/sysfs-bus-iio:398

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
