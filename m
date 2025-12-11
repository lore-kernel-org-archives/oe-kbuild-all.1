Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1B128F5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 04:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765428222; cv=none; b=hmwTbzFAEb1WGagTV8tD/3pka/04vkjhnTkDnzXxl5Wm+YXJH7amhCn3Jp7Lb7+kKFhj0UQ80yLT5oxzTmz+29FvT2nSdHLEGh2B/1GC43yUyqoUAWnxC+bcSXB/XWo1YVExBlvXxftvrPXjC+cc+aG2cjNWx8Ot4seF636dREs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765428222; c=relaxed/simple;
	bh=pt15rKh7l2kQlaR/ESa3fi496EW1a+rriz9TnSL0U60=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HuSJ/FV2IVfzr0lnx6CklyfHhEgrV6SXYDacEUXm8ipY5pq6HTvXVCgBAuxyU1qnXTt6ykyV7wQuTN+/kBe1O0VRqXC6uB2a2f6YSNlJRhhsTsnHMyURwv3uQzIBYJ23CumIRnN9gSVC2H6k1I5MgX2BThud0kuWDKQ3AfXyeyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mHaK5oaY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mHaK5oaY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765428220; x=1796964220;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pt15rKh7l2kQlaR/ESa3fi496EW1a+rriz9TnSL0U60=;
  b=mHaK5oaYlf871D+8wJNTS3er7RbfgwXJ17tlTyfMH9Kyei1+6UJEt0QD
   o8aTaAZdXGwJ6181b2yizeBeC0NP4Pa9LiKmWcTy45+R64qO+TqJNzGuU
   jxAHavbpMFeDcX1nuqjPKG5yx5TgUDszzDpQj29TcmkSJRoghfh0MoPVh
   st3smcvhqRfk/7+ZQ7dss+DBJsbFXBQUic680XsUVpIBIZxQFRT3i7W6R
   LOeKHJ935nATfo+mQuPDPuPKqacpOl/QHweyNvCa2ObDTRpBG6uRXptvy
   4ZuxZ99Hsl1kRHoPT/+TA705+QuvyoyvjwgWB/4Y+1YhVfFxEKjV1R2nS
   A==;
X-CSE-ConnectionGUID: l1AH8DbQRNGmWqnxcwD01w==
X-CSE-MsgGUID: Y4LVlfMKTYuxZqJuU6NdkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67365819"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67365819"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 20:43:39 -0800
X-CSE-ConnectionGUID: LKii14O3T3WUB/b9YMytww==
X-CSE-MsgGUID: Eo6nkurhTv6KQujS9tFiGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="234116325"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 Dec 2025 20:43:38 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTYWe-000000000ua-2XMd;
	Thu, 11 Dec 2025 04:43:36 +0000
Date: Thu, 11 Dec 2025 05:42:52 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3] htmldocs: Warning:
 anolis/changelog/changelog.5.10.134-17 references a file that doesn't exist:
 Documentation/dax
Message-ID: <202512110529.Gb1xrH9y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Qinyun,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   31d0ea3bf1bd93e960f341e4da1ff033eacefab2
commit: fe8f11ee359281843344fa5de03bb89360319831 [3/3] anolis: sync changelog from release branch.
reproduce: (https://download.01.org/0day-ci/archive/20251211/202512110529.Gb1xrH9y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512110529.Gb1xrH9y-lkp@intel.com/

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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
