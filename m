Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52D5161
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jul 2023 02:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689473231; x=1721009231;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=72QOuAdax9Ap+iDmU6w9WKdDkQK6mOAd//CS0MSie8U=;
  b=kdpMOYq7qXmpiCZgd3fdEdkJBl/vAoBMsuJ3uFcfU6LHlMv7Qcdmqc6x
   QSPTKYf+FNsQGpc2RgqmtY0a+uSUmPym8aRFGD565hwupGoFvFpni0YiO
   wdXHxIeOqeU1LtHTwTLh6wuNpOCA+dnMWxOUT7NRgCfaIrmpd/wSZr8kp
   jqnj29k2vaVebmeKKHu4UO3mFk10yB0Ffc963LyH6CV0gu/mua25Kk12V
   Mv3RenAyUGoPd1fXWKG4OxZSOqkBkXMkx3i/S3fD5/wfaa+zdpiEK1r2A
   VJgr1Km4LJtTqNlWchePRM7XxLgnznGcxp5SzwQ502MI1/sIi3DM79q7m
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="345314949"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="345314949"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2023 19:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10772"; a="788233413"
X-IronPort-AV: E=Sophos;i="6.01,209,1684825200"; 
   d="scan'208";a="788233413"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 15 Jul 2023 19:07:10 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qKrAD-0008T7-0L;
	Sun, 16 Jul 2023 02:07:09 +0000
Date: Sun, 16 Jul 2023 10:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-workaround 122/365]
 arch/x86/kvm/vmx/main.c:247:6: warning: no previous prototype for
 'vt_set_memory_attributes'
Message-ID: <202307161059.pz4gEdjh-lkp@intel.com>
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
commit: 7ead2f69626501b5fc9041b2c111f6d082e23bc4 [122/365] KVM: TDX: implement set_memory_attributes() callback
config: x86_64-randconfig-m001-20230716 (https://download.01.org/0day-ci/archive/20230716/202307161059.pz4gEdjh-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230716/202307161059.pz4gEdjh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307161059.pz4gEdjh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kvm/vmx/x86_ops.h:5,
                    from arch/x86/kvm/vmx/main.c:4:
   include/linux/kvm_host.h:2370:6: warning: no previous prototype for 'kvm_arch_gmem_invalidate' [-Wmissing-prototypes]
    2370 | void kvm_arch_gmem_invalidate(struct kvm *kvm, kvm_pfn_t start, kvm_pfn_t end) { }
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/vmx/main.c: In function 'vt_flush_tlb_current':
   arch/x86/kvm/vmx/main.c:185:17: error: implicit declaration of function 'tdx_flush_tlb_current'; did you mean 'vmx_flush_tlb_current'? [-Werror=implicit-function-declaration]
     185 |                 tdx_flush_tlb_current(vcpu);
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 vmx_flush_tlb_current
   arch/x86/kvm/vmx/main.c: At top level:
>> arch/x86/kvm/vmx/main.c:247:6: warning: no previous prototype for 'vt_set_memory_attributes' [-Wmissing-prototypes]
     247 | bool vt_set_memory_attributes(struct kvm *kvm, struct kvm_gfn_range *range)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/vt_set_memory_attributes +247 arch/x86/kvm/vmx/main.c

   246	
 > 247	bool vt_set_memory_attributes(struct kvm *kvm, struct kvm_gfn_range *range)
   248	{
   249		if (is_td(kvm))
   250			return tdx_set_memory_attributes(kvm, range);
   251	
   252		if (kvm->arch.vm_type == KVM_X86_PROTECTED_VM)
   253			return kvm_unmap_gfn_range(kvm, range);
   254		return false;
   255	}
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
