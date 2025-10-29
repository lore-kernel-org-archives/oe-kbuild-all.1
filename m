Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C77522F546C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 04:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761711673; cv=none; b=Ye56qhtxATGkBvO/3aNBy3uq2JkiEAEjZwkknoZFvt4SfQTNm6mUAWo2pUZ++jS/HLzlI9IUZgUsJcYEzhGArue0oQhE4yT/TQQ2+y/p2mydQGxVV/fIzW8CvOTrBGlpQ2zrvu11dCPx+9jyiDdYn9vZS1zeinYiI6UV3gPZTzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761711673; c=relaxed/simple;
	bh=k92QA5za9+f78U5qrvozAswYIELUsEv9BnnrIg10L/I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nQj+BM+Vsq+Nfqb/C6EU2l32SARNPKTRQjxN+2/mUDTsE9JG+LsoGXtJ79tAJqdvchwuiX4yCx3Y43pHVRVQoM9NFRnBtz/Z3AC6GgXElz0LRkcdRbcP85+/CTUpqARsPucWTXszJYNbLLvuMgqvpw4Wxm7xYit6PGlMx4hbEtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QH+iAVFZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QH+iAVFZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761711672; x=1793247672;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k92QA5za9+f78U5qrvozAswYIELUsEv9BnnrIg10L/I=;
  b=QH+iAVFZnxAsHd6BRk/Igzl5em1tAelUC+v9SF6v37KzrbysANFxxBYc
   Z4Yocp9O+HMvQPHx2+46+u/6eM/eEzrEU5Xe3yV4Q84Wccl23iknsK+KZ
   SpntTuFLqASP2rC00bWuZugPZzKJ3picLx6LnWSy1f6Itl+RlyaeMPYh9
   c5mCB1JxgIAhsHtUgs5yebRWiwMkYsA4ucwRpjF6nurl/JPQvQA2S+oU/
   vS0PACKJ3AFH0i52hvYXTrXYUtcPfVBupFDzN0lglyLMN+ycVd8lX+41t
   Orvpk0ArbtP751GdTuyAmKGObp9XMZwUGxsYk+SttA8IbVB80QQnYnbfc
   w==;
X-CSE-ConnectionGUID: nkRTy5Y8QIGX9J0pGnj1wQ==
X-CSE-MsgGUID: pwvTCEp/ROGe6Bj/Ustjmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74941811"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="74941811"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 21:21:11 -0700
X-CSE-ConnectionGUID: zkABTT1EQqWwOKetxsdjCA==
X-CSE-MsgGUID: lHSFdfJrSdCTiq++m50U8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185177781"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 28 Oct 2025 21:21:09 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDxgJ-000000000s8-1a82;
	Wed, 29 Oct 2025 04:21:07 +0000
Date: Wed, 29 Oct 2025 05:20:58 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014d0
 (altr,pio-1.0): 'oneOf' conditional failed, one must be fixed:
Message-ID: <202510290539.UPoG7YbJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: 695f375b2a881544d112edbb60a35a884c7604ae dt-bindings: gpio: Convert altr,pio-1.0 to DT schema
date:   3 months ago
config: nios2-randconfig-2052-20251024 (https://download.01.org/0day-ci/archive/20251029/202510290539.UPoG7YbJ-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290539.UPoG7YbJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290539.UPoG7YbJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names:3: 's1' was expected
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): reg-names: ['control_port', 'rx_csr', 'rx_desc', 'rx_resp', 'tx_csr', 'tx_desc'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): compatible: ['altr,tse-msgdma-1.0', 'altr,tse-1.0'] is too long
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: ethernet@400 (altr,tse-msgdma-1.0): Unevaluated properties are not allowed ('altr,enable-hash', 'altr,enable-sup-addr' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/altr,tse.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/clock@0: failed to match any schema with compatible: ['altr,pll-1.0']
   arch/nios2/boot/dts/10m50_devboard.dtb: /sopc@0/clock@1: failed to match any schema with compatible: ['altr,pll-1.0']
>> arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014d0 (altr,pio-1.0): 'oneOf' conditional failed, one must be fixed:
   	'interrupts' is a required property
   	'interrupts-extended' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014d0 (altr,pio-1.0): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014d0 (altr,pio-1.0): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014c0 (altr,pio-1.0): 'edge_type', 'level_trigger' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014c0 (altr,pio-1.0): 'interrupt-controller' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml
>> arch/nios2/boot/dts/10m50_devboard.dtb: gpio@180014c0 (altr,pio-1.0): '#interrupt-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/gpio/altr-pio-1.0.yaml
   arch/nios2/boot/dts/10m50_devboard.dtb: leds (gpio-leds): 'fpga0', 'fpga1', 'fpga2', 'fpga3' do not match any of the regexes: '(^led-[0-9a-f]$|led)', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/leds/leds-gpio.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
