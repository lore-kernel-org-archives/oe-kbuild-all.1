Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907436;
	b=auoXLBzGaNweZN6P8HhHmM+EIF2AJXhBUNt3Nb3El8QoCYpeEo37UBbgBq43yNWmHDP1
	 DVzo0xV782dSn9caVyDoYO5YA+JlfqUWWXUxZfLveLVmfH3dQoNCOEkLsECjd47V28vV/
	 weLjIi+xSPEEXQq3nqfUUvUFfI0nNC31gdqU2kg6ccr/JjfH5w4K+OU+rroD6exksGjEG
	 WwhCEhWLHARAkR0ALBfTmsvOeQJEA4PIZd/yylogNGAh1jhnIhbLtGGhBkT9S6u5M8ZX4
	 7mRm66PbMbdyGZ8/csSalEJbmyOOL7V9+EOsGY5coLVqLWz+HJydNYKOXKqqmC+dmSQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907436;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=d3Zb658qomHTodVlB3RDkmd3eyHUMePHyvncobkm+c8=;
	b=BHzsTAma04hlB/RCP5hl0KCPNYI/hmd3ORKdTFEd02WzSPkdDtOnsTdmxkTHRbYAtUUY
	 OBvg4hIOow9pSmLnE0p8mvM6qPnUqjZ5APFGCk5U0rHjdJFlEsgk5d4l9NpTnViJPhg1s
	 IW2Cm8mfx8G3KY7E3/LeQP+A2N60tPLDRLyO3rGayTpKNxwys1CvM+QQX+sf4+ktj45za
	 A8VIfGq+k9BHhy2e1SG61QetjmJ4SiNH8XSt31u4yYhKUOXjJQkTVJIegv+2v/bbZx0Bd
	 wREawBb2d1qmjFh8mpD/ozLCKLkEE32mD03obe5o3OByEtr/6an7bk7ohMN5Y/RLJxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WWNUYnJ3;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F5B606A323
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 09:23:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3F5B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WWNUYnJ3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794907436; x=1826443436;
  h=date:from:to:cc:subject:message-id;
  bh=ClnjkdRuVSCHYAdvfa1pFFZADwqlOy8e84pGcxtIR7c=;
  b=WWNUYnJ3KXhLVrA00a5Lkjnxp93qV549pGUWyNGYQ+GwA5XTmFqJ6uNT
   2731HaGWRQ85fquGfbGOCQ93CbqtOaU7VJTOJYhlp0E3i1qfds/EtVQ6x
   ogsu0u6p9Jf/pLhX99KvChqZDyMtYysXH1cI4Ui+0RNBxiQ27ELw4Pn5P
   gdmASqZEJX+KoDT8uQEYtqUMhKgnJhWJupzuCPeGFviryobvwY8XVgHHc
   Ejhrpp+fxFNgxnPO0K6w2gerC4GdO3iDDm/4q4sl01nr1geLf24rl7pxR
   NtAWi1O6b19LLR7BZSBxOtfVWIL+mZYhyoCxyHpqr2atJ4m7PtmBMq1D2
   A==;
X-CSE-ConnectionGUID: 8+6jWNymRLWB+nmnzWCwsw==
X-CSE-MsgGUID: pdq0W70NTTSSQJdbfM3MCg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3687213"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3687213"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 01:23:41 -0800
X-CSE-ConnectionGUID: rxZxA+mITN2rPOJCE6N/sA==
X-CSE-MsgGUID: 5Kl1bNHRSCCzn/iYB83qQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9840212"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2026 01:23:40 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTFPd-0000000033m-1K7Q;
	Tue, 17 Nov 2026 09:23:37 +0000
Date: Tue, 17 Nov 2026 10:23:27 +0100
From: kernel test robot <lkp@intel.com>
To: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20261116-0033 35/35]
 drivers/infiniband/hw/hfi2/roce_pasid.c:677:8: error: call to undeclared
 function 'iova_domain_init_rcaches'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <20261117101423.r9tozGDd-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Dennis,

