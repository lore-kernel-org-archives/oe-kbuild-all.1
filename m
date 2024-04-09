Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 376CD158851
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 23:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712707094; cv=none; b=diIhOmoeJ3mzFaLKoJr689FhyUsu3U2BweMEAP4C4nIjgn5CqMLL9AIHNLMeqAv8lILjm9y+TM6p7148y6P4jpCdPmOOv42j2MIxZ+0CAf05zfTapJwa8nVLEYcrYeBjJ3PR8zhorzC64D3uTHHQX6FNYCexqtKkj80cH9zTeCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712707094; c=relaxed/simple;
	bh=Ey7vuVwts6fBxGnsDMC8m+jV9bCoy3JShyaazfbNop8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DdXxCgszdDB99mTVKSMDS1vJr0MyPECJOIIIceZCRNTSlQdgCj+BvMVbYdDWss6sPKj51Kx5grzwUXLCDt8PIciHnkY8SUvak91M8j2ck8enk8ILGp/kiXp4OmJPwlkQijP0jQ9ve6MoDkIm/8F5ZXmpWpfIOgpITo6ZLXFXuQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dyeD72Ou; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dyeD72Ou"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712707092; x=1744243092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ey7vuVwts6fBxGnsDMC8m+jV9bCoy3JShyaazfbNop8=;
  b=dyeD72Ou+vJbLjH16jJmzt4amblP/AnWNyFJomL239Y7wCqrYDpx5kzr
   wOLlIkxyG4bZANJTgo7jrwn7HZKGhoO7XTDg+Nv4QCEqJpx3O0+Fos+tT
   irfBIH4315NAkvUv5Kb7G1THQx/81jKwml5KB3GmP3qvrK2CQeK1KJhru
   3/s6Z/gHkf/ZD5jzspRm0EvTl9ap6Ujn8HKX7YYe32xwxlPvUPfea/BPg
   2vueynYue8casC2ejnaT9ykGtvQACCeTHdHUohhiBF/xMTBJbapOQ9tqQ
   bh/TKpB/ctdEerX0NoUtNAjLHf3Tdp50fls/mxoabFL7DCZCGmJ9mKddI
   A==;
X-CSE-ConnectionGUID: ++MPHTqsQGeXyEZz2IC9fw==
X-CSE-MsgGUID: 6tlV+iTrRTGjbwbXMcKwow==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="7909527"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="7909527"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 16:58:12 -0700
X-CSE-ConnectionGUID: nOBrb9TdQM2IlB5UZKeORQ==
X-CSE-MsgGUID: /r9eT1Z8QWSijsjLqqt1bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="25060700"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Apr 2024 16:58:10 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruLLs-0006dS-0B;
	Tue, 09 Apr 2024 23:58:08 +0000
Date: Wed, 10 Apr 2024 07:57:39 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/v4+x86-rox 20/22] arch/um/kernel/um_arch.c:440:6:
 error: conflicting types for 'apply_seal_endbr'; have 'void(s32 *, s32 *)'
 {aka 'void(int *, int *)'}
Message-ID: <202404100755.8UajSpgL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/v4+x86-rox
head:   a14551111ff8bbf3c520771e89892d599463da71
commit: 7f45ca3e4336a3d09724b582e0d1776f7b8423eb [20/22] x86/module: perpare module loading for ROX allocations of text
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20240410/202404100755.8UajSpgL-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240410/202404100755.8UajSpgL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404100755.8UajSpgL-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/um/kernel/um_arch.c:408:19: warning: no previous prototype for 'read_initrd' [-Wmissing-prototypes]
     408 | int __init __weak read_initrd(void)
         |                   ^~~~~~~~~~~
>> arch/um/kernel/um_arch.c:440:6: error: conflicting types for 'apply_seal_endbr'; have 'void(s32 *, s32 *)' {aka 'void(int *, int *)'}
     440 | void apply_seal_endbr(s32 *start, s32 *end)
         |      ^~~~~~~~~~~~~~~~
   In file included from arch/x86/um/asm/barrier.h:6,
                    from include/asm-generic/bitops/generic-non-atomic.h:7,
                    from include/linux/bitops.h:34,
                    from include/linux/thread_info.h:27,
                    from include/asm-generic/current.h:6,
                    from ./arch/um/include/generated/asm/current.h:1,
                    from include/linux/sched.h:12,
                    from include/linux/ratelimit.h:6,
                    from include/linux/dev_printk.h:16,
                    from include/linux/device.h:15,
                    from include/linux/node.h:18,
                    from include/linux/cpu.h:17,
                    from arch/um/kernel/um_arch.c:6:
   arch/x86/include/asm/alternative.h:106:13: note: previous declaration of 'apply_seal_endbr' with type 'void(s32 *, s32 *, struct module *)' {aka 'void(int *, int *, struct module *)'}
     106 | extern void apply_seal_endbr(s32 *start, s32 *end, struct module *mod);
         |             ^~~~~~~~~~~~~~~~
