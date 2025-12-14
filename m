Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1CBB13B7A3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 22:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765752473; cv=none; b=nMrp+o/B211W0TP4k4r86UAQmOcO8RVo5DCzOWI/YQBdIWXhRqVRirMqAGliRbLE7Ch75T/Uytsps//qgen81iY7DAf+2RnvoPyobxXzPA9SU8utQ19tRTiIO1pJ5DBSA5LmVn7x1o7ItUpHYg4C7vLAMkrJQeUlbqEFDuglZY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765752473; c=relaxed/simple;
	bh=LW9uBqrAGW7ZNy/GUHC7pjrKM37ycelPfUBCpoHuWJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TJZZlSIuuZnx3OnJplGdCowJ4GQiWJBlkUcZ7Qj0mDPnVR9dwx0Eq3dulB9TDnoG4z3cbHFBc3xeGrOMPIxZ1TiYwn1dL3WbpdMr0EEGET8dpHENPrCStTfCiex6u5hbQMxfbV+BS9z24JQwBlsOLG0rDpY2OW4DJIkFwU4ItDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MORjWdkb; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MORjWdkb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765752472; x=1797288472;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LW9uBqrAGW7ZNy/GUHC7pjrKM37ycelPfUBCpoHuWJs=;
  b=MORjWdkblYqAEbk2pRUsw4lAJaRacNuzXnhwcbIRLqLpQaEQ+idJJEu2
   3CfxMERTPOOTcLLPbbvroQadtGTBCsm17dCEOpzkgeHNLtQ0+NBF6YQ0e
   zBNHQwNDGTdoRvXC3qC0nFziYfmbkE+T+rIlFc1RqmI4Kp2Q8Gqb6E3qS
   j0wjtJsKGU+IyfqeuOTq7ttK75OerrnEkKQbSxkvBsCPxEg66rECFhPeA
   l+FdD+EppYPoIth7bOgsq5e55ojdp0+cARygCu/D8nIey4SHQACofnEsS
   muHe51JaFcd6b6hjLe3B8/5PH3REZNsm72+pSyyYBuAFbmd7UWkIA5V+D
   Q==;
X-CSE-ConnectionGUID: wmATZfmeRxalJSmC1y3C3w==
X-CSE-MsgGUID: 7mg3rRvySVupfgMwc/Qm1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="78296375"
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="78296375"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 14:47:51 -0800
X-CSE-ConnectionGUID: SVDltHJjQGWWzo0lONcbXg==
X-CSE-MsgGUID: J+VHc3W7RHir/wB+lZkRuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="234968000"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 14 Dec 2025 14:47:50 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUusV-000000002U8-1njj;
	Sun, 14 Dec 2025 22:47:47 +0000
Date: Sun, 14 Dec 2025 23:47:42 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine/base 2/3] arch/x86/net/bpf_jit_comp.c:1684:13:
 warning: 'emit_coro_switch_stack_to_ctx' defined but not used
Message-ID: <202512142315.a77jwBsU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kkdwivedi/linux coroutine/base
head:   3d1468dcf813bc71d425b7ce656a6877d98684e9
commit: 1c28bfd0bf1dd14f86e6858fe6f4ca67ae4b18ab [2/3] Wire up the JIT
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251214/202512142315.a77jwBsU-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512142315.a77jwBsU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512142315.a77jwBsU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/net/bpf_jit_comp.c:1684:13: warning: 'emit_coro_switch_stack_to_ctx' defined but not used [-Wunused-function]
    1684 | static void emit_coro_switch_stack_to_ctx(u8 **pprog, u8 ctx_reg)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> arch/x86/net/bpf_jit_comp.c:1666:13: warning: 'emit_coro_stack_restore_rsp_from_r11' defined but not used [-Wunused-function]
    1666 | static void emit_coro_stack_restore_rsp_from_r11(u8 **pprog, bool check_underflow)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/emit_coro_switch_stack_to_ctx +1684 arch/x86/net/bpf_jit_comp.c

  1665	
> 1666	static void emit_coro_stack_restore_rsp_from_r11(u8 **pprog, bool check_underflow)
  1667	{
  1668		u8 *prog = *pprog;
  1669		if (check_underflow) {
  1670			EMIT3(0x4C, 0x89, 0xDB);
  1671			EMIT3(0x48, 0x81, 0xE3);
  1672			EMIT(0xFFFFF000, 4);
  1673			EMIT3(0x48, 0x8B, 0x1B);
  1674			EMIT3(0x48, 0x81, 0xFB);
  1675			EMIT((u32)PRIV_STACK_GUARD_VAL, 4);
  1676			EMIT2(0x75, 0x02);
  1677			EMIT2(0xEB, 0x01);
  1678			EMIT1(0xCC);
  1679		}
  1680		EMIT3(0x4C, 0x89, 0xDC);
  1681		*pprog = prog;
  1682	}
  1683	
> 1684	static void emit_coro_switch_stack_to_ctx(u8 **pprog, u8 ctx_reg)
  1685	{
  1686		u8 *prog = *pprog;
  1687		u8 ctx_reg_enc;
  1688		ctx_reg_enc = reg2hex[ctx_reg];
  1689		EMIT3(0x49, 0x89, 0xE3);
  1690		if (ctx_reg_enc >= 8) {
  1691			EMIT3(add_2mod(0x48, BPF_REG_FP, ctx_reg), 0x8D, add_2reg(0x80, BPF_REG_FP, ctx_reg));
  1692		} else {
  1693			EMIT3(0x48, 0x8D, add_1reg(0x80, ctx_reg_enc));
  1694		}
  1695		EMIT(0x2000, 4);
  1696		if (ctx_reg_enc >= 8) {
  1697			EMIT3(add_2mod(0x48, BPF_REG_FP, ctx_reg), 0x89, add_2reg(0xC0, BPF_REG_FP, ctx_reg));
  1698		} else {
  1699			EMIT3(0x48, 0x89, add_1reg(0xC0 + (reg2hex[BPF_REG_FP] << 3), ctx_reg_enc));
  1700		}
  1701		*pprog = prog;
  1702	}
  1703	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
