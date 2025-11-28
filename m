Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3BAE2D7DF2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Nov 2025 15:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764342360; cv=none; b=h+Hi5qIrpQ0yrpUi2SH8ABPQOAsaRna21W8ev4inqMdU2+/fZ57atuT/2k6qq5eeKPts9G+vcK69cBD3o/Nc+LxySTpKIFFsObJpPQukYD+FCX+IO6NjkagPpFDDQrYAWc6WNTocT92iD2ZW9yzM1KcM2546mZoODbqHY2Xj5lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764342360; c=relaxed/simple;
	bh=DJQfeP08DQ3kOLzIA+kH9/0n3KQZWMY4mF+vj9ZVkb0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fEbTtEcYzOxTGxhrNj6hDB12IV9ZzMKpUzePn9YprVQWEm9Em5jgVfaEx6zb5gh0b5C28MpzlauPCTRKmBSThZYtLKui2fwK7WEPpZzlBlSl49Lw06pfC3q1suUPCBaRnMjRCLZBSTT3i3tncIK3wEDtQJgehlEtCFGlyhAKd7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOh+nyiK; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOh+nyiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764342359; x=1795878359;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DJQfeP08DQ3kOLzIA+kH9/0n3KQZWMY4mF+vj9ZVkb0=;
  b=GOh+nyiK92Mu5gAB8jsDnUSXqiUhFCFtx7l2pEJgMJ5tgNFJmtD6JVe9
   RW9KwRobMaziVdAZAc/z61nJ2NrRKPqe5stbuAF7M+D4i7QYCu/n2ntgc
   OM9wF0IJZPZiObd3BgMLYFKm8888Gm3P4QJIngWVjMIAkEiR34UoaxtaQ
   xPgxiTX/lstERxEx+I5/pMaZ4DRTSkNo4/L3DeLyZeZgd27UzKdJuDUgL
   WGVBz94Oy2HIt4HHh13xuqEcmI12O0t/ggyj43IdtV0WSFHlCxVjrag1z
   3HP1VSkgPLv7Q/bCSg0SsEL4afqFwBt8Zv22AXuxw9c7bJeHalhXD4GVx
   Q==;
X-CSE-ConnectionGUID: Ms4CR5PgS/mi0keMWpzlsQ==
X-CSE-MsgGUID: 57FN1KDCR6WOP3kgVx/ToQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11626"; a="65381295"
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="65381295"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 07:05:58 -0800
X-CSE-ConnectionGUID: PjgSq583QlOFZjiGYpDusg==
X-CSE-MsgGUID: VyrTuYmgT9ScvQAxCYFdbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,234,1758610800"; 
   d="scan'208";a="224184620"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 28 Nov 2025 07:05:56 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vP02j-0000000023l-32Tr;
	Fri, 28 Nov 2025 15:05:53 +0000
Date: Fri, 28 Nov 2025 16:05:21 +0100
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 11964/12740]
 arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@1b300000
 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
Message-ID: <202511281649.CUAN2yNp-lkp@intel.com>
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
config: arm64-randconfig-2052-20251128 (https://download.01.org/0day-ci/archive/20251128/202511281649.CUAN2yNp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251128/202511281649.CUAN2yNp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511281649.CUAN2yNp-lkp@intel.com/

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
