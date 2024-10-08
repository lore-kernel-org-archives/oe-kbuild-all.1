Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A4C212D34
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Oct 2024 18:59:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728413949; cv=none; b=YkeC6iZFv+o5uIymWzn/KNKfTetnRKXxS5l6vHFUfheNtY7VIIPERIPXD5+UVgXdmnE473HOTo6uu6irv04mMbbKItVsemm+MrtfX1w9z9dDAOt6mHd7HLo36crY/4/oeNF1XAHWIazmvH8EnOy9Irs/c67CqSzHpBAHSLcj2lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728413949; c=relaxed/simple;
	bh=LwyzBwpfo1KhxzD1amFDCQHIu9AU9lIwLPTGz0iXr4o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nARs2kDKXacNibs2cKDOazCK6lyzrvQ/jwGS6jLI0Km+1QdCfk1LzLVnmSf870gjVhnAFBEs8OEnZpQlPxAKFpXIkNOUasseJj8sHom5eyko+EsNXgJWLx1Ap8FZfJ8NMK89adHXkP9ZyFjNUNtDhaAxMznO8Ii58NntWPM+34w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZy4bISN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZy4bISN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728413948; x=1759949948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LwyzBwpfo1KhxzD1amFDCQHIu9AU9lIwLPTGz0iXr4o=;
  b=WZy4bISNdk1YH/3Jz5vqcw9lK3KFk0YtkOxaID7D/D0U2m+LdArmFYmR
   Gvnk9IaqXThjm0DJr3UaZTQPsor8wu3aIThOF4IKlGK1TI+BLLYTNvRq8
   nJ1LR3jWWo2CYidXLp3/1byhS96gxmoukTgohnsbUMoHQFmKJRPVcRWMh
   /9PMTxPzZodkH7bZTAbb08yCivY+VORereRhMHJ7bBIvIivt6SzgBQXby
   GQuo956wObYkHS0a2Kt+lyjG0H3/egl6LD9C4THP80w8wXjdNGtwi6woo
   a8lARTHI1VSVJlMnlzLczQYZHdKiYUqyEs2Rp7VmyQX6JePJZjl4a5evA
   w==;
X-CSE-ConnectionGUID: SNeMZ1okQN+KtyNRazug0A==
X-CSE-MsgGUID: U5jtmXPGSeCG9mMtOk7jsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="45114449"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="45114449"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 11:59:06 -0700
X-CSE-ConnectionGUID: eA5hBvJPQJekXhZw/tYDFA==
X-CSE-MsgGUID: cQtlPPmwTg+2LvkjybYE6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="75635311"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Oct 2024 11:59:04 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syFQE-0008HS-0f;
	Tue, 08 Oct 2024 18:59:02 +0000
Date: Wed, 9 Oct 2024 02:58:44 +0800
From: kernel test robot <lkp@intel.com>
To: Arnaud Vrac <avrac@freebox.fr>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Marc Gonzalez <mgonzalez@freebox.fr>
Subject: [linux-next:master 2288/2853]
 arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb:
 clock-controller@c8c0000: clocks: [[31, 0], [34, 178], [144, 1], [144, 0],
 [145, 1], [145, 0], [146], [0], [0], [0], [34, 184]] is too long
Message-ID: <202410090230.1TqAdril-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   33ce24234fca4c083e6685a18b460a18ebb5d5c1
commit: 2150c87db80cf7eed3939f32cbb18393055c58ce [2288/2853] arm64: dts: qcom: msm8998: add HDMI nodes
config: arm64-randconfig-051-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090230.1TqAdril-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241009/202410090230.1TqAdril-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410090230.1TqAdril-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8998-asus-novago-tp370ql.dtb: clock-controller@c8c0000: clocks: [[31, 0], [34, 178], [144, 1], [144, 0], [145, 1], [145, 0], [146], [0], [0], [0], [34, 184]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: phy@c012000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-fxtec-pro1.dtb: clock-controller@c8c0000: clocks: [[34, 0], [37, 178], [155, 1], [155, 0], [156, 1], [156, 0], [157], [0], [0], [0], [37, 184]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8998-hp-envy-x2.dtb: clock-controller@c8c0000: clocks: [[31, 0], [34, 178], [144, 1], [144, 0], [145, 1], [145, 0], [146], [0], [0], [0], [34, 184]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8998-lenovo-miix-630.dtb: clock-controller@c8c0000: clocks: [[31, 0], [34, 178], [144, 1], [144, 0], [145, 1], [145, 0], [146], [0], [0], [0], [34, 184]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: phy@c012000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-mtp.dtb: clock-controller@c8c0000: clocks: [[34, 0], [37, 178], [150, 1], [150, 0], [151, 1], [151, 0], [152], [0], [0], [0], [37, 184]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-cheeseburger.dtb: clock-controller@c8c0000: clocks: [[35, 0], [38, 178], [151, 1], [151, 0], [152, 1], [152, 0], [153], [0], [0], [0], [38, 184]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8998-oneplus-dumpling.dtb: clock-controller@c8c0000: clocks: [[35, 0], [38, 178], [151, 1], [151, 0], [152, 1], [152, 0], [153], [0], [0], [0], [38, 184]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: phy@c012000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-lilac.dtb: clock-controller@c8c0000: clocks: [[3, 0], [39, 178], [156, 1], [156, 0], [157, 1], [157, 0], [158], [0], [0], [0], [39, 184]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: phy@c012000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-maple.dtb: clock-controller@c8c0000: clocks: [[3, 0], [39, 178], [156, 1], [156, 0], [157, 1], [157, 0], [158], [0], [0], [0], [39, 184]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: phy@c012000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
>> arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino-poplar.dtb: clock-controller@c8c0000: clocks: [[3, 0], [39, 178], [156, 1], [156, 0], [157, 1], [157, 0], [158], [0], [0], [0], [39, 184]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#
--
   arch/arm64/boot/dts/qcom/pm8005.dtsi:26.23-35.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@800f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2913.27-2968.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c994000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8998.dtsi:2989.27-3044.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@c900000/dsi@c996000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8998-xiaomi-sagit.dtb: clock-controller@c8c0000: clocks: [[34, 0], [37, 178], [149, 1], [149, 0], [150, 1], [150, 0], [151], [0], [0], [0], [37, 184]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,mmcc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
