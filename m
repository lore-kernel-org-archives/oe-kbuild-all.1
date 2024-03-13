Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2085F273DC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Mar 2024 22:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710368770; cv=none; b=o69U+ESPC4QRBNoWm52U1/jk64hq1v0XRE71yZpGxLpA52zYwsSvbnkk245bHsKZb2fK8jA0lsfWKH988MB7WGi/22u5ORte9S5ayb71+USESnpgsBWQapAJAwBP4SPehWUq4qHx4ERo82LiFZ57nDiK70LZexpu14X2YJs1tdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710368770; c=relaxed/simple;
	bh=E211JqsQlRdSCqtB8uphR7cqWcbHRH6Me5KXHyfbqeQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZKO+5wn6MPVps7/QOKCKm4Nw1BSFhOxzRk/sDQua28gpLRAxtntEhXhXUDxDVMiLimozmHirHEeUHhf3lQlu68zBJg/QZyZDsHmaef5eNCM2O2GvTlQqH/b36l8V9Hlf1GzDY9diSSh0zRPo1sdd/OKRJRHNNyTl9wDItfJ8CCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jqxru7H9; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jqxru7H9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710368769; x=1741904769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E211JqsQlRdSCqtB8uphR7cqWcbHRH6Me5KXHyfbqeQ=;
  b=jqxru7H9wJiI89ZxH+PoDTNTDarI8rghloOErm8x7uPzJDOYXsWEK/mi
   hKk76eK7AStZFUcuhw3Cx3uFQMxLT6sPb1pWlPG4Qjrjiideh7LXQUEpn
   c75ehszfH9ZLMDGAFnFYVe/dUezFWBHFhI3XuC+U7IOQQJH8O33Z9KsH3
   tFjXFSWcaFEcxKJGM6jkuxjXELLDPWhmnQ94EIHC/oZzkUxG9KC/8DUHz
   pqj5Zwq2WF9LyixgW2XZmxnjYFgp1WTP/IyoRS6P7CAZahdrCmNxcEqpa
   kmrCCalQo/dmKHqB5g/364Co0Vs8KXWYf0oExwk/BpFzbBFdUW3PN6oUD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="30608131"
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="30608131"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2024 15:26:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,123,1708416000"; 
   d="scan'208";a="12162527"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Mar 2024 15:26:05 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rkX2x-000CoH-0j;
	Wed, 13 Mar 2024 22:26:03 +0000
Date: Thu, 14 Mar 2024 06:25:39 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: arch/x86/power/cpu.c:406:21: error: implicit declaration of function
 'kmalloc_array'; did you mean 'kvmalloc_array'?
