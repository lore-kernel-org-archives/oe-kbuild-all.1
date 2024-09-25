Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0191A42CA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 23:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727308792; cv=none; b=Yb444hdElRkLBoJa0qFxF+lrQe9Hs020/hUKa/q0c6qHKN0/++zhyt4MoA/JXWR/ushOQjVFDyi9sySoLeHTpF2+zE4aABlEeHpi0v46whOHjrx1raJ/gAOb50gE8P899jxpDaZW6JeIPwK4+9p0rTahBmbVRGpVKFJcphbzccM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727308792; c=relaxed/simple;
	bh=9MBtMzizkLHGxhJTtADdrsR/c4Qd8//FA9BDIXVAU6o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YIvq5QR5iSOTP91vRl7ZrokZcckrW0EYNhojPu4E1UrxCxGEctjax5aeUX/Hc6nUmtib2yIAJexxkoLW9OpTwB+/oPxSDvt/WtKiMCSwh2qJtf7D9WCD61RvJKjzP76OsguVEP7g9h5vPvcGuiWtJDIhOgF83bQUG2dHpHhdozs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HA63kWQt; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HA63kWQt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727308791; x=1758844791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9MBtMzizkLHGxhJTtADdrsR/c4Qd8//FA9BDIXVAU6o=;
  b=HA63kWQtm0GQ1R6V/EbuTKGCDrzyAUlQDgAWAcSlUuusydgQYilvB0G5
   R2ra9rV15gSjgvsAklis4qHiW9R2y+QkQGlCNrnxCEZXf9Ljkry8t44nD
   96Gl/zgdFN84gbvcX5PWcwfj/4yQayJdz4snd2NbiVsuG7aRJtP9MhKjJ
   CQKw5sKOyFTQuImSXPXrGs338NeSQN+NxA8ApcLZeDm3DfNbDJJEOOISE
   HM71+aPLx9cCv6s3eL2mr92yp+1HEKjFx01DkXTXIU/f7fbj4+ncGij0m
   C/ziokWgATJdQgBc49yQPFKWpy/i5xu7iURyloMRhCywBXFUxzqXeLB8V
   Q==;
X-CSE-ConnectionGUID: 1eZx5Lv0QhqdY9BYRkqIpA==
X-CSE-MsgGUID: EsDx0siVQjmO3fR4p9guTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="29275783"
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="29275783"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2024 16:59:47 -0700
X-CSE-ConnectionGUID: 4R8bxDOvSjOmM4bzyvVD3A==
X-CSE-MsgGUID: xp0x30b4TwS/RAiUHgQUtA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,258,1719903600"; 
   d="scan'208";a="76327754"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Sep 2024 16:59:43 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stbv3-000K3H-0i;
	Wed, 25 Sep 2024 23:59:41 +0000
Date: Thu, 26 Sep 2024 07:58:49 +0800
From: kernel test robot <lkp@intel.com>
To: kaixuxia@tencent.com, frankjpliu@tencent.com, kasong@tencent.com,
	sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jingqunli@tencent.com, jason.zeng@intel.com,
	wu.zheng@intel.com, yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:linux-5.4/lts/5.4.119-20.0009.spr 755/2443]
 arch/x86/power/cpu.c:406:21: error: implicit declaration of function
 'kmalloc_array'; did you mean 'kvmalloc_array'?
