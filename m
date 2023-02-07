Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B8BE28E7
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Feb 2023 12:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675774265; x=1707310265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O++/lZ2sf4hbS8bnGvK860mCGQ70J8LnSKDU0DNNpQQ=;
  b=NlshjeuQbs7kLfpuDf0HGc7wWRbNFIYbPb4VdDBN3xJSE6zRwTcp6RnO
   0SKvqq4J1jndQjrPDk82dOGZymcJzZC8tTaDHRE6XelUfb8hY/FOXfBYA
   m9Mj/9Ia9TzMyDqtYp1GO5Ag1h0DwozS30qIs477H8r0oD5ZaNz2RMNu1
   5oCrzE8PZMJh6l0qlC5JVdyAGngMTnAuxQs+86/sYU8d4yBjVtPutNGbR
   TQzsGVeegpz/vyfWQGmY5E2O3J0lTIpbrv39CvDEtuJ909PGNkaDxcWGf
   uKsvBgobhRVp6lMEaPuKgcAHAjADTcAQPof2r9lbAbOP4XFSaRvnunLdw
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="329513428"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="329513428"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2023 04:51:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="775551488"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="775551488"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2023 04:51:01 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pPNR7-0003YH-0V;
	Tue, 07 Feb 2023 12:51:01 +0000
Date: Tue, 7 Feb 2023 20:50:11 +0800
From: kernel test robot <lkp@intel.com>
To: David Matlack <dmatlack@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kai Huang <kai.huang@intel.com>,
	Sean Christopherson <seanjc@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [linux-next:master 911/10933] arch/x86/kvm/mmu/mmu.c:102:22: sparse:
 sparse: symbol 'tdp_mmu_allowed' was not declared. Should it be static?
Message-ID: <202302072055.odjDVd5V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   49a8133221c71b935f36a7c340c0271c2a9ee2db
commit: 3af15ff47c4df3af7b36ea8315f43c6b0af49253 [911/10933] KVM: x86/mmu: Change tdp_mmu to a read-only parameter
config: x86_64-randconfig-s023-20230206 (https://download.01.org/0day-ci/archive/20230207/202302072055.odjDVd5V-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=3af15ff47c4df3af7b36ea8315f43c6b0af49253
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 3af15ff47c4df3af7b36ea8315f43c6b0af49253
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/mmu.c:102:22: sparse: sparse: symbol 'tdp_mmu_allowed' was not declared. Should it be static?
   arch/x86/kvm/mmu/mmu.c:621:9: sparse: sparse: context imbalance in 'walk_shadow_page_lockless_begin' - different lock contexts for basic block
   arch/x86/kvm/mmu/mmu.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, arch/x86/kvm/irq.h):
   include/linux/rcupdate.h:769:9: sparse: sparse: context imbalance in 'walk_shadow_page_lockless_end' - unexpected unlock
   arch/x86/kvm/mmu/mmu.c:2741:9: sparse: sparse: context imbalance in 'mmu_try_to_unsync_pages' - different lock contexts for basic block
   arch/x86/kvm/mmu/mmu.c: note: in included file:
   arch/x86/kvm/mmu/paging_tmpl.h:106:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   arch/x86/kvm/mmu/paging_tmpl.h:426:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
   arch/x86/kvm/mmu/mmu.c:4871:57: sparse: sparse: cast truncates bits from constant value (ffffff33 becomes 33)
   arch/x86/kvm/mmu/mmu.c:4873:56: sparse: sparse: cast truncates bits from constant value (ffffff0f becomes f)
   arch/x86/kvm/mmu/mmu.c:4875:57: sparse: sparse: cast truncates bits from constant value (ffffff55 becomes 55)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
