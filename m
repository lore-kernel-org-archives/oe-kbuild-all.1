Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BA935AC07
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Jul 2026 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783705653; cv=none; b=bFG0n3QUPPBfxd1bqeYgnOUpkvynlOG7bnLkJfpDhEvH4cBqPjnPxCj4z/hdyDlGKGcAoKLeWGmMWXqXDzRcnIXK4Y+ZSh+95x5oI5EzaMt5xymAuKyX1mQGrjvwT/knPA9XLF9klwS0/uKEC7RUHRkvpk2UJK8J/1bgHpmfwGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783705653; c=relaxed/simple;
	bh=AOGO+lL5I6IhIskXeEb34ah22LlgCjBp8tsSQwwqGlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=iH+sHY8abZzoWjKisdSgrRXNlviMhBaDV3YOu5UCZcvahUI6TTSr3f2EZfJdfdus+FI51ORNE4ml+VGLXHdUa2Dq7jyLOBvOSrhtfQ+CHpw0/B+gjkjKFTv33jBCuIx93Zsg0wcCT3skaVPmwS96g7k9sl/efEvX/Hhs9T9K+T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQR5Alu4; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQR5Alu4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783705652; x=1815241652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AOGO+lL5I6IhIskXeEb34ah22LlgCjBp8tsSQwwqGlI=;
  b=nQR5Alu4MpFDKXquCERArKwJ1lTnjQORBioSWqMiEAig6D+0YEFqs81A
   ty2FsFiRkcOyzeK2b0ZgTVFR29LjlQTgGozK2Mn6olObvyHzLNXAdCwIz
   2Mas/OebLRNlwmzi/JyyX7N5SSkfMBN+y6cQptCpUkuBKi8BxhzZaTJss
   QyHFbFgJU8itHenPDY9HY93RAikhmG2A0vvytPvENpDc2AkvdvjKY0htV
   DtCYm+zOIRBV79ajJOY089cqDT/gH55m+jfh/rMKVsuAtuYLMHCvMMySE
   M/wLrNt+mcgqb7ta1Kv+ZwGngnwqLw17EX/TQByqts/8HiSV7IcFw9/xd
   Q==;
X-CSE-ConnectionGUID: uq6KWyrkQU+pDO1HQAabPQ==
X-CSE-MsgGUID: x0yUuApVQ/mG4WSJ+5Pnhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95011756"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95011756"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 10:47:31 -0700
X-CSE-ConnectionGUID: 2HRRpqBxTiuebTeRusk5og==
X-CSE-MsgGUID: Nx+nLDi1SIyl27LmJ6IRMg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 10 Jul 2026 10:47:29 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiFJu-00000000JC9-30Fb;
	Fri, 10 Jul 2026 17:47:26 +0000
Date: Sat, 11 Jul 2026 01:46:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 "Michal =?utf-8?Q?Such=C3=A1nek"?= <msuchanek@suse.de>
Subject: [powerpc:fixes-test 12/12]
 arch/powerpc/include/asm/ptrace.h:241:33: error: implicit declaration of
 function 'BIT'
Message-ID: <202607110141.nUx3NKwu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes-test
head:   afc2830892a128a13a65f677271a0a48aeb61b5e
commit: afc2830892a128a13a65f677271a0a48aeb61b5e [12/12] powerpc/syscall: Fix syscall skip handling for seccomp and ptrace
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20260711/202607110141.nUx3NKwu-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260711/202607110141.nUx3NKwu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607110141.nUx3NKwu-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/user.h:5,
                    from include/linux/user.h:1,
                    from include/linux/elfcore.h:5,
                    from include/linux/vmcore_info.h:6,
                    from include/linux/kexec.h:18,
                    from include/linux/crash_dump.h:5,
                    from drivers/of/fdt.c:11:
   arch/powerpc/include/asm/ptrace.h: In function 'set_syscall_entry_ret':
>> arch/powerpc/include/asm/ptrace.h:241:33: error: implicit declaration of function 'BIT' [-Wimplicit-function-declaration]
     241 | #define SYSCALL_ENTRY_RET_SET   BIT(0)
         |                                 ^~~
   arch/powerpc/include/asm/ptrace.h:245:30: note: in expansion of macro 'SYSCALL_ENTRY_RET_SET'
     245 |         regs->entry_flags |= SYSCALL_ENTRY_RET_SET;
         |                              ^~~~~~~~~~~~~~~~~~~~~


vim +/BIT +241 arch/powerpc/include/asm/ptrace.h

   228	
   229	#define force_successful_syscall_return()   \
   230		do { \
   231			set_thread_flag(TIF_NOERROR); \
   232		} while(0)
   233	
   234	#define current_pt_regs() \
   235		((struct pt_regs *)((unsigned long)task_stack_page(current) + THREAD_SIZE) - 1)
   236	
   237	/*
   238	 * SYSCALL_ENTRY_RET_SET: seccomp or ptrace called syscall_set_return_value()
   239	 * and wants the syscall skipped; regs->gpr[3] already holds the return value.
   240	 */
 > 241	#define SYSCALL_ENTRY_RET_SET	BIT(0)
   242	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
