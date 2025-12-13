Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31A521E091
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 06:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765606992; cv=none; b=VrOBXJ0WDmiOLgC0syxgHCgtJU2iuIA7ox4zm2YtMct8LfaoKVNLqSNrZVZfZTUnLSRQuI6Ec77J+a4GREePW1ARUrWRaKVpIYsEPxuWB+7ta1eCsQOF57HjlEcZ6QLupHffTjRasJ0kDyBSznt3Fiion5K1uG2HGJXX02X3ZWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765606992; c=relaxed/simple;
	bh=Eeraoc1leck0LCzeZS7+yp0L9rQK+zmMd6jEn6WN+50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mc64HCHTbDUIxYgoPvbhlCWpWxgdOt1IfYnSuFcTTj2485oPnwiBGf9rq2TpVuGhQKI6iihzpdBCBLOr0G8F5c/hrDDr2X9/RA74yeHVyLhxZHOS1j+DEohp3YTAJEYhawiZ4yXL7DBy8jMsYGYK7zwjychVaMh/likbYJkmA6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZwUBW2Nj; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZwUBW2Nj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765606991; x=1797142991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Eeraoc1leck0LCzeZS7+yp0L9rQK+zmMd6jEn6WN+50=;
  b=ZwUBW2Nj9PPZbUhnTR3ft8/TOrHyBiApfof/oLzRE52s7HeArCSgBaLu
   mE7g+Wn5RSx4qPVuvwPT2bzy8oDp7RIAkqcRIs1WcyjmzOSNxrKL1EIuk
   s6kGzkpXR+HCvOZZ4ow06qQkN6u+CfaOPxbBoiQ/BK3QvgXOWt28qv+00
   KiqaUIvQwpiUJ2f2mavaIMLrhN3cJHRjmueKWqaWDExp3Pz3UxKdYWvkE
   oey+PofokfE94TeY12eZr5ADvS1lIw1z9sK6TJkWkfIh3ij0gc0W4ETsV
   chgdArSiOQ6KhRE9z+iR/DvDVVUujHdrvZLzhLXE/jBgdkBr30m0b6cSz
   A==;
X-CSE-ConnectionGUID: OqFXNUvgRZi8O0bBfhiNoA==
X-CSE-MsgGUID: EkWy+FEIR9WvoyzMFxwP/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="85195462"
X-IronPort-AV: E=Sophos;i="6.21,145,1763452800"; 
   d="scan'208";a="85195462"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 22:23:09 -0800
X-CSE-ConnectionGUID: np5+7B6nRN6xcSCR0GIDsw==
X-CSE-MsgGUID: x5eP89kxRbmlDRL8FDVQjQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Dec 2025 22:23:08 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUJ21-000000007A5-44kW;
	Sat, 13 Dec 2025 06:23:05 +0000
Date: Sat, 13 Dec 2025 14:22:22 +0800
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine/base 2/3] arch/x86/net/bpf_jit_comp.c:1684:13:
 warning: 'emit_coro_switch_stack_to_ctx' defined but not used
Message-ID: <202512131450.f6t1Asku-lkp@intel.com>
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
config: x86_64-rhel-9.4-kunit (https://download.01.org/0day-ci/archive/20251213/202512131450.f6t1Asku-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131450.f6t1Asku-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131450.f6t1Asku-lkp@intel.com/

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
