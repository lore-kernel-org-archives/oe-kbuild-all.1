Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD0E20EF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jan 2023 18:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674240518; x=1705776518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0G0mm+O2UfryZ6lPkR1WU/btBi1uBIjgsgWDjk5w5uI=;
  b=FPu4G0vIWd5bUrV80MEQe8D59gPha42THLUovYzXFaxMrGgPXh99dJa1
   gn1bl+CJJKYuiOZruHaEGHR/P6V0e0AA+zU21sUeQnMOTL0qqPyavYUgs
   eZMhihZYYWVl9kEY5Vx4qBzmtfMk9+YEVfI5d1Th5IKmZQ+PHFB4vY+5Z
   wVSyqxYP6+ooiWblxpMfRQK3yjwgPAiPZJYLnUv/kRWudWBBWO66m2+3V
   EaXft1OtaU2tNm3+ihK6xhA04acPquhS/SgJ/PHMZE+fP0ZEQd1wCAAZe
   rpuVMlRF6S6BBEHf25i2eLgqLT9E6gTE9qg1jUBFCohLxsR0JM6Rl4a6X
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="306023863"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="306023863"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2023 10:48:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="784613257"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; 
   d="scan'208";a="784613257"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Jan 2023 10:48:18 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIwQz-0002p8-09;
	Fri, 20 Jan 2023 18:48:17 +0000
Date: Sat, 21 Jan 2023 02:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/core 2/3] arch/x86/kernel/alternative.c:2083:13:
 error: implicit declaration of function 'is_jcc32'
Message-ID: <202301210252.9WGk4K9U-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/core
head:   2eb791245b6ab0aa1bbc37537adb2b2c87f50651
commit: 13c5d94759ccacddeba3041d8c2c0c967becb5d3 [2/3] x86/alternative: Teach text_poke_bp() to patch Jcc.d32 instructions
config: i386-tinyconfig (https://download.01.org/0day-ci/archive/20230121/202301210252.9WGk4K9U-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git/commit/?id=13c5d94759ccacddeba3041d8c2c0c967becb5d3
        git remote add peterz-queue https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git
        git fetch --no-tags peterz-queue x86/core
        git checkout 13c5d94759ccacddeba3041d8c2c0c967becb5d3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   arch/x86/kernel/alternative.c: In function 'text_poke_loc_init':
>> arch/x86/kernel/alternative.c:2083:13: error: implicit declaration of function 'is_jcc32' [-Werror=implicit-function-declaration]
    2083 |         if (is_jcc32(&insn)) {
         |             ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/is_jcc32 +2083 arch/x86/kernel/alternative.c

  2063	
  2064	static void text_poke_loc_init(struct text_poke_loc *tp, void *addr,
  2065				       const void *opcode, size_t len, const void *emulate)
  2066	{
  2067		struct insn insn;
  2068		int ret, i = 0;
  2069	
  2070		if (len == 6)
  2071			i = 1;
  2072		memcpy((void *)tp->text, opcode+i, len-i);
  2073		if (!emulate)
  2074			emulate = opcode;
  2075	
  2076		ret = insn_decode_kernel(&insn, emulate);
  2077		BUG_ON(ret < 0);
  2078	
  2079		tp->rel_addr = addr - (void *)_stext;
  2080		tp->len = len;
  2081		tp->opcode = insn.opcode.bytes[0];
  2082	
> 2083		if (is_jcc32(&insn)) {
  2084			/*
  2085			 * Map Jcc.d32 onto Jcc.d8 and use len to distinguish.
  2086			 */
  2087			tp->opcode = insn.opcode.bytes[1] - 0x10;
  2088		}
  2089	
  2090		switch (tp->opcode) {
  2091		case RET_INSN_OPCODE:
  2092		case JMP32_INSN_OPCODE:
  2093		case JMP8_INSN_OPCODE:
  2094			/*
  2095			 * Control flow instructions without implied execution of the
  2096			 * next instruction can be padded with INT3.
  2097			 */
  2098			for (i = insn.length; i < len; i++)
  2099				BUG_ON(tp->text[i] != INT3_INSN_OPCODE);
  2100			break;
  2101	
  2102		default:
  2103			BUG_ON(len != insn.length);
  2104		}
  2105	
  2106		switch (tp->opcode) {
  2107		case INT3_INSN_OPCODE:
  2108		case RET_INSN_OPCODE:
  2109			break;
  2110	
  2111		case CALL_INSN_OPCODE:
  2112		case JMP32_INSN_OPCODE:
  2113		case JMP8_INSN_OPCODE:
  2114		case 0x70 ... 0x7f: /* Jcc */
  2115			tp->disp = insn.immediate.value;
  2116			break;
  2117	
  2118		default: /* assume NOP */
  2119			switch (len) {
  2120			case 2: /* NOP2 -- emulate as JMP8+0 */
  2121				BUG_ON(memcmp(emulate, x86_nops[len], len));
  2122				tp->opcode = JMP8_INSN_OPCODE;
  2123				tp->disp = 0;
  2124				break;
  2125	
  2126			case 5: /* NOP5 -- emulate as JMP32+0 */
  2127				BUG_ON(memcmp(emulate, x86_nops[len], len));
  2128				tp->opcode = JMP32_INSN_OPCODE;
  2129				tp->disp = 0;
  2130				break;
  2131	
  2132			default: /* unknown instruction */
  2133				BUG();
  2134			}
  2135			break;
  2136		}
  2137	}
  2138	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
