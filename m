Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF7243B960F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jun 2026 11:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782732764; cv=none; b=FWVakAwgkZUohm83VmIot+pQlNej+8mOhH/gY+A1Z26C2YR8ZlKIpMzD9qJgHHuMURh/T7rxyBM05OYQs8TzyIOLcmb1Fg4ryShjvwP1I6XEGrSiX68oOsUAPM1r4tvbtyb4+SeeF+M75wRS7x78uZRtm5ASkvFTx/5uDpAfjlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782732764; c=relaxed/simple;
	bh=wQDrY3BLj/V+27zfxcUaImzWufyJTXnNMRgCv4U2Bh4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=bmpZ+DtreN3a/fb9u/Pv5o1ToQL+0Xu4fXeC5LyzFhxgXLbaUfYOoxTBr74kihE5DDhMhGYge7zi0m/tIHzH7xrcl4muAVUl1ILIsUV6kE6se9+VcK8Cg2b/6usOIu6oGQxVfTjV7gc+Q47q8MBIcKRwO2QANHzZyZEY06ssyd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C1KSpzMm; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C1KSpzMm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782732763; x=1814268763;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wQDrY3BLj/V+27zfxcUaImzWufyJTXnNMRgCv4U2Bh4=;
  b=C1KSpzMm7FuYVgpE+uUrIP8QYR3Wwet+CD2XHIGe2Bw8TSKc2RJbtb48
   8HtS9dLliY49vAd8K4FMRqTBonQl6qSte7lUypCefjaBLL8P7sLe9O94m
   69JXwRB9ndVU7MMHGlM3+5dPxLH75Td+S37fJVJB61mh9htRhtLI1Hmnj
   ag9wwXmuNxMGY56aInIZ1Nvd+IINRpbcf3P7roT9LHy0MBHLArg3BhQ4K
   c0bSz0fSnG37UC4JrZxu+cEoNLt5xLskPnTO19cL1+gPu19POXrx6lLaS
   1qF1VuCz0NCjdWMsYqHf6gnGlO/GwFZchpTvP3GE5vej8ItyLk1Fb1bZp
   A==;
X-CSE-ConnectionGUID: sNZ9GQwcQ0K2FStEilpSXw==
X-CSE-MsgGUID: JU7TdyHVS8iAFt+a+wuYgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11831"; a="85966231"
X-IronPort-AV: E=Sophos;i="6.24,231,1774335600"; 
   d="scan'208";a="85966231"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2026 04:32:40 -0700
X-CSE-ConnectionGUID: u2RNH2noQPOAFwlTHBWdcQ==
X-CSE-MsgGUID: wMTWqdtBT8CToWLDMkCeSw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jun 2026 04:32:39 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1weAE8-000000007Lt-2PPn;
	Mon, 29 Jun 2026 11:32:36 +0000
Date: Mon, 29 Jun 2026 19:31:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= (The Capable Hub)" <u.kleine-koenig@baylibre.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ukleinek:device-id-rework 15/16]
 arch/parisc/include/asm/ptrace.h:45:13: error: implicit declaration of
 function 'unlikely'
Message-ID: <202606291931.RraFVSbi-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git device-id-rework
head:   6285120b1fe1c6ceecd5a128677a5d9fb6da40dc
commit: 1a0bca71ef19173549e5865b2509eafeb7587ebf [15/16] Replace <linux/mod_devicetable.h> by more specific <linux/device-id/*.h> (headers)
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260629/202606291931.RraFVSbi-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260629/202606291931.RraFVSbi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606291931.RraFVSbi-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/parisc/include/asm/processor.h:20,
                    from include/linux/sched.h:13,
                    from arch/parisc/kernel/asm-offsets.c:19:
   arch/parisc/include/asm/ptrace.h: In function 'regs_get_register':
>> arch/parisc/include/asm/ptrace.h:45:13: error: implicit declaration of function 'unlikely' [-Wimplicit-function-declaration]
      45 |         if (unlikely(offset > MAX_REG_OFFSET))
         |             ^~~~~~~~
   make[3]: *** [scripts/Makefile.build:184: arch/parisc/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1405: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/unlikely +45 arch/parisc/include/asm/ptrace.h

ea1afe339a2b12 Sven Schnelle 2019-04-07  41  
ea1afe339a2b12 Sven Schnelle 2019-04-07  42  static inline unsigned long regs_get_register(struct pt_regs *regs,
ea1afe339a2b12 Sven Schnelle 2019-04-07  43  					      unsigned int offset)
ea1afe339a2b12 Sven Schnelle 2019-04-07  44  {
ea1afe339a2b12 Sven Schnelle 2019-04-07 @45  	if (unlikely(offset > MAX_REG_OFFSET))
ea1afe339a2b12 Sven Schnelle 2019-04-07  46  		return 0;
ea1afe339a2b12 Sven Schnelle 2019-04-07  47  	return *(unsigned long *)((unsigned long)regs + offset);
ea1afe339a2b12 Sven Schnelle 2019-04-07  48  }
ea1afe339a2b12 Sven Schnelle 2019-04-07  49  

:::::: The code at line 45 was first introduced by commit
:::::: ea1afe339a2b1260aa31a4d100155d4403446704 parisc: add functions required by KPROBE_EVENTS

:::::: TO: Sven Schnelle <svens@stackframe.org>
:::::: CC: Helge Deller <deller@gmx.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
