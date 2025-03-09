Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E504188CCA
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Mar 2025 11:05:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741518340; cv=none; b=VInU8OxSVppSUn6yy7xyQkM1Yf3Q6ex6WOH0T429yU9SmzEe4talKVOdVG97Ak18Jho+zCX/8hOVYiK2B7ufMUVfbBjOHndE2FTnG3Rs0+58PY1I9kdb2gk/3f9CRS6u/H/Za6CimbPrd6T6569Mse2qaX0ktl9utTIdADB5/RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741518340; c=relaxed/simple;
	bh=BBwBNjtPpwYanJb00ICfB1+E/NGwG8jeBj9FyJAvDeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZTBm7i5UpPp87WI9VGs3yk3mnGg2CT7ogHWkV+AI6wrnWFScoVHkeZGJXMr/5DZZQWyv2Qq5gnx9OmNSKYYVvDZERVXjgJ0lzaSLLGBObnrvc8q3w9FJqhXbklPao8SIiMTzcOAjH/FUZKGv+tHVztV++7PIrXSdNRrXwgMR2iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G591+A2S; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G591+A2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741518339; x=1773054339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BBwBNjtPpwYanJb00ICfB1+E/NGwG8jeBj9FyJAvDeQ=;
  b=G591+A2S3kZAGKcQUFQB02R2qcq/DsZtAqyVhwMQHAE33u0as8XfG3Hd
   gRnVYIfgzYN+igxbqxExnHZHAhxkUF8LlwZ/ng8+UzH8nXLz1+6dzGeaO
   5DG1SmiVJza29pNp0bVDr36LAcmRoXkZces/5dfXW9AlPSFAFEdIvuKeN
   Ta4YhQp0OCjU4zFuUSIv9wBOhkseMAvZeZZdeiggcZKSMDR+uS0NcLQ6H
   cQj/NcNPI51t9UuH18xDDSUyF7AM6SZ+tYJ8bbTAHXfdlHV/0JKDu/dns
   PlZNVCTol3CvSF/TjDtzK+I669vQSlzmFESogp2KbeRnIzmA0T+UfiGF/
   w==;
X-CSE-ConnectionGUID: x7sq9ey+QjacbExze55IyQ==
X-CSE-MsgGUID: uFZirjKdSs+g9zG4ijxEoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11367"; a="52729699"
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="52729699"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2025 04:05:38 -0700
X-CSE-ConnectionGUID: Zkb1QyrTQ3WnGZ6ffXq3IA==
X-CSE-MsgGUID: f2zNQzeET42qdNhk86V0Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,234,1736841600"; 
   d="scan'208";a="120224063"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 09 Mar 2025 04:05:37 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1trETO-00031Q-2e;
	Sun, 09 Mar 2025 11:05:34 +0000
Date: Sun, 9 Mar 2025 19:05:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2007/2007] kernel/kexec_core.c:1066: undefined
 reference to `machine_crash_shutdown'
Message-ID: <202503091909.W4esTcVo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   944ce05f6b83ba40c4382c6b90b7b94f529118d3
commit: 47ff774cbb440dfc3cf5d5bc7cf82b41d4d99966 [2007/2007] x86, crash: wrap crash dumping code into crash related ifdefs
config: x86_64-randconfig-r121-20250309 (https://download.01.org/0day-ci/archive/20250309/202503091909.W4esTcVo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250309/202503091909.W4esTcVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503091909.W4esTcVo-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/kexec_core.o: in function `__crash_kexec':
>> kernel/kexec_core.c:1066: undefined reference to `machine_crash_shutdown'
   ld: kernel/kexec.o: in function `do_kexec_load':
>> kernel/kexec.c:105: undefined reference to `arch_kexec_unprotect_crashkres'
>> ld: kernel/kexec.c:166: undefined reference to `arch_kexec_protect_crashkres'
   ld: kernel/kexec_file.o: in function `__do_sys_kexec_file_load':
>> kernel/kexec_file.c:350: undefined reference to `arch_kexec_unprotect_crashkres'
>> ld: kernel/kexec_file.c:415: undefined reference to `arch_kexec_protect_crashkres'


vim +1066 kernel/kexec_core.c

7e99f8b69c11c1 Ricardo Ribalda    2023-01-04  1044  
7bbee5ca3896f6 Hidehiro Kawai     2015-12-14  1045  /*
7bbee5ca3896f6 Hidehiro Kawai     2015-12-14  1046   * No panic_cpu check version of crash_kexec().  This function is called
7bbee5ca3896f6 Hidehiro Kawai     2015-12-14  1047   * only when panic_cpu holds the current CPU number; this is the only CPU
7bbee5ca3896f6 Hidehiro Kawai     2015-12-14  1048   * which processes crash_kexec routines.
7bbee5ca3896f6 Hidehiro Kawai     2015-12-14  1049   */
c207aee48037ab Josh Poimboeuf     2017-06-28  1050  void __noclone __crash_kexec(struct pt_regs *regs)
2965faa5e03d1e Dave Young         2015-09-09  1051  {
05c6257433b721 Valentin Schneider 2022-06-30  1052  	/* Take the kexec_lock here to prevent sys_kexec_load
2965faa5e03d1e Dave Young         2015-09-09  1053  	 * running on one cpu from replacing the crash kernel
2965faa5e03d1e Dave Young         2015-09-09  1054  	 * we are using after a panic on a different cpu.
2965faa5e03d1e Dave Young         2015-09-09  1055  	 *
2965faa5e03d1e Dave Young         2015-09-09  1056  	 * If the crash kernel was not located in a fixed area
2965faa5e03d1e Dave Young         2015-09-09  1057  	 * of memory the xchg(&kexec_crash_image) would be
2965faa5e03d1e Dave Young         2015-09-09  1058  	 * sufficient.  But since I reuse the memory...
2965faa5e03d1e Dave Young         2015-09-09  1059  	 */
05c6257433b721 Valentin Schneider 2022-06-30  1060  	if (kexec_trylock()) {
2965faa5e03d1e Dave Young         2015-09-09  1061  		if (kexec_crash_image) {
2965faa5e03d1e Dave Young         2015-09-09  1062  			struct pt_regs fixed_regs;
2965faa5e03d1e Dave Young         2015-09-09  1063  
2965faa5e03d1e Dave Young         2015-09-09  1064  			crash_setup_regs(&fixed_regs, regs);
2965faa5e03d1e Dave Young         2015-09-09  1065  			crash_save_vmcoreinfo();
2965faa5e03d1e Dave Young         2015-09-09 @1066  			machine_crash_shutdown(&fixed_regs);
2965faa5e03d1e Dave Young         2015-09-09  1067  			machine_kexec(kexec_crash_image);
2965faa5e03d1e Dave Young         2015-09-09  1068  		}
05c6257433b721 Valentin Schneider 2022-06-30  1069  		kexec_unlock();
2965faa5e03d1e Dave Young         2015-09-09  1070  	}
2965faa5e03d1e Dave Young         2015-09-09  1071  }
c207aee48037ab Josh Poimboeuf     2017-06-28  1072  STACK_FRAME_NON_STANDARD(__crash_kexec);
2965faa5e03d1e Dave Young         2015-09-09  1073  

:::::: The code at line 1066 was first introduced by commit
:::::: 2965faa5e03d1e71e9ff9aa143fff39e0a77543a kexec: split kexec_load syscall from kexec core code

:::::: TO: Dave Young <dyoung@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
