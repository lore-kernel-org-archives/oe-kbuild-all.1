Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D776B383
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 02:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681265022; x=1712801022;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZSGTfUZrOk2YOm8Z0v4PcDjKY7q4m9MDJvlI19LZ6KM=;
  b=NtxFaE6CqNwjx9ULnpRQdXXlv0Plmys6660Ubvf4QevzMEmBt31N/pz8
   LN4nMQ4hBY5e3TZ8gA3pdPQV5U+zH0Xpgcl/hovj/VmHvpOec2+05p14+
   e196o6zweKf7mxhp6RTlvK0IfJaPpVZGV8Qnsuh6k3C0UYzohfJyJOwvr
   uXgHyYCuTJWbDeihPjB+HHD4QybgvzWLQXU5E0Nr0qHPA2zrAbQjTaDqm
   I7yaHZ76fhxyNc+TdIV8h8yH25EryrdL/7BpYJKhdMOt5tHM8dsD4SQsH
   IJxDhMZuPACdMUNkgbgayPr+85GOLK6AM/9wRhYJkuPCSI4PsJqypoTMy
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="342537763"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="342537763"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 19:03:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="682319807"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="682319807"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 11 Apr 2023 19:03:40 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmPpj-000Wyt-2a;
	Wed, 12 Apr 2023 02:03:39 +0000
Date: Wed, 12 Apr 2023 10:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 1/1]
 arch/arm64/kvm/hyp/nvhe/mem_protect.c:635:5: warning: no previous prototype
 for function '__pkvm_host_set_stage2_memattr'
Message-ID: <202304120935.P7dMHbVv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   3e4bbbe1031b326d90db83d7a1b36251ac2f6cf7
commit: d56ad709773a90012b44e87c0c233faebdcf5823 [1/1] ANDROID: arm64: Implement hypervisor workaround for SoCs with DMA beyond the PoC
config: arm64-randconfig-r031-20230410 (https://download.01.org/0day-ci/archive/20230412/202304120935.P7dMHbVv-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 2c57868e2e877f73c339796c3374ae660bb77f0d)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-6.1
        git checkout d56ad709773a90012b44e87c0c233faebdcf5823
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120935.P7dMHbVv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:635:5: warning: no previous prototype for function '__pkvm_host_set_stage2_memattr' [-Wmissing-prototypes]
   int __pkvm_host_set_stage2_memattr(phys_addr_t phys, bool force_nc)
       ^
   arch/arm64/kvm/hyp/nvhe/mem_protect.c:635:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __pkvm_host_set_stage2_memattr(phys_addr_t phys, bool force_nc)
   ^
   static 
   1 warning generated.


vim +/__pkvm_host_set_stage2_memattr +635 arch/arm64/kvm/hyp/nvhe/mem_protect.c

   634	
 > 635	int __pkvm_host_set_stage2_memattr(phys_addr_t phys, bool force_nc)
   636	{
   637		kvm_pte_t pte;
   638		int ret = 0;
   639	
   640		if (!static_branch_unlikely(&pkvm_force_nc))
   641			return -ENOENT;
   642	
   643		phys = ALIGN_DOWN(phys, PAGE_SIZE);
   644		hyp_spin_lock(&host_mmu.lock);
   645	
   646		ret = kvm_pgtable_get_leaf(&host_mmu.pgt, phys, &pte, NULL);
   647		if (ret)
   648			goto unlock;
   649	
   650		if (!addr_is_memory(phys)) {
   651			ret = -EIO;
   652			goto unlock;
   653		}
   654	
   655		if (!kvm_pte_valid(pte) && pte) {
   656			switch (pte) {
   657			case DEFERRED_MEMATTR_NOTE:
   658				break;
   659			default:
   660				ret = -EPERM;
   661			}
   662		} else if (host_get_page_state(pte, phys) != PKVM_PAGE_OWNED) {
   663			ret = -EPERM;
   664		}
   665	
   666		if (ret)
   667			goto unlock;
   668	
   669		if (force_nc) {
   670			ret = host_stage2_idmap_locked(phys, PAGE_SIZE,
   671						       PKVM_HOST_MEM_PROT |
   672						       KVM_PGTABLE_PROT_NC,
   673						       false);
   674			if (ret)
   675				goto unlock;
   676	
   677			kvm_flush_dcache_to_poc(hyp_fixmap_map_nc(phys), PAGE_SIZE);
   678			hyp_fixmap_unmap();
   679		} else {
   680			ret = kvm_pgtable_stage2_annotate(&host_mmu.pgt, phys,
   681							  PAGE_SIZE, &host_s2_pool,
   682							  DEFERRED_MEMATTR_NOTE);
   683		}
   684	unlock:
   685		hyp_spin_unlock(&host_mmu.lock);
   686		return ret;
   687	}
   688	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
