Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B512415575E
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 04:32:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733718742; cv=none; b=OrG5CxHcs/OOAwy7MU8eHreLZZbvfZJdq6nLlYlws1sQnC0fmiQGAoRunffLO8XS3i+GIxgBiwKLHIrnEGrv1+v9VSXFehQy2V202VRu5w/rl3EQF7iRZw4lknencNVX7OoMY9JwPzys5In8JS3QdkFchVLc5JhtbjmmAnqQDfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733718742; c=relaxed/simple;
	bh=qFTRCPB8v9ZvkwASzsELMdrqZU36kabEXei3B7xsjQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wike4PzMEwviOJCzBmrPkVl4Ox+9W+DgTKQ17MRZEQNm8e9BVetVPwhNSiKMK42GQMs4kzioGv0nnh8xZbqHaPH5uLYK13uZkjlDOLjGfAvs8/UXVJ7QQjQLYPhar1lB8NDcj5/qnLrwkicjOrCD1CZ7S+KlTaCgAeJd6qJM8Nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HtlxfBdx; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HtlxfBdx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733718740; x=1765254740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qFTRCPB8v9ZvkwASzsELMdrqZU36kabEXei3B7xsjQs=;
  b=HtlxfBdx85fAIQAT1Ot7tZvp8miNm40xjFqRfgqhDQkzP129/oaljRs6
   nbIGceUMTBnEa+F8OQtlHXOVuWW1IUF2BBN1oAgAuDYwafw0xc0XS6g/Q
   uj8fVy9oxl0z8KL0dq+GLkBsbeirXgDX0GGkj07w9uMeqVTnxPEjzfc0I
   /xRQyKlh2jphaQgg+q6Wh6A8DVA44Pb8ha9KECS/1ldlyAIncBNCT3SPV
   iihYcC86mAZG5rIfT0b8B7scxEN22D68usgYjKlWHVXGVQ5WuTXupRk/v
   TxyiZqEDskFhE0KOWV5KAFJ+rHLS6D6djuSh9WBgMwT4b0lW+55XpSTsm
   w==;
X-CSE-ConnectionGUID: efwg8yZ+RAWW1UBC8qFmTw==
X-CSE-MsgGUID: 2DnWM00GSEyRNyjkCoHNrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="37931081"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="37931081"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:32:20 -0800
X-CSE-ConnectionGUID: 7gR7HcHcT36bV9I0TwHYeA==
X-CSE-MsgGUID: CvRn1lxYTKyfnMLYo7dC9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94825382"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2024 20:32:19 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVRQ-0003s7-0l;
	Mon, 09 Dec 2024 04:32:16 +0000
Date: Mon, 9 Dec 2024 12:31:40 +0800
From: kernel test robot <lkp@intel.com>
To: Lijuan Gao <quic_lijuang@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [linux-next:master 1000/2462]
 arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000:
 'clock-names' is a required property
Message-ID: <202412080613.cLIlqLNv-lkp@intel.com>
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
commit: d1fdad9911e269998e63c60fdeb7ffb378785387 [1000/2462] arm64: dts: qcom: qcs615: add base RIDE board
config: arm64-randconfig-051-20241204 (https://download.01.org/0day-ci/archive/20241208/202412080613.cLIlqLNv-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev3+g93ee800
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241208/202412080613.cLIlqLNv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412080613.cLIlqLNv-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: clock-controller@100000: 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/qcom,qcs615-gcc.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: compatible:0: 'qcom,qcs615-qfprom' is not one of ['qcom,apq8064-qfprom', 'qcom,apq8084-qfprom', 'qcom,ipq5332-qfprom', 'qcom,ipq6018-qfprom', 'qcom,ipq8064-qfprom', 'qcom,ipq8074-qfprom', 'qcom,ipq9574-qfprom', 'qcom,msm8226-qfprom', 'qcom,msm8916-qfprom', 'qcom,msm8974-qfprom', 'qcom,msm8976-qfprom', 'qcom,msm8996-qfprom', 'qcom,msm8998-qfprom', 'qcom,qcm2290-qfprom', 'qcom,qcs404-qfprom', 'qcom,sc7180-qfprom', 'qcom,sc7280-qfprom', 'qcom,sc8280xp-qfprom', 'qcom,sdm630-qfprom', 'qcom,sdm670-qfprom', 'qcom,sdm845-qfprom', 'qcom,sm6115-qfprom', 'qcom,sm6350-qfprom', 'qcom,sm6375-qfprom', 'qcom,sm8150-qfprom', 'qcom,sm8250-qfprom', 'qcom,sm8450-qfprom', 'qcom,sm8550-qfprom', 'qcom,sm8650-qfprom']
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: efuse@780000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/efuse@780000: failed to match any schema with compatible: ['qcom,qcs615-qfprom', 'qcom,qfprom']
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: interrupt-controller@b220000: compatible:0: 'qcom,qcs615-pdc' is not one of ['qcom,qdu1000-pdc', 'qcom,sa8255p-pdc', 'qcom,sa8775p-pdc', 'qcom,sar2130p-pdc', 'qcom,sc7180-pdc', 'qcom,sc7280-pdc', 'qcom,sc8180x-pdc', 'qcom,sc8280xp-pdc', 'qcom,sdm670-pdc', 'qcom,sdm845-pdc', 'qcom,sdx55-pdc', 'qcom,sdx65-pdc', 'qcom,sdx75-pdc', 'qcom,sm4450-pdc', 'qcom,sm6350-pdc', 'qcom,sm8150-pdc', 'qcom,sm8250-pdc', 'qcom,sm8350-pdc', 'qcom,sm8450-pdc', 'qcom,sm8550-pdc', 'qcom,sm8650-pdc', 'qcom,x1e80100-pdc']
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/qcom,pdc.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/interrupt-controller@b220000: failed to match any schema with compatible: ['qcom,qcs615-pdc', 'qcom,pdc']
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
   arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/watchdog@17c10000: failed to match any schema with compatible: ['qcom,apss-wdt-qcs615', 'qcom,kpss-wdt']
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: rsc@18200000: clock-controller:compatible:0: 'qcom,qcs615-rpmh-clk' is not one of ['qcom,qdu1000-rpmh-clk', 'qcom,sa8775p-rpmh-clk', 'qcom,sar2130p-rpmh-clk', 'qcom,sc7180-rpmh-clk', 'qcom,sc7280-rpmh-clk', 'qcom,sc8180x-rpmh-clk', 'qcom,sc8280xp-rpmh-clk', 'qcom,sdm670-rpmh-clk', 'qcom,sdm845-rpmh-clk', 'qcom,sdx55-rpmh-clk', 'qcom,sdx65-rpmh-clk', 'qcom,sdx75-rpmh-clk', 'qcom,sm4450-rpmh-clk', 'qcom,sm6350-rpmh-clk', 'qcom,sm8150-rpmh-clk', 'qcom,sm8250-rpmh-clk', 'qcom,sm8350-rpmh-clk', 'qcom,sm8450-rpmh-clk', 'qcom,sm8550-rpmh-clk', 'qcom,sm8650-rpmh-clk', 'qcom,x1e80100-rpmh-clk']
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
>> arch/arm64/boot/dts/qcom/qcs615-ride.dtb: /soc@0/rsc@18200000/clock-controller: failed to match any schema with compatible: ['qcom,qcs615-rpmh-clk']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
