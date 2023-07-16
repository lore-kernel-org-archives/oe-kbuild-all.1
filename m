Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4F8815A0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 03:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689477133; x=1721013133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gl1zQPPDdqvmx3eNOLYSwZ5ic8KzTrkJ2iTRYJXVEWI=;
  b=Y95QoLyvNznrnlNSoMZXAG3LpevRgkfz1Yx1OcBtctMZtqG2gHLTXc5U
   /mfEHtjO9SEnhRBk9Tnl4YeoVp2MUX5eIQawJVy6o8JqHAA/5+Gid29cz
   dlttkllweoEwirM5dS++fhcdpC2mYBbihHlBnqUphX22DMjYX/Q3HUIBO
   dSMPMNMQGj1kRGlSeupuNR5AuictD8RWUtGWdpOmkvmaCoErcJ/MDpmuz
   2nNt9nlK3npfCifv5lELPoQD0x0PIRD3UKzAb3CxJu0hKx+Qun/py26Z+
   SVxve5J04tlAbpbejJXDuoRuGwocd9gbp1jDXkXxhEHnmPogUSkacsh/G
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="365767336"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="365767336"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 20:12:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="1053498808"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="1053498808"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 15 Jul 2023 20:12:12 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKsB8-0008WL-33;
	Sun, 16 Jul 2023 03:12:10 +0000
Date: Sun, 16 Jul 2023 11:11:17 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 121/365]
 arch/x86/kvm/vmx/main.c:185:17: error: implicit declaration of function
 'tdx_flush_tlb_current'; did you mean 'vmx_flush_tlb_current'?
Message-ID: <202307161153.qNPVFKV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   da8c3aa0cbb638a0dff13401bc17f817272110e6
commit: 5f81f9f172b39f1502e95ae8e9120d71b7673e7e [121/365] KVM: TDX: TDP MMU TDX support
config: x86_64-randconfig-m001-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161153.qNPVFKV2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161153.qNPVFKV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161153.qNPVFKV2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/x86_ops.h:5,
                    from arch/x86/kvm/vmx/main.c:4:
   include/linux/kvm_host.h:2370:6: warning: no previous prototype for 'kvm_arch_gmem_invalidate' [-Wmissing-prototypes]
    2370 | void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/main.c: In function 'vt_flush_tlb_current':
>> arch/x86/kvm/vmx/main.c:185:17: error: implicit declaration of function 'tdx_flush_tlb_current'; did you mean 'vmx_flush_tlb_current'? [-Werror=implicit-function-declaration]
     185 |                 tdx_flush_tlb_current(vcpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 vmx_flush_tlb_current
   cc1: some warnings being treated as errors


vim +185 arch/x86/kvm/vmx/main.c

   181	
   182	static void vt_flush_tlb_current(struct kvm_vcpu *vcpu)
   183	{
   184		if (is_td_vcpu(vcpu)) {
 > 185			tdx_flush_tlb_current(vcpu);
   186			return;
   187		}
   188	
   189		vmx_flush_tlb_current(vcpu);
   190	}
   191	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
