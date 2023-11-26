Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 402849441
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Nov 2023 12:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DuXUcldi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701002517; x=1732538517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wSBQEBrAnRYrymgFW2JMgARWwuRZQm0vRZ2qANR5WVQ=;
  b=DuXUcldiXSaDq3sOIMSiz1z3aPGixwU3pcAsAUtk8Kasbu2BnN0YfKjZ
   nyhoeLErx3zacayAjngFl2Keg71CVS8c+sUWOI+DdObEpSfiy2824oZfI
   JQ2RaA0xtn1kcerO9u8x1Aou/Xy8yTOvl7Jmi0oVNnBkujbydFxZhaZ0S
   aORZVN+yn8vMbBamriD/NsZ0CY+zSc+ghNBaupWxOGMsaN7OlIqVXYElU
   2S8W56VytVy55jzDaP7nQ7lo9+vMIBF6RQPNl2UGfSbDy646S+7UkYuO6
   mtNzjaPHR1s930zXgWUvlJDSev0OEgPc2UrUQH7n04NBu1cEq0JxIsMo+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="11260356"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="11260356"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2023 04:41:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="1099514253"
X-IronPort-AV: E=Sophos;i="6.04,228,1695711600"; 
   d="scan'208";a="1099514253"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 26 Nov 2023 04:41:52 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r7ESM-0005AH-14;
	Sun, 26 Nov 2023 12:41:50 +0000
Date: Sun, 26 Nov 2023 20:40:52 +0800
From: kernel test robot <lkp@intel.com>
To: Pratyush Yadav <p.yadav@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Vaishnav Achath <vaishnav.a@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 293/382] dtbs_check:
 Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml:
 properties:compatible: [{'const': 'ti,j721e-csi2rx'}] is not of type
 'object', 'boolean'
Message-ID: <202311261940.ENfNKaYx-lkp@intel.com>
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
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311261940.ENfNKaYx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311261940.ENfNKaYx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/rng/ingenic,trng.yaml: title: 'Bindings for DTRNG in Ingenic SoCs' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/spi/aspeed,ast2600-fmc.yaml: title: 'Aspeed SMC controllers bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/watchdog/watchdog.yaml: title: 'Watchdog Generic Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
>> Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml: properties:compatible: [{'const': 'ti,j721e-csi2rx'}] is not of type 'object', 'boolean'
   from schema $id: http://json-schema.org/draft-07/schema#
>> Documentation/devicetree/bindings/media/ti,j721e-csi2rx.yaml: properties:compatible: [{'const': 'ti,j721e-csi2rx'}] is not of type 'object', 'boolean'
   from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
   Documentation/devicetree/bindings/clock/imx6sl-clock.yaml: title: 'Clock bindings for Freescale i.MX6 SoloLite' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/serial/8250_omap.yaml: title: "Bindings for 8250 compliant UARTs on TI's OMAP2+ and K3 SoCs" should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#
   Documentation/devicetree/bindings/media/marvell,mmp2-ccic.yaml: title: 'Marvell MMP2 camera host interface bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   from schema $id: http://devicetree.org/meta-schemas/base.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
