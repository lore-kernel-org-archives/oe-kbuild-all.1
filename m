Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4552F1E530
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 19:16:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b0gc9GH7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702926975; x=1734462975;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5EGytbAmwTATz354KBb35ATnmYh1LPzAccrY6JE9s0k=;
  b=b0gc9GH70O9Up+8amaK30mQvD94uM3dAt0bQCjYcOZAfi3nNI7K56Veq
   17dp1oZ33haNJzT53AO3uAeEedZd9NaA0k/4qoHCqcVhVq5itaDHUMu2X
   JFrtNWXSE/TeXYZhy/MsC8T2fti+x1Wb50C0UZs43SgFLdHCA3c3eiJds
   vdEUzrkbFMOsSZAbnK9BhePXYJ7KveIBOC31ZXOEfGknllTt6LFs7VVN0
   oJNbw8an1EryVjSHaReq5+TSfctn6DvCHwdlU7JeOnQXvX23nlrg58dpG
   nbDG0X0EJ4AmGNbXZ+AzxD8b5BeYsBVvxYo+fKATEclOnDKQyro8jLZw9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="392725224"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="392725224"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 11:16:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="751862798"
X-IronPort-AV: E=Sophos;i="6.04,286,1695711600"; 
   d="scan'208";a="751862798"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 18 Dec 2023 11:16:13 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFJ62-0004SX-20;
	Mon, 18 Dec 2023 19:16:10 +0000
Date: Tue, 19 Dec 2023 03:16:05 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kmo@daterainc.com>
Cc: oe-kbuild-all@lists.linux.dev, Kent Overstreet <kmo@daterainc.com>
Subject: [bcachefs:header_cleanup 13/49]
 arch/microblaze/include/asm/pgtable.h:339:52: warning: 'struct
 vm_area_struct' declared inside parameter list will not be visible outside
 of this definition or declaration
Message-ID: <202312190357.h9yPk27w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://evilpiepirate.org/git/bcachefs.git header_cleanup
head:   0e034194a81f95ba6377786660a88f5403fcbf19
commit: 18cbfa0795c3198de70c9e814c436f2ed294e7e0 [13/49] timekeeping: Kill percpu.h dependency
config: microblaze-allmodconfig (https://download.01.org/0day-ci/archive/20231219/202312190357.h9yPk27w-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312190357.h9yPk27w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312190357.h9yPk27w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from arch/microblaze/include/asm/uaccess.h:15,
                    from include/linux/uaccess.h:11,
                    from include/linux/sched/task.h:11,
                    from include/linux/sched/signal.h:9,
                    from drivers/infiniband/ulp/ipoib/ipoib_vlan.c:33:
>> arch/microblaze/include/asm/pgtable.h:339:52: warning: 'struct vm_area_struct' declared inside parameter list will not be visible outside of this definition or declaration
     339 | static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
         |                                                    ^~~~~~~~~~~~~~
   drivers/infiniband/ulp/ipoib/ipoib_vlan.c: In function 'ipoib_vlan_add':
   drivers/infiniband/ulp/ipoib/ipoib_vlan.c:187:52: warning: '%04x' directive output may be truncated writing 4 bytes into a region of size between 0 and 15 [-Wformat-truncation=]
     187 |         snprintf(intf_name, sizeof(intf_name), "%s.%04x",
         |                                                    ^~~~
   drivers/infiniband/ulp/ipoib/ipoib_vlan.c:187:48: note: directive argument in the range [0, 65535]
     187 |         snprintf(intf_name, sizeof(intf_name), "%s.%04x",
         |                                                ^~~~~~~~~
   drivers/infiniband/ulp/ipoib/ipoib_vlan.c:187:9: note: 'snprintf' output between 6 and 21 bytes into a destination of size 16
     187 |         snprintf(intf_name, sizeof(intf_name), "%s.%04x",
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     188 |                  ppriv->dev->name, pkey);
         |                  ~~~~~~~~~~~~~~~~~~~~~~~


vim +339 arch/microblaze/include/asm/pgtable.h

15902bf63c8332 Michal Simek 2009-05-26  337  
658b368da198a1 Michal Simek 2011-01-16  338  #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
658b368da198a1 Michal Simek 2011-01-16 @339  static inline int ptep_test_and_clear_young(struct vm_area_struct *vma,
658b368da198a1 Michal Simek 2011-01-16  340  		unsigned long address, pte_t *ptep)
15902bf63c8332 Michal Simek 2009-05-26  341  {
15902bf63c8332 Michal Simek 2009-05-26  342  	return (pte_update(ptep, _PAGE_ACCESSED, 0) & _PAGE_ACCESSED) != 0;
15902bf63c8332 Michal Simek 2009-05-26  343  }
15902bf63c8332 Michal Simek 2009-05-26  344  

:::::: The code at line 339 was first introduced by commit
:::::: 658b368da198a1436c7d6a0f1f4029d3c6e30b20 microblaze: Fix asm/pgtable.h

:::::: TO: Michal Simek <monstr@monstr.eu>
:::::: CC: Michal Simek <monstr@monstr.eu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
