Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CD9D30E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jan 2024 05:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705987946; cv=none; b=q/qd4h6NlMMIUouIuBbdns0fJwQ6OnCrE9/muBmiIR0henKQb/8oxGGSHb1MI+5kWX2fx3f2Wy+31PtNAZdiA7cxJ6fgLMg5XhKE4fgMFJ2PVjKSRJdYO/j7w4WLi1RGmQ1fifS/0kzU6L5hlQcLA3kRlAdu+aJL8vsVFmPxw2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705987946; c=relaxed/simple;
	bh=3IAMYVLfe2NuZsxkGcoycWAXu1mulfJ2xkw6d/remYw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IyyWcv9CUKyB4fY4kQs33mWkKmSj1tt95saxl3HbswiUSYIQIUrMx5oZXt0zlomKqGtHkUFgKisilNiTuuJUEDC5hHCqntjWZIrVimBHOmO9y0tTkKt1Rn36Dv7yhUSvI9DjAvy1Uj4hpUa3TFUAw4iYGg8eyINuFILugigzn5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VsCEbvAw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VsCEbvAw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705987944; x=1737523944;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3IAMYVLfe2NuZsxkGcoycWAXu1mulfJ2xkw6d/remYw=;
  b=VsCEbvAwYP/qJcVuKY1LEEXGzf8Na2c3h2oha/76wqTJq+5EvXTlRBQi
   Z0fqmA+J1m82Mhb9Ok6QlpvqRCxqKiq4toUZWMCWxDKi//h9ugDVZzYwJ
   1GwacWvHmODDOdO+KHJwNr9+BRbrtE4A0zeh2AftVdsmnZ0aueFvzZLG1
   K30eZ+QO0GEGE/bW8cD9n4Z/Oqv6phsQf7qHuxNDXYe0jPVbWqQEp+0Ne
   qgnuP+YEUGKZGEWgNiIHkUIh4/rDMFnmT43SJFG+aCHLcREn53zr1IGm+
   IVC3eh6jCSZvNzD2+UGrScu8g/3adF3tmzDCV6vpUmTXJJQCsRV+YFgU+
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="8530636"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="8530636"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2024 21:32:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10961"; a="905111732"
X-IronPort-AV: E=Sophos;i="6.05,213,1701158400"; 
   d="scan'208";a="905111732"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Jan 2024 21:32:22 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rS9OW-0007C8-0E;
	Tue, 23 Jan 2024 05:32:20 +0000
Date: Tue, 23 Jan 2024 13:31:22 +0800
From: kernel test robot <lkp@intel.com>
To: Isaku Yamahata <isaku.yamahata@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-tdx:kvm-upstream-next 70/252] arch/x86/kvm/vmx/main.c:83:23:
 error: 'struct kvm_x86_ops' has no member named 'flush_remote_tlbs'
Message-ID: <202401231310.9NVkrmc4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git kvm-upstream-next
head:   cd5f3a9ef935bc249a18a3c6607ae2128c1ced06
commit: a47c5a9442130f45fc09c1d4ae0e4352054be636 [70/252] KVM: TDX: TDP MMU TDX support
config: i386-buildonly-randconfig-002-20240123 (https://download.01.org/0day-ci/archive/20240123/202401231310.9NVkrmc4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240123/202401231310.9NVkrmc4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401231310.9NVkrmc4-lkp@intel.com/

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
