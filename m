Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A744307B0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 12:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790338949; cv=none; b=eYBqo2/9UhMirXoP2UJ3CtY5FCoM3wQR5o+q/yNBy/EzHLaZ1Fgz1iuYm9wBL7CycEsuLEw12Z/wVEipB4FsMFYJciwGV9vaQYJP7wgjCyJD1CSUJ0kQIoriyEWG3+/38dFZAyXMcgrLqvIs4gqqg88cCCv+lUE2SQsCO7XQbgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790338949; c=relaxed/simple;
	bh=k+DJU+D671PUPeNEB+WH37CMhLBylUDMUzqZckalLz0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Rza/W5a8w1rEt6q5ful1KRzqEwDAfqI4+VpHowCM13KuN0a/EOO5LkxbGbAU875GUzZc2FcHUrwBrwTAXcX9h/9LhJuZqoG2uM+ANV80LSxFcM8tACM45zu52UEMwgehWPjdj4qhVvWRipzz9AseiZ4oPZfkN9jd1NzQQoLst+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGc6iUK0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGc6iUK0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790338946; x=1821874946;
  h=date:from:to:cc:subject:message-id;
  bh=k+DJU+D671PUPeNEB+WH37CMhLBylUDMUzqZckalLz0=;
  b=XGc6iUK03DBfldLsUCl/Gni1QKFG+qCcN/cuXFv0S0DNFwAdD1uRHSzh
   I5hu4MxT/zHNB7Niz2onhb9CaLqfbuf5KU5EPlptyGQLDfYa8dMUtS2Gm
   nSRNHIyWfommluTaULrkZC+ti1joj5kdWB07fApMTkdMRy87g/qtEhX15
   wJMUUoC7uvaQDU6sBucFCKzrSK783jgTdym6CjVwYBkvtiFGmEsDpWZ8K
   c/032AxiA4VM1lrjhCSC4/f4Hajm7idItGiM8yzfJ2Koh0VpVd1QRo9fc
   h+D0+vWSo7VmXEZUEsipCj1jon991tBM1kU7AEMBd4VxdrfL5ruaorhg4
   A==;
X-CSE-ConnectionGUID: wSEw7MyqQsu+yiJjq8B+9w==
X-CSE-MsgGUID: EV2IF0jmT0ebV105Mg6s3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="93842371"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93842371"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 05:22:26 -0700
X-CSE-ConnectionGUID: r5O9aDqkT5GWBq1947kC3A==
X-CSE-MsgGUID: ZFSddkYLRc69kxInTRcfEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272901145"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 25 Sep 2026 05:22:23 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA4wX-000000000k6-3ni6;
	Fri, 25 Sep 2026 12:22:21 +0000
Date: Fri, 25 Sep 2026 14:21:32 +0200
From: kernel test robot <lkp@intel.com>
To: Pankaj Gupta <pankaj.gupta@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 6375/9480]
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dtb: ele-reserved
 (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges',
 'no-map', 'size' were unexpected)
Message-ID: <202609251430.hv1pV0fN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: 9e2427e8b17c549e0a06d2e6791a24e145d3917d [6375/9480] arm64: dts: imx8ulp: add reserved memory for EdgeLock Enclave
config: arm64-randconfig-2400-20260924 (https://download.01.org/0day-ci/archive/20260925/202609251430.hv1pV0fN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251430.hv1pV0fN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251430.hv1pV0fN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx8ulp-evk.dtb: ele-reserved (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'no-map', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/freescale/imx8ulp-evk.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/freescale/imx8ulp-evk.dtb: vdevbuffer@a8400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
--
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dtb: ele-reserved (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'no-map', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   arch/arm64/boot/dts/freescale/imx8ulp-9x9-evk.dtb: vdevbuffer@a8400000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
