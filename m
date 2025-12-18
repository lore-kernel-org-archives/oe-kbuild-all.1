Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB6E2DF3CC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766044548; cv=none; b=PlEIQ9fqVDHUjagWvoUvckYK3DGEmb0CH6O4k9P26EkLR908FqeEErlCRykFXm2x8ajiizUO0RHFafulXfjyEIGirdGupdf+WjebEWFI1L/ZwztrSlN4GZublnVj+Vpr2c3/WTovTdc1Bp+38m9d76xPMdxmrvhjJZwjiY3FvIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766044548; c=relaxed/simple;
	bh=2iDapRcYaxe97iIQtFACi5a0hAHaymLWH/KzmpbzfJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jfMCQBKKaGunrweOY+uYy+qi5XPKSouE7idJ8YCdh813RTthhzw8Q/chLCQSO3gER/se/1bJuYHpaaR0ztFZeGidM95FlkUtHLRJVK8r6EyuNlDE5n0k7LoA6Zkj9oCeYSViottLfNdVzfTN4q6KIln2Ja7EGd9Yz5OJW8UXIiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jn+Cd++K; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jn+Cd++K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766044547; x=1797580547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2iDapRcYaxe97iIQtFACi5a0hAHaymLWH/KzmpbzfJ0=;
  b=Jn+Cd++KkB3R3wF0Xjxcp7MiCWOY6uHiG5qjxFhej1yNvLTECQwYJTJ0
   wzctRW2G6Ja8R2I6YBbPb1+hWKykG+hsSR1fa5WeZjCYBD5qnK7MFPuRA
   hMsOPTRYBTt73td8ybVZ+l/HmitELUaGBJsO9jXnqXr0/yUGimvOzstPf
   qvtpZhZ6HuSOC6n5AcjWvdx4jiC/Ss+9U404jSaPN+ejTIHGqUNrAgQvc
   r4sWh8lUV12isQQw1C8AJIh8ryq1+gGTLLSTK4UR0GiBrVPckpFzzUYeS
   b6ozJSAdEkwlon/Q/2PrQnW45HkJL1UrURiPlddz5LhXm0d3uMKeLKGaj
   w==;
X-CSE-ConnectionGUID: LN/6j42qT0O2hAzOvAYyLw==
X-CSE-MsgGUID: nE77qwGuS26eJnQE9FoZZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="71852460"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="71852460"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 23:55:46 -0800
X-CSE-ConnectionGUID: uqBLwSdOR9OcIsDkCFHOnw==
X-CSE-MsgGUID: S74LwmNIQJ6m917MbL0uSw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="198412941"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Dec 2025 23:55:45 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vW8rO-000000001n7-407d;
	Thu, 18 Dec 2025 07:55:42 +0000
Date: Thu, 18 Dec 2025 15:55:17 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 43/43]
 drivers/dma-buf/heaps/deferred-free-helper.c:21:19: sparse: sparse: symbol
 'freelist_waitqueue' was not declared. Should it be static?
Message-ID: <202512181548.3ZvZVu50-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   12597ffc824d027b45aa3fda9606a4f0c3835d81
commit: fe58c121167255eef7b234d6d1193281d2c8f5e6 [43/43] ANDROID: Allow the deferred-free library heap to be compiled into the GKI
config: arm-randconfig-r134-20251217 (https://download.01.org/0day-ci/archive/20251218/202512181548.3ZvZVu50-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512181548.3ZvZVu50-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512181548.3ZvZVu50-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/heaps/deferred-free-helper.c:21:19: sparse: sparse: symbol 'freelist_waitqueue' was not declared. Should it be static?
>> drivers/dma-buf/heaps/deferred-free-helper.c:22:20: sparse: sparse: symbol 'freelist_task' was not declared. Should it be static?

vim +/freelist_waitqueue +21 drivers/dma-buf/heaps/deferred-free-helper.c

bb97bfd3d8e88c John Stultz 2020-12-09  18  
bb97bfd3d8e88c John Stultz 2020-12-09  19  static LIST_HEAD(free_list);
bb97bfd3d8e88c John Stultz 2020-12-09  20  static size_t list_nr_pages;
bb97bfd3d8e88c John Stultz 2020-12-09 @21  wait_queue_head_t freelist_waitqueue;
bb97bfd3d8e88c John Stultz 2020-12-09 @22  struct task_struct *freelist_task;
bb97bfd3d8e88c John Stultz 2020-12-09  23  static DEFINE_SPINLOCK(free_list_lock);
bb97bfd3d8e88c John Stultz 2020-12-09  24  

:::::: The code at line 21 was first introduced by commit
:::::: bb97bfd3d8e88ca18b975460a5a2217c9b45a1b0 ANDROID: dma-buf: heaps: Add deferred-free-helper library code

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: T.J. Mercier <tjmercier@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
