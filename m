Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FD1F1C860B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764430994; cv=none; b=R5wlpTxMY1FkBYWZaFQA059hDfXe1sjiSrv3jYgPybYcGirm3nZS44Pb3N09XINHG5wgJQWSBdDW1zlyir7K0TIHGqAyvo+f2GjzNRXNbpAS55ttbqhI5up7Hvua/dtPh2zYIvxIy+EIYN44/e3Sij5c6jKyxS3GxOO8bJhyEb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764430994; c=relaxed/simple;
	bh=P9MyQFx+4xhL5Rxwz8pWpBf1siBNEJ3BUeVfBZkxrdY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ReDtyENvEUyrwsAV1ARKQP/YthnhDXG21fSl/2vyitrFwIESHWsTqp0DJwEov43Oo9/iLuz6nOwypntqESE8vwmIDLL/ZmlR+dxvQ6X53h7MUv928QJcmiPpkzGLG05FtmUC/f2Q4ZwtyUPV92Fp/Lp8ASOPtcUXbQqdPQE+X/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlE4s35L; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlE4s35L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764430992; x=1795966992;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9MyQFx+4xhL5Rxwz8pWpBf1siBNEJ3BUeVfBZkxrdY=;
  b=XlE4s35L05dYF8vS6LXsyXpEYXBK4klwp6RK46VkNAKJ2wiWhXgBGOvN
   Weh3o52pgzQ+UJ2zaoyQ9exTRBCnmT75hRzJwd4d8CgQRqxKBSmdd8hlL
   qB9SgazUsTDpNK6EtkXUwd9yHDh2N1AE+D8oCdc64yVWqlGtSTX+MIHoX
   duGXNxlFp5ZvteuS1jRuPg4aPj/ODZPP8wqITfTVZmlmOxbsf7H0fDl6J
   tM1iS8t+E6Pb8BAdU+fV4sPi3r/UAry8R5leImez+WnB8DVWt1He0V9zD
   KB2JP9CyEemLqpt22seiwBxE8rjhB83wtubOpKC4rNG1JpeoFYfm87Bh7
   w==;
X-CSE-ConnectionGUID: MKf03gwvTfSojQTyUxHEvw==
X-CSE-MsgGUID: nRV+0UvvS9yEOWMRGUJL/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="83812889"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="83812889"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 07:43:11 -0800
X-CSE-ConnectionGUID: W7T6JGGbQn+NmZK/Z3ykRA==
X-CSE-MsgGUID: +OM3PzGlRLCBbi2jykyL1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="194103251"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 29 Nov 2025 07:43:10 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPN6J-000000002ML-3JTT;
	Sat, 29 Nov 2025 15:43:07 +0000
Date: Sat, 29 Nov 2025 16:42:29 +0100
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 11964/12740]
 arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@1b300000
 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
Message-ID: <202511291600.yEqmaKQV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7d31f578f3230f3b7b33b0930b08f9afd8429817
commit: ca079ec3ebed19a12c1bf080496dacbc6fdfbb39 [11964/12740] dt-bindings: remoteproc: qcom,sc8280xp-pas: Fix CDSP power desc
config: arm64-randconfig-2052-20251128 (https://download.01.org/0day-ci/archive/20251129/202511291600.yEqmaKQV-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511291600.yEqmaKQV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511291600.yEqmaKQV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[60, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[60, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4541.12-4545.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp'] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13]] is too short
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
