Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85817AD2D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 20 Apr 2025 01:30:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745112646; cv=none; b=V1BFzl/ek0SBwUkP9JSuZynm3ujnYFxtgcgEC4hSlVTajlkm5zOjbFYNE8DRtJ+ge/AVbC61sJc4b3W1s+hASEjaVO7v1brBZs6ICpG9ZWcvv28mat9AR8XoKEiFxTCn6CbOFL4AaB8nSKcvKqHO1PjVL0a5M51v3jtgmcDbPl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745112646; c=relaxed/simple;
	bh=zFNqdiBlhiAecw2lY9zYluqPnpumwktvZ/pZ0KP/aNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qsG3jbDwkNGwjPFJ0qhI+KzvykY2A4XOkh3+tPgqRKoFcdjwDmgyx3UZTP8dVg83BTsj2BnyrIxZBVKw/FbqOcL7NLyKzt4lYS7+jo30trKJaDodSYT4bXRsyc5iqmc4GomxgxNbJp7Af1rCdCqYVhEVHQUqnnUxMXgcMz94UP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dym/kq++; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dym/kq++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745112643; x=1776648643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zFNqdiBlhiAecw2lY9zYluqPnpumwktvZ/pZ0KP/aNY=;
  b=Dym/kq++mbzpU9jhQkBnzWhr2wKMAgjKU2hmsX/503ta0Hiu4GIHTAqc
   hXca0ucqlZCxUhOSWXn8A0zazacJuzwMfm+fV8/O0DavhstYSZ6xzmI8B
   jo1FgBY0m1NgWLn85aXc5DJ2xY5HswJUfDGrz0Toa6ZudiItZU6Wm4r4l
   YgRdLNSrEXBA/gspNWorpm/CJrnm+5PaaJhys7Ui3ktb8wlNagQWxMZOQ
   q1C3ko2VnUuQ1uOkS43WWjouZGwxXVuaChNSqK/UJz+YUjcdBArpQcVGT
   134a5/fXWXQKpURkPJLGVKkuLabGdddwUgbzKCZxqhNzacQQcrxthzof7
   w==;
X-CSE-ConnectionGUID: 6v3+B0+MQOu+pc5iAlRepg==
X-CSE-MsgGUID: AyXrtq+OT0iCWkYmyXrzSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="50521893"
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="50521893"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 18:30:43 -0700
X-CSE-ConnectionGUID: Ga3KUmi4SL6tG2ysK/lpuA==
X-CSE-MsgGUID: zPEzdhh2QYSYsXJVJqv3Bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,225,1739865600"; 
   d="scan'208";a="131163647"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Apr 2025 18:30:42 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6JW3-0004Jv-1s;
	Sun, 20 Apr 2025 01:30:39 +0000
Date: Sun, 20 Apr 2025 09:29:41 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:rdpmc_cleanup 1/6]
 arch/x86/include/asm/suspend_32.h:17:27: error: field 'saved_msrs' has
 incomplete type
Message-ID: <202504200935.YcKvAFCp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git rdpmc_cleanup
head:   3eeb4c90020080bbe299d3b6d9a86ea5485fabee
commit: 0a94caa1312b1b10fb9393fb0b983d3ebc03c483 [1/6] x86/msr: Move rdtsc{,_ordered}() to <asm/tsc.h>
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20250420/202504200935.YcKvAFCp-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250420/202504200935.YcKvAFCp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504200935.YcKvAFCp-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/suspend.h:3,
                    from arch/x86/kernel/asm-offsets.c:20:
>> arch/x86/include/asm/suspend_32.h:17:27: error: field 'saved_msrs' has incomplete type
      17 |         struct saved_msrs saved_msrs;
         |                           ^~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:98: arch/x86/kernel/asm-offsets.s] Error 1
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1280: prepare0] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/saved_msrs +17 arch/x86/include/asm/suspend_32.h

^1da177e4c3f41 include/asm-i386/suspend.h        Linus Torvalds            2005-04-16  12  
^1da177e4c3f41 include/asm-i386/suspend.h        Linus Torvalds            2005-04-16  13  /* image of the saved processor state */
^1da177e4c3f41 include/asm-i386/suspend.h        Linus Torvalds            2005-04-16  14  struct saved_context {
^1da177e4c3f41 include/asm-i386/suspend.h        Linus Torvalds            2005-04-16  15  	unsigned long cr0, cr2, cr3, cr4;
85a0e7539781da arch/x86/include/asm/suspend_32.h Ondrej Zary               2010-06-08  16  	u64 misc_enable;
7a9c2dd08eadd5 arch/x86/include/asm/suspend_32.h Chen Yu                   2015-11-25 @17  	struct saved_msrs saved_msrs;
cc456c4e7cac38 arch/x86/include/asm/suspend_32.h Konrad Rzeszutek Wilk     2013-05-01  18  	struct desc_ptr gdt_desc;
6b68f01baa810e include/asm-x86/suspend_32.h      Glauber de Oliveira Costa 2008-01-30  19  	struct desc_ptr idt;
^1da177e4c3f41 include/asm-i386/suspend.h        Linus Torvalds            2005-04-16  20  	u16 ldt;
^1da177e4c3f41 include/asm-i386/suspend.h        Linus Torvalds            2005-04-16  21  	u16 tss;
^1da177e4c3f41 include/asm-i386/suspend.h        Linus Torvalds            2005-04-16  22  	unsigned long tr;
^1da177e4c3f41 include/asm-i386/suspend.h        Linus Torvalds            2005-04-16  23  	unsigned long safety;
^1da177e4c3f41 include/asm-i386/suspend.h        Linus Torvalds            2005-04-16  24  	unsigned long return_address;
e3f269ed0accbb arch/x86/include/asm/suspend_32.h Anton Altaparmakov        2024-03-14  25  	/*
e3f269ed0accbb arch/x86/include/asm/suspend_32.h Anton Altaparmakov        2024-03-14  26  	 * On x86_32, all segment registers except gs are saved at kernel
e3f269ed0accbb arch/x86/include/asm/suspend_32.h Anton Altaparmakov        2024-03-14  27  	 * entry in pt_regs.
e3f269ed0accbb arch/x86/include/asm/suspend_32.h Anton Altaparmakov        2024-03-14  28  	 */
e3f269ed0accbb arch/x86/include/asm/suspend_32.h Anton Altaparmakov        2024-03-14  29  	u16 gs;
b0b592cf083677 arch/x86/include/asm/suspend_32.h Matthieu Baerts           2022-04-23  30  	bool misc_enable_saved;
^1da177e4c3f41 include/asm-i386/suspend.h        Linus Torvalds            2005-04-16  31  } __attribute__((packed));
^1da177e4c3f41 include/asm-i386/suspend.h        Linus Torvalds            2005-04-16  32  

:::::: The code at line 17 was first introduced by commit
:::::: 7a9c2dd08eadd5c6943115dbbec040c38d2e0822 x86/pm: Introduce quirk framework to save/restore extra MSR registers around suspend/resume

:::::: TO: Chen Yu <yu.c.chen@intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
