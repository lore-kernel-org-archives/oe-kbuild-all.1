Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826C73B8D75
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 03:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765425101; cv=none; b=Dg71Pa/78dErOT0PAaiPvyayUWyguYNlWFjNzKqo9svxZkG/dntqT3itp4PmkoQjgYrKpRo4nS7RlrLiHy3RFK08JHuMD4e7SS45j/2wrDk1uS+WHFpJsAclE768xrYgoxfB9iV/44X4jXOGir0qFh79/mEYh8sY+DmllkpTH7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765425101; c=relaxed/simple;
	bh=VAm+kKKumRh/5Tiy5sd7LFWPl9eWbqTQjlR3T8xfFhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GUoN9Fq64eEeYidDNaVinONJ+AUW1LkjrNwxQ90vslTrAhwnfJTbwxkfrLXtH2jwuiKy2j2lyTUHDgH1zB92nP3vc9VodOcy6wb3qvKuSxEioVw68xNup48eA9x9kqH2KOuyE0YCp30ESsB3ORSdr5uQy5tUXMkYoPGbbXtSmj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GvQiBrQ7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GvQiBrQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765425100; x=1796961100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VAm+kKKumRh/5Tiy5sd7LFWPl9eWbqTQjlR3T8xfFhc=;
  b=GvQiBrQ7SScki01RsX9Cd90IoNFfpVvxjrwc+1qP4Y5dTcCdohTbPuSp
   /YVdCOznMzGHm10hAU/5DxpgqyN86sQqu5wA991pcgsP59QZHXM0sfJUl
   duiik4z+t7eaQimsUaDnYVJpJlPfytzV05Vx3Ub2dDFhw/Qr4w4fnf2PY
   ZlT0Q8yfMtxe4Zw5+rd74VCzkPph6U2aTjAlMa8/ORPrfb+5zKYGuj51a
   YuaPdgqyJ1MglZTnM8H5UaY9sPkOcvhqlkPsUJuj80ShqF4wQBkMfmQl6
   rFAbwWgS6Dgbu6hXS/XGC6LNefA3aXCckfiFz8psVfux/2fmcUNpjPnQd
   g==;
X-CSE-ConnectionGUID: r8sYueFER7yXs1YCPGA6mQ==
X-CSE-MsgGUID: zSs8VKnNTsq+iUBxL1y/pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="92882417"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="92882417"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 19:51:39 -0800
X-CSE-ConnectionGUID: 2esVDvZ1QS6I2vqC5ttOZQ==
X-CSE-MsgGUID: O/vr/ygAQ6qZgFSAtpvgKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="196697276"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 10 Dec 2025 19:51:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTXiJ-000000000tk-47J5;
	Thu, 11 Dec 2025 03:51:35 +0000
Date: Thu, 11 Dec 2025 04:50:48 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
Message-ID: <202512110422.5i4YTzGe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Duanqiang,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   31d0ea3bf1bd93e960f341e4da1ff033eacefab2
commit: 1439ad22f9e2ce50e978c5fb5726a3d8bf45b332 [3/3] anolis: net: add build support for ngbe
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110422.5i4YTzGe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110422.5i4YTzGe-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/userspace-api/ioasid.rst references a file that doesn't exist: Documentation/driver-api/ioasid.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/device_drivers/ethernet/wangxun/ngbe.rst
   Warning: arch/Kconfig references a file that doesn't exist: Documentation/unaligned-memory-access.txt
   Warning: arch/x86/Kconfig references a file that doesn't exist: Documentation/x86/user-interrupts.rst
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2  ./Documentation/ABI/testing/sysfs-bus-iio:396

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
