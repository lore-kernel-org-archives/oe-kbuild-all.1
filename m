Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF90719C553
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Feb 2026 05:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772257243; cv=none; b=Lueuzp4mtrDGjq5KfeWS0PFRs+hwGg5R8alYdU3YHuCD+Dls0z5LDrgW4BgNNAqosbiDWp295TTWGyG4skhc6wMMhLyEWRXsultXfALCidMXPf2ylrk7fnj2GErRjAx5N+i0KRy/16tUqSCUwrnCxYDIde1jY4R8ml9EDfJZoTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772257243; c=relaxed/simple;
	bh=DyBPhgYY8IoSLFiSD65DxhpHDLm5jXLHPkdxpDjXvO8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HoLc5D+hNx5QrGENvBWBrvCjr1fpxN5wsydjW3F0m8PjY4LDLTDwcGq7Q03+/myWRxefUbqP+Mct4xS6iZiQH23+m0XDXjRjMQUFdwAqEtTtUGBKtCqfdWm+NnN64OsWSnljeNYHxQ403T330JGYNf7yRZLXXsts/tX4MRGMMQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZudmKuOd; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZudmKuOd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772257241; x=1803793241;
  h=date:from:to:cc:subject:message-id;
  bh=DyBPhgYY8IoSLFiSD65DxhpHDLm5jXLHPkdxpDjXvO8=;
  b=ZudmKuOdUbaKRWHGwo92DINEyc5/pspVR0655u2w7r87IgPSYO00voSl
   Q+TGem2Ze4i69lBQORX3qeFCt57Lg/iAbPfMAbVaRrgKRBgz/Ww4LXBdA
   0weeuo97xwlKO0AM/gexe83S2uzQn68E6jZfMr4imhqG8Jz27+/eHZHNU
   /szJbAMkaCfo7hTWA8iBLUnyT0qahmB9/XMy5KdCrwQljGoCoHi1O47VA
   PYc8P5vpP8ii4aewtWwePQ9RM+c0heyXQP6EWd7mP53keJ7A82o+sl0hD
   tC4c6xus9/aCU7QZUWCijqdl9ZpSriwNDBXwyWb9tGKlmZr86AzdiRiLs
   Q==;
X-CSE-ConnectionGUID: suol28xKS1KmomFmLdNwgQ==
X-CSE-MsgGUID: S+j0uU7WQy2gk6sSct4EeA==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84806286"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="84806286"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 21:40:40 -0800
X-CSE-ConnectionGUID: untwuT/TSZCiZMI64b/j2Q==
X-CSE-MsgGUID: N3Tl4vW3QAW8JD7A/w2CFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="214451411"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 27 Feb 2026 21:40:39 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwD48-000000000hx-2lt1;
	Sat, 28 Feb 2026 05:40:36 +0000
Date: Sat, 28 Feb 2026 06:39:44 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 3/3]
 arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@21300000
 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too
 long
Message-ID: <202602280634.lw3Mw5GJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   781b2c569af65bdd28b176733884d86c455b912e
commit: 27357b61522f7c06e81ab71cc20329f695f8f346 [3/3] arm64: dts: qcom: sc8280xp: Add missing VDD_MXC links
config: arm64-randconfig-2053-20260226 (https://download.01.org/0day-ci/archive/20260228/202602280634.lw3Mw5GJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.5.0
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602280634.lw3Mw5GJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602280634.lw3Mw5GJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[60, 13], [60, 0], [60, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[60, 13], [60, 0], [60, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4541.12-4545.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-crd-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: wifi@0 (pci17cb,1103): 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@1b300000 (qcom,sc8280xp-nsp0-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domain-names: ['nsp', 'cx', 'mxc'] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock-el2.dtb: remoteproc@21300000 (qcom,sc8280xp-nsp1-pas): power-domains: [[54, 13], [54, 0], [54, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,sc8280xp-pas.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
