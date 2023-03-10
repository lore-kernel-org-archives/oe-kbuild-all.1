Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518BE63B5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 12:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678451240; x=1709987240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=20T26mWj/HSyWAVcfmuCs8J5+xyl7Pl/8FBnPh5pa5c=;
  b=DJELwJggbsjSoiBBJIJYxRRUBUpacECioXEwSl8/KnSUF0JFzyXSloPV
   k250VlrrWuiGMFPXb+Joqs1G2aveEd7XNDUAL1ys4OlbH3MgbRCucLQdE
   HNNp7Pyc2UK4eyogXfKbA3BbJQSZJEqMA6Mv0N8llx153Uf/WCKT5LrfC
   qsVKI6Vw/b2Xae8IEy+fHYYcTOmRsmAwkqtNR3yvJKFmUFljR8Oi3NQYZ
   QUg/GziMDeUOPomig6/aNx9rFZuqWLMR1Vyf2SDklDiefXAgNrwTvTT29
   BjeOVRjUoHTDhr/QsZWiRgaEHQTiAylTqj+GUMxoXz5ZzVing90CaNUhw
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="335413539"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="335413539"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 04:27:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="923670308"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="923670308"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2023 04:27:18 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pabq9-0003qN-32;
	Fri, 10 Mar 2023 12:27:17 +0000
Date: Fri, 10 Mar 2023 20:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 425/432]
 arch/x86/kvm/mmu/mmu.c:701:5: warning: no previous prototype for
 'kvm_mmu_topup_memory_cache_for_split'
Message-ID: <202303102057.9IdfLcEO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   b4a08c4cd3ed29e3977509b24adc2c59e39825c1
commit: 40b0194e911eba584f34f1ff407cb2abf1844656 [425/432] [REVERTME] KVM: TDX, x86/tdp_mmu: Protect Secure-EPT page
config: x86_64-randconfig-a015 (https://download.01.org/0day-ci/archive/20230310/202303102057.9IdfLcEO-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/intel/tdx/commit/40b0194e911eba584f34f1ff407cb2abf1844656
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout 40b0194e911eba584f34f1ff407cb2abf1844656
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303102057.9IdfLcEO-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/mmu/mmu.c:701:5: warning: no previous prototype for 'kvm_mmu_topup_memory_cache_for_split' [-Wmissing-prototypes]
     701 | int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/kvm_mmu_topup_memory_cache_for_split +701 arch/x86/kvm/mmu/mmu.c

   700	
 > 701	int kvm_mmu_topup_memory_cache_for_split(struct kvm *kvm)
   702	{
   703		int r = 0;
   704	#ifdef CONFIG_INTEL_TDX_HOST_DEBUG_MEMORY_CORRUPT
   705		struct kvm_mmu_memory_cache *mc;
   706		int start, end, i;
   707	
   708		mutex_lock(&kvm->arch.private_spt_for_split_lock);
   709		mc = &kvm->arch.private_spt_for_split_cache;
   710		start = kvm_mmu_memory_cache_nr_free_objects(mc);
   711		r = kvm_mmu_topup_memory_cache(mc, KVM_MAX_HUGEPAGE_LEVEL *
   712					       kvm->created_vcpus);
   713		end = kvm_mmu_memory_cache_nr_free_objects(mc);
   714		for (i = start; i < end; i++)
   715			kvm_mmu_split_direct_map(virt_to_page(mc->objects[i]));
   716		mutex_unlock(&kvm->arch.private_spt_for_split_lock);
   717	#endif
   718		return r;
   719	}
   720	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
