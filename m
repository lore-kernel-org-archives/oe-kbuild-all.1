Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B736D18
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Jun 2023 10:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686737184; x=1718273184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u2q7DIL7KZMdPVJY+j0fFB8G8+b/l2FMT+JvZItGZyM=;
  b=GsnMtH13E9JiaIwDQVW6V25UZ3+y5kmUPF6vNBRYwuqD7OTlEx/nSDJ7
   exS7Yu1Q1ouNh1+TUekC8kW4oPajkzd1fKZg86jqcfUeMMTpgN6+e7zsk
   KD29OPU6YnfjV84XQIjI9x6ncWSdZHu8IzQXRcr6yaSiOj/CCTuo/av9z
   lzsKUTKrSI3y6mlTlP5Os16eXiUJIzEUkFDASI4Z5bIqbhdyXpR+Me/TG
   wZg7a1yL5uYKVwyyEs/04Q5n+nwCEaWqV1XLtQsKfDmj9ieNt77HDrQa0
   a8bL1VgDvuqI3iJlkV5Y8212hAL49NHP39Z6OJfI8u4AC3gGOjet7tGbQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="444943704"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="444943704"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2023 03:06:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="824753393"
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="824753393"
Received: from lkp-server02.sh.intel.com (HELO d59cacf64e9e) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 14 Jun 2023 03:06:21 -0700
Received: from kbuild by d59cacf64e9e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9NOP-0000Vp-0A;
	Wed, 14 Jun 2023 10:06:21 +0000
