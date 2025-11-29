Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F921391
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 02:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764383950; cv=none; b=CmyLekX/fczFHaTvBa400hqb9ioL5gdqS8zwSIQMXsmK9aQYbjXY9RuJBv7Iy+4ZKSIFSvtSU7DRMpqtNNyieqkOg516N7nZymZDsodiXR/xCPItU/Vq/IB3DcEHYxVj72FhltPlYq6romR+eQJs5kNUXyug+E5ox/b11RAtOHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764383950; c=relaxed/simple;
	bh=dbukaxJdpciLiq1CFuGDFlW9h/6w4zL1ycopz4kCWFI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N1wD77/xBiajeCWt6pYjEb7Ixjg2b4qKKmWLJ80ib1W9UFvJ5t1kXZXYkFEds2jb0P7UMyII9UZsaWaS6Q4Qq9BDwGwVMTZiKrQ4kbrPj+/rh8PyLBn1dKBMkim8D7Nfg+3bfEzF/neC1ddlpv9JANQ9D3wXNhE0g8jeWCXHjag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcjorC7d; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcjorC7d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764383948; x=1795919948;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dbukaxJdpciLiq1CFuGDFlW9h/6w4zL1ycopz4kCWFI=;
  b=mcjorC7dkw2E1E0MyJIwfo0FKOarZKeTHp6V6AmDcTNOIn27v9mHcQS/
   CgLL6i8QhoPgFjXGJZfEj7epQe4VHA205dcWzhR6yfgooE8XkqahEZVjw
   rtp0lhxjTJZLwKbJWT+ZHpt9U7yvUeiWxowbK8bI4VlnFajSeSTFYGbHt
   P0zhcMSqXwp/yMR5B+k4PrwoV8r+V2TL6PkUiRT/lWFrHOc+rTCQ09z0A
   nGNgH93Ekrq+CcMQtBbyQ87K2prhXy6oE3RfSbjGFDTDitJeH9BBrEpzR
   45dPbG33x+31C/7F8eYEJIqxjV8yeUilIPu5Hs3KBnTZwAWZyEfADkEGN
   A==;
X-CSE-ConnectionGUID: s/z3dft3QMWA8Shhndvttw==
X-CSE-MsgGUID: A0aTsyXQTMqRSTRWwR0Hug==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77036036"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="77036036"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 18:39:04 -0800
X-CSE-ConnectionGUID: 4fwg2XM0T+Or2Vq391jftA==
X-CSE-MsgGUID: VukLG1b8SwuusQcvsLJyRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="230859211"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Nov 2025 18:39:01 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPArU-000000002C9-19Ao;
	Sat, 29 Nov 2025 02:39:00 +0000
Date: Sat, 29 Nov 2025 03:38:40 +0100
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 11964/12740]
 arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: remoteproc@1b300000
 (qcom,sc8280xp-nsp0-pas): power-domain-names: ['nsp'] is too short
Message-ID: <202511290309.NEmD3PA3-lkp@intel.com>
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
config: arm64-randconfig-2052-20251128 (https://download.01.org/0day-ci/archive/20251129/202511290309.NEmD3PA3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev21+gaa859412c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251129/202511290309.NEmD3PA3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511290309.NEmD3PA3-lkp@intel.com/

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
