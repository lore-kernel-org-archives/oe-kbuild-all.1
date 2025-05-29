Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD8B22F776
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 18:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748542845; cv=none; b=kfcKWI6Ejk+HCDiQ5DxLz26puOtL4rD9Gb5b2X3qouzSPJbAGKIZeSiEQsFaoIVvSvkgdGWgomSqNNVvDc2SCuPVAZ85LCYCIqBJTzBVRZ4NnXxpwMAi0Rno8AHkskoNB+w5Ez2cyhPwQnyX1d2RiQ6u1C8jn5ixFQe2jiaeMHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748542845; c=relaxed/simple;
	bh=+hvz/a3m11mkmjl7SwismqyjO76nlVePoXucrdxMwMY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F7Byh9zA+Yv6d3iZmIf45xpacYhrJ7ZS+CRfV7rWdDO7v56mz881edcRRNmv2GnMFHC1Y4+pWmRO86i5ZeEblvqznOZyRhNGVGIsAGhiyqu6u0HQDcJjbaGm7lp9R3mVXGiX9s7wnCLReYZHyMh9sJbsm5sMTGTObtbLF4Rz55A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eqTCYeAk; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eqTCYeAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748542843; x=1780078843;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+hvz/a3m11mkmjl7SwismqyjO76nlVePoXucrdxMwMY=;
  b=eqTCYeAkNZIXSX7LhsLQUqJ6gzuTKR76tRTeqBNAMKvRxlUTA/3ngrHQ
   UU+0nQvUZ7kBYUxz/uSkWf3iZzjodAhPxweLMAcP+8sbGR5sAyvMRwOAo
   ag7R1ZFucVF0xk6XnrmV3wJoKBwKydv1DryruMkQ1IuN9eJbzHkgIV9mC
   CwCdGUgxYINY1upEhy4QLX3T55tTwE4eJFl1alSepNgAPHUTv/HUt9NiU
   p6mQQzyV75Dqr9BxnoxgRtUKM7ct3jrYcvUphLYhLfPgKYsG/nmfS4RW1
   89JoAp1YK8o9V4FbRjb0awxFIwzcgfK/tb0J8IslZzz4L3kga9u/tDkyM
   w==;
X-CSE-ConnectionGUID: 8rVhiWZaSWuY9zd2FUrF3A==
X-CSE-MsgGUID: xyTkcgBMQ36F8XjMsxBPKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="54420912"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="54420912"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 11:20:42 -0700
X-CSE-ConnectionGUID: mNvQoD2hSpu9nyRNhK87NA==
X-CSE-MsgGUID: 8/kAyZnyRjGHhjQkr+mfDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="148426552"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2025 11:20:42 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKhrr-000Wyc-1N;
	Thu, 29 May 2025 18:20:39 +0000
Date: Fri, 30 May 2025 02:20:27 +0800
From: kernel test robot <lkp@intel.com>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: oe-kbuild-all@lists.linux.dev, Lee Jones <lee@kernel.org>
Subject: [linux-next:master 12568/13944] ld.lld: error: undefined symbol:
 v4l2_flash_release
Message-ID: <202505300252.CfOCcEHg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2a628f951ed54c30a232230b5b58349d2a8dbb11
commit: b338a2ae9b316df1d81b5289badcc8cbbbfe1b2b [12568/13944] leds: tps6131x: Add support for Texas Instruments TPS6131X flash LED driver
config: hexagon-randconfig-r054-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300252.CfOCcEHg-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250530/202505300252.CfOCcEHg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505300252.CfOCcEHg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: v4l2_flash_release
   >>> referenced by leds-tps6131x.c
   >>>               drivers/leds/flash/leds-tps6131x.o:(tps6131x_remove) in archive vmlinux.a
   >>> referenced by leds-tps6131x.c
   >>>               drivers/leds/flash/leds-tps6131x.o:(tps6131x_remove) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: v4l2_flash_init
   >>> referenced by leds-tps6131x.c
   >>>               drivers/leds/flash/leds-tps6131x.o:(tps6131x_v4l2_setup) in archive vmlinux.a
   >>> referenced by leds-tps6131x.c
   >>>               drivers/leds/flash/leds-tps6131x.o:(tps6131x_v4l2_setup) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
