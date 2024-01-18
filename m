Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B25924B40
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 14:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705589662; cv=none; b=B4VcxMDOrvhfHCm3ak8ZeLbZ0zAuU4lRhkvrFKvjMQrOp/rFkGk1tc21PG6emzW1ViBlSOvcqN75IdP9zZ9hKVPJ8v718qt00318Vf9CCyzlnSh0zbn2ECArGzikbxOSbtV/qQL8YWbE1BoyB8ug4/L+XVwc7b/oqqLWFuwQS/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705589662; c=relaxed/simple;
	bh=6T29mlB1hgc62DKh8mMcQUFuchxbv0HaK/GYUQmhz+M=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=At7DKm0X8W5NutkHohRtGNHUc1pUcgxvjHQUkd2z2+N1BsVNdaqcDp3bs/bGdGsrAa/f6Yl0cpDhRzzX0W0pZqb+TX1IA0zxoTXEoTm3maDktQIvsEGFP6u8GhmOl//nRpExI00gJpjUc5MnAiurfjhuyVJDDXsXidT/LWpYdk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RbzkUacg; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RbzkUacg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705589661; x=1737125661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6T29mlB1hgc62DKh8mMcQUFuchxbv0HaK/GYUQmhz+M=;
  b=RbzkUacgLFN8VDl7kIUijixJ+u5cWbC0JDveGulS6xFKQv5hyeTxXQQc
   k4H+ILXmVd9tFyPWdfQJK94A+hD+nbdkTe7wOOudx4P6eZmFe40OJRPsh
   XM2ZRLsKTMaZWrqsBH9Rau4J5n9LvtU1gUn5Xwqh5V2kdK13OgQu+QjZw
   9Zddav2Jej4jI7iH1/X4CQBIVALl2/hxNu8da4BjPidBQW5GQG/JbTS1E
   TV+AgF+zdvc9OeF1eVyEaj19GLR06rLBKOoHlVIoNkJzOlliZA3wjRmXe
   GUrKqqPnk9lPRd1Nn0ZRoASgleiYtM3U1w74oi5rVN8Fm2ABiIHc2vvn0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="397628473"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="397628473"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 06:54:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="26781710"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jan 2024 06:54:18 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQTma-00033g-26;
	Thu, 18 Jan 2024 14:54:16 +0000
Date: Thu, 18 Jan 2024 22:53:56 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 13537/13783] arch/parisc/kernel/smp.c:369:17:
 sparse: sparse: cast truncates bits from constant value (aabbccdd11223344
 becomes 11223344)
Message-ID: <202401182236.k7vm9ww7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2863b714f3ad0a9686f2de1b779228ad8c7a8052
commit: e8d2fac59ea8f3dca39aef74c40f487f3b56713b [13537/13783] parisc: Runtime unalignment testcase
config: parisc-randconfig-r121-20240118 (https://download.01.org/0day-ci/archive/20240118/202401182236.k7vm9ww7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240118/202401182236.k7vm9ww7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401182236.k7vm9ww7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/parisc/kernel/smp.c:369:17: sparse: sparse: cast truncates bits from constant value (aabbccdd11223344 becomes 11223344)
>> arch/parisc/kernel/smp.c:370:17: sparse: sparse: cast truncates bits from constant value (a0b0c0d01020304 becomes 1020304)

vim +369 arch/parisc/kernel/smp.c

   351	
   352		/* wait until last booting CPU has started. */
   353		while (cpu_now_booting)
   354			;
   355	
   356		/* Let _start know what logical CPU we're booting
   357		** (offset into init_tasks[],cpu_data[])
   358		*/
   359		cpu_now_booting = cpuid;
   360	
   361		/* 
   362		** boot strap code needs to know the task address since
   363		** it also contains the process stack.
   364		*/
   365		smp_init_current_idle_task = idle ;
   366		mb();
   367	
   368		printk(KERN_INFO "Releasing cpu %d now, hpa=%lx  vector %x\n", cpuid, p->hpa, PAGE0->vec_rendz);
 > 369		t2[0] = 0xaabbccdd11223344;
 > 370		t2[1] = 0x0a0b0c0d01020304;
   371		asm("nop ! nop ! nop" : : : "memory");
   372		asm volatile("ldw 1(%1),%0" : "=r" (i) : "r"(&t2) : "memory");
   373		printk("VAL1 %04x\n", i);
   374		asm volatile("ldw 2(%1),%0" : "=r" (i) : "r"(&t2) : "memory");
   375		printk("VAL2 %04x\n", i);
   376		asm volatile("ldw 3(%1),%0" : "=r" (i) : "r"(&t2) : "memory");
   377		printk("VAL3 %04x\n", i);
   378		asm volatile("ldw 4(%1),%0" : "=r" (i) : "r"(&t2) : "memory");
   379		printk("VAL4 %04x\n", i);
   380		// asm("b,n ." : : : "memory");
   381	
   382		/*
   383		** This gets PDC to release the CPU from a very tight loop.
   384		**
   385		** From the PA-RISC 2.0 Firmware Architecture Reference Specification:
   386		** "The MEM_RENDEZ vector specifies the location of OS_RENDEZ which 
   387		** is executed after receiving the rendezvous signal (an interrupt to 
   388		** EIR{0}). MEM_RENDEZ is valid only when it is nonzero and the 
   389		** contents of memory are valid."
   390		*/
   391		gsc_writel(TIMER_IRQ - CPU_IRQ_BASE, p->hpa);
   392		mb();
   393	
   394		/* 
   395		 * OK, wait a bit for that CPU to finish staggering about. 
   396		 * Slave will set a bit when it reaches smp_cpu_init().
   397		 * Once the "monarch CPU" sees the bit change, it can move on.
   398		 */
   399		for (timeout = 0; timeout < 10000; timeout++) {
   400			if(cpu_online(cpuid)) {
   401				/* Which implies Slave has started up */
   402				cpu_now_booting = 0;
   403				goto alive ;
   404			}
   405			udelay(100);
   406			barrier();
   407		}
   408		printk(KERN_CRIT "SMP: CPU:%d is stuck.\n", cpuid);
   409		return -1;
   410	
   411	alive:
   412		/* Remember the Slave data */
   413		smp_debug(100, KERN_DEBUG "SMP: CPU:%d came alive after %ld _us\n",
   414			cpuid, timeout * 100);
   415		return 0;
   416	}
   417	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
