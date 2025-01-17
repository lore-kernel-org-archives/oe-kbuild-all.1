Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F3A19E7D1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 23:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737157735; cv=none; b=aYAVVuYWqznSQGsPKnj9TuYd/YtP5CkYKH42ljOggLrYKM+18cQ3XEzWQwKiYoQmmFhmPJKh1aQbC8vdZEN+oaiSCioTwt5W81qgMSfsaIN660+8802FRorDtZdmWSaaw7J8lQZlCeWp2jrj4I96tHBJ9mtquxW914qny7tue7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737157735; c=relaxed/simple;
	bh=NQy9EWft94Tggn4T95lFXS3UA/7hX/Eci7v9SH6b+ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rPxLmo94mL9JGvUxdaNIQwrkxf0hDWDWxbu7RLHq7D3mKiEoSzxVm33BacPo0CMCiPHjhETGCZ0PQuUwxUGxj1xSb7LaU+VRCczmNFVB5GFM1FsiCQ8BvPvhdzC/gxoIMVtecJww+66ocTOrGmZ68SalqjeqBdV5VoE4hIXGc8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xpv3PCg/; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xpv3PCg/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737157733; x=1768693733;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NQy9EWft94Tggn4T95lFXS3UA/7hX/Eci7v9SH6b+ks=;
  b=Xpv3PCg/gipQLo+E9F625trMmeZfFOfwh8+wq1cnehfmmYQF/pyTAO2e
   QTTmvjKSg6jpfBecHzOXEMIo2du48v1knVLMuF0RTkgiev9xASfMfSmOC
   lgbzfY9O5R/tlazHmdxEKs2hVFeGfpij5cHKrEn6OA7mpPuHmzn5F79rT
   jEpu63EtJsETmvDfEWaKJKytS0SlSN7NM/3cka2vSVQieQJoHxkzbn2lJ
   sjhTeipbcfMChUc5M8m8rguLiv1mYj1NWzVk2Mtj3SwRiQ8N4XMh2LFob
   SUmglDh4NbzyHRyH+MZsT7eL22ctu+9+zx5+9GdZmKmwz2Tim7Wqa1+lM
   g==;
X-CSE-ConnectionGUID: eX9srVYFTfuvEnCvw3zAnQ==
X-CSE-MsgGUID: OST4ur1xTneIw5FM1LdOig==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="40413233"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="40413233"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 15:48:52 -0800
X-CSE-ConnectionGUID: e05xR+KvTXK5oY0ZrlZ7HA==
X-CSE-MsgGUID: BfklJBotQVCDyPg2LSPXww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="106402335"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2025 15:48:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYw52-000TrB-2z;
	Fri, 17 Jan 2025 23:48:48 +0000
Date: Sat, 18 Jan 2025 07:47:59 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Frank Li <Frank.Li@nxp.com>
Subject: [linux-next:master 8913/9563]
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000:
 clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
Message-ID: <202501180730.MorujWa1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0907e7fb35756464aa34c35d6abb02998418164b
commit: 041375bd32561cabcf457b5ed91ddd2965de79ac [8913/9563] arm64: dts: imx95: Add ref clock for i.MX95 PCIe
config: arm64-randconfig-051-20250116 (https://download.01.org/0day-ci/archive/20250118/202501180730.MorujWa1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180730.MorujWa1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180730.MorujWa1-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [62, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clocks: [[27, 87], [27, 36], [27, 35], [27, 88], [62, 0]] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
>> arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie-ep@4c300000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie-ep.yaml#
   arch/arm64/boot/dts/freescale/imx95-19x19-evk.dtb: pcie@4c380000: clock-names: ['pcie', 'pcie_bus', 'pcie_phy', 'pcie_aux'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/fsl,imx6q-pcie.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
