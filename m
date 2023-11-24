Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3098C2E84D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Nov 2023 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bKERtnob"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700839435; x=1732375435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WU1Tg46XqbZ7qRHIPLDKZptDxegRWgVpYv0dolQhxgU=;
  b=bKERtnobodeW6SoqUk8ArCwgAmpCu0WlzZ5giayvCYb3xuwsLFucdMbu
   ZcBAFiShUDZF1oM1MR5j4aweINYtb/2YmfVW/rGl25h/lHfGSseCxGq3l
   lUnxCQFWwnjgrI03RRKLebpHowbl1WEbuQ5kYjU0XgNckimDP0soNNG0V
   A8XDrU8pRUI/FXsJdzp0wche2XMg2FcPvD/SwY3gxFzFDnagHH4aygHAH
   PjC8oVAEvim6+hIcy+DKs76m+nb03jdHKyDjrkvRrH9fpuDtesxCyb2ZS
   +5Lno4XSseukqDdQMTQposryY43GPqmKXc2fMIjFBslaxLKmpUO2STPJc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="456781768"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="456781768"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2023 07:23:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10904"; a="1014935599"
X-IronPort-AV: E=Sophos;i="6.04,224,1695711600"; 
   d="scan'208";a="1014935599"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 24 Nov 2023 07:23:51 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r6Y21-0002wZ-2g;
	Fri, 24 Nov 2023 15:23:49 +0000
Date: Fri, 24 Nov 2023 23:23:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2023-07 8546/21395]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:249:6: warning: no previous prototype
 for function 'psci_mem_protect_inc'
Message-ID: <202311241718.Ix9oyiCF-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android13-5.15-2023-07
head:   8cf5cf8b918de8faf794b80f93bccd4c073abccf
commit: 4347917056dadaf7856cce8312eb1c55e1372a2a [8546/21395] ANDROID: KVM: arm64: Use PSCI MEM_PROTECT to zap guest pages on reset
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20231124/202311241718.Ix9oyiCF-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231124/202311241718.Ix9oyiCF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311241718.Ix9oyiCF-lkp@intel.com/

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
