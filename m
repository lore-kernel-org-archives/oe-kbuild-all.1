Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8498268B61
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 17:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DQfr2cOK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701798370; x=1733334370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PFQejbLytpK0PIobJ0ytaNGZ30vkahPcLgFj2SG0sd8=;
  b=DQfr2cOKX+3js1aRoXJ2IbGJtinPc5YralrWfkGCk31uMypKcprmyCE2
   ofvu7GIIucn4CBoV0XJ3Va/Yr0OU2z4OWpwrJDSd2S2zrOJJbF9UxRm+Z
   Ysk9wcpO/Z7yPxvZcVPrVS1HGZdpe6fl85TLEJ0huunzeYG+gERaOGjNN
   s+r8hkp2iGS37xlKNz0iKbKydIXbshXfsSQovVU5xbjZjY3deFcVp94xd
   Vow29Tj99bRLC9djkcTz4fUM2rwUBbydRtAcA+gbF/5gVRUvO1CMu2P8P
   PTe+zwdEU4ggixIvOAXGuho3t/aQ04CrVhsgONzRk8uj0U21Dw5MoIR6V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="425089898"
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="425089898"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 09:46:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,252,1695711600"; 
   d="scan'208";a="12406041"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 05 Dec 2023 09:46:09 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAZUk-0009Tc-0X;
	Tue, 05 Dec 2023 17:46:06 +0000
Date: Wed, 6 Dec 2023 01:45:24 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/kvm 3/11] arch/x86/kernel/static_call.c:47:33:
 error: expected ')' before 'ASM_ANNOTATE'
Message-ID: <202312060149.6bEiGno8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/kvm
head:   bd8e1c4c02ac085925674bddccb989e2d7d6cc2d
commit: b7a510b43b1833fc6b0543c0295970c1dd87fbde [3/11] objtool: Convert ANNOTATE_RETPOLINE_SAFE to ANNOTATE
config: i386-buildonly-randconfig-003-20231203 (https://download.01.org/0day-ci/archive/20231206/202312060149.6bEiGno8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060149.6bEiGno8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060149.6bEiGno8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/static_call.c:47:33: error: expected ')' before 'ASM_ANNOTATE'
      47 |      "__static_call_return:\n\t"
         |                                 ^
         |                                 )
   arch/x86/kernel/static_call.c:44:5: note: to match this '('
      44 | asm (".global __static_call_return\n\t"
         |     ^


vim +47 arch/x86/kernel/static_call.c

923510c88d2b7d9 Peter Zijlstra 2023-01-26  43  
923510c88d2b7d9 Peter Zijlstra 2023-01-26  44  asm (".global __static_call_return\n\t"
923510c88d2b7d9 Peter Zijlstra 2023-01-26  45       ".type __static_call_return, @function\n\t"
923510c88d2b7d9 Peter Zijlstra 2023-01-26  46       ASM_FUNC_ALIGN "\n\t"
923510c88d2b7d9 Peter Zijlstra 2023-01-26 @47       "__static_call_return:\n\t"
923510c88d2b7d9 Peter Zijlstra 2023-01-26  48       ANNOTATE_NOENDBR
923510c88d2b7d9 Peter Zijlstra 2023-01-26  49       ANNOTATE_RETPOLINE_SAFE
923510c88d2b7d9 Peter Zijlstra 2023-01-26  50       "ret; int3\n\t"
923510c88d2b7d9 Peter Zijlstra 2023-01-26  51       ".size __static_call_return, . - __static_call_return \n\t");
923510c88d2b7d9 Peter Zijlstra 2023-01-26  52  

:::::: The code at line 47 was first introduced by commit
:::::: 923510c88d2b7d947c4217835fd9ca6bd65cc56c x86/static_call: Add support for Jcc tail-calls

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
