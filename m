Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2A3CA7A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 02:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JHIgWCVq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701830180; x=1733366180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o1mufgwTBY+Rs/JxAd2M5NyrpJPW3BFPL27ZTj5p5lI=;
  b=JHIgWCVq4wmXQGBpUdUr4s79UvHdoM2Uw2eGP+d1y9KaMsoNR0H+mySb
   Ur4KgVFQrwqLYyOTDg/Dywrc1KMhSPvXWYqZQOpQq/wwGV7s+a0K+/FL7
   MvZhy1r6613LCJPo+T/CXu2st80CIjijrDKhxq+SYDQXe6OpKPJzzkeYe
   lOR39NGVqFfaQjNfaqho5abMahOQ4jp15SlJnATvWAVn/n1FPjjhGDAZi
   qSmwcWcWGX6swnkQ7rp0MRaJjHGhLbwgAdQ90FGTcg4wrxBu9jDkwvuxa
   uBBMVxiHwW+SDGdb6GrPFdJ6SCUzJ3nqoL0tvy8t2T43EWDnA1ByByxaC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1058878"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1058878"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 18:36:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="1102662524"
X-IronPort-AV: E=Sophos;i="6.04,254,1695711600"; 
   d="scan'208";a="1102662524"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 05 Dec 2023 18:36:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAhln-000A6Y-2t;
	Wed, 06 Dec 2023 02:36:15 +0000
Date: Wed, 6 Dec 2023 10:35:51 +0800
From: kernel test robot <lkp@intel.com>
To: Grygorii Strashko <grygorii.strashko@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Russell King <rmk+kernel@armlinux.org.uk>
Subject: arch/arm/mm/init.c:718: warning: No description found for parameter
 'perms'
Message-ID: <202312061028.bA2IkpFv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 11ce4b33aedc65198d7bc9669344ebca5ee36a41 ARM: 8672/1: mm: remove tasklist locking from update_sections_early()
date:   7 years ago
config: arm-randconfig-002-20231123 (https://download.01.org/0day-ci/archive/20231206/202312061028.bA2IkpFv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312061028.bA2IkpFv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312061028.bA2IkpFv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm/mm/init.c:38:0:
   arch/arm/include/asm/fixmap.h:38:35: warning: '__end_of_fixed_addresses' defined but not used [-Wunused-const-variable=]
    static const enum fixed_addresses __end_of_fixed_addresses =
                                      ^~~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm/mm/init.c:718: warning: No description found for parameter 'perms'
>> arch/arm/mm/init.c:718: warning: No description found for parameter 'n'


vim +/perms +718 arch/arm/mm/init.c

1e6b48116a9504 Kees Cook         2014-04-03  711  
11ce4b33aedc65 Grygorii Strashko 2017-04-25  712  /**
11ce4b33aedc65 Grygorii Strashko 2017-04-25  713   * update_sections_early intended to be called only through stop_machine
11ce4b33aedc65 Grygorii Strashko 2017-04-25  714   * framework and executed by only one CPU while all other CPUs will spin and
11ce4b33aedc65 Grygorii Strashko 2017-04-25  715   * wait, so no locking is required in this function.
11ce4b33aedc65 Grygorii Strashko 2017-04-25  716   */
08925c2f124f1b Laura Abbott      2015-11-30  717  static void update_sections_early(struct section_perm perms[], int n)
1e6b48116a9504 Kees Cook         2014-04-03 @718  {
08925c2f124f1b Laura Abbott      2015-11-30  719  	struct task_struct *t, *s;
08925c2f124f1b Laura Abbott      2015-11-30  720  
08925c2f124f1b Laura Abbott      2015-11-30  721  	for_each_process(t) {
08925c2f124f1b Laura Abbott      2015-11-30  722  		if (t->flags & PF_KTHREAD)
08925c2f124f1b Laura Abbott      2015-11-30  723  			continue;
08925c2f124f1b Laura Abbott      2015-11-30  724  		for_each_thread(t, s)
08925c2f124f1b Laura Abbott      2015-11-30  725  			set_section_perms(perms, n, true, s->mm);
08925c2f124f1b Laura Abbott      2015-11-30  726  	}
08925c2f124f1b Laura Abbott      2015-11-30  727  	set_section_perms(perms, n, true, current->active_mm);
08925c2f124f1b Laura Abbott      2015-11-30  728  	set_section_perms(perms, n, true, &init_mm);
08925c2f124f1b Laura Abbott      2015-11-30  729  }
08925c2f124f1b Laura Abbott      2015-11-30  730  

:::::: The code at line 718 was first introduced by commit
:::::: 1e6b48116a95046ec51f3d40f83aff8b006674d7 ARM: mm: allow non-text sections to be non-executable

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
