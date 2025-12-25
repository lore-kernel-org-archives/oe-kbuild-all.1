Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8380D23C8C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 22:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766701416; cv=none; b=TEcIB8E5rTSkoeHCwsld/OB6NS0oeFbeZLWRF9atH/dmLNXuc4n16dQffD96rvzOjwZ4dgBwRM3/0GgdI83GnCws3pFaqnhtqZ2ecWXaNMvzS/UZtD4Un4dkX1AoJ5MvusAGv3Q1ZuApvyQA/FNLmjAnGmSeCdNXZx1tskD/yQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766701416; c=relaxed/simple;
	bh=DdctBkRgKiFxd2eMhJUEAax6qUTxHDk8BIpZZPOS5pQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dAHxszk6eCER0elOKBQH6dVmj9KfN2AzVBfjPnpaBa6nrZKkSisv0dVUSYcoznFyY1UR+ektH0y0CyfMZU+VEWSlBPXFbbpYihDzHQJ0XhmYWgTOl/mOm6CF+Lv1bdvHIc5LLIDB6LTF5X1zF6gIVu3bnwDvUuqpPUDjUirSb9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aChCB9Px; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aChCB9Px"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766701415; x=1798237415;
  h=date:from:to:cc:subject:message-id;
  bh=DdctBkRgKiFxd2eMhJUEAax6qUTxHDk8BIpZZPOS5pQ=;
  b=aChCB9PxwSxkBA54idtsbApk45s38lxEm7CynSTKcYXD6p2aLE+vXHt3
   nl3BaieO0BS0+A8c97aK51C/s+8XcIWOzIjVyJv+T+8dnlNN9bHbcXACz
   dDFPfR00DgwU032wy+fg+jnnEQgMplT960bD40vXgRZ00iT6GqC18RKNu
   NA/i8G/GTgjVXt24dx/5h1M2Lg5zJ+l4fjtxinDtCEb+dWREW+JNpTW5f
   8m92nczff9+M8Q7RuGD3dCQiId+hH1Onk+S41CQ+4qqejtTogOD2e4bJn
   MbIU+4oTijcSLe1oqyRqtmC09AYysye686QDNrjNjOqrkymy52YiPBuRs
   w==;
X-CSE-ConnectionGUID: v0jJVZWcQZOVv6kueYiq3w==
X-CSE-MsgGUID: idQtv103RAGl7f/1lD44kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="71064356"
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="71064356"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 14:23:34 -0800
X-CSE-ConnectionGUID: Uxtn2AkHQWSY5QavJeCbdw==
X-CSE-MsgGUID: W+rBOymnSZuzLNlMhSXdDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,177,1763452800"; 
   d="scan'208";a="199923871"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Dec 2025 14:23:32 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYtk2-000000004VB-0H7B;
	Thu, 25 Dec 2025 22:23:30 +0000
Date: Fri, 26 Dec 2025 06:22:55 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-v3 5/15] arch/x86/include/asm/sync_core.h:33:
 Error: incorrect register `%eax' used with `q' suffix
Message-ID: <202512260600.wvnRppd4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-v3
head:   16f858473d90ca1f50cd701fcaa7a3a7d58c44f7
commit: 7ab00e870d46ca1ce4ddfbc68a9e36149f22ecf0 [5/15] x86/sync_core: Use RIP-relative addressing
config: x86_64-randconfig-161-20251226 (https://download.01.org/0day-ci/archive/20251226/202512260600.wvnRppd4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251226/202512260600.wvnRppd4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512260600.wvnRppd4-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/include/asm/sync_core.h: Assembler messages:
>> arch/x86/include/asm/sync_core.h:33: Error: incorrect register `%eax' used with `q' suffix
>> arch/x86/include/asm/sync_core.h:33: Error: incorrect register `%eax' used with `q' suffix
--
   arch/x86/include/asm/sync_core.h: Assembler messages:
>> arch/x86/include/asm/sync_core.h:33: Error: incorrect register `%eax' used with `q' suffix


vim +33 arch/x86/include/asm/sync_core.h

ac1ab12a3e6e87 Mathieu Desnoyers 2018-01-29   9  
f69ca629d89d65 Ricardo Neri      2020-07-26  10  #ifdef CONFIG_X86_32
0ef8047b737d74 Juergen Gross     2024-11-29  11  static __always_inline void iret_to_self(void)
f69ca629d89d65 Ricardo Neri      2020-07-26  12  {
f69ca629d89d65 Ricardo Neri      2020-07-26  13  	asm volatile (
f69ca629d89d65 Ricardo Neri      2020-07-26  14  		"pushfl\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  15  		"pushl %%cs\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  16  		"pushl $1f\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  17  		"iret\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  18  		"1:"
f69ca629d89d65 Ricardo Neri      2020-07-26  19  		: ASM_CALL_CONSTRAINT : : "memory");
f69ca629d89d65 Ricardo Neri      2020-07-26  20  }
f69ca629d89d65 Ricardo Neri      2020-07-26  21  #else
0ef8047b737d74 Juergen Gross     2024-11-29  22  static __always_inline void iret_to_self(void)
f69ca629d89d65 Ricardo Neri      2020-07-26  23  {
f69ca629d89d65 Ricardo Neri      2020-07-26  24  	unsigned int tmp;
f69ca629d89d65 Ricardo Neri      2020-07-26  25  
f69ca629d89d65 Ricardo Neri      2020-07-26  26  	asm volatile (
f69ca629d89d65 Ricardo Neri      2020-07-26  27  		"mov %%ss, %0\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  28  		"pushq %q0\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  29  		"pushq %%rsp\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  30  		"addq $8, (%%rsp)\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  31  		"pushfq\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  32  		"mov %%cs, %0\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26 @33  		"pushq %q0\n\t"
7ab00e870d46ca Ard Biesheuvel    2023-04-07  34  		"leaq 1f(%%rip), %0\n\t"
7ab00e870d46ca Ard Biesheuvel    2023-04-07  35  		"pushq %q0\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  36  		"iretq\n\t"
f69ca629d89d65 Ricardo Neri      2020-07-26  37  		"1:"
f69ca629d89d65 Ricardo Neri      2020-07-26  38  		: "=&r" (tmp), ASM_CALL_CONSTRAINT : : "cc", "memory");
f69ca629d89d65 Ricardo Neri      2020-07-26  39  }
f69ca629d89d65 Ricardo Neri      2020-07-26  40  #endif /* CONFIG_X86_32 */
f69ca629d89d65 Ricardo Neri      2020-07-26  41  

:::::: The code at line 33 was first introduced by commit
:::::: f69ca629d89d65737537e05308ac531f7bb07d5c x86/cpu: Refactor sync_core() for readability

:::::: TO: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
