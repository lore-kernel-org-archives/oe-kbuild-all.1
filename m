Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750B138CFE7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Mar 2026 12:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773405856; cv=none; b=YCLyWAs1zjzbhkQ36G/5wQxpQiT0TVrPJrOmRsGjXBRqt0teX9YFqTXiawCUHuP3WhYwJOArnzX1C1JYHy4z6I/IuO7PB/s6AvWm/qym4RnahOeeh0FDpRx9ZTobImeZ+A+dAM2OzU8sb1mDemXTcTsT5hpt/kFl3dLrNq3Tc8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773405856; c=relaxed/simple;
	bh=DIRXHVLAd0kHCJdqYxnFaS3J6+hCCNeMSfvgNs7xnBc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=X5a/O3u01zoC5ORUDFToaZdZyChBhkaZrD0rtoSxIi90mvEeJ+tiqvGwDVpDl/9MXvRLvxGO8v6JTnV7sVTaqX/lyG0DNXyZKM1TeyEXQnFA18MZmzd/Lmk71OTo3aBo4ovady1cpvjsjaqnT+aVUUQdi9Ph6UNa0+J0bwcKfSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IMSb34FT; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IMSb34FT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773405854; x=1804941854;
  h=date:from:to:cc:subject:message-id;
  bh=DIRXHVLAd0kHCJdqYxnFaS3J6+hCCNeMSfvgNs7xnBc=;
  b=IMSb34FTyeSFNqGzM/bNX1+7hBIW8KlrPhVt5MZe9iHdzY+xUomwYieP
   c43V2BXo6BNeR+oeGFvJyP3iHQAEwXkrndgVGcG+Lf9M+2P5wcy2xBKSw
   GOJcoBptZD0RSg6FHNd+dBlW1GNIuNwMBEfcM39uaSl7PEt10Yn1wy8uI
   kXjrnLQeSHXOgb5pIBq4PlvnerZMOzg2S/+o0MKaPTemUnkbxCQ1zx8p/
   T7Il3p97xlTnaRyOz/z951Jl61TYKbBJeEbZOPwIXHCE+LS7nG+uALZ7E
   u6yS5EKX2o7menxsMoiKzzD/l7PnpL1QzLc6zsSNrZalkHw4AOThqD4z9
   g==;
X-CSE-ConnectionGUID: uJroe5TGR1yfhw4ZXXNc1A==
X-CSE-MsgGUID: x9usk8n8SE+OCuB0MsIMtw==
X-IronPort-AV: E=McAfee;i="6800,10657,11727"; a="74428032"
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="74428032"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2026 05:44:14 -0700
X-CSE-ConnectionGUID: DrJiTtKWQYCt3Az1/4DF5w==
X-CSE-MsgGUID: 1vPOr/taSCqp3OjwddpNng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,118,1770624000"; 
   d="scan'208";a="244176539"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Mar 2026 05:44:12 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w11sA-000000003en-12ES;
	Fri, 13 Mar 2026 12:44:10 +0000
Date: Fri, 13 Mar 2026 13:44:09 +0100
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-doc@vger.kernel.org
Subject: [robh:dt-convert 75/621] htmldocs: Warning:
 Documentation/devicetree/bindings/clock/ti/ti,dra7-apll-clock.yaml references
 a file that doesn't exist:
 Documentation/devicetree/bindings/clock/ti/dpll.txt
Message-ID: <202603131344.85bstqTr-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git dt-convert
head:   c8198e311a98fefcf9efff078bf3930ff94b60d2
commit: e22968a85b2dcc059cd995e72aad2ed6458efa0e [75/621] dt-bindings: clock: Convert ti/ti,omap3-dpll-clock to DT schema
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260313/202603131344.85bstqTr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603131344.85bstqTr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-mux.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,quadfs.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-c32.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,flexgen.txt
   Warning: Documentation/devicetree/bindings/clock/st/st,clkgen-pll.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/st/st,clkgen.txt
>> Warning: Documentation/devicetree/bindings/clock/ti/ti,dra7-apll-clock.yaml references a file that doesn't exist: Documentation/devicetree/bindings/clock/ti/dpll.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
   Warning: Documentation/devicetree/bindings/mfd/motorola-cpcap.txt references a file that doesn't exist: Documentation/devicetree/bindings/rtc/cpcap-rtc.txt
   Warning: Documentation/devicetree/bindings/regulator/motorola,cpcap-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/motorola,cpcap.yaml
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/remoteproc/ti,keystone-rproc.txt references a file that doesn't exist: Documentation/devicetree/bindings/reset/ti-syscon-reset.txt

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
