Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79E81891A9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 17:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718645918; cv=none; b=KAsK/K4BblG4B+pxWNEae0FIFbWOqopg5BeWoB/XeR6PswTwNXGZRI+u6s9vi6/Np3xp2FBo8vXKRnsxkRzD8YYNxSYqgo1lZ8AwbP2CRmG6ZDqLDrdWFm6eEqkQJe9b1XNv8iQylKMeNRsIzmLjsYIrRKNrNaJ5qWbYS+OFTdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718645918; c=relaxed/simple;
	bh=r+Y5q+vYcogMx3vSl7ez4mffxV9S/qOUk5Ba1qsYKkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oWjCsEYASkxa3bXabGbmCm6EKRnizjK6gsea7eUbaP11JEMThKijf4sgK/rNjGInnVjd/NvSkmaVcagjylTcDwg30/KUQ7vJgOnj9GgPjR/wKvKZMXmXA5BoBuN+JixDIKuRj6xrivTTOIuqlezrT2RMCGFLUrsE09BKuMGcoj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RccGTrz/; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RccGTrz/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718645916; x=1750181916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r+Y5q+vYcogMx3vSl7ez4mffxV9S/qOUk5Ba1qsYKkA=;
  b=RccGTrz/QsPWUIGbUcCe9dU3kQ9zS5VcqmLJkLnGE+4Eth7cHL6JGb/U
   84gwCuaM7z+fCBy97isvzp2fqUCLPcYMsBMClZ+Hur3TTjjpMwe57GcKU
   5VClJ7f4fZukLfUnkMnCfU6V6PZCnDCr3TmPXC8YxmYt6xECosGvk4pQv
   BgOzft+LLSJIDj7EjywvPzrX9gHr3KWwDOi6+WcBfkUR21w9wbLLXQwo0
   gOeHKKrdNDeEM/oijpTF0HZgn5dxULou94JsBSX9cOMJUxXXk0Ty9/yaC
   voGycguZW83rHN6hBUWNrRcd0bc1DZPkdRPTv2gwbZaE30e5fcCADlwWu
   A==;
X-CSE-ConnectionGUID: W3HrjFHYT5Wv5hXWu9c0Yw==
X-CSE-MsgGUID: XUMq6cP2RpO2bguZPRPMVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="26116017"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="26116017"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 10:38:36 -0700
X-CSE-ConnectionGUID: kRWzE4Y4RS6ZsuncNEw1kQ==
X-CSE-MsgGUID: JlDVUm+/SW+uxduqMnqsfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="46386306"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2024 10:38:34 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJGJM-0004jr-1Y;
	Mon, 17 Jun 2024 17:38:32 +0000
Date: Tue, 18 Jun 2024 01:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-bsp/v6.6.34-2024-06-17 37/132]
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie-ep@e65d0000:
 compatible:1: 'renesas,r8a779g0-pcie-ep' was expected
Message-ID: <202406180132.NF1Rh2BR-lkp@intel.com>
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
commit: b48286877669857a9eacb0a577d1b05e5820392f [37/132] dt-bindings: PCI: renesas: Document R-Car V4H PCIe Endpoint
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240618/202406180132.NF1Rh2BR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180132.NF1Rh2BR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180132.NF1Rh2BR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d0000: compatible:1: 'renesas,r8a779g0-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d0000: compatible: ['renesas,r8a779f0-pcie', 'renesas,rcar-gen4-pcie'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d8000: compatible:1: 'renesas,r8a779g0-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
   arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d8000: compatible: ['renesas,r8a779f0-pcie', 'renesas,rcar-gen4-pcie'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie-ep@e65d0000: compatible:1: 'renesas,r8a779g0-pcie-ep' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie-ep@e65d0000: compatible: ['renesas,r8a779f0-pcie-ep', 'renesas,rcar-gen4-pcie-ep'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie-ep@e65d8000: compatible:1: 'renesas,r8a779g0-pcie-ep' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie-ep@e65d8000: compatible: ['renesas,r8a779f0-pcie-ep', 'renesas,rcar-gen4-pcie-ep'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
