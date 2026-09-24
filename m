Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930AC483824
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 21:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790286710; cv=none; b=b/8YPVVJVYefjdipAEhT/p/hTJsjzEk6UKhXsE/VuUlNgb+Nw9q9QWwqQy+ubb0kRfbWlM7EPRlnRdeUXAw6mdGHP748SF+ylebdtAw8CUoc6XluO6L35pXQUcyRZakH9Z8VKfgT362EgAtdi7sJ4M7+FlPmhxRqqJiQBEubSbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790286710; c=relaxed/simple;
	bh=m36/7Z2QaYe6gaMMbvNa6aijZD7ifGL3+8dsevKHWno=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kUarw0fmOEZe/CPatFxBQUkhEcgvNj1XM6vikUjjO7md372lvBnXgpnr3sxRZZBYYdasA9vW7B+SsVbEifUkypsmwx/rSF7gH5NXaSTnU+Ffi3kU6/j3CuqvxD/fs0dxFpyjs4drg4q7/qypV6/OQqIRoGUWTTHIK5o+0FeMEaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ie+4RA0Y; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ie+4RA0Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790286708; x=1821822708;
  h=date:from:to:cc:subject:message-id;
  bh=m36/7Z2QaYe6gaMMbvNa6aijZD7ifGL3+8dsevKHWno=;
  b=ie+4RA0YGUQf1CDK5yl2cglLsHbjuu98ynBLbUw0iX8fV4BuoAd4OQWT
   3MpK9zwBcsSwFTVJ8FAH5PtMlYUyvvtJdgrgEf06+BYMLURcLjpe7r408
   BJ9muTFnua84URdf6GHlZC2y4lX2p1RcuZdbWTir0/HEEHk2nwmiCZBcU
   KjNNWDbeTKGPLlntVu9Usb8PNtwgXqMLBsbkyztwCmxq2zpnVW+lBgdIV
   ADrwPQl81envSBQk+ljrLVTs6Ub9BcKg0ZchcMRyfC+aBmc1Qsl1RmmuS
   UXDV7Vs5KY9eE8M+scfpbleW6AHkMEJhnOdP7tGangt86oPsB8GLBDOpY
   g==;
X-CSE-ConnectionGUID: LjSvcQl2SCqJPqhr1ZCR5Q==
X-CSE-MsgGUID: 21jtBxnMTPuwWMQ5fqSXpA==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93792978"
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="93792978"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 14:51:48 -0700
X-CSE-ConnectionGUID: c9RDVzaYRKyo1XSR5TRJWQ==
X-CSE-MsgGUID: 3yl3ZeqJSsqsw/fG5sW7SQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,121,1787036400"; 
   d="scan'208";a="277323038"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2026 14:51:47 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9rLz-000000000Ra-2okW;
	Thu, 24 Sep 2026 21:51:43 +0000
Date: Thu, 24 Sep 2026 23:51:26 +0200
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marex@nabladev.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 1377/10113]
 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb:
 vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not
 allowed ('no-map', 'reg' were unexpected)
Message-ID: <202609242346.uHgavXq7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: 9a14f327dfcbbb0fa24974cb3a928ea3d7409768 [1377/10113] arm64: dts: imx8mm: imx8mp: Add CM DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260924/202609242346.uHgavXq7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609242346.uHgavXq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609242346.uHgavXq7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-cm4.dtb: vdev0buffer@b8400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-cm7.dtb: vdev0buffer@55400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
