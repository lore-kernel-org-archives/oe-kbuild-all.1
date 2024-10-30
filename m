Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F4D1BD9E2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 18:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730313632; cv=none; b=JJMa6hZQwmWHnA0NmVwFH1aJnbmWgzWfY6excxAP02eas1CBLtSN0wbCxkB90o7NJPqE1BxZmMaTJ8RxWfYN+ZsvGcNmp/voyvcYc3B8b/9e57z/xtjokZFX6lV6uij6bP9mmqOHXB4EK1gEwNwBzlH0V4Rgnsb4N8deeAGcOpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730313632; c=relaxed/simple;
	bh=m3bz0TnHQjIHzTH49RjZ3u95T0EebLlDPw6kMQAm8Vs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PxNqzW9j5SQgn0cCvRTQFXKt4MRTpCmv8pDZhNJAdCy2G24xq7+8PZrdTSw1iU0HXMUPwTbAklGi/oEqJ+Q8ItLAhL7REpKAsFT7dkezZknkCi5mfpR0d52fIQ2VLGPTS/Qk3PFiJj8Yevx5i9FI8UQ4Fbbe47ppA5BlgZnuXIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QOk+oz2Y; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QOk+oz2Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730313631; x=1761849631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m3bz0TnHQjIHzTH49RjZ3u95T0EebLlDPw6kMQAm8Vs=;
  b=QOk+oz2YBcSUQIhDYJA3YrKm4K7abzJYLWnzLS4/q9KQJ+mB96dw5vBz
   7XLm9yLm8sgmDx+Idz0T33UyRQRYaoDsOqRe2WtNP0JxQvSvo+eubTcN6
   Kk4qPClLG/fgqStig+N2McbooHEfcR3F2Fnd1X/z3CFfvrnjCPgn/g8LB
   EP5hmKr3Uarz7d6npwIP3pFiGPS2lXbd8jvW6V/j39rZR4eHLxvfqxYLs
   S3+eyVFhFk5C4ik38Sm9b5fiaxoQGkTuQ32k2X2HroLdPRECqY1X6bFXx
   39y1Yzslvpeua2dBiK1BAE4DZt0UyKziZpkyB9mYRfghxyDXvmhp/uIuc
   g==;
X-CSE-ConnectionGUID: /4h/4EjAQVaMIr7m1XP+xQ==
X-CSE-MsgGUID: bkV1ZMz1RoSsRDowQZQGrQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="40639795"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="40639795"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 11:40:30 -0700
X-CSE-ConnectionGUID: goxPL3xdT5WwiepvgNhb4g==
X-CSE-MsgGUID: LnxqgjpPSTCowGjwokZucA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="119863440"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 30 Oct 2024 11:40:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6DcI-000fCW-20;
	Wed, 30 Oct 2024 18:40:26 +0000
Date: Thu, 31 Oct 2024 02:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-2024-09 6922/23810]
 drivers/dma-buf/heaps/deferred-free-helper.c:21:19: sparse: sparse: symbol
 'freelist_waitqueue' was not declared. Should it be static?
Message-ID: <202410310242.4biEiXlp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-2024-09
head:   0457cd8ded410d7985734a1babed0179cf3f9ec7
commit: fe58c121167255eef7b234d6d1193281d2c8f5e6 [6922/23810] ANDROID: Allow the deferred-free library heap to be compiled into the GKI
config: arm-randconfig-r131-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310242.4biEiXlp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241031/202410310242.4biEiXlp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410310242.4biEiXlp-lkp@intel.com/

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
