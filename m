Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04C4ED507
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Jun 2023 16:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687536198; x=1719072198;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uoLjwXgr3lT+y8R6mSEpipFb1ghHE9CXgpz9bYTLX5I=;
  b=LkFeOH8e9xT9A5DUCG5L3VPgnhojCO38pvXvkInKZ0lSjaEmJD0bEKtd
   zaeLJrzxhpcbDMAHicqhvPe+Ml2kr4aiI9PmxiZBrtPxHEnkEpZ5Sz1yO
   2KX+PcDso1wGqWvwS+4lj/NN0wWX8p9oJ3ublJEiwDACqFLn1wZ//OT3P
   auFdVuzA9XW/pLKWYwM65qmeojAShLMxqplaV0JYn3sNMCJwXsgpths4O
   W0bMiVMYY4oS/vPTuyR0ZLXNzxo4xcq+S0fodUvXTiil/IPtNlBRebRq2
   K+9rOVosyvS0X0KpRX/2QJ2vogH9Z8huf28oCV3p1RpbBkMfFoK+MqKA6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="447175471"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="447175471"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2023 09:03:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10750"; a="665526387"
X-IronPort-AV: E=Sophos;i="6.01,152,1684825200"; 
   d="scan'208";a="665526387"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 23 Jun 2023 09:03:14 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qCjFi-0008Q6-0B;
	Fri, 23 Jun 2023 16:03:14 +0000
Date: Sat, 24 Jun 2023 00:02:58 +0800
From: kernel test robot <lkp@intel.com>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [linux-next:master 11225/12162] arch/arm64/kernel/entry-ftrace.S:59:
 Error: undefined symbol FTRACE_OPS_DIRECT_CALL used as an immediate value
