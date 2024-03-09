Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DA96249ED
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 23:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710025907; cv=none; b=s9DiKzb1KcVCQDriNMcFVGyphCQMWxuoEBDV3ZGlUfrtNwAcwYzkQsvLkgYGJ60nwXytxzBej9m4bnsL3gt54LnwbR+34BWgL58xPDv2aSIBv6CIyGdL25IuYgT+jrL3a99Vm82k2b8axPor5WiBfxOhghiDcpY91dhTEhxDqkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710025907; c=relaxed/simple;
	bh=gyYxUYpeM9X/NzrgYByRye6Hg65q0lIUhdpbWcZHe1A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KRZS2fCJZE+MQxjs6DqK59jbLfzuc043FmTrr2ga2DvTFcRzN7H4Vclyq2m6YPqZZ/PF3VbbGDVIT6FJtNBHviQfiUmssWsIBtW5jOUDI320xa1j/GPO4XmFl+8RV5dSiH4abld6eohMfWk5UN7RbBewd1Qj6GyfAPzaTN9vd2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNIipmpm; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNIipmpm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710025905; x=1741561905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gyYxUYpeM9X/NzrgYByRye6Hg65q0lIUhdpbWcZHe1A=;
  b=SNIipmpmjwr3+QrqDrI634nlGW52dqc7VO7Az30pygTl5s+EaAOvGQOq
   1kGEsqSRrzbEJUfup/IJnui8/tAZ8ttqXVnlBDt/YX+zuzcpk3epDFer0
   N6RKGAG9l61wxztQUMrmAYFrn3NNF0gc/d6h19y9EaKePFhitb5p+YuHj
   YWuoICAaGvAKu4oloae9fjAPOFKlWNPnVMXXbnNRuGWrP+DIiiljCzrx6
   kuYX4Vxc0ofi4YWgmrtKyx4UUhmyYF1vc+8Grph4s/x9eMUmoPcf9eGOS
   V++XeqHnr+S2VtVTSawRHIvo+zj8pLU7uyx+bAQ+miRHsZVjR+0DbeBVa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11008"; a="8539748"
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="8539748"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2024 15:11:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,113,1708416000"; 
   d="scan'208";a="15454226"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Mar 2024 15:11:42 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rj5qu-0007ip-0J;
	Sat, 09 Mar 2024 23:11:40 +0000
Date: Sun, 10 Mar 2024 07:11:21 +0800
From: kernel test robot <lkp@intel.com>
To: Nuno Das Neves <nunodasneves@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mhklinux@outlook.com>
Subject: [hyperv:hyperv-next 3/4] arch/x86/kernel/cpu/mshyperv.c:353:5:
 warning: no previous prototype for function 'hv_get_hypervisor_version'
Message-ID: <202403100705.ZfEcVV0P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   65530a174ea36a9d5eee3c62523f088ecdf2d874
commit: 1634df06ea125911c4a9afdcd1729d57fdd4f48e [3/4] mshyperv: Introduce hv_get_hypervisor_version function
config: x86_64-randconfig-121-20240309 (https://download.01.org/0day-ci/archive/20240310/202403100705.ZfEcVV0P-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240310/202403100705.ZfEcVV0P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403100705.ZfEcVV0P-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mshyperv.c:353:5: warning: no previous prototype for function 'hv_get_hypervisor_version' [-Wmissing-prototypes]
     353 | int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
         |     ^
   arch/x86/kernel/cpu/mshyperv.c:353:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     353 | int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
         | ^
         | static 
   1 warning generated.


vim +/hv_get_hypervisor_version +353 arch/x86/kernel/cpu/mshyperv.c

   352	
 > 353	int hv_get_hypervisor_version(union hv_hypervisor_version_info *info)
   354	{
   355		unsigned int hv_max_functions;
   356	
   357		hv_max_functions = cpuid_eax(HYPERV_CPUID_VENDOR_AND_MAX_FUNCTIONS);
   358		if (hv_max_functions < HYPERV_CPUID_VERSION) {
   359			pr_err("%s: Could not detect Hyper-V version\n", __func__);
   360			return -ENODEV;
   361		}
   362	
   363		cpuid(HYPERV_CPUID_VERSION, &info->eax, &info->ebx, &info->ecx, &info->edx);
   364	
   365		return 0;
   366	}
   367	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
