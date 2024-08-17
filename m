Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D39B3B782
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Aug 2024 13:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723901985; cv=none; b=j405SpfzAj0RjizFRkZIpUpJ03dZTG3UyQaLJOaw8fIlUgDcOq/EUKQF1AVpUT2sJisLIFquecM+9HTZAoOvizHYq954AdvaU8He2zs2a5Yt0XF7im3HVYHYPJPK0ZLliH/0+5CJE5ics6IsZLa7JeAMRpbHrT5uG8i/7ACTgbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723901985; c=relaxed/simple;
	bh=GaFp0XbAPew06RR5Z1rrM72mDn4DTKCk6+UdDjS67mk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=afHC6uyRsPijOalz88hx8V1T5N+2098Zpc37FZVaXuMBqzHyTQqDwAdis+/zcuwoDA58yNxse1W9IqUNycawpeikNGFcIcsMe+0RR62ZHsZDA4fDhXoI5BE4jxrHxzT0vsb0OIOCPA0EFJk6PcSpk3RGd6/KKjw21OK8WaoOU5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jSPYW7Q1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jSPYW7Q1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723901982; x=1755437982;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GaFp0XbAPew06RR5Z1rrM72mDn4DTKCk6+UdDjS67mk=;
  b=jSPYW7Q1KnzbvUttGMkRJ2voWeyXJNUCuwMpiozMNIwMS9i6G7Qez4x0
   ZebPGVQa2NIo2UCozG8pVysrxN66YgIn2LcT/fIvvvs3HnCulF+4ZXCG6
   q05HWeP20yd0yCdRY0C/wukrBeLHQMxlPBpqnjqA/cm0ck8+Ucw+OdQ/x
   g9O58/AHkHyk58YB5x72ILz9wQB/4sbR3ot6UAEF4Dwfe47AD/QRpi5yI
   IwLBqpKVKNU7MJOmELrTH3BPDCP63lsWAsUTdtwr9w20IcHVsL1vL/K1S
   DZuthEoY498MXkPJs3KDhEVrKbt8d6OHNiXnSvk2UqG5SLKIS3bqVrLFX
   A==;
X-CSE-ConnectionGUID: rcQqweDZTa65hSzXYiorKQ==
X-CSE-MsgGUID: fyBVst9ZRXewFJLZge01mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11167"; a="32817912"
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="32817912"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2024 06:39:41 -0700
X-CSE-ConnectionGUID: dLEXoFIVRVyziGa3TZGpUA==
X-CSE-MsgGUID: CJT4kmptRaWy9n/+fd9C5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,155,1719903600"; 
   d="scan'208";a="90701895"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Aug 2024 06:39:40 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sfJeb-0007WE-30;
	Sat, 17 Aug 2024 13:39:37 +0000
Date: Sat, 17 Aug 2024 21:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 4977/5190]
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: codec@3240000: clocks: [[125, 57,
 1], [125, 58, 1], [125, 102, 1], [125, 103, 1], [126]] is too short
Message-ID: <202408172107.8UXmMXw3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   367b5c3d53e57d51a5878816804652963da90950
commit: be7399872f79201c6ed7e97fb10e335b4cc87ea9 [4977/5190] arm64: dts: qcom: sm8250: move lpass codec macros to use clks directly
config: arm64-randconfig-052-20240816 (https://download.01.org/0day-ci/archive/20240817/202408172107.8UXmMXw3-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408172107.8UXmMXw3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408172107.8UXmMXw3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4838.27-4909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4930.27-4982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: codec@3240000: clocks: [[125, 57, 1], [125, 58, 1], [125, 102, 1], [125, 103, 1], [126]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: codec@3240000: clock-names:4: 'va' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4838.27-4909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4930.27-4982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: codec@3240000: clocks: [[125, 57, 1], [125, 58, 1], [125, 102, 1], [125, 103, 1], [126]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: codec@3240000: clock-names:4: 'va' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4838.27-4909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4930.27-4982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: codec@3240000: clocks: [[101, 57, 1], [101, 58, 1], [101, 102, 1], [101, 103, 1], [102]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: codec@3240000: clock-names:4: 'va' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-hdk.dtb: codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4838.27-4909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4930.27-4982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: codec@3240000: clocks: [[101, 57, 1], [101, 58, 1], [101, 102, 1], [101, 103, 1], [102]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: codec@3240000: clock-names:4: 'va' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-mtp.dtb: codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4838.27-4909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4930.27-4982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: codec@3240000: clocks: [[108, 57, 1], [108, 58, 1], [108, 102, 1], [108, 103, 1], [109]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: codec@3240000: clock-names:4: 'va' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4838.27-4909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4930.27-4982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: codec@3240000: clocks: [[104, 57, 1], [104, 58, 1], [104, 102, 1], [104, 103, 1], [105]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: codec@3240000: clock-names:4: 'va' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4930.27-4982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi:655.9-666.5: Warning (graph_child_address): /soc@0/spmi@c440000/pmic@2/typec@1500/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: codec@3240000: clocks: [[105, 57, 1], [105, 58, 1], [105, 102, 1], [105, 103, 1], [106]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: codec@3240000: clock-names:4: 'va' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-boe.dtb: codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4930.27-4982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi:655.9-666.5: Warning (graph_child_address): /soc@0/spmi@c440000/pmic@2/typec@1500/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: codec@3240000: clocks: [[105, 57, 1], [105, 58, 1], [105, 102, 1], [105, 103, 1], [106]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: codec@3240000: clock-names:4: 'va' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-csot.dtb: codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4838.27-4909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8250.dtsi:4930.27-4982.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: codec@3240000: clocks: [[105, 57, 1], [105, 58, 1], [105, 102, 1], [105, 103, 1], [106]] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: codec@3240000: clock-names:4: 'va' was expected
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-xiaomi-pipa.dtb: codec@3240000: clock-names: ['mclk', 'npl', 'macro', 'dcodec', 'fsgen'] is too short
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
