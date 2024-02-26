Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88347131750
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Feb 2024 21:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708982898; cv=none; b=Iur1d51Fp2PQTJ81d6957byB2K8yPaVZ8LSXIqgw+K2sJVA7B+3ZJMIs9sNLVrnMF6C9Vp/Q0+9xyN8IcuXQ4+sFnvFVyOq3GrzLcTWt+xvY74YrxfOMYMU/2KxCuSZRFRzcL87qQB2x3gXesz1xv1P4m//9nUoVexuQyuVuxUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708982898; c=relaxed/simple;
	bh=WxWCYcehyGRIv9u1FELGMgVAPPYjL+3N4tE+R5dZMRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CrFbq06b7lgTuLh/R8K5guCs5hUU3MbX/1DemAqnw2Mz2Poe49kAleNxIT40YJyBjEqLxYPQmnktvsw48ALKpF5VWt37pApjpX0SOQPwLURpcQ+vTjvKRhBm/PjCnaV7IYphyIuF2Hs9y4Z+JQ/S0/JWuEvOx+kDuQIzuFAScv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M47zGDdf; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M47zGDdf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708982896; x=1740518896;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WxWCYcehyGRIv9u1FELGMgVAPPYjL+3N4tE+R5dZMRs=;
  b=M47zGDdfRXGY96OdS8u2BlR8t59V2SUzFlv+WZV3WVnSYTKh6BTJiARw
   q1ahnn+epsw083yqgyK5FiwKurtnbzZTfBzZF2n61L9ftiLUAiy44zAkQ
   SJ5uvxcaEzl7nEMNz5hzWRmBh5tbQDm1b/h79aQPNE8miUoNT7bxadpmg
   Tq0i4AFoV2ktNTary8jov1ylJZRLmcfS02ZT8u91c/djmDBABzXzpNLBu
   W+p9hm7d7eLbNuvccj46SFb6SygSKp8JWi4vKmXuiLhCjmL2YvOq+aMIj
   iThIOfkEQHzgrenWMeNxwDWl5L6ZwhdrXe2EV1kHs2kjqSJMwF1uQSZzd
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10996"; a="3460709"
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="3460709"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2024 13:28:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,186,1705392000"; 
   d="scan'208";a="11429405"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Feb 2024 13:28:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1reiVo-000AgI-18;
	Mon, 26 Feb 2024 21:27:51 +0000
Date: Tue, 27 Feb 2024 05:26:13 +0800
From: kernel test robot <lkp@intel.com>
To: Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 9092/10236] arch/mips/kernel/mips-mt.c:3207:
 Error: Unable to parse register name $fp
