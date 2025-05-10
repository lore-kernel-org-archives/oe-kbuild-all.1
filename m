Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82735103F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 10 May 2025 05:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746856485; cv=none; b=md4mkVgquSDdY9+5W8DV2E2AdOk7JQBPV2pGu/M5uvpdgfPhHhCGnyvfB6lOIm4mC7hjcwyXsW3EiwDQitoOFEb6I1uGbjvOvI03pMcAUBlGa3Vw1EviK9PrelojceNxXySwfzGQcmZVwx2zeaNafEjcAY40zlcwjYZvSDmIWL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746856485; c=relaxed/simple;
	bh=AdU/eBTGGMFXbAhXsgZulOcJg27TnkM1xLPR0sxL9j0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jq0r7W9KRxU7qzio7DlO1AQ9dgLOuD6zIG5UfVLmQPT/Cp9ixdtWtT2MUR7JZ+/MI/DL+OsX2ACEA5NKLP0FwFzcYHEcSSXInria6UTqreKdqa4WitT9iC9cHG3Vvn3iIrQm2Ws/t+Hua33U5uqjXvtXHyrv3bW5cwbf4bD43N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kph69SF3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kph69SF3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746856483; x=1778392483;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AdU/eBTGGMFXbAhXsgZulOcJg27TnkM1xLPR0sxL9j0=;
  b=Kph69SF3HrbRkGfR0PpDsRAlkiiVFps+mzYfJnmHqIv4giPyP3/xIgc/
   3xBbKy4aF+a1Jnvlnw68bxbwsT97lukemAV3hxF/fK4hI/SeAmyn6Syq7
   d4GWpTB95BV5CbVLttpk44NGH/Ae+AO+WTt0vK1guIAnIXMXtGuhBlKxY
   gbr/qhOXVA8lE8HB0XEVzBAwKl0Sj9k2Hexjudn/UvBhDmAXj7FtI8y1l
   22JGlDfoGw6AU/Yb1EVS+KvQmRy0a/OVIHVFMP4TsyljXd9NqZYxxxmLN
   gi6CMr8lNHkoYeKuhdUjy6d8LV08dRLGWflY23PEeGekdehxUa99Dig9L
   g==;
X-CSE-ConnectionGUID: +QPEEhFhTm+g3vEPR/O/SA==
X-CSE-MsgGUID: X1DgMqpASIWIK225XvDJ7Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11427"; a="48850615"
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="48850615"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2025 22:54:43 -0700
X-CSE-ConnectionGUID: mmyQQ2LcSgGJD7JNHqD+KA==
X-CSE-MsgGUID: QTO/y4PWRlKW+EInXtZX9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,276,1739865600"; 
   d="scan'208";a="137336253"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 May 2025 22:54:41 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uDdAU-000CpX-30;
	Sat, 10 May 2025 05:54:38 +0000
Date: Sat, 10 May 2025 13:54:25 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94] arch/x86/kvm/svm/csv.c:774:6:
 warning: variable 'pfn' is used uninitialized whenever 'if' condition is
 true
Message-ID: <202505101324.MRXaYYFi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   a79e0786f3fa90fd521f198ac6ccf6b11dbf67c2
commit: c0bfce1e4fad37d7dd413e3ef813e18edd738d4f [0/94] anolis: KVM: SVM: CSV: Manage CSV3 guest's nested page table
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250510/202505101324.MRXaYYFi-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250510/202505101324.MRXaYYFi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505101324.MRXaYYFi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kvm/svm/csv.c:774:6: warning: variable 'pfn' is used uninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
     774 |         if (error_code & PFERR_PRESENT_MASK)
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/svm/csv.c:787:15: note: uninitialized use occurs here
     787 |                                 &psp_ret, pfn, level);
         |                                           ^~~
   arch/x86/kvm/svm/csv.c:774:2: note: remove the 'if' if its condition is always false
     774 |         if (error_code & PFERR_PRESENT_MASK)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     775 |                 level = CSV3_PG_LEVEL_4K;
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~
     776 |         else {
         |         ~~~~
   arch/x86/kvm/svm/csv.c:771:15: note: initialize the variable 'pfn' to silence this warning
     771 |         kvm_pfn_t pfn;
         |                      ^
         |                       = 0
   1 warning generated.


vim +774 arch/x86/kvm/svm/csv.c

   764	
   765	static int csv3_page_fault(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
   766				   gfn_t gfn, u32 error_code)
   767	{
   768		int ret = 0;
   769		int psp_ret = 0;
   770		int level;
   771		kvm_pfn_t pfn;
   772		struct kvm_csv_info *csv = &to_kvm_svm_csv(vcpu->kvm)->csv_info;
   773	
 > 774		if (error_code & PFERR_PRESENT_MASK)
   775			level = CSV3_PG_LEVEL_4K;
   776		else {
   777			mutex_lock(&csv->shared_page_block_lock);
   778			ret = csv3_pin_shared_memory(vcpu, slot, gfn, &pfn);
   779			mutex_unlock(&csv->shared_page_block_lock);
   780			if (ret)
   781				goto exit;
   782	
   783			level = csv3_mapping_level(vcpu, gfn, pfn, slot);
   784		}
   785	
   786		ret = __csv3_page_fault(vcpu, gfn << PAGE_SHIFT, error_code, slot,
   787					&psp_ret, pfn, level);
   788	
   789		if (psp_ret != SEV_RET_SUCCESS)
   790			ret = -EFAULT;
   791	exit:
   792		return ret;
   793	}
   794	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
