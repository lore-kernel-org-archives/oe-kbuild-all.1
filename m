Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDCF79D9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 07:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eik93Pjw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702884333; x=1734420333;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PT2y7Y8tTRAhXZO9PqEySZz4GYqUZPqZD7wIBsTwCLY=;
  b=eik93Pjw42aHCAI8+gutcZ2XzauPkd72o3fvdgArUWCpY/i5twJHqLxs
   C/yxK2JYUGA5MsrbtrN5VUC1wEIteq4vVGBduNyITAd14fnyYy2iown3K
   r7fcysdyBlY2XR9V8uwh0FBUHN0bwr26y3dfC0+BQbHPWJcsoPCjnrjWL
   2oiHNLQ2ldJPlba3Oq5w9qkYRsGEVHYGsV2vczvAzHbe51n2oMdMh16t9
   L+9v0rDvIZEGTEmKqyhd5VOXYnRaN/K20nh9wahoWZV3ZzZPwk/PDSucL
   iTkmx0aY380xh2AQ9MKwcZ+aAcmrfLD4OoWL+DGBxpQ3X1Rgj3yBeTpJs
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="374966340"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="374966340"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 23:25:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="809711681"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="809711681"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 17 Dec 2023 23:25:28 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rF80E-0003rP-1k;
	Mon, 18 Dec 2023 07:25:26 +0000
Date: Mon, 18 Dec 2023 15:25:02 +0800
From: kernel test robot <lkp@intel.com>
To: Andi Kleen <ak@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [intel-tdx:guest 97/136] arch/x86/kvm/svm/svm.c:514:17: sparse:
 sparse: cast truncates bits from constant value (100000000 becomes 0)
Message-ID: <202312181532.SgsMpoxw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/tdx.git guest
head:   f3d7a7e86bf2f0d5ce629f2fb7be11dca88ac06d
commit: c34bfda30e18342b8ae7856fd59b76e9ca938460 [97/136] x86/tdx/paravirt: Move wrmsrl outside PARAVIRT_XXL
config: i386-randconfig-061-20230904 (https://download.01.org/0day-ci/archive/20231218/202312181532.SgsMpoxw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231218/202312181532.SgsMpoxw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312181532.SgsMpoxw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/svm/svm.c: note: in included file (through arch/x86/include/asm/msr.h, arch/x86/include/asm/processor.h, arch/x86/include/asm/cpufeature.h, ...):
   arch/x86/include/asm/paravirt.h:120:38: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
   arch/x86/include/asm/paravirt.h:120:38: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
>> arch/x86/kvm/svm/svm.c:514:17: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
>> arch/x86/kvm/svm/svm.c:514:17: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
>> arch/x86/kvm/svm/svm.c:514:17: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)

vim +514 arch/x86/kvm/svm/svm.c

