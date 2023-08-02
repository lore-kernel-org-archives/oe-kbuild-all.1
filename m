Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B07011C86
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Aug 2023 20:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691007207; x=1722543207;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AE677IyOIv4dead+/DgvpEUahJxcTY7apCsVXC/YaDc=;
  b=gtbdvWHzfrs1MRuzOaGe0CkFWbPNnKBTvG/UdPs+iWRD0q60YY5eXRnj
   KD9MSWvB6hHFN1PYtGQZktSG+x/xXdnKmCH3k8/6ioEL2UmyQ5f0fMF4L
   ZHBCNnXC7he2coc0gZ3TDB5LEkstgJVyuFQ2fF9MKbbKUrNH3X+52D+km
   mYI2OKdiaAjAffnrgioPzpAOA9uWRbAi/Lb5tEZQPJ6Yvf2EqxFmggaf5
   jrmxo9mJqiGZtqc+hR7J1EQqdxx670A7ZhJbl/5JsaFH3rjgt1FF0lF28
   cWxMGGmWm+bDme65QapGpngvRD1oBTBsFN3lMYEhnwtskxA7SIiQ5zs76
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="349985327"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="349985327"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 13:13:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10790"; a="843276974"
X-IronPort-AV: E=Sophos;i="6.01,250,1684825200"; 
   d="scan'208";a="843276974"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2023 13:13:25 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRIDk-0001ST-2k;
	Wed, 02 Aug 2023 20:13:24 +0000
Date: Thu, 3 Aug 2023 04:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 8546/23252]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:249:6: warning: no previous prototype
 for function 'psci_mem_protect_inc'
Message-ID: <202308030445.VNc2xVa7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   bd148ab7d833a2f41222011bbdc03e58ad78dea1
commit: 4347917056dadaf7856cce8312eb1c55e1372a2a [8546/23252] ANDROID: KVM: arm64: Use PSCI MEM_PROTECT to zap guest pages on reset
config: arm64-randconfig-r023-20230731 (https://download.01.org/0day-ci/archive/20230803/202308030445.VNc2xVa7-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230803/202308030445.VNc2xVa7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308030445.VNc2xVa7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/psci-relay.c:204:28: warning: no previous prototype for function 'kvm_host_psci_cpu_entry' [-Wmissing-prototypes]
     204 | asmlinkage void __noreturn kvm_host_psci_cpu_entry(bool is_cpu_on)
         |                            ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:204:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
     204 | asmlinkage void __noreturn kvm_host_psci_cpu_entry(bool is_cpu_on)
         |            ^
         |            static 
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:249:6: warning: no previous prototype for function 'psci_mem_protect_inc' [-Wmissing-prototypes]
     249 | void psci_mem_protect_inc(void)
         |      ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:249:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     249 | void psci_mem_protect_inc(void)
         | ^
         | static 
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:256:6: warning: no previous prototype for function 'psci_mem_protect_dec' [-Wmissing-prototypes]
     256 | void psci_mem_protect_dec(void)
         |      ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:256:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     256 | void psci_mem_protect_dec(void)
         | ^
         | static 
   3 warnings generated.


vim +/psci_mem_protect_inc +249 arch/arm64/kvm/hyp/nvhe/psci-relay.c

   248	
 > 249	void psci_mem_protect_inc(void)
   250	{
   251		hyp_spin_lock(&mem_protect_lock);
   252		psci_mem_protect(1);
   253		hyp_spin_unlock(&mem_protect_lock);
   254	}
   255	
 > 256	void psci_mem_protect_dec(void)
   257	{
   258		hyp_spin_lock(&mem_protect_lock);
   259		psci_mem_protect(-1);
   260		hyp_spin_unlock(&mem_protect_lock);
   261	}
   262	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