First bad commit (maybe != root cause):

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20261116-0033
head:   cbebd4ec9012d4808e8ca66159c78b0b1b4600d4
commit: cbebd4ec9012d4808e8ca66159c78b0b1b4600d4 [35/35] RDMA/hfi2: Add tracepoints and enable hfi2 driver build
config: x86_64-randconfig-r2101-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117101423.r9tozGDd-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/20261117101423.r9tozGDd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261117101423.r9tozGDd-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/infiniband/hw/hfi2/roce_pasid.c:677:8: error: call to undeclared function 'iova_domain_init_rcaches'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     677 |         ret = iova_domain_init_rcaches(&donor->iovad);
         |               ^
   1 error generated.


vim +/iova_domain_init_rcaches +677 drivers/infiniband/hw/hfi2/roce_pasid.c

e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  640  
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  641  static int hfi2_roce_kmr_init_mm(struct hfi2_roce_kmr_donor *donor)
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  642  {
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  643  	unsigned long end;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  644  	unsigned long va;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  645  	int ret;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  646  
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  647  	if (!hfi2_roce_kmr_donor_gb ||
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  648  	    hfi2_roce_kmr_donor_gb > HFI2_ROCE_KMR_DONOR_GB_MAX) {
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  649  		dd_dev_err(donor->dd, "roce_kmr_donor_gb=%u out of range 1-%u\n",
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  650  			   hfi2_roce_kmr_donor_gb, HFI2_ROCE_KMR_DONOR_GB_MAX);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  651  		return -EINVAL;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  652  	}
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  653  	if (check_mul_overflow((unsigned long)hfi2_roce_kmr_donor_gb,
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  654  			       (unsigned long)SZ_1G, &donor->size) ||
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  655  	    check_add_overflow((unsigned long)HFI2_ROCE_KMR_IOVA_BASE,
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  656  			       donor->size, &end))
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  657  		return -EINVAL;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  658  
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  659  #if IS_ENABLED(CONFIG_KUNIT)
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  660  	donor->mm = mm_alloc();
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  661  #else
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  662  	return -EOPNOTSUPP;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  663  #endif
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  664  	if (!donor->mm)
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  665  		return -ENOMEM;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  666  
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  667  	kthread_use_mm(donor->mm);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  668  	va = vm_mmap(donor->file, HFI2_ROCE_KMR_IOVA_BASE, donor->size,
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  669  		     PROT_READ | PROT_WRITE, MAP_SHARED | MAP_FIXED_NOREPLACE, 0);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  670  	if (IS_ERR_VALUE(va)) {
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  671  		ret = (int)va;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  672  		goto err_mm;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  673  	}
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  674  	donor->base = va;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  675  
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  676  	init_iova_domain(&donor->iovad, PAGE_SIZE, donor->base >> PAGE_SHIFT);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15 @677  	ret = iova_domain_init_rcaches(&donor->iovad);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  678  	if (ret)
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  679  		goto err_unmap;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  680  
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  681  	mmap_write_lock(donor->mm);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  682  	ret = apply_to_page_range(donor->mm, donor->base, donor->size, NULL, NULL);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  683  	mmap_write_unlock(donor->mm);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  684  	if (ret)
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  685  		goto err_iovad;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  686  
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  687  	donor->bind = hfi2_roce_pasid_get(donor->dd, donor->mm);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  688  	if (IS_ERR(donor->bind)) {
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  689  		ret = PTR_ERR(donor->bind);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  690  		donor->bind = NULL;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  691  		goto err_iovad;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  692  	}
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  693  
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  694  	return 0;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  695  
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  696  err_iovad:
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  697  	put_iova_domain(&donor->iovad);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  698  err_unmap:
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  699  	vm_munmap(donor->base, donor->size);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  700  	donor->base = 0;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  701  err_mm:
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  702  	kthread_unuse_mm(donor->mm);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  703  	mmput(donor->mm);
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  704  	donor->mm = NULL;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  705  	return ret;
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  706  }
e3e3c4d9d42486 Dennis Dalessandro 2026-11-15  707  

:::::: The code at line 677 was first introduced by commit
:::::: e3e3c4d9d42486d3bd58eb987a900f96c5eb6411 RDMA/hfi2: Add RoCEv2 protocol and verbs integration

:::::: TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>
:::::: CC: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
