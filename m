Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5031E1E12
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 06:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783751590; cv=none; b=EQUIUoKGesr4A4ws2/+H5DPR8Nv+t6hOu9r+bZuLOue1fm/rCAEHqLxY2mothti4OYjbXbupQdFRsY/BM5L0h0gbGbntmLmSXwVcgVQ/0pKMqYa5QlcuFpeT5ocXH7p0BbYiOntNCsfmWQDLVbscjPbP93bwWh9dRTD7oA9sjSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783751590; c=relaxed/simple;
	bh=7b0vrJPPZ6hgfoVpjnavlUyZhJV2/o3waAK61CYvpQs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ID0eg9SxkwuL/c4uDuQSx1jsKOexv6SYKW4I234TLhTlqdFke2wqKrc9pojsjw5+3e6VIQ/k3/kswSHszBvadhJj1WWTsYlC8s6/yAuG2VXma1E7TziwLSIJf+JSnDF2orWkVwZqfg3tl+CKd6eoHmfLCwbOIsr8djhrjyijOmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TE3upOmW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TE3upOmW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783751588; x=1815287588;
  h=date:from:to:cc:subject:message-id;
  bh=7b0vrJPPZ6hgfoVpjnavlUyZhJV2/o3waAK61CYvpQs=;
  b=TE3upOmWVHTwlzSl7FclaoPDwVBVO9WBaK/sX3sxBcXFxoMn3FDBsxse
   RR2s3CP9Hwvqovd1XREL+qqro+bS9N+QppcKD0Ug26iCmQmdUGjS9BI9T
   +pzZIwa/Gs1y1Ykz/g1tn5TJCcJnAoquWcEcGGkgzooSoelBfqhx4WJqj
   5mQg+0u/JtStI+esztEHX25jlFiWrtYlMLuO2nWb9nvQwsOf+/51nk9x4
   qQngUUCdK2wOdu/b/+hktfqqtp4XaHCFhpu+8r58lh0mcty/KQSIMZpeM
   RRs+7XanGPd3o3O92Lrm2saGJYh05FQ3hJty+yPi4A/SGHcyFVhLuxtw3
   w==;
X-CSE-ConnectionGUID: nH/mSyfaQnS3TDV+fNjZ1g==
X-CSE-MsgGUID: 0ttwWkwhQOuc2cJiyUix2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="94794287"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="94794287"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 23:33:08 -0700
X-CSE-ConnectionGUID: 2SxkatXtSUqJkueqn1G03A==
X-CSE-MsgGUID: 884+FnkLSK67SEHGwv4suw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251096384"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 10 Jul 2026 23:33:06 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiRGp-000000003Jb-1pZQ;
	Sat, 11 Jul 2026 06:33:03 +0000
Date: Sat, 11 Jul 2026 08:32:31 +0200
From: kernel test robot <lkp@intel.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Subject: [linux-next:master 4424/5655]
 arch/arm64/boot/dts/qcom/eliza-cqs-evk.dtb: pmu@24091000
 (qcom,eliza-llcc-bwmon): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202607110850.nqkH7qlJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bee763d5f341b99cf472afeb508d4988f62a6ca1
