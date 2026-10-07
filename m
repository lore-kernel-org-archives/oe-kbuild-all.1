Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762653EF649
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 18:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791397266; cv=none; b=kMzLAOFAf1t/WvvexvDuXxctHmYmnBujP+slk0tr4p0/20ajpqSpexZJgGCYIqkKD7pxZ0FUVEIuUIVs8e7zNrcSeQt8TOzQHbMMCG3/uftDEkSsYkPJPz/oBhUwqvBiZtZkugiFF1lO81Ljm+Y26ZeQyl3+Ee3bZLGFwQOyc4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791397266; c=relaxed/simple;
	bh=ODA0YKMk576d19JPv3jzx5nT41NXcCL33jytNClfo4g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sVuvZUKNnVXgs3gvHpOKM8S7kRXUyCmMgCF3TnztRoi93l0bjvkrtgCtFrr/hyB/M9g6Kdd5N6R22hkU17c6bDu0kmDV1lsuMw1ZUCCLO0qjkLRcA5NKwJPKthU24KYrC2G4Z+wUxPzRSaLbZNzvDgKowcnRJkT9nExLSKwi4U0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nlr9SLKH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nlr9SLKH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791397265; x=1822933265;
  h=date:from:to:cc:subject:message-id;
  bh=ODA0YKMk576d19JPv3jzx5nT41NXcCL33jytNClfo4g=;
  b=Nlr9SLKH/OEzxjUGYaoSkDYm0VZ5UsXy9OqFQUvPiwRp3jqK9cO7ykG3
   scwvEHPrxZfijQhQ2TX4DVsxOQTdV14RaxOecWuGKxn4pldLR6qUqjVOO
   rsrgDholueCsv4t7aAIwLJEB0PisKeyVcdU/qIteAoFYP36840huzjJXb
   nXiV/42vTPB5UJEQ+dszQIGV1PVqWqf9/Ojxs/zFemJAG31UqUsstq2po
   KcmmR2aZbwrlX4wK1dy1g3shp9gZiyDOt12x6wQxGHrOOuIhEc/cQ+NOq
   jJGIVodig18FUzdq/7MvRcdBX0oK0f125gtyRf8upPswS+c6TPJ9gNF65
   A==;
X-CSE-ConnectionGUID: q5Gc6ImhTOSboLc4X6TKdA==
X-CSE-MsgGUID: aJcIlQg7QhCUDarwzPIjGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="162280"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="162280"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 11:21:04 -0700
X-CSE-ConnectionGUID: fW0mxMo5RVqgH80Y2x7N0g==
X-CSE-MsgGUID: dD6tQy5XTdqB7AaVpchlZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="1614895"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 07 Oct 2026 11:21:03 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEWGC-000000003mR-3DAL;
	Wed, 07 Oct 2026 18:21:00 +0000
Date: Wed, 07 Oct 2026 20:20:14 +0200
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:noreturn 25/26] vmlinux.o: error: objtool:
 xen_prepare_pvh+0xe4: xen_pvh_init() is missing __noreturn in .c/.h
Message-ID: <202610072037.ZdcHpEsb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git noreturn
head:   a1615a8cef9c961a34bd5d4b28a58518d84c7c64
commit: 4bcfe84445b3d093a37c31821a3f2c95a0d214fa [25/26] objtool: Annotate all module-exported noreturns and remove noreturns.h
config: x86_64-randconfig-2103-20261006 (https://download.01.org/0day-ci/archive/20261007/202610072037.ZdcHpEsb-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072037.ZdcHpEsb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072037.ZdcHpEsb-lkp@intel.com/

All errors (new ones prefixed by >>):

>> vmlinux.o: error: objtool: xen_prepare_pvh+0xe4: xen_pvh_init() is missing __noreturn in .c/.h

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
