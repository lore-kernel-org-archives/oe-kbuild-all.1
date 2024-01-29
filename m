Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244CE4C60B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jan 2024 05:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706507592; cv=none; b=DsX816jHfcm307zgseLkpe8BHKERrgUKDti3zl598o/nBrNUQasegGOMJstKiwIHcoJNhZyYUlejSjmwrCGgPuSe/Jlrh2Er+irhkEoySZFEunXodwWg2oCPCn7+Wip0vVf6xONyOG2NRmYUWNoFBuahQPIqxgdcWk4b8dQ9XhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706507592; c=relaxed/simple;
	bh=zN/Q4bjXDV6B82Ps86dM78RV9GGAc3VMkyiIgBprdi0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rOHr9RY4w/OLJmMOxOufbjDvlxPciTofhyXfxIbCUKDcmslX+O3RWwz9e+E3eNxrWpZgvnuKEThr7foq07gqZqeuwIPJRSHurQcywmUAL8Q6c2iVyEXh+8PNogpdKAmeCfmSvlFDBjsVDLGMt8s2wwsANMPACAXgof2LahwLmkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lYiSieTV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lYiSieTV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706507590; x=1738043590;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zN/Q4bjXDV6B82Ps86dM78RV9GGAc3VMkyiIgBprdi0=;
  b=lYiSieTVge+ZPiHHVbSHIb5HCcGHZqqpdqwBWWriXS/RySmW+uBfYBXT
   s6sf64QX4CY7jnWnABtv2fRr/ShMBZOmJq78kgvt1ano6yajJ3YnE71iA
   GpEIsiyn8Agbe0qZV6pNzRAUWaRYHPw6KnQky4MC0yhci+VpA1rBNS5L9
   3KKZALnaoqbbfNcHvXf9wfbAO/ZuTYhH7n8KvoUPQHGkUQnAriR0VmVkE
   kzKAXkAPPo2O56/SWyiOaXkIqrOp+yblxbWvMh79CPVwrI5zSMGKAoASG
   D69AZTnJ2DjM1ahJoPBAKpvx5bos1xwsWP5UXsvkW5UysdbgorA7sD7Kj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="21387103"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="21387103"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2024 21:53:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="906980498"
X-IronPort-AV: E=Sophos;i="6.05,226,1701158400"; 
   d="scan'208";a="906980498"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 28 Jan 2024 21:53:06 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUKZr-000456-2K;
	Mon, 29 Jan 2024 05:53:03 +0000
Date: Mon, 29 Jan 2024 13:53:02 +0800
From: kernel test robot <lkp@intel.com>
To: Xiong Zhang <xiong.y.zhang@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 15/41] KVM: x86/pmu: Manage MSR interception for
 IA32_PERF_GLOBAL_CTRL
Message-ID: <202401291300.aPnyayyT-lkp@intel.com>
References: <20240126085444.324918-16-xiong.y.zhang@linux.intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126085444.324918-16-xiong.y.zhang@linux.intel.com>

Hi Xiong,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on b85ea95d086471afb4ad062012a4d73cd328fa86]

url:    https://github.com/intel-lab-lkp/linux/commits/Xiong-Zhang/perf-x86-intel-Support-PERF_PMU_CAP_VPMU_PASSTHROUGH/20240126-175444
base:   b85ea95d086471afb4ad062012a4d73cd328fa86
patch link:    https://lore.kernel.org/r/20240126085444.324918-16-xiong.y.zhang%40linux.intel.com
patch subject: [RFC PATCH 15/41] KVM: x86/pmu: Manage MSR interception for IA32_PERF_GLOBAL_CTRL
config: x86_64-randconfig-161-20240129 (https://download.01.org/0day-ci/archive/20240129/202401291300.aPnyayyT-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401291300.aPnyayyT-lkp@intel.com/

smatch warnings:
arch/x86/kvm/vmx/vmx.c:4488 vmx_vmexit_ctrl() warn: inconsistent indenting

vim +4488 arch/x86/kvm/vmx/vmx.c

  4471	
  4472	static u32 vmx_vmexit_ctrl(void)
  4473	{
  4474		u32 vmexit_ctrl = vmcs_config.vmexit_ctrl;
  4475	
  4476		/*
  4477		 * Not used by KVM and never set in vmcs01 or vmcs02, but emulated for
  4478		 * nested virtualization and thus allowed to be set in vmcs12.
  4479		 */
  4480		vmexit_ctrl &= ~(VM_EXIT_SAVE_IA32_PAT | VM_EXIT_SAVE_IA32_EFER |
  4481				 VM_EXIT_SAVE_VMX_PREEMPTION_TIMER);
  4482	
  4483		if (vmx_pt_mode_is_system())
  4484			vmexit_ctrl &= ~(VM_EXIT_PT_CONCEAL_PIP |
  4485					 VM_EXIT_CLEAR_IA32_RTIT_CTL);
  4486	
  4487	       /* Loading of EFER is toggled dynamically */
> 4488	       return vmexit_ctrl & ~VM_EXIT_LOAD_IA32_EFER;
  4489	}
  4490	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
