Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EFE3382F4
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 21:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783977257; cv=none; b=WUSD4dOUh6VSirxzO7J18bJRImpm8Ijt0FSBJoUhBsIsjLiP/Ts7usFRufNFmRvAQTpeNfF0nNG2z4W6t2ykti1C56PGvvQhTAFER1K5YWcabnLImh+kBemqwvqGATmnHJmI37GNRBONYygnTdJdzy9JgAcZyq15pGm5YJts1DY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783977257; c=relaxed/simple;
	bh=Ga4jP/Jq039WIE2eBET2EJY8edehhZ0auFwjv8M6uFQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=k8qmFOQag1xrFsUG33zioqWPZ2L3FpaBvg8fudeQHn4LnM+Z8OqzP74HyZXdl5sM431C3uyxTfA958deQE50Bnb6+PgFT/yRx+R5kv4oFkumDbkhNij/iRhvYCNMakUddq5VzwwwATG5aNAPn+NH1p9/r+5WJcl3tODO2A/5bJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N09MWDh5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N09MWDh5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783977254; x=1815513254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ga4jP/Jq039WIE2eBET2EJY8edehhZ0auFwjv8M6uFQ=;
  b=N09MWDh53UzlnbbvO+WM0RU40u0GAEzkoIPsv9m7pwpBCP4Tinycp0Li
   yDI4Z2BAV379FOImVls9NOLI0/2Ssv7nsRGEv4R94BKVz4y+nTYAuztH1
   8fqkkPbNqKB94oVPz+i/3OH/ZdP+gSeRKrMC6vqrHL4x0ulbLUbqUg3je
   dTeSslbSZveyS212+FvLtYI2vqV+JkYB1DOiGozI70JxxH9FP/LjmK2bU
   gdhQJaWst77B/CCteqcz2gUwm5Eqyh3sfCx5smt9C+wsmMZvwSWM7tZ/e
   xkKeSjh9SYrDEiO0GMKs1BVQpIDQk5JmjAKTkh/ZnUvqtFY314tgoEEdt
   g==;
X-CSE-ConnectionGUID: A3bCBvhYSB+WAX55B1PzSg==
X-CSE-MsgGUID: nBz2z88/TxSGm//YzD56kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84644239"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84644239"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jul 2026 14:14:14 -0700
X-CSE-ConnectionGUID: Leq4e+uFSvm3EuIXMZ6t+g==
X-CSE-MsgGUID: 2S1xmC1hSmeJjq94a3rovQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 13 Jul 2026 14:14:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wjNxk-00000000M4B-1SDb;
	Mon, 13 Jul 2026 21:13:30 +0000
Date: Tue, 14 Jul 2026 05:11:52 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Sven Schnelle <svens@linux.ibm.com>,
 Radu Rendec <radu@rendec.net>, Jinjie Ruan <ruanjinjie@huawei.com>,
 "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 "Philippe =?utf-8?Q?Mathieu-Daud=C3=A9"?= <philmd@oss.qualcomm.com>
Subject: [tip:core/entry 9/17] arch/s390/kernel/syscall.c:109:
 Warning: missing closing `"'
Message-ID: <202607140539.UayzjKCy-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git core/entry
head:   fb419d53f2619e29bf4f96613d9a614e1c263736
commit: 05a194d8bd005e0887a1e089bbbbd2e1a641638f [9/17] s390/syscall: Use enter_from_user_mode_randomize_stack()
config: s390-randconfig-001-20260714 (https://download.01.org/0day-ci/archive/20260714/202607140539.UayzjKCy-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260714/202607140539.UayzjKCy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607140539.UayzjKCy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/s390/kernel/syscall.c: Assembler messages:
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
>> arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:109: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   arch/s390/kernel/syscall.c:114: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:208: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:213: Warning: missing closing `"'
   include/linux/irq-entry-common.h:226: Warning: missing closing `"'


vim +109 arch/s390/kernel/syscall.c

56e62a73702836 Sven Schnelle   2020-11-21   95  
a0f2a8d0515251 Heiko Carstens  2025-03-10   96  void noinstr __do_syscall(struct pt_regs *regs, int per_trap)
56e62a73702836 Sven Schnelle   2020-11-21   97  {
56e62a73702836 Sven Schnelle   2020-11-21   98  	unsigned long nr;
56e62a73702836 Sven Schnelle   2020-11-21   99  
05a194d8bd005e Thomas Gleixner 2026-07-07  100  	enter_from_user_mode_randomize_stack(regs);
05a194d8bd005e Thomas Gleixner 2026-07-07  101  
a0f2a8d0515251 Heiko Carstens  2025-03-10  102  	regs->psw = get_lowcore()->svc_old_psw;
a0f2a8d0515251 Heiko Carstens  2025-03-10  103  	regs->int_code = get_lowcore()->svc_int_code;
a0f2a8d0515251 Heiko Carstens  2025-03-10  104  	update_timer_sys();
a0f2a8d0515251 Heiko Carstens  2025-03-10  105  	if (cpu_has_bear())
a0f2a8d0515251 Heiko Carstens  2025-03-10  106  		current->thread.last_break = regs->last_break;
a0f2a8d0515251 Heiko Carstens  2025-03-10  107  	local_irq_enable();
a0f2a8d0515251 Heiko Carstens  2025-03-10  108  	regs->orig_gpr2 = regs->gprs[2];
a0f2a8d0515251 Heiko Carstens  2025-03-10 @109  	if (unlikely(per_trap))

:::::: The code at line 109 was first introduced by commit
:::::: a0f2a8d05152512633b256459e9aceb7e588f372 s390/syscall: Merge __do_syscall() and do_syscall()

:::::: TO: Heiko Carstens <hca@linux.ibm.com>
:::::: CC: Vasily Gorbik <gor@linux.ibm.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
