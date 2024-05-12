Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0BFF8C05
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 May 2024 02:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715480559; cv=none; b=lOodc/G6TdSsc+teVy8Riu6dAG0dCL+Hilvxu643QI4WmTmqYaEBGgDLJ5FgyHG7HajefKWWRBFn1Af1SqUzPgw3HSKPNLa5/94r4Iptk5MGC/v+FVgvR5nFNBl8ACeLC5da2uJRnHvpy9kO7vqcgDBD9u0jG1nJKzUBeYd+my0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715480559; c=relaxed/simple;
	bh=OJ+E/zqsp/xJPSM7gyR5u1283QEpl4pysGhicM4ZtKE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nbADm6O1sd2ZfSUqxnHcuCNxNp8seBpUpUjFdeFfuY6pmqSGEGzCS6d9TfE99FqOxgFh5QoU3wU18cD6HX3Sxp7q99TZNrMzyPI8lR29eJNZ1W4o4LJJcwBXThb0Ny64RG4pf0kHQdpZKuKMJ2oymhePasEw68fdMHJicyemxbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DUvceg39; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DUvceg39"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715480557; x=1747016557;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OJ+E/zqsp/xJPSM7gyR5u1283QEpl4pysGhicM4ZtKE=;
  b=DUvceg39zywqX+VrBFd8nYSiqSvk5H8OnP4WZRAa2uPXN9O/z2SVT/v4
   m3sQeTidDN5njUT04vWRVh2mll6oz/OcXI1zQSvCDjINYX3YELbuboLEJ
   OV6ueOIRt3pimKQG4jqdIFfFCvuWTZwZHUuGlEGLYS0Q+Ek8kMrcZMBJs
   g8Cx73+CXEx9hG1sBhB/beN8I0fXdh3KAbpW8wEYBW4VB6CgUV+njaeAI
   rIHyYu08sOW14kx4IzoJjdYTyaQL32/CIDYAvdCJVf+k7bbIZ3Qo59zNr
   Ws7NvlxlTD4xyBIuiTHG9PJeWjQp1n2geed0EBf2B4NRWq3rwnKNvdVTt
   g==;
X-CSE-ConnectionGUID: ihm9ZjQLQfmjNXzcHmW+VA==
X-CSE-MsgGUID: GNxbA24XTWaLfB3kGmxGuw==
X-IronPort-AV: E=McAfee;i="6600,9927,11070"; a="15238898"
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="15238898"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2024 19:22:36 -0700
X-CSE-ConnectionGUID: M07JSNd5QI+xg/C3ideIFA==
X-CSE-MsgGUID: Uw6y4I+aREOsU7BDWADeeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,155,1712646000"; 
   d="scan'208";a="34678154"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 May 2024 19:22:34 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s5yr9-00084H-0e;
	Sun, 12 May 2024 02:22:31 +0000
Date: Sun, 12 May 2024 10:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 6543/6591] arch/x86/kvm/svm/sev.c:2198:6: warning:
 no previous prototype for function 'sev_install_hooks'
Message-ID: <202405121048.zeZDeaWp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   af8a5753e476c40851cc338e3ac6aa2d962d05a1
commit: fe2fcb68d587062952e8cb2b6c14d55ab127f686 [6543/6591] KVM: x86: Support VM_ATTESTATION hypercall
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240512/202405121048.zeZDeaWp-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240512/202405121048.zeZDeaWp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405121048.zeZDeaWp-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/svm/sev.c:2198:6: warning: no previous prototype for function 'sev_install_hooks' [-Wmissing-prototypes]
    2198 | void sev_install_hooks(void)
         |      ^
   arch/x86/kvm/svm/sev.c:2198:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2198 | void sev_install_hooks(void)
         | ^
         | static 
   1 warning generated.
--
>> arch/x86/kvm/svm/csv.c:30:5: warning: no previous prototype for function 'csv_vm_attestation' [-Wmissing-prototypes]
      30 | int csv_vm_attestation(struct kvm *kvm, unsigned long gpa, unsigned long len)
         |     ^
   arch/x86/kvm/svm/csv.c:30:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      30 | int csv_vm_attestation(struct kvm *kvm, unsigned long gpa, unsigned long len)
         | ^
         | static 
   1 warning generated.


vim +/sev_install_hooks +2198 arch/x86/kvm/svm/sev.c

  2195	
  2196	#ifdef CONFIG_HYGON_CSV
  2197	/* Code to set all of the function and vaiable pointers */
> 2198	void sev_install_hooks(void)
  2199	{
  2200		hygon_kvm_hooks.sev_issue_cmd = sev_issue_cmd;
  2201		hygon_kvm_hooks.get_num_contig_pages = get_num_contig_pages;
  2202		hygon_kvm_hooks.sev_pin_memory = sev_pin_memory;
  2203		hygon_kvm_hooks.sev_unpin_memory = sev_unpin_memory;
  2204	
  2205		hygon_kvm_hooks.sev_hooks_installed = true;
  2206	}
  2207	#endif
  2208	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
