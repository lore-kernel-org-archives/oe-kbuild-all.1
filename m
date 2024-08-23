Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FCF1A94C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 01:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724374816; cv=none; b=WhaRbvdReaSBj8C+/ljFhvpvpaIbV1qmbCuoGFVDy0QFSKSK0g6Sq7tWWnHD8dVcUxDp78KyMJYNox8r8Xhr/vCOkpIjRi7zTN81U1WFh1BsuYfTJ98NslOGUuYN9nM3MvQWPLW4UZAno78VZqbiJEus5JS1GxOIydNOJpX3nAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724374816; c=relaxed/simple;
	bh=ZeDK3eV7yQQEsuzdGy5YhwndWpTi9D/qWD5IJR7eSMM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=s0Dg1hXc2ZEgRgh6L4IQLYZz5MkJuF9KyLQErPNRPA8Ptm7BFZO3+MKDmhyWjY/ZzMGhHUoRsYN8F+LiQJ9mZolmA0x8voJQR47AqAkFrVB8YfjID1mtDaEPvSVtfEFpNPxMTwMmhlixMwD7+k97GxvIDq3HG+hh8GgwsCRnYOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOFwND0i; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOFwND0i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724374813; x=1755910813;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZeDK3eV7yQQEsuzdGy5YhwndWpTi9D/qWD5IJR7eSMM=;
  b=XOFwND0ilIC6Aehz4vG6jqXMblGJUFCg4iDh75kMDOPP1tSscW1L4uAC
   cZOtcStwLz6D36iZD/WEZfWGKQ1azuCghuoX4BnH3xVoT5pwqq1Yq1R2i
   /ohgMWC1qpvnB+klvdzAp+mhRk6iqfB/ax1M+n2s8Eii4Zj+9+oSMK3w0
   Q0AWFtbxIxwjNcZQfHlYshlNp12RRkaeole+jmD4fLtsJBu0BWRjaL03N
   3rk28CwVvUN6skfJRgLCoJcTQBVzbcrMAYW+jL8CuACIEPDeRkMUtaqua
   3shDouP5Tcib6rRAh4FGQzJnkq+faHCLCPVZwB/L8jWJbZlbAzOBPYo30
   w==;
X-CSE-ConnectionGUID: lFaglIMDSvGva59yXp3Mpw==
X-CSE-MsgGUID: q2TJgIHsSg6eKWaL7+9bEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="33489586"
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="33489586"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2024 18:00:12 -0700
X-CSE-ConnectionGUID: Vl87DZ2XQHO6CvypL7bGVA==
X-CSE-MsgGUID: srxsqsqIQdyPiWqMiFjQNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,168,1719903600"; 
   d="scan'208";a="66545570"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 22 Aug 2024 18:00:10 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shIet-000DLb-1d;
	Fri, 23 Aug 2024 01:00:07 +0000
Date: Fri, 23 Aug 2024 08:59:42 +0800
From: kernel test robot <lkp@intel.com>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 4761/5190]
 arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dtb: mailbox@f9011000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202408230854.adiYhW3u-lkp@intel.com>
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
commit: 02f2ddaa1a78cbebd4255f78260781b404225170 [4761/5190] ARM: dts: qcom: msm8226: Add CPU frequency scaling support
config: arm-randconfig-053-20240816 (https://download.01.org/0day-ci/archive/20240823/202408230854.adiYhW3u-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 26670e7fa4f032a019d23d56c6a02926e854e8af)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408230854.adiYhW3u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408230854.adiYhW3u-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/msm8226-motorola-falcon.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-apq8026-asus-sparrow.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-apq8026-samsung-matisse-wifi.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-apq8026-samsung-milletwifi.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-dempsey.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-makepeace.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-ms013g.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8226-samsung-s3ve3g.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8226-samsung-s3ve3g.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-msm8226-samsung-s3ve3g.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:585.28-596.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@f9927000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-superman-lte.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:585.28-596.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@f9927000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-msm8926-motorola-peregrine.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']
--
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1047.28-1098.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:751.27-754.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@1c4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@1c4)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:786.27-789.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s0-p2@1cd: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s1-p2@1cd)
   arch/arm/boot/dts/qcom/qcom-msm8226.dtsi:1034.11-1044.7: Warning (graph_child_address): /soc/display-subsystem@fd900000/display-controller@fd900000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dtb: mailbox@f9011000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon'] is too long
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,msm8226-apcs-kpss-global' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'qcom,sdm845-apss-shared' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dtb: /soc/mailbox@f9011000: failed to match any schema with compatible: ['qcom,msm8226-apcs-kpss-global', 'qcom,msm8916-apcs-kpss-global', 'syscon']
   arch/arm/boot/dts/qcom/qcom-msm8926-samsung-matisselte.dtb: /soc/clock@f9016000: failed to match any schema with compatible: ['qcom,msm8226-a7pll']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
