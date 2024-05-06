Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB3215533A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 May 2024 23:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715037695; cv=none; b=gIgx50M1znPXgqhXX7ZUpbclsQu1m0dqFPDep9ESJXVtZb0F2t4RvW053aCrlULxhsqSRUhWhYBOTO725Fv48iqdJgSFJkOQVov0ZZmx0ArRx1bM3osHLGtASkmjDsD/f5517v5u/MKOUVUwik3qKzPJ84rzEhQ8YRTLiVu38/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715037695; c=relaxed/simple;
	bh=1Hc4biOajDkM4/9CHtsha1vLg2+encEV0dSHcd2yqdc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MnBAvmLVhFk199qKA6VsaFLDquYg8uM9IKewNa+5okiAjfYonEuNV7St/UEZI9N4uHPZ/916jmqCNTw8vJjVjbQ/NW1aoJBzfoa9X3h0dUz1WkzgUrSnTcNVgos+0LdjnHmpDdrMTVYuLa9k+oOwMC86ej7ulxHvCYAexDJ4mUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1vaFfVU; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1vaFfVU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715037693; x=1746573693;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Hc4biOajDkM4/9CHtsha1vLg2+encEV0dSHcd2yqdc=;
  b=F1vaFfVUsqRjP66tBtsjge/Z6tC7Z+HQtpugbNEw4wwMK3nxkZOjL3Bk
   PRJx4LMyn58bCWIOPCY2Y1WM8lAy71UE1x/L1yn+Lbl8AJotIraJsBRZ1
   ASz9bKDC+pa6E6wD1YtNr/Pj1L39oMaA8yafgY+PIQiYVtxIO6U2Qqjyw
   P/Wyp99n0y1T+YKb7rX1P2LXkm6DycT5jKt0mpBJSoFijC/Kzni6V8s5X
   fLRSojj0Vl3bXm2YuAAStGBEZo51BbpxAjTVtHJCirkjqaOqsE1CY4QHp
   iXpYY2HSwegdToaCR+/SGPJjK0jAxz5nOm5k3XgV1IS5SfmreroGqp9VK
   w==;
X-CSE-ConnectionGUID: BiNk0CcoRhOHXB57tfLP4g==
X-CSE-MsgGUID: AxrT3m+jSbuZl29nAyScSA==
X-IronPort-AV: E=McAfee;i="6600,9927,11065"; a="10690157"
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="10690157"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2024 16:21:07 -0700
X-CSE-ConnectionGUID: vSsWYLa0Tgq8WaLivZZPag==
X-CSE-MsgGUID: 7hMHIhdkQuiwTMdVLOIHuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,259,1708416000"; 
   d="scan'208";a="32894121"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 May 2024 16:21:07 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s47do-00017R-1y;
	Mon, 06 May 2024 23:21:04 +0000
Date: Tue, 7 May 2024 07:20:22 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:execmem/x86-rox/rfc-v2 21/25]
 arch/x86/kernel/alternative.c:742:33: warning: initialization of 'void *'
 from 'int' makes pointer from integer without a cast
Message-ID: <202405070715.5Gh4xAfD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git execmem/x86-rox/rfc-v2
head:   0caa8ac5e8f2f6de2e75cd2ddd552e8756779944
commit: 4527045f6e1892edac12176b8d82094c35427cdf [21/25] x86/module: perpare module loading for ROX allocations of text
config: x86_64-buildonly-randconfig-006-20240507 (https://download.01.org/0day-ci/archive/20240507/202405070715.5Gh4xAfD-lkp@intel.com/config)
compiler: gcc-11 (Ubuntu 11.4.0-4ubuntu1) 11.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240507/202405070715.5Gh4xAfD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405070715.5Gh4xAfD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/alternative.c: In function 'alt_replace_call':
   arch/x86/kernel/alternative.c:417:24: error: implicit declaration of function 'module_writable_address'; did you mean 'mce_usable_address'? [-Werror=implicit-function-declaration]
     417 |         u8 *wr_instr = module_writable_address(mod, instr);
         |                        ^~~~~~~~~~~~~~~~~~~~~~~
         |                        mce_usable_address
   arch/x86/kernel/alternative.c:417:24: warning: initialization of 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
   arch/x86/kernel/alternative.c: In function 'apply_alternatives':
   arch/x86/kernel/alternative.c:500:26: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     500 |                 wr_instr = module_writable_address(mod, instr);
         |                          ^
   arch/x86/kernel/alternative.c:503:32: warning: assignment to 'u8 *' {aka 'unsigned char *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     503 |                 wr_replacement = module_writable_address(mod, replacement);
         |                                ^
   arch/x86/kernel/alternative.c: In function 'apply_retpolines':
>> arch/x86/kernel/alternative.c:742:33: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     742 |                 void *wr_addr = module_writable_address(mod, addr);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/alternative.c: In function 'apply_returns':
   arch/x86/kernel/alternative.c:824:33: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     824 |                 void *wr_addr = module_writable_address(mod, addr);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kernel/alternative.c: In function 'apply_seal_endbr':
   arch/x86/kernel/alternative.c:908:33: warning: initialization of 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     908 |                 void *wr_addr = module_writable_address(mod, addr);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +742 arch/x86/kernel/alternative.c

   731	
   732	/*
   733	 * Generated by 'objtool --retpoline'.
   734	 */
   735	void __init_or_module noinline apply_retpolines(s32 *start, s32 *end,
   736							struct module *mod)
   737	{
   738		s32 *s;
   739	
   740		for (s = start; s < end; s++) {
   741			void *addr = (void *)s + *s;
 > 742			void *wr_addr = module_writable_address(mod, addr);
   743			struct insn insn;
   744			int len, ret;
   745			u8 bytes[16];
   746			u8 op1, op2;
   747	
   748			ret = insn_decode_kernel(&insn, wr_addr);
   749			if (WARN_ON_ONCE(ret < 0))
   750				continue;
   751	
   752			op1 = insn.opcode.bytes[0];
   753			op2 = insn.opcode.bytes[1];
   754	
   755			switch (op1) {
   756			case CALL_INSN_OPCODE:
   757			case JMP32_INSN_OPCODE:
   758				break;
   759	
   760			case 0x0f: /* escape */
   761				if (op2 >= 0x80 && op2 <= 0x8f)
   762					break;
   763				fallthrough;
   764			default:
   765				WARN_ON_ONCE(1);
   766				continue;
   767			}
   768	
   769			DPRINTK(RETPOLINE, "retpoline at: %pS (%px) len: %d to: %pS",
   770				addr, addr, insn.length,
   771				addr + insn.length + insn.immediate.value);
   772	
   773			len = patch_retpoline(addr, &insn, bytes);
   774			if (len == insn.length) {
   775				optimize_nops(bytes, len);
   776				DUMP_BYTES(RETPOLINE, ((u8*)wr_addr),  len, "%px: orig: ", addr);
   777				DUMP_BYTES(RETPOLINE, ((u8*)bytes), len, "%px: repl: ", addr);
   778				text_poke_early(wr_addr, bytes, len);
   779			}
   780		}
   781	}
   782	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