commit: 4e967cad02bce8983c4e826cd13ef0e730692832 [4424/5655] arm64: dts: qcom: eliza: Add CPU and LLCC BWMONs
config: arm64-randconfig-2055-20260710 (https://download.01.org/0day-ci/archive/20260711/202607110850.nqkH7qlJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110850.nqkH7qlJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110850.nqkH7qlJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/eliza.dtsi:2380.27-2466.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/eliza.dtsi:2488.27-2550.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/eliza-cqs-evk.dtb: pmu@24091000 (qcom,eliza-llcc-bwmon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-llcc-bwmon', 'qcom,sc7280-llcc-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,eliza-llcc-bwmon' is not one of ['qcom,glymur-cpu-bwmon', 'qcom,hawi-cpu-bwmon', 'qcom,kaanapali-cpu-bwmon', 'qcom,qcm2290-cpu-bwmon', 'qcom,qcs615-cpu-bwmon', 'qcom,qcs8300-cpu-bwmon', 'qcom,sa8775p-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,sm8750-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
   	'qcom,eliza-llcc-bwmon' is not one of ['qcom,hawi-llcc-bwmon', 'qcom,qcs615-llcc-bwmon', 'qcom,qcs8300-llcc-bwmon', 'qcom,sa8775p-llcc-bwmon', 'qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	'qcom,sdm845-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml
>> arch/arm64/boot/dts/qcom/eliza-cqs-evk.dtb: /soc@0/pmu@24091000: failed to match any schema with compatible: ['qcom,eliza-llcc-bwmon', 'qcom,sc7280-llcc-bwmon']
>> arch/arm64/boot/dts/qcom/eliza-cqs-evk.dtb: pmu@240b7400 (qcom,eliza-cpu-bwmon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,eliza-cpu-bwmon' is not one of ['qcom,glymur-cpu-bwmon', 'qcom,hawi-cpu-bwmon', 'qcom,kaanapali-cpu-bwmon', 'qcom,qcm2290-cpu-bwmon', 'qcom,qcs615-cpu-bwmon', 'qcom,qcs8300-cpu-bwmon', 'qcom,sa8775p-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,sm8750-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
   	'qcom,eliza-cpu-bwmon' is not one of ['qcom,hawi-llcc-bwmon', 'qcom,qcs615-llcc-bwmon', 'qcom,qcs8300-llcc-bwmon', 'qcom,sa8775p-llcc-bwmon', 'qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml
>> arch/arm64/boot/dts/qcom/eliza-cqs-evk.dtb: /soc@0/pmu@240b7400: failed to match any schema with compatible: ['qcom,eliza-cpu-bwmon', 'qcom,sdm845-bwmon']
--
   arch/arm64/boot/dts/qcom/eliza.dtsi:2488.27-2550.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: pmu@24091000 (qcom,eliza-llcc-bwmon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-llcc-bwmon', 'qcom,sc7280-llcc-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,eliza-llcc-bwmon' is not one of ['qcom,glymur-cpu-bwmon', 'qcom,hawi-cpu-bwmon', 'qcom,kaanapali-cpu-bwmon', 'qcom,qcm2290-cpu-bwmon', 'qcom,qcs615-cpu-bwmon', 'qcom,qcs8300-cpu-bwmon', 'qcom,sa8775p-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,sm8750-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
   	'qcom,eliza-llcc-bwmon' is not one of ['qcom,hawi-llcc-bwmon', 'qcom,qcs615-llcc-bwmon', 'qcom,qcs8300-llcc-bwmon', 'qcom,sa8775p-llcc-bwmon', 'qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	'qcom,sdm845-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/pmu@24091000: failed to match any schema with compatible: ['qcom,eliza-llcc-bwmon', 'qcom,sc7280-llcc-bwmon']
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: pmu@240b7400 (qcom,eliza-cpu-bwmon): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,eliza-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,eliza-cpu-bwmon' is not one of ['qcom,glymur-cpu-bwmon', 'qcom,hawi-cpu-bwmon', 'qcom,kaanapali-cpu-bwmon', 'qcom,qcm2290-cpu-bwmon', 'qcom,qcs615-cpu-bwmon', 'qcom,qcs8300-cpu-bwmon', 'qcom,sa8775p-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,sm8750-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
   	'qcom,eliza-cpu-bwmon' is not one of ['qcom,hawi-llcc-bwmon', 'qcom,qcs615-llcc-bwmon', 'qcom,qcs8300-llcc-bwmon', 'qcom,sa8775p-llcc-bwmon', 'qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml
>> arch/arm64/boot/dts/qcom/eliza-mtp.dtb: /soc@0/pmu@240b7400: failed to match any schema with compatible: ['qcom,eliza-cpu-bwmon', 'qcom,sdm845-bwmon']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
