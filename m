Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ECC6242925
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Nov 2025 07:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761983834; cv=none; b=VbdAK5nzncw/2IiIe88VIEs/473mcaWSzZEr4DSL7DZYTaFZjuxYNJMVSOe6pltZXbeDbKQ8pHtjYaBLSf3f+fCseUsHTvOZFHZLJZolSzdWg/JhoHIQ8+zvqm3Dee4/tv9QtFZchQoLeA8OvsJbIag9njBPLfC+pSBLkbBKDAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761983834; c=relaxed/simple;
	bh=a0mTbq+O8fWj7tP4BYu4dTe/X98ZX6YoOvTbu7GYAI0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eceIZz0SkF0ka/19fD4TLXvv8k3/cSUzHRmYqrHvtxn7knQmDLbpnmHoWdno3k66dI/XPxOtUWL3mSI8n1qQFbUF9L1HrYCrV5UdfTG7qaaznJUVj2pEPyEAPMWO17VlSOzHgEl+DtLdKdviNJECGxMu2U+kIO2N/3w4YoyVzaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KbUHqoyQ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KbUHqoyQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761983832; x=1793519832;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a0mTbq+O8fWj7tP4BYu4dTe/X98ZX6YoOvTbu7GYAI0=;
  b=KbUHqoyQKLyS9/Kqa+W0GPOH7fxLdoOXVnlvCoDCjeeZkm1jZLzo7vqb
   IQZQHbpKEfNRCqWotMoBc100+kI6orL5eEXo296rVaVpdE4JMxn1G5i7i
   jqHuYxk0Am0r/HLM70SorITAzO5IxxIyNQLD7sR2BuIrAdeCSIxj6RnXX
   h2IxZ4SlWJ0taHbpEMjFJipFNgxICowDtytP9Ul1rTWc4aYfUnoA7dgXD
   +6+1zU9kqdL28dbS/NJYVshFqBYmUaOWdKqAyxj0JVQwK2m4qtFR1FZ33
   JaLa5va6FKZQeys2YucOYUnj1b1Nuq+fJLm4aMU88zRaHBNKj3o+UnkAr
   Q==;
X-CSE-ConnectionGUID: 5x3OCV8/QteITRLNXQwx3g==
X-CSE-MsgGUID: JPUJJvUTRou5WdgHfutKnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11599"; a="74814175"
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="74814175"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 00:57:10 -0700
X-CSE-ConnectionGUID: /ZS0nPygRhWgNLlRbC60rw==
X-CSE-MsgGUID: B+BXo5TNSk+eBIuBuHh3MA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,271,1754982000"; 
   d="scan'208";a="191550365"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Nov 2025 00:57:10 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vF6Tz-000O1S-2R;
	Sat, 01 Nov 2025 07:57:07 +0000
Date: Sat, 1 Nov 2025 15:56:50 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: [tglx-devel:rseq/slice 40/75] kernel/entry/common.c:71:29: error:
 implicit declaration of function 'rseq_exit_to_user_mode_restart'; did you
 mean 'arch_exit_to_user_mode_prepare'?
Message-ID: <202511011510.CyQgzIMs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq/slice
head:   bee383449566a64254362dc3ff6a1bfd5bcb6a57
commit: d9113feb93793ab621e1e888ae6ec74aac8848a8 [40/75] rseq: Switch to fast path processing on exit to user
config: arm64-randconfig-r073-20251101 (https://download.01.org/0day-ci/archive/20251101/202511011510.CyQgzIMs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251101/202511011510.CyQgzIMs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511011510.CyQgzIMs-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/current.h:5,
                    from include/linux/sched.h:12,
                    from include/linux/context_tracking.h:5,
                    from include/linux/irq-entry-common.h:5,
                    from kernel/entry/common.c:3:
   kernel/entry/common.c: In function 'exit_to_user_mode_loop':
>> kernel/entry/common.c:71:29: error: implicit declaration of function 'rseq_exit_to_user_mode_restart'; did you mean 'arch_exit_to_user_mode_prepare'? [-Wimplicit-function-declaration]
      71 |                 if (likely(!rseq_exit_to_user_mode_restart(regs)))
         |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^


vim +71 kernel/entry/common.c

    59	
    60	/**
    61	 * exit_to_user_mode_loop - do any pending work before leaving to user space
    62	 * @regs:	Pointer to pt_regs on entry stack
    63	 * @ti_work:	TIF work flags as read by the caller
    64	 */
    65	__always_inline unsigned long exit_to_user_mode_loop(struct pt_regs *regs,
    66							     unsigned long ti_work)
    67	{
    68		for (;;) {
    69			ti_work = __exit_to_user_mode_loop(regs, ti_work);
    70	
  > 71			if (likely(!rseq_exit_to_user_mode_restart(regs)))
    72				return ti_work;
    73			ti_work = read_thread_flags();
    74		}
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
