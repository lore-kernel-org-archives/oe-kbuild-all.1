Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA96F27F3B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jul 2023 04:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689998631; x=1721534631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=w/5K46dSqPpmkWu1mX4IousfcS0yNkzlp2R2eGcWHO4=;
  b=BKee1zJ5W5u15XblUtUmBqF1+yr7l8tJ9iW4fFz1IfdiN58Dn+VfDIG8
   kAMUAwtErxErbJSjPRBI3XVj6IFY+VQd0eRurJaODGKbsVEVGbwKYKi7t
   J9iQ7J00sHKboaxYBpeZ6NGNVpDm67Uu3USvFhKzqzNIOAXrj3e6mO1Gq
   0vlGB8lnzt2oHiU1F1BSU3Is6zW5Jqr815wfTJpXuiBw2fQQny3jq5OgW
   EcaSCpX/YT5R3CPOE8CLifvEOUnXJG/swqDjajRJo1HJCb+e5j5gGHWA5
   kmXGPd6z/2fB/ZekcIGRp0BElzT2r0QwnAZfLxjzKDRNsxFoyX8sqYEir
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="346760741"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="346760741"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2023 21:03:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10778"; a="719059968"
X-IronPort-AV: E=Sophos;i="6.01,223,1684825200"; 
   d="scan'208";a="719059968"
Received: from lkp-server02.sh.intel.com (HELO 36946fcf73d7) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 21 Jul 2023 21:03:49 -0700
Received: from kbuild by 36946fcf73d7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qN3qO-0007wv-27;
	Sat, 22 Jul 2023 04:03:48 +0000
Date: Sat, 22 Jul 2023 12:03:34 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v2 7/9] KVM: x86/mmu: Use BUILD_BUG_ON_INVALID() for
 KVM_MMU_WARN_ON() stub
Message-ID: <202307221143.1unfLOin-lkp@intel.com>
References: <20230721230006.2337941-8-seanjc@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230721230006.2337941-8-seanjc@google.com>

Hi Sean,

kernel test robot noticed the following build errors:

[auto build test ERROR on 294ebdda1560d3eb515da88b805ba7f88eb28d21]

url:    https://github.com/intel-lab-lkp/linux/commits/Sean-Christopherson/KVM-x86-mmu-Delete-rmap_printk-and-all-its-usage/20230722-070218
base:   294ebdda1560d3eb515da88b805ba7f88eb28d21
patch link:    https://lore.kernel.org/r/20230721230006.2337941-8-seanjc%40google.com
patch subject: [PATCH v2 7/9] KVM: x86/mmu: Use BUILD_BUG_ON_INVALID() for KVM_MMU_WARN_ON() stub
config: x86_64-buildonly-randconfig-r003-20230720 (https://download.01.org/0day-ci/archive/20230722/202307221143.1unfLOin-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230722/202307221143.1unfLOin-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307221143.1unfLOin-lkp@intel.com/

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
14960b3718bba4 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2023-07-21 @1738  	KVM_MMU_WARN_ON(!is_empty_shadow_page(sp->spt));
7775834a233478 arch/x86/kvm/mmu.c     Xiao Guangrong      2010-06-04  1739  	hlist_del(&sp->hash_link);
bd4c86eaa6ff10 arch/x86/kvm/mmu.c     Xiao Guangrong      2011-07-12  1740  	list_del(&sp->link);
bd4c86eaa6ff10 arch/x86/kvm/mmu.c     Xiao Guangrong      2011-07-12  1741  	free_page((unsigned long)sp->spt);
834be0d83f9451 arch/x86/kvm/mmu.c     Gleb Natapov        2013-01-30  1742  	if (!sp->role.direct)
6a97575d5cffb7 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  1743  		free_page((unsigned long)sp->shadowed_translation);
e8ad9a707496c1 arch/x86/kvm/mmu.c     Xiao Guangrong      2010-05-13  1744  	kmem_cache_free(mmu_page_header_cache, sp);
260746c03dcb2e drivers/kvm/mmu.c      Avi Kivity          2007-01-05  1745  }
260746c03dcb2e drivers/kvm/mmu.c      Avi Kivity          2007-01-05  1746  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
