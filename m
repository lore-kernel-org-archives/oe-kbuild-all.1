Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B99D245BFD
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 14:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717942094; cv=none; b=TyHfc8swtL5mAaLtw6yMf+2CyzVYTKpc4YrvAZivxOuLhN3vaDqUkYu1sfRSy5/QWrKow5kjIWPxvx6hVjhqmXn3w68I/fRBbRvln2FajU+wj83uFOOOBxe/aYWjuNf+8hcjoxv7WqGfHrJpjaYqpDVNwSlLhyzz2Z8wOvtxTXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717942094; c=relaxed/simple;
	bh=olm7fhdze0TJRS/dnvqYGIrIyHlDryxeSMsHKcRUFDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RXpsWkbwOJ1RHi7nBZpdOmu1QnravtphfW46rp8Q5plFrFbEXGusjVP8hpg4XYBQ96qhvqQxrewu0JU52/FAWF+ETdfEh1H5CgfHXcw001a9UDaz04EERChr2zUbv5d+71e7QDcEiT6Ekbn+XhCXpX23lErj0WsFcCyPwA8jGCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMBH3Eeo; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMBH3Eeo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717942093; x=1749478093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=olm7fhdze0TJRS/dnvqYGIrIyHlDryxeSMsHKcRUFDo=;
  b=fMBH3EeoteLEOCKT8vpSsdb7IjVHjEOmRTv4OBi5D/pbjYwUDbnrWCGi
   dR8X8dUwG9cV5zqgXPi5aZvoWmD4i6Ws73k/OGq8T8e+aRLTBwOSBl24F
   QtYZeFHBSTmUPKgTUfOP63lIYvOMKQSpaXsnwwTC5DTN2wXLeH1WPblv8
   kEEqrK/hNeorXOR3yXNxdv/6yB/IZlyLJY8+OiqkkpbIPt6XBY/LMosgo
   ame5uvP6RNTJ1ygXYr8Ru3zmNC5C9TkW6pjhJ77G0+Zek+3xEMFsauYPt
   ZA8FS1eVPcN5lBcyGkZ59YHWj9coYRnD9G2TrldOc8fXVl01QZ39zb74F
   A==;
X-CSE-ConnectionGUID: is7NqVKiSfevvjLJs4InPg==
X-CSE-MsgGUID: GPfVabG3Rgu3jOL+mjEFXg==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="25184512"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="25184512"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 07:08:12 -0700
X-CSE-ConnectionGUID: tzkaC6+STYOhqZNMXIEN6w==
X-CSE-MsgGUID: K2mxDPv+QoSuYFxJHIm8Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="43236492"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jun 2024 07:08:11 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGJDM-0001H4-35;
	Sun, 09 Jun 2024 14:08:08 +0000
Date: Sun, 9 Jun 2024 22:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jcmvbkbc-xtensa:xtensa-6.10-rc2-esp32 21/46] dtbs_check:
 arch/xtensa/boot/dts/xip_kc705.dtb: /: 'model' is a required property
Message-ID: <202406092114.WBFeAS1L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jcmvbkbc/linux-xtensa xtensa-6.10-rc2-esp32
head:   abd44c5784518efb46e1601d9b04cb5a63506944
commit: 253371c9a5b55c77afbd2319aafdca4d0ef9adec [21/46] xtensa: xip_kc705_nommu: add defconfig and DTS
compiler: xtensa-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406092114.WBFeAS1L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406092114.WBFeAS1L-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/xtensa/boot/dts/xtfpga.dtsi:51.24-55.5: Warning (unit_address_vs_reg): /soc/main-oscillator: node has a reg or ranges property, but no unit name
   arch/xtensa/boot/dts/xtfpga.dtsi:51.24-55.5: Warning (simple_bus_reg): /soc/main-oscillator: simple-bus unit address format error, expected "d020004"
   arch/xtensa/boot/dts/xtfpga.dtsi:57.28-67.5: Warning (simple_bus_reg): /soc/serial@0d050020: simple-bus unit address format error, expected "d050020"
   arch/xtensa/boot/dts/xtfpga.dtsi:69.25-76.5: Warning (simple_bus_reg): /soc/ethoc@0d030000: simple-bus unit address format error, expected "d030000"
   arch/xtensa/boot/dts/xtfpga.dtsi:78.29-84.5: Warning (simple_bus_reg): /soc/xtfpga-i2s@0d080000: simple-bus unit address format error, expected "d080000"
   arch/xtensa/boot/dts/xtfpga.dtsi:86.29-104.5: Warning (simple_bus_reg): /soc/i2c-master@0d090000: simple-bus unit address format error, expected "d090000"
   arch/xtensa/boot/dts/xtfpga.dtsi:106.22-118.5: Warning (simple_bus_reg): /soc/spi@0d0a0000: simple-bus unit address format error, expected "d0a0000"
   arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi:4.25-27.5: Warning (simple_bus_reg): /soc/flash@00000000: simple-bus unit address format error, expected "0"
