Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E02BF9FD
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayjWTXfq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701022630; x=1732558630;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vLsLrfayB/MH35Fe4JExOVPSRr6zdI6WWZ6vbTMknqQ=;
  b=ayjWTXfqk3ruf5VxJJx1IbewteSUHxQhD5x57M9N9aHIErmUj5gTwU4y
   7Whga9/UqJxaW+j7a5+Cy+FbNaRHWipq8xjEniVbTff+BEpj8woiQo9Ob
   XCWyDF1s8yoTfiexj4W+YKkjdZF6wbfJdvHEVP4+3TNHCKv8QuoJFaCyL
   oCbwjZCpYW33n7/qZYMF+PX1HUp7EhdeMYeen6VJhAFcunZk2D0pPYDEt
   t31bVkk2wUNHDYIMJh6aI6wLwofNceiMouaFOfVtDGWqKdpBfY7XZ1d76
   peXL++XuyPs926RYmVOYAgyjstGCNBbEfdsodfvEAgGqCRYlUEGpoiKfJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="456926786"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="456926786"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 10:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10906"; a="911896617"
X-IronPort-AV: E=Sophos;i="6.04,229,1695711600"; 
   d="scan'208";a="911896617"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 26 Nov 2023 10:17:08 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7Jgo-0005PE-0O;
	Sun, 26 Nov 2023 18:17:06 +0000
Date: Mon, 27 Nov 2023 02:16:15 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Vaishnav Achath <vaishnav.a@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 293/382] dtbs_check:
 Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml:
 properties:compatible: [{'const': 'ti,j721e-csi2rx'}] is not of type
 'object', 'boolean'
Message-ID: <202311262317.Nwnu4dXf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   3a4f51391fe1d39254fed39393815b2879e44d73
commit: 6a1c59d2f076cb48eb92da6523866ac593605466 [293/382] media: dt-bindings: Add TI J721E CSI2RX
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311262317.Nwnu4dXf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311262317.Nwnu4dXf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/serial/st,stm32-uart.yaml: title: 'STMicroelectronics STM32 USART bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/pinctrl/mediatek,mt65xx-pinctrl.yaml: patternProperties:-[0-9]+$:patternProperties: 'pins' does not match '[\^$()*@]'
   hint: Fixed strings belong in 'properties', not 'patternProperties'
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/mux/reg-mux.yaml: title: 'Generic register bitfield-based multiplexer controller bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml: properties:compatible: [{'const': 'ti,j721e-csi2rx'}] is not of type 'object', 'boolean'
   from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml: properties:compatible: [{'const': 'ti,j721e-csi2rx'}] is not of type 'object', 'boolean'
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/clock/intel,cgu-lgm.yaml: title: "Intel Lightning Mountain SoC's Clock Controller(CGU) Binding" should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/usb/willsemi,wusb3801.yaml: title: 'WUSB3801 Type-C port controller DT bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/mux/mux-consumer.yaml: title: 'Common multiplexer controller consumer bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
