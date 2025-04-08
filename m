Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2B38253F13
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 21:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744149007; cv=none; b=qafL96poNNMkSHyQQGVdxxz8OJ3WJua6NVbkt+Nb41B3RzQJngAOCqGecDvOGr9aSGN+pvpsz5t5uzFjTkT/nw2f82GYBtMUGZmLCIQugp6/AYBV084DjmtWYgJf7I6eMGy6Dn2Aa+9jn9nDOAwjFg+wcYfzdpLVWIwc7JBjU5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744149007; c=relaxed/simple;
	bh=GSMFaRLoEuSIAyffxC6WOQb7OG//tuEi21Jg7RRdjz0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WOS2f9tu8XjEcoALVtUjRgB5qsy6TPavlhxaatbHIQOxKqqf77m7j4kteY6uv/d9jMicMywe45naob0722Ei6aQ8ZzYG5dk9rUn2SdQ4eRvgXgx4bjq6kNpx9xHYddO3YMN9fKao8ykJZXHRJkhXYbejfh6cnFuT9+8ZxFKr+Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EI3sGVVy; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EI3sGVVy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744149005; x=1775685005;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GSMFaRLoEuSIAyffxC6WOQb7OG//tuEi21Jg7RRdjz0=;
  b=EI3sGVVyhWyb+ZnyP50b9RbeiQxX4GHjwfOef24sWv14eBYdlG8sJVIR
   pMqwSsaFDRkNojrbiqXIp/e4lnpS3UtOlzkzUwX7sVmzJgCeGsRTD5UdV
   vflhya1PpRVGYEq/BI9TfBknqjWX0+3+BNNK0y5Cmd/Af7pnfZuCc+L/q
   ldBV4NIk1G1l9vcjciqgk3oim9Evd76XOXoZORHiLz0sVfjglL/aay9Vz
   5QTTmAALiJM7sPAagJAxT7xOMS2zRGJRpYDB7LN7Z1NRIKzr9bzfc8Egm
   bogJ8Uue/al3zJ9pBIlAMiz1sYGEZYEU2OHlxcNwpRjbVIm0EJGayrEsP
   A==;
X-CSE-ConnectionGUID: NJyelUdUQQmqk7hyPN4ygQ==
X-CSE-MsgGUID: eqV27Ek6RKeEP53npevEfg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="63148441"
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="63148441"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2025 14:50:04 -0700
X-CSE-ConnectionGUID: F7RIFGE4RTC+3ZeI4jfYzw==
X-CSE-MsgGUID: iQzdKn/hQ8uzlbRm2xbVXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,199,1739865600"; 
   d="scan'208";a="128253793"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 08 Apr 2025 14:49:59 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u2GpQ-00080N-33;
	Tue, 08 Apr 2025 21:49:56 +0000
Date: Wed, 9 Apr 2025 05:49:44 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 arch/arm64/kvm/hyp/nvhe/pkvm.c:1725:5: warning: no previous prototype for
 function '__pkvm_register_guest_smc_handler'
Message-ID: <202504090545.JuUjQuPY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   18cdf1640453646a9af3fd13887ca53b9fbc31ee
commit: 340ef6cb4081cb305235a059f1c142345ac1a71d [1/1] ANDROID: KVM: arm64: Add smc64 trap handling for protected guests
config: arm64-randconfig-001-20250409 (https://download.01.org/0day-ci/archive/20250409/202504090545.JuUjQuPY-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 92c93f5286b9ff33f27ff694d2dc33da1c07afdd)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250409/202504090545.JuUjQuPY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504090545.JuUjQuPY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/pkvm.c:1725:5: warning: no previous prototype for function '__pkvm_register_guest_smc_handler' [-Wmissing-prototypes]
    1725 | int __pkvm_register_guest_smc_handler(bool (*cb)(struct arm_smccc_1_2_regs *,
         |     ^
   arch/arm64/kvm/hyp/nvhe/pkvm.c:1725:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    1725 | int __pkvm_register_guest_smc_handler(bool (*cb)(struct arm_smccc_1_2_regs *,
         | ^
         | static 
   1 warning generated.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for USB_PHY
   Depends on [n]: USB_SUPPORT [=n]
   Selected by [y]:
   - GKI_HIDDEN_USB_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for PHYLINK
   Depends on [n]: NETDEVICES [=n]
   Selected by [y]:
   - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=n] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=n] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y] && 64BIT [=y]


vim +/__pkvm_register_guest_smc_handler +1725 arch/arm64/kvm/hyp/nvhe/pkvm.c

  1724	
> 1725	int __pkvm_register_guest_smc_handler(bool (*cb)(struct arm_smccc_1_2_regs *,
  1726							 struct arm_smccc_res *res,
  1727							 pkvm_handle_t handle),
  1728					      pkvm_handle_t handle)
  1729	{
  1730		int ret = -EINVAL;
  1731		struct pkvm_hyp_vm *vm;
  1732	
  1733		if (!cb)
  1734			return ret;
  1735	
  1736		hyp_read_lock(&vm_table_lock);
  1737		vm = get_vm_by_handle(handle);
  1738		if (vm)
  1739			ret = cmpxchg_release(&vm->smc_handler, NULL, cb) ? -EBUSY : 0;
  1740		hyp_read_unlock(&vm_table_lock);
  1741	
  1742		return ret;
  1743	}
  1744	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
