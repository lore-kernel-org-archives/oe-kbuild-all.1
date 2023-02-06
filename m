Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DA246116
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Feb 2023 22:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675721418; x=1707257418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FDSy7/Ej6N/3lZRiqpo/PWVD5FFnwC39+yl5ciGKmH8=;
  b=eHL/1PH1YhnnQ64z1bNehTbclqQ59lI3iBODSESu6qk08v0nJJcGF5AE
   oafgt8dfWBMiWLw5XGSJe8auD0qkIs7Wj1JbSgkzlpppU5vqR9XqTuYG8
   XjtkEZMABO4kKSoeTm779K8yBG6Z8rgu0gIy8fL2eAA+HPkh3ANTlc3H6
   /7xnEjrXwUfGqZUzXjwvRdr83r/jZ2Kx/OTjEJdga1sYSJGos4iNBphWr
   1AqoUZBj/1EsUZlVBT1hj07ZJ2eWRLcLwmFq6M2c6lQQuS+/U0no1DQYj
   VnYLMyvHmrG99Oh/9Z8mcugecWj3aUs+QDgoalJavgmbmF/vPYKwvIp4/
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="356694629"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="356694629"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 14:10:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="698999743"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="698999743"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 06 Feb 2023 14:10:16 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pP9gl-0002ou-1i;
	Mon, 06 Feb 2023 22:10:15 +0000
Date: Tue, 7 Feb 2023 06:10:08 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: arch/x86/kvm/mmu/paging_tmpl.h:106:24: sparse: sparse: cast
 truncates bits from constant value (ffffffffff000 becomes fffff000)
Message-ID: <202302070638.iEBPQ4gL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sean,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2d11f342b179f1894a901f143ec7c008caba43e
commit: 70e41c31bc7776b262cd9f524df3dfc2b5869a0a KVM: x86/mmu: Use common logic for computing the 32/64-bit base PA mask
date:   8 months ago
config: x86_64-randconfig-s023-20230206 (https://download.01.org/0day-ci/archive/20230207/202302070638.iEBPQ4gL-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=70e41c31bc7776b262cd9f524df3dfc2b5869a0a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 70e41c31bc7776b262cd9f524df3dfc2b5869a0a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/mmu/mmu.c:610:9: sparse: sparse: context imbalance in 'walk_shadow_page_lockless_begin' - different lock contexts for basic block
   arch/x86/kvm/mmu/mmu.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, arch/x86/kvm/irq.h):
   include/linux/rcupdate.h:726:9: sparse: sparse: context imbalance in 'walk_shadow_page_lockless_end' - unexpected unlock
   arch/x86/kvm/mmu/mmu.c:2550:9: sparse: sparse: context imbalance in 'mmu_try_to_unsync_pages' - different lock contexts for basic block
   arch/x86/kvm/mmu/mmu.c: note: in included file:
>> arch/x86/kvm/mmu/paging_tmpl.h:106:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   arch/x86/kvm/mmu/paging_tmpl.h:426:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   arch/x86/kvm/mmu/mmu.c:4618:57: sparse: sparse: cast truncates bits from constant value (ffffff33 becomes 33)
   arch/x86/kvm/mmu/mmu.c:4620:56: sparse: sparse: cast truncates bits from constant value (ffffff0f becomes f)
   arch/x86/kvm/mmu/mmu.c:4622:57: sparse: sparse: cast truncates bits from constant value (ffffff55 becomes 55)

vim +106 arch/x86/kvm/mmu/paging_tmpl.h

b3fcdb04a98035 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2022-06-14  103  
e04da980c35d75 arch/x86/kvm/paging_tmpl.h     Joerg Roedel        2009-07-27  104  static gfn_t gpte_to_gfn_lvl(pt_element_t gpte, int lvl)
5fb07ddb183eb4 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-11-21  105  {
e04da980c35d75 arch/x86/kvm/paging_tmpl.h     Joerg Roedel        2009-07-27 @106  	return (gpte & PT_LVL_ADDR_MASK(lvl)) >> PAGE_SHIFT;
5fb07ddb183eb4 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-11-21  107  }
5fb07ddb183eb4 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-11-21  108  

:::::: The code at line 106 was first introduced by commit
:::::: e04da980c35d75fa050ba4009ad99025432d8d7d KVM: MMU: make page walker aware of mapping levels

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Avi Kivity <avi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
