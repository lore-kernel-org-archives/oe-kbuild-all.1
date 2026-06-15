Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3943B5E15
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jun 2026 20:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781555333; cv=none; b=QLx7kpGBg0iUYgnW2ls9Gku7KNtigMt8iglGb/gRDQ5u5p7LB4lKKfVnTnL/tcH0NUCWDOJRCX0dJMNQ++7KysG5mnFYYzUpGOh++ux5QsqXD1H2jzk20F/LGoi4wQTsda9PBPXF+eVqE0rRhGfvSMjdE+QmOdu8krGPKBhAPxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781555333; c=relaxed/simple;
	bh=HbiW0Wnj17orFREUmHwwkb9fgvVxVfgJMKDVrHXKIuE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cWZk5mqW3JcDV/h5VGTkeQVzhCllfCnSa+YD7Y0jTbopDbzzm+yRKKWPyTK+LhfjakfSKvPtUpSmjGhv76g2eA6lx1eTg9QKoJrwib2xxiLNbFsTTF0YG//pw3zp6UxkzrBDetCLZk0Q7zaqZiZVpcDP6NBoVIX7mmuQU0hvVTc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=caZGQHXJ; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="caZGQHXJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781555332; x=1813091332;
  h=date:from:to:cc:subject:message-id;
  bh=HbiW0Wnj17orFREUmHwwkb9fgvVxVfgJMKDVrHXKIuE=;
  b=caZGQHXJjSvNnE+NEz0u1W+rbFG9C7akLf2Fug8ARuIGZ//a3vbhqZox
   ZLepCvhr++qtcjvXLRb5DfTulJeQox14yc54KrVvvmxNNTdSjC97MfcnY
   umtqss1iRCCEiYjIsFXEPGgPbNZ0zUIuxfcpuI1xhp/vH4zpiyddGIWta
   BcOjk+LZfOJat2DFvuYfMhOS7NEZHKGq8kPKoDqPX5obPZJul0uiupBgg
   wR2xBoB8bKB0bKWym4xmMf3cVIf9WACoqlYLRNoyJSqKV9cwXDb2SvZSv
   rVb9o1XeT/c62cBnWq0KJljlsXHb6+KOVBJEsJa5JjFIXGUi/taQyM8eQ
   A==;
X-CSE-ConnectionGUID: u+8/scnpTBachGSn+wvEOg==
X-CSE-MsgGUID: UmUDyAVwRe2WbdQzCJ/23A==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="99882455"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="99882455"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2026 13:28:51 -0700
X-CSE-ConnectionGUID: JSMRO0d3Tqqy+W24F5+Aqg==
X-CSE-MsgGUID: W30az0ITQce2/qGJ34AM+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="252689954"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 15 Jun 2026 13:28:50 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wZDvM-000000004xx-0BsX;
	Mon, 15 Jun 2026 20:28:48 +0000
Date: Mon, 15 Jun 2026 22:28:26 +0200
From: kernel test robot <lkp@intel.com>
To: Tejas <tejasmutalikdesai@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 linux-doc@vger.kernel.org
Subject: htmldocs: Warning: arch/arm/xen/enlighten.c references a
 file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
Message-ID: <202606152212.PIzfdQ9f-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tejas/dt-bindings-arm-xen-Convert-xen-txt-to-YAML-schema/20260615-192753
head:   bf21bdc2f6582e22a01abfd47458d687bad86743
commit: bf21bdc2f6582e22a01abfd47458d687bad86743 dt-bindings: arm: xen: Convert xen.txt to YAML schema
date:   9 hours ago
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260615/202606152212.PIzfdQ9f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606152212.PIzfdQ9f-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/translations/zh_CN/how-to.rst references a file that doesn't exist: Documentation/xxx/xxx.rst
   Warning: Documentation/translations/zh_CN/networking/xfrm_proc.rst references a file that doesn't exist: Documentation/networking/xfrm_proc.rst
   Warning: Documentation/translations/zh_CN/scsi/scsi_mid_low_api.rst references a file that doesn't exist: Documentation/Configure.help
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/ABI/testing/sysfs-platform-ayaneo
   Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/display/bridge/megachips-stdpxxxx-ge-b850v3-fw.txt
>> Warning: arch/arm/xen/enlighten.c references a file that doesn't exist: Documentation/devicetree/bindings/arm/xen.txt
   Warning: arch/powerpc/sysdev/mpic.c references a file that doesn't exist: Documentation/devicetree/bindings/powerpc/fsl/mpic.txt
   Warning: drivers/net/ethernet/smsc/Kconfig references a file that doesn't exist: file:Documentation/networking/device_drivers/ethernet/smsc/smc9.rst
   Warning: rust/kernel/sync/atomic/ordering.rs references a file that doesn't exist: srctree/tools/memory-model/Documentation/explanation.txt
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: Documentation/virtual/lguest/lguest.c
   Warning: tools/docs/documentation-file-ref-check references a file that doesn't exist: m,\b(\S*)(Documentation/[A-Za-z0-9

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
