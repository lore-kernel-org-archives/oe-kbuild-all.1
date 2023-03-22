Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 528AB15BA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 03:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679455636; x=1710991636;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=q0WrwoWlpiXHEXP/PcXkjqE6BTl9wSWIbnMlf2EXPKI=;
  b=MIxSVACGghT1hIuVeW8ArPUnBBenCJKRyUf9pAuBMUznlVbd0JLSFCCr
   +MmcXGlO1dZFrfUdMuzy6ydOLrJmKjoKuJC7feKb2GW6kIeENkWRaoKu2
   eeWlDsWSF9ufdCRQ/R8b+RE+mxEzr1ul6OlLG0J79eDtD0tyrXs8td15O
   3g/q2wBDH9zIvA9BWCXkZJ8NWy8NHqottUgofbAunVM6/K0LirKk71sej
   mFlAp0a6bNAbzove/SngpNDRfh2wCx3zEE1W+OV2O9IRevi6bGdvewK7s
   xOd1tI2VB2c+K24hecH0oxFsVLuL42aqD64RaCLLzMI6ZaeABYONdhN8j
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="401686442"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="401686442"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2023 20:27:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="681753567"
X-IronPort-AV: E=Sophos;i="5.98,280,1673942400"; 
   d="scan'208";a="681753567"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 21 Mar 2023 20:27:13 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pep84-000Cnh-0o;
	Wed, 22 Mar 2023 03:27:12 +0000
Date: Wed, 22 Mar 2023 11:26:19 +0800
From: kernel test robot <lkp@intel.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	Ross Zwisler <zwisler@google.com>,
	Joel Fernandes <joel@joelfernandes.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>
Subject: Re: [PATCH] tracing: Trace instrumentation begin and end
Message-ID: <202303221148.o4nkqckQ-lkp@intel.com>
References: <20230321215121.71b339c5@gandalf.local.home>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230321215121.71b339c5@gandalf.local.home>

Hi Steven,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.3-rc3 next-20230321]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/tracing-Trace-instrumentation-begin-and-end/20230322-095354
patch link:    https://lore.kernel.org/r/20230321215121.71b339c5%40gandalf.local.home
patch subject: [PATCH] tracing: Trace instrumentation begin and end
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230322/202303221148.o4nkqckQ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/1f40755bb9b4817135459d6cf76fcbd17ffb53dd
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Steven-Rostedt/tracing-Trace-instrumentation-begin-and-end/20230322-095354
        git checkout 1f40755bb9b4817135459d6cf76fcbd17ffb53dd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221148.o4nkqckQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from arch/powerpc/include/asm/page.h:247,
                    from arch/powerpc/include/asm/thread_info.h:13,
                    from include/linux/thread_info.h:60,
                    from arch/powerpc/include/asm/ptrace.h:342,
                    from arch/powerpc/include/asm/hw_irq.h:12,
                    from arch/powerpc/include/asm/irqflags.h:12,
                    from include/linux/irqflags.h:16,
                    from include/asm-generic/cmpxchg-local.h:6,
                    from arch/powerpc/include/asm/cmpxchg.h:755,
                    from arch/powerpc/include/asm/atomic.h:11,
                    from include/linux/atomic.h:7,
                    from include/linux/tracepoint-defs.h:11,
                    from include/linux/instrumentation.h:7,
                    from include/asm-generic/bug.h:6,
                    from arch/powerpc/include/asm/bug.h:159,
                    from include/linux/bug.h:5,
                    from include/linux/fortify-string.h:5,
                    from include/linux/string.h:254,
                    from include/linux/uuid.h:11,
                    from include/linux/mod_devicetable.h:13,
                    from scripts/mod/devicetable-offsets.c:3:
   arch/powerpc/include/asm/page_32.h: In function 'clear_page':
>> arch/powerpc/include/asm/page_32.h:48:9: error: implicit declaration of function 'WARN_ON' [-Werror=implicit-function-declaration]
      48 |         WARN_ON((unsigned long)addr & (L1_CACHE_BYTES - 1));
         |         ^~~~~~~
   include/linux/thread_info.h: In function 'check_copy_size':
>> include/linux/thread_info.h:249:13: error: implicit declaration of function 'WARN_ON_ONCE' [-Werror=implicit-function-declaration]
     249 |         if (WARN_ON_ONCE(bytes > INT_MAX))
         |             ^~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: scripts/mod/devicetable-offsets.s] Error 1
   make[2]: Target 'scripts/mod/' not remade because of errors.
   make[1]: *** [Makefile:1285: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +/WARN_ON +48 arch/powerpc/include/asm/page_32.h

7ab0b7cb8951d4 arch/powerpc/include/asm/page_32.h Christophe Leroy 2019-08-16  38  
5736f96d12dd42 arch/powerpc/include/asm/page_32.h Christophe Leroy 2016-02-09  39  /*
5736f96d12dd42 arch/powerpc/include/asm/page_32.h Christophe Leroy 2016-02-09  40   * Clear page using the dcbz instruction, which doesn't cause any
5736f96d12dd42 arch/powerpc/include/asm/page_32.h Christophe Leroy 2016-02-09  41   * memory traffic (except to write out any cache lines which get
5736f96d12dd42 arch/powerpc/include/asm/page_32.h Christophe Leroy 2016-02-09  42   * displaced).  This only works on cacheable memory.
5736f96d12dd42 arch/powerpc/include/asm/page_32.h Christophe Leroy 2016-02-09  43   */
5736f96d12dd42 arch/powerpc/include/asm/page_32.h Christophe Leroy 2016-02-09  44  static inline void clear_page(void *addr)
5736f96d12dd42 arch/powerpc/include/asm/page_32.h Christophe Leroy 2016-02-09  45  {
5736f96d12dd42 arch/powerpc/include/asm/page_32.h Christophe Leroy 2016-02-09  46  	unsigned int i;
5736f96d12dd42 arch/powerpc/include/asm/page_32.h Christophe Leroy 2016-02-09  47  
7ab0b7cb8951d4 arch/powerpc/include/asm/page_32.h Christophe Leroy 2019-08-16 @48  	WARN_ON((unsigned long)addr & (L1_CACHE_BYTES - 1));
7ab0b7cb8951d4 arch/powerpc/include/asm/page_32.h Christophe Leroy 2019-08-16  49  
5736f96d12dd42 arch/powerpc/include/asm/page_32.h Christophe Leroy 2016-02-09  50  	for (i = 0; i < PAGE_SIZE / L1_CACHE_BYTES; i++, addr += L1_CACHE_BYTES)
5736f96d12dd42 arch/powerpc/include/asm/page_32.h Christophe Leroy 2016-02-09  51  		dcbz(addr);
5736f96d12dd42 arch/powerpc/include/asm/page_32.h Christophe Leroy 2016-02-09  52  }
5cd16ee934eafc include/asm-powerpc/page_32.h      Michael Ellerman 2005-11-11  53  extern void copy_page(void *to, void *from);
5cd16ee934eafc include/asm-powerpc/page_32.h      Michael Ellerman 2005-11-11  54  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
