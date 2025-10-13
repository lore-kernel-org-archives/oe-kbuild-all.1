Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD10F2701CF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358502; cv=none; b=P/uG+p09Q4vDq/xUTf/6DfL2RaLOXW2QrsTzkf0xGyFf2yCrC0RBfh+IZFMhMi3fasLUhcTvmwd1s7Ko2/CCmYTydw3PZr3l2dAkqiAntst5xh3Ig+35bt7WBGgc4io33g70XO180S2hQu+q++p2VTQKNEm3V/FGbDqsP3f8FuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358502; c=relaxed/simple;
	bh=cS7MdszhtErM4i497abtI50s9NWG8LyYnefbOWck7HY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LOHYwubvVKnyx3ul1V9f+qsEuilRo6fucTBe4dVD/TFc5wwgRraLowXaJfvKP5QNHCqicsapYF/wriCC0Zu47+C6nOTLCU7eHi/ZQlOcll5Au47ezhRDsiaRORmAxQuqJghNKN15vQAgKzU55Lr8fdrkiAn/UlYrQlIaCzPzA2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ABVeYemM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ABVeYemM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760358500; x=1791894500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cS7MdszhtErM4i497abtI50s9NWG8LyYnefbOWck7HY=;
  b=ABVeYemMO6/AN1N9Je6VrZxCWZwjln2WFXJPoFqWBfu8fWj7GG3dopgL
   tj3XuE9+V7D9AJTVNeiFo3ok7BQhfPKIReScrPmiwlfmJIEuVg/RttWrx
   Zt3VwHUEDm/bRtyh5Nc5RlsKfFqy/y1UMG+G1K+Nn7HgY4d+cu0Q6LRTD
   ErDpyB/1iw9Y8L5WZrDH2RCd6i07PMH04BaliXYtAzhm0NuwdNoTK/D0Z
   vsH5QSrKYnJiLFIq8/x118wfbwijc2wOHxlUbSvcG+4eUbSL4meA6o/QQ
   bQLHlyXlNeUiUEJrhgWHEai7eWLIeu5zK/2/E/2N19KS7y6dxU3JKj68G
   w==;
X-CSE-ConnectionGUID: D9jOBek0T2uClZp5DZUnyQ==
X-CSE-MsgGUID: Kscm3Ni+T66YIul3DEM9+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="73840272"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="73840272"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 05:28:20 -0700
X-CSE-ConnectionGUID: yEfiTY7sQJeyvAvi3p9yPw==
X-CSE-MsgGUID: TY9WXIB9SPW0BT1BUupqLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="212209653"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 13 Oct 2025 05:28:19 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v8Hey-000000008sd-2YpF;
	Mon, 13 Oct 2025 12:28:16 +0000
Date: Mon, 13 Oct 2025 14:27:17 +0200
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:tmp 70/70] arch/x86/kernel/machine_kexec_64.c:485:33:
 error: macro "__ASM_ANNOTATE" requires 3 arguments, but only 2 given
Message-ID: <202510111754.ypK7wgBc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git tmp
head:   49a325e76670a179209c1e93e63e70e74b73c230
commit: 49a325e76670a179209c1e93e63e70e74b73c230 [70/70] Merge branch 'objtool/core' into x86/core
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251011/202510111754.ypK7wgBc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510111754.ypK7wgBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510111754.ypK7wgBc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/kernel/machine_kexec_64.c:485:33: error: macro "__ASM_ANNOTATE" requires 3 arguments, but only 2 given
     485 | ANNOTATE_NOCFI_SYM(machine_kexec);
         |                                 ^
   In file included from include/linux/objtool.h:6,
                    from arch/x86/include/asm/bug.h:7,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/mm.h:6,
                    from arch/x86/kernel/machine_kexec_64.c:9:
   include/linux/annotate.h:11:9: note: macro "__ASM_ANNOTATE" defined here
      11 | #define __ASM_ANNOTATE(section, label, type)                            \
         |         ^~~~~~~~~~~~~~
>> include/linux/annotate.h:113:45: error: expected string literal before '__ASM_ANNOTATE'
     113 | #define ANNOTATE_NOCFI_SYM(sym)         asm(__ASM_ANNOTATE(sym, ANNOTYPE_NOCFI))
         |                                             ^~~~~~~~~~~~~~
   arch/x86/kernel/machine_kexec_64.c:485:1: note: in expansion of macro 'ANNOTATE_NOCFI_SYM'
     485 | ANNOTATE_NOCFI_SYM(machine_kexec);
         | ^~~~~~~~~~~~~~~~~~


vim +/__ASM_ANNOTATE +485 arch/x86/kernel/machine_kexec_64.c

fee7b0d84cc8c7 arch/x86/kernel/machine_kexec_64.c Ying Huang        2009-03-10  479  
fee7b0d84cc8c7 arch/x86/kernel/machine_kexec_64.c Ying Huang        2009-03-10  480  	__ftrace_enabled_restore(save_ftrace_enabled);
5234f5eb04abbb arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  481  }
894af4a1cde61c arch/x86/kernel/machine_kexec_64.c Peter Zijlstra    2025-04-12  482  /*
894af4a1cde61c arch/x86/kernel/machine_kexec_64.c Peter Zijlstra    2025-04-12  483   * Handover to the next kernel, no CFI concern.
894af4a1cde61c arch/x86/kernel/machine_kexec_64.c Peter Zijlstra    2025-04-12  484   */
894af4a1cde61c arch/x86/kernel/machine_kexec_64.c Peter Zijlstra    2025-04-12 @485  ANNOTATE_NOCFI_SYM(machine_kexec);
2c8c0e6b8d7700 arch/x86_64/kernel/machine_kexec.c Andi Kleen        2006-09-26  486  

:::::: The code at line 485 was first introduced by commit
:::::: 894af4a1cde61c3401f237184fb770f72ff12df8 objtool: Validate kCFI calls

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
