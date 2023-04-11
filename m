Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E022F21
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 21:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681249725; x=1712785725;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DldaJ4R/Ybs+8WPeZq27udgyU1y/WOXKMsqwL5Rr7Lk=;
  b=joKmDRLjXWyVKWUeqdPj2dmkWCW/mxL2onAXUesMNOMImoKBtmp7nhzP
   1HHUwa6usaf6S1b/Qu4O/JdNpEcwujk9eNZWzWnMWsxCLsRcV1SdMB1Oe
   ZT7iNCNZ+Q920byhImPu9jHW/HJWlvwcymaxFMTBRXGyMshS4skGoDQzb
   K0ayyAvorWw1EpqJh6tCPBzRoN/xzB4DQ3/G2uFSOvLRc3U8RwGWIDi6S
   NcwhInvMcJDDSU0hu7Pp7vema7bMDNOCh5yW4OcQmiUYfBlwk9kTXlqJx
   QLS9ORVjHYJ+Kz5fAFdqXWF0/geXT3rVws/eAFgUi49StG+AigY4reT3u
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="327846859"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="327846859"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 14:48:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="688726698"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="688726698"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 Apr 2023 14:48:30 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmLqn-000Wk8-0y;
	Tue, 11 Apr 2023 21:48:29 +0000
Date: Wed, 12 Apr 2023 05:48:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 1/1]
 arch/arm64/kvm/hyp/nvhe/mem_protect.c:635:5: warning: no previous prototype
 for '__pkvm_host_set_stage2_memattr'
Message-ID: <202304120528.CxxugDJA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   18c78ecd82b4d8522fcd2a2459af5f27f06fe9b2
commit: 18c78ecd82b4d8522fcd2a2459af5f27f06fe9b2 [1/1] ANDROID: arm64: Implement hypervisor workaround for SoCs with DMA beyond the PoC
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20230412/202304120528.CxxugDJA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-5.15
        git checkout 18c78ecd82b4d8522fcd2a2459af5f27f06fe9b2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120528.CxxugDJA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/mem_protect.c:635:5: warning: no previous prototype for '__pkvm_host_set_stage2_memattr' [-Wmissing-prototypes]
     635 | int __pkvm_host_set_stage2_memattr(phys_addr_t phys, bool force_nc)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


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
