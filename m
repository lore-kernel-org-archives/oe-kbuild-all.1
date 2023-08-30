Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C583B1847
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Aug 2023 07:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693379950; x=1724915950;
  h=date:from:cc:subject:message-id:mime-version;
  bh=O+SlXaoF55hdYjM0e9UuELl6Kn+1kpPu9CTvGE3dWHA=;
  b=QUKe3+xGfAtAZdkYSRhTZaUIRVt5amcxT3iczvj/xkt+3pfdC+6kpWpw
   G2QPjezX0i8ytfplTjWvTzQbKdpNBEyS1w7sEUVPpIPL2mzVGlQ8BJ+J5
   F06BzIaZGbL/OF+YCBNZyNW3+/z/N2rFN5swGdta2FFjCG2jfjR828odW
   Z35H8tYSwXXaedE1LDmDVDw02B/MNQaqO82x4SmW0o47esTHJ57ukHA9c
   0yhno2JeV+4D/qNrfhn7pURPlk/cnhheSVRp4q2mNSU/pmYpZ/kfBcL9J
   X/MG+ulXkRclKd77UKzQvSOZcwWFnRIBODBg6BNODHEeEXNEwolt2AEIU
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="406567954"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="406567954"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2023 00:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="715796000"
X-IronPort-AV: E=Sophos;i="6.02,212,1688454000"; 
   d="scan'208";a="715796000"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 30 Aug 2023 00:19:04 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qbFTj-0009YZ-17;
	Wed, 30 Aug 2023 07:19:03 +0000
Date: Wed, 30 Aug 2023 15:18:35 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, sys_oak <sys_oak@intel.com>
Subject: [intel-lts:5.15/android_t-cve 1/16] arch/x86/kvm/xen.c:33:17: error:
 implicit declaration of function 'kvm_gfn_to_pfn_cache_destroy'; did you
 mean 'kvm_gfn_to_hva_cache_init'?
Message-ID: <202308301557.YRFlAhyS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t-cve
head:   42e5e003787ea49b32813fe6b85794f6142f9a2f
commit: 460ed4de35779f85d5dc8201100e3e2fd4682268 [1/16] KVM: x86/xen: Maintain valid mapping of Xen shared_info page
config: i386-randconfig-012-20230830 (https://download.01.org/0day-ci/archive/20230830/202308301557.YRFlAhyS-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230830/202308301557.YRFlAhyS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308301557.YRFlAhyS-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/xen.c: In function 'kvm_xen_shared_info_init':
>> arch/x86/kvm/xen.c:33:17: error: implicit declaration of function 'kvm_gfn_to_pfn_cache_destroy'; did you mean 'kvm_gfn_to_hva_cache_init'? [-Werror=implicit-function-declaration]
      33 |                 kvm_gfn_to_pfn_cache_destroy(kvm, gpc);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 kvm_gfn_to_hva_cache_init
>> arch/x86/kvm/xen.c:37:15: error: implicit declaration of function 'kvm_gfn_to_pfn_cache_init'; did you mean 'kvm_gfn_to_hva_cache_init'? [-Werror=implicit-function-declaration]
      37 |         ret = kvm_gfn_to_pfn_cache_init(kvm, gpc, NULL, false, true, gpa,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
         |               kvm_gfn_to_hva_cache_init
   arch/x86/kvm/xen.c: In function 'kvm_xen_hvm_get_attr':
>> arch/x86/kvm/xen.c:320:47: error: 'struct gfn_to_pfn_cache' has no member named 'active'
     320 |                 if (kvm->arch.xen.shinfo_cache.active)
         |                                               ^
>> arch/x86/kvm/xen.c:321:88: error: 'struct gfn_to_pfn_cache' has no member named 'gpa'
     321 |                         data->u.shared_info.gfn = gpa_to_gfn(kvm->arch.xen.shinfo_cache.gpa);
         |                                                                                        ^
   cc1: some warnings being treated as errors


vim +33 arch/x86/kvm/xen.c

    23	
    24	static int kvm_xen_shared_info_init(struct kvm *kvm, gfn_t gfn)
    25	{
    26		struct gfn_to_pfn_cache *gpc = &kvm->arch.xen.shinfo_cache;
    27		gpa_t gpa = gfn_to_gpa(gfn);
    28		int wc_ofs, sec_hi_ofs;
    29		int ret = 0;
    30		int idx = srcu_read_lock(&kvm->srcu);
    31	
    32		if (gfn == GPA_INVALID) {
  > 33			kvm_gfn_to_pfn_cache_destroy(kvm, gpc);
    34			goto out;
    35		}
    36	
  > 37		ret = kvm_gfn_to_pfn_cache_init(kvm, gpc, NULL, false, true, gpa,
    38						PAGE_SIZE, false);
    39		if (ret)
    40			goto out;
    41	
    42		/* Paranoia checks on the 32-bit struct layout */
    43		BUILD_BUG_ON(offsetof(struct compat_shared_info, wc) != 0x900);
    44		BUILD_BUG_ON(offsetof(struct compat_shared_info, arch.wc_sec_hi) != 0x924);
    45		BUILD_BUG_ON(offsetof(struct pvclock_vcpu_time_info, version) != 0);
    46	
    47		/* 32-bit location by default */
    48		wc_ofs = offsetof(struct compat_shared_info, wc);
    49		sec_hi_ofs = offsetof(struct compat_shared_info, arch.wc_sec_hi);
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
