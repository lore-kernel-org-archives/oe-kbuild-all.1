Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38893C3C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 17:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726679735; cv=none; b=RKW7nXNrV69OhtylKN76og1T/brCyxham96sTzXsjnMyRkwT0esHIBD2Eygb7BHWQIpoOYfXiZqxLDyNoo+BvCD0bSrVUXdXM1Y8mBHsi9paLJdPM9PmTiAVMrxz1Ja8eR1ng/9ahuW3YVeBzVGwqJ6Ab1onm1NupUI6IXd/lzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726679735; c=relaxed/simple;
	bh=x7aRgwJ2//h5TfeqVnfoZ91gMzfObH5PY5AyYY3uCpI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WMRfiXzxTpfd/cmvunC7MTL23pvMnOGUKW49THu0+rweRqn4XA9z2iAJdtRCXZsutRWSY5GrormeTi9o1eUtzjRmbMKI2kB8a9AJpy7pNeFjmatU31itQPTZ0LCTaUS+vuFAOU4a7x2OfCI5jX0IEAXXiNZf33a4I+3Z2ps/5I0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RKZfOCIW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RKZfOCIW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726679734; x=1758215734;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x7aRgwJ2//h5TfeqVnfoZ91gMzfObH5PY5AyYY3uCpI=;
  b=RKZfOCIWOq/4Wm7IZzFOEJOxTryjLwLjQQwtsAoyceCIQYScr5Inl85w
   QZDGBQEgXYO9cX4zbyICg03/3JWXL66Kpbi/p4botS93yM0vX2Bm2Ta2f
   EetBZgGXtBpdhZcCSrgMxhRiGpNjoql/IW+A9DyWlrIeOEt9w1M3KpvPw
   WMXU3DudvvOvbgjxb4OfjKKscfpzaV1K+Zi0LMLK6sTCF2MoMjXmwv94T
   XP4FvMknn2dzqGh1ucdqRDF9+F7sAvYIl8Y1xUzYeguF58UkVGYS3Qki6
   K1V8untZ+M/cPnkih4xpTh/hj0hWuEJM/W7mtZ1+HCGuIz5aTqyYjarEF
   g==;
X-CSE-ConnectionGUID: ITG8+As0SkSjEIKVHAriJA==
X-CSE-MsgGUID: zPXvBDKLRkeH1OlAEQx8pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36181104"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="36181104"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 10:15:33 -0700
X-CSE-ConnectionGUID: eUY8FjTgQcy6toaGvWXmvg==
X-CSE-MsgGUID: BLF4Vh2SS3WkMHrp6RxfhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="69669648"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 18 Sep 2024 10:15:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqyH4-000CRq-0I;
	Wed, 18 Sep 2024 17:15:30 +0000
Date: Thu, 19 Sep 2024 01:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.11/bbr3 1/1] ERROR: modpost: "__udivdi3"
 [net/ipv4/tcp_bbr.ko] undefined!
Message-ID: <202409190125.diRl2oBz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.11/bbr3
head:   366d1965ffbae499c55086e05ea2b4c0b14aecea
commit: 366d1965ffbae499c55086e05ea2b4c0b14aecea [1/1] tcp/bbr3: initial import
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240919/202409190125.diRl2oBz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190125.diRl2oBz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190125.diRl2oBz-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

WARNING: modpost: missing MODULE_DESCRIPTION() in arch/x86/mm/testmmiotrace.o
WARNING: modpost: missing MODULE_DESCRIPTION() in kernel/locking/test-ww_mutex.o
WARNING: modpost: missing MODULE_DESCRIPTION() in lib/test_objpool.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/mxc-clk.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/clk/imx/clk-imxrt1050.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_simpleondemand.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_performance.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_powersave.o
WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/devfreq/governor_userspace.o
>> ERROR: modpost: "__udivdi3" [net/ipv4/tcp_bbr.ko] undefined!
>> ERROR: modpost: "__divdi3" [net/ipv4/tcp_bbr.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
