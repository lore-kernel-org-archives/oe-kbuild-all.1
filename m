Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AD23812DE
	for <oe-kbuild-all@lists.linux.dev>; Sun, 30 Aug 2026 07:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788074890; cv=none; b=eDv83NIuq+SfiLakbq3A9dz1D+QYafqrmx2QIfMQ11upZRPbZfHce7hKDaXG3hTUijWWHc57kpoScW71ITJiAkVzVETaJi9KEngEFkD5AlRq6hX9w3vAO2VkbaT4lhyD88E5a6hky8SvphPTFIjaIc0lrie6/StZhynlzago3QY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788074890; c=relaxed/simple;
	bh=8ew9ZM7z1L8uBkctf/jpRcGyCzMciUZ8IHI3x5156H8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K69tV5tQEhsRCouEbZP3dPeEX60fAnBe/s03Ov5MdNNPRr/JdmrzSb/Zs/WfYXwAwuS7kokVc1GRrnHnHzpZMK2/s9x4fdyXRC6kd3ZWBD5iHemlMw0+9DXmu4zJUsAhWu5HJ8sDEUwDodwDZG9/8juNlDryN3mRqt9DmLd8Uvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PtBmwm9D; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PtBmwm9D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788074888; x=1819610888;
  h=date:from:to:cc:subject:message-id;
  bh=8ew9ZM7z1L8uBkctf/jpRcGyCzMciUZ8IHI3x5156H8=;
  b=PtBmwm9DdWvIqR9FekO41KUs3nrJKMu8/qhEvjsM7Amhm58a1uHvoKbH
   6ZSZiNFuY2HES6UbvFM6e8E91P5xW80M5O+gNnEQoGkpypxZ84XbzMXOU
   BpFXRCFflNqmUx9SFf9oUKgXWL8tA0yLLzXp8eI4lXNYo2lfufXgc3ttF
   NC8UXbmeeGFXeRD9n/jHFForYMPRFF/7Q7ysR/JGkGcJU9VUqhQIqJYiH
   9KHgr+Al/SnFObQ/ZCH7UWj37K6pXtrrSkvzMCw0R78lKdx7APqW1cWx4
   8rR8k5KOfDZDQo33PZluwFY+BrEYZIyTtTioMGl257j6UL9atCS0avoYX
   w==;
X-CSE-ConnectionGUID: Vy6zXFliRua2wiCK+Bn1fw==
X-CSE-MsgGUID: Bm/croYfRXOT4cqR/u4rzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11890"; a="76059702"
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="76059702"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 00:28:07 -0700
X-CSE-ConnectionGUID: +nLW5AxlQEybILuloK499g==
X-CSE-MsgGUID: KotWQnTQQ8STScLS379DkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,251,1779174000"; 
   d="scan'208";a="264778677"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2026 00:28:06 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0ZxT-00000000DgS-1ABP;
	Sun, 30 Aug 2026 07:28:03 +0000
Date: Sun, 30 Aug 2026 15:27:06 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:irqflags 13/20] include/linux/irqflags.h:205:9:
 error: implicit declaration of function 'arch_safe_halt'; did you mean
 'raw_safe_halt'?
Message-ID: <202608301526.FqKeHING-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git irqflags
head:   59394501f5a285ef270931207a67d2f129403151
commit: 882d92b84f9618f000a4de66daeee48df6d81357 [13/20] irqflags: Cleanup wrappers
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20260830/202608301526.FqKeHING-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260830/202608301526.FqKeHING-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608301526.FqKeHING-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/mips/include/asm/atomic.h:17,
                    from include/linux/atomic.h:7,
                    from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from arch/mips/include/asm/cpu-type.h:12,
                    from arch/mips/include/asm/timex.h:19,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/compat.h:10,
                    from arch/mips/kernel/asm-offsets.c:14:
   include/linux/irqflags.h: In function 'raw_safe_halt':
>> include/linux/irqflags.h:205:9: error: implicit declaration of function 'arch_safe_halt'; did you mean 'raw_safe_halt'? [-Wimplicit-function-declaration]
     205 |         arch_safe_halt();
         |         ^~~~~~~~~~~~~~
         |         raw_safe_halt
   make[3]: *** [scripts/Makefile.build:185: arch/mips/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1414: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +205 include/linux/irqflags.h

   202	
   203	static __always_inline void raw_safe_halt(void)
   204	{
 > 205		arch_safe_halt();
   206	}
   207	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
