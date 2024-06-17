Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE89225AE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 22:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718662997; cv=none; b=j8j1h/J51eJsIdSpIoLQAmp5HBIIWIx5j73jWm96oboEe5s5SpPMZjPtYWjkGBnp6NAqV2Ls8TOZj2syZd9GtKPcjCuv1V2sR5vN6BKX8vpm4XraTg0+bgikYMoaYEVYpRd+9BYdI1cuoLzuJ1jp6ZrVIYNRBCou9wEqdBHv9a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718662997; c=relaxed/simple;
	bh=6uvnkluWObCFaWVJsJH8qdWhEkZVoFSYofiryD7k9ZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FlU7k2gVrKgewYkAwO2cYFEIZDuq1RZqTBj7ftvx+A86KVss9jFtG6kkjk3Q/FCQ6WVXSsEXrw/nN9A44wDl6MoGCRh4jeEgRQC85BeIT/9JQUQt+tPRcmmghBNtpA5Pp2kfZ+qKE9lD0HLmhCw86T5fwdnvKH6txtZCAa6iOxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kQuN3UPb; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kQuN3UPb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718662995; x=1750198995;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6uvnkluWObCFaWVJsJH8qdWhEkZVoFSYofiryD7k9ZY=;
  b=kQuN3UPbOT7nUF9pUvcisZWTgsbxyb0TAnBtAtvo9rTwj8fhA56NeaCb
   kQvULigPgheW9DDytUrJ6eA1Ke6inRgBIzNDJ/hfSuWfxunbdKNN/xkuS
   254BcoUKShVS8C4E8wk9r7xXeWPxdpJPeVxkv9mU0Cr3ONeEOi6pmc2x4
   chCltInCnvX8rcdyilPo6/XRA8pELpQEjE1qbSQIsWjN3oiXCeH4PfEKs
   alNmJTdDwglHc9V6pS+kth/OVbHSvGb3lOmW1woWNpnvRJqIlRI/v44nH
   j0jVuY51LHhQ3KemC6OMnYSHRz425zD9rSGn+T/IIfuQY39oq9YNt9rfn
   w==;
X-CSE-ConnectionGUID: VdIP+0VGRTyKOEKeRp/O0g==
X-CSE-MsgGUID: 0J+ma9JsTvaCVWeL7QuDwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15642105"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="15642105"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 15:23:15 -0700
X-CSE-ConnectionGUID: mOaKZMpoRu+RPA+UeAbVIw==
X-CSE-MsgGUID: 7RsEefvuRV6G5YW5NNHb9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="46447511"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2024 15:23:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJKkp-0004wT-2W;
	Mon, 17 Jun 2024 22:23:11 +0000
Date: Tue, 18 Jun 2024 06:23:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-bsp/v6.6.34-2024-06-17 38/132]
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d0000: Unevaluated
 properties are not allowed ('compatible' was unexpected)
Message-ID: <202406180630.5YM4Uinh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.6.34-2024-06-17
head:   caf7f9c42b2dc056f352a35527e2efc1e4ffd4b6
commit: 94d4d129c5e00f46aa693755f6e648e7de80d7b5 [38/132] arm64: dts: renesas: r8a779f0: spider: Enable PCIe Host ch0
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240618/202406180630.5YM4Uinh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180630.5YM4Uinh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180630.5YM4Uinh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d0000: compatible:1: 'renesas,r8a779g0-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d0000: compatible: ['renesas,r8a779f0-pcie', 'renesas,rcar-gen4-pcie'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d0000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d8000: compatible:1: 'renesas,r8a779g0-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d8000: compatible: ['renesas,r8a779f0-pcie', 'renesas,rcar-gen4-pcie'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie-ep@e65d0000: compatible:1: 'renesas,r8a779g0-pcie-ep' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
   arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie-ep@e65d0000: compatible: ['renesas,r8a779f0-pcie-ep', 'renesas,rcar-gen4-pcie-ep'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
   arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie-ep@e65d8000: compatible:1: 'renesas,r8a779g0-pcie-ep' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
