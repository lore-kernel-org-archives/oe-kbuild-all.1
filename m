Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37C89A4E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 21:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688763852; x=1720299852;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rawDAIIX+/cC9YJyUSDBMXz/rXDRF7+rFf/nnwINqJE=;
  b=Yiy+dfjxZm73qR3Ge26xTpXWfbkqxP/pJc8Rz+q6lsSqVrUyjX7IYGM7
   JuZtTnsUNf8YhTZvBDd9UkwikUaQ58WjbNPLabMHBsxuNQt+1GBEd+cvC
   A0il29IztvU3XnQw2DwJHttlD6aMc8zxF0EhzsL0RAJYs1k1MbgNbx7Y6
   cQGKgJ8fCkfHB8rqjOhpwovGjmRtIWqziRafR5f9YEWnASGR986Jk9V+C
   HlnG6+WGB3dHpaqYLZ6Dj85N9XCPwCUv/8ysuJC1OWt9EMD62ZYUntrzZ
   JnDddHP73vFtRjkogU5pKvVBxIhhBg+z/Us06ISh+9mG4zyu1QQT6yXWg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="353831011"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="353831011"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 14:04:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="670288207"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="670288207"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 07 Jul 2023 14:04:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHscb-0002IE-2U;
	Fri, 07 Jul 2023 21:04:09 +0000
Date: Sat, 8 Jul 2023 05:03:22 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [willy-pagecache:set_ptes 7/37]
 arch/arc/include/asm/pgtable-bits-arcv2.h:103:36: warning: 'struct vm_fault'
 declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202307080522.Gb6fzxSq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/willy/pagecache set_ptes
head:   a357c8502e070a8a7aa2fa94492fd040ae053b78
commit: b0a88b2ea5dd08b0f1d77ce0ea1fe1be00135603 [7/37] arc: Implement the new page table range API
config: arc-randconfig-r043-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080522.Gb6fzxSq-lkp@intel.com/config)
compiler: arc-elf-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080522.Gb6fzxSq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080522.Gb6fzxSq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arc/include/asm/pgtable.h:12,
                    from include/linux/pgtable.h:6,
                    from include/asm-generic/io.h:1048,
                    from arch/arc/include/asm/io.h:232,
                    from include/linux/io.h:13,
                    from drivers/net/ethernet/qlogic/qed/qed.h:11,
                    from drivers/net/ethernet/qlogic/qed/qed_sp_commands.c:13:
>> arch/arc/include/asm/pgtable-bits-arcv2.h:103:36: warning: 'struct vm_fault' declared inside parameter list will not be visible outside of this definition or declaration
     103 | void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
         |                                    ^~~~~~~~
--
   In file included from arch/arc/include/asm/pgtable.h:12,
                    from include/linux/pgtable.h:6,
                    from include/asm-generic/io.h:1048,
                    from arch/arc/include/asm/io.h:232,
                    from include/linux/io.h:13,
                    from drivers/net/ethernet/qlogic/qed/qed_dev.c:9:
>> arch/arc/include/asm/pgtable-bits-arcv2.h:103:36: warning: 'struct vm_fault' declared inside parameter list will not be visible outside of this definition or declaration
     103 | void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
         |                                    ^~~~~~~~
   In file included from drivers/net/ethernet/qlogic/qed/qed_ll2.h:17,
                    from drivers/net/ethernet/qlogic/qed/qed_dev.c:33:
   include/linux/qed/qed_ll2_if.h:270:33: warning: 'qed_ll2_ops_pass' defined but not used [-Wunused-const-variable=]
     270 | static const struct qed_ll2_ops qed_ll2_ops_pass = {
         |                                 ^~~~~~~~~~~~~~~~


vim +103 arch/arc/include/asm/pgtable-bits-arcv2.h

   102	
 > 103	void update_mmu_cache_range(struct vm_fault *vmf, struct vm_area_struct *vma,
   104			unsigned long address, pte_t *ptep, unsigned int nr);
   105	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
