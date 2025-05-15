Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 358D81C28E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 May 2025 14:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747317893; cv=none; b=Vh2VdqoRiQMHRBJPNRG5x7RkKwnMdDvIEBbwUNCPiNZBU2PK+Tzd7aqudyp4HOhUwc0aG375pUZHBCq4O6OGoz0vE3KGsFQIXVr0/VJY+8Bf+ce6vScYFRrR4EDsGIUYboAxGB+6U/yzvfTP1Yre2FNo0aKoAnIRUiyDrSGtN/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747317893; c=relaxed/simple;
	bh=Qi0QDoNE0xRnk4xDXacgU6YV+2IdESyoViFKyPJHdGA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HWnp2TcE3k+O9WmxGrRlN4+J9qf6GEfLA3QPgAr+NCgQWZpj+2moEd3RWA5xQTCGaFEDhw8YUIfadRaxP7n0EKSWQA7MBW+fETq4n7EH2G/OstL3qqNAiRmyLA2mkv2ueHa3b16k0LcN0JHFqXFwtfoXTEAAtwfePrzhWrWGTaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cMwNjTH/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cMwNjTH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747317893; x=1778853893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Qi0QDoNE0xRnk4xDXacgU6YV+2IdESyoViFKyPJHdGA=;
  b=cMwNjTH/e439zPUKWJmDW2+dTIX1q97BbZjKl5yID+HcVgrRRiNLfne+
   BtUS4EPPZSTXd48CKBsu7NFXE4q/t4B0nVwAWZhzx2uEA/PFuqXMxxJjS
   O5GpfhDM5vUvAD8U+oYE9tS9+gqCL219c4WAGUV++jabS7VeORRplzhIl
   8Rs24DWElaXSa1qQCduUur8gS0iaEV1O3OeUMobQb8JIEwWnIUoj3Cxt4
   9qNkC89hbMvZA5DjkokiV1iiBLnGRDpDwstlZ9sGTDQn7itUNHFpRvg7+
   cdIIm47sTpafcQCGBbZ7OLO6nf4op9lfU7ZH7FLA+u6XT6Bu/JHFf5Qz7
   w==;
X-CSE-ConnectionGUID: Kfwwq3wvT4+Q9hkgZPKLbQ==
X-CSE-MsgGUID: dzY8nGKmRumI/9xgOlo2jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="53068809"
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="53068809"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 07:04:52 -0700
X-CSE-ConnectionGUID: dqucLdG4QNaWfryMy5y4Dg==
X-CSE-MsgGUID: hHC1Vym7Qe+xJcLCD3TXoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,291,1739865600"; 
   d="scan'208";a="142393402"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 May 2025 07:04:50 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFZCa-0000F9-1n;
	Thu, 15 May 2025 14:04:48 +0000
Date: Thu, 15 May 2025 22:04:15 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2229/2229] arch/x86/kvm/svm/sev.c:2198:6:
 warning: no previous prototype for function 'sev_install_hooks'
Message-ID: <202505142149.OSrCD2AH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a53913bacac4876eee9ce118b3101dff842318ef
commit: 0f13b8634792cff1f2fb18bf35e5a24d7a8cbf8e [2229/2229] KVM: x86: Support VM_ATTESTATION hypercall
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250514/202505142149.OSrCD2AH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142149.OSrCD2AH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142149.OSrCD2AH-lkp@intel.com/

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
