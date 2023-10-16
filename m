Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2748273EB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 17:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A/yjx1NL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697478375; x=1729014375;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IjelRbuMEvSbi1Hzfp8xXKJCYT5JEo3WEXyemy3iXIc=;
  b=A/yjx1NLur01jSgMBluKirdt95LbBjopWpJSiioo8QhPRSMUnOkQt0XX
   0VvluKCfRoct8KcvvdIgixRwre/oVgpGwgTQfcU6eMiRP7/4NSlhU8x//
   X77ll6Cy8+Ji9/vqCH0BL7viTaiOsnt3K6ZTsPjMi6tWR+CcKfailbcRo
   /bJh3vEyGGJMaf2An8zAVA0SNz/xBGxqu05xnzhGHSaYfOTbDhs79fkvU
   N9A4zryVWjzQcaZsv7xQjeVUyr6gFPmGjxYZF+UBTYIS0pmLE5Ew/Z6B7
   Vg3iNxonHJYvujxtjSGZi1vxU7cuJ3c10Z4RVrg5FfJQZXWHbJfwpNSLd
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="384470040"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="384470040"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 10:46:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="879502141"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; 
   d="scan'208";a="879502141"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Oct 2023 10:46:13 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsRfP-0008YB-1f;
	Mon, 16 Oct 2023 17:46:11 +0000
Date: Tue, 17 Oct 2023 01:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 605/15768] dtbs_check:
 Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml: title: 'NXP
 i.MX8ULP Clock Control Module Binding' should not be valid under {'pattern':
 '([Bb]inding| [Ss]chema)'}
Message-ID: <202310170157.niwQrNvi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 2618e6b323504e84d0149ff8e2070691a7631e31 [605/15768] dt-bindings: clock: Add imx8ulp clock support
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310170157.niwQrNvi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310170157.niwQrNvi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   		[1, 1] is not of type 'string'
   		hint: "enum" must be an array of either integers or strings
   		from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/dma/st,stm32-dmamux.yaml: title: 'STMicroelectronics STM32 DMA MUX (DMA request router) bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/usb/faraday,fotg210.yaml: title: 'Faraday Technology FOTG210 HS OTG USB 2.0 controller Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/clock/imx8ulp-clock.yaml: title: 'NXP i.MX8ULP Clock Control Module Binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/sound/audio-graph-port.yaml: title: "Audio Graph Card 'port' Node Bindings" should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/memory-controllers/ingenic,nemc.yaml: title: 'Ingenic SoCs NAND / External Memory Controller (NEMC) devicetree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/iio/adc/allwinner,sun8i-a33-ths.yaml: title: 'Allwinner A33 Thermal Sensor Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
