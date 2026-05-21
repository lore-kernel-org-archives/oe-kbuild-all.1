Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213CB3D6CA3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 13:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779368786; cv=none; b=tgFovhU+nVTUrfh4QWUzY7zuqmVWPyfD8hQXW5i7CB7rQcnm9tsjDz1VLrY6eGYBtFM02EMgfCXSdwQASMzS86Zwm8ldImeEhyiyzqqGOm+nWPn5gTxJlOkZVoE+uq7TtAgZ8DD++7XqijaHSiJOxAb/S16zyNpH+FcoflyTX/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779368786; c=relaxed/simple;
	bh=0DP3SRXPuucRifDX5A9jx/klOpk98eZ8ZcnNGb0xMDo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Xb2ctuGC5lGZAtEfVpLYtzF/oKK7cVdebVgrYkZjhY/fRpfHgpV8OLnyunNej4G7M64pdJANG8kz7wAxtCdj0C0LNNTbERJ3qvl+B27Y0fTYFQt8/8HwyvByDg3JZWPY0cFnyL9iqHxflxfqnt4G00HhxIfxb1D+O64ZlnSY1Wc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K1kINAbV; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K1kINAbV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779368786; x=1810904786;
  h=date:from:to:cc:subject:message-id;
  bh=0DP3SRXPuucRifDX5A9jx/klOpk98eZ8ZcnNGb0xMDo=;
  b=K1kINAbVE/ecdJpX8gXxYxC3mIx4VXoa7yX6wq4859Sz9gYSgwETHknG
   8PXMvPp5jq71wxw4sVNIzIb1G6+qgkfVAYk+2Q6RCzAgnAO9YWHyUbtp5
   f1Xej8T7IaE8dQ3VuZyko8IThkTxLxzUMa05V8HU90aqsKplS7YL8vgFg
   lVg8g+K9qFPOCtKjaIAf0m4moAhxli8ubG1oITZz2ybePho++qJTi4qdO
   qz8vMnsimO4IwrL0rjWWs+Sfc7H2QpV8vyUI59DwCCjBkSqoCrbBgqRAr
   OfAHHxBtZEQzc3TW2/DSDaS2DAZSn5pt8bZ3RobCnWl40nnUOseae41/i
   A==;
X-CSE-ConnectionGUID: evT+n7JETYOSogLOKOqE9g==
X-CSE-MsgGUID: cwzM+ZM6RH2nsVMV+lZzdA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="83905253"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="83905253"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 06:06:25 -0700
X-CSE-ConnectionGUID: 9GXMral/ToW8+rRNMFtD2A==
X-CSE-MsgGUID: PUURhlzCRHKK6buj7TFk/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="245555193"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 May 2026 06:06:23 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQ36S-000000000K9-3mJE;
	Thu, 21 May 2026 13:06:20 +0000
Date: Thu, 21 May 2026 21:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: Martin Kaiser <martin.kaiser@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev,
 "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Subject: [scosu-sched:topic/mmap-cap-prot-wip/v6.18 882/1130]
 arch/x86/include/asm/ftrace.h:72:47: error: assignment to 'long unsigned int'
 from 'void *' makes integer from pointer without a cast
Message-ID: <202605212113.cCQAaIZR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot-wip/v6.18
head:   f69a5a9d9fee15edde28429e23a4c749a59937bd
commit: 617b8799a3317f128df02703ebbc847a5b913978 [882/1130] ftrace: save capability-sized registers
config: x86_64-randconfig-074-20260521 (https://download.01.org/0day-ci/archive/20260521/202605212113.cCQAaIZR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605212113.cCQAaIZR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605212113.cCQAaIZR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/ftrace.h:23,
                    from include/linux/livepatch.h:13,
                    from kernel/livepatch/patch.c:12:
   kernel/livepatch/patch.c: In function 'klp_ftrace_handler':
>> arch/x86/include/asm/ftrace.h:72:47: error: assignment to 'long unsigned int' from 'void *' makes integer from pointer without a cast [-Wint-conversion]
      72 |         do { arch_ftrace_regs(fregs)->regs.ip = (_ip); } while (0)
         |                                               ^
   kernel/livepatch/patch.c:121:9: note: in expansion of macro 'ftrace_regs_set_instruction_pointer'
     121 |         ftrace_regs_set_instruction_pointer(fregs, func->new_func);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +72 arch/x86/include/asm/ftrace.h

20a0bc10272fa1 Jiri Olsa                 2025-11-04  63  
d5d01b71996ec0 Masami Hiramatsu (Google  2024-12-26  64) #define arch_ftrace_fill_perf_regs(fregs, _regs) do {	\
d5d01b71996ec0 Masami Hiramatsu (Google  2024-12-26  65) 		(_regs)->ip = arch_ftrace_regs(fregs)->regs.ip;		\
d5d01b71996ec0 Masami Hiramatsu (Google  2024-12-26  66) 		(_regs)->sp = arch_ftrace_regs(fregs)->regs.sp;		\
d5d01b71996ec0 Masami Hiramatsu (Google  2024-12-26  67) 		(_regs)->cs = __KERNEL_CS;		\
d5d01b71996ec0 Masami Hiramatsu (Google  2024-12-26  68) 		(_regs)->flags = 0;			\
d5d01b71996ec0 Masami Hiramatsu (Google  2024-12-26  69) 	} while (0)
d5d01b71996ec0 Masami Hiramatsu (Google  2024-12-26  70) 
0ef86097f127d0 Mark Rutland              2022-11-03  71  #define ftrace_regs_set_instruction_pointer(fregs, _ip)	\
7888af4166d4ab Steven Rostedt            2024-10-08 @72  	do { arch_ftrace_regs(fregs)->regs.ip = (_ip); } while (0)
94d095ffa0e16b Mark Rutland              2022-11-03  73  
94d095ffa0e16b Mark Rutland              2022-11-03  74  

:::::: The code at line 72 was first introduced by commit
:::::: 7888af4166d4ab07ba51234be6ba332b7807e901 ftrace: Make ftrace_regs abstract from direct use

:::::: TO: Steven Rostedt <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (Google) <rostedt@goodmis.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
