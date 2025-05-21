Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153B91E47A5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747839566; cv=none; b=GnDxhSsr2SiItUrmjLafGoBJFyjYEBwlBBiqSNa852iproZKug6fCL7AzNXnoStS1txWO5iWZH3VfyahEFE97ZhvV1HXSk0f2Nkp3/8UQqzn0T1yO/PN1abSTOZLVHGzhsPbYCn7C11JnjrELcUDPIpDKfZkYIWtRczvInOTCKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747839566; c=relaxed/simple;
	bh=m7cmVCSqjcLG4IPS/sMZzMw3J16rddM68QSB2nk9iLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uO/8nf5c9UFnU35wdzsi70VDpdBgmCSw2i9OqiqUJvlBZ0hf6uaGW6nQVU0DhpSwJ5+zar/6OXX7I7yXf1PoaBHtbW0paI2Xj8AB5VKX87fFOPtST44+++wZbuUHwQCclNJp98riXdrI04uLgf/88uXL3rKkKt5wZgSSG8fBQ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwCZDJFK; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwCZDJFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747839565; x=1779375565;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m7cmVCSqjcLG4IPS/sMZzMw3J16rddM68QSB2nk9iLk=;
  b=SwCZDJFKydzR0vdtrhE/Uri2gmw1FZWP2YWf84nwkrwst1cXYYBFUn86
   sHTZrtw9sTzeL9fZ6AeBRUb3+OqD3iO7EX4gzFR9hyensGiHVzvSoDOgo
   mxUtkT9PhNv/hULHk6QyyOh8cgftTOWj7F04FjJeupKq5eHwQQE6yqjTb
   LxAbTTB3lTcJv3dAtPKrLamrdmStrSOD9J+Ruzcz2mMyr3iHwk9zDxj8u
   XAk3vjsRco24UbIPW3nIHy6CIXHWCHvsPEAWCRBANKKzZdhr7uUcRj32e
   OnHcEcdIWrkj9Y6qOUQ+Bac1SA54nbkCWfVxFoZ/pPKgbTCPTwRjvEU5f
   w==;
X-CSE-ConnectionGUID: ra5rN3msQ7acNChdkhRuMw==
X-CSE-MsgGUID: xhUzQGFIQ32S06u+X9jq9A==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="60480109"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60480109"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 07:59:25 -0700
X-CSE-ConnectionGUID: XswB3h6JR+alfHKeyvBl7Q==
X-CSE-MsgGUID: TmwDqTPxSB6axvMQJ0G+hA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="141174371"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2025 07:59:24 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHkuf-000195-2D;
	Wed, 21 May 2025 14:59:21 +0000
Date: Wed, 21 May 2025 22:58:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-01 4/4]
 arch/arm64/boot/dts/ti/k3-am642-evm.dtb: syscon@43000000
 (ti,j721e-system-controller): 'mux-controller' does not match any of the
 regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$',
 '^mux-controller@[0-9a-f]+$', '^pinctrl-[0-9]+$', 'phy@[0-9a-f...
Message-ID: <202505212229.bfCC7elg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-01
head:   97728a1436424265258cd2b247753e19e79202d3
commit: f6a5b651144096bfccda41b62861a7dde87ec287 [4/4] arm64: dts: ti: k3: Fix epwm_tbclk node name to generic name
config: arm64-randconfig-2051-20250516 (https://download.01.org/0day-ci/archive/20250521/202505212229.bfCC7elg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250521/202505212229.bfCC7elg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505212229.bfCC7elg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: /bus@f4000/bus@4000000/pinctrl@4084000: failed to match any schema with compatible: ['pinctrl-single']
>> arch/arm64/boot/dts/ti/k3-am642-evm.dtb: syscon@43000000 (ti,j721e-system-controller): 'mux-controller' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', '^pinctrl-[0-9]+$', 'phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: /bus@f4000/pinctrl@f4000: failed to match any schema with compatible: ['pinctrl-single']
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: /bus@f4000/pinctrl@a40000: failed to match any schema with compatible: ['pinctrl-single']
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: tscadc@28001000 (ti,am654-tscadc): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,am3359-tscadc.yaml#
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: tscadc@28001000 (ti,am654-tscadc): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,am3359-tscadc.yaml#
   arch/arm64/boot/dts/ti/k3-am642-evm.dtb: adc (ti,am654-adc): 'ti,adc-channels' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/adc/ti,am3359-adc.yaml#
--
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: /bus@f4000/bus@4000000/pinctrl@4084000: failed to match any schema with compatible: ['pinctrl-single']
>> arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: syscon@43000000 (ti,j721e-system-controller): 'mux-controller' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', '^pinctrl-[0-9]+$', 'phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: /bus@f4000/pinctrl@f4000: failed to match any schema with compatible: ['pinctrl-single']
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: /bus@f4000/pinctrl@a40000: failed to match any schema with compatible: ['pinctrl-single']
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: tscadc@28001000 (ti,am654-tscadc): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,am3359-tscadc.yaml#
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: tscadc@28001000 (ti,am654-tscadc): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,am3359-tscadc.yaml#
   arch/arm64/boot/dts/ti/k3-am642-phyboard-electra-rdk.dtb: adc (ti,am654-adc): 'ti,adc-channels' is a required property
   	from schema $id: http://devicetree.org/schemas/iio/adc/ti,am3359-adc.yaml#
--
   arch/arm64/boot/dts/ti/k3-am642-sk.dtb: /bus@f4000/bus@4000000/pinctrl@4084000: failed to match any schema with compatible: ['pinctrl-single']
>> arch/arm64/boot/dts/ti/k3-am642-sk.dtb: syscon@43000000 (ti,j721e-system-controller): 'mux-controller' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', '^pinctrl-[0-9]+$', 'phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#
   arch/arm64/boot/dts/ti/k3-am642-sk.dtb: /bus@f4000/pinctrl@f4000: failed to match any schema with compatible: ['pinctrl-single']
   arch/arm64/boot/dts/ti/k3-am642-sk.dtb: /bus@f4000/pinctrl@a40000: failed to match any schema with compatible: ['pinctrl-single']
--
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: /bus@f4000/bus@4000000/pinctrl@4084000: failed to match any schema with compatible: ['pinctrl-single']
>> arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: syscon@43000000 (ti,j721e-system-controller): 'mux-controller' does not match any of the regexes: '^chipid@[0-9a-f]+$', '^clock-controller@[0-9a-f]+$', '^mux-controller@[0-9a-f]+$', '^pinctrl-[0-9]+$', 'phy@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/ti,j721e-system-controller.yaml#
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: /bus@f4000/pinctrl@f4000: failed to match any schema with compatible: ['pinctrl-single']
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: /bus@f4000/pinctrl@a40000: failed to match any schema with compatible: ['pinctrl-single']
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: tscadc@28001000 (ti,am654-tscadc): 'dmas' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,am3359-tscadc.yaml#
   arch/arm64/boot/dts/ti/k3-am642-tqma64xxl-mbax4xxl.dtb: tscadc@28001000 (ti,am654-tscadc): 'dma-names' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,am3359-tscadc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
