Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9DE24468D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Oct 2025 17:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759513006; cv=none; b=CbWoj5dAWnNkMfCadX6lG8tg6uNKRCgcGwqePH9clnpMhvkroLzN0UHivjNaHNGmMlV2f5jMLwb9YM0hXf1tjDW9IFCE8lGjv1DaWoeU0WqBrAW30954OZD4gLUKBYyzZOelkwzObVgeiJmrn9dgvNLG4ZYzlK1rMKoSjS38fTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759513006; c=relaxed/simple;
	bh=VtMzFM/CboB53qYeNZFYbW4la2uiDfAts76c3/tKvx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OV0qjIgt6f+8uFAmCxh4ZRUYPM3L9XA3bYYsJuIKusmM0fI/3NwFxCTkF1UcHH+WcC7rTeiR1jUU2iAsbrbLg2b9iVikjKMLkmJkZ+G6I08RuwbLiQuBK2PYkHzxpShNIAPO6k+kLhPC28RjBqktmkKJxmTWqbvPDCegi5wcBYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1bHCBW/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1bHCBW/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759513004; x=1791049004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VtMzFM/CboB53qYeNZFYbW4la2uiDfAts76c3/tKvx8=;
  b=B1bHCBW/NDYXnNbvrCei/Y21Ld3XSwk2IMvM7WVmhqCZeaoHT3nqBY+C
   P+p69GotfZVBW2ZVirT7BgpCIEacNFLdZLDdD27hBhIvemDHwBHK9CmFp
   zVKl+YXPFOB6hEK+kJFP8sV+w8lPfe1EDimaOPW+rnwoL7mYEb3lamRvi
   bNNTy8Gqmb8UPVCWLJ5H3ohj8lP+xAFuOLnp6n4YNzMBELHNtysrSmMy0
   wwWZjnRt6cOgsLhDQtNDbcieH7ruD9JZcZSGsDBYR3zE3lkTFPH2wq6iq
   wlauqwBzDnYWaRJmy1vmy/AsMQ4nz+iP0j+Rg8m/Jqd9p9eYt/lDyePhL
   g==;
X-CSE-ConnectionGUID: uRPB5tSwSa+ZeiPJf8yCKw==
X-CSE-MsgGUID: AHBIi63RTAeilj01zBT2+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11571"; a="64413718"
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="64413718"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Oct 2025 10:36:44 -0700
X-CSE-ConnectionGUID: HA6DWp2YRBaa7fBxq8/Emg==
X-CSE-MsgGUID: ogK+ygcyRyO5EkYl8QGSFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,313,1751266800"; 
   d="scan'208";a="210016119"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 03 Oct 2025 10:36:41 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v4jhv-0004mD-2g;
	Fri, 03 Oct 2025 17:36:39 +0000
Date: Sat, 4 Oct 2025 01:36:23 +0800
From: kernel test robot <lkp@intel.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 13060/13363]
 arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff050000
 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202510040140.njOfkDkC-lkp@intel.com>
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
config: arm64-randconfig-051-20251003 (https://download.01.org/0day-ci/archive/20251004/202510040140.njOfkDkC-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 39f292ffa13d7ca0d1edff27ac8fd55024bb4d19)
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251004/202510040140.njOfkDkC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510040140.njOfkDkC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-mux.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: pmic@5e (ti,tps65086): 'regulators' is a required property
   	from schema $id: http://devicetree.org/schemas/mfd/ti,tps65086.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff040000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu100-revC.dtb: leds (gpio-leds): led-ds4:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'phy0rx' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'phy0rx' does not match '^cpu[0-9]*$'
   	'phy0rx' does not match '^hci[0-9]+-power$'
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu104-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@1/clock-generator@36: failed to match any schema with compatible: ['silabs,si5341']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@2/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: /axi/i2c@ff030000/i2c-mux@74/i2c@3/clock-generator@5d: failed to match any schema with compatible: ['silabs,si570']
   arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu106-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-zcu1275-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dtb: spi@f1960000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-01-revA.dtb: spi@f1970000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revA.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-sm-k26-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
--
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: spi@ff040000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
   arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): compatible: 'oneOf' conditional failed, one must be fixed:
   	['cdns,spi-r1p6'] is too short
   	'cdns,spi-r1p6' is not one of ['xlnx,zynq-spi-r1p6']
   	'cdns,spi-r1p6' is not one of ['xlnx,zynqmp-spi-r1p6', 'xlnx,versal-net-spi-r1p6']
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#
>> arch/arm64/boot/dts/xilinx/zynqmp-smk-k26-revA-sck-kv-g-revB.dtb: spi@ff050000 (cdns,spi-r1p6): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-cadence.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
