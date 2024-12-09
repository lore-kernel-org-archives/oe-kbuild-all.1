Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DE6158531
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:49:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733719785; cv=none; b=SXumDPuxAIPlYgPRXeOvwlOW5slu///WoR7dG4kO+p3Ef6qmJGAjlCEpdi/HcK9xvB2qUq8zxg+TgDNw4GfJvGlPOAJID9yIWCsau20jMEwBYktQbHJ2ZMEMRU0TG89/EnSBfat3lX5wlHQ78K4KubNHaGdUNTAnZV0ZrCLScww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733719785; c=relaxed/simple;
	bh=Gjj7P43OvzSYkje+AgdN+939fkls1Cw3GmTNqzfNxfI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bbYjeM9wTwADZSaGHJ+s6cC95I3iGbhMUkK0eM2QRmXufuFJ5ZDbIvUVXeGkhgUt8VvA63lvzt07IZTmI8hKsi0PJ5mOErgMp7sQTPcdAtGkogFVE5ATqjSc95ClvyiLMyikkNjoAwyLijTbDsO4GS5OERdsdKCbKbNBELzokSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JiDxC+tN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JiDxC+tN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733719783; x=1765255783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Gjj7P43OvzSYkje+AgdN+939fkls1Cw3GmTNqzfNxfI=;
  b=JiDxC+tNFG+QC926VJZjfxSsrNYXSGUgByxguKU2b9j6CbIAvu+xcp3z
   D6wbgFVFwaMJZ0OE2N0WUqjB66i8k1uaeY/4ne/44ffWAxosFDoIgURzs
   IzEyreDdZm90ThWpu1UsPZYFJAjyAqB3N0tjJg39xckX+6DG2jjVvr5kS
   kz3X1Rn3XB+t1V5O5DTo9V2phmtXCVVaGIvI7f+eGxM6CIreUGgNCPTd4
   oIgTdnTDNf+a6cGrOBZ/3EkgYRbZlgEU5nqku0KlFT41MVGV3ldm7TqBr
   TFKFBD5rM3hdbz4WI86lJCMTf/1U2gB/8CMorUgG02ffcUKe44cpJaWeT
   g==;
X-CSE-ConnectionGUID: jYYt9Lv+QbS1MPkjox1Beg==
X-CSE-MsgGUID: YAGVvcvRR7GupodcMdTh4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="51416435"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="51416435"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:49:41 -0800
X-CSE-ConnectionGUID: TTTjUBWbQEWQI7qr225hcQ==
X-CSE-MsgGUID: LOd7qolkS2aNnCo7JNfxOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95406775"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 08 Dec 2024 20:49:39 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKViD-0003vb-0z;
	Mon, 09 Dec 2024 04:49:37 +0000
Date: Mon, 9 Dec 2024 12:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Deng <quic_chunkaid@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 1001/2462]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000:
 '#power-domain-cells' does not match any of the regexes: '^(cx|mx|ebi)$',
 'pinctrl-[0-9]+'
