Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48AE61CAB3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Dec 2023 05:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rv8bRApj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702273965; x=1733809965;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=apRhbBtWylsRsKg9+sNqn0hkgd56ZBH9pT4jstKjUAY=;
  b=Rv8bRApj19s5PRIKFgYFXvkQc++Th45VRCvjviFkhDa/tTdjQgeqoahc
   8mTcBCmSmCnFFRMlJJIHQE386NkPZ2d9DisfOjGmDaULfJ/lfG5ljiVJn
   BlesP2FAo/fYKwxutY4dIvTV+oEPaXge+1iEnBhvqVz5aELwEVebcDEO3
   msqVpztbQ2XJnu+g9/i+aH3BZoWd6QyUDPO10QIPL1+utfAZgXWdo163+
   Tl7MzZ6n+1zFejT7ycCd7u7MfyQkHjP/bBYmO8UdyN2dVyxZ6TdY94PRU
   RGlUqgQEaR8o2wGslzaFuF1BuJswn7qXimZEAt90cu/4WT1hAq9nui4c2
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1713895"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="1713895"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 21:52:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="776538521"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; 
   d="scan'208";a="776538521"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 10 Dec 2023 21:52:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCZDc-000Hge-15;
	Mon, 11 Dec 2023 05:52:40 +0000
Date: Mon, 11 Dec 2023 13:52:22 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-r4-dango 4/29] dtbs_check:
 Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml: address:
 missing type definition
Message-ID: <202312111325.SO5xEECY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-r4-dango
head:   51d4eefd9d760a0847c6aacddebb7ede142e7710
commit: 964096b24ee5468dae043dd6f910ef33469012ad [4/29] dt-bindings: mt76: support setting per-band MAC address
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231211/202312111325.SO5xEECY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312111325.SO5xEECY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   Documentation/devicetree/bindings/sound/audio-graph-port.yaml: convert-sample-format: missing type definition
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias: missing type definition
   Documentation/devicetree/bindings/serial/8250_omap.yaml: rs485-rts-active-high: missing type definition
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: mac-mode: missing type definition
>> Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml: address: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-even-pixels: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
