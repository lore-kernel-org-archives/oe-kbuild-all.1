Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAADE195B3F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718621026; cv=none; b=JexH/+we/a/VO/4NQashs+Oh0fWyO6YfkpSsfZ7O4KTyzdZFCDx5M44Q8ruencNQ+NABqGKNayM+u4Wk8TsouLUrZUbXptapDvDcAAGTe79aOBJMysGVLXGj6qMS+Mfa/yi0urqW6pvvY+ypKs7sNjxGsF/p9h7O1saqTmqP8VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718621026; c=relaxed/simple;
	bh=RAieGk1aB4j9ednMJGkPtRWXnXqkRDY33RmkHHeEVYA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a6neuTZRpt2jOPs/mJ5K5CrByliM0BOPr3IiHFpVrPyZQdudnaZI/Tx0ZY0Jil8H55+NDBnPAX/I1EyroiLQIHSKIpqx4b24kUPubLsvYcZAfnChg/SebrbXdGsRywCbbMhHQ7OoYB1Ua8QDKvfmNr4WO5yaZ1M6d9TVZVoZVCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mfjbmnUK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mfjbmnUK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718621025; x=1750157025;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RAieGk1aB4j9ednMJGkPtRWXnXqkRDY33RmkHHeEVYA=;
  b=mfjbmnUKqX7gEXbLnDAEj9wD79yb2IHUx5ehlOrJ0Esy6qHMl+WQ5XEb
   GLaqekaGKlVSt7WxeDARAu8n2aqg082D6/WZoYoF4a4ClZlOTLFYonsYE
   R7W1X0uZmHReK2bCaKOnGnrlz/sO4UzmxE/jT1y/YXfx/ypGFwaOOSlcz
   7pNIgWQhXRnTeER5wBQpxwgRG4q+Nq6vMUnfAVKihLXIeYONHyR6CRHwJ
   39KDECYjS7/0aCVEmzgquAsP8+pxRKD42rUH49YrohK33xvbBPVlDc+fs
   dFauCXX/qoE8AqVFWwxWbS19l/+htucoDrysgdVBh8S6aeTrMpHBVGGpC
   w==;
X-CSE-ConnectionGUID: 6jcZvQnRTHupYAV0QwUexQ==
X-CSE-MsgGUID: JLMZ0DOZRlimLMXUEEzeSg==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15594074"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15594074"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 03:43:44 -0700
X-CSE-ConnectionGUID: u/2m84KlQJqMxo4F33hRaA==
X-CSE-MsgGUID: TsGD1G3dQsuQ63OlsF5DYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="46271088"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 17 Jun 2024 03:43:43 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ9ps-0004Bu-24;
	Mon, 17 Jun 2024 10:43:40 +0000
Date: Mon, 17 Jun 2024 18:43:10 +0800
From: kernel test robot <lkp@intel.com>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-bsp/v6.6.34-2024-06-17 36/132]
 arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d0000:
 compatible:1: 'renesas,r8a779g0-pcie' was expected
Message-ID: <202406171841.u1WBZpEH-lkp@intel.com>
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
commit: c4885fd17e47821319256787d1a5783551dcea28 [36/132] dt-bindings: PCI: renesas: Document R-Car V4H PCIe Host
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240617/202406171841.u1WBZpEH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171841.u1WBZpEH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171841.u1WBZpEH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d0000: compatible:1: 'renesas,r8a779g0-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d0000: compatible: ['renesas,r8a779f0-pcie', 'renesas,rcar-gen4-pcie'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d8000: compatible:1: 'renesas,r8a779g0-pcie' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#
>> arch/arm64/boot/dts/renesas/r8a779f0-spider.dtb: pcie@e65d8000: compatible: ['renesas,r8a779f0-pcie', 'renesas,rcar-gen4-pcie'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-host.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
