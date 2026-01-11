Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26C491C3C08
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 20:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768164902; cv=none; b=b73g1r2wXVk92Kg4k2TS45KeOiwAUHUHYvtwMHdvNzLRdkIxn9QZV1ELSGbt4mfTFoUGvz4J83K6Peuh1ogluyKlo4oeuUWco8HjoJFVCcFGqkDfKWnO1iPqFfbfLvoJHaoG8jmc1ytq03Dphx49+BHPsQAmBRQWgLFjFlCKXRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768164902; c=relaxed/simple;
	bh=azs1KeAwl/jOwE0Um03liCx5f9eIs2ftpl4R+vKv6O0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BfjDfSI/2BTdanpHdcqbttpjJPgkgHjivZAIKlgb2UfAcdE17w1oALryeQw2ZpUDeRUhzeh4yth9FlgxmeBiACsZjOAdtIiIEwfYogjzmhjJW0qm9cF6XYXEmSj0FzXpUAIa229dlguHVAYdzM4C5yi9oaJZGIAxbYdVfz4N63Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwgLokhC; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwgLokhC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768164901; x=1799700901;
  h=date:from:to:cc:subject:message-id;
  bh=azs1KeAwl/jOwE0Um03liCx5f9eIs2ftpl4R+vKv6O0=;
  b=PwgLokhCGQvhTkA2vttJ/6KIbN2k+rmzJ4rB9O4ogY+7DFMzOPh3kmQ4
   QVlC1078xk3mu11NWns6kg2L9SYR4s/vlNN22BVr+XHeMmUEo49kNPTpL
   p3pZH4LPvm6xFRnoUmpK2U5859ZU0Is/oqTfODZ3grBWP5Tkpz36RlN/v
   Xc0SSqgsKH2AZFO/ft+Sn4XepGtjzRezXE+NCJRFRvWBwt6mHxGveRhIA
   LFXBZ8w+WNjtqdjdLBTmO1dh5LwT//oZG+Hck4XSKzrkktKgwfALROm93
   CgxTVjO9ueI9Yk4+sDYSkDUfI5vz+icXZPFSJPXwgYFU7kiG97yf4d70Y
   Q==;
X-CSE-ConnectionGUID: /Jgp9ms/SfCRizkEe6dXjg==
X-CSE-MsgGUID: UtOIpuElShC8fF/OG8yH9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69349112"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69349112"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 12:55:00 -0800
X-CSE-ConnectionGUID: WP7RanmIRyapg5mr5SkDXQ==
X-CSE-MsgGUID: WcgF09mnRfO4qlqmJ19KsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203941795"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2026 12:54:59 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf2Se-00000000Ch2-3KPJ;
	Sun, 11 Jan 2026 20:54:56 +0000
Date: Mon, 12 Jan 2026 04:54:55 +0800
From: kernel test robot <lkp@intel.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 4952/5095]
 arch/loongarch/net/bpf_jit.c:1322:14: error: implicit declaration of function
 '__bpf_address_lookup'; did you mean 'bpf_address_lookup'?
