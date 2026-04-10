Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39FE734B410
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Apr 2026 14:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775831294; cv=none; b=LDuNZ+Wn3BpyqxPbJ2hrlA1uLVqWffvDpfaWKhmDs8wZWI4LfGWmQb+1Zw3Lijj2lDt3U5tNryaPO60ks4HIDjlws4PyPSQpl8m9xUH9YHnG3jgXLZxFb6pytOmz+kBs0Y5rEdqJGU7I+u0Btplvn1ot4O0UyYw6DU3jbQNOkHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775831294; c=relaxed/simple;
	bh=0hmcoqWVmz0w7BBMEpc5JnB6lc8cH23+l5TI/JZ0uu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=toI7SH6MvRBg7hFXq1AwnWFL7lwftK26BxHKQVRqRTk0sGRKd5GlZBAtoYtbcZq/U+QHG4B6vYHtVp/E7QSqYpeea7XyHQEV/xoI7VgpH3gizNZ7xP0Xr11GHG7YFDpm1Z7s3Ro8jeQLQ1dWM8EFj989AK+hBzvuBzKsRhGalcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VuhZZJez; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VuhZZJez"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775831292; x=1807367292;
  h=date:from:to:cc:subject:message-id;
  bh=0hmcoqWVmz0w7BBMEpc5JnB6lc8cH23+l5TI/JZ0uu4=;
  b=VuhZZJezjtxGmUOFDPKOgXkzYnlrua0zPOA9mKCbIlFE9T4LU6nzM4y2
   d0oscMiM7kZHIda+2plewmpKWWT8zHVi0Xlnp6qT6p+yluTWK+P+S+rz5
   KgRa5klgqdEOcxdlsTrq/he8UJ+aOY/oygYwWEzWL6pb7CPC57K5KahyG
   a7vr1+Xp9/1+ehDCYQWmVENb68HDOHFVSZT1bmjnR+4NeldUhj8XCUJ74
   f6PPgt/arw/zFqpZEPwDdRD377+u0VpbQU/gPjHXvgp1y3qmHs+Pklxki
   9QQxSdmdN6iU9213kbiNswqXHV55p73W+Uhv5Ny+6C3JJaTjcwhMacFKe
   g==;
X-CSE-ConnectionGUID: 7IqOnyW1Qk+HU8ziYc7cdg==
X-CSE-MsgGUID: TqkbHN59QbuloGfmGd7lGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="102309596"
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="102309596"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 07:28:12 -0700
X-CSE-ConnectionGUID: SG8nYCxHS9ucQp895mogsA==
X-CSE-MsgGUID: zIUDTB/EQxKDVSG358HiNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,171,1770624000"; 
   d="scan'208";a="228088662"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 10 Apr 2026 07:28:10 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBCq8-00000000AuL-0xz8;
	Fri, 10 Apr 2026 14:28:08 +0000
Date: Fri, 10 Apr 2026 16:27:22 +0200
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:alloc-token 1/1] htmldocs:
 Documentation/core-api/mm-api:40: ./mm/slub.c:6725: WARNING: Error in
 declarator or parameters
Message-ID: <202604101645.BMloxkm6-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git alloc-token
head:   2487a06dac65a53af6cb1a626beab20f2c208e89
commit: 2487a06dac65a53af6cb1a626beab20f2c208e89 [1/1] slab: support for compiler-assisted type-based slab cache partitioning
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260410/202604101645.BMloxkm6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604101645.BMloxkm6-lkp@intel.com/

All warnings (new ones prefixed by >>):

   WARNING: ./include/linux/slab.h:1123 expecting prototype for kmalloc_array(). Prototype was for _kmalloc_array() instead
   WARNING: ./include/linux/slab.h:1220 function parameter 'token' not described in '_kzalloc'
   WARNING: ./include/linux/slab.h:1220 expecting prototype for kzalloc(). Prototype was for _kzalloc() instead
   WARNING: ./mm/slub.c:5289 function parameter 'token' not described in '_kmalloc_nolock'
   WARNING: ./mm/slub.c:5289 expecting prototype for kmalloc_nolock(). Prototype was for _kmalloc_nolock() instead
>> Documentation/core-api/mm-api:40: ./mm/slub.c:6725: WARNING: Error in declarator or parameters
   Error in declarator
   If declarator-id with parameters:
   Invalid C declaration: Expecting "," or ")" in parameters, got "#". [error at 48]
   void * __kvmalloc_node (DECL_KMALLOC_PARAMS(size# b# token), unsigned long align, gfp_t flags, int node)
   ------------------------------------------------^

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
