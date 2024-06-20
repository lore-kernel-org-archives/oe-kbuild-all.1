Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D471AC44F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 12:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718888345; cv=none; b=I2ZkPjHWCUO2KWbpbCzfqypfpvH7QPML0C/GK/1dNHz7uucFaAxKSfiJ+Y5HcegEbQGsuPVPhY7mbct3SAVqei09aPEO6vNHU4KhQve5WfiVZ0to+k5K6IXUIDykHl5H7rwzGqQl+AZAwmCOBO8LZStK3rdFic+s127Se2duN7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718888345; c=relaxed/simple;
	bh=zHfRPyfsr0uK3wHn68RXpeKQQIaoO2xCTX1YSzLO4tw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxalZQfjqvQg8HySz37Hffop4wyhd5NmdAS7R6Hr9eJCUECWpIaJjytd2NRPMY0H1ay5vDCm7Ghqu1NN7sRwej6lgqhhYEsftr99ga5agOpiZtEGJXlvNRTAc+V3X36V1436T9on2sw7WPI7tiMJacPhD5mcCqasIG15NXZw5TU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=COwd+jVK; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="COwd+jVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718888343; x=1750424343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zHfRPyfsr0uK3wHn68RXpeKQQIaoO2xCTX1YSzLO4tw=;
  b=COwd+jVKN1WaGpb0leOGScF4jtvvbtAOz1qdpdZlJzKmCR6HU9r2em4m
   STbLPh1Pnd7C0T2ahqwaBpSvutBiPNlNba0O7yr4Z7/e3abEQWkeKywgw
   8S0TPINcZh4MIHCrcMwKLrsLyKnTvMCWbFe5NA+sf/BrkqI9LL+mSVdSJ
   7ckkfACZWfXFUQFP8wWVNFMt8dsVC6vRhS3iODuhjaMAl0DI5pbvajzbt
   RmTN6QmiMw7Z6qGS81JXsGYJ875epcYvO2LAxZpjvC1ylszccWbbUjeF2
   vxtfY/M0OOIKKdWFBQ8fKxwTiAzbrDRjvIvJz7tNqBdow4zXo1XhedmRj
   A==;
X-CSE-ConnectionGUID: ZS8eDIE/QpKsUnJyCLCgwQ==
X-CSE-MsgGUID: kCNEf9FjT6Kne0Jp4TENHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19640165"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="19640165"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 05:59:02 -0700
X-CSE-ConnectionGUID: F+DM7j8hQfa6ZRwi+CXx2A==
X-CSE-MsgGUID: pZ7peDL4TFafotyqd8wNRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="73437673"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 20 Jun 2024 05:59:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKHNS-0007c6-0b;
	Thu, 20 Jun 2024 12:58:58 +0000
Date: Thu, 20 Jun 2024 20:58:27 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/dt-bindings-mfd-syscon-split 7/8]
 arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dtb: syscon@f9011000:
 compatible: ['syscon'] is too short
Message-ID: <202406202032.Dvhah0uI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/dt-bindings-mfd-syscon-split
head:   0f4f5cdbae0695ae8533aec60f629593d2c818f8
commit: 09928d5821f837e08a75e5ffab3d16d05893aac9 [7/8] dt-bindings: mfd: syscon: Split and enforce documenting MFD children
config: arm-randconfig-051-20240619 (https://download.01.org/0day-ci/archive/20240620/202406202032.Dvhah0uI-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406202032.Dvhah0uI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406202032.Dvhah0uI-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/mode_backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s7-p2_backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p1_backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s5-p1_backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s9-p1_backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p2_backup@44c)
   arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dtb: l2-cache: Unevaluated properties are not allowed ('qcom,saw' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dtb: syscon@f9011000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/mode_backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s7-p2_backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p1_backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s5-p1_backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s9-p1_backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p2_backup@44c)
   arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: l2-cache: Unevaluated properties are not allowed ('qcom,saw' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: syscon@f9011000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: pm8941@0: gpio@c000: 'otg' does not match any of the regexes: '-hog(-[0-9]+)?$', '-state$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: gpio@c000: 'otg' does not match any of the regexes: '-hog(-[0-9]+)?$', '-state$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-gpio.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: otg: $nodename:0: 'otg' does not match '^(hog-[0-9]+|.+-hog(-[0-9]+)?)$'
   	from schema $id: http://devicetree.org/schemas/gpio/gpio-hog.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dtb: panel@0: 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple-dsi.yaml#
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/mode_backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s7-p2_backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p1_backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s5-p1_backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s9-p1_backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p2_backup@44c)
   arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dtb: l2-cache: Unevaluated properties are not allowed ('qcom,saw' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-amami.dtb: syscon@f9011000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/mode_backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s7-p2_backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p1_backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s5-p1_backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s9-p1_backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p2_backup@44c)
   arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dtb: l2-cache: Unevaluated properties are not allowed ('qcom,saw' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-honami.dtb: syscon@f9011000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/mode_backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s7-p2_backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p1_backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s5-p1_backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s9-p1_backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p2_backup@44c)
   arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dtb: l2-cache: Unevaluated properties are not allowed ('qcom,saw' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dtb: syscon@f9011000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p1_backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s5-p1_backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s9-p1_backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p2_backup@44c)
   arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: /: qcom,board-id: False schema does not allow [[8, 0]]
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: /: qcom,msm-id: False schema does not allow [[194, 65536]]
   	from schema $id: http://devicetree.org/schemas/arm/qcom.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: l2-cache: Unevaluated properties are not allowed ('qcom,saw' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dtb: syscon@f9011000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/mode_backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s7-p2_backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p1_backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s5-p1_backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s9-p1_backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p2_backup@44c)
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dtb: l2-cache: Unevaluated properties are not allowed ('qcom,saw' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dtb: syscon@f9011000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dtb: pma8084@0: 'pwrkey@800' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dtb: pwrkey@800: Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8941-pwrkey.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dtb: /soc/display-subsystem@fd900000/dsi@fd922800/panel@0: failed to match any schema with compatible: ['samsung,s6e3fa2']
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/mode_backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s7-p2_backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p1_backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s5-p1_backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s9-p1_backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p2_backup@44c)
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dtb: l2-cache: Unevaluated properties are not allowed ('qcom,saw' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dtb: syscon@f9011000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dtb: pma8084@0: 'pwrkey@800' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dtb: pwrkey@800: Unevaluated properties are not allowed ('reg' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/qcom,pm8941-pwrkey.yaml#
   arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-kltechn.dtb: /soc/display-subsystem@fd900000/dsi@fd922800/panel@0: failed to match any schema with compatible: ['samsung,s6e3fa2']
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/mode_backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s7-p2_backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p1_backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s5-p1_backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s9-p1_backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p2_backup@44c)
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dtb: l2-cache: Unevaluated properties are not allowed ('qcom,saw' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dtb: syscon@f9011000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
--
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1322.26-1325.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1347.26-1350.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1367.40-1370.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s5-p2_backup@e3: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/mode_backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1377.40-1380.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s6-p2_backup@e4: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s7-p2_backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1412.41-1415.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p1_backup@442: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p1_backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1427.41-1430.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s4-p1_backup@444: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s5-p1_backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1452.41-1455.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s8-p1_backup@448: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s9-p1_backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1477.41-1480.6: Warning (unique_unit_address_if_enabled): /soc/qfprom@fc4bc000/s1-p2_backup@44c: duplicate unit-address (also used in node /soc/qfprom@fc4bc000/s2-p2_backup@44c)
   arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-leo.dtb: l2-cache: Unevaluated properties are not allowed ('qcom,saw' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-leo.dtb: syscon@f9011000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