>> arch/um/kernel/um_arch.c:444:6: error: conflicting types for 'apply_retpolines'; have 'void(s32 *, s32 *)' {aka 'void(int *, int *)'}
     444 | void apply_retpolines(s32 *start, s32 *end)
         |      ^~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:104:13: note: previous declaration of 'apply_retpolines' with type 'void(s32 *, s32 *, struct module *)' {aka 'void(int *, int *, struct module *)'}
     104 | extern void apply_retpolines(s32 *start, s32 *end, struct module *mod);
         |             ^~~~~~~~~~~~~~~~
>> arch/um/kernel/um_arch.c:448:6: error: conflicting types for 'apply_returns'; have 'void(s32 *, s32 *)' {aka 'void(int *, int *)'}
     448 | void apply_returns(s32 *start, s32 *end)
         |      ^~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:105:13: note: previous declaration of 'apply_returns' with type 'void(s32 *, s32 *, struct module *)' {aka 'void(int *, int *, struct module *)'}
     105 | extern void apply_returns(s32 *start, s32 *end, struct module *mod);
         |             ^~~~~~~~~~~~~
>> arch/um/kernel/um_arch.c:452:6: error: conflicting types for 'apply_fineibt'; have 'void(s32 *, s32 *, s32 *, s32 *)' {aka 'void(int *, int *, int *, int *)'}
     452 | void apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
         |      ^~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:107:13: note: previous declaration of 'apply_fineibt' with type 'void(s32 *, s32 *, s32 *, s32 *, struct module *)' {aka 'void(int *, int *, int *, int *, struct module *)'}
     107 | extern void apply_fineibt(s32 *start_retpoline, s32 *end_retpoine,
         |             ^~~~~~~~~~~~~
>> arch/um/kernel/um_arch.c:457:6: error: conflicting types for 'apply_alternatives'; have 'void(struct alt_instr *, struct alt_instr *)'
     457 | void apply_alternatives(struct alt_instr *start, struct alt_instr *end)
         |      ^~~~~~~~~~~~~~~~~~
   arch/x86/include/asm/alternative.h:102:13: note: previous declaration of 'apply_alternatives' with type 'void(struct alt_instr *, struct alt_instr *, struct module *)'
     102 | extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end,
         |             ^~~~~~~~~~~~~~~~~~
   arch/um/kernel/um_arch.c:461:7: warning: no previous prototype for 'text_poke' [-Wmissing-prototypes]
     461 | void *text_poke(void *addr, const void *opcode, size_t len)
         |       ^~~~~~~~~
   arch/um/kernel/um_arch.c:473:6: warning: no previous prototype for 'text_poke_sync' [-Wmissing-prototypes]
     473 | void text_poke_sync(void)
         |      ^~~~~~~~~~~~~~


vim +440 arch/um/kernel/um_arch.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  439  
be0fffa5ca894a Peter Zijlstra 2023-06-22 @440  void apply_seal_endbr(s32 *start, s32 *end)
ed53a0d971926e Peter Zijlstra 2022-03-08  441  {
ed53a0d971926e Peter Zijlstra 2022-03-08  442  }
ed53a0d971926e Peter Zijlstra 2022-03-08  443  
7508500900814d Peter Zijlstra 2021-10-26 @444  void apply_retpolines(s32 *start, s32 *end)
7508500900814d Peter Zijlstra 2021-10-26  445  {
7508500900814d Peter Zijlstra 2021-10-26  446  }
7508500900814d Peter Zijlstra 2021-10-26  447  
564d9981063973 Peter Zijlstra 2022-07-14 @448  void apply_returns(s32 *start, s32 *end)
564d9981063973 Peter Zijlstra 2022-07-14  449  {
564d9981063973 Peter Zijlstra 2022-07-14  450  }
564d9981063973 Peter Zijlstra 2022-07-14  451  
931ab63664f02b Peter Zijlstra 2022-10-27 @452  void apply_fineibt(s32 *start_retpoline, s32 *end_retpoline,
931ab63664f02b Peter Zijlstra 2022-10-27  453  		   s32 *start_cfi, s32 *end_cfi)
931ab63664f02b Peter Zijlstra 2022-10-27  454  {
931ab63664f02b Peter Zijlstra 2022-10-27  455  }
931ab63664f02b Peter Zijlstra 2022-10-27  456  
9a0b5817ad97bb Gerd Hoffmann  2006-03-23 @457  void apply_alternatives(struct alt_instr *start, struct alt_instr *end)
9a0b5817ad97bb Gerd Hoffmann  2006-03-23  458  {
9a0b5817ad97bb Gerd Hoffmann  2006-03-23  459  }
88fc078a7a8f67 Peter Zijlstra 2020-04-29  460  

:::::: The code at line 440 was first introduced by commit
:::::: be0fffa5ca894a971a31c5e28aa77b633a97d1dc x86/alternative: Rename apply_ibt_endbr()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
