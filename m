Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70EAE21A420
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 19:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755977430; cv=none; b=EDJUmpe6VNUaYRdyBaWjXyMQWas6pLUhjJNfIVvihA58Kc+NepzfwwJqB6u1+adHn+72Xr2gOZ0uM3B/6J2HnLY0bSelvz0ZRrFwv6K0d5tD35IBbRaDqJ4zhk54kwdeONtjKOOCTsJNE5PaAXz99tnjHRb9lNhkmd7lQAKuYOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755977430; c=relaxed/simple;
	bh=0AZQjp50Z7VgnHTtWx/7PwNTi30Hd2viR9ctQJkAOcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e6Cs9iQdl1nEUVbEPaHorOFtORl0A1uASa3jxuOiQuhHlgdPMCAxlG1+SLFDthpuJ829oFNdYJUx7ZxrBDXQsDLkJvlBfjdr8EENLs2//WFDdfKMICc3nnx0ox+Ag09bMWFYjLkIhXeOly+uy/k0LfBnUkegX7qtPA8gCph7H/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JfQ9dsjQ; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JfQ9dsjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755977428; x=1787513428;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0AZQjp50Z7VgnHTtWx/7PwNTi30Hd2viR9ctQJkAOcY=;
  b=JfQ9dsjQAk2p16yt/fGMPDh7eP7utm4XSpHlRR2GZBd+j3PIDUo7PxuW
   uCYxuXxj2mGBLuXi8HCeva55v6R/N/FR+UABnOFXW2GCqJtWNGqWHbyj1
   8a3HLcSHu30yT/O+KhstmBo7+t0AOYYhiayDuKn/TC5wj8Y70v/YfCm6z
   S2T/UB/4f/qwQxN1579BXek4+Zzb8A5YlmUTxQsRg8DY6svVdm+H7yvJE
   CR2DHhE0+a1G4w/t3DHR372e8fEVu4LsP67OLSHfBpoFIeD/h2qbSH/Sd
   Vp7hU/NIFmlWeIn1rmTgzY/G38F06NnJJGG9+oPlPsRChUmoIFm9jQM3x
   g==;
X-CSE-ConnectionGUID: sJ6Iw+pKRb+fACQuwfMTGA==
X-CSE-MsgGUID: 9D9tLXipSPif7ZE0iPx+aA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="45821274"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="45821274"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 12:30:27 -0700
X-CSE-ConnectionGUID: aMITWa+HRfa2y/ZMfOMovw==
X-CSE-MsgGUID: Fizq3vWyQCS0z4ezqL6mRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="206118789"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 23 Aug 2025 12:30:25 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uptwV-000MXL-0Q;
	Sat, 23 Aug 2025 19:30:23 +0000
Date: Sun, 24 Aug 2025 03:29:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jesse Taube <jesse@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_trace_support_v1 43/75]
 arch/riscv/kernel/kgdb.c:38:31: error: incompatible integer to pointer
 conversion passing 'unsigned int' to parameter of type 'ulong *' (aka
 'unsigned long *')
Message-ID: <202508240308.mRkftCfO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   753d28977ce73716ed8f186d94b13af7a08101ff
commit: a653ea6f954f636e74d310dd8a1a7fe3719df8cc [43/75] riscv: Add insn.c, consolidate instruction decoding
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20250824/202508240308.mRkftCfO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240308.mRkftCfO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240308.mRkftCfO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/kgdb.c:38:31: error: incompatible integer to pointer conversion passing 'unsigned int' to parameter of type 'ulong *' (aka 'unsigned long *') [-Wint-conversion]
      38 |         error = get_insn(regs, addr, stepped_opcode);
         |                                      ^~~~~~~~~~~~~~
   arch/riscv/include/asm/insn.h:555:54: note: passing argument to parameter 'r_insn' here
     555 | int get_insn(struct pt_regs *regs, ulong epc, ulong *r_insn);
         |                                                      ^
   1 error generated.


vim +38 arch/riscv/kernel/kgdb.c

    25	
    26	static int do_single_step(struct pt_regs *regs)
    27	{
    28		/* Determine where the target instruction will send us to */
    29		unsigned long addr, insn;
    30		int error = get_insn(regs, regs->epc, &insn);
    31	
    32		if (error)
    33			return error;
    34	
    35		addr = get_step_address(regs, insn);
    36	
    37		/* Store the op code in the stepped address */
  > 38		error = get_insn(regs, addr, stepped_opcode);
    39		if (error)
    40			return error;
    41	
    42		stepped_address = addr;
    43	
    44		/* Replace the op code with the break instruction */
    45		error = copy_to_kernel_nofault((void *)stepped_address,
    46					   arch_kgdb_ops.gdb_bpt_instr,
    47					   BREAK_INSTR_SIZE);
    48		/* Flush and return */
    49		if (!error) {
    50			flush_icache_range(addr, addr + BREAK_INSTR_SIZE);
    51			kgdb_single_step = 1;
    52			atomic_set(&kgdb_cpu_doing_single_step,
    53				   raw_smp_processor_id());
    54		} else {
    55			stepped_address = 0;
    56			stepped_opcode = 0;
    57		}
    58		return error;
    59	}
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
