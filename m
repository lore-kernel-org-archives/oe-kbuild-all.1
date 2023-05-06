Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE4521360
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 01:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683336045; x=1714872045;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4xrnEffoW9jyJImlPMmc8tAj9Bas6hf+Rf3FZaw6D1U=;
  b=Rah+WazlZVWKwFFZ40BkJEg20klJOOqaEArWOQOAKeylJeuYTD/lpWOZ
   7yUEov7Hc8YGeSBdg0+Ebhpt9gnJv35nETPoGhMIAde4wSw6pe+vLfyUn
   DsoQcNNDvoWL5CBps2n9xqzd/fmaeAJ1aVHC0mJ9ItaS+fu2MSppKSJdy
   NzwrRqYvmnilQr4Xiw/PJYNlEZMvQjIXMZ7idGAlE3RPl6JY7rUPwhlzD
   zbgN0Nsd1eEOtBnZ0wtTeLGg+5dqWcI03SSAE6Zpg8Uy+xz/DKZSHI4eu
   KC3Ehbq7LhipKvFFC4SxUv/7ezBLBDxJu7H/ttH1EWqBu19gqzCUbuGlh
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="333758958"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="333758958"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2023 18:20:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10701"; a="787355722"
X-IronPort-AV: E=Sophos;i="5.99,253,1677571200"; 
   d="scan'208";a="787355722"
Received: from lkp-server01.sh.intel.com (HELO fe5d646e317d) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 05 May 2023 18:20:33 -0700
Received: from kbuild by fe5d646e317d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pv6bA-000113-2S;
	Sat, 06 May 2023 01:20:32 +0000
Date: Sat, 6 May 2023 09:19:41 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Levin <sashal@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.3 497/556] arch/s390/boot/vmem.c:97:21:
 error: 'POPULATE_DIRECT' undeclared; did you mean 'POPULATE_NONE'?
Message-ID: <202305060913.WnlDOhvZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.3
head:   4f53c7bbb97078231aab5a084977405ef5d4030a
commit: 2b562616da5a50b1be53f7b40b517be83147b1d0 [497/556] s390/mm: fix direct map accounting
config: s390-defconfig (https://download.01.org/0day-ci/archive/20230506/202305060913.WnlDOhvZ-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git/commit/?id=2b562616da5a50b1be53f7b40b517be83147b1d0
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-6.3
        git checkout 2b562616da5a50b1be53f7b40b517be83147b1d0
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=s390 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305060913.WnlDOhvZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/s390/boot/vmem.c: In function 'pgtable_pte_populate':
>> arch/s390/boot/vmem.c:97:21: error: 'POPULATE_DIRECT' undeclared (first use in this function); did you mean 'POPULATE_NONE'?
      97 |         if (mode == POPULATE_DIRECT)
         |                     ^~~~~~~~~~~~~~~
         |                     POPULATE_NONE
   arch/s390/boot/vmem.c:97:21: note: each undeclared identifier is reported only once for each function it appears in
   arch/s390/boot/vmem.c: In function 'pgtable_pmd_populate':
   arch/s390/boot/vmem.c:126:21: error: 'POPULATE_DIRECT' undeclared (first use in this function); did you mean 'POPULATE_NONE'?
     126 |         if (mode == POPULATE_DIRECT)
         |                     ^~~~~~~~~~~~~~~
         |                     POPULATE_NONE
   arch/s390/boot/vmem.c: In function 'pgtable_pud_populate':
   arch/s390/boot/vmem.c:155:21: error: 'POPULATE_DIRECT' undeclared (first use in this function); did you mean 'POPULATE_NONE'?
     155 |         if (mode == POPULATE_DIRECT)
         |                     ^~~~~~~~~~~~~~~
         |                     POPULATE_NONE


vim +97 arch/s390/boot/vmem.c

    81	
    82	static void pgtable_pte_populate(pmd_t *pmd, unsigned long addr, unsigned long end,
    83					 enum populate_mode mode)
    84	{
    85		unsigned long pages = 0;
    86		pte_t *pte, entry;
    87	
    88		pte = pte_offset_kernel(pmd, addr);
    89		for (; addr < end; addr += PAGE_SIZE, pte++) {
    90			if (pte_none(*pte)) {
    91				entry = __pte(_pa(addr, mode));
    92				entry = set_pte_bit(entry, PAGE_KERNEL_EXEC);
    93				set_pte(pte, entry);
    94				pages++;
    95			}
    96		}
  > 97		if (mode == POPULATE_DIRECT)
    98			update_page_count(PG_DIRECT_MAP_4K, pages);
    99	}
   100	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
