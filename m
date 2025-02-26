Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7868322A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Feb 2025 11:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740570744; cv=none; b=QKFoYqd9t/ngb/VL21maMPmA9nYib4ddovk4Qf4LDXgurqTNB09W4Zsh6E4brGClM0IGgO32sIOYFIMAcH2sieTTyQbLRwUR/pnFkKfYRS7fjbqKYXmGZOH6Y098AgDaJK37R1Eg2YQ7fKziYJKPKpRNNYGYFGWfZvgMsT11o5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740570744; c=relaxed/simple;
	bh=DPpiEdZ5bVNm+tIqfVnCGV/6Rk8UVV/bd0GZZPmAB5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LdQygkp+c7B+fxu8Bsq8xzOYjCJTAqHe04ntgdkN1khkobjRTgxak2nx7OeTZbV2Bm0HdQYP9hDIXhLoXphKvVGYhaa4Es36AWcc4r58X7XoeA/BS4F6ZWM7o2CCECCzZ/H6Cc6NDuCojJBe5SmJ8c8Vh/7MX66/GEXp32y1HvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6/HX2fO; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6/HX2fO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740570742; x=1772106742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=DPpiEdZ5bVNm+tIqfVnCGV/6Rk8UVV/bd0GZZPmAB5c=;
  b=K6/HX2fOANXJysDAuPauH8ubSiJPsFyWVkYfJQn/Y+Bj07BpHzmQQBoj
   bG/Vp/8Rq7thgZqBpGH35TR65HyV+O1D3jhCt7MgeywRkijuGPmMPil9M
   DHEcBLhUvxbmGigP63mRRpN5h0Vis58CH5ti/y63ZU54Dtt1tU14Ft81/
   g69KzekAikU9cyIttU7kGZ4WW+Epk7wrdV296yN1Tmc1dQH/aXeF/XZi0
   UCm1wv7CFH9JKxFSHCMgzNIWIZ3ZhXy46JC8crCgTcR26+Nwg6P02uGBq
   +rbr8Cfor9vRi8SnPef1tDnC7JPPndTZ4Gg9KmNOpo0LP9J0z7PnRGVQS
   A==;
X-CSE-ConnectionGUID: jV3hrxzsTjqXSldz1DFNtg==
X-CSE-MsgGUID: lDaW0vZWRbCo1xsmrynOuw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="41287902"
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="41287902"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 03:52:21 -0800
X-CSE-ConnectionGUID: bvGZSrM+Rz2jfzs6l5sl1w==
X-CSE-MsgGUID: nuJZRQXtREWraIrVcJ1FRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,317,1732608000"; 
   d="scan'208";a="121782505"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Feb 2025 03:52:20 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnFxa-000Bd5-05;
	Wed, 26 Feb 2025 11:52:18 +0000
Date: Wed, 26 Feb 2025 19:51:40 +0800
From: kernel test robot <lkp@intel.com>
To: Anshuman Gupta <anshuman.gupta@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 3/6] drm/xe/vrsr: Apis to init and enable VRSR feature
Message-ID: <202502261949.u2h5u96E-lkp@intel.com>
References: <20250224164849.3746751-4-anshuman.gupta@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224164849.3746751-4-anshuman.gupta@intel.com>

