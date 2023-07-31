Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58224429
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Jul 2023 12:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690806899; x=1722342899;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=NpObjC+28zrrEprXQSYG2Zf6s2T3r5MG1uO3sJDFU98=;
  b=ZoIJbZEOode3Un5Shs0nQLRrIgGTFBVBPMAsbV8peFr7dDXynmHdzIo0
   cLOnGTFaxw+VEhLDkbgNWv41OC2Gp2WH31cXCmYPz6RxBu0a+nsfxVfG2
   AA8TvFsHfH6AoEXNRekIcVjwjH9fKEkltAJB3pWT2WMXjnOYxula/sZ2H
   QD9Bz922Im+HuATF7TWWiPyh5t9jg2Ij4G5HXw9xgn1hz4cJ/L8b5cdFA
   TI+4ewDQ+Ha0LB+fHH/YADAp7KgNdX3qLThrPcY2xfYU/dFljY30S00Y2
   6FLxUd1r0KaRLbvmTIcs54/4dtftA5z+Z3X0Bj9Pa33nieBeMyGmF7Hoa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="367898720"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="367898720"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 05:34:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="705391383"
X-IronPort-AV: E=Sophos;i="6.01,244,1684825200"; 
   d="scan'208";a="705391383"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 31 Jul 2023 05:34:57 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQS6y-00057X-2M;
	Mon, 31 Jul 2023 12:34:56 +0000
Date: Mon, 31 Jul 2023 20:34:50 +0800
From: kernel test robot <lkp@intel.com>
To: Masami Hiramatsu <mhiramat@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:x86/core 2/4] arch/x86/kernel/kprobes/core.c:326:21:
 error: implicit declaration of function 'is_cfi_trap'
Message-ID: <202307312059.zdC8pgwT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   127d6583afa6d101e5ab66fc95903ea09f2b6054
commit: 4ac2082c5d1ddfbbfe701e8038fd6778cfa50f41 [2/4] x86/kprobes: Prohibit probing on compiler generated CFI checking code
config: i386-randconfig-r034-20230731 (https://download.01.org/0day-ci/archive/20230731/202307312059.zdC8pgwT-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230731/202307312059.zdC8pgwT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307312059.zdC8pgwT-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/kprobes/core.c: In function 'can_probe':
>> arch/x86/kernel/kprobes/core.c:326:21: error: implicit declaration of function 'is_cfi_trap' [-Werror=implicit-function-declaration]
     326 |                 if (is_cfi_trap(addr + offset))
         |                     ^~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/is_cfi_trap +326 arch/x86/kernel/kprobes/core.c

   254	
   255	/* Check if paddr is at an instruction boundary */
   256	static int can_probe(unsigned long paddr)
   257	{
   258		unsigned long addr, __addr, offset = 0;
   259		struct insn insn;
   260		kprobe_opcode_t buf[MAX_INSN_SIZE];
   261	
   262		if (!kallsyms_lookup_size_offset(paddr, NULL, &offset))
   263			return 0;
   264	
   265		/* Decode instructions */
   266		addr = paddr - offset;
   267		while (addr < paddr) {
   268			int ret;
   269	
   270			/*
   271			 * Check if the instruction has been modified by another
   272			 * kprobe, in which case we replace the breakpoint by the
   273			 * original instruction in our buffer.
   274			 * Also, jump optimization will change the breakpoint to
   275			 * relative-jump. Since the relative-jump itself is
   276			 * normally used, we just go through if there is no kprobe.
   277			 */
   278			__addr = recover_probed_instruction(buf, addr);
   279			if (!__addr)
   280				return 0;
   281	
   282			ret = insn_decode_kernel(&insn, (void *)__addr);
   283			if (ret < 0)
   284				return 0;
   285	
   286	#ifdef CONFIG_KGDB
   287			/*
   288			 * If there is a dynamically installed kgdb sw breakpoint,
   289			 * this function should not be probed.
   290			 */
   291			if (insn.opcode.bytes[0] == INT3_INSN_OPCODE &&
   292			    kgdb_has_hit_break(addr))
   293				return 0;
   294	#endif
   295			addr += insn.length;
   296		}
   297		if (IS_ENABLED(CONFIG_CFI_CLANG)) {
   298			/*
   299			 * The compiler generates the following instruction sequence
   300			 * for indirect call checks and cfi.c decodes this;
   301			 *
   302			 *   movl    -<id>, %r10d       ; 6 bytes
   303			 *   addl    -4(%reg), %r10d    ; 4 bytes
   304			 *   je      .Ltmp1             ; 2 bytes
   305			 *   ud2                        ; <- regs->ip
   306			 *   .Ltmp1:
   307			 *
   308			 * Also, these movl and addl are used for showing expected
   309			 * type. So those must not be touched.
   310			 */
   311			__addr = recover_probed_instruction(buf, addr);
   312			if (!__addr)
   313				return 0;
   314	
   315			if (insn_decode_kernel(&insn, (void *)__addr) < 0)
   316				return 0;
   317	
   318			if (insn.opcode.value == 0xBA)
   319				offset = 12;
   320			else if (insn.opcode.value == 0x3)
   321				offset = 6;
   322			else
   323				goto out;
   324	
   325			/* This movl/addl is used for decoding CFI. */
 > 326			if (is_cfi_trap(addr + offset))
   327				return 0;
   328		}
   329	
   330	out:
   331		return (addr == paddr);
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
