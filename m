Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FBB18CBE1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Apr 2026 05:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777007257; cv=none; b=Xj5KsxpenIyxsULNDsvH9susS5c2UlPWJTCceyhHBFGKHtNUukgEdR1qVK3mNKmLDLKtQ9XfJqTDcJOfEble0RhTZSSycOoBJ784QPT0teiU704hEtm028du0Qoyxfy1yRW5yrPBo9dDvAeLd6+NqKhNwDvk6vD+/yR2PC2dKIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777007257; c=relaxed/simple;
	bh=sZ2WcIZ11o3Tq2XlPphzusxiALHfiEs5dtO0S+iax5c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=mBo/2E9+feGzl2c+W8Q20BLKFFVuu0ELFubGuWs/coKB4Fq/ivQlkzqhvYijzNez/BN2upXqaovMEIiQjnUVxi/Yja335VWtZ1nDFjkWEoj+N87JTdGSrShcFwKi/G2Dd/DoexKaCbg/jqGndxwcGvVaWo+4l7hcFzM1Id9npS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A6HryYT5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A6HryYT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777007255; x=1808543255;
  h=date:from:to:cc:subject:message-id;
  bh=sZ2WcIZ11o3Tq2XlPphzusxiALHfiEs5dtO0S+iax5c=;
  b=A6HryYT5nCX7UtUJg/oEG/P7hQPi6OWCfXblRak75iHDPIgPXvuk9D6Q
   Mk72AetpD4HitkgULOFp7YEOANRFdN67EkTrO3oTYYDkbkb/ovW4O0PdP
   OcSF7ChlH2olF/lvBaiGvshq2OG4GiYAPKcZRtjNmmq4/0HAoDqzLTizw
   oN7G0aC0FnJibd9CEJFzcWp6bx2YqmHkUvpsfFiXted5MWVBVPNB6EOcz
   5MUCY6NjgFDc/tvO10q873nqs+d+oa9DzoTCnvOM5JgixMb81A7XqtSfY
   nO4KFAOoZ+JnzJByw8pMZ9WwlDOma9Nidb7z2++Om055vs8/bJBfsUs0f
   Q==;
X-CSE-ConnectionGUID: EnpbXtaIQ4erzinIXcVqwQ==
X-CSE-MsgGUID: RrbAV5J7RHG7RFVfDZbW4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77865204"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="77865204"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2026 22:07:34 -0700
X-CSE-ConnectionGUID: tCGlk0THRj+orh7O+Exgcw==
X-CSE-MsgGUID: 3qiA50kPQl+0cyJqd7wlfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="226319377"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Apr 2026 22:07:32 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wG8lG-000000005DI-0zuu;
	Fri, 24 Apr 2026 05:07:30 +0000
Date: Fri, 24 Apr 2026 13:07:24 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 226/226]
 arch/x86/kernel/traps.c:176:46: warning: format specifies type 'unsigned
 long' but the argument has type 'void *'
Message-ID: <202604241234.8v2Al3xw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Idan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   54c19d6b7e51605d6caa9bd066d4445feb4cffcb
commit: e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf [226/226] ANDROID: Add kiwi_fault_logging kernel parameter
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20260424/202604241234.8v2Al3xw-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5bac06718f502014fade905512f1d26d578a18f3)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604241234.8v2Al3xw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241234.8v2Al3xw-lkp@intel.com/

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
