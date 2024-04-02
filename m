Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130DD14005
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 03:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712026880; cv=none; b=bY9Jlm0lkvpAVbuoX98k8g5b4dWCy6e0j7cDfA9gMHoZCFj6P0MacM5L1ZSpk1itEUyaO5m552Gz2L04rxNq+1BmrRyzLKPL+xDiXYJ6iglhXxmbrFcx8eapJc4OhVxnmJdvd5p6np5//JMejTy5y6sAhqS6qWGd8bfYKA4+Izc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712026880; c=relaxed/simple;
	bh=j6FfuQ0fsiKQ+6m75ptfG3b8ljn6PncdXG14jtukqAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nm4im8oTFyT2iyKe9A001DuHfbfXqAjqs80CcMqWxlNzyw4cbYUa1Y3EswJmH91qMeVN7It0IOKlgxvm9ShwMnCDJrKjxLRe6CmJdvcsPytNGFcyON1sd0vCpMz7mnrBizQrGofzI+0r8QGZOxBFQG4PM9VJ0dRTla/FaG990Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hODyC+bu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hODyC+bu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712026878; x=1743562878;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j6FfuQ0fsiKQ+6m75ptfG3b8ljn6PncdXG14jtukqAw=;
  b=hODyC+bu1LVpFPF0Efx4QWMfu4R4hO4fONUPEj2JYPXsmrS2FDVGHg75
   UjygXz7UXLnDiPw925BznbavRMYphmTMFHEOaSwmhjlhcI3IzG23Jxnvb
   YK6MW4UMz8TcHzIr8iq7Jsaapu11S8Ie9QJF7Q4ekG33bMdbz8I4yayER
   ABHPC0TNGG+GWiePkEJdhirhqLbWdliXdzye+cr4Rq11o+CjwAjQz7Ojn
   PHylezhgHYeTqW3RCO7/iZgJWqxDCnYw+B2yS6FXBo1JLCYfo/uDvZ6it
   Zai3y07T+nl3OfzJGmmuHF0oV2TEBUFF6FsUY7pNzhWVso2bhapoppxGb
   A==;
X-CSE-ConnectionGUID: h0ycq5TQRWuShXBHXZm+qg==
X-CSE-MsgGUID: WdogZvpSQW+/dQCfpP8frg==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="17900657"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="17900657"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 20:01:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="55366271"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Apr 2024 20:01:15 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrUOd-0000ov-2k;
	Tue, 02 Apr 2024 03:01:11 +0000
Date: Tue, 2 Apr 2024 11:00:21 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-kiwi-5.10 1/1]
 arch/x86/kernel/traps.c:176:46: warning: format specifies type 'unsigned
 long' but the argument has type 'void *'
Message-ID: <202404021018.BCPSMHid-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf
commit: e4f1f4c9a6f6bdc4ed2f2d6d05fe5cd78af07bdf [1/1] ANDROID: Add kiwi_fault_logging kernel parameter
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20240402/202404021018.BCPSMHid-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240402/202404021018.BCPSMHid-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021018.BCPSMHid-lkp@intel.com/

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
