Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB7CC2E9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 21:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685826897; x=1717362897;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=DV4WyHYUt7CxzViSeCuPufQ/fgdJJJnHHDjouF0j7wQ=;
  b=UMgTRe27XY3pTc3HpHmQLHQw4WnQfOT47BaJHeENTTqDvjRLH4y7smh9
   whaf6CgMcdEpYHQ1/tewsvgbgHzbZlWMBZKDwBi5MkXbPZl2d2yxm9eT/
   t4lr60ziVDm28TvtoB8JibxnJ8/XWJeyn5ScNhAj+hZPT933kGaHQyiQn
   pdwuWOurE+jpHgETpTll3XU7vNb5qL1AKBLhG9u8+laYFWj6Gzj2kPG9y
   VfuWfRip+eg1jKxm+eAV3sf69EpmTPVRT8PfpyZGB93LQBhFZj93ueOe3
   ZDLlKK62wKQvPLnBGjA0oeVWU11q3mC105u2Q24pVOHre9qMFwkIxhjoe
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="336475846"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="336475846"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jun 2023 14:14:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="737923617"
X-IronPort-AV: E=Sophos;i="6.00,216,1681196400"; 
   d="scan'208";a="737923617"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Jun 2023 14:14:55 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5YaM-00020P-22;
	Sat, 03 Jun 2023 21:14:54 +0000
Date: Sun, 4 Jun 2023 05:14:46 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:x86/kexec 5/6] arch/x86/kernel/smpboot.c:911:20:
 warning: 'maxlvt' is used uninitialized
