Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45EB6FB0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Jan 2024 05:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705641229; cv=none; b=sm6zYFWxoKR2GknKekF4RYZ+BwGGae9dvCxymeEbr/Z3FepWfA4jUB7xnF1JCJgcBXgzeKJ946omDR+F3yTMLKar1PTogYUGZzU5XlbxYA8H0fnBCEyDLZtZnRP15LCyUfqOd8slTECoXHSn7//ZfnGys59iWTR8DAVG/ghvXkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705641229; c=relaxed/simple;
	bh=3fmGR9lnuiX44/7oLfSfCYhG/ypRa/UCxsnHXuPbJFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mRjYq5sTk6NyuHjKbjiIa1QS6gCzSe9bs7hgNsCto6CZU6Uy5zNSoRZ08sR2/Hl0yemUImJ08HwgbYNtV+9VTS5dnWdpNly25lb0I5u1xNsmk3k58K1m9wMC+frrN7XG4k2nKEDhHxzrGyUlZ7i0hIm5qcwzctU4qYFJ6UJ3mf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K/8f+qBl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K/8f+qBl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705641227; x=1737177227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3fmGR9lnuiX44/7oLfSfCYhG/ypRa/UCxsnHXuPbJFM=;
  b=K/8f+qBlIYChcA/n7XKXHYEk3LmPLs1kUEXa9AbYdn1Q9KJAm47ecTET
   ur3VX8rUTuMWFbK+AxCiJWBdcYqe3Dmq/s7w+wNhRtYvRk36G4S1KGYDn
   3X91bxy7OVXLygVfZnaEbu2JztbfJpbdiZfC2eX+171E2EB45dS3xguzo
   2OucnXV8RUisFJo8iUJ/P7j02vAQCIa5zTVhK9jZNkZso1XrWlkQM6uux
   eRVRaLVYotYGwF74CwuPiAl17ZuVXxySeuX219buqo2xeuBszuixigEMz
   ZKYO/rPu9ty+C1meMEpfg/6m6z16adw4Mf/JCN+vfxfDBHG3OyRwUuip3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="8062144"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="8062144"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 21:13:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="855230781"
X-IronPort-AV: E=Sophos;i="6.05,204,1701158400"; 
   d="scan'208";a="855230781"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 18 Jan 2024 21:13:44 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQhCI-0003eo-0o;
	Fri, 19 Jan 2024 05:13:42 +0000
Date: Fri, 19 Jan 2024 13:12:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1823/2432]
 arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it
 ought to be
Message-ID: <202401191329.q4EWAhse-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2e018278a1c987a70fec748cda0909af70d20977
commit: 491a30c1b02f57568ba90e2d7e98b76b6f89ce7d [1823/2432] nmi: backtrace: Allow runtime arch specific override
config: loongarch-allnoconfig (https://download.01.org/0day-ci/archive/20240119/202401191329.q4EWAhse-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401191329.q4EWAhse-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401191329.q4EWAhse-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/irq.h:23,
                    from arch/loongarch/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from kernel/panic.c:14:
   include/linux/nmi.h: In function 'trigger_all_cpu_backtrace':
>> arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:160:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     160 |         return arch_trigger_cpumask_backtrace(cpu_online_mask, -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_allbutcpu_cpu_backtrace':
>> arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:165:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     165 |         return arch_trigger_cpumask_backtrace(cpu_online_mask, exclude_cpu);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_cpumask_backtrace':
>> arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:170:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     170 |         return arch_trigger_cpumask_backtrace(mask, -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_single_cpu_backtrace':
>> arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:175:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     175 |         return arch_trigger_cpumask_backtrace(cpumask_of(cpu), -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/panic.c: In function '__warn':
   kernel/panic.c:666:17: warning: function '__warn' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
     666 |                 vprintk(args->fmt, args->args);
         |                 ^~~~~~~
   In file included from kernel/panic.c:31:
   include/linux/nmi.h: In function 'trigger_all_cpu_backtrace':
>> include/linux/nmi.h:161:1: warning: control reaches end of non-void function [-Wreturn-type]
     161 | }
         | ^
--
   In file included from include/linux/irq.h:23,
                    from arch/loongarch/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/interrupt.h:11,
                    from include/linux/kernel_stat.h:9,
                    from include/linux/cgroup.h:26,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from kernel/cpu.c:27:
   include/linux/nmi.h: In function 'trigger_all_cpu_backtrace':
>> arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:160:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     160 |         return arch_trigger_cpumask_backtrace(cpu_online_mask, -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_allbutcpu_cpu_backtrace':
>> arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:165:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     165 |         return arch_trigger_cpumask_backtrace(cpu_online_mask, exclude_cpu);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_cpumask_backtrace':
>> arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:170:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     170 |         return arch_trigger_cpumask_backtrace(mask, -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_single_cpu_backtrace':
>> arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:175:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     175 |         return arch_trigger_cpumask_backtrace(cpumask_of(cpu), -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/irq.h:23,
                    from arch/loongarch/include/asm/hardirq.h:10,
                    from include/linux/hardirq.h:11,
                    from include/linux/highmem.h:12,
                    from kernel/sched/core.c:9:
   include/linux/nmi.h: In function 'trigger_all_cpu_backtrace':
>> arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:160:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     160 |         return arch_trigger_cpumask_backtrace(cpu_online_mask, -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_allbutcpu_cpu_backtrace':
>> arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:165:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     165 |         return arch_trigger_cpumask_backtrace(cpu_online_mask, exclude_cpu);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_cpumask_backtrace':
>> arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:170:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     170 |         return arch_trigger_cpumask_backtrace(mask, -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/nmi.h: In function 'trigger_single_cpu_backtrace':
>> arch/loongarch/include/asm/irq.h:42:40: error: void value not ignored as it ought to be
      42 | #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
   include/linux/nmi.h:175:16: note: in expansion of macro 'arch_trigger_cpumask_backtrace'
     175 |         return arch_trigger_cpumask_backtrace(cpumask_of(cpu), -1);
         |                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/sched/core.c:54:
   include/linux/nmi.h:176:1: warning: control reaches end of non-void function [-Wreturn-type]
     176 | }
         | ^


vim +42 arch/loongarch/include/asm/irq.h

0603839b18f4fb Huacai Chen      2022-05-31  41  
0603839b18f4fb Huacai Chen      2022-05-31 @42  #define arch_trigger_cpumask_backtrace arch_trigger_cpumask_backtrace
8d539b84f1e347 Douglas Anderson 2023-08-04  43  void arch_trigger_cpumask_backtrace(const struct cpumask *mask, int exclude_cpu);
0603839b18f4fb Huacai Chen      2022-05-31  44  

:::::: The code at line 42 was first introduced by commit
:::::: 0603839b18f4fb3bffa82515efcf5b02084505ef LoongArch: Add exception/interrupt handling

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