Message-ID: <202403140601.HLRKsCob-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   c13208f42a275b32080b8b1f05865c408364ef9f
commit: c53815e5cc83e56454044d6341dddf019d945bb2 x86/fpu: Replace the includes of fpu/internal.h
date:   9 months ago
config: x86_64-buildonly-randconfig-003-20240313 (https://download.01.org/0day-ci/archive/20240314/202403140601.HLRKsCob-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240314/202403140601.HLRKsCob-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403140601.HLRKsCob-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/power/cpu.c: In function 'msr_build_context':
>> arch/x86/power/cpu.c:406:21: error: implicit declaration of function 'kmalloc_array'; did you mean 'kvmalloc_array'? [-Werror=implicit-function-declaration]
     406 |         msr_array = kmalloc_array(total_num, sizeof(struct saved_msr), GFP_KERNEL);
         |                     ^~~~~~~~~~~~~
         |                     kvmalloc_array
>> arch/x86/power/cpu.c:406:19: warning: assignment to 'struct saved_msr *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     406 |         msr_array = kmalloc_array(total_num, sizeof(struct saved_msr), GFP_KERNEL);
         |                   ^
>> arch/x86/power/cpu.c:420:17: error: implicit declaration of function 'kfree'; did you mean 'kvfree'? [-Werror=implicit-function-declaration]
     420 |                 kfree(saved_msrs->array);
         |                 ^~~~~
         |                 kvfree
   cc1: some warnings being treated as errors


vim +406 arch/x86/power/cpu.c

^590eaf1fec755 Kaixu Xia 2021-03-16  396  
^590eaf1fec755 Kaixu Xia 2021-03-16  397  static int msr_build_context(const u32 *msr_id, const int num)
^590eaf1fec755 Kaixu Xia 2021-03-16  398  {
^590eaf1fec755 Kaixu Xia 2021-03-16  399  	struct saved_msrs *saved_msrs = &saved_context.saved_msrs;
^590eaf1fec755 Kaixu Xia 2021-03-16  400  	struct saved_msr *msr_array;
^590eaf1fec755 Kaixu Xia 2021-03-16  401  	int total_num;
^590eaf1fec755 Kaixu Xia 2021-03-16  402  	int i, j;
^590eaf1fec755 Kaixu Xia 2021-03-16  403  
^590eaf1fec755 Kaixu Xia 2021-03-16  404  	total_num = saved_msrs->num + num;
^590eaf1fec755 Kaixu Xia 2021-03-16  405  
^590eaf1fec755 Kaixu Xia 2021-03-16 @406  	msr_array = kmalloc_array(total_num, sizeof(struct saved_msr), GFP_KERNEL);
^590eaf1fec755 Kaixu Xia 2021-03-16  407  	if (!msr_array) {
^590eaf1fec755 Kaixu Xia 2021-03-16  408  		pr_err("x86/pm: Can not allocate memory to save/restore MSRs during suspend.\n");
^590eaf1fec755 Kaixu Xia 2021-03-16  409  		return -ENOMEM;
^590eaf1fec755 Kaixu Xia 2021-03-16  410  	}
^590eaf1fec755 Kaixu Xia 2021-03-16  411  
^590eaf1fec755 Kaixu Xia 2021-03-16  412  	if (saved_msrs->array) {
^590eaf1fec755 Kaixu Xia 2021-03-16  413  		/*
^590eaf1fec755 Kaixu Xia 2021-03-16  414  		 * Multiple callbacks can invoke this function, so copy any
^590eaf1fec755 Kaixu Xia 2021-03-16  415  		 * MSR save requests from previous invocations.
^590eaf1fec755 Kaixu Xia 2021-03-16  416  		 */
^590eaf1fec755 Kaixu Xia 2021-03-16  417  		memcpy(msr_array, saved_msrs->array,
^590eaf1fec755 Kaixu Xia 2021-03-16  418  		       sizeof(struct saved_msr) * saved_msrs->num);
^590eaf1fec755 Kaixu Xia 2021-03-16  419  
^590eaf1fec755 Kaixu Xia 2021-03-16 @420  		kfree(saved_msrs->array);
^590eaf1fec755 Kaixu Xia 2021-03-16  421  	}
^590eaf1fec755 Kaixu Xia 2021-03-16  422  
^590eaf1fec755 Kaixu Xia 2021-03-16  423  	for (i = saved_msrs->num, j = 0; i < total_num; i++, j++) {
^590eaf1fec755 Kaixu Xia 2021-03-16  424  		msr_array[i].info.msr_no	= msr_id[j];
^590eaf1fec755 Kaixu Xia 2021-03-16  425  		msr_array[i].valid		= false;
^590eaf1fec755 Kaixu Xia 2021-03-16  426  		msr_array[i].info.reg.q		= 0;
^590eaf1fec755 Kaixu Xia 2021-03-16  427  	}
^590eaf1fec755 Kaixu Xia 2021-03-16  428  	saved_msrs->num   = total_num;
^590eaf1fec755 Kaixu Xia 2021-03-16  429  	saved_msrs->array = msr_array;
^590eaf1fec755 Kaixu Xia 2021-03-16  430  
^590eaf1fec755 Kaixu Xia 2021-03-16  431  	return 0;
^590eaf1fec755 Kaixu Xia 2021-03-16  432  }
^590eaf1fec755 Kaixu Xia 2021-03-16  433  

:::::: The code at line 406 was first introduced by commit
:::::: 590eaf1fec755215547690e787cc7d83f58ea948 Init Repo base on linux 5.4.32 long term, and add base tlinux kernel interfaces.

:::::: TO: Kaixu Xia <kaixuxia@tencent.com>
:::::: CC: Kaixu Xia <kaixuxia@tencent.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
