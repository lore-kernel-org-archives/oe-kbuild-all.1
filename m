Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03231953BA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Sep 2024 17:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727716348; cv=none; b=HNzy5jRRQFlHOhCnuLd9PMx/JwtrLURrmu+zKH+4I0MSKdO3fAulFR7XT4cdOYTOagBQo9Q+9gVa7NOKQvr+6pCUobCWnxu9v6H/TBUtgZ5NlAhNL2CX8Xe6E4ZXnglImjDYLWeKSA78ajw7UO7Vn4+cPi0xqyFpI2HXl4KywWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727716348; c=relaxed/simple;
	bh=uTpQhHtdCQN7k46+VAhqX8Pazasc4zNynik3gexH8ac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BJj1q2ZAMsBm4gVMbuosTGW8MxINknl37LFBSwwLhq+0A40ckeL0+Q3VkPreUWYTC9iSrRlkHwcx2kb/NbF6F8NSRAhqRiyHgjUrzX9AwoFog1BMg9EjJ5kGuMNx5Ku1mv3K2L4y3QI/AKirDG2Cgvm6WOhpmXTN56bUR+BBLwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i2+dLLtd; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i2+dLLtd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727716347; x=1759252347;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uTpQhHtdCQN7k46+VAhqX8Pazasc4zNynik3gexH8ac=;
  b=i2+dLLtdYnGhzVLXF+zZKnzVBsTT4qYFyST/Wau3DleUPkW29PFmG9g3
   ctxbwaGXLSHocTyzpQjsjU+RPkatWYX+1Jyx1GAoxfoP9IDfjkUa1rVnY
   Xqn2Q6A6KZ8vOp1sPq+SPvr/ucGHoRFwPwjj23+4rxfJW+WhenmXkTZSP
   A9XNihX7BkJlOCmXJCu7hhicAmRMFu6tehoJDmMobehLbEo/90eGHGajW
   rSBwlEo/p9CLa416NkEjIco6ow9qB0k9UWopStvzOl0VvHh68jDTrlgP4
   zWb5EYNES8G7qdzhlFvzRMxNaAy00c/gVAUuowpOYnJlBnDOEah9heXpx
   Q==;
X-CSE-ConnectionGUID: cY60Br9PT2iBBABTgg0eyw==
X-CSE-MsgGUID: kpV/Cka+RLq6uB3xVSoOaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11211"; a="52234306"
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="52234306"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 10:12:26 -0700
X-CSE-ConnectionGUID: o3ojEA4mSymojfHTgV5Ulw==
X-CSE-MsgGUID: k/LbphKQQ6WFg9KLcfztoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,166,1725346800"; 
   d="scan'208";a="78337193"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 30 Sep 2024 10:12:25 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1svJwc-000Phy-0N;
	Mon, 30 Sep 2024 17:12:22 +0000
Date: Tue, 1 Oct 2024 01:11:24 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 13/32]
 arch/x86/kvm/vmx/vmx.c:2068:12: warning: 'fred_msr_to_vmcs' defined but not
 used
Message-ID: <202410010105.NgxDkT0X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   0326778edd0df2412da8d92f4dfd73fc9c99b2aa
commit: 8545a8c57be37b958b3d0f22aa32590d4b0f32d5 [13/32] KVM: VMX: Add support for FRED context save/restore
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20241001/202410010105.NgxDkT0X-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241001/202410010105.NgxDkT0X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410010105.NgxDkT0X-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/vmx/vmx.c:2068:12: warning: 'fred_msr_to_vmcs' defined but not used [-Wunused-function]
    2068 | static u32 fred_msr_to_vmcs(u32 msr)
         |            ^~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MODVERSIONS
   Depends on [n]: MODULES [=y] && !COMPILE_TEST [=y]
   Selected by [y]:
   - RANDSTRUCT_FULL [=y] && (CC_HAS_RANDSTRUCT [=n] || GCC_PLUGINS [=y]) && MODULES [=y]
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=m]


vim +/fred_msr_to_vmcs +2068 arch/x86/kvm/vmx/vmx.c

  2067	
> 2068	static u32 fred_msr_to_vmcs(u32 msr)
  2069	{
  2070		int i = msr - MSR_IA32_FRED_RSP1;
  2071	
  2072		BUILD_BUG_ON(msr == MSR_IA32_FRED_RSP0);
  2073		BUILD_BUG_ON(msr == MSR_IA32_FRED_SSP0);
  2074	
  2075		return fred_msr_vmcs_fields[i];
  2076	}
  2077	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
