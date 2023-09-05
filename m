Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823BF7F3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 05:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693892692; x=1725428692;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VAvtsGJDpFKY/dFuo8tdCAAFHN2Ja37VO4oXPV2c21A=;
  b=l9aREL1Jlw/HGy0ih9NOAFC6bM5OuVivSnOF/8Huzh4LKKPzaFH4UkPI
   WD+EpYWsWDLaWQLLAznqX3CMkl5FpmORcN++dMot8K6b5iAUd/DRgXYZA
   PdU8EAEMh1k3TPeDWvNmSsXvmiK1T7kMkl2B9TJh80ZG//QJfuYRS1mnc
   gnNXLOONWmJxeIuRzNtAWnpWTQxLhJ7NnLggfulTI5Tfa0p+wvbJG6bD9
   O1UjzUXf0hd33TCPDjZDu1gLAOUBkSlpeHDfBxaeVpXMj5Tlqp6y/gjyL
   mznjtQFRhlVvxFRj90GaWBhs6PnF2USc3VutifGD7jTF8dysHWDdGCYop
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="463076942"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="463076942"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Sep 2023 22:44:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10823"; a="740989407"
X-IronPort-AV: E=Sophos;i="6.02,228,1688454000"; 
   d="scan'208";a="740989407"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 04 Sep 2023 22:44:49 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdOrn-0001If-1Y;
	Tue, 05 Sep 2023 05:44:47 +0000
Date: Tue, 5 Sep 2023 13:44:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-unstable 11/41] arch/sparc/mm/tlb.c:304:1: error:
 unknown type name 'Mon'
Message-ID: <202309051336.IkWoM0J5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   df52e0b5933bff55db448d594446534118a72266
commit: ab08e986a45a66d3590a97c89132e6bbd3710cfd [11/41] sparc64: add missing initialization of folio in tlb_batch_add()
config: sparc64-defconfig (https://download.01.org/0day-ci/archive/20230905/202309051336.IkWoM0J5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230905/202309051336.IkWoM0J5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309051336.IkWoM0J5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/sparc/mm/tlb.c:304:1: error: unknown type name 'Mon'
     304 | Mon Sep  4 12:33:06 PM PDT 2023
         | ^~~
>> arch/sparc/mm/tlb.c:304:10: error: expected '=', ',', ';', 'asm' or '__attribute__' before numeric constant
     304 | Mon Sep  4 12:33:06 PM PDT 2023
         |          ^


vim +/Mon +304 arch/sparc/mm/tlb.c

   281	
   282	pgtable_t pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp)
   283	{
   284		struct list_head *lh;
   285		pgtable_t pgtable;
   286	
   287		assert_spin_locked(&mm->page_table_lock);
   288	
   289		/* FIFO */
   290		pgtable = pmd_huge_pte(mm, pmdp);
   291		lh = (struct list_head *) pgtable;
   292		if (list_empty(lh))
   293			pmd_huge_pte(mm, pmdp) = NULL;
   294		else {
   295			pmd_huge_pte(mm, pmdp) = (pgtable_t) lh->next;
   296			list_del(lh);
   297		}
   298		pte_val(pgtable[0]) = 0;
   299		pte_val(pgtable[1]) = 0;
   300	
   301		return pgtable;
   302	}
   303	#endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 > 304	Mon Sep  4 12:33:06 PM PDT 2023

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
