Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68993286400
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 15:30:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759505431; cv=none; b=Fchxnhmg2sDesqtPE/FWo3fdtcPPJyWXUh2sAW5xlinzFNa3WFL/BrItueeVZkthTTY61wl6YsWN2LK7raC6QgVIFuYFAwEAtg+uoBW6ZT4QCKw0FvatYGz+we8+IbopjzMPXOX6Jq47YTM94Xt3STtYqrt79VoISA930N2Hx7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759505431; c=relaxed/simple;
	bh=6UBzWXopvHYpLniDEP3eQNtT2j9LiRZy5/uLLZwAkvI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eyNCYObWNfpwHNz55yVM1iO6/fI3crq7mjrk3fLh8aaDqvGT6thMOJFKWHGiqVd8jK2v4iPV9Zm0GyyOHr30+MjdPjVavJmByyxTsk91qAq29mbKWMlDXf+Lt5jqh6aeno2gVYApif4y8KYfkw20rvQdEl7zIbS2YokSyHh6YNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MosRjGWq; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MosRjGWq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759505429; x=1791041429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6UBzWXopvHYpLniDEP3eQNtT2j9LiRZy5/uLLZwAkvI=;
  b=MosRjGWqIhzckFnaBxejNTHXfgxwEWqlUrH6MtdFpRFBsT/YqGbH6pwW
   WIDPQ9hh/JquVRy39MAHAuSSol4iQ9nOx+GPtJeLFr4yfPkPFUvTvSy7b
   LTLMm3RX79pWwKrec0urMGlRwS3OAqR39YzaaLGzEn6sxeRUso8JEMqri
   w5DmNqagL10S7Yq3IHreezCCZ8FNkCKIxuKPwLo1nabC1CzTVNgtVn3MD
   +5liE5oN4kKrxtJQ5fnGHNLhqASnMysj3Ejem/gAOO/fh7ZciaWQE6S5L
   xuJGc8af9KgAHXBb6MApKGC4PKi5s79BsbEegaCQLRywZRTC2CbtENimW
   w==;
X-CSE-ConnectionGUID: UhXj48NQRQ+XQ6WPwQa3Pg==
X-CSE-MsgGUID: w2s3DsKOSXi7lL6PX7EGFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="60826084"
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="60826084"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 08:30:27 -0700
X-CSE-ConnectionGUID: J/kxDKHSQxmSV/hjsgM62Q==
X-CSE-MsgGUID: tvvb88UeTr2M91Dw7Y2qHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,312,1751266800"; 
   d="scan'208";a="184505761"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 03 Oct 2025 08:30:26 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4hjj-0004ce-1J;
	Fri, 03 Oct 2025 15:30:23 +0000
Date: Fri, 3 Oct 2025 23:29:52 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 13060/13363]
 arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff040000
 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was
 unexpected)
Message-ID: <202510032336.PjyL10gR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Conor,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   47a8d4b89844f5974f634b4189a39d5ccbacd81c
commit: 4092fc5f35cecb01d59b2cdf7740b203eac6948a [13060/13363] spi: dt-bindings: cadence: add soc-specific compatible strings for zynqmp and versal-net
config: arm64-randconfig-052-20251003 (https://download.01.org/0day-ci/archive/20251003/202510032336.PjyL10gR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251003/202510032336.PjyL10gR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510032336.PjyL10gR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: i2c-mux@75 (nxp,pca9548): i2c@3: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: pmic@5e (ti,tps65086): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65086.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff040000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/avnet-ultra96-rev1.dtb: leds (gpio-leds): led-ds4:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'phy0rx' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1232-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm015-dc1.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('arasan,has-mdma', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: spi@ff040000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm016-dc2.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: nand-controller@ff100000 (xlnx,zynqmp-nand-controller): Unevaluated properties are not allowed ('arasan,has-mdma', 'num-cs', 'power-domains' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm017-dc3.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zc1751-xm018-dc4.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: i2c-mux@75 (nxp,pca9548): i2c@0: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: i2c-mux@75 (nxp,pca9548): i2c@1: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: i2c-mux@75 (nxp,pca9548): i2c@2: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: i2c-mux@75 (nxp,pca9548): i2c@3: Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: pmic@5e (ti,tps65086): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65086.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff040000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-rev1.0.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revC.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: sc18is603@2f (nxp,sc18is603): $nodename:0: 'sc18is603@2f' does not match '^spi(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/spi/nxp,sc18is.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu111-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phys' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: display@fd4a0000 (xlnx,zynqmp-dpsub-1.7): 'phy-names' is a required property
   	from schema $id: http://devicetree.org/schemas/display/xlnx/xlnx,zynqmp-dpsub.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
--
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
