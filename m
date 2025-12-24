Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D5F2AD16
	for <oe-kbuild-all@lists.linux.dev>; Wed, 24 Dec 2025 12:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766581197; cv=none; b=QlrE3XfrnvtSAKANnfcF3Q5mUZrFbCftdJ43V2ikK94rIIcsrMvz5Mpl1vwjBPC9z4g+smoSSaXjY03Hyv0z513V4DLIkfUBMegnJ00yogqvVMGGCN+KjQ7Ov/ess8kRBrjNKOiYlyUewmHUHGv6HldP5aIaO7VHrtzrIopdT5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766581197; c=relaxed/simple;
	bh=mvjDpWBUivvsz4Fdf7xvgPpTGBYwn6ZjyxD9VgHcmvs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QCXkFZ3EZnrsULRzqwzOPijSCXZZvKdRU/ogjDgb3pbX5bmT2Vn+ek1EoANPjwPRRFKgwJhdVPdwZesd3eMX/StJJFVPYsH/rtBdpalj5Ncp7t25AQZTVp2KdkjKGQcQQQk4bekJu9gIbOkAYcx9dF9Yi2ApucEo20Gh5rFO+tY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRDslByt; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRDslByt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766581195; x=1798117195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mvjDpWBUivvsz4Fdf7xvgPpTGBYwn6ZjyxD9VgHcmvs=;
  b=hRDslByt2+U0Nk3PtmqeCShn1ig4xVEZN4cEtcR3Vvn7fRjbm2wbeABw
   cid6BGyZkV9shwN1LPTAk0Cu+rkttTtLlr3y87VZBtkgMfC1eRtuWB0OO
   vHWyVpkE/K7OQvkII73Le0uccPILZo6LVkJd+IzXNaLekhilJ9/fWf8TI
   RqZiS46q1tuLFu5miS4LbLMxhtnjHIAyP7W+2CUFKxrCxNSEbDWd8mye8
   iggqoCWOnrH1ABaUmcmmHhngdy7ddc2AJK6bLLiA13i2Evt4/Je6MDNXw
   PHN6c1akVu/u/C8BghyR16pkY22bnkayzDkyc65kKnCBapJ1yhLNC9sxZ
   Q==;
X-CSE-ConnectionGUID: PgylIQEaTj2f+aNgAkDKGg==
X-CSE-MsgGUID: A8TM64DaSPW3LJHc2waTuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="68459046"
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="68459046"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 04:59:54 -0800
X-CSE-ConnectionGUID: ibHOZecKRKyLA7lBCfszwA==
X-CSE-MsgGUID: iSVpmUrET22hZmqDDHZtqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,173,1763452800"; 
   d="scan'208";a="204554660"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 24 Dec 2025 04:59:54 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYOT1-000000006DI-0JSR;
	Wed, 24 Dec 2025 12:59:51 +0000
Date: Wed, 24 Dec 2025 13:59:46 +0100
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:slf/nested_npt 21/21] lib/x86/processor.c:397:54: error:
 'struct kvm_vm_arch' has no member named 'tdp_mmu'
Message-ID: <202512241318.o8WxMIqB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux slf/nested_npt
head:   d92a49a6c826159a40524177ff9eee7d34c4acaf
commit: d92a49a6c826159a40524177ff9eee7d34c4acaf [21/21] KVM: selftests: Test READ=>WRITE dirty logging behavior for nested TDP
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251224/202512241318.o8WxMIqB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512241318.o8WxMIqB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512241318.o8WxMIqB-lkp@intel.com/

Note: the sean-jc/slf/nested_npt HEAD d92a49a6c826159a40524177ff9eee7d34c4acaf builds fine.
      It only hurts bisectability.

All error/warnings (new ones prefixed by >>):

   lib/x86/processor.c: In function 'tdp_get_pte':
>> lib/x86/processor.c:397:54: error: 'struct kvm_vm_arch' has no member named 'tdp_mmu'
     397 |         return __vm_get_page_table_entry(vm, vm->arch.tdp_mmu, l2_gpa, &level);
         |                                                      ^
>> lib/x86/processor.c:398:1: warning: control reaches end of non-void function [-Wreturn-type]
     398 | }
         | ^
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics
--
   In file included from x86/nested_dirty_log_test.c:14:
   x86/nested_dirty_log_test.c: In function 'test_dirty_log':
>> x86/nested_dirty_log_test.c:185:78: error: 'struct kvm_vm_arch' has no member named 'tdp_mmu'
     185 |                 *tdp_get_pte(vm, NESTED_TEST_MEM1) |= PTE_DIRTY_MASK(vm->arch.tdp_mmu);
         |                                                                              ^
   include/x86/processor.h:1448:43: note: in definition of macro 'PTE_DIRTY_MASK'
    1448 | #define PTE_DIRTY_MASK(mmu)             ((mmu)->arch.pte_masks.dirty)
         |                                           ^~~
   x86/nested_dirty_log_test.c:186:78: error: 'struct kvm_vm_arch' has no member named 'tdp_mmu'
     186 |                 *tdp_get_pte(vm, NESTED_TEST_MEM2) |= PTE_DIRTY_MASK(vm->arch.tdp_mmu);
         |                                                                              ^
   include/x86/processor.h:1448:43: note: in definition of macro 'PTE_DIRTY_MASK'
    1448 | #define PTE_DIRTY_MASK(mmu)             ((mmu)->arch.pte_masks.dirty)
         |                                           ^~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
