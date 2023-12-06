Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67DB47F47
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Dec 2023 19:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VUEWKnyB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701891318; x=1733427318;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NliOpi/Evz1YoLL4WUwH1bwinD5G7FtkujhvbOs/aEM=;
  b=VUEWKnyBc8gC0qbcgJmMXmXB04PrqUgGiV+dLe1iQa/eauLW+OG6IX35
   6/ZNlR5kmnUo5j0uGIbonXRD5GWtTdAiQVZ4aiYwyl111hwRfVLGW8vfd
   ar2+dR7foDngPMmdQGKsfQI//0emPsd9Ye9z8w+cvDzRA9nW5QGsVeXWD
   n9v4YoXl3yMUDfP6oOJwU2D1HN1Emi3gHtjkl9I3NQQryfj4+8E//lARA
   SoNtaLRW253cMLvluda6PD97V81V+A9qjH6wUGatGDok87TlNdVSmp1GV
   96Md7nGItHqBGW3mkQoHyCEHQJ+ufMwv1duDXOY1QvcZMkP1BaOtDgdJ4
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="396902005"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="396902005"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2023 11:35:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10916"; a="775122120"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="775122120"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 06 Dec 2023 11:35:16 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAxfu-000BKZ-1B;
	Wed, 06 Dec 2023 19:35:14 +0000
Date: Thu, 7 Dec 2023 03:34:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 8866/29950] arch/x86/kvm/svm.c:945:17:
 sparse: sparse: cast truncates bits from constant value (100000000 becomes
 0)
Message-ID: <202312070325.G1kUeuvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   1303f659c2b14b2e1b45dca5e98b79a2b818d4f6
commit: 70c62d7976e25bb80906db42c8a093d93a6b6185 [8866/29950] FROMGIT: x86/percpu: Clean up percpu_to_op()
config: i386-randconfig-062-20231201 (https://download.01.org/0day-ci/archive/20231207/202312070325.G1kUeuvB-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231207/202312070325.G1kUeuvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312070325.G1kUeuvB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/x86/kvm/svm.c:945:17: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
>> arch/x86/kvm/svm.c:945:17: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
>> arch/x86/kvm/svm.c:945:17: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)
   arch/x86/kvm/svm.c: note: in included file (through include/linux/bitops.h, include/linux/kernel.h, include/linux/list.h, ...):
   arch/x86/include/asm/bitops.h:77:37: sparse: sparse: cast truncates bits from constant value (ffffff7f becomes 7f)
   arch/x86/kvm/svm.c:6776:60: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/svm.c:6776:60: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/svm.c:6799:14: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/svm.c:6805:59: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/svm.c:6805:59: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/svm.c:6819:14: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/svm.c:6844:70: sparse: sparse: dereference of noderef expression
   arch/x86/kvm/svm.c:6844:70: sparse: sparse: dereference of noderef expression

vim +945 arch/x86/kvm/svm.c

