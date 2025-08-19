Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED851302CCF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Aug 2025 04:00:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755576013; cv=none; b=RvWXrC+210CXKK5XMm3SsxqtO7YEKrF99L35nUEucd0Fsw+2Tv95yFJysLT7Fsj9Y4tC39wcX/RCHfffw8vDxRQqOpOlR6+MlvVko4eQAj5B4zB5cajmscyQKzXth2+sVgKJ7sl+91zigX8rCX73E5rRl36Zo0JiOfqCGwM8oWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755576013; c=relaxed/simple;
	bh=0LPeVhbN27W9I+mRDCwPKwCpeiAK9vn43XxhoMb+a/U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NrYx7Pz8r71KL2TRWnIUY9aEmRn3QP39smHQ0VUUoo5ldzIM2tw5etlQZf+cECHxsey6umWnO9f0oWDbm/R8EO9JK+W/gSl/nvxj8FPuPELfQ848Uojb1FPeTHnnOV/76k4AUEBaToFhs5EeRjnWEU7H3XEs4+Oi669Zc7qc5fI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EYEalFj/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EYEalFj/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755576012; x=1787112012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0LPeVhbN27W9I+mRDCwPKwCpeiAK9vn43XxhoMb+a/U=;
  b=EYEalFj/FjsfBgfuT5IUG786f11voG/5AD4p1qvm/1ccCgIO35ifH98D
   dhpyWAB7YGjuoS0Y02HajdxRI1y4FKXt1Vfd+gSeB2TsV92NlXS7e6biS
   mQfLGxQFt61/3WERDcEoOG8OGbIpZ84ktzICZXBlLOLRlcZO3yCNsio16
   DhWCZmHsC4c5HVSu+HMzbk7cfTIjZJL3IM+gjiDAdq23a7z5OgIQ5hccu
   l32/SLHCN98rS416JXJu1UoDsd3/QDCjxEQ+52i1GNTdiDQSM3wq/8cmf
   iG5iHEQPViKgiYDe3sou2mnoSYntZOE75i58pNODF+yvJb/wm0v3A5mv3
   w==;
X-CSE-ConnectionGUID: 4hqfb5lNSe+jYalGNVXI7w==
X-CSE-MsgGUID: 21+pfNaCTKm/TsoBqtN+TA==
X-IronPort-AV: E=McAfee;i="6800,10657,11526"; a="75379555"
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="75379555"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2025 21:00:11 -0700
X-CSE-ConnectionGUID: 1kwW5NwcQMSYlxhfNH8EIw==
X-CSE-MsgGUID: Met2WLUMQ5ydwWDW626gVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,300,1747724400"; 
   d="scan'208";a="171959172"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 18 Aug 2025 21:00:10 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uoDW4-0001Et-26;
	Tue, 19 Aug 2025 04:00:08 +0000
Date: Tue, 19 Aug 2025 05:59:22 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2690/2690]
 Documentation/devicetree/bindings/gpu/phytium,dc.yaml:40:8: [warning] wrong
 indentation: expected 2 but found 7 (indentation)
Message-ID: <202508190503.hI0cD4HQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   dc90c923fed4944f134644261022885c12631518
commit: ab9ff1e38569313e41ba5a036591f93cb55e5d87 [2690/2690] DRM: Phytium display DRM doc
config: arm64-randconfig-2052-20250818 (https://download.01.org/0day-ci/archive/20250819/202508190503.hI0cD4HQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250819/202508190503.hI0cD4HQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508190503.hI0cD4HQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml:40:8: [warning] wrong indentation: expected 2 but found 7 (indentation)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:76:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
   Documentation/devicetree/bindings/arm/arm,mpam-msc.yaml:82:15: [error] string value is redundantly quoted with any quotes (quoted-strings)
--
>> Documentation/devicetree/bindings/gpu/phytium,dc.yaml: ignoring, error in schema: properties: clocks: items
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/framebuffer.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/framebuffer.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/shared-dma-pool.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/shared-dma-pool.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/reserved-memory.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/reserved-memory.yaml#'
   /usr/local/lib/python3.11/dist-packages/dtschema/schemas/reserved-memory/memory-region.yaml: warning: ignoring duplicate '$id' value 'http://devicetree.org/schemas/reserved-memory/memory-region.yaml#'
   Documentation/devicetree/bindings/input/touchscreen/ti,tsc2005.yaml: ti,x-plate-ohms: missing type definition
   Documentation/devicetree/bindings/sound/audio-graph.yaml: convert-sample-format: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-odd-pixels: missing type definition
   Documentation/devicetree/bindings/display/panel/advantech,idk-2121wr.yaml: dual-lvds-even-pixels: missing type definition
   Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml: i2c-alias: missing type definition
   Documentation/devicetree/bindings/net/snps,dwmac.yaml: snps,priority: multiple incompatible types: uint32

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
