Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2874F1F8EFE
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 09:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733477691; cv=none; b=HVSvWX1He9BZJue/3RYGrslGxAQs3UEWG+jyd1SoemDnxWqQ8BygDi4eiGEuRHpsGFtXifJA74TNbrYJrL6YaV7/mROTVo5B5PJimD1TL1zEeOxCq12KmsN/CSE8FxKaD5q71B/FAkgiS8CrTLPnOWq88HnxZX+FsrRtZN4bhg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733477691; c=relaxed/simple;
	bh=vtX1xLYZNTyiL1UsRWfI5+qW3oEcr6oN3ut+pfovAkc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PIfGvZgHTYZY+DJ9p83Bkq/HNiKERE9JmDOqKX5oDrLO+tslIp0xzZGsq6cUy3xqVm9Xjjh3wP6B1VWWcMclJm57Atc8SokTP1XV+DlfHszeciEy7jEb8qMP8eLNwMjmUehqK1LwknWvvNKSU+fjGio/DkFD92UwJdQEm5+uBvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c045NSbv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c045NSbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733477689; x=1765013689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vtX1xLYZNTyiL1UsRWfI5+qW3oEcr6oN3ut+pfovAkc=;
  b=c045NSbvkQYbrcpNwNGy7v3t5YuGOWpo5uOS7vP1IIh/hZpixEn9bK9z
   u2n8+2opPofv6FS3xY3HEViHQ8fKtRJzutLun/g0acXuW7gdyGfTzQ8fL
   BxMlGEGcFN6m2m1P+SnGUKQfgxydiqndqkkPdLHeytvciQ3THIL5/EpDI
   cyKKi8VCN0iBZsn8a3FYxtoKLRKBsLkYzTYU+hwDQPZU2CkvUfjYTsEhX
   3kevWvX2D4QGGG5nkjiCGuTR8KWfw4bKzEDLofL2G3ss8XpPggfidCmNh
   1Zuzh5VSRPNdiIriPCTqyPyQi4U/LkBjXAiv+b9NgxuNIqO1hZiCVtkYB
   g==;
X-CSE-ConnectionGUID: 4d+Rn6sBTmatEnNGgKfVEQ==
X-CSE-MsgGUID: I/mbCYghS3Gt/mlC/XWmJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="51239645"
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="51239645"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2024 01:34:48 -0800
X-CSE-ConnectionGUID: ZPpm7EOlQOWVwnhosDvL5A==
X-CSE-MsgGUID: 0iJgZF46QziQ5E1mW9rgvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,213,1728975600"; 
   d="scan'208";a="98426321"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 06 Dec 2024 01:34:47 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJUjV-0000tx-0Q;
	Fri, 06 Dec 2024 09:34:45 +0000
Date: Fri, 6 Dec 2024 17:33:49 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Deng <quic_chunkaid@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 992/2197]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: power-controller@c300000:
 '#power-domain-cells' does not match any of the regexes: '^(cx|mx|ebi)$',
 'pinctrl-[0-9]+'
Message-ID: <202412061702.g338r9kf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   af2ea8ab7a546b430726183458da0a173d331272
commit: 0775021783b5536e390d1602d054542a29875593 [992/2197] arm64: dts: qcom: qcs615: add AOSS_QMP node
config: arm64-randconfig-051-20241204 (https://download.01.org/0day-ci/archive/20241206/202412061702.g338r9kf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061702.g338r9kf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061702.g338r9kf-lkp@intel.com/

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
