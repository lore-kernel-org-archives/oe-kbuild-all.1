Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01A8615486
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Jun 2023 12:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688041591; x=1719577591;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=0o1PLQFg9YJAxU4F7OxUhopL9W2Htn2NqsUM9AgVd30=;
  b=kEr7gJYUShK7IsbrL0/cBrCr32eqmKkPmXmhZWUqFEV7nmbulDb8uCWs
   ZiGkpRMDw7ASyw8+fmpLSdb20sQhFPNKNbkymgpGj4q4w+e1WEduSR9q1
   4yqDor1R97bz8fVQo/m5iH/xNoeOTWlxgoejY9BwoFh5OyVJ2n6BpfwQh
   JupI0S778eBHEy/3uvCsAZS2Wt3XHT5hrvRyS0yIWwDp1vA2+y/NIjvbt
   c86DU0AlY/nknJUi5NtgWfng/bYHtWpSL/04EOCWuE6Qp/3RYOQyIMqv4
   PPfONiaoiAOGyBoNQTs5rJ+Ya9x6dgGrtbdxyTyZr7CTbqPljwyLtOcxj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="360941777"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="360941777"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 05:26:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="711397816"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="711397816"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 29 Jun 2023 05:26:26 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qEqjB-000E8z-1o;
	Thu, 29 Jun 2023 12:26:25 +0000
Date: Thu, 29 Jun 2023 20:25:31 +0800
From: kernel test robot <lkp@intel.com>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Andy Chiu <andy.chiu@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org, linux@rivosinc.com,
	=?iso-8859-1?Q?R=E9mi?= Denis-Courmont <remi@remlab.net>,
	Darius Rad <darius@bluespec.com>
Subject: Re: [PATCH v3] riscv: Discard vector state on syscalls
Message-ID: <202306292011.OGfLGBam-lkp@intel.com>
References: <20230629062730.985184-1-bjorn@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230629062730.985184-1-bjorn@kernel.org>

Hi Björn,

kernel test robot noticed the following build errors:

[auto build test ERROR on 488833ccdcac118da16701f4ee0673b20ba47fe3]

url:    https://github.com/intel-lab-lkp/linux/commits/Bj-rn-T-pel/riscv-Discard-vector-state-on-syscalls/20230629-142852
base:   488833ccdcac118da16701f4ee0673b20ba47fe3
patch link:    https://lore.kernel.org/r/20230629062730.985184-1-bjorn%40kernel.org
patch subject: [PATCH v3] riscv: Discard vector state on syscalls
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20230629/202306292011.OGfLGBam-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230629/202306292011.OGfLGBam-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306292011.OGfLGBam-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/traps.c: In function 'do_trap_ecall_u':
>> arch/riscv/kernel/traps.c:299:17: error: implicit declaration of function 'riscv_v_vstate_discard'; did you mean 'riscv_v_vstate_restore'? [-Werror=implicit-function-declaration]
     299 |                 riscv_v_vstate_discard(regs);
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 riscv_v_vstate_restore
   cc1: some warnings being treated as errors


vim +299 arch/riscv/kernel/traps.c

   290	
   291	asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
   292	{
   293		if (user_mode(regs)) {
   294			ulong syscall = regs->a7;
   295	
   296			regs->epc += 4;
   297			regs->orig_a0 = regs->a0;
   298	
 > 299			riscv_v_vstate_discard(regs);
   300	
   301			syscall = syscall_enter_from_user_mode(regs, syscall);
   302	
   303			if (syscall < NR_syscalls)
   304				syscall_handler(regs, syscall);
   305			else
   306				regs->a0 = -ENOSYS;
   307	
   308			syscall_exit_to_user_mode(regs);
   309		} else {
   310			irqentry_state_t state = irqentry_nmi_enter(regs);
   311	
   312			do_trap_error(regs, SIGILL, ILL_ILLTRP, regs->epc,
   313				"Oops - environment call from U-mode");
   314	
   315			irqentry_nmi_exit(regs, state);
   316		}
   317	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
