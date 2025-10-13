Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09012FF642
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 14:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366918; cv=none; b=cGwoFjVXiZY9yDwfV6qfPLEq/IUeDflVldLewicaflRCIlN+CKBE4/AN34mFplqWh1xStKIiWHpUpHeJzFNhizSKZOM5aRTxTeWatjWcmvywHShHTrwEwuXUWi7izoP63I2rQt8Zm+D5LzhwpXjHgM/3fQZvHGazGz4iA0+qfA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366918; c=relaxed/simple;
	bh=O0cFPIU9FrFmoEBJvUiq798d+mYk9yq6tKBCa2Qq8l0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W0LzjQcVkI2llAa9qh0657KjRg9izFOv9thVPdBjh+YYbtGB8ztWsYgqXwPiGkY02UJ35/xiZumQFbkccQG3iYKtTFycSFAZYN+EpAoo17W6o8udFNJonoRsHKUTlQu6jpFFRQ2PFM1NjMYZKl0ciKNbIZU/4UsfrmWIqNOGw44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KQ9DCOnP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KQ9DCOnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760366916; x=1791902916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O0cFPIU9FrFmoEBJvUiq798d+mYk9yq6tKBCa2Qq8l0=;
  b=KQ9DCOnPIVo/gDO7D0TeMdynP4TC53zjCz8CBZlK7KBcYgWCGx4NSIHb
   I/BosUnu2wAtI/x5toH+m2by9OBohby/Nj43H+OLWmR4UgvqDaTiH8KRU
   qEFxbOvj4s6UF4hcpnxyaD3mG7GIIaLi4BZSokmlkoqP63nYvqQCly9Ig
   Ev3uUrj1hcp3+FuD1OiW6UX+hokLMMqdPPyiqfFeGBqZcyyhZlZ0PWpK1
   N1JCueLk1ioD6szLOAO2SPkD+iHSt+18jftCf9jqSJR91IBm/oBPmIjI7
   XG4QxEEMXEgWIhIhyeyfIDxq5NERHZrIQcI6TGxW1nGX+k0kAbiSzsfuG
   A==;
X-CSE-ConnectionGUID: 8TnJgP5CTby/9H4bnhbBsw==
X-CSE-MsgGUID: 8oIAR7TVS7ifMXJw7uY5zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="62542770"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62542770"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 07:48:35 -0700
X-CSE-ConnectionGUID: iMf0t32YS6SS+vTue3FKZw==
X-CSE-MsgGUID: XF/CikcBSUOv1jZzawM2Uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="182039368"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 13 Oct 2025 07:48:34 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v8Jqb-0000Vv-2H;
	Mon, 13 Oct 2025 14:48:32 +0000
Date: Mon, 13 Oct 2025 22:48:20 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:perf/core 1/2] arch/x86/lib/insn-eval.c:1744:39:
 error: 'p' undeclared
Message-ID: <202510132259.qEwcAn1T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   f79c5a964e3aa7636f95ee64ee7d5b4a5ac41426
commit: 0f34f1f5511111bc1a4039e1efadf92432c9339b [1/2] x86/insn,uprobes,alternative: Unify insn_is_nop()
config: x86_64-buildonly-randconfig-001-20251013 (https://download.01.org/0day-ci/archive/20251013/202510132259.qEwcAn1T-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251013/202510132259.qEwcAn1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510132259.qEwcAn1T-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/lib/insn-eval.c:13:
   arch/x86/lib/insn-eval.c: In function 'insn_is_nop':
>> arch/x86/lib/insn-eval.c:1744:39: error: 'p' undeclared (first use in this function)
    1744 |         for_each_insn_prefix(insn, i, p) {
         |                                       ^
   arch/x86/include/asm/insn.h:325:66: note: in definition of macro 'for_each_insn_prefix'
     325 |         for (idx = 0; idx < ARRAY_SIZE(insn->prefixes.bytes) && (prefix = insn->prefixes.bytes[idx]) != 0; idx++)
         |                                                                  ^~~~~~
   arch/x86/lib/insn-eval.c:1744:39: note: each undeclared identifier is reported only once for each function it appears in
    1744 |         for_each_insn_prefix(insn, i, p) {
         |                                       ^
   arch/x86/include/asm/insn.h:325:66: note: in definition of macro 'for_each_insn_prefix'
     325 |         for (idx = 0; idx < ARRAY_SIZE(insn->prefixes.bytes) && (prefix = insn->prefixes.bytes[idx]) != 0; idx++)
         |                                                                  ^~~~~~


vim +/p +1744 arch/x86/lib/insn-eval.c

  1679	
  1680	/*
  1681	 * Recognise typical NOP patterns for both 32bit and 64bit.
  1682	 *
  1683	 * Notably:
  1684	 *  - NOP, but not: REP NOP aka PAUSE
  1685	 *  - NOPL
  1686	 *  - MOV %reg, %reg
  1687	 *  - LEA 0(%reg),%reg
  1688	 *  - JMP +0
  1689	 *
  1690	 * Must not have false-positives; instructions identified as a NOP might be
  1691	 * emulated as a NOP (uprobe) or Run Length Encoded in a larger NOP
  1692	 * (alternatives).
  1693	 *
  1694	 * False-negatives are fine; need not be exhaustive.
  1695	 */
  1696	bool insn_is_nop(struct insn *insn)
  1697	{
  1698		u8 b3 = 0, x3 = 0, r3 = 0;
  1699		u8 b4 = 0, x4 = 0, r4 = 0, m = 0;
  1700		u8 modrm, modrm_mod, modrm_reg, modrm_rm;
  1701		u8 sib = 0, sib_scale, sib_index, sib_base;
  1702		u8 nrex, rex;
  1703		u8 rep = 0;
  1704		int i;
  1705	
  1706		if ((nrex = insn->rex_prefix.nbytes)) {
  1707			rex = insn->rex_prefix.bytes[nrex-1];
  1708	
  1709			r3 = !!X86_REX_R(rex);
  1710			x3 = !!X86_REX_X(rex);
  1711			b3 = !!X86_REX_B(rex);
  1712			if (nrex > 1) {
  1713				r4 = !!X86_REX2_R(rex);
  1714				x4 = !!X86_REX2_X(rex);
  1715				b4 = !!X86_REX2_B(rex);
  1716				m  = !!X86_REX2_M(rex);
  1717			}
  1718	
  1719		} else if (insn->vex_prefix.nbytes) {
  1720			/*
  1721			 * Ignore VEX encoded NOPs
  1722			 */
  1723			return false;
  1724		}
  1725	
  1726		if (insn->modrm.nbytes) {
  1727			modrm = insn->modrm.bytes[0];
  1728			modrm_mod = X86_MODRM_MOD(modrm);
  1729			modrm_reg = X86_MODRM_REG(modrm) + 8*r3 + 16*r4;
  1730			modrm_rm  = X86_MODRM_RM(modrm)  + 8*b3 + 16*b4;
  1731			modrm = 1;
  1732		}
  1733	
  1734		if (insn->sib.nbytes) {
  1735			sib = insn->sib.bytes[0];
  1736			sib_scale = X86_SIB_SCALE(sib);
  1737			sib_index = X86_SIB_INDEX(sib) + 8*x3 + 16*x4;
  1738			sib_base  = X86_SIB_BASE(sib)  + 8*b3 + 16*b4;
  1739			sib = 1;
  1740	
  1741			modrm_rm = sib_base;
  1742		}
  1743	
> 1744		for_each_insn_prefix(insn, i, p) {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