>> arch/xtensa/boot/dts/xip_kc705.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: /: failed to match any schema with compatible: ['cdns,xtensa-kc705']
>> arch/xtensa/boot/dts/xip_kc705.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/xip_kc705.dtb: /pic: failed to match any schema with compatible: ['cdns,xtensa-pic']
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: flash@00000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: spi@0d0a0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: main-oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: serial@0d050020: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: xtfpga-i2s@0d080000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: i2c-master@0d090000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: soc: ethoc@0d030000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
>> arch/xtensa/boot/dts/xip_kc705.dtb: serial@0d050020: Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: /soc/ethoc@0d030000: failed to match any schema with compatible: ['opencores,ethoc']
>> arch/xtensa/boot/dts/xip_kc705.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
>> arch/xtensa/boot/dts/xip_kc705.dtb: i2c-master@0d090000: Unevaluated properties are not allowed ('native-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
>> arch/xtensa/boot/dts/xip_kc705.dtb: /soc/i2c-master@0d090000/clock-synth@69: failed to match any schema with compatible: ['ti,cdce706']
>> arch/xtensa/boot/dts/xip_kc705.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
>> arch/xtensa/boot/dts/xip_kc705.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']
--
   arch/xtensa/boot/dts/xtfpga.dtsi:51.24-55.5: Warning (unit_address_vs_reg): /soc/main-oscillator: node has a reg or ranges property, but no unit name
   arch/xtensa/boot/dts/xtfpga.dtsi:51.24-55.5: Warning (simple_bus_reg): /soc/main-oscillator: simple-bus unit address format error, expected "d020004"
   arch/xtensa/boot/dts/xtfpga.dtsi:57.28-67.5: Warning (simple_bus_reg): /soc/serial@0d050020: simple-bus unit address format error, expected "d050020"
   arch/xtensa/boot/dts/xtfpga.dtsi:69.25-76.5: Warning (simple_bus_reg): /soc/ethoc@0d030000: simple-bus unit address format error, expected "d030000"
   arch/xtensa/boot/dts/xtfpga.dtsi:78.29-84.5: Warning (simple_bus_reg): /soc/xtfpga-i2s@0d080000: simple-bus unit address format error, expected "d080000"
   arch/xtensa/boot/dts/xtfpga.dtsi:86.29-104.5: Warning (simple_bus_reg): /soc/i2c-master@0d090000: simple-bus unit address format error, expected "d090000"
   arch/xtensa/boot/dts/xtfpga.dtsi:106.22-118.5: Warning (simple_bus_reg): /soc/spi@0d0a0000: simple-bus unit address format error, expected "d0a0000"
   arch/xtensa/boot/dts/xtfpga-flash-128m.dtsi:4.25-27.5: Warning (simple_bus_reg): /soc/flash@00000000: simple-bus unit address format error, expected "0"
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /: 'model' is a required property
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /: failed to match any schema with compatible: ['cdns,xtensa-kc705']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: cpus: cpu@0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cpus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['cdns,xtensa-cpu']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /pic: failed to match any schema with compatible: ['cdns,xtensa-pic']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: main-oscillator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: xtfpga-i2s@0d080000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: flash@00000000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: serial@0d050020: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: i2c-master@0d090000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: spi@0d0a0000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: soc: ethoc@0d030000: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /soc/main-oscillator: failed to match any schema with compatible: ['cdns,xtfpga-clock']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: serial@0d050020: Unevaluated properties are not allowed ('device_type', 'native-endian' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /soc/ethoc@0d030000: failed to match any schema with compatible: ['opencores,ethoc']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /soc/xtfpga-i2s@0d080000: failed to match any schema with compatible: ['cdns,xtfpga-i2s']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: i2c-master@0d090000: Unevaluated properties are not allowed ('native-endian' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/opencores,i2c-ocores.yaml#
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /soc/i2c-master@0d090000/clock-synth@69: failed to match any schema with compatible: ['ti,cdce706']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /soc/spi@0d0a0000: failed to match any schema with compatible: ['cdns,xtfpga-spi']
>> arch/xtensa/boot/dts/xip_kc705_nommu.dtb: /soc/spi@0d0a0000/sound-codec@0: failed to match any schema with compatible: ['tlv320aic23']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
