Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597A421FF45
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Sep 2025 03:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758254085; cv=none; b=J6A2nH3LO6FgTuHIfklobYO2uqVvVa7YQ/P02WAalylRiTed6EkPivtEn+rfKAvj1W7wdSvIRDVp/6G214VeQLidBO2mtBMlLKT8mVtHRggCsM6smvhK5pvdVoCJnqpE34BKSMOnslGn/JNDlQbr+yE3rJutxnA1+4+Gyq3QkTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758254085; c=relaxed/simple;
	bh=Sf5nh/BDe2TNfv/lOnsQrVmNhGTvFq/06UWvRl/Ij3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g6wTD9SEtpMJQtKzqtfW4YfbIeBZbYPemtxQTCqYE0RKiHVWvhOAvG0TgjHFbvAvc8yWfnV9HSIFsId5JOOFF+pRFOAftA96KLbsh91k9NZJ58022rsGJ3QeCTIl8hELOqj1gs0viV2q4oL2jVwI0JUD5y3lN//lZQs3kEbWo4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ndaXZDDJ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ndaXZDDJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758254083; x=1789790083;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Sf5nh/BDe2TNfv/lOnsQrVmNhGTvFq/06UWvRl/Ij3A=;
  b=ndaXZDDJ6uiinaHooAyB/luOl8xvMPbivgZCjAE80rn7YzP8cdNFWZit
   5vZE0tB4d+K6WpW3BAMHdze10cwMyMfVWqvDbhXIAod3j83iTL1235Vfp
   C08fdXeTd6/G38BkII0sGQW5NUko0wW2NHq5FO36t2PD9xhmhR2Qp1VNT
   BfCFMvsFSNj8t/fqAuE1HhsUhk2wgWchcW2lTpsINLRav5PGFeRlfq2tg
   ZZzusXHR9Tg9NtjkqqXcPt3dMWYFZkG9P+Ic6rPfUxhnEFEBzxhLKt64P
   KCoR5/KhjTKz5mjXU4pqSbF0vVflHvRlFKFksMCRqLwpeJioUSieEJfMH
   w==;
X-CSE-ConnectionGUID: yKA2GBNjRi+VvqE/cRp/aw==
X-CSE-MsgGUID: yX7yA+EJSkSh2Uz2z58Tiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11557"; a="83197524"
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="83197524"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2025 20:54:42 -0700
X-CSE-ConnectionGUID: X45YViEFSxCp3Yo/Hx98XA==
X-CSE-MsgGUID: Thx7d+cWQgS63epBpZG0CA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,276,1751266800"; 
   d="scan'208";a="175336892"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Sep 2025 20:54:40 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uzSCk-0003wx-0Z;
	Fri, 19 Sep 2025 03:54:38 +0000
Date: Fri, 19 Sep 2025 11:54:30 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Airlie <airlied@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 10092/10189]
 arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb:
 displayport-controller@ae90000 (qcom,sm8450-dp): clocks: [[195, 1], [195,
 11], [195, 14], [195, 17], [195, 18]] is too short
Message-ID: <202509191103.ib6czXAE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8f7f8b1b3f4c613dd886f53f768f82816b41eaa3
commit: 8641eeba2d82afd8706d64db21e95cf7f906c8c0 [10092/10189] Merge branch 'drm-next' of https://gitlab.freedesktop.org/drm/kernel.git
config: arm64-randconfig-051-20250918 (https://download.01.org/0day-ci/archive/20250919/202509191103.ib6czXAE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250919/202509191103.ib6czXAE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509191103.ib6czXAE-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3504.27-3577.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3598.27-3652.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-samsung-r0q.dtb: displayport-controller@ae90000 (qcom,sm8450-dp): clocks: [[195, 1], [195, 11], [195, 14], [195, 17], [195, 18]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
--
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: mmc@87c4000 (qcom,sa8775p-sdhci): compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5'] is too long
   	'qcom,sa8775p-sdhci' is not one of ['qcom,sdhci-msm-v4']
   	'qcom,sa8775p-sdhci' is not one of ['qcom,apq8084-sdhci', 'qcom,ipq4019-sdhci', 'qcom,ipq8074-sdhci', 'qcom,msm8226-sdhci', 'qcom,msm8953-sdhci', 'qcom,msm8974-sdhci', 'qcom,msm8976-sdhci', 'qcom,msm8916-sdhci', 'qcom,msm8992-sdhci', 'qcom,msm8994-sdhci', 'qcom,msm8996-sdhci', 'qcom,msm8998-sdhci']
   	'qcom,sa8775p-sdhci' is not one of ['qcom,ipq5018-sdhci', 'qcom,ipq5332-sdhci', 'qcom,ipq5424-sdhci', 'qcom,ipq6018-sdhci', 'qcom,ipq9574-sdhci', 'qcom,milos-sdhci', 'qcom,qcm2290-sdhci', 'qcom,qcs404-sdhci', 'qcom,qcs615-sdhci', 'qcom,qcs8300-sdhci', 'qcom,qdu1000-sdhci', 'qcom,sar2130p-sdhci', 'qcom,sc7180-sdhci', 'qcom,sc7280-sdhci', 'qcom,sc8280xp-sdhci', 'qcom,sdm630-sdhci', 'qcom,sdm670-sdhci', 'qcom,sdm845-sdhci', 'qcom,sdx55-sdhci', 'qcom,sdx65-sdhci', 'qcom,sdx75-sdhci', 'qcom,sm6115-sdhci', 'qcom,sm6125-sdhci', 'qcom,sm6350-sdhci', 'qcom,sm6375-sdhci', 'qcom,sm7150-sdhci', 'qcom,sm8150-sdhci', 'qcom,sm8250-sdhci', 'qcom,sm8350-sdhci', 'qcom,sm8450-sdhci', 'qcom,sm8550-sdhci', 'qcom,sm8650-sdhci', 'qcom,x1e80100-sdhci']
   	'qcom,sdhci-msm-v4' was expected
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: mmc@87c4000 (qcom,sa8775p-sdhci): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mmc/sdhci-msm.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: /soc@0/mmc@87c4000: failed to match any schema with compatible: ['qcom,sa8775p-sdhci', 'qcom,sdhci-msm-v5']
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): clocks: [[253, 1], [253, 11], [253, 15], [253, 18], [253, 19]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af54000 (qcom,sa8775p-dp): reg: [[0, 183844864, 0, 260], [0, 183845376, 0, 192], [0, 183848960, 0, 1904], [0, 183853056, 0, 156], [0, 183857152, 0, 156]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): clocks: [[253, 1], [253, 28], [253, 32], [253, 35], [253, 36]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: displayport-controller@af5c000 (qcom,sa8775p-dp): reg: [[0, 183877632, 0, 260], [0, 183878144, 0, 192], [0, 183881728, 0, 1904], [0, 183885824, 0, 156], [0, 183889920, 0, 156]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge:fastrpc:label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): glink-edge: Unevaluated properties are not allowed ('fastrpc' was unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml#
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
