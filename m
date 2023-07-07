Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E9817748
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 22:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688770154; x=1720306154;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3h/oHYJtK6LcO/nXH8nUK77PnTqF5hNL3J08fjKmoKk=;
  b=DUtV2hoUrUt/CtdY//WgTJZMDLj76qTtq5OKQrpgjRbMdXd4azfMWX3T
   87aDUcsNCQP6a4xSASxt7tcSRHzGYT3YjQWAefelaFpBla5Ihgmk9WMK1
   SoxNEjgKLhDGtf/Kcmdx4vEqe5c3tln0jhNbOazEXAwrkE9eH18o3toDc
   VWCXGR904k7nQ79PPGslksoDzQOkpIyNTSQb7dO4CHDwQ5qQJ1UuQsDCY
   i0/W0c7eadtaT0neI/a1sHha6KFQKNxIgVYPxNe1oXyxJ0eeP7LurCRnE
   TWUcOz5H96WROejfeLjONCgckDC9tMqD++XbmqFTqcKdV11R9f5o87Mld
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="394764575"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="394764575"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 15:49:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="966771015"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="966771015"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jul 2023 15:49:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHuGF-0002MG-2u;
	Fri, 07 Jul 2023 22:49:11 +0000
Date: Sat, 8 Jul 2023 06:48:40 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 29/38]
 arch/xtensa/include/asm/pgtable.h:405:36: warning: 'struct vm_fault'
 declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202307080639.wAh5EuPo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   72c34bd0b2a432506d992bdc1e3a89260461667d
commit: a719d7edf701b2182a6276385095d67dcaaf5d33 [29/38] xtensa: Implement the new page table range API
config: xtensa-randconfig-r023-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080639.wAh5EuPo-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080639.wAh5EuPo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080639.wAh5EuPo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from arch/xtensa/include/asm/io.h:19,
                    from include/linux/io.h:13,
                    from drivers/i2c/busses/i2c-cbus-gpio.c:19:
>> arch/xtensa/include/asm/pgtable.h:405:36: warning: 'struct vm_fault' declared inside parameter list will not be visible outside of this definition or declaration
     405 | void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
         |                                    ^~~~~~~~


vim +405 arch/xtensa/include/asm/pgtable.h

   404	
 > 405	void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
   406			unsigned long address, pte_t *ptep, unsigned int nr);
   407	#define update_mmu_cache(vma, address, ptep) \
   408		update_mmu_cache_range(NULL, vma, address, ptep, 1)
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