Message-ID: <202601120429.Bvdp1mP1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
commit: 90914704bb11e24b42bd368b91e4a1e69d42e72c [4952/5095] Merge branch 'mm-nonmm-unstable' of https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
config: loongarch-randconfig-002-20260112 (https://download.01.org/0day-ci/archive/20260112/202601120429.Bvdp1mP1-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120429.Bvdp1mP1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120429.Bvdp1mP1-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/loongarch/net/bpf_jit.c: In function 'bpf_arch_text_poke':
>> arch/loongarch/net/bpf_jit.c:1322:14: error: implicit declaration of function '__bpf_address_lookup'; did you mean 'bpf_address_lookup'? [-Wimplicit-function-declaration]
    1322 |         if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
         |              ^~~~~~~~~~~~~~~~~~~~
         |              bpf_address_lookup


vim +1322 arch/loongarch/net/bpf_jit.c

9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1305  
ae4a3160d19cd1 Menglong Dong 2025-11-18  1306  int bpf_arch_text_poke(void *ip, enum bpf_text_poke_type old_t,
ae4a3160d19cd1 Menglong Dong 2025-11-18  1307  		       enum bpf_text_poke_type new_t, void *old_addr,
ae4a3160d19cd1 Menglong Dong 2025-11-18  1308  		       void *new_addr)
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1309  {
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1310  	int ret;
ae4a3160d19cd1 Menglong Dong 2025-11-18  1311  	bool is_call;
73721d8676771c Chenghao Duan 2025-12-31  1312  	unsigned long size = 0;
73721d8676771c Chenghao Duan 2025-12-31  1313  	unsigned long offset = 0;
73721d8676771c Chenghao Duan 2025-12-31  1314  	void *image = NULL;
73721d8676771c Chenghao Duan 2025-12-31  1315  	char namebuf[KSYM_NAME_LEN];
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1316  	u32 old_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1317  	u32 new_insns[LOONGARCH_LONG_JUMP_NINSNS] = {[0 ... 4] = INSN_NOP};
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1318  
3d770bd11b9430 Hengqi Chen   2025-10-02  1319  	/* Only poking bpf text is supported. Since kernel function entry
3d770bd11b9430 Hengqi Chen   2025-10-02  1320  	 * is set up by ftrace, we rely on ftrace to poke kernel functions.
3d770bd11b9430 Hengqi Chen   2025-10-02  1321  	 */
73721d8676771c Chenghao Duan 2025-12-31 @1322  	if (!__bpf_address_lookup((unsigned long)ip, &size, &offset, namebuf))
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1323  		return -ENOTSUPP;
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1324  
73721d8676771c Chenghao Duan 2025-12-31  1325  	image = ip - offset;
73721d8676771c Chenghao Duan 2025-12-31  1326  
73721d8676771c Chenghao Duan 2025-12-31  1327  	/* zero offset means we're poking bpf prog entry */
73721d8676771c Chenghao Duan 2025-12-31  1328  	if (offset == 0) {
73721d8676771c Chenghao Duan 2025-12-31  1329  		/* skip to the nop instruction in bpf prog entry:
73721d8676771c Chenghao Duan 2025-12-31  1330  		 * move t0, ra
73721d8676771c Chenghao Duan 2025-12-31  1331  		 * nop
73721d8676771c Chenghao Duan 2025-12-31  1332  		 */
73721d8676771c Chenghao Duan 2025-12-31  1333  		ip = image + LOONGARCH_INSN_SIZE;
73721d8676771c Chenghao Duan 2025-12-31  1334  	}
73721d8676771c Chenghao Duan 2025-12-31  1335  
ae4a3160d19cd1 Menglong Dong 2025-11-18  1336  	is_call = old_t == BPF_MOD_CALL;
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1337  	ret = emit_jump_or_nops(old_addr, ip, old_insns, is_call);
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1338  	if (ret)
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1339  		return ret;
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1340  
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1341  	if (memcmp(ip, old_insns, LOONGARCH_LONG_JUMP_NBYTES))
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1342  		return -EFAULT;
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1343  
ae4a3160d19cd1 Menglong Dong 2025-11-18  1344  	is_call = new_t == BPF_MOD_CALL;
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1345  	ret = emit_jump_or_nops(new_addr, ip, new_insns, is_call);
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1346  	if (ret)
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1347  		return ret;
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1348  
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1349  	mutex_lock(&text_mutex);
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1350  	if (memcmp(ip, new_insns, LOONGARCH_LONG_JUMP_NBYTES))
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1351  		ret = larch_insn_text_copy(ip, new_insns, LOONGARCH_LONG_JUMP_NBYTES);
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1352  	mutex_unlock(&text_mutex);
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1353  
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1354  	return ret;
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1355  }
9fbd18cf4c69f5 Chenghao Duan 2025-08-05  1356  

:::::: The code at line 1322 was first introduced by commit
:::::: 73721d8676771c6c7b06d4e636cc053fc76afefd LoongArch: BPF: Enhance the bpf_arch_text_poke() function

:::::: TO: Chenghao Duan <duanchenghao@kylinos.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
