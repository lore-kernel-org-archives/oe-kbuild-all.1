Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D4F762D8
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 10:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707389502; cv=none; b=A904VArIIDYFtYidnxZT95G2DbKiRn1mxkw5WOA6AZ6wTvVhwG30RX0FytvMreCUcfOaKv3z/I+azg09He+QVMqBxQFs0AJr2xuHUfmJ58ut9J1VoslWYXlXlColwHs9k6AJWCvkzwU3ofsAai/C6VCU84L18suAZ9AL4z+RRvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707389502; c=relaxed/simple;
	bh=V2LL3hUu14KqtBIkEV+g3tZXTp5TLyskIK6/4Pu6+O0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h0lGSN2RjBFTRzFb8Q8wOlQenjhdE7Iv7oo2A75Nxz64++f6APu96Y1HA57iv0RNiJMa9w8Vr2h/OgQQmSQwdxrD3bZNIxDp/YUGxSvg5wh+sQ2NP7lazdRUZpIJ+dZnQ/BgjHiK1apPF+bsEsnNZKrvNm4rm45P2868Qqr4X6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KjIBkdHH; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KjIBkdHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707389500; x=1738925500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V2LL3hUu14KqtBIkEV+g3tZXTp5TLyskIK6/4Pu6+O0=;
  b=KjIBkdHHeKDoVLWaH93uRLdCwK20pvnbEb1hd/2qY8zMH6y4OrwM8ndr
   pzJP//BA5Ar4dyQTfJqbhVhzUUMI/oAysstaKw29epfbaQlVv87+ba/OP
   sulArN8bp1hxhOG6D/k6GsQEFm5HeIDsP6Lg7jemSEXIGJvu98rR0wPYx
   CNaGb5M5L6bde4BUu3BgQ/F2yjIvtWY5mMOFLD3qbcPI+tEXWeqN7MCY/
   tTxHe01tqY3NzBKclQqCjpDFuLF68sLzo5uBOKCDdOdnELHgnFQFhvRuC
   CD2qEMHqyUaj/BmQrCBrNhvAiOTOZ0uGJBfS9z0kGZIMU6iHWuTOp2q+V
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1328483"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1328483"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 02:51:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1647982"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Feb 2024 02:51:37 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rY20E-0003fa-36;
	Thu, 08 Feb 2024 10:51:34 +0000
Date: Thu, 8 Feb 2024 18:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Chenyi Qiang <chenyi.qiang@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 66/376]
 arch/x86/kvm/vmx/main.c:83:23: error: 'struct kvm_x86_ops' has no member
 named 'flush_remote_tlbs'
Message-ID: <202402081822.CySgBFg6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   e7a7b1f2a1c28403511e71538d30888c9e1425ef
commit: 154dd2ab6afc31785ec68ff099e8c54618a0e49c [66/376] KVM: TDX: TDP MMU TDX support
config: x86_64-randconfig-003-20240208 (https://download.01.org/0day-ci/archive/20240208/202402081822.CySgBFg6-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402081822.CySgBFg6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402081822.CySgBFg6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/vmx/main.c: In function 'vt_hardware_setup':
>> arch/x86/kvm/vmx/main.c:83:23: error: 'struct kvm_x86_ops' has no member named 'flush_remote_tlbs'
      83 |         if (vt_x86_ops.flush_remote_tlbs ||
         |                       ^
>> arch/x86/kvm/vmx/main.c:84:23: error: 'struct kvm_x86_ops' has no member named 'flush_remote_tlbs_range'
      84 |             vt_x86_ops.flush_remote_tlbs_range) {
         |                       ^
   arch/x86/kvm/vmx/main.c:92:27: error: 'struct kvm_x86_ops' has no member named 'flush_remote_tlbs'
      92 |                 vt_x86_ops.flush_remote_tlbs = vt_flush_remote_tlbs;
         |                           ^


vim +83 arch/x86/kvm/vmx/main.c

    50	
    51	static __init int vt_hardware_setup(void)
    52	{
    53		int ret;
    54	
    55		ret = vmx_hardware_setup();
    56		if (ret)
    57			return ret;
    58	
    59		/*
    60		 * As kvm_mmu_set_ept_masks() updates enable_mmio_caching, call it
    61		 * before checking enable_mmio_caching.
    62		 */
    63		if (enable_ept)
    64			kvm_mmu_set_ept_masks(enable_ept_ad_bits,
    65					      cpu_has_vmx_ept_execute_only());
    66		/* TDX requires KVM TDP MMU. */
    67		if (enable_tdx && !tdp_enabled) {
    68			enable_tdx = false;
    69			pr_warn_ratelimited("TDX requires TDP MMU.  Please enable TDP MMU for TDX.\n");
    70		}
    71	
    72		/* TDX requires MMIO caching. */
    73		if (enable_tdx && !enable_mmio_caching) {
    74			enable_tdx = false;
    75			pr_warn_ratelimited("TDX requires mmio caching.  Please enable mmio caching for TDX.\n");
    76		}
    77	
    78		/*
    79		 * TDX KVM overrides flush_remote_tlbs method and assumes
    80		 * flush_remote_tlbs_range = NULL that falls back to
    81		 * flush_remote_tlbs.  Disable TDX if there are conflicts.
    82		 */
  > 83		if (vt_x86_ops.flush_remote_tlbs ||
  > 84		    vt_x86_ops.flush_remote_tlbs_range) {
    85			enable_tdx = false;
    86			pr_warn_ratelimited("TDX requires baremetal. Not Supported on VMM guest.\n");
    87		}
    88	
    89		enable_tdx = enable_tdx && !tdx_hardware_setup(&vt_x86_ops);
    90	
    91		if (enable_tdx)
    92			vt_x86_ops.flush_remote_tlbs = vt_flush_remote_tlbs;
    93	
    94		return 0;
    95	}
    96	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
