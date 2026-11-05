Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793857655;
	b=Qt56l7v4bX5HMpiIb50t8wx24hOb9n7VCdLumApwtwJLj3VoLI4/wEjhLu34aNy05b/Z
	 eNAzjQWziGllf9iznj1D87tmduxsmDqYXH7JmHtduFQAFLw3CmRcBU7toUtj90c4NJIA1
	 v0a/U1jI+HPzWTdiOJdELLTfAfTICzGzcdwvtRC0aDVF6KIDs+m0V1O5N7o1iDk3qmVIB
	 YvFDu4Er51mSIaZdCy9gS9HoW4drRTmurFKgMTaaoIJ9ljHzJOHhrmXwOnoRuhFNR1042
	 c1karcVBubjcoRcUs5BHhlCBw4bFFKYvS5G8Gc3ptgF5B6hIlaWwESmTBlhCHA9QoIg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793857655;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=0s/fTSciG+IS/5SMAURjpHVQgCsJ+2efxaLr9iEGSAo=;
	b=XTr+yFKYfDl+qsMMnCaUOX9qurlw8YJQu4iUxOBZQ6QTAjx2QIxRh2+dDyxLgsVY+J2w
	 XcirPvxYQQl6/3/wanBDvdsQxdai3YgyrENHENkhpb1oNKh/a4GpKZ4RCoTdnhtypdPy+
	 1+8yCAU+zJqwJvUxBy38xWCJl2bEQgReutU6ZTCFDAlpiRGQYp43rifwZETNtjCfKCCP2
	 Udx9RCerMCHY5qJEVwJsOVyUBT7JDzaJmHlMSIfG8zG/biL3tOXD9Ic5eik1VlzJAI6QU
	 EIMaXBTOqiZZYEsMWjq1xoDWmyL1j9IpTcZL7oNbQeZNMslnRb9BR0hkZ4oghR3U5QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dSTXjjPq;
	arc=none smtp.remote-ip=192.198.163.19
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7E2606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 05:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C7E2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dSTXjjPq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793857653; x=1825393653;
  h=date:from:to:cc:subject:message-id;
  bh=A0F1ejwW1HcwCWtmZ2zZzd8KzSa5A5dtkt1UwsaxBf8=;
  b=dSTXjjPqd8rpvnVdMWJeHrUYq8zc4LmVySAQL1BHVHZTBB60VW25KrPF
   0H9d8NYnPhlUqT2GYwH7zZnV2sjLgHaBVfY3RnFzrIKOcf0lN6OfznuWl
   m63JYMDsORX86fQnUZCHMPD6eFP54RaeH3/GoGwxNVSgI75kLzwFZGk5Z
   bR9IvE/j+ob9/MG4n4l43z/R5wvTHUWvrzLnX3DmdOJvTCdSTtn0KPeDT
   F/Dn9huXZRUZ4Tg20HHHQAbMdLW8Qs7x17SvyVwBzxnrxjImeVSE4yiYJ
   WV2zSPZ2JIt81miaewap6sVlnG9WukbCuXoCz7sOOJpydHYJuVs+S25/g
   w==;
X-CSE-ConnectionGUID: 678FRtKiR+GiexgMYqR38Q==
X-CSE-MsgGUID: NLxJphcxSM2p/G5C7/592w==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2736883"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2736883"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 21:47:32 -0800
X-CSE-ConnectionGUID: p6nGytm9Q0aoAnUlDZqSkA==
X-CSE-MsgGUID: qK10Fj9ATA+M1qg2/FoQXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7242326"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 04 Nov 2026 21:47:31 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOqJs-000000009YP-3FNm;
	Thu, 05 Nov 2026 05:47:28 +0000
Date: Thu, 05 Nov 2026 06:46:32 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 390/390]
 drivers/dma-buf/heaps/deferred-free-helper.c:21:19: sparse: sparse: symbol
 'freelist_waitqueue' was not declared. Should it be static?
Message-ID: <202611050650.zmyj43d8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   900d46d1c904d34d7c3eeb0ef2119cffc5a8ab3d
commit: fe58c121167255eef7b234d6d1193281d2c8f5e6 [390/390] ANDROID: Allow the deferred-free library heap to be compiled into the GKI
config: arm-randconfig-r2309-20261105 (https://download.01.org/0day-ci/archive/20261105/202611050650.zmyj43d8-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7303edbc6496e00558bf44850d63a99fc376c92)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050650.zmyj43d8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050650.zmyj43d8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/heaps/deferred-free-helper.c:21:19: sparse: sparse: symbol 'freelist_waitqueue' was not declared. Should it be static?
   drivers/dma-buf/heaps/deferred-free-helper.c:22:20: sparse: sparse: symbol 'freelist_task' was not declared. Should it be static?

vim +/freelist_waitqueue +21 drivers/dma-buf/heaps/deferred-free-helper.c

bb97bfd3d8e88ca John Stultz 2020-12-09  18  
bb97bfd3d8e88ca John Stultz 2020-12-09  19  static LIST_HEAD(free_list);
bb97bfd3d8e88ca John Stultz 2020-12-09  20  static size_t list_nr_pages;
bb97bfd3d8e88ca John Stultz 2020-12-09 @21  wait_queue_head_t freelist_waitqueue;
bb97bfd3d8e88ca John Stultz 2020-12-09  22  struct task_struct *freelist_task;
bb97bfd3d8e88ca John Stultz 2020-12-09  23  static DEFINE_SPINLOCK(free_list_lock);
bb97bfd3d8e88ca John Stultz 2020-12-09  24  

:::::: The code at line 21 was first introduced by commit
:::::: bb97bfd3d8e88ca18b975460a5a2217c9b45a1b0 ANDROID: dma-buf: heaps: Add deferred-free-helper library code

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: T.J. Mercier <tjmercier@google.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
