Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9244217E6
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 10:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674208857; x=1705744857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dVdJR3tz24GxMz03PXvg3B7N2gkKkdPg9fNWgAtYe6g=;
  b=XEF7xCznK1v+w1eymW3ZYeeAt+AOiC5Hz/wMOOnORjAU+PJM377NUzIF
   pEM68ZO8463O3cZt/oUDri3zr94A2eExJgbOljFJSVM2rqExbpr36an+p
   t3jotJcKvcfa2FAABDlUIMRBqDPNMrANULYjVTZSApmQTpzjMXXIFawvw
   Tzs58a0edUg5qKlkUHObL0B9UAxOuFxGyGPjpfv2c/Phx8N3FDgeTMEjd
   cUoY66NQsj5sQNHczwtNhtbwi+Jbdk4SCGlpMqrjkPBNNOwf6VaBNRIx9
   oIfjTMGS0ytTMqZ4VAFVrwA8kalmcFtb4lvb6ARf9k+5dgCVoL5xJY608
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="305220494"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="305220494"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 02:00:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="638111048"
X-IronPort-AV: E=Sophos;i="5.97,231,1669104000"; 
   d="scan'208";a="638111048"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 20 Jan 2023 02:00:55 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIoCc-0002Sk-2h;
	Fri, 20 Jan 2023 10:00:54 +0000
Date: Fri, 20 Jan 2023 18:00:27 +0800
From: kernel test robot <lkp@intel.com>
To: "Madhavan T. Venkataraman" <madvenka@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [madvenka786:orc_v3 19/21] arch/arm64/kernel/stacktrace.c:247:47:
 error: passing argument 1 of 'unwind_check_reliable' from incompatible
 pointer type
