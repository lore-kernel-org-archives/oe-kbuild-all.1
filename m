Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B672572
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Jan 2024 08:17:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gd6H/N54"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705306648; x=1736842648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z2cEfo/jGNBlG35I+dnKU0J7vo1COhOK1ce58mn07VQ=;
  b=Gd6H/N54Y4SKouAumQ4tU3sEw1Zr77PVqZU5TrlcNNYP6ok8ZFmoqWaP
   GZgi/I1GRumz2uLITPc0zQZQ5mJH5skHz41HHLGwZbTEExzdKdsVIejCH
   nDPZoM4va0HpIOcCMVWbCeP2XVIX+36JyJLno4Ce5EGA3Z6+gWVIb/16S
   iF46iqln9KmC2CaKyoD1T40SE5QIL14W/MEr22vEor0eDJGu48bB0m2ih
   gxT6M3LGARVXTQ2In23qsZeZjdQybQ8tsUxOYStJ1wc8A8lCxJ9lvUU2X
   uE/jgxM4WM71cgCaTE4hRaVay4K9Ea5ImXBdd57fncml99xI0s8FB7tfe
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="12918399"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="12918399"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2024 00:17:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="956753046"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; 
   d="scan'208";a="956753046"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Jan 2024 00:17:24 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rPI9d-000CJi-0I;
	Mon, 15 Jan 2024 08:17:11 +0000
Date: Mon, 15 Jan 2024 16:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.10 17571/30000]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:249:6: warning: no previous prototype
 for 'psci_mem_protect_inc'
Message-ID: <202401151643.mLcl4xVa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.10
head:   57bec5e659b43d5c29cd8678f5888f3bf2594bcf
commit: ba73e0b827383ff4ede2036f5bae8424896139f3 [17571/30000] ANDROID: KVM: arm64: Use PSCI MEM_PROTECT to zap guest pages on reset
config: arm64-randconfig-r016-20230905 (https://download.01.org/0day-ci/archive/20240115/202401151643.mLcl4xVa-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240115/202401151643.mLcl4xVa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401151643.mLcl4xVa-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/hyp/nvhe/psci-relay.c:204:28: warning: no previous prototype for 'kvm_host_psci_cpu_entry' [-Wmissing-prototypes]
     204 | asmlinkage void __noreturn kvm_host_psci_cpu_entry(bool is_cpu_on)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:249:6: warning: no previous prototype for 'psci_mem_protect_inc' [-Wmissing-prototypes]
     249 | void psci_mem_protect_inc(void)
         |      ^~~~~~~~~~~~~~~~~~~~
>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:256:6: warning: no previous prototype for 'psci_mem_protect_dec' [-Wmissing-prototypes]
     256 | void psci_mem_protect_dec(void)
         |      ^~~~~~~~~~~~~~~~~~~~


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
