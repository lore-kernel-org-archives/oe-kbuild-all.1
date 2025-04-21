Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F412921421B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Apr 2025 10:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745230998; cv=none; b=rHuMr122G4ACOZX+Fbqc/VnRtIxilsaKCFR5uXMyZ7R9514xztAEnjUFTVdy6gWM1PbqyenxinIKSQ9y8L3WzSfaiOWS1GehdauujgyEdTLC2M+7ooaw4RlRaf6yaci/a0babc0RS5uAu4GJMLupUDNlh344cpQITn4qB7MoSWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745230998; c=relaxed/simple;
	bh=B1v27f2RsDKd98MWjQIVkEUEfqmfgQ7L6bLh3dUy5z0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=htcsJ0UJprGP70BYr4rW6Saj+bMt3jEajxWg9dPpzLplWw87kYiRhaNjMi/svnaNTlu19iTqkjDtyDyZh6fKr8I0n8g2wQuwco+SbTuK651DXWqrLSKifZSJw/Ma8rxTBu/JlrfISAZRSfygqv64O56B6iG8wS7Mv8xdoXI+IYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a809qLcz; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a809qLcz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745230996; x=1776766996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B1v27f2RsDKd98MWjQIVkEUEfqmfgQ7L6bLh3dUy5z0=;
  b=a809qLczP+2bdraHsFrl3oe+EqhayeteJ4iK3fP619WnVI0zuecqlIMI
   xysESityR21vJWRxTvFhzemJU0zrkRB3Py2XyLgOb2QSjFT8XM11wr968
   O531WOsy8DlIwxYJKjeIC790eCMLVfVXUfcOZfuXHZ2eGxEFoSzHZ1c6p
   /zbLqRHUoNkA+pFbOapKm79yfpO0tNKsD08AcAeeHjExi2/Gh2VRzVaId
   2XruDtQ1J9NMMSWpiIusST5cErosebgsaEIqN+CxOxv5xgZUOLSmU19a/
   V+UGlBcJKwq5gGT8/SsNHEnOT2p7N8vaKUKPeknULnumKOgjXmdfrtUQj
   g==;
X-CSE-ConnectionGUID: K13mHYZ6RMSC2kicD3Kngw==
X-CSE-MsgGUID: HP9uXfOiRiahphKYURmR+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11409"; a="46881884"
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="46881884"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2025 03:23:15 -0700
X-CSE-ConnectionGUID: 8sGdrmjXSxy49+LM8FUKGQ==
X-CSE-MsgGUID: HWJXYjemQrWkcWy0/ld+XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,227,1739865600"; 
   d="scan'208";a="131441407"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 21 Apr 2025 03:23:14 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u6oIx-00003H-2L;
	Mon, 21 Apr 2025 10:23:11 +0000
Date: Mon, 21 Apr 2025 18:23:03 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:intel-lkp 18/33]
 arch/x86/include/asm/msr.h:97:44: error: 'struct pt_regs' has no member
 named 'ip'
Message-ID: <202504211816.JY9nMKkY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git intel-lkp
head:   131ffeea431fd9676ffe1b938303cfc8fb614e59
commit: 308ef9e64cf0346758ba6460c3462575ef70d04d [18/33] x86/extable: Add support for immediate form MSR instructions
config: um-allyesconfig (https://download.01.org/0day-ci/archive/20250421/202504211816.JY9nMKkY-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250421/202504211816.JY9nMKkY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504211816.JY9nMKkY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/accel/habanalabs/common/habanalabs_ioctl.c:20:
   arch/x86/include/asm/msr.h: In function 'get_msr_insn_info':
>> arch/x86/include/asm/msr.h:97:44: error: 'struct pt_regs' has no member named 'ip'
      97 |         *is_imm_insn = !memcmp((void *)regs->ip, msr_imm_insn_prefix, sizeof(msr_imm_insn_prefix));
         |                                            ^~
   arch/x86/include/asm/msr.h:107:37: error: 'struct pt_regs' has no member named 'ip'
     107 |                 return *(u32 *)(regs->ip + 5);
         |                                     ^~
>> arch/x86/include/asm/msr.h:109:33: error: 'struct pt_regs' has no member named 'cx'
     109 |                 return (u32)regs->cx;
         |                                 ^~
   drivers/accel/habanalabs/common/habanalabs_ioctl.c: In function 'time_sync_info':
   drivers/accel/habanalabs/common/habanalabs_ioctl.c:328:30: error: implicit declaration of function 'rdtsc' [-Werror=implicit-function-declaration]
     328 |         time_sync.tsc_time = rdtsc();
         |                              ^~~~~
   cc1: some warnings being treated as errors


vim +97 arch/x86/include/asm/msr.h

    80	
    81	/*
    82	 * Called only from an MSR fault handler, the instruction pointer points to
    83	 * the MSR access instruction that caused the fault.
    84	 */
    85	static __always_inline u32 get_msr_insn_info(struct pt_regs *regs, bool *is_imm_insn)
    86	{
    87		/*
    88		 * To maintain consistency with existing RDMSR and WRMSR(NS) instructions,
    89		 * the register operand for immediate form MSR instructions is ALWAYS encoded
    90		 * as RAX in <asm/msr.h> for reading or writing the MSR value.
    91		 *
    92		 * A full decoder for immediate form MSR instructions appears excessive.
    93		 */
    94	#ifdef CONFIG_X86_64
    95		const u8 msr_imm_insn_prefix[] = { 0xc4, 0xe7 };
    96	
  > 97		*is_imm_insn = !memcmp((void *)regs->ip, msr_imm_insn_prefix, sizeof(msr_imm_insn_prefix));
    98	#else
    99		*is_imm_insn = false;
   100	#endif
   101	
   102		if (*is_imm_insn)
   103			/*
   104			 * The 32-bit immediate specifying a MSR is encoded into
   105			 * byte 5 ~ 8 of an immediate form MSR instruction.
   106			 */
   107			return *(u32 *)(regs->ip + 5);
   108		else
 > 109			return (u32)regs->cx;
   110	}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
