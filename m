Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794824571;
	b=kJUB9tJs7pdDfR1QuZmjNzTW85sQHcwR4kXlWZTCM3aUrMQP0Lhs3+HfkkYKEm35rzPo
	 phpqIpVe+I0zsJ4zi0nh6pMJsncFl20o4oeaTsH2PBBy84TOYI8ITLHftB6Vtqw/qHo9B
	 dVpFQE2df3ytQTa3Y5XAdpnNDgZIVV3KmPJdqcWwBymynwn9NDe/IYjM2YqASAXEMV/cZ
	 8XjMrwho8hbPWZjC1SHcmmUgUXORj+GvNsvzq36FxLXebzBvcaIc1QUkU6+KZ+TesAjwA
	 4pIEobxZBl7qZuqNBp/RnPWkNVOafh0NGkK+n2F7U/TJvqQJSR/mRbTFgtGMu4C1m/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794824571;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=I8O3Gcdr2ciSbGhr7JgU+FRReY6sXTgQJigN4nMb2xA=;
	b=IP/v4rLbSbEP+Kbq3j8RubqIWC2S03Cx7QVNYQlIqCkvp+I2wlmk7tc9BmPmvCKzc3Gv
	 DXzFlULu6O06Vaq0cXkh3n6AOBlF0d9MDbR8KUMagKKkzMC8/a6+Mdnu+LR1UL/24fpcW
	 calOC1A23eekiteJbemVIpONt62o2YpXaCZI9PaBay2sSoLbzAYCGljCwZgAxL4Attxpm
	 gVfwNI6ulAmzh+LZLQeoSW8IHdRVxFBsbpRVTIZq8NDMl4VHGJY/qDUAxODvL5nkJ1bFy
	 d2kU4mQ1PU/Nwkvas3iHWDnQ90itr/HlsUsTCMe1G15liMD6lQeDY9r/2Qim+X17Ojg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="NE/v+f5C";
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63BF606A884
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Nov 2026 10:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C63BF606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NE/v+f5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794824569; x=1826360569;
  h=date:from:to:cc:subject:message-id;
  bh=EioHk6II9uHs5PRFnDPK+caA2RZ9Wh9nPtSBXcsBvOU=;
  b=NE/v+f5CYGBPlKAlF0OHxD+L3H6+oDvXxANaG2sCCd329A6EVsf8StQ/
   SEKSrb4KtEbPOJCiH2P37TXlpLUPgMBoQfs1uJhk+6rAXXn/leZODgNtQ
   xwcHj08eCPvOstkA/DyYllgsTvNOyw2wiBLVlhl2EkBK0n0AgL9wu0Pac
   j0GdlQlAq7ffFOp1flH1Zs/3JIJVcVyGlZnej5MveVH+Zccbi3rnoDQtE
   zyfEg4IMs75qKdgsTJwWvQG6eCK6lOkjLS0FBTQDNtK+OwvzEDA5eIyYS
   6TqUA5AAtGDchShn2ZOqcHLyqzVoYks0JNHAsERyNPntyppEZY5/ceorS
   A==;
X-CSE-ConnectionGUID: B6e4MthXSnG+rzs89pveXQ==
X-CSE-MsgGUID: rN3ucEx3TbS7udLuQwsqIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3447940"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3447940"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 02:22:47 -0800
X-CSE-ConnectionGUID: NnHwyYUcQCiUQMBLzEEJbQ==
X-CSE-MsgGUID: Zx7YFOR/Qe6K1G7FEBPSrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9572929"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 16 Nov 2026 02:22:45 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xStrG-000000002fK-18pB;
	Mon, 16 Nov 2026 10:22:42 +0000
Date: Mon, 16 Nov 2026 11:21:53 +0100
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:sysfs-preferred-cpumask 9/9] htmldocs:
 Documentation/scheduler/preferred-cpu-thermal.rst:4: WARNING: Title underline
 too short.
Message-ID: <202611161158.iXbVGSc3-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/norov/linux sysfs-preferred-cpumask
head:   169cc1769714216ce22b4004b0c0c173bc9ad127
commit: 3d37617b0f644598f80cb32bbf8c4b93e2b6f39a [9/9] sched: decouple preferred CPU policies from steal-time accounting
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.23, Python 3.13.5, on linux)
sphinx: sphinx-build 9.2.0
reproduce: (https://download.01.org/0day-ci/archive/20261116/202611161158.iXbVGSc3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611161158.iXbVGSc3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/power/power_supply_class.rst:211: WARNING: Inline emphasis start-string without end-string. [docutils]
   Documentation/power/runtime_pm:311: ./include/linux/pm.h:3: WARNING: Duplicate C declaration, also defined at driver-api/pm/types:290.
   Declaration is '.. c:struct:: dev_pm_info'. [duplicate_declaration.c]
   Documentation/power/runtime_pm:322: ./drivers/base/power/runtime.c:1257: WARNING: Duplicate C declaration, also defined at driver-api/media/camera-sensor:117.
   Declaration is '.. c:function:: int pm_runtime_get_if_active (struct device *dev)'. [duplicate_declaration.c]
>> Documentation/scheduler/preferred-cpu-thermal.rst:4: WARNING: Title underline too short.


vim +4 Documentation/scheduler/preferred-cpu-thermal.rst

     2	
     3	Thermal control with preferred CPUs
   > 4	==================================
     5	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
