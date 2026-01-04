Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F8C2F9DA1
	for <oe-kbuild-all@lists.linux.dev>; Sun,  4 Jan 2026 13:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767532155; cv=none; b=OlsAinjuapkiKDp9Y4E7Y7rO1a4ZnvuXATJslZDJIC31fdkqOT/8v3L4g79UX5GOsNKdEQcQE7mDwkmGeQBgN3/FlAbnCNP5d0hUfRMQEzooNHe/iCkamrOdBwAVk+XlVeE2qaJW192MSaJEOchh3/JyzDr4TRQ8sz8uK8fQDZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767532155; c=relaxed/simple;
	bh=5yr7fzgmMDkpM37h6qtWLMB9xbve4K545Khh1MyPbuI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Uva/otWXtvawJqE+ExAW7SspFkhd6Bgpt4pwFmAxE/qv0VzUGCEAsVguQ5jshGyScDitu+i8SEsSayGhWR6g5YpVrgs3U/lo/K3SeS+6S4L7S9YLGEoh/mlsHfO9sjSesBfN5mvVzTu2lsue5RkscYLg8WzYNtGTRgUb5hNQflU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hgxr09L+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hgxr09L+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767532153; x=1799068153;
  h=date:from:to:cc:subject:message-id;
  bh=5yr7fzgmMDkpM37h6qtWLMB9xbve4K545Khh1MyPbuI=;
  b=Hgxr09L+3hVuxUzQuU6x1o806bhEksG1TOLv630fHXbTyBjeKUOsx8tH
   DVbUrs/Ki899GyhQ514YDPjC8V8xGhC65YEA1+CORRs9wGkL868hFTocd
   pThy/zbCKFYfKlKkQlUwZmuWPutH01N+zvHA5uU9xGr7oUCk2cZY0KpFJ
   MnFWWZTbnnkrb8peL4wjE5KyW9XS+6qMWo23PSeub/rfGve8QA24ue3d5
   z5JllsQhp7mpfGFkBwbeNxpk/3i2seubkJMKETocp1qK/oBnfBTpC6V2O
   gLmYHyrDQIWvC3JD3xsMa/THQw7apTUmGIAuDZwiKDFaNZCnLh7NvXAWL
   Q==;
X-CSE-ConnectionGUID: 1MY92qaoSrO3oKWnSXsvRw==
X-CSE-MsgGUID: RHE9W/RlQgODsB4hQefLHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11659"; a="80375169"
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="80375169"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 05:09:12 -0800
X-CSE-ConnectionGUID: nhsEKGE1RoWYulSBC9fTSg==
X-CSE-MsgGUID: +ts2UamWSBKimbEuz/At2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,201,1763452800"; 
   d="scan'208";a="202210953"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Jan 2026 05:09:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcNr2-000000000Z7-2jmv;
	Sun, 04 Jan 2026 13:09:08 +0000
Date: Sun, 04 Jan 2026 21:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 190/190]
 arch/x86/kernel/traps.c:176:46: warning: format specifies type 'unsigned
 long' but the argument has type 'void *'
Message-ID: <202601042058.0uzjPcUo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Idan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   c9b5876b7945ef9caec188f04f7125b1c01d5a1d
commit: e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf [190/190] ANDROID: Add kiwi_fault_logging kernel parameter
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260104/202601042058.0uzjPcUo-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260104/202601042058.0uzjPcUo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601042058.0uzjPcUo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/traps.c:176:46: warning: format specifies type 'unsigned long' but the argument has type 'void *' [-Wformat]
     175 |             printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
         |                                                                ~~~
     176 |                         current->comm, task_pid_nr(current), str, addr, trapnr, signr,
         |                                                                   ^~~~
>> arch/x86/kernel/traps.c:176:60: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     175 |             printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
         |                                                                                     ~~~
         |                                                                                     %x
     176 |                         current->comm, task_pid_nr(current), str, addr, trapnr, signr,
         |                                                                                 ^~~~~
   arch/x86/kernel/traps.c:177:4: warning: format specifies type 'unsigned long' but the argument has type 'int' [-Wformat]
     175 |             printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
         |                                                                                                ~~~
         |                                                                                                %x
     176 |                         current->comm, task_pid_nr(current), str, addr, trapnr, signr,
     177 |                         sicode, (void *)regs->ip, (void *)regs->sp, error_code);
         |                         ^~~~~~
   3 warnings generated.


vim +176 arch/x86/kernel/traps.c

   170	
   171	static void do_error_trap(struct pt_regs *regs, long error_code, char *str,
   172		unsigned long trapnr, int signr, int sicode, void __user *addr)
   173	{
   174		if (unlikely(kiwi_fault_logging)) {
   175		    printk(KERN_ALERT "%s[%d]: do_error_trap for %s at %lx trapnr %lx signr %lx sicode %lx ip %px sp %px error %lx",
 > 176				current->comm, task_pid_nr(current), str, addr, trapnr, signr,
   177				sicode, (void *)regs->ip, (void *)regs->sp, error_code);
   178		}
   179		RCU_LOCKDEP_WARN(!rcu_is_watching(), "entry code didn't wake RCU");
   180	
   181		if (notify_die(DIE_TRAP, str, regs, error_code, trapnr, signr) !=
   182				NOTIFY_STOP) {
   183			cond_local_irq_enable(regs);
   184			do_trap(trapnr, signr, str, regs, error_code, sicode, addr);
   185			cond_local_irq_disable(regs);
   186		}
   187	}
   188	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
