Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9542EB5A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 02:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761705611; cv=none; b=PfandO/8aTRo8ijh3t7NSrVII5MI2q29q8bAlM/mYsKo0G4rwnsWge2rFxy9ejyxzI0aEvI4MYgLgF1rky+t6LCZZ4K3fWy10zUJUaYcgJvAHxUiqdY5bJTudM1vTHo1ILsFuHFwwpoFK42B1nDMa0TL7dj3RarSTze/aeaMZcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761705611; c=relaxed/simple;
	bh=fIZPZYZs/rm37v803xZTD0jFvsMmnTr7uh880Iv/ln0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hzpKwrc2bqzbjZrtLqgaIIZrKoW6mtC+2pYsjQSbhtIN+8eYPCtRckYKouAN20DM2mxs5ftTCqSmJbzFfGinBXWDhgzIWIUQYKd4Ru9yldh//ApMglDn0uGyw6JmvwE8IctRPlwARRjw9Rpf+v40FBCx1HZYIFWELaTOo1MtEwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HZE1X9+B; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HZE1X9+B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761705610; x=1793241610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fIZPZYZs/rm37v803xZTD0jFvsMmnTr7uh880Iv/ln0=;
  b=HZE1X9+BMaS9AmDiRi5NzerWUjyEDPas9NuiWAAqRsaawmx0ek0QEKvd
   OiCvt6ipZrmGgaRNwFMqFFK+dT1OKSjsMWgX8yNQO4eVn3wzlOAKpHebz
   G6R5NDm5leap4a2uLO7umLU6FPXmkyg8EbpgrR8l6fAwmbGcTjJkVOdsX
   j3lw4ks+19Kkeky0cDqb5A2MM4kWurMZaosEIdYNfVX3U3uakXlmm1L0w
   qaC5SFYOP1DdOgwFNetT6mMiLTLeIS+QOsMyrUMZ+c+I5knIztVj0fIuA
   ydlLBDGc/1ihL9PshRonp1/V6p/qde4HqSV/tp4uEy2SJQ6+WVeBpfGUR
   g==;
X-CSE-ConnectionGUID: DoJYMJ5LTtSlSyBk/l7qog==
X-CSE-MsgGUID: ISXCe1s1Tq6rGb9K8vW0lg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63703748"
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="63703748"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 19:40:09 -0700
X-CSE-ConnectionGUID: pm2WTr15QlOIs1jHqSSi/g==
X-CSE-MsgGUID: R6VVUrEzSZmgcetDSqzhsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,262,1754982000"; 
   d="scan'208";a="184713233"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 28 Oct 2025 19:40:08 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDw6X-000000000q4-2Owd;
	Wed, 29 Oct 2025 02:40:05 +0000
Date: Wed, 29 Oct 2025 03:39:37 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/8] htmldocs: Warning:
 drivers/md/Kconfig references a file that doesn't exist:
 file:Documentation/block/dm-user.rst
Message-ID: <202510290315.JzqNwXjP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   9cd5a2dcdbdc22c5c995c0c0416a33660ab54fe1
commit: 83bf345abc0bc06b98e906bfbb120a52446e1c43 [0/8] ANDROID: dm: dm-user: New target that proxies BIOs to userspace
reproduce: (https://download.01.org/0day-ci/archive/20251029/202510290315.JzqNwXjP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290315.JzqNwXjP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/arm/booting.rst references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: Documentation/devicetree/bindings/regulator/rohm,bd9576-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/rohm,bd9576-pmic.yaml
   Warning: Documentation/translations/zh_CN/arm/Booting references a file that doesn't exist: Documentation/devicetree/booting-without-of.rst
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/pinctrl/toshiba,tmpv7700-pinctrl.yaml
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/misc/hisilicon-hikey-usb.yaml
>> Warning: drivers/md/Kconfig references a file that doesn't exist: file:Documentation/block/dm-user.rst
   Warning: include/uapi/linux/dm-user.h references a file that doesn't exist: Documentation/block/dm-user.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:394  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:395  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_z_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio:396  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:2

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
