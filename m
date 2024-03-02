Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421D9110A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Mar 2024 03:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709350693; cv=none; b=twVUby4r3MYW+0vW4TvVdNvvd4Ctl6CcA8IUiPrI6cDhsqAXEIgCgIj6ygbo4KQVteH2nldyUowCb5fePRhZyCTajXAIVVlic4ddGJVEBXQRlzoPlqQ3x++RQJoBrsHC7m5N4kTbZnl1nvdX6MVrqV2AU9Uwv/wD9FwuaG1JcQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709350693; c=relaxed/simple;
	bh=mGLEtAXayf78wGlP0FIvr3DQ327PhCZnsD1TsSEr0OM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Li4GN5dlkDK7/y/+QPbYS9KtcW5+0gEbDO57BZURIZTOJ9carTZXRfvYNiTxzJ9a1C5VIHa+b8rl993qXVcHjxEA0mKAx29pvXC9xlGGsOLjXpnNH/mflXFTdIFdl2O2Rsze4fm3onxblTncRJlt6e9Q/RdWAvXd1LTq0bhI7hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lDhGLJC9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lDhGLJC9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709350691; x=1740886691;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mGLEtAXayf78wGlP0FIvr3DQ327PhCZnsD1TsSEr0OM=;
  b=lDhGLJC9rjyxClmmHpI3UHRf8oKFWt6E6G5moaISHg95jnV2cUBXY6Cs
   zeX72fz10umKT18ThTXwnUnmI6zh6hsokKQrzQUOYZm1i1/4crXEA2xzy
   s5Q47zMYR4Vdb6pqmz9gyRvW3PF1+rJCxnt6jNyIzx5An5zD8tY4U7yUJ
   UyKkhyCl6LAn6qDd4DP5JMJAj+e4l2Hvs79FIaVAGKHR8WB+Acrgz1wDo
   +wmCsXStYzJK32fWpnH6CVp2e/27UyY6/Hp6JXW/v/4Xt3/oBr0WV+k3B
   /N9+AMXHaQytDiG5I9rxVz3x6/CIfAesgzNCiiYP0w886f4uIO0Z3iQ+0
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11000"; a="14483615"
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="14483615"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2024 19:38:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,199,1705392000"; 
   d="scan'208";a="31567659"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 01 Mar 2024 19:38:07 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgGCL-000EHp-0f;
	Sat, 02 Mar 2024 03:38:05 +0000
Date: Sat, 2 Mar 2024 11:37:44 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: htmldocs: Warning: drivers/crypto/hisilicon/uacce/Kconfig references
 a file that doesn't exist: Documentation/warpdrive/warpdrive.rst
Message-ID: <202403021131.IZmWTFc7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 7274937282a3c591eb292c7bf267b25abf4d4a52 driver: update hisilicon hardware crypto engine
date:   1 year, 2 months ago
reproduce: (https://download.01.org/0day-ci/archive/20240302/202403021131.IZmWTFc7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403021131.IZmWTFc7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: MAINTAINERS references a file that doesn't exist: Documentation/networking/j1939.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/rng/samsung,exynos5250-trng.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/input/sun4i-lradc-keys.txt
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/misc-devices/xilinx_sdfec.rst
   Warning: dist/templates/kernel.template.spec references a file that doesn't exist: linux-%%{kernel_unamer}/tools/perf/Documentation/examples.txt
>> Warning: drivers/crypto/hisilicon/uacce/Kconfig references a file that doesn't exist: Documentation/warpdrive/warpdrive.rst
   Warning: drivers/media/v4l2-core/v4l2-fwnode.c references a file that doesn't exist: Documentation/acpi/dsd
   Warning: drivers/net/ethernet/faraday/ftgmac100.c references a file that doesn't exist: Documentation/networking/phy.txt
   Warning: drivers/net/ethernet/pensando/ionic/ionic_if.h references a file that doesn't exist: Documentation/networking/checksum-
   Warning: fs/cifs/cifsfs.c references a file that doesn't exist: Documentation/workqueue.txt
   Warning: lib/Kconfig.debug references a file that doesn't exist: Documentation/dev-tools/kunit/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