Message-ID: <202301201757.e5RNiYdT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/madvenka786/linux orc_v3
head:   a0c212ed0823caa5a7ec431d3a5ec07b46964384
commit: efd891a1cc3e90a1a1299ebc996024bad0b4ea61 [19/21] arm64: unwinder: Add a reliability check in the unwinder based on ORC
config: arm64-randconfig-r004-20230119 (https://download.01.org/0day-ci/archive/20230120/202301201757.e5RNiYdT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/madvenka786/linux/commit/efd891a1cc3e90a1a1299ebc996024bad0b4ea61
        git remote add madvenka786 https://github.com/madvenka786/linux
        git fetch --no-tags madvenka786 orc_v3
        git checkout efd891a1cc3e90a1a1299ebc996024bad0b4ea61
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

Note: the madvenka786/orc_v3 HEAD a0c212ed0823caa5a7ec431d3a5ec07b46964384 builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

>> arch/arm64/kernel/stacktrace.c:131:42: warning: 'struct stackframe' declared inside parameter list will not be visible outside of this definition or declaration
     131 | static void unwind_check_reliable(struct stackframe *frame)
         |                                          ^~~~~~~~~~
   arch/arm64/kernel/stacktrace.c: In function 'unwind_next':
   arch/arm64/kernel/stacktrace.c:197:29: warning: unused variable 'tsk' [-Wunused-variable]
     197 |         struct task_struct *tsk = state->task;
         |                             ^~~
   arch/arm64/kernel/stacktrace.c: In function 'unwind':
>> arch/arm64/kernel/stacktrace.c:247:47: error: passing argument 1 of 'unwind_check_reliable' from incompatible pointer type [-Werror=incompatible-pointer-types]
     247 |                         unwind_check_reliable(state);
         |                                               ^~~~~
         |                                               |
         |                                               struct unwind_state *
   arch/arm64/kernel/stacktrace.c:131:54: note: expected 'struct stackframe *' but argument is of type 'struct unwind_state *'
     131 | static void unwind_check_reliable(struct stackframe *frame)
         |                                   ~~~~~~~~~~~~~~~~~~~^~~~~
   arch/arm64/kernel/stacktrace.c: In function 'arch_stack_walk_reliable':
   arch/arm64/kernel/stacktrace.c:368:31: error: passing argument 1 of 'unwind_check_reliable' from incompatible pointer type [-Werror=incompatible-pointer-types]
     368 |         unwind_check_reliable(&state);
         |                               ^~~~~~
         |                               |
         |                               struct unwind_state *
   arch/arm64/kernel/stacktrace.c:131:54: note: expected 'struct stackframe *' but argument is of type 'struct unwind_state *'
     131 | static void unwind_check_reliable(struct stackframe *frame)
         |                                   ~~~~~~~~~~~~~~~~~~~^~~~~
   cc1: some warnings being treated as errors


vim +/unwind_check_reliable +247 arch/arm64/kernel/stacktrace.c

   130	
 > 131	static void unwind_check_reliable(struct stackframe *frame)
   132	{
   133	}
   134	
   135	#endif /* CONFIG_FRAME_POINTER_VALIDATION */
   136	
   137	/*
   138	 * Start an unwind from a pt_regs.
   139	 *
   140	 * The unwind will begin at the PC within the regs.
   141	 *
   142	 * The regs must be on a stack currently owned by the calling task.
   143	 */
   144	static inline void unwind_init_from_regs(struct unwind_state *state,
   145						 struct pt_regs *regs)
   146	{
   147		unwind_init_common(state, current);
   148	
   149		state->fp = regs->regs[29];
   150		state->pc = regs->pc;
   151	}
   152	
   153	/*
   154	 * Start an unwind from a caller.
   155	 *
   156	 * The unwind will begin at the caller of whichever function this is inlined
   157	 * into.
   158	 *
   159	 * The function which invokes this must be noinline.
   160	 */
   161	static __always_inline void unwind_init_from_caller(struct unwind_state *state)
   162	{
   163		unwind_init_common(state, current);
   164	
   165		state->fp = (unsigned long)__builtin_frame_address(1);
   166		state->pc = (unsigned long)__builtin_return_address(0);
   167	}
   168	
   169	/*
   170	 * Start an unwind from a blocked task.
   171	 *
   172	 * The unwind will begin at the blocked tasks saved PC (i.e. the caller of
   173	 * cpu_switch_to()).
   174	 *
   175	 * The caller should ensure the task is blocked in cpu_switch_to() for the
   176	 * duration of the unwind, or the unwind will be bogus. It is never valid to
   177	 * call this for the current task.
   178	 */
   179	static inline void unwind_init_from_task(struct unwind_state *state,
   180						 struct task_struct *task)
   181	{
   182		unwind_init_common(state, task);
   183	
   184		state->fp = thread_saved_fp(task);
   185		state->pc = thread_saved_pc(task);
   186	}
   187	
   188	/*
   189	 * Unwind from one frame record (A) to the next frame record (B).
   190	 *
   191	 * We terminate early if the location of B indicates a malformed chain of frame
   192	 * records (e.g. a cycle), determined based on the location and fp value of A
   193	 * and the location (but not the fp value) of B.
   194	 */
   195	static int notrace unwind_next(struct unwind_state *state)
   196	{
   197		struct task_struct *tsk = state->task;
   198		int err;
   199	
   200		if (unwind_completed(state))
   201			return -ENOENT;
   202	
   203		err = unwind_next_frame_record(state);
   204		if (err)
   205			return err;
   206	
   207		state->pc = ptrauth_strip_insn_pac(state->pc);
   208	
   209	#ifdef CONFIG_FUNCTION_GRAPH_TRACER
   210		if (tsk->ret_stack &&
   211			(state->pc == (unsigned long)return_to_handler)) {
   212			unsigned long orig_pc;
   213			/*
   214			 * This is a case where function graph tracer has
   215			 * modified a return address (LR) in a stack frame
   216			 * to hook a function return.
   217			 * So replace it to an original value.
   218			 */
   219			orig_pc = ftrace_graph_ret_addr(tsk, NULL, state->pc,
   220							(void *)state->fp);
   221			if (WARN_ON_ONCE(state->pc == orig_pc))
   222				return -EINVAL;
   223			state->pc = orig_pc;
   224		}
   225	#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
   226	#ifdef CONFIG_KRETPROBES
   227		if (is_kretprobe_trampoline(state->pc))
   228			state->pc = kretprobe_find_ret_addr(tsk, (void *)state->fp, &state->kr_cur);
   229	#endif
   230	
   231		return 0;
   232	}
   233	NOKPROBE_SYMBOL(unwind_next);
   234	
   235	static int notrace unwind(struct unwind_state *state, bool need_reliable,
   236				   stack_trace_consume_fn consume_entry, void *cookie)
   237	{
   238		int ret = 0;
   239	
   240		while (1) {
   241			if (need_reliable && !state->reliable)
   242				return -EINVAL;
   243			if (!consume_entry(cookie, state->pc))
   244				break;
   245			ret = unwind_next(state);
   246			if (need_reliable && !ret)
 > 247				unwind_check_reliable(state);
   248			if (ret < 0)
   249				break;
   250		}
   251		return ret;
   252	}
   253	NOKPROBE_SYMBOL(unwind);
   254	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
