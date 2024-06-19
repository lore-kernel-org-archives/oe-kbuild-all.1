Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B91A971743
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 09:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718788037; cv=none; b=mLWo8hQ69pcqzPUtnC5w06NmWCosbOZfDTMYJ3bYBqwDh3BQ0DD4vQ5KDdyZEaTaMqElYOg/pokAlJDSCzXDz4mH686Bni6KAQt4ZWjRLBMhizqu8a2fET7zGXqwUxnoI8RClEb9b5MuO5zOaYustXGyov9yB82L/SQ8h6nKA6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718788037; c=relaxed/simple;
	bh=0w+FVSu6XnypBDNZbaylFmTnjMzLhP8mFSFv95S+g3c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kislia1I6SE3lmQQppqFCpJZxxrscYmthq6IOtQalwsKyr6XL+a2tautHe/IGjNo9xv8IXhHe4LoqafBWb/Vq4kc4fJB/wzWKuZ41UdDOkEpWPpRFh47l8t4zLHKoi66uM/AkZv+sv3UYpL4HQBcmu/e10ODb/V9sAAVQ6VdP+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I6oUuAKo; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I6oUuAKo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718788036; x=1750324036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0w+FVSu6XnypBDNZbaylFmTnjMzLhP8mFSFv95S+g3c=;
  b=I6oUuAKohqYQlBCnHJcKHflPvmuyH69NRK5JzKfqK3Mv0C4t4CfW6oPP
   hKOEZ9R/W8H/bK+qhkz2AW6biwfQF8L2oeKkvmapzYHNaqie7TnRzUuTK
   ICkxBe30OURSgHZY5OpfcZAd4SXC7dgzS3HNfBND/Zx074pV9AM4GIhdy
   YdJe7kREBCiLbMyjHrPI8lWrJlEY+gdsskX1dw4Q7kQYVgSvGBvOJSgtU
   ndSZhYj1rD4v/XWgXl/dxRphbXtlHebW0LrPiucM9ko4lzqaoKyv82zHg
   D6UEiH6ZoliD1SZ4WkLvrGQCp01A66o8w59QfkndAT/ugu7YXLv5n8Znq
   A==;
X-CSE-ConnectionGUID: o6pE2LKWSbqjldkVTknXEQ==
X-CSE-MsgGUID: 05o3X/HMQTG9SSGAjZzVug==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="27120708"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="27120708"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jun 2024 02:07:15 -0700
X-CSE-ConnectionGUID: 9WcuGRXAQ1iiurCnjHinsw==
X-CSE-MsgGUID: KVtsQmHsSkaRfKj8rctncg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="41757828"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 19 Jun 2024 02:07:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJrHb-0006Sc-0Z;
	Wed, 19 Jun 2024 09:07:11 +0000
Date: Wed, 19 Jun 2024 17:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [morimoto:renesas-bsp/v6.6.34-2024-06-17 44/132]
 arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: sound@ec5a0000:
 compatible: 'oneOf' conditional failed, one must be fixed:
Message-ID: <202406191713.SiEvpdty-lkp@intel.com>
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
commit: cef96508a4741e45d83d7c7c63ec9d2adb02e2dc [44/132] ASoC: dt-bindings: renesas: add R8A779H0 V4M
config: arm64-randconfig-051-20240617 (https://download.01.org/0day-ci/archive/20240619/202406191713.SiEvpdty-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406191713.SiEvpdty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406191713.SiEvpdty-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: reg-names:2: 'atu' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: reg-names:3: 'dma' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: reg-names:4: 'app' was expected
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: reg-names: ['dbi', 'atu', 'dma', 'appl', 'addr_space'] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
   arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: pcie-ep@e65d8000: clocks: [[8, 1, 625]] is too short
   	from schema $id: http://devicetree.org/schemas/pci/rcar-gen4-pci-ep.yaml#
>> arch/arm64/boot/dts/renesas/r8a779g0-white-hawk.dtb: sound@ec5a0000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,rcar_sound-r8a779g0', 'renesas,rcar_sound-gen4'] is too short
   	['renesas,rcar_sound-r8a779g0', 'renesas,rcar_sound-gen4'] is too long
   	'renesas,rcar_sound-r8a779g0' is not one of ['renesas,rcar_sound-r8a7778', 'renesas,rcar_sound-r8a7779']
   	'renesas,rcar_sound-r8a779g0' is not one of ['renesas,rcar_sound-r8a7742', 'renesas,rcar_sound-r8a7743', 'renesas,rcar_sound-r8a7744', 'renesas,rcar_sound-r8a7745', 'renesas,rcar_sound-r8a77470', 'renesas,rcar_sound-r8a7790', 'renesas,rcar_sound-r8a7791', 'renesas,rcar_sound-r8a7793', 'renesas,rcar_sound-r8a7794']
   	'renesas,rcar_sound-r8a779g0' is not one of ['renesas,rcar_sound-r8a774a1', 'renesas,rcar_sound-r8a774b1', 'renesas,rcar_sound-r8a774c0', 'renesas,rcar_sound-r8a774e1', 'renesas,rcar_sound-r8a7795', 'renesas,rcar_sound-r8a7796', 'renesas,rcar_sound-r8a77961', 'renesas,rcar_sound-r8a77965', 'renesas,rcar_sound-r8a77990', 'renesas,rcar_sound-r8a77995']
   	'renesas,rcar_sound-r8a779g0' is not one of ['renesas,rcar_sound-gen1', 'renesas,rcar_sound-gen2', 'renesas,rcar_sound-gen3']
   	'renesas,rcar_sound-gen1' was expected
   	'renesas,rcar_sound-gen2' was expected
   	'renesas,rcar_sound-gen3' was expected
   	'renesas,rcar_sound-r8a779h0' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
