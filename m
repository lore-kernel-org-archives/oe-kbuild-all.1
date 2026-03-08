Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4743279DB3
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Mar 2026 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772988444; cv=none; b=E50Wdc0TVy3eb2vwBAini2FI1LKAPDusFZGfEHS+Bd3ZeyL8RcP4VHgqBj1JGQlKlqI+K9Ow/4cbdAz3DAZwu5PCwE62dU1iz9hgjwLFp3KHopFGuoJQto333W083K5HZhR/vA2KKP++IuR06sgyDFJI/TZ03gxzGN/tTWyvxAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772988444; c=relaxed/simple;
	bh=WtPQLZ9+XLaloDSCLUZryLj/c7kSha+tW6ucOF1ngi4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UsoTDgfgNzH6qygdtv1TScymRVj2ixxWfbeayyTXA4McWnpZflAWTvVZZXMgx6w0YP1UAl8Lj6FXfYYVYrStmTDraZ/Cz0uQgO0dTqiK8ryIUhNPhytDqii1l2q4DY+/vQ++Z/YySSiGU16bEAKiYW9Z/30M8ALFpX2RZ2eOS6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AcOYlVSZ; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AcOYlVSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772988442; x=1804524442;
  h=date:from:to:cc:subject:message-id;
  bh=WtPQLZ9+XLaloDSCLUZryLj/c7kSha+tW6ucOF1ngi4=;
  b=AcOYlVSZkIrOaU+RuJO5xOUYZH9q7zGD+BsPLEZZpfqMGYG0KHPC34cb
   okPdeUdPzAEhlCWGCA8V53th+YWmPQ1SlnbGSc6HBMtwzK/NZ0LslZ/qT
   9CGfp89tYxmO4DCefbk6h35ZNIX5o0rMFxKdt4cqZ8TQvpA1o8MSqMTIc
   XlqOO2hCPGfLvJvqSMgqFNI5zhhqYpGV1tsiR8FMJHVf4LzoGSO4nyTyv
   pL0BiAiHE6AKqVxOA/1DTjpVCyXXPufx38X+nOJ5qiVtZNAi+s4aqDoj0
   tJUMnucFiJtFNwdhgyA6MSuSx9PZhGxgzqURCtcBpQlj/EqD778/8pmni
   A==;
X-CSE-ConnectionGUID: qZEJcifESEKk9UsVthIGZg==
X-CSE-MsgGUID: JdpBA5cARsmKjS91yVHS1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85378884"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85378884"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2026 09:47:22 -0700
X-CSE-ConnectionGUID: RHmH8mdxSFeku1VaWytMTw==
X-CSE-MsgGUID: FO1CPuTrTc6LKQHaqniZXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="245592241"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 08 Mar 2026 09:47:20 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vzHHh-000000002gb-3wwZ;
	Sun, 08 Mar 2026 16:47:17 +0000
Date: Sun, 08 Mar 2026 17:47:00 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: ethernet@23040000
 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed
 ('interconnect-names', 'interconnects' were unexpected)
Message-ID: <202603081723.cAT3COSi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   db15f4990be1b8865ae651c9d748d43c91bb9d13
commit: b68fc45910d4eb1b3bb7e160282fba5a4bdd8409 [3/3] arm64: dts: qcom: lemans-evk: Add IMX577-based camera overlay
config: arm64-randconfig-2052-20260226 (https://download.01.org/0day-ci/archive/20260308/202603081723.cAT3COSi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260308/202603081723.cAT3COSi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603081723.cAT3COSi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@20c00000 (qcom,sa8775p-gpdsp0-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp0' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): glink-edge:fastrpc:label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: remoteproc@21c00000 (qcom,sa8775p-gpdsp1-pas): Unevaluated properties are not allowed ('glink-edge', 'interconnects', 'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sa8775p-pas.yaml
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: fastrpc (qcom,fastrpc): label:0: 'gdsp1' is not one of ['adsp', 'mdsp', 'sdsp', 'cdsp', 'cdsp1']
   	from schema $id: http://devicetree.org/schemas/misc/qcom,fastrpc.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@1c04000 (qcom,sa8775p-qmp-gen4x2-pcie-phy): clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@1c04000 (qcom,sa8775p-qmp-gen4x2-pcie-phy): clocks: [[56, 70], [56, 68], [56, 94], [56, 72], [56, 74], [56, 77]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@1c14000 (qcom,sa8775p-qmp-gen4x4-pcie-phy): clock-names: ['aux', 'cfg_ahb', 'ref', 'rchng', 'pipe', 'pipediv2'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@1c14000 (qcom,sa8775p-qmp-gen4x4-pcie-phy): clocks: [[56, 84], [56, 82], [56, 94], [56, 86], [56, 88], [56, 91]] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