Message-ID: <202306240021.qNRc4iHW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Donglin,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d2be868b42c08290509c60515865f4de24ea704
commit: 3646970322464c21e69dcb9a2e37d461c5834bf5 [11225/12162] arm64: ftrace: Enable HAVE_FUNCTION_GRAPH_RETVAL
config: arm64-randconfig-r015-20230622 (https://download.01.org/0day-ci/archive/20230624/202306240021.qNRc4iHW-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230624/202306240021.qNRc4iHW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306240021.qNRc4iHW-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/entry-ftrace.S: Assembler messages:
>> arch/arm64/kernel/entry-ftrace.S:59: Error: undefined symbol FTRACE_OPS_DIRECT_CALL used as an immediate value


vim +59 arch/arm64/kernel/entry-ftrace.S

819e50e25d0ce8 AKASHI Takahiro 2014-04-30  15  
26299b3f6ba26b Mark Rutland    2022-11-03  16  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
3b23e4991fb66f Torsten Duwe    2019-02-08  17  /*
3b23e4991fb66f Torsten Duwe    2019-02-08  18   * Due to -fpatchable-function-entry=2, the compiler has placed two NOPs before
3b23e4991fb66f Torsten Duwe    2019-02-08  19   * the regular function prologue. For an enabled callsite, ftrace_init_nop() and
3b23e4991fb66f Torsten Duwe    2019-02-08  20   * ftrace_make_call() have patched those NOPs to:
3b23e4991fb66f Torsten Duwe    2019-02-08  21   *
3b23e4991fb66f Torsten Duwe    2019-02-08  22   * 	MOV	X9, LR
26299b3f6ba26b Mark Rutland    2022-11-03  23   * 	BL	ftrace_caller
3b23e4991fb66f Torsten Duwe    2019-02-08  24   *
258c3d628fe9e7 Will Deacon     2020-05-18  25   * Each instrumented function follows the AAPCS, so here x0-x8 and x18-x30 are
258c3d628fe9e7 Will Deacon     2020-05-18  26   * live (x18 holds the Shadow Call Stack pointer), and x9-x17 are safe to
258c3d628fe9e7 Will Deacon     2020-05-18  27   * clobber.
3b23e4991fb66f Torsten Duwe    2019-02-08  28   *
26299b3f6ba26b Mark Rutland    2022-11-03  29   * We save the callsite's context into a struct ftrace_regs before invoking any
26299b3f6ba26b Mark Rutland    2022-11-03  30   * ftrace callbacks. So that we can get a sensible backtrace, we create frame
26299b3f6ba26b Mark Rutland    2022-11-03  31   * records for the callsite and the ftrace entry assembly. This is not
26299b3f6ba26b Mark Rutland    2022-11-03  32   * sufficient for reliable stacktrace: until we create the callsite stack
26299b3f6ba26b Mark Rutland    2022-11-03  33   * record, its caller is missing from the LR and existing chain of frame
26299b3f6ba26b Mark Rutland    2022-11-03  34   * records.
3b23e4991fb66f Torsten Duwe    2019-02-08  35   */
26299b3f6ba26b Mark Rutland    2022-11-03  36  SYM_CODE_START(ftrace_caller)
26299b3f6ba26b Mark Rutland    2022-11-03  37  	bti	c
3b23e4991fb66f Torsten Duwe    2019-02-08  38  
2aa6ac03516d07 Florent Revest  2023-04-05  39  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_CALL_OPS
2aa6ac03516d07 Florent Revest  2023-04-05  40  	/*
2aa6ac03516d07 Florent Revest  2023-04-05  41  	 * The literal pointer to the ops is at an 8-byte aligned boundary
2aa6ac03516d07 Florent Revest  2023-04-05  42  	 * which is either 12 or 16 bytes before the BL instruction in the call
2aa6ac03516d07 Florent Revest  2023-04-05  43  	 * site. See ftrace_call_adjust() for details.
2aa6ac03516d07 Florent Revest  2023-04-05  44  	 *
2aa6ac03516d07 Florent Revest  2023-04-05  45  	 * Therefore here the LR points at `literal + 16` or `literal + 20`,
2aa6ac03516d07 Florent Revest  2023-04-05  46  	 * and we can find the address of the literal in either case by
2aa6ac03516d07 Florent Revest  2023-04-05  47  	 * aligning to an 8-byte boundary and subtracting 16. We do the
2aa6ac03516d07 Florent Revest  2023-04-05  48  	 * alignment first as this allows us to fold the subtraction into the
2aa6ac03516d07 Florent Revest  2023-04-05  49  	 * LDR.
2aa6ac03516d07 Florent Revest  2023-04-05  50  	 */
2aa6ac03516d07 Florent Revest  2023-04-05  51  	bic	x11, x30, 0x7
2aa6ac03516d07 Florent Revest  2023-04-05  52  	ldr	x11, [x11, #-(4 * AARCH64_INSN_SIZE)]		// op
2aa6ac03516d07 Florent Revest  2023-04-05  53  
2aa6ac03516d07 Florent Revest  2023-04-05  54  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS
2aa6ac03516d07 Florent Revest  2023-04-05  55  	/*
2aa6ac03516d07 Florent Revest  2023-04-05  56  	 * If the op has a direct call, handle it immediately without
2aa6ac03516d07 Florent Revest  2023-04-05  57  	 * saving/restoring registers.
2aa6ac03516d07 Florent Revest  2023-04-05  58  	 */
2aa6ac03516d07 Florent Revest  2023-04-05 @59  	ldr	x17, [x11, #FTRACE_OPS_DIRECT_CALL]		// op->direct_call
2aa6ac03516d07 Florent Revest  2023-04-05  60  	cbnz	x17, ftrace_caller_direct
2aa6ac03516d07 Florent Revest  2023-04-05  61  #endif
2aa6ac03516d07 Florent Revest  2023-04-05  62  #endif
2aa6ac03516d07 Florent Revest  2023-04-05  63  
26299b3f6ba26b Mark Rutland    2022-11-03  64  	/* Save original SP */
26299b3f6ba26b Mark Rutland    2022-11-03  65  	mov	x10, sp
3b23e4991fb66f Torsten Duwe    2019-02-08  66  
26299b3f6ba26b Mark Rutland    2022-11-03  67  	/* Make room for ftrace regs, plus two frame records */
26299b3f6ba26b Mark Rutland    2022-11-03  68  	sub	sp, sp, #(FREGS_SIZE + 32)
3b23e4991fb66f Torsten Duwe    2019-02-08  69  
26299b3f6ba26b Mark Rutland    2022-11-03  70  	/* Save function arguments */
26299b3f6ba26b Mark Rutland    2022-11-03  71  	stp	x0, x1, [sp, #FREGS_X0]
26299b3f6ba26b Mark Rutland    2022-11-03  72  	stp	x2, x3, [sp, #FREGS_X2]
26299b3f6ba26b Mark Rutland    2022-11-03  73  	stp	x4, x5, [sp, #FREGS_X4]
26299b3f6ba26b Mark Rutland    2022-11-03  74  	stp	x6, x7, [sp, #FREGS_X6]
26299b3f6ba26b Mark Rutland    2022-11-03  75  	str	x8,     [sp, #FREGS_X8]
3b23e4991fb66f Torsten Duwe    2019-02-08  76  

:::::: The code at line 59 was first introduced by commit
:::::: 2aa6ac03516d078cf0c35aaa273b5cd11ea9734c arm64: ftrace: Add direct call support

:::::: TO: Florent Revest <revest@chromium.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
