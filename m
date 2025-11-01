Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F192727FE
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 04:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761970079; cv=none; b=WKRs1TnHEv4EiM6WFwm8B4Bq7rCXri0ZgQMGLfR+SxXNXNPxZzlCTiFWDRIyHnLNuT97V3f4r3oniqR3MPJLVkXMs70iLdeky/d+8ADaXErT7vvdpaBfHOWfEHw62Y36UMDCXzl0Nedn7+NgCIhHs8Sc0zglTxuc4T2w/wvVhwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761970079; c=relaxed/simple;
	bh=66sz8Yp0HoDksWjMIuaCasZQ6iXxRf4GpcSDRm7qb3w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RsY+6RnrG4t1ynEsoAD1JGq+91WShDJvhEABkY93DJWYXGOIev/InAvBWuDiNVJB9KKhLp1hsoBgc3S4+LXNuBuliVMKNwNjadF03TqHqtatDzpwpPpAi/ADmF/l7coGOAxafG9uQcY/VgN5N+V+KDF1IaCKOEnpj72/m2bHSXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cPYhK6ss; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cPYhK6ss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761970077; x=1793506077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66sz8Yp0HoDksWjMIuaCasZQ6iXxRf4GpcSDRm7qb3w=;
  b=cPYhK6ss/9NeAClImfRZ9lVf9VLzcLvsWxwRcyO21ZdqBUjllYNnP4ia
   cVNI5ysaA6UL/SquHxeQ1eOIm5wg0ZLESIWX2vfzecWiOr8Af9810UZUq
   Nv7Kg711zRerlq7k2xRE9Pxn+d6intda+ZEWesLcv1RrEx/P3wLa3XkWh
   gVw0UDfzzMFgZ8zWv+yTebFCqpJg33dwoJqPiAh+zzLHjmV7YkcWdoqa6
   lPYpYmxHac3XoklLFqqYQGxXTosFF/d+8Z7pK0ZpBbMV6BfPHcvv8B/h/
   r0FDigiZt8gksGqIZ0Z/ny3Y9knzwSZlX/c4RrULepimOxhAkG01wD6kE
   g==;
X-CSE-ConnectionGUID: Y7Y14lIZRze4Mjc6cfcN0g==
X-CSE-MsgGUID: VTfHXv0iStyH/iZtar0Usw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="64163379"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="64163379"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 21:07:32 -0700
X-CSE-ConnectionGUID: oIFcqYw3SXyLF3VNTHSpoA==
X-CSE-MsgGUID: pYq6dIGkS+GjGPwAShyNkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="223632009"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 31 Oct 2025 21:07:32 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vF2tl-000000001Fg-3Xwl;
	Sat, 01 Nov 2025 04:07:29 +0000
Date: Sat, 1 Nov 2025 05:06:46 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/3]
 arch/x86/kvm/pkvm/fpu/fpu.c: internal.h is included more than once.
Message-ID: <202511010528.3rjzoVip-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   43ce0f84dc2297fc37c2b9e5ccdbf24edab58576
commit: 4b8576f328339c1fa6afa1ff56b75c6abcdecdd7 [0/3] ANDROID: pkvm: x86: Initialize the guest fpu
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511010528.3rjzoVip-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> arch/x86/kvm/pkvm/fpu/fpu.c: internal.h is included more than once.

vim +8 arch/x86/kvm/pkvm/fpu/fpu.c

     7	
   > 8	#include "internal.h"
     9	#include "fpu.h"
  > 10	#include "internal.h"
    11	#include "xstate.h"
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
