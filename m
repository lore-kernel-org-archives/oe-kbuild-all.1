Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28E43473C67
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790245548; cv=none; b=HRdwFCU6K6b+Y13FjcCiGCo2x5pSCqrotr9CQAtIHnPSGEcOfj5kYV3LmZ1G9hOSkAn8Pyi9wEGtiayUS2rZUDSJ2ThZCbL9NZbw1hRN8KW9/HbERYnpYZmxAG+K3IusePRBDeITv05/wMh60TXC7abbhrlSk1Yci2yQIJKZXEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790245548; c=relaxed/simple;
	bh=TIFUfvmD613xJuu3PjTTiXKgbnl9qU3sX1uWJybPsK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LgitCzqqQmBrygJF6KlY3gIv51EXohyDEZAmXiWY3eBF2rPW98sR31TcdoMD3ppa/12IjiJHu5syUDgQO+fc/fk1ci9Zp5wL+pN5tQ2s7OnQOYFEvRu8LDLrQOcaeWZQeMVziLgOVp4ZoxJYCICBh2C6dOBMm6x7de+JkQ1zPQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8Vi1pNx; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8Vi1pNx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790245546; x=1821781546;
  h=date:from:to:cc:subject:message-id;
  bh=TIFUfvmD613xJuu3PjTTiXKgbnl9qU3sX1uWJybPsK0=;
  b=P8Vi1pNxkr7PDrB8dTBcIxsdIqvPRJ7vp9cn46h23dNW0Osf6thcJko3
   au2QJ5/kd7o3u5wPeH9O4xbb/y6B/N3iPB9gSrOJM6QWvnFIAjk49VMg0
   e+Ov4sk063o6pmlyF1QtjW1FyZtZXHWNRpztwkX36aLfwy/+VEpZYi11m
   305Z5fWhoewp5hOwSGh9cpXxnoFFKHyhcyDjo/JmLfvElcMs9wg4dD7i3
   oglRMUyx6TMmVvId0FhmQ4bSos3opdhuxMVdPNs4v94qmbCNQjRh3wJMW
   /E4RUNe/gepDIDbiKVknZDM3hjFpuIxYEjEjnkBFl2MLDW5W+cErAUgPK
   w==;
X-CSE-ConnectionGUID: DwW15FZiRCSGwuLLIbViYQ==
X-CSE-MsgGUID: IdXWH49rSeGawDMv0he/7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="93509842"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="93509842"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 03:25:45 -0700
X-CSE-ConnectionGUID: 4Z6kbfDSSoi1GskAE1aMSw==
X-CSE-MsgGUID: NWiv7SWtTVCQRJwgbyUzSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="274102428"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 24 Sep 2026 03:25:44 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9ge5-000000000Iw-3xSh;
	Thu, 24 Sep 2026 10:25:41 +0000
Date: Thu, 24 Sep 2026 12:25:25 +0200
From: kernel test robot <lkp@intel.com>
To: Joseph Guo <qijian.guo@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 1369/9480]
 arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: linux,cma (shared-dma-pool):
 Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size'
 were unexpected)
Message-ID: <202609241238.9lceqt7q-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   3d7783543c2646af69ad65825e810060494bea21
commit: cac63565a186028ed6c6564c277910cdfe592828 [1369/9480] arm64: dts: imx93: Add i.MX93 Wireless FRDM board support
config: arm64-randconfig-2400-20260921 (https://download.01.org/0day-ci/archive/20260924/202609241238.9lceqt7q-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241238.9lceqt7q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241238.9lceqt7q-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx93w-frdm.dtb: vdevbuffer@a4020000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
