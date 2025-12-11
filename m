Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AD41990C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 04:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765427141; cv=none; b=uD5SppTAq9wCAo5Zjlc6xJYCbFlXDd91xEDPBh+4a5tW1CDZ5Ubn2JWZKqxH9vjYlu/f5yk0Qeq1yGT5ct2rvIzzqGbgQKuQvJNj8T7rLy3ue3e5DiUbQAt9crEwPyGWulbC/sJr4pq5Etqre1rmSAzUJotXEkzOSPKAShaIeLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765427141; c=relaxed/simple;
	bh=5b912LQMjI9HcsLyEKXPJZcKLytEwXeJGZDrYdhFMZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MxWHnojkvQMZfKcjvgxJ3nkpgcEONCZ9trUujeTsWbtDvIettYeHMVpzs5w4wMgHUWdvMoZBAsRS9KxTG7pyJzN6afD2LwBbJeJhC+h+6IsFWp+tBko2HnC8xIhd7HBBkSf5un6DGrW2/zd+7gLJ1pGdhH/lUa7cAqiSg5P25b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y5XSisGQ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y5XSisGQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765427140; x=1796963140;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5b912LQMjI9HcsLyEKXPJZcKLytEwXeJGZDrYdhFMZ4=;
  b=Y5XSisGQk+1tnAnORn4+rVU0b+Tbs3DQnZy+WrR3szzPkJcHx21bQmm9
   Xb+mQN9PalaVO6FLmAc8UwobgAuGdTOEAIereeiM2xoQt2/BIqO/DjVKY
   2Z988IOzfbYtSjsvsJitIutqwa8A5e/61LyaaYxafDxBaKh2OTDp8ji8q
   HfqUyPRr6zceD9V4ueawgmInkR76MBgCjEL4ynZPA3fzce9SOxVyBRWwQ
   Vlz0INhwsrI5gVAywHQZxzjWaRBn8ZIY7340tRuoooQONyREk0N0QU1gk
   1s/ylGsC7kX6uDO3Oj3mvPiSfSfiAlo8mzsZELgrcCTWbmDo2gE8y/FA0
   w==;
X-CSE-ConnectionGUID: wfwdpkaMTGaBR3ofS2LUgg==
X-CSE-MsgGUID: 6qw6A1M5QL+XPngTyLDXWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="78023563"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="78023563"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 20:25:39 -0800
X-CSE-ConnectionGUID: WLAHdyUPTrObZKlTnGMkaQ==
X-CSE-MsgGUID: bJcLsfcbTG+YnYMzZKDJkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="195780447"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 10 Dec 2025 20:25:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTYFE-000000000uC-1McN;
	Thu, 11 Dec 2025 04:25:36 +0000
Date: Thu, 11 Dec 2025 05:24:46 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] htmldocs: Warning:
 anolis/changelog/000-changelog.base references a file that doesn't exist:
 Documentation/filesystem/dax
Message-ID: <202512110519.ybqpH9sh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qiao,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   31d0ea3bf1bd93e960f341e4da1ff033eacefab2
commit: 88f66936c77127ed35d2e026e9a7bedf16385ff0 [3/3] anolis: spec: add script to generate kernel changelogs
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110519.ybqpH9sh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110519.ybqpH9sh-lkp@intel.com/

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
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_x_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:0  ./Documentation/ABI/testing/sysfs-bus-iio:394
   Warning: /sys/bus/iio/devices/iio:deviceX/in_accel_y_calibbias is defined 2 times:  ./Documentation/ABI/testing/sysfs-bus-iio-icm42600:1  ./Documentation/ABI/testing/sysfs-bus-iio:395

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