6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  911  
0fe1e009541e92 arch/x86/kvm/svm.c Tejun Heo         2009-10-29  912  	struct svm_cpu_data *sd;
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  913  	uint64_t efer;
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  914  	struct desc_struct *gdt;
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  915  	int me = raw_smp_processor_id();
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  916  
10474ae8945ce0 arch/x86/kvm/svm.c Alexander Graf    2009-09-15  917  	rdmsrl(MSR_EFER, efer);
10474ae8945ce0 arch/x86/kvm/svm.c Alexander Graf    2009-09-15  918  	if (efer & EFER_SVME)
10474ae8945ce0 arch/x86/kvm/svm.c Alexander Graf    2009-09-15  919  		return -EBUSY;
10474ae8945ce0 arch/x86/kvm/svm.c Alexander Graf    2009-09-15  920  
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  921  	if (!has_svm()) {
1f5b77f51a221f arch/x86/kvm/svm.c Borislav Petkov   2012-10-20  922  		pr_err("%s: err EOPNOTSUPP on %d\n", __func__, me);
10474ae8945ce0 arch/x86/kvm/svm.c Alexander Graf    2009-09-15  923  		return -EINVAL;
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  924  	}
0fe1e009541e92 arch/x86/kvm/svm.c Tejun Heo         2009-10-29  925  	sd = per_cpu(svm_data, me);
0fe1e009541e92 arch/x86/kvm/svm.c Tejun Heo         2009-10-29  926  	if (!sd) {
1f5b77f51a221f arch/x86/kvm/svm.c Borislav Petkov   2012-10-20  927  		pr_err("%s: svm_data is NULL on %d\n", __func__, me);
10474ae8945ce0 arch/x86/kvm/svm.c Alexander Graf    2009-09-15  928  		return -EINVAL;
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  929  	}
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  930  
0fe1e009541e92 arch/x86/kvm/svm.c Tejun Heo         2009-10-29  931  	sd->asid_generation = 1;
0fe1e009541e92 arch/x86/kvm/svm.c Tejun Heo         2009-10-29  932  	sd->max_asid = cpuid_ebx(SVM_CPUID_FUNC) - 1;
0fe1e009541e92 arch/x86/kvm/svm.c Tejun Heo         2009-10-29  933  	sd->next_asid = sd->max_asid + 1;
ed3cd233f80740 arch/x86/kvm/svm.c Brijesh Singh     2017-12-04  934  	sd->min_asid = max_sev_asid + 1;
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  935  
45fc8757d1d212 arch/x86/kvm/svm.c Thomas Garnier    2017-03-14  936  	gdt = get_current_gdt_rw();
0fe1e009541e92 arch/x86/kvm/svm.c Tejun Heo         2009-10-29  937  	sd->tss_desc = (struct kvm_ldttss_desc *)(gdt + GDT_ENTRY_TSS);
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  938  
9962d032bbff02 arch/x86/kvm/svm.c Alexander Graf    2008-11-25  939  	wrmsrl(MSR_EFER, efer | EFER_SVME);
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  940  
d0316554d3586c arch/x86/kvm/svm.c Linus Torvalds    2009-12-14  941  	wrmsrl(MSR_VM_HSAVE_PA, page_to_pfn(sd->save_area) << PAGE_SHIFT);
10474ae8945ce0 arch/x86/kvm/svm.c Alexander Graf    2009-09-15  942  
fbc0db76b77125 arch/x86/kvm/svm.c Joerg Roedel      2011-03-25  943  	if (static_cpu_has(X86_FEATURE_TSCRATEMSR)) {
fbc0db76b77125 arch/x86/kvm/svm.c Joerg Roedel      2011-03-25  944  		wrmsrl(MSR_AMD64_TSC_RATIO, TSC_RATIO_DEFAULT);
89cbc76768c2fa arch/x86/kvm/svm.c Christoph Lameter 2014-08-17 @945  		__this_cpu_write(current_tsc_ratio, TSC_RATIO_DEFAULT);
fbc0db76b77125 arch/x86/kvm/svm.c Joerg Roedel      2011-03-25  946  	}
fbc0db76b77125 arch/x86/kvm/svm.c Joerg Roedel      2011-03-25  947  
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  948  
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  949  	/*
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  950  	 * Get OSVW bits.
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  951  	 *
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  952  	 * Note that it is possible to have a system with mixed processor
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  953  	 * revisions and therefore different OSVW bits. If bits are not the same
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  954  	 * on different processors then choose the worst case (i.e. if erratum
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  955  	 * is present on one processor and not on another then assume that the
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  956  	 * erratum is present everywhere).
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  957  	 */
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  958  	if (cpu_has(&boot_cpu_data, X86_FEATURE_OSVW)) {
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  959  		uint64_t len, status = 0;
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  960  		int err;
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  961  
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  962  		len = native_read_msr_safe(MSR_AMD64_OSVW_ID_LENGTH, &err);
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  963  		if (!err)
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  964  			status = native_read_msr_safe(MSR_AMD64_OSVW_STATUS,
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  965  						      &err);
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  966  
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  967  		if (err)
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  968  			osvw_status = osvw_len = 0;
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  969  		else {
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  970  			if (len < osvw_len)
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  971  				osvw_len = len;
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  972  			osvw_status |= status;
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  973  			osvw_status &= (1ULL << osvw_len) - 1;
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  974  		}
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  975  	} else
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  976  		osvw_status = osvw_len = 0;
2b036c6b861dc5 arch/x86/kvm/svm.c Boris Ostrovsky   2012-01-09  977  
67ec66077799f2 arch/x86/kvm/svm.c Joerg Roedel      2010-05-17  978  	svm_init_erratum_383();
67ec66077799f2 arch/x86/kvm/svm.c Joerg Roedel      2010-05-17  979  
1018faa6cf23b2 arch/x86/kvm/svm.c Joerg Roedel      2012-02-29  980  	amd_pmu_enable_virt();
1018faa6cf23b2 arch/x86/kvm/svm.c Joerg Roedel      2012-02-29  981  
10474ae8945ce0 arch/x86/kvm/svm.c Alexander Graf    2009-09-15  982  	return 0;
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  983  }
6aa8b732ca01c3 drivers/kvm/svm.c  Avi Kivity        2006-12-10  984  

:::::: The code at line 945 was first introduced by commit
:::::: 89cbc76768c2fa4ed95545bf961f3a14ddfeed21 x86: Replace __get_cpu_var uses

:::::: TO: Christoph Lameter <cl@linux.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
