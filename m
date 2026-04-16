Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727C140DFDF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 00:35:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776299734; cv=none; b=GGIriN5UOuo1saTy/JdOqC/UW0jATydgBLLRQtUJ7Y8h7RkJc4qlGr5KCYBsUxgggBmgY/yNbT7iT4kVeTxqw6fvdhhwT702JThL/y8q5j2q+Cyx1QiV/lU+kwmiWbKgIUN0xTLtlq3HZ/LQXcvdcxgOB31wyLLpXyj1jXm9+zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776299734; c=relaxed/simple;
	bh=x2F+AEi+ywWwPFLp7W3TIZpfbtMyDI+xHXXgbNrtFCs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZNXN3QEitIddw5u6kYURL8gIG24p7ymhpaXx/0U9AAgsYod6BTubNqTbXmpEN6fcmwRIcP0+amS6zPm/1afTo+WRfbVtNYI+78tcgos4h5L/t99goZZiMO4jLPKAi9mfTOh496WOHwRKDhLElbvbZFIOQ2SZdfglmqDEjVG8rq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YX0L1+T/; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YX0L1+T/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776299732; x=1807835732;
  h=date:from:to:cc:subject:message-id;
  bh=x2F+AEi+ywWwPFLp7W3TIZpfbtMyDI+xHXXgbNrtFCs=;
  b=YX0L1+T/Uew0JtbR5IqNTyfHms4HZRyRwTnKI2Wp0hnvsS9UqEqeLY3P
   bd3aP+SpwlKu6PyI7xgqofzetqrNAe3fIl3G64IH7ZEzxpWg0Xbngve+A
   Zt2UgTOAUwgpVF+lGxqKHJMVJL8rARY7coNLZs/MKeUH7iHpzp5BlYVhi
   ocHxidSohIvxyyQUtXF590fnS/+VGUeGG5z0ixCXTwiFaWvDcMWGYrKYD
   Oe/UrAzHHWctS7ZDvqLXGmPnRgMXIV3pqXJ98DxeWBE7eYDkEwJsy3PGn
   EGZq5Xw442INEu9MPzuP04i7hcgvJeUiWb+ly0Mmi3W2ZLgLAisvoB5go
   A==;
X-CSE-ConnectionGUID: +dCIb15HSe6mrOu9HXBXiQ==
X-CSE-MsgGUID: un/43OMASui4RModt//P3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="88672685"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="88672685"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 17:35:31 -0700
X-CSE-ConnectionGUID: m91ojH5XTp6lv0I2lxwzMA==
X-CSE-MsgGUID: h2ExR/RBRdO/R9/kS5Q8PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="230420792"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 15 Apr 2026 17:35:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDAha-000000000sr-3vSi;
	Thu, 16 Apr 2026 00:35:26 +0000
Date: Thu, 16 Apr 2026 02:34:33 +0200
From: kernel test robot <lkp@intel.com>
To: Robin Murphy <robin.murphy@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Heiko Stuebner <heiko@sntech.de>
Subject: [linux-next:master 501/13951]
 arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtb: typec-portc@22
 (fcs,fusb302): 'connector' is a required property
Message-ID: <202604160254.eTvhtKq6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   936c21068d7ade00325e40d82bfd2f3f29d9f659
commit: 25afddad23b8e91fcff625756e51a805e288ab38 [501/13951] arm64: dts: rockchip: Add overlay for FriendlyElec HD702E
config: arm64-randconfig-2054-20260415 (https://download.01.org/0day-ci/archive/20260416/202604160254.eTvhtKq6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260416/202604160254.eTvhtKq6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160254.eTvhtKq6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4-hd702e.dtb: typec-portc@22 (fcs,fusb302): 'connector' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/fcs,fusb302.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
