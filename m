Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D1E815A9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Mar 2023 08:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679474671; x=1711010671;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KKkhQ49+diOSBtlstbsRr80g7Z3kKA5yDXfOzckinm8=;
  b=GevLiLoTTa94Y3nk3rvhURiIK9iYa9AJAxeSkuf7wWSWqOwQdYk6h7wB
   RShiW3rO4Qc5RvAkt9QJrXEkl/ANXxqSfcP4bzGzxpj1ONzAg55bMV33n
   aytpxBqEKbAjoxWp3krZ4Seea76jxGrcrIADe6aTGtZd6BNLIPJ4HN1H7
   irX7f3ppQn9E5ABrKn1fWr6AlzdFzd+UPdanfAYNqfYpE1/ImeR7YLsrc
   x8WBDNGSuHkbIsZDRHZNOD8lHMxQgxDtjnSSZN3PBh5SqtQi6cXEK4rCx
   cbSeg0elDWnuD5natL++CyC0gZAGYGgOLz2ZHQyZzJsqbEmVQV7BgMVJV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="336664373"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="336664373"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 01:44:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10656"; a="856032953"
X-IronPort-AV: E=Sophos;i="5.98,281,1673942400"; 
   d="scan'208";a="856032953"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 22 Mar 2023 01:44:29 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1peu56-000D6C-1B;
	Wed, 22 Mar 2023 08:44:28 +0000
Date: Wed, 22 Mar 2023 16:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:static-call-null-4 11/11]
 arch/x86/kernel/alternative.c:613:23: warning: variable 'dest' set but not
 used
Message-ID: <202303221651.Q540blBW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git static-call-null-4
head:   67517470624490a1d82c0b3a5e744a72d325b4af
commit: 67517470624490a1d82c0b3a5e744a72d325b4af [11/11] static_call: Remove DEFINE_STATIC_CALL_RET0()
config: x86_64-randconfig-a011 (https://download.01.org/0day-ci/archive/20230322/202303221651.Q540blBW-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git/commit/?id=67517470624490a1d82c0b3a5e744a72d325b4af
        git remote add jpoimboe https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git
        git fetch --no-tags jpoimboe static-call-null-4
        git checkout 67517470624490a1d82c0b3a5e744a72d325b4af
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303221651.Q540blBW-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/alternative.c: In function 'apply_returns':
>> arch/x86/kernel/alternative.c:613:23: warning: variable 'dest' set but not used [-Wunused-but-set-variable]
     613 |                 void *dest = NULL, *addr = (void *)s + *s;
         |                       ^~~~


vim +/dest +613 arch/x86/kernel/alternative.c

15e67227c49a57 Peter Zijlstra 2022-06-14  607  
15e67227c49a57 Peter Zijlstra 2022-06-14  608  void __init_or_module noinline apply_returns(s32 *start, s32 *end)
15e67227c49a57 Peter Zijlstra 2022-06-14  609  {
15e67227c49a57 Peter Zijlstra 2022-06-14  610  	s32 *s;
15e67227c49a57 Peter Zijlstra 2022-06-14  611  
15e67227c49a57 Peter Zijlstra 2022-06-14  612  	for (s = start; s < end; s++) {
ee88d363d15617 Peter Zijlstra 2022-06-14 @613  		void *dest = NULL, *addr = (void *)s + *s;
15e67227c49a57 Peter Zijlstra 2022-06-14  614  		struct insn insn;
15e67227c49a57 Peter Zijlstra 2022-06-14  615  		int len, ret;
15e67227c49a57 Peter Zijlstra 2022-06-14  616  		u8 bytes[16];
ee88d363d15617 Peter Zijlstra 2022-06-14  617  		u8 op;
15e67227c49a57 Peter Zijlstra 2022-06-14  618  
15e67227c49a57 Peter Zijlstra 2022-06-14  619  		ret = insn_decode_kernel(&insn, addr);
15e67227c49a57 Peter Zijlstra 2022-06-14  620  		if (WARN_ON_ONCE(ret < 0))
15e67227c49a57 Peter Zijlstra 2022-06-14  621  			continue;
15e67227c49a57 Peter Zijlstra 2022-06-14  622  
ee88d363d15617 Peter Zijlstra 2022-06-14  623  		op = insn.opcode.bytes[0];
ee88d363d15617 Peter Zijlstra 2022-06-14  624  		if (op == JMP32_INSN_OPCODE)
ee88d363d15617 Peter Zijlstra 2022-06-14  625  			dest = addr + insn.length + insn.immediate.value;
ee88d363d15617 Peter Zijlstra 2022-06-14  626  
15e67227c49a57 Peter Zijlstra 2022-06-14  627  		DPRINTK("return thunk at: %pS (%px) len: %d to: %pS",
15e67227c49a57 Peter Zijlstra 2022-06-14  628  			addr, addr, insn.length,
15e67227c49a57 Peter Zijlstra 2022-06-14  629  			addr + insn.length + insn.immediate.value);
15e67227c49a57 Peter Zijlstra 2022-06-14  630  
15e67227c49a57 Peter Zijlstra 2022-06-14  631  		len = patch_return(addr, &insn, bytes);
15e67227c49a57 Peter Zijlstra 2022-06-14  632  		if (len == insn.length) {
15e67227c49a57 Peter Zijlstra 2022-06-14  633  			DUMP_BYTES(((u8*)addr),  len, "%px: orig: ", addr);
15e67227c49a57 Peter Zijlstra 2022-06-14  634  			DUMP_BYTES(((u8*)bytes), len, "%px: repl: ", addr);
15e67227c49a57 Peter Zijlstra 2022-06-14  635  			text_poke_early(addr, bytes, len);
15e67227c49a57 Peter Zijlstra 2022-06-14  636  		}
15e67227c49a57 Peter Zijlstra 2022-06-14  637  	}
15e67227c49a57 Peter Zijlstra 2022-06-14  638  }
f43b9876e857c7 Peter Zijlstra 2022-06-27  639  #else
f43b9876e857c7 Peter Zijlstra 2022-06-27  640  void __init_or_module noinline apply_returns(s32 *start, s32 *end) { }
f43b9876e857c7 Peter Zijlstra 2022-06-27  641  #endif /* CONFIG_RETHUNK */
f43b9876e857c7 Peter Zijlstra 2022-06-27  642  

:::::: The code at line 613 was first introduced by commit
:::::: ee88d363d15617ff50ac24fab0ffec11113b2aeb x86,static_call: Use alternative RET encoding

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Borislav Petkov <bp@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