6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  480  
0fe1e009541e92 arch/x86/kvm/svm.c     Tejun Heo         2009-10-29  481  	struct svm_cpu_data *sd;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  482  	uint64_t efer;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  483  	struct desc_struct *gdt;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  484  	int me = raw_smp_processor_id();
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  485  
10474ae8945ce0 arch/x86/kvm/svm.c     Alexander Graf    2009-09-15  486  	rdmsrl(MSR_EFER, efer);
10474ae8945ce0 arch/x86/kvm/svm.c     Alexander Graf    2009-09-15  487  	if (efer & EFER_SVME)
10474ae8945ce0 arch/x86/kvm/svm.c     Alexander Graf    2009-09-15  488  		return -EBUSY;
10474ae8945ce0 arch/x86/kvm/svm.c     Alexander Graf    2009-09-15  489  
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  490  	if (!has_svm()) {
1f5b77f51a221f arch/x86/kvm/svm.c     Borislav Petkov   2012-10-20  491  		pr_err("%s: err EOPNOTSUPP on %d\n", __func__, me);
10474ae8945ce0 arch/x86/kvm/svm.c     Alexander Graf    2009-09-15  492  		return -EINVAL;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  493  	}
0fe1e009541e92 arch/x86/kvm/svm.c     Tejun Heo         2009-10-29  494  	sd = per_cpu(svm_data, me);
0fe1e009541e92 arch/x86/kvm/svm.c     Tejun Heo         2009-10-29  495  	if (!sd) {
1f5b77f51a221f arch/x86/kvm/svm.c     Borislav Petkov   2012-10-20  496  		pr_err("%s: svm_data is NULL on %d\n", __func__, me);
10474ae8945ce0 arch/x86/kvm/svm.c     Alexander Graf    2009-09-15  497  		return -EINVAL;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  498  	}
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  499  
0fe1e009541e92 arch/x86/kvm/svm.c     Tejun Heo         2009-10-29  500  	sd->asid_generation = 1;
0fe1e009541e92 arch/x86/kvm/svm.c     Tejun Heo         2009-10-29  501  	sd->max_asid = cpuid_ebx(SVM_CPUID_FUNC) - 1;
0fe1e009541e92 arch/x86/kvm/svm.c     Tejun Heo         2009-10-29  502  	sd->next_asid = sd->max_asid + 1;
ed3cd233f80740 arch/x86/kvm/svm.c     Brijesh Singh     2017-12-04  503  	sd->min_asid = max_sev_asid + 1;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  504  
45fc8757d1d212 arch/x86/kvm/svm.c     Thomas Garnier    2017-03-14  505  	gdt = get_current_gdt_rw();
0fe1e009541e92 arch/x86/kvm/svm.c     Tejun Heo         2009-10-29  506  	sd->tss_desc = (struct kvm_ldttss_desc *)(gdt + GDT_ENTRY_TSS);
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  507  
9962d032bbff02 arch/x86/kvm/svm.c     Alexander Graf    2008-11-25  508  	wrmsrl(MSR_EFER, efer | EFER_SVME);
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  509  
85ca8be938c0e6 arch/x86/kvm/svm/svm.c Tom Lendacky      2020-12-10  510  	wrmsrl(MSR_VM_HSAVE_PA, __sme_page_pa(sd->save_area));
10474ae8945ce0 arch/x86/kvm/svm.c     Alexander Graf    2009-09-15  511  
fbc0db76b77125 arch/x86/kvm/svm.c     Joerg Roedel      2011-03-25  512  	if (static_cpu_has(X86_FEATURE_TSCRATEMSR)) {
fbc0db76b77125 arch/x86/kvm/svm.c     Joerg Roedel      2011-03-25  513  		wrmsrl(MSR_AMD64_TSC_RATIO, TSC_RATIO_DEFAULT);
89cbc76768c2fa arch/x86/kvm/svm.c     Christoph Lameter 2014-08-17 @514  		__this_cpu_write(current_tsc_ratio, TSC_RATIO_DEFAULT);
fbc0db76b77125 arch/x86/kvm/svm.c     Joerg Roedel      2011-03-25  515  	}
fbc0db76b77125 arch/x86/kvm/svm.c     Joerg Roedel      2011-03-25  516  
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  517  
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  518  	/*
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  519  	 * Get OSVW bits.
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  520  	 *
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  521  	 * Note that it is possible to have a system with mixed processor
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  522  	 * revisions and therefore different OSVW bits. If bits are not the same
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  523  	 * on different processors then choose the worst case (i.e. if erratum
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  524  	 * is present on one processor and not on another then assume that the
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  525  	 * erratum is present everywhere).
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  526  	 */
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  527  	if (cpu_has(&boot_cpu_data, X86_FEATURE_OSVW)) {
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  528  		uint64_t len, status = 0;
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  529  		int err;
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  530  
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  531  		len = native_read_msr_safe(MSR_AMD64_OSVW_ID_LENGTH, &err);
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  532  		if (!err)
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  533  			status = native_read_msr_safe(MSR_AMD64_OSVW_STATUS,
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  534  						      &err);
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  535  
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  536  		if (err)
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  537  			osvw_status = osvw_len = 0;
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  538  		else {
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  539  			if (len < osvw_len)
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  540  				osvw_len = len;
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  541  			osvw_status |= status;
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  542  			osvw_status &= (1ULL << osvw_len) - 1;
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  543  		}
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  544  	} else
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  545  		osvw_status = osvw_len = 0;
2b036c6b861dc5 arch/x86/kvm/svm.c     Boris Ostrovsky   2012-01-09  546  
67ec66077799f2 arch/x86/kvm/svm.c     Joerg Roedel      2010-05-17  547  	svm_init_erratum_383();
67ec66077799f2 arch/x86/kvm/svm.c     Joerg Roedel      2010-05-17  548  
1018faa6cf23b2 arch/x86/kvm/svm.c     Joerg Roedel      2012-02-29  549  	amd_pmu_enable_virt();
1018faa6cf23b2 arch/x86/kvm/svm.c     Joerg Roedel      2012-02-29  550  
10474ae8945ce0 arch/x86/kvm/svm.c     Alexander Graf    2009-09-15  551  	return 0;
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  552  }
6aa8b732ca01c3 drivers/kvm/svm.c      Avi Kivity        2006-12-10  553  

:::::: The code at line 514 was first introduced by commit
:::::: 89cbc76768c2fa4ed95545bf961f3a14ddfeed21 x86: Replace __get_cpu_var uses

:::::: TO: Christoph Lameter <cl@linux.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
