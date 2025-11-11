Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4E3223DEA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Nov 2025 00:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762821244; cv=none; b=rjprKpRluFChT29YnbG1h5/m3trSgQynhYIpJLKBVEA5HqMj4Kxb100lhJd5kmYiB47LiiM3waWXXNWeAgQjQ5gCgtcKyuttensQpQcbX2sSjK7wCzjZ0j0sc95V0Hd9Drw395Sgk/D0xk7z1R2i9i6vfk2eka20/3oz8p4/v1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762821244; c=relaxed/simple;
	bh=Fx0F0tHtVLMPjcDZqQ4KgWyb6mJqxzHSo8zWixTRLtg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PEcjtfT8YTOc+B7LYaJl2W/rs82BIjvr6EtlM7Wf6Mxy4ejdQDUpEy9sQq3ph90aREMZoLFzagx9AwtKLfdetr4STI7e8VECcwnZlJAfLmYqd75ookCjDrLn7bQDnivAKq2mz7JAx5i4D9m9wJE/hhBdF735zzJdsSV2Tbj6DLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mb38Ta0u; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mb38Ta0u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762821242; x=1794357242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fx0F0tHtVLMPjcDZqQ4KgWyb6mJqxzHSo8zWixTRLtg=;
  b=Mb38Ta0uu7OYt4Xe0W7HPGTy9+El4AjLVLYyHtrP2LShaj/sLfSOZczL
   uskpQ/Vy5KUr0Fk64oUoJWMtAXrlmyFGq9X9u0SqsqOJufSuUmBuxkGUq
   kTnLNnGo0PryFx36K3mMojbHcj16WQTGXfJwAxKlxza3XUbRZwU4pzSuP
   xbpUqzndUiGOD7XA120u/Qdj+e72jUt8sEt5gzY7m42MnMsrRpw4sFtOn
   t9KG9geSEvJ5AL+fWoXxs4bcsEIBB+FeYv3aGtVHN5oo0QySOSunqqTWY
   51/zZEMaUx2l18eSmXblI4ckv5rxT5WoP0AQXw5FlXfUhpJ+ADWoBOQyv
   A==;
X-CSE-ConnectionGUID: aTPT2X9NTsqRf3VpRwN6Sg==
X-CSE-MsgGUID: fIBhhWgwQBecgy3RXS3qcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64810368"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64810368"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2025 16:34:02 -0800
X-CSE-ConnectionGUID: SwqVPE8tSKyx+iSwJMT7ow==
X-CSE-MsgGUID: nzZaepNwQHGqDVVpAEXOJw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 10 Nov 2025 16:33:59 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vIcKa-0001A8-2O;
	Tue, 11 Nov 2025 00:33:56 +0000
Date: Tue, 11 Nov 2025 08:33:06 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:x86/bugs 12/12] arch/x86/kernel/static_call.c:77:30:
 error: '__WARN_trap' undeclared
Message-ID: <202511110846.4i2IRYj2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git x86/bugs
head:   ab2670d0a3af9012cda95e696875f0f5baf98564
commit: 73b86a81cd36da4764a01bf51b2a40bb166baaa4 [12/12] x86_64/bug: Inline the UD1
config: i386-allnoconfig (https://download.01.org/0day-ci/archive/20251111/202511110846.4i2IRYj2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251111/202511110846.4i2IRYj2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511110846.4i2IRYj2-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/static_call.c: In function '__static_call_transform':
>> arch/x86/kernel/static_call.c:77:30: error: '__WARN_trap' undeclared (first use in this function)
      77 |                 if (func == &__WARN_trap) {
         |                              ^~~~~~~~~~~
   arch/x86/kernel/static_call.c:77:30: note: each undeclared identifier is reported only once for each function it appears in


vim +/__WARN_trap +77 arch/x86/kernel/static_call.c

    48	
    49	asm (".global __static_call_return\n\t"
    50	     ".type __static_call_return, @function\n\t"
    51	     ASM_FUNC_ALIGN "\n\t"
    52	     "__static_call_return:\n\t"
    53	     ANNOTATE_NOENDBR
    54	     ANNOTATE_RETPOLINE_SAFE
    55	     "ret; int3\n\t"
    56	     ".size __static_call_return, . - __static_call_return \n\t");
    57	
    58	static void __ref __static_call_transform(void *insn, enum insn_type type,
    59						  void *func, bool modinit)
    60	{
    61		const void *emulate = NULL;
    62		int size = CALL_INSN_SIZE;
    63		const void *code;
    64		u8 op, buf[6];
    65	
    66		if ((type == JMP || type == RET) && (op = __is_Jcc(insn)))
    67			type = JCC;
    68	
    69		switch (type) {
    70		case CALL:
    71			func = callthunks_translate_call_dest(func);
    72			code = text_gen_insn(CALL_INSN_OPCODE, insn, func);
    73			if (func == &__static_call_return0) {
    74				emulate = code;
    75				code = &xor5rax;
    76			}
  > 77			if (func == &__WARN_trap) {
    78				emulate = code;
    79				code = &warninsn;
    80			}
    81			break;
    82	
    83		case NOP:
    84			code = x86_nops[5];
    85			break;
    86	
    87		case JMP:
    88			code = text_gen_insn(JMP32_INSN_OPCODE, insn, func);
    89			break;
    90	
    91		case RET:
    92			if (cpu_wants_rethunk_at(insn))
    93				code = text_gen_insn(JMP32_INSN_OPCODE, insn, x86_return_thunk);
    94			else
    95				code = &retinsn;
    96			break;
    97	
    98		case JCC:
    99			if (!func) {
   100				func = __static_call_return;
   101				if (cpu_wants_rethunk())
   102					func = x86_return_thunk;
   103			}
   104	
   105			buf[0] = 0x0f;
   106			__text_gen_insn(buf+1, op, insn+1, func, 5);
   107			code = buf;
   108			size = 6;
   109	
   110			break;
   111		}
   112	
   113		if (memcmp(insn, code, size) == 0)
   114			return;
   115	
   116		if (system_state == SYSTEM_BOOTING || modinit)
   117			return text_poke_early(insn, code, size);
   118	
   119		smp_text_poke_single(insn, code, size, emulate);
   120	}
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
