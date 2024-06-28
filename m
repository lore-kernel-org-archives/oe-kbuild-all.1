Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C577345B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Jun 2024 21:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719610642; cv=none; b=qdjYr39+e/QyQuSwa8kOdSqfPy5jdHZ57QLJB/vfPIzxxOrWjJUfWECiXRwAjz8p8vhBgOn5wAs6m/C1nu7VVuIOIYkYA9ytYaONbQ+Da46VIcWRtr/hcLBkKEZ/8p4deFewNtl9iqGHv3LKu7SrGGQK223VwDw1bzMwxYb//HA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719610642; c=relaxed/simple;
	bh=Yf3PplP2fZkuuJn6kDrv/xyBbh6Wplp2D5XybNApFEk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mfUUUpfYTjDUIQyNqdtf9eXK4pJwsNCKl4/zjPldQs0kru7u9JsqIHWC/c8arbJeK5XVeUflL+sLIGuHqnP6yB0/JuPty7ohO++1G+QXRg/CGP9un8P0mYOtiOZYaJVu/Rzfh1ZsnGyhugtckKZ6wjsav9h6MY3Ke46StkvU0wU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z9kIB3Hr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z9kIB3Hr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719610641; x=1751146641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yf3PplP2fZkuuJn6kDrv/xyBbh6Wplp2D5XybNApFEk=;
  b=Z9kIB3HrKBmjQI9RKa2zS19/wh6t6g5UcTjQP9zEltWB0o9EN9U5X/9z
   koWUAZFawrZot8Ps5E87mowCKBzwWMr6fspsEh8lpPpsiDzHPNtMJV54t
   m9yS/ohxA7ZspgiLoQTx9niwr5ucUYL84M7VJfwHsZK5unjktLk347AEu
   b8iaBzinxkmzvqtMnz84LebLpeAQCP0v19dpEBk+uIz3UhacBhUMjgZ7F
   9u9kr4l0nl25Rugp3TVnAZuxc/ccK96pf2e6SOFZqyw6DJtbOayn08Tbm
   N1k3nfgSLVJYnFiXEtn0bpMP225z/KLUJpb8YRJNnzYwhKCFmRQv+t3h8
   A==;
X-CSE-ConnectionGUID: U3kmPNIyQpasrABOFiOD9g==
X-CSE-MsgGUID: k+xGosGVRF+iqwEA/ccOMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16934355"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="16934355"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 14:37:20 -0700
X-CSE-ConnectionGUID: 7kzTTNfrSm2N2dYi43VHTw==
X-CSE-MsgGUID: HftQPt1OSSqqiL8/mENNUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; 
   d="scan'208";a="44741208"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jun 2024 14:37:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sNJHR-000IVO-1B;
	Fri, 28 Jun 2024 21:37:17 +0000
Date: Sat, 29 Jun 2024 05:36:59 +0800
From: kernel test robot <lkp@intel.com>
To: Naina Mehta <quic_nainmeht@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>
Subject: [qcom:arm64-for-6.11 55/251] arch/arm64/boot/dts/qcom/sdx75-idp.dtb:
 mmc@8804000: Unevaluated properties are not allowed ('compatible' was
 unexpected)
Message-ID: <202406290529.BZhFEoeC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.11
head:   fd513b922e34edb0db1284a4abee7f6c10ffd9a7
commit: a1b05c448e74a092c59a84b16e9d4a673c764f1f [55/251] arm64: dts: qcom: sdx75-idp: add SDHCI for SD Card
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240629/202406290529.BZhFEoeC-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240629/202406290529.BZhFEoeC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406290529.BZhFEoeC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: mmc@8804000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sdx75-sdhci', 'qcom,sdhci-msm-v5'] is too long
   	'qcom,sdx75-sdhci' is not one of ['qcom,sdhci-msm-v4']
   	'qcom,sdx75-sdhci' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', 'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhci']
   	'qcom,sdx75-sdhci' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs404-sdhci', 'qcom,qdu1000-sdhci', 'qcom,sc7180-sdhci', 'qcom,sc7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhci', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'qcom,sm6375-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-sdhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom,sm8650-sdhci']
   	'qcom,sdhci-msm-v4' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
>> arch/arm64/boot/dts/qcom/sdx75-idp.dtb: mmc@8804000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: /soc@0/mmc@8804000: failed to match any schema with compatible: ['qcom,sdx75-sdhci', 'qcom,sdhci-msm-v5']
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/sdx75-idp.dtb: usb@a6f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
