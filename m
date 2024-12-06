Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0629E13BAC6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Dec 2024 02:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733450911; cv=none; b=VvSbEe/MATYqdXhjcIRY0daq3+nXTxvQR5SPT+4z6y2mEZawnKdb1N7EIUSiEr1jyQTv4thylqbHYOKyOaoSgCKbFAHqC0IS9s1eSmoRH21qlq7oZ4/KMZ5CklaANIVq+SC+FSKuU8NZONzKBgFFM1NJo1wi+SgZd9czHr34l2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733450911; c=relaxed/simple;
	bh=/2/SB3twESFHZRADp3BJ7fgVNAtYfYj6jijMxm2fbEw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fcHkg4cppp6TfUrlA9Dih2IPyHUl2b9YNab+wGr0cMGqzFsreLeaS+heXT05Y3SAsKb2C9FbJ6c5kCrHc1vM51Ow8ylRGCiWea12OZpL6sg5g8XAvlft6wFbkv2bI6dnxMAObcWNd8ECnQJmM/JAn/uYObjeCEhX/l2i06yZ++k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aLJmm8wB; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aLJmm8wB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733450910; x=1764986910;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/2/SB3twESFHZRADp3BJ7fgVNAtYfYj6jijMxm2fbEw=;
  b=aLJmm8wBIUojO4r9me3mMKtmcoddlf9zrogGGZByUWMejIsa0DzY1tcI
   SoKfADkR/MqfoaGZOQh86JbjZe5LOusftYnc5YqduPJQ+Leo21So6QJ8O
   fCQUS4ayuRsV0nooPAZ49OQuAlKuaYHAm41q3uMzz4pwxqn0E1fp07UgZ
   n3ySE17IEMyHFkbjtHN2v6/Qj5Z0aT/YQg8nmXvUw9Wp1yvjgHZK7tOw4
   tiCL/ZHZrdfHyEYNsllrhqBBhY9e+8AODq11HBuq85vvhzoGu/zUkC4CF
   U0dtUxch5KjEDt/A2i5yL+8W73JGDKFot2C6S4vgd9bbFd+ToSYJexgYV
   g==;
X-CSE-ConnectionGUID: ArG7zDNsSCyGC8lk36TFyg==
X-CSE-MsgGUID: iZxaw6h7QGecj3VZ/JYzJg==
X-IronPort-AV: E=McAfee;i="6700,10204,11277"; a="36628911"
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="36628911"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2024 18:08:30 -0800
X-CSE-ConnectionGUID: IQk8onOsSEKvPDfuDp2RSw==
X-CSE-MsgGUID: Rk2yA06aQtqOQ9ma3CfXmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,212,1728975600"; 
   d="scan'208";a="99341701"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 05 Dec 2024 18:08:29 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tJNlZ-0000c3-2u;
	Fri, 06 Dec 2024 02:08:25 +0000
Date: Fri, 6 Dec 2024 10:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 10840/30000]
 drivers/dma-buf/heaps/deferred-free-helper.c:23:19: sparse: sparse: symbol
 'freelist_waitqueue' was not declared. Should it be static?
Message-ID: <202412061007.p81dUqrJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   0c0e4e7af1d88f89746df9473da789f2cee2a15e
commit: e3919bfeb0066ab9b5f9765e5610b95672990e64 [10840/30000] ANDROID: dma-buf: system_heap: Add deferred freeing to the system heap
config: i386-randconfig-063 (https://download.01.org/0day-ci/archive/20241206/202412061007.p81dUqrJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241206/202412061007.p81dUqrJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412061007.p81dUqrJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/heaps/deferred-free-helper.c:23:19: sparse: sparse: symbol 'freelist_waitqueue' was not declared. Should it be static?
>> drivers/dma-buf/heaps/deferred-free-helper.c:24:20: sparse: sparse: symbol 'freelist_task' was not declared. Should it be static?

vim +/freelist_waitqueue +23 drivers/dma-buf/heaps/deferred-free-helper.c

bd1639945c3029 John Stultz 2020-12-09  20  
bd1639945c3029 John Stultz 2020-12-09  21  static LIST_HEAD(free_list);
bd1639945c3029 John Stultz 2020-12-09  22  static size_t list_nr_pages;
bd1639945c3029 John Stultz 2020-12-09 @23  wait_queue_head_t freelist_waitqueue;
bd1639945c3029 John Stultz 2020-12-09 @24  struct task_struct *freelist_task;
bd1639945c3029 John Stultz 2020-12-09  25  static DEFINE_SPINLOCK(free_list_lock);
bd1639945c3029 John Stultz 2020-12-09  26  

:::::: The code at line 23 was first introduced by commit
:::::: bd1639945c30298e4bea2b611d6b0cd08d3cdd98 ANDROID: dma-buf: heaps: Add deferred-free-helper library code

:::::: TO: John Stultz <john.stultz@linaro.org>
:::::: CC: John Stultz <john.stultz@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
