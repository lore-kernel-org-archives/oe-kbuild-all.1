Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCF8BA3B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Feb 2023 22:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677276371; x=1708812371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+5hLmMh+vPf8FcJC5E8ceK28JA1V1NGaaTOOXqFQt/g=;
  b=V8ZkJWpWfhfaQq4sYbU5DonniTNcX2H5A6uxbqFBs86+Zpk8zXfPNZv1
   druN44TdKSC8GHN6hhSXx9w5jRYvTC5Op7GQDzwaV1nXYA/oR+Fgdn0Tz
   qkw0zyf0yk2ZCCU07Ed7+kh52CqUS0Ke6h9Slpt+XBimb/wrCGqfiKJZS
   GhjZR+YvmLldxZECgI/P2U0Li7MotjWupOw2EdIcOBPteRv7v4abRvRIn
   98nSLtR7B8j9n5Y/0b5yGrv0I1FQXszyJQ/Ob5vDWBStYej58aH0jSy/o
   BseX46qebDd3LYv7IBp8SgPX99sTeX+OoJNzUj0KW152rlPGOH/E3TvsU
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="419823109"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="419823109"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2023 14:06:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10631"; a="815877483"
X-IronPort-AV: E=Sophos;i="5.97,326,1669104000"; 
   d="scan'208";a="815877483"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 24 Feb 2023 14:06:09 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pVgCe-0002kw-2O;
	Fri, 24 Feb 2023 22:06:08 +0000
Date: Sat, 25 Feb 2023 06:05:59 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split 29/30]
 arch/arm/kernel/entry-armv.S:271: Error: can't mix positional and keyword
 arguments
Message-ID: <202302250646.CpGOobYi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
head:   35ac5a9a53d2554bda395cdfa3236d278715caac
commit: 0bf7902c72bece7c368367ab29582834a7fff130 [29/30] switch PGD/TTBR0 in <asm/uaccess-asm.h>
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20230225/202302250646.CpGOobYi-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git/commit/?id=0bf7902c72bece7c368367ab29582834a7fff130
        git remote add arm-integrator https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git
        git fetch --no-tags arm-integrator kernel-in-vmalloc-v6.2-rc3-just-ttbr0-split
        git checkout 0bf7902c72bece7c368367ab29582834a7fff130
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302250646.CpGOobYi-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm/kernel/entry-armv.S: Assembler messages:
>> arch/arm/kernel/entry-armv.S:271: Error: can't mix positional and keyword arguments
>> arch/arm/kernel/entry-armv.S:286: Error: .fnend directive without .fnstart


vim +271 arch/arm/kernel/entry-armv.S

   264	
   265		.align	5
   266	__und_svc:
   267	#ifdef CONFIG_KPROBES
   268		@ If a kprobe is about to simulate a "stmdb sp..." instruction,
   269		@ it obviously needs free stack space which then will belong to
   270		@ the saved context.
 > 271		svc_entry uaccess=0, MAX_STACK_SIZE
   272	#else
   273		svc_entry uaccess=0
   274	#endif
   275	
   276		mov	r1, #4				@ PC correction to apply
   277	 THUMB(	tst	r5, #PSR_T_BIT		)	@ exception taken in Thumb mode?
   278	 THUMB(	movne	r1, #2			)	@ if so, fix up PC correction
   279		mov	r0, sp				@ struct pt_regs *regs
   280		bl	__und_fault
   281	
   282	__und_svc_finish:
   283		get_thread_info tsk
   284		ldr	r5, [sp, #S_PSR]		@ Get SVC cpsr
   285		svc_exit rpsr=r5, uaccess=0		@ return from exception
 > 286	 UNWIND(.fnend		)
   287	ENDPROC(__und_svc)
   288	
   289		.align	5
   290	__pabt_svc:
   291		svc_entry uaccess=0
   292		mov	r2, sp				@ regs
   293		pabt_helper
   294		svc_exit rpsr=r5, uaccess=0		@ return from exception
   295	 UNWIND(.fnend		)
   296	ENDPROC(__pabt_svc)
   297	
   298		.align	5
   299	__fiq_svc:
   300		svc_entry trace=0, uaccess=0
   301		mov	r0, sp				@ struct pt_regs *regs
   302		bl	handle_fiq_as_nmi
   303		svc_exit_via_fiq uaccess=0
   304	 UNWIND(.fnend		)
   305	ENDPROC(__fiq_svc)
   306	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
