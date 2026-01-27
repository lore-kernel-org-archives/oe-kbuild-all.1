Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D264C8F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 00:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473170; cv=none; b=LgI6VVwp48Niylvy2NrFbjWpX/QSTPjpAseveKWYJN6sNGDldApcgcRZR7ZRE3zbhDViYQu3IgCYJy36oNqzE/QORgzB/5ktzFwJFtOCZOR6zj/cshDxhALijOnWVYuXORx6ZWhLGX7ul7ZVF2XxO1jT/U1H8lJIVdhzJ7MhN5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473170; c=relaxed/simple;
	bh=78Alia93sWDVYKLuYQvUJd8E31RQMltBUOmS7AxBQlc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PrccheOt4DJF4d5BalfToUaIy11Pr8DBZnRBeGXpDOYAWR2rHCWlaANSZyJ2OZO8sBaEoNRcZI5Qa2fYG3O7ACDnzNfwGhCgjEpseruY0f54q5xsN43k+p3ilVJZ3SsVFy0aDzhrLRsOZToLAmFtiB+NsSQFcPcw38rliqGV/TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H+vNA17t; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H+vNA17t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769473168; x=1801009168;
  h=date:from:to:cc:subject:message-id;
  bh=78Alia93sWDVYKLuYQvUJd8E31RQMltBUOmS7AxBQlc=;
  b=H+vNA17tfuHoNCle0He8kbkMUgkbgDHWpGTDElJkH/X9fncX/BXbMyic
   ere6j56jWkhm36Ik8UExQ3HF3QGBNoCixOqIK+O58oaWM5moyBFW9j2F9
   2CyVdxRCRTHQ/jF44J95KiXHTBWwp1Q2xPMNqaY05Sn3hJuUi+ma2H7o4
   IsifV6acgl8xraeinEYY42+fovyO2mk7+R9/GFseIAkEWHCs3nJQ9q4Kn
   wW30EukFjzo7dg+t955Qek+dLYVcyHeV6SqrHtQsxcOUAQV0ztGwzSePa
   XQxq30gq8BhTbCXrShxwsjt58SGSMxPkJdJIsEt6oP2uYWVEJyoQuDzlD
   g==;
X-CSE-ConnectionGUID: RiUKepJ3TOqp/ZEjkP3yzw==
X-CSE-MsgGUID: Jq9Y+TGoRLSyjKWhQMlHWg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="70629334"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="70629334"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2026 16:19:28 -0800
X-CSE-ConnectionGUID: F05ugNYdQpaKnzhImAM9GA==
X-CSE-MsgGUID: uPUi3SMyQt2xumjj8ubL2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="207624749"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 26 Jan 2026 16:19:27 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkWnj-000000001dZ-1HUt;
	Tue, 27 Jan 2026 00:19:23 +0000
Date: Tue, 27 Jan 2026 01:18:55 +0100
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [fustini:b4/ssqosid-cbqri 14/18]
 include/linux/acpi.h:1582:9: error: incompatible integer to pointer
 conversion returning 'int' from a function with result type 'struct
 acpi_pptt_cache *'
Message-ID: <202601270126.yQrcC8fo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri
head:   8182dddb709d03a64b99b430d05f8f21103aa9b3
commit: 60aed9e92fe0ca93b56a46ae251eb1ff851d572f [14/18] acpi: pptt: Add helper to find a cache from id
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20260127/202601270126.yQrcC8fo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601270126.yQrcC8fo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601270126.yQrcC8fo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> include/linux/acpi.h:1582:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct acpi_pptt_cache *' [-Wint-conversion]
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:119:11: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:119:27: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:174:27: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:174:10: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:175:20: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:175:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:177:27: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:177:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   arch/x86/include/asm/signal.h:24:2: note: array 'sig' declared here
   clang diag: include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:99:4: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:101:11: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:116:5: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:116:21: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:119:11: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:119:27: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:138:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:8: warning: array index 3 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:139:24: warning: array index 2 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:140:3: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:141:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:8: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:144:24: warning: array index 1 is past the end of the array (that has type 'const unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:145:3: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:174:27: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:174:10: warning: array index 3 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:175:20: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:175:3: warning: array index 2 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:177:27: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:177:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:198:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:211:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:242:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
   clang diag: include/linux/signal.h:255:10: warning: array index 1 is past the end of the array (that has type 'unsigned long[1]') [-Warray-bounds]
>> Unable to generate bindings: clang diagnosed error: include/linux/acpi.h:1582:9: error: incompatible integer to pointer conversion returning 'int' from a function with result type 'struct acpi_pptt_cache *' [-Wint-conversion]


vim +1582 include/linux/acpi.h

  1579	
  1580	static inline struct acpi_pptt_cache *find_acpi_cache_from_id(u32 cache_id)
  1581	{
> 1582		return -EINVAL;
  1583	}
  1584	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
