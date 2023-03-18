Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A867F8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 Mar 2023 06:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679122118; x=1710658118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aPwk3/a4Fh/9Aqaz5MdGltP/A1WkpeQGPBTEkvlZ1xs=;
  b=eKr1ibAyv1dRPqbgcHdG1zVnhmuj+AKe5HaKroQB0FUH2ZSLjDLP5MwL
   AuWZaZsaPgPp64eVV3Kby13NSNVlTk++A9kvMpVWQkEZo7IdY059aZZ4X
   TS1F42tXuYFimQ6+hfWDi9xIDFjJ9brLsxyk5O2JGoTfA/5bAREbcbcVG
   7rThA01bRVSI2Q9OvpsMJAflLlq0wa8Y24oA9b+kTg4EezOlMRuuBLgD3
   0OB/XEDLXBN23eScWJpKYpAjw4xv3MTX3IvMjrOYxqnuXy7KXmw8YFOzj
   Dc1LFMDaRPl5a3NK3Arr/v8QuoSgBfCd/+GyjvEiSRdjS4YrBkLLKhUf7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="318812652"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="318812652"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2023 23:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10652"; a="823900038"
X-IronPort-AV: E=Sophos;i="5.98,271,1673942400"; 
   d="scan'208";a="823900038"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2023 23:48:36 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdQMl-0009sQ-2T;
	Sat, 18 Mar 2023 06:48:35 +0000
Date: Sat, 18 Mar 2023 14:47:50 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 8/9] arch/x86/kernel/paravirt.c:61:9:
 error: implicit declaration of function '__text_gen_insn'
Message-ID: <202303181459.z9SmfvWF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   7f7e0649e8daa4d77b60c9f9924def9324036069
commit: 3f7bf8aa0ae1895f0c50e9d76c8e66b15cdb9064 [8/9] static_call: Reorganize static call headers
config: i386-buildonly-randconfig-r002-20230313 (https://download.01.org/0day-ci/archive/20230318/202303181459.z9SmfvWF-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=3f7bf8aa0ae1895f0c50e9d76c8e66b15cdb9064
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout 3f7bf8aa0ae1895f0c50e9d76c8e66b15cdb9064
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303181459.z9SmfvWF-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/paravirt.c: In function 'paravirt_patch_call':
>> arch/x86/kernel/paravirt.c:61:9: error: implicit declaration of function '__text_gen_insn' [-Werror=implicit-function-declaration]
      61 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |         ^~~~~~~~~~~~~~~
>> arch/x86/kernel/paravirt.c:61:36: error: 'CALL_INSN_OPCODE' undeclared (first use in this function)
      61 |         __text_gen_insn(insn_buff, CALL_INSN_OPCODE,
         |                                    ^~~~~~~~~~~~~~~~
   arch/x86/kernel/paravirt.c:61:36: note: each undeclared identifier is reported only once for each function it appears in
>> arch/x86/kernel/paravirt.c:62:47: error: 'CALL_INSN_SIZE' undeclared (first use in this function); did you mean 'ENDBR_INSN_SIZE'?
      62 |                         (void *)addr, target, CALL_INSN_SIZE);
         |                                               ^~~~~~~~~~~~~~
         |                                               ENDBR_INSN_SIZE
   arch/x86/kernel/paravirt.c: At top level:
   arch/x86/kernel/paravirt.c:76:13: warning: no previous prototype for 'native_pv_lock_init' [-Wmissing-prototypes]
      76 | void __init native_pv_lock_init(void)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/paravirt.c: In function 'paravirt_patch_call':
   arch/x86/kernel/paravirt.c:64:1: error: control reaches end of non-void function [-Werror=return-type]
      64 | }
         | ^
   cc1: some warnings being treated as errors


vim +/__text_gen_insn +61 arch/x86/kernel/paravirt.c

139ec7c416248b arch/i386/kernel/paravirt.c Rusty Russell       2006-12-07  57  
1fc654cf6e04b4 arch/x86/kernel/paravirt.c  Ingo Molnar         2019-04-25  58  static unsigned paravirt_patch_call(void *insn_buff, const void *target,
abc745f85c1193 arch/x86/kernel/paravirt.c  Juergen Gross       2018-08-28  59  				    unsigned long addr, unsigned len)
63f70270ccd981 arch/i386/kernel/paravirt.c Jeremy Fitzhardinge 2007-05-02  60  {
ba27d1a80871eb arch/x86/kernel/paravirt.c  Peter Zijlstra      2022-03-08 @61  	__text_gen_insn(insn_buff, CALL_INSN_OPCODE,
ba27d1a80871eb arch/x86/kernel/paravirt.c  Peter Zijlstra      2022-03-08 @62  			(void *)addr, target, CALL_INSN_SIZE);
ba27d1a80871eb arch/x86/kernel/paravirt.c  Peter Zijlstra      2022-03-08  63  	return CALL_INSN_SIZE;
63f70270ccd981 arch/i386/kernel/paravirt.c Jeremy Fitzhardinge 2007-05-02  64  }
63f70270ccd981 arch/i386/kernel/paravirt.c Jeremy Fitzhardinge 2007-05-02  65  

:::::: The code at line 61 was first introduced by commit
:::::: ba27d1a80871eb8dbeddf34ec7d396c149cbb8d7 x86/ibt,paravirt: Use text_gen_insn() for paravirt_patch()

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