Hi Anshuman,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-xe/drm-xe-next]
[also build test ERROR on next-20250226]
[cannot apply to rafael-pm/linux-next rafael-pm/bleeding-edge pci/next pci/for-linus linus/master v6.14-rc4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anshuman-Gupta/PCI-ACPI-Implement-PCI-FW-_DSM-method/20250225-005537
base:   https://gitlab.freedesktop.org/drm/xe/kernel.git drm-xe-next
patch link:    https://lore.kernel.org/r/20250224164849.3746751-4-anshuman.gupta%40intel.com
patch subject: [RFC 3/6] drm/xe/vrsr: Apis to init and enable VRSR feature
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250226/202502261949.u2h5u96E-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250226/202502261949.u2h5u96E-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502261949.u2h5u96E-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: drivers/gpu/drm/xe/xe_bo.o: in function `pci_acpi_request_d3cold_aux_power':
>> xe_bo.c:(.text+0x25a0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_bo.o: in function `pci_acpi_add_perst_assertion_delay':
>> xe_bo.c:(.text+0x25c0): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_bo_evict.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_bo_evict.c:(.text+0x0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_bo_evict.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_bo_evict.c:(.text+0x20): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_devcoredump.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_devcoredump.c:(.text+0x7e0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_devcoredump.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_devcoredump.c:(.text+0x800): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_device.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_device.c:(.text+0x1300): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_device.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_device.c:(.text+0x1320): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_device_sysfs.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_device_sysfs.c:(.text+0x1c0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_device_sysfs.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_device_sysfs.c:(.text+0x1e0): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_dma_buf.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_dma_buf.c:(.text+0x600): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_dma_buf.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_dma_buf.c:(.text+0x620): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_drm_client.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_drm_client.c:(.text+0xac0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_drm_client.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_drm_client.c:(.text+0xae0): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_exec.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_exec.c:(.text+0x40): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_exec.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_exec.c:(.text+0x60): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_exec_queue.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_exec_queue.c:(.text+0xf20): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_exec_queue.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_exec_queue.c:(.text+0xf40): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_execlist.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_execlist.c:(.text+0xbc0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_execlist.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_execlist.c:(.text+0xbe0): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_force_wake.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_force_wake.c:(.text+0x160): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_force_wake.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_force_wake.c:(.text+0x180): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_ggtt.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_ggtt.c:(.text+0x580): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_ggtt.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_ggtt.c:(.text+0x5a0): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gsc.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gsc.c:(.text+0xea0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gsc.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gsc.c:(.text+0xec0): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gsc_debugfs.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gsc_debugfs.c:(.text+0xa0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gsc_debugfs.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gsc_debugfs.c:(.text+0xc0): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gsc_proxy.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gsc_proxy.c:(.text+0x8e0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gsc_proxy.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gsc_proxy.c:(.text+0x900): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gsc_submit.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gsc_submit.c:(.text+0x0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gsc_submit.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gsc_submit.c:(.text+0x20): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gt.c:(.text+0xa40): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gt.c:(.text+0xa60): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_ccs_mode.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gt_ccs_mode.c:(.text+0x520): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_ccs_mode.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gt_ccs_mode.c:(.text+0x540): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_clock.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gt_clock.c:(.text+0x0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_clock.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gt_clock.c:(.text+0x20): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_freq.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gt_freq.c:(.text+0x5c0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_freq.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gt_freq.c:(.text+0x5e0): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_idle.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gt_idle.c:(.text+0x140): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_idle.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gt_idle.c:(.text+0x160): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_mcr.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gt_mcr.c:(.text+0x6c0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_mcr.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gt_mcr.c:(.text+0x6e0): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_pagefault.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gt_pagefault.c:(.text+0x14e0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_pagefault.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gt_pagefault.c:(.text+0x1500): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_sysfs.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gt_sysfs.c:(.text+0x80): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_sysfs.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gt_sysfs.c:(.text+0xa0): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_throttle.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gt_throttle.c:(.text+0x40): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_throttle.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gt_throttle.c:(.text+0x60): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_gt_tlb_invalidation.c:(.text+0xba0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xa0): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/xe_gt_tlb_invalidation.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_gt_tlb_invalidation.c:(.text+0xbc0): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/xe_bb.o:xe_bb.c:(.text+0xc0): first defined here
--
   sparc64-linux-ld: drivers/gpu/drm/xe/tests/xe_rtp_test.o: in function `pci_acpi_request_d3cold_aux_power':
>> xe_rtp_test.c:(.text+0x800): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/tests/xe_pci_test.o:xe_pci_test.c:(.text+0x200): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/tests/xe_rtp_test.o: in function `pci_acpi_add_perst_assertion_delay':
>> xe_rtp_test.c:(.text+0x820): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/tests/xe_pci_test.o:xe_pci_test.c:(.text+0x220): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/tests/xe_wa_test.o: in function `pci_acpi_request_d3cold_aux_power':
   xe_wa_test.c:(.text+0x5c0): multiple definition of `pci_acpi_request_d3cold_aux_power'; drivers/gpu/drm/xe/tests/xe_pci_test.o:xe_pci_test.c:(.text+0x200): first defined here
   sparc64-linux-ld: drivers/gpu/drm/xe/tests/xe_wa_test.o: in function `pci_acpi_add_perst_assertion_delay':
   xe_wa_test.c:(.text+0x5e0): multiple definition of `pci_acpi_add_perst_assertion_delay'; drivers/gpu/drm/xe/tests/xe_pci_test.o:xe_pci_test.c:(.text+0x220): first defined here

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