Message-ID: <202412082149.3mJjB70S-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
commit: 0775021783b5536e390d1602d054542a29875593 [1001/2462] arm64: dts: qcom: qcs615: add AOSS_QMP node
config: arm64-randconfig-051-20241204 (https://download.01.org/0day-ci/archive/20241208/202412082149.3mJjB70S-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412082149.3mJjB70S-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412082149.3mJjB70S-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: compatible:0: 'qcom,qcs615-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/efuse@780000: failed to match any schema with compatible: ['qcom,qcs615-qfprom', 'qcom,qfprom']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs615-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs615-pdc', 'qcom,pdc']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000: compatible:0: 'qcom,qcs615-aoss-qmp' is not one of ['qcom,qcs8300-aoss-qmp', 'qcom,qdu1000-aoss-qmp', 'qcom,sa8255p-aoss-qmp', 'qcom,sa8775p-aoss-qmp', 'qcom,sar2130p-aoss-qmp', 'qcom,sc7180-aoss-qmp', 'qcom,sc7280-aoss-qmp', 'qcom,sc8180x-aoss-qmp', 'qcom,sc8280xp-aoss-qmp', 'qcom,sdx75-aoss-qmp', 'qcom,sdm845-aoss-qmp', 'qcom,sm6350-aoss-qmp', 'qcom,sm8150-aoss-qmp', 'qcom,sm8250-aoss-qmp', 'qcom,sm8350-aoss-qmp', 'qcom,sm8450-aoss-qmp', 'qcom,sm8550-aoss-qmp', 'qcom,sm8650-aoss-qmp', 'qcom,sm8750-aoss-qmp', 'qcom,x1e80100-aoss-qmp']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000: '#power-domain-cells' does not match any of the regexes: '^(cx|mx|ebi)$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/power-controller@c300000: failed to match any schema with compatible: ['qcom,qcs615-aoss-qmp', 'qcom,aoss-qmp']
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: mailbox@17c00000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared'] is too short
   	['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared'] is too long
   	'qcom,qcs615-apss-shared' is not one of ['qcom,ipq5018-apcs-apps-global', 'qcom,ipq5332-apcs-apps-global', 'qcom,ipq8074-apcs-apps-global', 'qcom,ipq9574-apcs-apps-global']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,qcs404-apcs-apps-global']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8974-apcs-kpss-global', 'qcom,msm8976-apcs-kpss-global']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8998-apcs-hmss-global', 'qcom,sdm660-apcs-hmss-global', 'qcom,sm4250-apcs-hmss-global', 'qcom,sm6115-apcs-hmss-global', 'qcom,sm6125-apcs-hmss-global']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,sc7180-apss-shared', 'qcom,sc8180x-apss-shared', 'qcom,sm8150-apss-shared']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,msm8916-apcs-kpss-global', 'qcom,msm8939-apcs-kpss-global', 'qcom,msm8953-apcs-kpss-global', 'qcom,msm8994-apcs-kpss-global', 'qcom,sdx55-apcs-gcc']
   	'qcom,qcs615-apss-shared' is not one of ['qcom,ipq6018-apcs-apps-global', 'qcom,msm8996-apcs-hmss-global', 'qcom,qcm2290-apcs-hmss-global', 'qcom,sdm845-apss-shared']
   	'qcom,ipq6018-apcs-apps-global' was expected
   	'qcom,msm8916-apcs-kpss-global' was expected
   	'qcom,msm8994-apcs-kpss-global' was expected
   	'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/qcom,apcs-kpss-global.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/mailbox@17c00000: failed to match any schema with compatible: ['qcom,qcs615-apss-shared', 'qcom,sdm845-apss-shared']
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: watchdog@17c10000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt'] is too long
   	['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt'] is too short
   	'qcom,apss-wdt-qcs615' is not one of ['qcom,kpss-wdt-ipq4019', 'qcom,apss-wdt-ipq5018', 'qcom,apss-wdt-ipq5332', 'qcom,apss-wdt-ipq9574', 'qcom,apss-wdt-msm8226', 'qcom,apss-wdt-msm8974', 'qcom,apss-wdt-msm8994', 'qcom,apss-wdt-qcm2290', 'qcom,apss-wdt-qcs404', 'qcom,apss-wdt-sa8255p', 'qcom,apss-wdt-sa8775p', 'qcom,apss-wdt-sc7180', 'qcom,apss-wdt-sc7280', 'qcom,apss-wdt-sc8180x', 'qcom,apss-wdt-sc8280xp', 'qcom,apss-wdt-sdm845', 'qcom,apss-wdt-sdx55', 'qcom,apss-wdt-sdx65', 'qcom,apss-wdt-sm6115', 'qcom,apss-wdt-sm6350', 'qcom,apss-wdt-sm8150', 'qcom,apss-wdt-sm8250']
   	'qcom,kpss-wdt' was expected
   	'qcom,scss-timer' was expected
   	'qcom,apss-wdt-qcs615' is not one of ['qcom,kpss-wdt-apq8064', 'qcom,kpss-wdt-ipq8064', 'qcom,kpss-wdt-mdm9615', 'qcom,kpss-wdt-msm8960']
   	'qcom,msm-timer' was expected
   	'qcom,kpss-timer' was expected
   	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
