Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AAFD57861
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Mar 2024 16:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710174172; cv=none; b=fNJEZNq3xENtYOzt3M7h7llPICC5zRHmOnbrwk0XmOAdLsKY1pcR/Y5mlCIsT512nA1wzFdYaBpyREe5smUPvW2Kk7rn6ing1FTSpKeCnzyYy2Xfm28nbHITVrWl0UWydJH6qQRtKMXPD+ymtBiz0/nJo62cArPehzNqVeJUypM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710174172; c=relaxed/simple;
	bh=snxNJOugY98oo+hRbPWp1WPcBcO8Qwgp+7TW+Q+k5os=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DlGW7TtSb3L8/k7Yf+GAntjntXV07k2q/C1Jo4Io6IxT6CViF7+n8S30BZm+k0+seeORUMDKMVYu9m+4AB2Qal19whNUo1s0W1PSdpPQ3zCtdjuaZ/ork5HMtL6lZujD343FysIM9uJEI+XyhG+brzCKXaSluv1j/KEN8UkPwCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FuD1GVlY; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FuD1GVlY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710174170; x=1741710170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=snxNJOugY98oo+hRbPWp1WPcBcO8Qwgp+7TW+Q+k5os=;
  b=FuD1GVlYZZLkmK8v6Jd3ni15BLFSyV9mAFGXqHuVuY9U/gtgA5K95xMY
   2HRcrVSgWN1EiMVD2KjXfZbRD9BrUv9XvJpMz++thKxnstosq51y5nd0m
   ER4T75oSo4dTaq1TXuSj4XkIyA9mLy8vYH1mgw63V0/uUvK/Yk8CeTCwT
   aN33PgFh5qlRm3pTI2fXMSLaktz0fYo1bixdpBeIIN0/zisSkfMqLprKM
   7+vE7cN9T45NNLtpEkfOsjvO7ZG2+Z9AAqoomluqMknQOAwXA3A3dpP5h
   drZm8oivNMBhETAoE/c8nxhCMzSduJrrMJ0ACSq7iJx+WzgD5q9ANj1oT
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,11010"; a="27317679"
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="27317679"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2024 09:22:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,117,1708416000"; 
   d="scan'208";a="11649843"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Mar 2024 09:22:49 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rjiQI-0009FI-0e;
	Mon, 11 Mar 2024 16:22:46 +0000
Date: Tue, 12 Mar 2024 00:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Michael Sit <michael.wei.hong.sit@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/android_t 1/1]
 drivers/net/ethernet/intel/igb/igb_main.c:265:27: sparse: sparse: incorrect
 type in initializer (different base types)
Message-ID: <202403120022.XQwoXSUq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/android_t
head:   a2f507017385e5d7471bfd45d84949c4007a514d
commit: 527e3ce50b7f5010c8c9097b9c1b43cb5d7463c4 [1/1] igb_avb: AVB feature enablement
config: arm-randconfig-r133-20240311 (https://download.01.org/0day-ci/archive/20240312/202403120022.XQwoXSUq-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 503c55e17037436dcd45ac69dea8967e67e3f5e8)
reproduce: (https://download.01.org/0day-ci/archive/20240312/202403120022.XQwoXSUq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403120022.XQwoXSUq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/intel/igb/igb_main.c:265:27: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   drivers/net/ethernet/intel/igb/igb_main.c:265:27: sparse:     expected restricted __poll_t ( *poll )( ... )
   drivers/net/ethernet/intel/igb/igb_main.c:265:27: sparse:     got unsigned int ( * )( ... )
>> drivers/net/ethernet/intel/igb/igb_main.c:835:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [usertype] port @@     got restricted __be16 [usertype] @@
   drivers/net/ethernet/intel/igb/igb_main.c:835:22: sparse:     expected unsigned short [usertype] port
   drivers/net/ethernet/intel/igb/igb_main.c:835:22: sparse:     got restricted __be16 [usertype]

vim +265 drivers/net/ethernet/intel/igb/igb_main.c

   256	
   257	static void igb_init_dmac(struct igb_adapter *adapter, u32 pba);
   258	#ifdef CONFIG_IGB_AVB
   259	/* user-mode IO API registrations */
   260	static const struct file_operations igb_fops = {
   261			.owner   = THIS_MODULE,
   262			.llseek  = no_llseek,
   263			.read	= igb_read,
   264			.write   = igb_write,
 > 265			.poll	= igb_pollfd,
   266			.open	= igb_open_file,
   267			.release = igb_close_file,
   268			.mmap	= igb_mmap,
   269			.unlocked_ioctl = igb_ioctl_file,
   270	#if defined(CONFIG_IGB_SUPPORT_32BIT_IOCTL)
   271			.compat_ioctl = igb_ioctl_file,
   272	#endif
   273	};
   274	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