Message-ID: <202306040543.0lq7bhhE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git x86/kexec
head:   acc514f5cf7466868e6de74d87c63659960a9348
commit: 023050a9d83acd87f0fde52af4e351851756caad [5/6] x86/smp: Split sending INIT IPI out into a helper function
config: x86_64-buildonly-randconfig-r005-20230604 (https://download.01.org/0day-ci/archive/20230604/202306040543.0lq7bhhE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git/commit/?id=023050a9d83acd87f0fde52af4e351851756caad
        git remote add tglx-devel https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git
        git fetch --no-tags tglx-devel x86/kexec
        git checkout 023050a9d83acd87f0fde52af4e351851756caad
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kernel/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306040543.0lq7bhhE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/smpboot.c: In function 'wakeup_secondary_cpu_via_init':
>> arch/x86/kernel/smpboot.c:911:20: warning: 'maxlvt' is used uninitialized [-Wuninitialized]
     911 |                 if (maxlvt > 3)         /* Due to the Pentium erratum 3AP.  */
         |                    ^
   arch/x86/kernel/smpboot.c:885:13: note: 'maxlvt' was declared here
     885 |         int maxlvt, num_starts, j;
         |             ^~~~~~


vim +/maxlvt +911 arch/x86/kernel/smpboot.c

cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  878  
023050a9d83acd Thomas Gleixner           2023-06-02  879  /*
023050a9d83acd Thomas Gleixner           2023-06-02  880   * Wake up AP by INIT, INIT, STARTUP sequence.
023050a9d83acd Thomas Gleixner           2023-06-02  881   */
023050a9d83acd Thomas Gleixner           2023-06-02  882  static int wakeup_secondary_cpu_via_init(int phys_apicid, unsigned long start_eip)
023050a9d83acd Thomas Gleixner           2023-06-02  883  {
023050a9d83acd Thomas Gleixner           2023-06-02  884  	unsigned long send_status = 0, accept_status = 0;
023050a9d83acd Thomas Gleixner           2023-06-02  885  	int maxlvt, num_starts, j;
023050a9d83acd Thomas Gleixner           2023-06-02  886  
023050a9d83acd Thomas Gleixner           2023-06-02  887  	preempt_disable();
023050a9d83acd Thomas Gleixner           2023-06-02  888  
023050a9d83acd Thomas Gleixner           2023-06-02  889  	send_init_sequence(phys_apicid);
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  890  
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  891  	mb();
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  892  
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  893  	/*
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  894  	 * Should we send STARTUP IPIs ?
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  895  	 *
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  896  	 * Determine this based on the APIC version.
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  897  	 * If we don't have an integrated APIC, don't send the STARTUP IPIs.
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  898  	 */
cff9ab2b291e64 Denys Vlasenko            2016-09-13  899  	if (APIC_INTEGRATED(boot_cpu_apic_version))
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  900  		num_starts = 2;
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  901  	else
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  902  		num_starts = 0;
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  903  
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  904  	/*
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  905  	 * Run STARTUP IPI loop.
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  906  	 */
c767a54ba0657e Joe Perches               2012-05-21  907  	pr_debug("#startup loops: %d\n", num_starts);
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  908  
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  909  	for (j = 1; j <= num_starts; j++) {
c767a54ba0657e Joe Perches               2012-05-21  910  		pr_debug("Sending STARTUP #%d\n", j);
593f4a788e5d09 Maciej W. Rozycki         2008-07-16 @911  		if (maxlvt > 3)		/* Due to the Pentium erratum 3AP.  */
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  912  			apic_write(APIC_ESR, 0);
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  913  		apic_read(APIC_ESR);
c767a54ba0657e Joe Perches               2012-05-21  914  		pr_debug("After apic_write\n");
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  915  
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  916  		/*
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  917  		 * STARTUP IPI
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  918  		 */
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  919  
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  920  		/* Target chip */
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  921  		/* Boot on the stack */
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  922  		/* Kick the second */
1b374e4d6f8b3e Suresh Siddha             2008-07-10  923  		apic_icr_write(APIC_DM_STARTUP | (start_eip >> 12),
1b374e4d6f8b3e Suresh Siddha             2008-07-10  924  			       phys_apicid);
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  925  
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  926  		/*
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  927  		 * Give the other CPU some time to accept the IPI.
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  928  		 */
fcafddec4e78a7 Len Brown                 2015-10-16  929  		if (init_udelay == 0)
fcafddec4e78a7 Len Brown                 2015-10-16  930  			udelay(10);
fcafddec4e78a7 Len Brown                 2015-10-16  931  		else
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  932  			udelay(300);
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  933  
c767a54ba0657e Joe Perches               2012-05-21  934  		pr_debug("Startup point 1\n");
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  935  
cfc1b9a6a683c8 Thomas Gleixner           2008-07-21  936  		pr_debug("Waiting for send to finish...\n");
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  937  		send_status = safe_apic_wait_icr_idle();
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  938  
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  939  		/*
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  940  		 * Give the other CPU some time to accept the IPI.
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  941  		 */
fcafddec4e78a7 Len Brown                 2015-10-16  942  		if (init_udelay == 0)
fcafddec4e78a7 Len Brown                 2015-10-16  943  			udelay(10);
fcafddec4e78a7 Len Brown                 2015-10-16  944  		else
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  945  			udelay(200);
f5d6a52f511157 Jan H. Schönherr          2015-05-04  946  
593f4a788e5d09 Maciej W. Rozycki         2008-07-16  947  		if (maxlvt > 3)		/* Due to the Pentium erratum 3AP.  */
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  948  			apic_write(APIC_ESR, 0);
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  949  		accept_status = (apic_read(APIC_ESR) & 0xEF);
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  950  		if (send_status || accept_status)
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  951  			break;
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  952  	}
c767a54ba0657e Joe Perches               2012-05-21  953  	pr_debug("After Startup\n");
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  954  
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  955  	if (send_status)
c767a54ba0657e Joe Perches               2012-05-21  956  		pr_err("APIC never delivered???\n");
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  957  	if (accept_status)
c767a54ba0657e Joe Perches               2012-05-21  958  		pr_err("APIC delivery error (%lx)\n", accept_status);
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  959  
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  960  	return (send_status | accept_status);
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  961  }
cb3c8b9003f15e Glauber de Oliveira Costa 2008-03-19  962  

:::::: The code at line 911 was first introduced by commit
:::::: 593f4a788e5d09e9f00182561437461b0b564de4 x86: APIC: remove apic_write_around(); use alternatives

:::::: TO: Maciej W. Rozycki <macro@linux-mips.org>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
