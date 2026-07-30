Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF643AC0E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Jul 2026 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785433884; cv=none; b=AZa3sM7udAF/s9DeiktoP9N5vI6kRrlABjvBg167Dk3YqLi/M6UQfz8HYwVQvy4oRjxfYEvsjh0pQ1dtj/vzG/EVo2f4llZRehoiH2fgNVeajnGVS04r+q5+rXIs5xeZ+Ykr6gAddJYzJ4EIxKEdx35cs5NVpkk59ZrWXb8v+LM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785433884; c=relaxed/simple;
	bh=FASLl6LxeUAlo0j+aDfxRRRP4K8r4hONFNnrQOwjuUU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=r4Xmt89isNViJj8PSeD1ZGoA7vD89aHzA+oA6qgyg1UHeJkDNb1pRBDFNbVL5tHzXVHRmLxzjxOEQgg4kOudF3gkbn+P9OvjaBWaUGTXS6rcM/oBUn51cQF1N9P7XHDgnjbgX4hlU9cnH61CBXBowP1YOizB4x5rYOxWgZyJ2aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VF2gTvJs; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VF2gTvJs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785433883; x=1816969883;
  h=date:from:to:cc:subject:message-id;
  bh=FASLl6LxeUAlo0j+aDfxRRRP4K8r4hONFNnrQOwjuUU=;
  b=VF2gTvJshFOHusq2sN8fsM2LaiCMH/H6gI1QUpLNwA5djplEryEgpQ7o
   qh9pmEaTaYqnTkUj0GUvlujRZkte2ICB5qEpIQizbTbjthcFzWOxsTuIw
   WszXlEth4ufxMGDzTVPEDtjzktDL9FYtUwDHK9X5z8PyHSD90e+CXOnYe
   3qulftxtA+YM5hO864yLPoSvTlxM0otBoEEyJE5cBELxTuNKNVUpzXYEz
   5ObVM7bEQdg77yWf3VmlJdD7oZMcDkJW0cl7mjFPespwaxKRsBRpnsWx5
   Jx8AXe53U0XcBq9Desw8aOY8B+TZ+8J6wpcsMZcRr7qubqjyKXRRF62Kv
   Q==;
X-CSE-ConnectionGUID: Tgd5+0reSVCl9DlCQ5Eghw==
X-CSE-MsgGUID: jK9okqcOSVWEPDazWJT/Ww==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="89950203"
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="89950203"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 10:51:15 -0700
X-CSE-ConnectionGUID: ouUaZAIXTi2p94UHA+aTvQ==
X-CSE-MsgGUID: EkUkp95vT0uXchLqaLqrjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,194,1779174000"; 
   d="scan'208";a="260971086"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 30 Jul 2026 10:51:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wpUuO-00000000hOj-3J40;
	Thu, 30 Jul 2026 17:51:06 +0000
Date: Fri, 31 Jul 2026 01:50:39 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:overflow-stack 10/13]
 include/linux/arm_sdei.h:16:45: error: expected identifier or '(' before
 numeric constant
Message-ID: <202607310155.mQ3CM2r1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git overflow-stack
head:   7c0748c59a858f301fc801a9818ea1c11ff88ff0
commit: d017f75e2f157a38b824c8f4253f07fac65622eb [10/13] arm64: entry: Point SP_EL0 at the overflow stack
config: arm64-randconfig-003-20260730 (https://download.01.org/0day-ci/archive/20260731/202607310155.mQ3CM2r1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607310155.mQ3CM2r1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607310155.mQ3CM2r1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/kernel/smp.c:10:
>> include/linux/arm_sdei.h:16:45: error: expected identifier or '(' before numeric constant
    #define sdei_arch_get_entry_point(conduit) (0)
                                                ^
   arch/arm64/include/asm/sdei.h:49:15: note: in expansion of macro 'sdei_arch_get_entry_point'
    unsigned long sdei_arch_get_entry_point(int conduit);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/stacktrace.h:16,
                    from arch/arm64/kernel/smp.c:52:
   arch/arm64/include/asm/sdei.h:50: warning: "sdei_arch_get_entry_point" redefined
    #define sdei_arch_get_entry_point(x) sdei_arch_get_entry_point(x)
    
   In file included from arch/arm64/kernel/smp.c:10:
   include/linux/arm_sdei.h:16: note: this is the location of the previous definition
    #define sdei_arch_get_entry_point(conduit) (0)
    


vim +16 include/linux/arm_sdei.h

ad6eb31ef90355 James Morse 2018-01-08  13  
ad6eb31ef90355 James Morse 2018-01-08  14  /* Arch code should override this to set the entry point from firmware... */
ad6eb31ef90355 James Morse 2018-01-08  15  #ifndef sdei_arch_get_entry_point
ad6eb31ef90355 James Morse 2018-01-08 @16  #define sdei_arch_get_entry_point(conduit)	(0)
ad6eb31ef90355 James Morse 2018-01-08  17  #endif
ad6eb31ef90355 James Morse 2018-01-08  18  

:::::: The code at line 16 was first introduced by commit
:::::: ad6eb31ef90355993eb55ff77e0e855ae7d91e4c firmware: arm_sdei: Add driver for Software Delegated Exceptions

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Catalin Marinas <catalin.marinas@arm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