Message-ID: <202402270524.HtRvZbPR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8552c902efe7ef670b6961fb8885b67961aeb629
commit: dd6d29a6148990bb1d39a37c6c2830e6daf9cb46 [9092/10236] MIPS: Implement microMIPS MT ASE helpers
config: mips-randconfig-r034-20221221 (https://download.01.org/0day-ci/archive/20240227/202402270524.HtRvZbPR-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240227/202402270524.HtRvZbPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402270524.HtRvZbPR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/mips-mt.c: Assembler messages:
>> arch/mips/kernel/mips-mt.c:3207: Error: Unable to parse register name $fp
   arch/mips/kernel/mips-mt.c:3210:  Info: macro invoked from here
   {standard input}:3216:   Info: macro invoked from here


vim +3207 arch/mips/kernel/mips-mt.c

b24413180f5600 Greg Kroah-Hartman 2017-11-01    1  // SPDX-License-Identifier: GPL-2.0
41c594ab65fc89 Ralf Baechle       2006-04-05    2  /*
b633648c5ad3cf Ralf Baechle       2014-05-23    3   * General MIPS MT support routines, usable in AP/SP and SMVP.
41c594ab65fc89 Ralf Baechle       2006-04-05    4   * Copyright (C) 2005 Mips Technologies, Inc
41c594ab65fc89 Ralf Baechle       2006-04-05    5   */
41c594ab65fc89 Ralf Baechle       2006-04-05    6  
27a3bbaf4b1e23 Ralf Baechle       2007-02-07    7  #include <linux/device.h>
41c594ab65fc89 Ralf Baechle       2006-04-05    8  #include <linux/kernel.h>
41c594ab65fc89 Ralf Baechle       2006-04-05    9  #include <linux/sched.h>
73bc256d47a232 Paul Gortmaker     2011-07-23   10  #include <linux/export.h>
41c594ab65fc89 Ralf Baechle       2006-04-05   11  #include <linux/interrupt.h>
f72af3cf06370c Yoichi Yuasa       2006-07-04   12  #include <linux/security.h>
41c594ab65fc89 Ralf Baechle       2006-04-05   13  
41c594ab65fc89 Ralf Baechle       2006-04-05   14  #include <asm/cpu.h>
41c594ab65fc89 Ralf Baechle       2006-04-05   15  #include <asm/processor.h>
60063497a95e71 Arun Sharma        2011-07-26   16  #include <linux/atomic.h>
41c594ab65fc89 Ralf Baechle       2006-04-05   17  #include <asm/hardirq.h>
41c594ab65fc89 Ralf Baechle       2006-04-05   18  #include <asm/mmu_context.h>
41c594ab65fc89 Ralf Baechle       2006-04-05   19  #include <asm/mipsmtregs.h>
41c594ab65fc89 Ralf Baechle       2006-04-05   20  #include <asm/r4kcache.h>
41c594ab65fc89 Ralf Baechle       2006-04-05   21  #include <asm/cacheflush.h>
4666cf018a26d8 Arnd Bergmann      2023-12-04   22  #include <asm/mips_mt.h>
41c594ab65fc89 Ralf Baechle       2006-04-05   23  
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   24  int vpelimit;
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   25  
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   26  static int __init maxvpes(char *str)
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   27  {
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   28  	get_option(&str, &vpelimit);
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   29  
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   30  	return 1;
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   31  }
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   32  
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   33  __setup("maxvpes=", maxvpes);
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   34  
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   35  int tclimit;
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   36  
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   37  static int __init maxtcs(char *str)
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   38  {
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   39  	get_option(&str, &tclimit);
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   40  
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   41  	return 1;
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   42  }
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   43  
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   44  __setup("maxtcs=", maxtcs);
07cc0c9e65d3e2 Ralf Baechle       2007-07-27   45  
41c594ab65fc89 Ralf Baechle       2006-04-05   46  /*
41c594ab65fc89 Ralf Baechle       2006-04-05   47   * Dump new MIPS MT state for the core. Does not leave TCs halted.
41c594ab65fc89 Ralf Baechle       2006-04-05   48   * Takes an argument which taken to be a pre-call MVPControl value.
41c594ab65fc89 Ralf Baechle       2006-04-05   49   */
41c594ab65fc89 Ralf Baechle       2006-04-05   50  
41c594ab65fc89 Ralf Baechle       2006-04-05   51  void mips_mt_regdump(unsigned long mvpctl)
41c594ab65fc89 Ralf Baechle       2006-04-05   52  {
41c594ab65fc89 Ralf Baechle       2006-04-05   53  	unsigned long flags;
41c594ab65fc89 Ralf Baechle       2006-04-05   54  	unsigned long vpflags;
41c594ab65fc89 Ralf Baechle       2006-04-05   55  	unsigned long mvpconf0;
41c594ab65fc89 Ralf Baechle       2006-04-05   56  	int nvpe;
41c594ab65fc89 Ralf Baechle       2006-04-05   57  	int ntc;
41c594ab65fc89 Ralf Baechle       2006-04-05   58  	int i;
41c594ab65fc89 Ralf Baechle       2006-04-05   59  	int tc;
41c594ab65fc89 Ralf Baechle       2006-04-05   60  	unsigned long haltval;
41c594ab65fc89 Ralf Baechle       2006-04-05   61  	unsigned long tcstatval;
41c594ab65fc89 Ralf Baechle       2006-04-05   62  
41c594ab65fc89 Ralf Baechle       2006-04-05   63  	local_irq_save(flags);
41c594ab65fc89 Ralf Baechle       2006-04-05   64  	vpflags = dvpe();
41c594ab65fc89 Ralf Baechle       2006-04-05   65  	printk("=== MIPS MT State Dump ===\n");
41c594ab65fc89 Ralf Baechle       2006-04-05   66  	printk("-- Global State --\n");
41c594ab65fc89 Ralf Baechle       2006-04-05   67  	printk("   MVPControl Passed: %08lx\n", mvpctl);
41c594ab65fc89 Ralf Baechle       2006-04-05   68  	printk("   MVPControl Read: %08lx\n", vpflags);
41c594ab65fc89 Ralf Baechle       2006-04-05   69  	printk("   MVPConf0 : %08lx\n", (mvpconf0 = read_c0_mvpconf0()));
41c594ab65fc89 Ralf Baechle       2006-04-05   70  	nvpe = ((mvpconf0 & MVPCONF0_PVPE) >> MVPCONF0_PVPE_SHIFT) + 1;
41c594ab65fc89 Ralf Baechle       2006-04-05   71  	ntc = ((mvpconf0 & MVPCONF0_PTC) >> MVPCONF0_PTC_SHIFT) + 1;
41c594ab65fc89 Ralf Baechle       2006-04-05   72  	printk("-- per-VPE State --\n");
41c594ab65fc89 Ralf Baechle       2006-04-05   73  	for (i = 0; i < nvpe; i++) {
41c594ab65fc89 Ralf Baechle       2006-04-05   74  		for (tc = 0; tc < ntc; tc++) {
41c594ab65fc89 Ralf Baechle       2006-04-05   75  			settc(tc);
41c594ab65fc89 Ralf Baechle       2006-04-05   76  			if ((read_tc_c0_tcbind() & TCBIND_CURVPE) == i) {
41c594ab65fc89 Ralf Baechle       2006-04-05   77  				printk("  VPE %d\n", i);
d223a86154f8c6 Ralf Baechle       2007-07-10   78  				printk("   VPEControl : %08lx\n",
d223a86154f8c6 Ralf Baechle       2007-07-10   79  				       read_vpe_c0_vpecontrol());
d223a86154f8c6 Ralf Baechle       2007-07-10   80  				printk("   VPEConf0 : %08lx\n",
d223a86154f8c6 Ralf Baechle       2007-07-10   81  				       read_vpe_c0_vpeconf0());
41c594ab65fc89 Ralf Baechle       2006-04-05   82  				printk("   VPE%d.Status : %08lx\n",
41c594ab65fc89 Ralf Baechle       2006-04-05   83  				       i, read_vpe_c0_status());
b012cffe7f6971 Ralf Baechle       2008-07-15   84  				printk("   VPE%d.EPC : %08lx %pS\n",
b012cffe7f6971 Ralf Baechle       2008-07-15   85  				       i, read_vpe_c0_epc(),
b012cffe7f6971 Ralf Baechle       2008-07-15   86  				       (void *) read_vpe_c0_epc());
d223a86154f8c6 Ralf Baechle       2007-07-10   87  				printk("   VPE%d.Cause : %08lx\n",
d223a86154f8c6 Ralf Baechle       2007-07-10   88  				       i, read_vpe_c0_cause());
41c594ab65fc89 Ralf Baechle       2006-04-05   89  				printk("   VPE%d.Config7 : %08lx\n",
41c594ab65fc89 Ralf Baechle       2006-04-05   90  				       i, read_vpe_c0_config7());
41c594ab65fc89 Ralf Baechle       2006-04-05   91  				break; /* Next VPE */
41c594ab65fc89 Ralf Baechle       2006-04-05   92  			}
41c594ab65fc89 Ralf Baechle       2006-04-05   93  		}
41c594ab65fc89 Ralf Baechle       2006-04-05   94  	}
41c594ab65fc89 Ralf Baechle       2006-04-05   95  	printk("-- per-TC State --\n");
41c594ab65fc89 Ralf Baechle       2006-04-05   96  	for (tc = 0; tc < ntc; tc++) {
41c594ab65fc89 Ralf Baechle       2006-04-05   97  		settc(tc);
41c594ab65fc89 Ralf Baechle       2006-04-05   98  		if (read_tc_c0_tcbind() == read_c0_tcbind()) {
41c594ab65fc89 Ralf Baechle       2006-04-05   99  			/* Are we dumping ourself?  */
41c594ab65fc89 Ralf Baechle       2006-04-05  100  			haltval = 0; /* Then we're not halted, and mustn't be */
41c594ab65fc89 Ralf Baechle       2006-04-05  101  			tcstatval = flags; /* And pre-dump TCStatus is flags */
41c594ab65fc89 Ralf Baechle       2006-04-05  102  			printk("  TC %d (current TC with VPE EPC above)\n", tc);
41c594ab65fc89 Ralf Baechle       2006-04-05  103  		} else {
41c594ab65fc89 Ralf Baechle       2006-04-05  104  			haltval = read_tc_c0_tchalt();
41c594ab65fc89 Ralf Baechle       2006-04-05  105  			write_tc_c0_tchalt(1);
41c594ab65fc89 Ralf Baechle       2006-04-05  106  			tcstatval = read_tc_c0_tcstatus();
41c594ab65fc89 Ralf Baechle       2006-04-05  107  			printk("  TC %d\n", tc);
41c594ab65fc89 Ralf Baechle       2006-04-05  108  		}
41c594ab65fc89 Ralf Baechle       2006-04-05  109  		printk("   TCStatus : %08lx\n", tcstatval);
41c594ab65fc89 Ralf Baechle       2006-04-05  110  		printk("   TCBind : %08lx\n", read_tc_c0_tcbind());
b012cffe7f6971 Ralf Baechle       2008-07-15  111  		printk("   TCRestart : %08lx %pS\n",
b012cffe7f6971 Ralf Baechle       2008-07-15  112  		       read_tc_c0_tcrestart(), (void *) read_tc_c0_tcrestart());
41c594ab65fc89 Ralf Baechle       2006-04-05  113  		printk("   TCHalt : %08lx\n", haltval);
41c594ab65fc89 Ralf Baechle       2006-04-05  114  		printk("   TCContext : %08lx\n", read_tc_c0_tccontext());
41c594ab65fc89 Ralf Baechle       2006-04-05  115  		if (!haltval)
41c594ab65fc89 Ralf Baechle       2006-04-05  116  			write_tc_c0_tchalt(0);
41c594ab65fc89 Ralf Baechle       2006-04-05  117  	}
41c594ab65fc89 Ralf Baechle       2006-04-05  118  	printk("===========================\n");
41c594ab65fc89 Ralf Baechle       2006-04-05  119  	evpe(vpflags);
41c594ab65fc89 Ralf Baechle       2006-04-05  120  	local_irq_restore(flags);
41c594ab65fc89 Ralf Baechle       2006-04-05  121  }
41c594ab65fc89 Ralf Baechle       2006-04-05  122  
41c594ab65fc89 Ralf Baechle       2006-04-05  123  static int mt_opt_rpsctl = -1;
41c594ab65fc89 Ralf Baechle       2006-04-05  124  static int mt_opt_nblsu = -1;
982f6ffeeed5ef Ralf Baechle       2009-09-17  125  static int mt_opt_forceconfig7;
41c594ab65fc89 Ralf Baechle       2006-04-05  126  static int mt_opt_config7 = -1;
41c594ab65fc89 Ralf Baechle       2006-04-05  127  
41c594ab65fc89 Ralf Baechle       2006-04-05  128  static int __init rpsctl_set(char *str)
41c594ab65fc89 Ralf Baechle       2006-04-05  129  {
41c594ab65fc89 Ralf Baechle       2006-04-05  130  	get_option(&str, &mt_opt_rpsctl);
41c594ab65fc89 Ralf Baechle       2006-04-05  131  	return 1;
41c594ab65fc89 Ralf Baechle       2006-04-05  132  }
41c594ab65fc89 Ralf Baechle       2006-04-05  133  __setup("rpsctl=", rpsctl_set);
41c594ab65fc89 Ralf Baechle       2006-04-05  134  
41c594ab65fc89 Ralf Baechle       2006-04-05  135  static int __init nblsu_set(char *str)
41c594ab65fc89 Ralf Baechle       2006-04-05  136  {
41c594ab65fc89 Ralf Baechle       2006-04-05  137  	get_option(&str, &mt_opt_nblsu);
41c594ab65fc89 Ralf Baechle       2006-04-05  138  	return 1;
41c594ab65fc89 Ralf Baechle       2006-04-05  139  }
41c594ab65fc89 Ralf Baechle       2006-04-05  140  __setup("nblsu=", nblsu_set);
41c594ab65fc89 Ralf Baechle       2006-04-05  141  
41c594ab65fc89 Ralf Baechle       2006-04-05  142  static int __init config7_set(char *str)
41c594ab65fc89 Ralf Baechle       2006-04-05  143  {
41c594ab65fc89 Ralf Baechle       2006-04-05  144  	get_option(&str, &mt_opt_config7);
41c594ab65fc89 Ralf Baechle       2006-04-05  145  	mt_opt_forceconfig7 = 1;
41c594ab65fc89 Ralf Baechle       2006-04-05  146  	return 1;
41c594ab65fc89 Ralf Baechle       2006-04-05  147  }
41c594ab65fc89 Ralf Baechle       2006-04-05  148  __setup("config7=", config7_set);
41c594ab65fc89 Ralf Baechle       2006-04-05  149  
982f6ffeeed5ef Ralf Baechle       2009-09-17  150  static unsigned int itc_base;
41c594ab65fc89 Ralf Baechle       2006-04-05  151  
41c594ab65fc89 Ralf Baechle       2006-04-05  152  static int __init set_itc_base(char *str)
41c594ab65fc89 Ralf Baechle       2006-04-05  153  {
41c594ab65fc89 Ralf Baechle       2006-04-05  154  	get_option(&str, &itc_base);
41c594ab65fc89 Ralf Baechle       2006-04-05  155  	return 1;
41c594ab65fc89 Ralf Baechle       2006-04-05  156  }
41c594ab65fc89 Ralf Baechle       2006-04-05  157  
41c594ab65fc89 Ralf Baechle       2006-04-05  158  __setup("itcbase=", set_itc_base);
41c594ab65fc89 Ralf Baechle       2006-04-05  159  
41c594ab65fc89 Ralf Baechle       2006-04-05  160  void mips_mt_set_cpuoptions(void)
41c594ab65fc89 Ralf Baechle       2006-04-05  161  {
41c594ab65fc89 Ralf Baechle       2006-04-05  162  	unsigned int oconfig7 = read_c0_config7();
41c594ab65fc89 Ralf Baechle       2006-04-05  163  	unsigned int nconfig7 = oconfig7;
41c594ab65fc89 Ralf Baechle       2006-04-05  164  
41c594ab65fc89 Ralf Baechle       2006-04-05  165  	if (mt_opt_rpsctl >= 0) {
41c594ab65fc89 Ralf Baechle       2006-04-05  166  		printk("34K return prediction stack override set to %d.\n",
41c594ab65fc89 Ralf Baechle       2006-04-05  167  			mt_opt_rpsctl);
41c594ab65fc89 Ralf Baechle       2006-04-05  168  		if (mt_opt_rpsctl)
41c594ab65fc89 Ralf Baechle       2006-04-05  169  			nconfig7 |= (1 << 2);
41c594ab65fc89 Ralf Baechle       2006-04-05  170  		else
41c594ab65fc89 Ralf Baechle       2006-04-05  171  			nconfig7 &= ~(1 << 2);
41c594ab65fc89 Ralf Baechle       2006-04-05  172  	}
41c594ab65fc89 Ralf Baechle       2006-04-05  173  	if (mt_opt_nblsu >= 0) {
41c594ab65fc89 Ralf Baechle       2006-04-05  174  		printk("34K ALU/LSU sync override set to %d.\n", mt_opt_nblsu);
41c594ab65fc89 Ralf Baechle       2006-04-05  175  		if (mt_opt_nblsu)
41c594ab65fc89 Ralf Baechle       2006-04-05  176  			nconfig7 |= (1 << 5);
41c594ab65fc89 Ralf Baechle       2006-04-05  177  		else
41c594ab65fc89 Ralf Baechle       2006-04-05  178  			nconfig7 &= ~(1 << 5);
41c594ab65fc89 Ralf Baechle       2006-04-05  179  	}
41c594ab65fc89 Ralf Baechle       2006-04-05  180  	if (mt_opt_forceconfig7) {
41c594ab65fc89 Ralf Baechle       2006-04-05  181  		printk("CP0.Config7 forced to 0x%08x.\n", mt_opt_config7);
41c594ab65fc89 Ralf Baechle       2006-04-05  182  		nconfig7 = mt_opt_config7;
41c594ab65fc89 Ralf Baechle       2006-04-05  183  	}
41c594ab65fc89 Ralf Baechle       2006-04-05  184  	if (oconfig7 != nconfig7) {
41c594ab65fc89 Ralf Baechle       2006-04-05  185  		__asm__ __volatile("sync");
41c594ab65fc89 Ralf Baechle       2006-04-05  186  		write_c0_config7(nconfig7);
41c594ab65fc89 Ralf Baechle       2006-04-05  187  		ehb();
41c594ab65fc89 Ralf Baechle       2006-04-05  188  		printk("Config7: 0x%08x\n", read_c0_config7());
41c594ab65fc89 Ralf Baechle       2006-04-05  189  	}
41c594ab65fc89 Ralf Baechle       2006-04-05  190  
41c594ab65fc89 Ralf Baechle       2006-04-05  191  	if (itc_base != 0) {
41c594ab65fc89 Ralf Baechle       2006-04-05  192  		/*
41c594ab65fc89 Ralf Baechle       2006-04-05  193  		 * Configure ITC mapping.  This code is very
41c594ab65fc89 Ralf Baechle       2006-04-05  194  		 * specific to the 34K core family, which uses
41c594ab65fc89 Ralf Baechle       2006-04-05  195  		 * a special mode bit ("ITC") in the ErrCtl
41c594ab65fc89 Ralf Baechle       2006-04-05  196  		 * register to enable access to ITC control
41c594ab65fc89 Ralf Baechle       2006-04-05  197  		 * registers via cache "tag" operations.
41c594ab65fc89 Ralf Baechle       2006-04-05  198  		 */
41c594ab65fc89 Ralf Baechle       2006-04-05  199  		unsigned long ectlval;
41c594ab65fc89 Ralf Baechle       2006-04-05  200  		unsigned long itcblkgrn;
41c594ab65fc89 Ralf Baechle       2006-04-05  201  
41c594ab65fc89 Ralf Baechle       2006-04-05  202  		/* ErrCtl register is known as "ecc" to Linux */
41c594ab65fc89 Ralf Baechle       2006-04-05  203  		ectlval = read_c0_ecc();
41c594ab65fc89 Ralf Baechle       2006-04-05  204  		write_c0_ecc(ectlval | (0x1 << 26));
41c594ab65fc89 Ralf Baechle       2006-04-05  205  		ehb();
41c594ab65fc89 Ralf Baechle       2006-04-05  206  #define INDEX_0 (0x80000000)
41c594ab65fc89 Ralf Baechle       2006-04-05  207  #define INDEX_8 (0x80000008)
41c594ab65fc89 Ralf Baechle       2006-04-05  208  		/* Read "cache tag" for Dcache pseudo-index 8 */
41c594ab65fc89 Ralf Baechle       2006-04-05  209  		cache_op(Index_Load_Tag_D, INDEX_8);
41c594ab65fc89 Ralf Baechle       2006-04-05  210  		ehb();
41c594ab65fc89 Ralf Baechle       2006-04-05  211  		itcblkgrn = read_c0_dtaglo();
41c594ab65fc89 Ralf Baechle       2006-04-05  212  		itcblkgrn &= 0xfffe0000;
41c594ab65fc89 Ralf Baechle       2006-04-05  213  		/* Set for 128 byte pitch of ITC cells */
41c594ab65fc89 Ralf Baechle       2006-04-05  214  		itcblkgrn |= 0x00000c00;
41c594ab65fc89 Ralf Baechle       2006-04-05  215  		/* Stage in Tag register */
41c594ab65fc89 Ralf Baechle       2006-04-05  216  		write_c0_dtaglo(itcblkgrn);
41c594ab65fc89 Ralf Baechle       2006-04-05  217  		ehb();
41c594ab65fc89 Ralf Baechle       2006-04-05  218  		/* Write out to ITU with CACHE op */
41c594ab65fc89 Ralf Baechle       2006-04-05  219  		cache_op(Index_Store_Tag_D, INDEX_8);
41c594ab65fc89 Ralf Baechle       2006-04-05  220  		/* Now set base address, and turn ITC on with 0x1 bit */
41c594ab65fc89 Ralf Baechle       2006-04-05  221  		write_c0_dtaglo((itc_base & 0xfffffc00) | 0x1 );
41c594ab65fc89 Ralf Baechle       2006-04-05  222  		ehb();
41c594ab65fc89 Ralf Baechle       2006-04-05  223  		/* Write out to ITU with CACHE op */
41c594ab65fc89 Ralf Baechle       2006-04-05  224  		cache_op(Index_Store_Tag_D, INDEX_0);
41c594ab65fc89 Ralf Baechle       2006-04-05  225  		write_c0_ecc(ectlval);
41c594ab65fc89 Ralf Baechle       2006-04-05  226  		ehb();
41c594ab65fc89 Ralf Baechle       2006-04-05  227  		printk("Mapped %ld ITC cells starting at 0x%08x\n",
41c594ab65fc89 Ralf Baechle       2006-04-05  228  			((itcblkgrn & 0x7fe00000) >> 20), itc_base);
41c594ab65fc89 Ralf Baechle       2006-04-05  229  	}
41c594ab65fc89 Ralf Baechle       2006-04-05  230  }
41c594ab65fc89 Ralf Baechle       2006-04-05  231  
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  232  struct class *mt_class;
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  233  
15d2ce7129f25c Liam R. Howlett    2022-07-29  234  static int __init mips_mt_init(void)
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  235  {
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  236  	struct class *mtc;
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  237  
1aaba11da9aa7d Greg Kroah-Hartman 2023-03-13  238  	mtc = class_create("mt");
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  239  	if (IS_ERR(mtc))
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  240  		return PTR_ERR(mtc);
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  241  
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  242  	mt_class = mtc;
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  243  
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  244  	return 0;
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  245  }
27a3bbaf4b1e23 Ralf Baechle       2007-02-07  246  
15d2ce7129f25c Liam R. Howlett    2022-07-29  247  subsys_initcall(mips_mt_init);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