Date: Wed, 14 Jun 2023 18:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: Guo Ren <guoren@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [linux-next:master 6433/9793] arch/riscv/kernel/signal.c:94:16:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202306141719.MJHClSrC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b16049b21162bb649cdd8519642a35972b7910fe
commit: fa8e7cce55da3569259dc270801885c420eb50fe [6433/9793] riscv: Enable Vector code to be built
config: riscv-randconfig-s031-20230612 (https://download.01.org/0day-ci/archive/20230614/202306141719.MJHClSrC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=fa8e7cce55da3569259dc270801885c420eb50fe
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout fa8e7cce55da3569259dc270801885c420eb50fe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=riscv SHELL=/bin/bash arch/riscv/kernel/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306141719.MJHClSrC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   WARNING: invalid argument to '-march': '_zihintpause'
>> arch/riscv/kernel/signal.c:94:16: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void *__x @@     got void [noderef] __user *[assigned] datap @@
   arch/riscv/kernel/signal.c:94:16: sparse:     expected void *__x
   arch/riscv/kernel/signal.c:94:16: sparse:     got void [noderef] __user *[assigned] datap
>> arch/riscv/kernel/signal.c:126:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *datap @@     got void * @@
   arch/riscv/kernel/signal.c:126:15: sparse:     expected void [noderef] __user *datap
   arch/riscv/kernel/signal.c:126:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:126:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *datap @@     got void * @@
   arch/riscv/kernel/signal.c:126:15: sparse:     expected void [noderef] __user *datap
   arch/riscv/kernel/signal.c:126:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:126:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *datap @@     got void * @@
   arch/riscv/kernel/signal.c:126:15: sparse:     expected void [noderef] __user *datap
   arch/riscv/kernel/signal.c:126:15: sparse:     got void *
>> arch/riscv/kernel/signal.c:126:15: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __user *datap @@     got void * @@
   arch/riscv/kernel/signal.c:126:15: sparse:     expected void [noderef] __user *datap
   arch/riscv/kernel/signal.c:126:15: sparse:     got void *

vim +94 arch/riscv/kernel/signal.c

8ee0b41898fa26 Greentime Hu 2023-06-05   72  
8ee0b41898fa26 Greentime Hu 2023-06-05   73  static long save_v_state(struct pt_regs *regs, void __user **sc_vec)
8ee0b41898fa26 Greentime Hu 2023-06-05   74  {
8ee0b41898fa26 Greentime Hu 2023-06-05   75  	struct __riscv_ctx_hdr __user *hdr;
8ee0b41898fa26 Greentime Hu 2023-06-05   76  	struct __sc_riscv_v_state __user *state;
8ee0b41898fa26 Greentime Hu 2023-06-05   77  	void __user *datap;
8ee0b41898fa26 Greentime Hu 2023-06-05   78  	long err;
8ee0b41898fa26 Greentime Hu 2023-06-05   79  
8ee0b41898fa26 Greentime Hu 2023-06-05   80  	hdr = *sc_vec;
8ee0b41898fa26 Greentime Hu 2023-06-05   81  	/* Place state to the user's signal context space after the hdr */
8ee0b41898fa26 Greentime Hu 2023-06-05   82  	state = (struct __sc_riscv_v_state __user *)(hdr + 1);
8ee0b41898fa26 Greentime Hu 2023-06-05   83  	/* Point datap right after the end of __sc_riscv_v_state */
8ee0b41898fa26 Greentime Hu 2023-06-05   84  	datap = state + 1;
8ee0b41898fa26 Greentime Hu 2023-06-05   85  
8ee0b41898fa26 Greentime Hu 2023-06-05   86  	/* datap is designed to be 16 byte aligned for better performance */
8ee0b41898fa26 Greentime Hu 2023-06-05   87  	WARN_ON(unlikely(!IS_ALIGNED((unsigned long)datap, 16)));
8ee0b41898fa26 Greentime Hu 2023-06-05   88  
8ee0b41898fa26 Greentime Hu 2023-06-05   89  	riscv_v_vstate_save(current, regs);
8ee0b41898fa26 Greentime Hu 2023-06-05   90  	/* Copy everything of vstate but datap. */
8ee0b41898fa26 Greentime Hu 2023-06-05   91  	err = __copy_to_user(&state->v_state, &current->thread.vstate,
8ee0b41898fa26 Greentime Hu 2023-06-05   92  			     offsetof(struct __riscv_v_ext_state, datap));
8ee0b41898fa26 Greentime Hu 2023-06-05   93  	/* Copy the pointer datap itself. */
8ee0b41898fa26 Greentime Hu 2023-06-05  @94  	err |= __put_user(datap, &state->v_state.datap);
8ee0b41898fa26 Greentime Hu 2023-06-05   95  	/* Copy the whole vector content to user space datap. */
8ee0b41898fa26 Greentime Hu 2023-06-05   96  	err |= __copy_to_user(datap, current->thread.vstate.datap, riscv_v_vsize);
8ee0b41898fa26 Greentime Hu 2023-06-05   97  	/* Copy magic to the user space after saving  all vector conetext */
8ee0b41898fa26 Greentime Hu 2023-06-05   98  	err |= __put_user(RISCV_V_MAGIC, &hdr->magic);
8ee0b41898fa26 Greentime Hu 2023-06-05   99  	err |= __put_user(riscv_v_sc_size, &hdr->size);
8ee0b41898fa26 Greentime Hu 2023-06-05  100  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  101  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  102  
8ee0b41898fa26 Greentime Hu 2023-06-05  103  	/* Only progress the sv_vec if everything has done successfully  */
8ee0b41898fa26 Greentime Hu 2023-06-05  104  	*sc_vec += riscv_v_sc_size;
8ee0b41898fa26 Greentime Hu 2023-06-05  105  	return 0;
8ee0b41898fa26 Greentime Hu 2023-06-05  106  }
8ee0b41898fa26 Greentime Hu 2023-06-05  107  
8ee0b41898fa26 Greentime Hu 2023-06-05  108  /*
8ee0b41898fa26 Greentime Hu 2023-06-05  109   * Restore Vector extension context from the user's signal frame. This function
8ee0b41898fa26 Greentime Hu 2023-06-05  110   * assumes a valid extension header. So magic and size checking must be done by
8ee0b41898fa26 Greentime Hu 2023-06-05  111   * the caller.
8ee0b41898fa26 Greentime Hu 2023-06-05  112   */
8ee0b41898fa26 Greentime Hu 2023-06-05  113  static long __restore_v_state(struct pt_regs *regs, void __user *sc_vec)
8ee0b41898fa26 Greentime Hu 2023-06-05  114  {
8ee0b41898fa26 Greentime Hu 2023-06-05  115  	long err;
8ee0b41898fa26 Greentime Hu 2023-06-05  116  	struct __sc_riscv_v_state __user *state = sc_vec;
8ee0b41898fa26 Greentime Hu 2023-06-05  117  	void __user *datap;
8ee0b41898fa26 Greentime Hu 2023-06-05  118  
8ee0b41898fa26 Greentime Hu 2023-06-05  119  	/* Copy everything of __sc_riscv_v_state except datap. */
8ee0b41898fa26 Greentime Hu 2023-06-05  120  	err = __copy_from_user(&current->thread.vstate, &state->v_state,
8ee0b41898fa26 Greentime Hu 2023-06-05  121  			       offsetof(struct __riscv_v_ext_state, datap));
8ee0b41898fa26 Greentime Hu 2023-06-05  122  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  123  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  124  
8ee0b41898fa26 Greentime Hu 2023-06-05  125  	/* Copy the pointer datap itself. */
8ee0b41898fa26 Greentime Hu 2023-06-05 @126  	err = __get_user(datap, &state->v_state.datap);
8ee0b41898fa26 Greentime Hu 2023-06-05  127  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  128  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  129  	/*
8ee0b41898fa26 Greentime Hu 2023-06-05  130  	 * Copy the whole vector content from user space datap. Use
8ee0b41898fa26 Greentime Hu 2023-06-05  131  	 * copy_from_user to prevent information leak.
8ee0b41898fa26 Greentime Hu 2023-06-05  132  	 */
8ee0b41898fa26 Greentime Hu 2023-06-05  133  	err = copy_from_user(current->thread.vstate.datap, datap, riscv_v_vsize);
8ee0b41898fa26 Greentime Hu 2023-06-05  134  	if (unlikely(err))
8ee0b41898fa26 Greentime Hu 2023-06-05  135  		return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  136  
8ee0b41898fa26 Greentime Hu 2023-06-05  137  	riscv_v_vstate_restore(current, regs);
8ee0b41898fa26 Greentime Hu 2023-06-05  138  
8ee0b41898fa26 Greentime Hu 2023-06-05  139  	return err;
8ee0b41898fa26 Greentime Hu 2023-06-05  140  }
8ee0b41898fa26 Greentime Hu 2023-06-05  141  #else
8ee0b41898fa26 Greentime Hu 2023-06-05  142  #define save_v_state(task, regs) (0)
8ee0b41898fa26 Greentime Hu 2023-06-05  143  #define __restore_v_state(task, regs) (0)
8ee0b41898fa26 Greentime Hu 2023-06-05  144  #endif
8ee0b41898fa26 Greentime Hu 2023-06-05  145  

:::::: The code at line 94 was first introduced by commit
:::::: 8ee0b41898fa26f66e32237f179b6989c65600d6 riscv: signal: Add sigcontext save/restore for vector

:::::: TO: Greentime Hu <greentime.hu@sifive.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
