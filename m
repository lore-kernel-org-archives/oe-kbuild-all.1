Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B49E492E37
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 10:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790332128; cv=none; b=P4m+bLtEyMqxw4Tzez6+Sj7eoD2R28/CoZJLu0SBW1mpherJW6zw6zjJ1A0urlFpXo9Rh4yN/I8wECTH218U57LYWR16VhfueUlTk8mDrTdIN8s2wr9YPeoEJ/sqJvckSo9QS24X3T16No0pCgoAcACpelbo883n8X4FHoDwllc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790332128; c=relaxed/simple;
	bh=BkXM90UP0d+8SfdIwmn2TmlO6u9o7AG3TUiQWoeilAE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=CJEWSUAqiOPx9ZhB9AsLc/Nu0PjkMQPd5SRY34Uvc21ttqX0AxLNgaYaQPNcyexmJoccgp1vwJyW6lFnwe7PjyYx9s22BE3iAFUbTiR4N6krclozYFrtEQx0ksY8ZDtpWS56M2ZI7Rv01gTymvxsQNd+lAcAhyGdOHYsvibG+Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAoWCKX1; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAoWCKX1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790332126; x=1821868126;
  h=date:from:to:cc:subject:message-id;
  bh=BkXM90UP0d+8SfdIwmn2TmlO6u9o7AG3TUiQWoeilAE=;
  b=SAoWCKX1Ex23jGV/VeH/uGIMAjny/cqLt8mLQsabNu8brdRY0bCqGTrz
   nuk8l9iw1UydxwoRUv9CgaPFWvb4xuqgN+nBO6NGSJZaMWFoA2Dw7jrw5
   uliOm1pR97Lq/HxThhSJQwNyGxOLXxkKFr++q0x9akf+V+JimkYWuoEND
   4w0PWbjlA55b5m/64U9+S+8oDoHrZ08Cpsvqp+zZ7v11kfnTMqDKy8+Nl
   1i/NlD6vycagU2tUH3hifDBPfHfOLuZhlRZ7HSPtE2HCQkaKmnH3RfoIy
   NMDWVmP35r2+HtLZXx1cvhlfsDkyPK3LNtDsrzig4AWWQvkwC8rxC2y9u
   Q==;
X-CSE-ConnectionGUID: Y3KScCDHRjqiZdgUBsdAsA==
X-CSE-MsgGUID: dW4/crJwQvSACzv2lnrCYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="108605687"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="108605687"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:28:43 -0700
X-CSE-ConnectionGUID: pciXBLnySzKD6sHCSk/WTw==
X-CSE-MsgGUID: Kalb5+hhR/mvXoWf8iPFyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="273392781"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 25 Sep 2026 03:28:42 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA3AV-000000000gE-0DHs;
	Fri, 25 Sep 2026 10:28:39 +0000
Date: Fri, 25 Sep 2026 12:27:56 +0200
From: kernel test robot <lkp@intel.com>
To: Antoine Gouby <antoine.gouby@toradex.com>
Cc: oe-kbuild-all@lists.linux.dev, Frank Li <Frank.Li@nxp.com>,
 Franz Schnyder <franz.schnyder@toradex.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>
Subject: [linux-next:master 8888/10113]
 arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: linux,cma
 (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges',
 'reusable', 'size' were unexpected)
Message-ID: <202609251222.vNCTmB8N-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4c253ac4b29b8c6cc6fdef8f92d4facde62e63b9
commit: 39be5a7e3ecc08098c039561237499aa595700da [8888/10113] arm64: dts: freescale: Add Toradex OSM iMX95
config: arm64-randconfig-2403-20260924 (https://download.01.org/0day-ci/archive/20260925/202609251222.vNCTmB8N-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
dtschema: 2026.10.dev2+g840a01d41
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251222.vNCTmB8N-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251222.vNCTmB8N-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95.dtsi:1878.16-1907.5: Warning (unit_address_vs_reg): /soc/bus@4c100000: node has a unit name, but no reg or ranges property
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: linux,cma (shared-dma-pool): Unevaluated properties are not allowed ('alloc-ranges', 'reusable', 'size' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml
>> arch/arm64/boot/dts/freescale/imx95-toradex-osm-dev.dtb: vdev0buffer@88020000 (shared-dma-pool): Unevaluated properties are not allowed ('no-map', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
