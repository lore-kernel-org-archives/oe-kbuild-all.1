Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7361DDC37
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 15:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747149278; cv=none; b=S0Go0zXbpyePfecr9Iv7nukOsMTj+PcyQJxtZ3zsQSYyBuMOL69AnPOgFU4MvbMCZTFGIdTQo7rUxSXYWI9a6NoKdga4SVaAMw7yV0p8Zt803ss2FMSLVxJDgLqT7ba8UPhetTcbQ4829QyLQo1hjpWtHDMIzmmd9KWUs0RwOgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747149278; c=relaxed/simple;
	bh=LXoXbm3dR3M5VQ8FaAk3uGDPRR8DnzBVPs87LsmG8FE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uzIbbWtNJOF0ZO1BmuboXQp8Paua/9TbkXTDQWMyC8530HO0POGL6aZAj/QjeIV7kCMG5BZXdAizrx975PdZN8oZl4YMQwgze8myPDZULWPh2crHo2W1alphvrEewvZ+8Wmr1MgTg8ZrN2LC15xE+gXCLUanPcIb/IBXFTZQvIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AqCyNZ7I; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AqCyNZ7I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747149274; x=1778685274;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LXoXbm3dR3M5VQ8FaAk3uGDPRR8DnzBVPs87LsmG8FE=;
  b=AqCyNZ7ISxre9rMjDM1n86rDmVznVlTlWwIsWPmO1yrzhTjBzn5fnScT
   0iYbRe9mcb7KNoMfZ6Pl10IIWj+Qre+NQNwgS8oHNx8c05S7E/tX+wrFw
   lrUskQPQEjd677WOzqWPEzcXdzM1tAGr5v/MYEMcEFqZAAGYCO1oyzMIh
   wW2Xx/tBvv9ZmuCnhUxUKXrbsS/QdkzhqEvCzy6E6S28xfZIB1diOedSe
   6Q/vwMIGvSzEJWf2WQAQwR58onI+XFNpPPBFRbvmMatM9qc7tcyW/T+Tt
   our5k/Zmiqvs9P2IQ9gxJXcBrA0KoSW7OPLrZ4yiTt+EUldIZbsUKLdba
   g==;
X-CSE-ConnectionGUID: ImqPixolThC3L0OhxfFiUg==
X-CSE-MsgGUID: b4/aTzs+SyyWG5Jr+VZr6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="52811147"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="52811147"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 08:14:34 -0700
X-CSE-ConnectionGUID: s8rdFb6RROuQCeo5dObcsA==
X-CSE-MsgGUID: cSnjA9jkS/qm68R4zYlbfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="138722359"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 May 2025 08:14:32 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uErKw-00010A-32;
	Tue, 13 May 2025 15:14:30 +0000
Date: Tue, 13 May 2025 23:14:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195]
 Documentation/devicetree/bindings/gpu/phytium,dc.yaml:40:8: [warning] wrong
 indentation: expected 2 but found 7 (indentation)
Message-ID: <202505132302.zMQCF7g7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   855c2a6945da5d74f3e50d601537000d0989d5a3
commit: ab9ff1e38569313e41ba5a036591f93cb55e5d87 [2195/2195] DRM: Phytium display DRM doc
config: arm64-randconfig-2053-20250504 (https://download.01.org/0day-ci/archive/20250513/202505132302.zMQCF7g7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505132302.zMQCF7g7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505132302.zMQCF7g7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml:40:8: [warning] wrong indentation: expected 2 but found 7 (indentation)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:82:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
--
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: ignoring, error in schema: properties: clocks: items
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   Documentation/devicetree/bindings/sound/audio-graph-port.yaml: convert-sample-format: missing type definition
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-even-pixels: missing type definition
   Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml: ti,x-plate-ohms: missing type definition
   Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml: input-debounce: multiple incompatible types: uint32-array

vim +40 Documentation/devicetree/bindings/gpu/phytium,dc.yaml

    33	
    34	required:
    35	  - compatible
    36	  - reg
    37	  - interrupts
    38	
    39	Example:
  > 40	       /memreserve/ 0xf4000000 0x4000000; // (optional)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
