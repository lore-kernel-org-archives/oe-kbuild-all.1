Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDAC31D30B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 13:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690032227; x=1721568227;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/BnFFR5+1ITQjIKG23SW0WyTsNO91uYkZU1iDnsMwxc=;
  b=Drq3bYTz7ZXCEWYXMlGlB6I4LRgDgIbK6HUqImou8APoPpOexyi4QZFK
   wDYzpyIm3Z2Bkq1BBQGwdj3SvU80bBWVC3yIQPFgeiY/vBdvZl8bPm9je
   9gWWY6snadVEpGveTFPjlHzcdLy+6zSHNMQOJH76kRy/J89D76SJ+PRwj
   ibQFuB2rOve4yO2bXR33PJwISZV4jSrw55pLaHPF8JVo4PPlBI2FVkV0Q
   UVk8fGz0kqg+qaMiK+AKylIZj3Bpgj/eUflbf8YmVsAImxoNdN+qu2k+S
   Wz+N2Uioot2oXPkYj+UGc+SajGMoSOHoODmldIMy/uSmGrxSezlGnUJWk
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="364653881"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="364653881"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2023 06:23:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10779"; a="795283080"
X-IronPort-AV: E=Sophos;i="6.01,224,1684825200"; 
   d="scan'208";a="795283080"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 22 Jul 2023 06:23:44 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qNCaF-0008Ks-1T;
	Sat, 22 Jul 2023 13:23:43 +0000
Date: Sat, 22 Jul 2023 21:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/mmu_warn_on 8/10] arch/x86/kvm/mmu/mmu.c:1738:26:
 error: implicit declaration of function 'is_empty_shadow_page'; did you mean
 'to_shadow_page'?
Message-ID: <202307222135.PwP4UeZe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux x86/mmu_warn_on
head:   35b984658209ba3f49a08a930dbafe54d9c2a15b
commit: 6ad35b4c169be6c4ed48736861c0f0b25bcc0453 [8/10] KVM: x86/mmu: Use BUILD_BUG_ON_INVALID() for KVM_MMU_WARN_ON() stub
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20230722/202307222135.PwP4UeZe-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307222135.PwP4UeZe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307222135.PwP4UeZe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/atomic/atomic-instrumented.h:15,
                    from include/linux/atomic.h:82,
                    from include/linux/mm_types_task.h:13,
                    from include/linux/mm_types.h:5,
                    from arch/x86/kvm/irq.h:13,
                    from arch/x86/kvm/mmu/mmu.c:19:
   arch/x86/kvm/mmu/mmu.c: In function 'kvm_mmu_free_shadow_page':
>> arch/x86/kvm/mmu/mmu.c:1738:26: error: implicit declaration of function 'is_empty_shadow_page'; did you mean 'to_shadow_page'? [-Werror=implicit-function-declaration]
    1738 |         KVM_MMU_WARN_ON(!is_empty_shadow_page(sp->spt));
         |                          ^~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:30:63: note: in definition of macro 'BUILD_BUG_ON_INVALID'
      30 | #define BUILD_BUG_ON_INVALID(e) ((void)(sizeof((__force long)(e))))
         |                                                               ^
   arch/x86/kvm/mmu/mmu.c:1738:9: note: in expansion of macro 'KVM_MMU_WARN_ON'
    1738 |         KVM_MMU_WARN_ON(!is_empty_shadow_page(sp->spt));
         |         ^~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +1738 arch/x86/kvm/mmu/mmu.c

43a063cab325ee arch/x86/kvm/mmu/mmu.c Yosry Ahmed         2022-08-23  1735  
876546436db977 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  1736  static void kvm_mmu_free_shadow_page(struct kvm_mmu_page *sp)
260746c03dcb2e drivers/kvm/mmu.c      Avi Kivity          2007-01-05  1737  {
e000784476e046 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2023-05-11 @1738  	KVM_MMU_WARN_ON(!is_empty_shadow_page(sp->spt));
7775834a233478 arch/x86/kvm/mmu.c     Xiao Guangrong      2010-06-04  1739  	hlist_del(&sp->hash_link);
bd4c86eaa6ff10 arch/x86/kvm/mmu.c     Xiao Guangrong      2011-07-12  1740  	list_del(&sp->link);
bd4c86eaa6ff10 arch/x86/kvm/mmu.c     Xiao Guangrong      2011-07-12  1741  	free_page((unsigned long)sp->spt);
834be0d83f9451 arch/x86/kvm/mmu.c     Gleb Natapov        2013-01-30  1742  	if (!sp->role.direct)
6a97575d5cffb7 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  1743  		free_page((unsigned long)sp->shadowed_translation);
e8ad9a707496c1 arch/x86/kvm/mmu.c     Xiao Guangrong      2010-05-13  1744  	kmem_cache_free(mmu_page_header_cache, sp);
260746c03dcb2e drivers/kvm/mmu.c      Avi Kivity          2007-01-05  1745  }
260746c03dcb2e drivers/kvm/mmu.c      Avi Kivity          2007-01-05  1746  

:::::: The code at line 1738 was first introduced by commit
:::::: e000784476e0468eca355991a6e4d30b6020533d KVM: x86/mmu: Rename MMU_WARN_ON() to KVM_MMU_WARN_ON()

:::::: TO: Sean Christopherson <seanjc@google.com>
:::::: CC: Sean Christopherson <seanjc@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
