Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778BE1377
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 01:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689472634; x=1721008634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E0I3mZkK0r2evlGTEWFQRj7GtURTid6+eSYp5+soy88=;
  b=fXb798fnx9ZnZcX4YM0fWIL7B1JW9PvsuT0WLb3bjAChSAFwj6vzZziz
   xXzniVqURNV5vi/0X/GRCLmiu9Tq5srv2ugJQ8bh/xpv2+al8Sl4mhECh
   YiYEYRmsR0CxivK07F2mf0fZCtkt6vNFp8cVIBbek4J2gxF7eOU36sBdU
   uafUx1bPgwbr+HSlgKnbFAadgJp+vkGXl4tQSs7icZTnOYxL1CXNWz1tF
   SjbP+oT0rvTyG1AUrVgl52akZnZxx0LTRcA5XSMNDDFiTgt/k1nGa9cmc
   rGIyGgTpUo1WPuGAlEIWChnUCM3Kgh3deZd0KfDviae87ira2PZW7bTmn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="452095650"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="452095650"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 18:57:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="752471095"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="752471095"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 15 Jul 2023 18:57:09 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKr0W-0008SX-2c;
	Sun, 16 Jul 2023 01:57:08 +0000
Date: Sun, 16 Jul 2023 09:56:24 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Roth <michael.roth@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Isaku Yamahata <isaku.yamahata@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 41/365]
 include/linux/kvm_host.h:2369:6: warning: no previous prototype for
 'kvm_arch_gmem_invalidate'
Message-ID: <202307160914.1yNgWg8d-lkp@intel.com>
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
commit: f3918645dc85801290d3e7cf1c2ce9e19b1d8489 [41/365] KVM: x86: Add gmem hook for invalidating private memory
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230716/202307160914.1yNgWg8d-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307160914.1yNgWg8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307160914.1yNgWg8d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/kvm_ppc.h:19,
                    from arch/powerpc/include/asm/dbell.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:36:
>> include/linux/kvm_host.h:2369:6: warning: no previous prototype for 'kvm_arch_gmem_invalidate' [-Wmissing-prototypes]
    2369 | void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:287:57: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
     287 |         bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                         ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:288:49: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                 ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:289:54: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
     289 |         bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                      ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:290:54: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
     290 |         bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                      ^~~~~~~~~~~~~
--
   In file included from arch/powerpc/include/asm/kvm_ppc.h:19,
                    from arch/powerpc/include/asm/dbell.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:36:
>> include/linux/kvm_host.h:2369:6: warning: no previous prototype for 'kvm_arch_gmem_invalidate' [-Wmissing-prototypes]
    2369 | void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:287:57: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
     287 |         bool (*unmap_gfn_range)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                         ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:288:49: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
     288 |         bool (*age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                 ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:289:54: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
     289 |         bool (*test_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                      ^~~~~~~~~~~~~
   arch/powerpc/include/asm/kvm_ppc.h:290:54: warning: 'struct kvm_gfn_range' declared inside parameter list will not be visible outside of this definition or declaration
     290 |         bool (*set_spte_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
         |                                                      ^~~~~~~~~~~~~


vim +/kvm_arch_gmem_invalidate +2369 include/linux/kvm_host.h

  2368	
> 2369	void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
  2370	#endif /* CONFIG_KVM_PRIVATE_MEM */
  2371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
