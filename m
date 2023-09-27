Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E2AA47C9C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 16:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695833853; x=1727369853;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8o1Yl1jrT8vAGt/yZccJyBVE8Sn0equNCDrmA01IudY=;
  b=lxrXnllxAbFGmqLrj4bJdfI6QJsq/RUTSNAmsdzKV5xc5Ue3EiNNtUBc
   G8oFWfWZDtRTT6iHC7zRtHAD+kkerobYzHTc1UdvoIza2cEAC5xwLVojV
   3tBfp3Q7p3vfw6o5I45CP8i5yKCGp0ut24KhYSczmJ8tEVHdJnprFUg60
   yMCP6riFVk1uG1Ohbrk8RIrkbpEerMwTKvL+8RVzJZXmgu+bJ1kLRb1XE
   N6ZWB6ckOmC03m3PifaJEMUm688cvh2ON+OJa9H9adCh6VSjIJp9y+Kno
   U0DSzUXdUrVmZVEMWQmYOugL5887njNw63mspC/DoQ2Yqcr2ZcTuaCB67
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="412787276"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="412787276"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 09:57:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="996224467"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="996224467"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 27 Sep 2023 09:57:27 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlXqn-0000SR-2J;
	Wed, 27 Sep 2023 16:57:25 +0000
Date: Thu, 28 Sep 2023 00:57:20 +0800
From: kernel test robot <lkp@intel.com>
To: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
	linux-doc@vger.kernel.org
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 75/1370] dtbs_check:
 Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi
 Performance Monitor device tree bindings' should not be valid under
 {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <202309280024.L9zqEm24-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: dd65426231fcfbf88e45190dc2846ade079bde8f [75/1370] dt-binding: apm: Add the binding document for APM
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230928/202309280024.L9zqEm24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309280024.L9zqEm24-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/stm32/stm32.yaml: title: 'STMicroelectronics STM32 Platforms Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/arm/stm32/st,mlahb.yaml: title: 'STMicroelectronics STM32 ML-AHB interconnect bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/clock/imx7ulp-scg-clock.yaml: title: 'Clock bindings for Freescale i.MX7ULP System Clock Generation (SCG) modules' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/perf/xilinx-apm.yaml: title: 'Xilinx Axi Performance Monitor device tree bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/net/microchip,lan95xx.yaml: title: 'The device tree bindings for the USB Ethernet controllers' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml: title: 'MediaTek Smart Voltage Scaling (SVS) Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/phy/phy-stm32-usbphyc.yaml: title: 'STMicroelectronics STM32 USB HS PHY controller binding' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
