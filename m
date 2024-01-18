Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FBF63B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705588942; cv=none; b=pHHdx0enMq+GhuPlXjTv8khE/exJcK5T7WY9cgKoPmXIEe39wMp6/GvbjSwqoYnIgEjSOIInBiRwW0YVfTwzZk7Jw+toq1GQ5TLaCAqWphJbyvKHX02KJ3ZDvhJ2EwlI7RRx3kRSvo+TlMwCxPws+o4ex4o8/2U2csEbctwXbpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705588942; c=relaxed/simple;
	bh=UNbMVwx5hr3hYDZf2iYv0vEGZcUxufMHKhx2IWZw80Q=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=eCSt/OdmXLmWkg+7XuUO/XJx33IBpA0YixoF/+5P21/kiRjsVwSX6FO46FD5K/lHkETyaGH5C4d93mGIAFNJH+fugam3E0JI5hCrWuY4Syu5Wa9WhWDeL7G3nKksJZ1F/jnP3fmtbWKgnxQo4WPS+CLSjPNQddLabvxzueXZGZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PBFy4JKm; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PBFy4JKm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705588940; x=1737124940;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UNbMVwx5hr3hYDZf2iYv0vEGZcUxufMHKhx2IWZw80Q=;
  b=PBFy4JKm8Z267i+WjgN0u2/8MWNabVIxRISevH/2qyUm2YJ1RSgJJvSX
   JScbi2mdE9nTFpysfjN9FuFpzTucy8RhWNYxPO5Lmb+KTgM52JrFQEuBE
   W62DNsjIw4RQ91wxyGaBW/z5fVEM0c1jRGgqG+KsHNZdxzdaBae/2TQ8A
   U15uwBwnTkwj4gR8vzuuN0of7J1a8qaj5vBxA4Eajbm/+Y4AJ2kPSr0gv
   LjNWp2GKkWnv7idxobq7dz9XhcMy2AVV2c7gWAw/5gDPJ1jN8YftmtVo9
   oih8WfUAN30k6So6tjPLFMwb/neFBUY4kxIIsemmoWRVJnzpMU474ZySi
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="19059544"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="19059544"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 06:42:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="331095"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Jan 2024 06:42:19 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQTay-000336-1L;
	Thu, 18 Jan 2024 14:42:16 +0000
Date: Thu, 18 Jan 2024 22:42:08 +0800
From: kernel test robot <lkp@intel.com>
To: Helge Deller <deller@gmx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [deller-parisc:for-next-next 7/8] arch/parisc/kernel/smp.c:369:17:
 warning: overflow in conversion from 'long long unsigned int' to 'long int'
 changes value from '12302652056939934532' to '287454020'
Message-ID: <202401182254.JCkTnIjd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next-next
head:   1a4c298f9c76904b34cf9e02cafe2896ce94f8e3
commit: eb90f4b222f70199359552be514982fa3de0c103 [7/8] parisc: Runtime unalignment testcase
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20240118/202401182254.JCkTnIjd-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401182254.JCkTnIjd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401182254.JCkTnIjd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/parisc/kernel/smp.c: In function 'smp_boot_one_cpu':
>> arch/parisc/kernel/smp.c:369:17: warning: overflow in conversion from 'long long unsigned int' to 'long int' changes value from '12302652056939934532' to '287454020' [-Woverflow]
     369 |         t2[0] = 0xaabbccdd11223344;
         |                 ^~~~~~~~~~~~~~~~~~
>> arch/parisc/kernel/smp.c:370:17: warning: overflow in conversion from 'long long int' to 'long int' changes value from '723685415114113796' to '16909060' [-Woverflow]
     370 |         t2[1] = 0x0a0b0c0d01020304;
         |                 ^~~~~~~~~~~~~~~~~~


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