Message-ID: <202409260753.T6SOlOgf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009.spr
head:   9d665359e14c559b74a94a55057e9c0fbd31a81a
commit: 1e8d6631a6558758c51179293abde3c44eee0291 [755/2443] x86/fpu: Replace the includes of fpu/internal.h
config: x86_64-buildonly-randconfig-003-20240926 (https://download.01.org/0day-ci/archive/20240926/202409260753.T6SOlOgf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240926/202409260753.T6SOlOgf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409260753.T6SOlOgf-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/x86/include/asm/bug.h:6,
                    from include/linux/bug.h:5,
                    from include/linux/thread_info.h:12,
                    from arch/x86/include/asm/preempt.h:7,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/swap.h:5,
                    from include/linux/suspend.h:5,
                    from arch/x86/power/cpu.c:10:
   include/linux/instrumentation.h:8: warning: "instrumentation_begin" redefined
       8 | #define instrumentation_begin() ({                                      \
         | 
   In file included from include/linux/export.h:42,
                    from include/linux/linkage.h:7,
                    from include/linux/preempt.h:10:
   include/linux/compiler.h:139: note: this is the location of the previous definition
     139 | #define instrumentation_begin() ({                                      \
         | 
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

7a9c2dd08eadd5c Chen Yu      2015-11-25  396  
c49a0a80137c7ca Tom Lendacky 2019-08-19  397  static int msr_build_context(const u32 *msr_id, const int num)
7a9c2dd08eadd5c Chen Yu      2015-11-25  398  {
c49a0a80137c7ca Tom Lendacky 2019-08-19  399  	struct saved_msrs *saved_msrs = &saved_context.saved_msrs;
7a9c2dd08eadd5c Chen Yu      2015-11-25  400  	struct saved_msr *msr_array;
c49a0a80137c7ca Tom Lendacky 2019-08-19  401  	int total_num;
c49a0a80137c7ca Tom Lendacky 2019-08-19  402  	int i, j;
7a9c2dd08eadd5c Chen Yu      2015-11-25  403  
c49a0a80137c7ca Tom Lendacky 2019-08-19  404  	total_num = saved_msrs->num + num;
7a9c2dd08eadd5c Chen Yu      2015-11-25  405  
7a9c2dd08eadd5c Chen Yu      2015-11-25 @406  	msr_array = kmalloc_array(total_num, sizeof(struct saved_msr), GFP_KERNEL);
7a9c2dd08eadd5c Chen Yu      2015-11-25  407  	if (!msr_array) {
7a9c2dd08eadd5c Chen Yu      2015-11-25  408  		pr_err("x86/pm: Can not allocate memory to save/restore MSRs during suspend.\n");
7a9c2dd08eadd5c Chen Yu      2015-11-25  409  		return -ENOMEM;
7a9c2dd08eadd5c Chen Yu      2015-11-25  410  	}
7a9c2dd08eadd5c Chen Yu      2015-11-25  411  
c49a0a80137c7ca Tom Lendacky 2019-08-19  412  	if (saved_msrs->array) {
c49a0a80137c7ca Tom Lendacky 2019-08-19  413  		/*
c49a0a80137c7ca Tom Lendacky 2019-08-19  414  		 * Multiple callbacks can invoke this function, so copy any
c49a0a80137c7ca Tom Lendacky 2019-08-19  415  		 * MSR save requests from previous invocations.
c49a0a80137c7ca Tom Lendacky 2019-08-19  416  		 */
c49a0a80137c7ca Tom Lendacky 2019-08-19  417  		memcpy(msr_array, saved_msrs->array,
c49a0a80137c7ca Tom Lendacky 2019-08-19  418  		       sizeof(struct saved_msr) * saved_msrs->num);
c49a0a80137c7ca Tom Lendacky 2019-08-19  419  
c49a0a80137c7ca Tom Lendacky 2019-08-19 @420  		kfree(saved_msrs->array);
c49a0a80137c7ca Tom Lendacky 2019-08-19  421  	}
c49a0a80137c7ca Tom Lendacky 2019-08-19  422  
c49a0a80137c7ca Tom Lendacky 2019-08-19  423  	for (i = saved_msrs->num, j = 0; i < total_num; i++, j++) {
c49a0a80137c7ca Tom Lendacky 2019-08-19  424  		msr_array[i].info.msr_no	= msr_id[j];
7a9c2dd08eadd5c Chen Yu      2015-11-25  425  		msr_array[i].valid		= false;
7a9c2dd08eadd5c Chen Yu      2015-11-25  426  		msr_array[i].info.reg.q		= 0;
7a9c2dd08eadd5c Chen Yu      2015-11-25  427  	}
c49a0a80137c7ca Tom Lendacky 2019-08-19  428  	saved_msrs->num   = total_num;
c49a0a80137c7ca Tom Lendacky 2019-08-19  429  	saved_msrs->array = msr_array;
7a9c2dd08eadd5c Chen Yu      2015-11-25  430  
7a9c2dd08eadd5c Chen Yu      2015-11-25  431  	return 0;
7a9c2dd08eadd5c Chen Yu      2015-11-25  432  }
7a9c2dd08eadd5c Chen Yu      2015-11-25  433  

:::::: The code at line 406 was first introduced by commit
:::::: 7a9c2dd08eadd5c6943115dbbec040c38d2e0822 x86/pm: Introduce quirk framework to save/restore extra MSR registers around suspend/resume

:::::: TO: Chen Yu <yu.c.chen@intel.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
