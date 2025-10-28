Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2047585C4A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 02:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761619076; cv=none; b=h21YjB9wGYo2HWCU2r/tGaFFQfIEILaTbT2yQBBM+IsNyjWelclztdoiOrjT3WpelTN+VfQY63YfDNfySS5na9FnrjkMcNj+bjcNR66CxZbkvqrrsWG7hEu57c6fOFRcEkBacDT8TeY0i7H8EtNmZkcKpKvjrjBFHwOBgc3OkIo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761619076; c=relaxed/simple;
	bh=BGpj/PLVcUxjGXwJEoiz7TX/Ttuq+rEfW87YHJi8FnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b0tmNZjx5Wv1C8wkUzehr62POrAA5aKKosb4s4/NtsRzYM2X9WyxCBHC5FGMArumotmVrv8+wNlt8+8FHuxhOdxoG62YZq2KHCNd5AL85opYDn06PiCFSZnsEp9KkFdjUXWsgh2ryDCp6uQ7V1vOk9w7JgLE5zGIJ4Ary7OWrxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DkJlXi15; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DkJlXi15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761619075; x=1793155075;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BGpj/PLVcUxjGXwJEoiz7TX/Ttuq+rEfW87YHJi8FnI=;
  b=DkJlXi15JFngzSQt47GU0/hfAmdRBSjX5VzjuZlKOzYG1ao0sOyHnZxo
   DYJftNa2BQ858++WB0UWJrLr+QNargDJ48K3Hjgn+pZ8c4TcfpQ4t9Hqd
   3FqzG6F3R3kWG1AgxiZaB5etL63MJfMgn2xM5C0FeGoAT8+lxUDjggDqE
   tGkqrv7rwR4QVgy6JI9tTKuVHoMw8hUwIRalIxXfDhlBnG1J3Wk5pPC8O
   WSwIH9X2GjeznNl2Ge9NogTQB+YYL/rSl/PYblvfGXEwdvs8uygg/sqyC
   cmHtnI3/DHAK+krhecVyQA/Adj7vRNoWoSMTsjLTJYXDmaWfsE/Cu9x7A
   w==;
X-CSE-ConnectionGUID: +MRmx4EETn+lUL8xXKlZag==
X-CSE-MsgGUID: WFkAyFoQRpmbdoop8QeG4w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="86336883"
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="86336883"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2025 19:37:54 -0700
X-CSE-ConnectionGUID: QWYthTh5QMeCBEsyrUqZbg==
X-CSE-MsgGUID: GMU1R1ElSvm4lZ38DGQ7FQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,260,1754982000"; 
   d="scan'208";a="189530035"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 27 Oct 2025 19:37:54 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDZap-000000000YN-1Y7n;
	Tue, 28 Oct 2025 02:37:51 +0000
Date: Tue, 28 Oct 2025 03:37:17 +0100
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [linux-next:master 3617/4376]
 arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: gpu@fd000000
 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be
 fixed:
Message-ID: <202510280350.dvhjfBRt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
commit: 08b1e69d08203e31c1c8819203040516683e40a4 [3617/4376] arm64: dts: renesas: r8a77961: Add GX6250 GPU node
config: arm64-randconfig-2053-20251025 (https://download.01.org/0day-ci/archive/20251028/202510280350.dvhjfBRt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 5dfbe84da278126ac8017618af885ffc8581a728)
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510280350.dvhjfBRt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510280350.dvhjfBRt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-ulcb.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-ulcb.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a77961-salvator-xs-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']
--
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: gpu@fd000000 (renesas,r8a77961-gpu): compatible: 'oneOf' conditional failed, one must be fixed:
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too short
   	['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue'] is too long
   	'renesas,r8a77961-gpu' is not one of ['ti,am62-gpu']
   	'renesas,r8a77961-gpu' is not one of ['thead,th1520-gpu']
   	'renesas,r8a77961-gpu' is not one of ['ti,j721s2-gpu']
   	'img,img-axe-1-16m' was expected
   	'img,img-bxm-4-64' was expected
   	'img,img-bxs-4-64' was expected
   	'img,img-axe' was expected
   	from schema $id: http://devicetree.org/schemas/gpu/img,powervr-rogue.yaml
>> arch/arm64/boot/dts/renesas/r8a779m3-salvator-xs-panel-aa104xd12.dtb: /soc/gpu@fd000000: failed to match any schema with compatible: ['renesas,r8a77961-gpu', 'img,img-gx6250', 'img,img-rogue']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
