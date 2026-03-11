Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A3F7286413
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 06:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773210787; cv=none; b=lxzMLKKvipvfT8+Cf4fUWK8KpNaLYLMZHs/DfHQNx7jV+JNHxtf0q5uyhniERQmgUxoh5kl5bcpzZIKD5QkvciVHGp5xwQ408XJdMtYc5/u8fqv/vYxh3jbaMrG2m7fRcaWi1pIRSDcwawK93vNOXCzgNjPs0C46ewNmDZ+DsqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773210787; c=relaxed/simple;
	bh=M+MvdO8b8cbSgl/CRP/EwskgLKXsYFpEBm9pEW23mVs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dph+Rr8R67qO0Aih8EYCErPB9BZx4XUpqVCg3RmyXUsJ6V/veZlPC+6f7+eKLBeFkbom+NvEDK2jaPRlEyvEgwZzzsdSMEEGUOhb7vScwtLvjLXYEgVrfIk8CNXww506dAH7pxe6GVKOP5mdoiREQuwRoDlxY7bgTSh3N3ocbD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1Zu3SfE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1Zu3SfE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773210786; x=1804746786;
  h=date:from:to:cc:subject:message-id;
  bh=M+MvdO8b8cbSgl/CRP/EwskgLKXsYFpEBm9pEW23mVs=;
  b=a1Zu3SfEcDWpRloPP6GWnD1B8UNEgr8ZcF4eC/QyRbfx99USXtJ1u3dp
   uv8A0GBxCVVhOOG19miPWRXraiRT/PNKByVgy7WKVhBdxGneJVfnFOqP0
   yr4zYjJFqCsOIMaksCzkD+1yfp3ykwTXEwLVJYnycXUryw9J6LeBAP2ln
   xQ1irxoDryZ7YmAcr0lzvI7K+CK8cGQHxos6fmyY7U2SuyRsxI2Gn7PXz
   TA+7CNrlJF7vHZsyweR+k7ndlT+8ivu3Ez/9aPp5TbSnJ7YHLLc6XzLDl
   GCjsafbazHlCdafg7fXmuQfvA1t3Tn/IJ8dlRsVO3lbMakyblY6RJX4SL
   Q==;
X-CSE-ConnectionGUID: ZhPNNygWSKWf58rCLdYsDA==
X-CSE-MsgGUID: jmah7pQsR8aakT1lEAMFAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85748939"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="85748939"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 23:33:04 -0700
X-CSE-ConnectionGUID: TEbo7UYjTVqLKqGJRYdcag==
X-CSE-MsgGUID: 6vuKsstfQNycRekaMAzZdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="219495811"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 10 Mar 2026 23:33:02 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0D7r-000000000oP-1WiW;
	Wed, 11 Mar 2026 06:32:59 +0000
Date: Wed, 11 Mar 2026 14:32:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-2025-12 1/1]
 include/linux/mtd/cfi.h:62:2: warning: #warning No CONFIG_MTD_CFI_Ix
 selected. No NOR chip support can work.
Message-ID: <202603111457.1nzmTWa8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android13-5.15-2025-12
head:   f5526d1116e5c08b1599cddd5b90192d06bade99
commit: ccb03ec4294c0bab21252e69789c80cd766eec1e [1/1] spi: bcm-qspi: fix SFDP BFPT read by usig mspi read
config: arm-randconfig-002-20260311 (https://download.01.org/0day-ci/archive/20260311/202603111457.1nzmTWa8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260311/202603111457.1nzmTWa8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603111457.1nzmTWa8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/mtd/spi-nor.h:10,
                    from drivers/spi/spi-bcm-qspi.c:22:
>> include/linux/mtd/cfi.h:62:2: warning: #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work. [-Wcpp]
    #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
     ^~~~~~~


vim +62 include/linux/mtd/cfi.h

^1da177e4c3f41 Linus Torvalds  2005-04-16  60  
241651d04d672f David Woodhouse 2007-09-06  61  #ifndef cfi_interleave
241651d04d672f David Woodhouse 2007-09-06 @62  #warning No CONFIG_MTD_CFI_Ix selected. No NOR chip support can work.
241651d04d672f David Woodhouse 2007-09-06  63  static inline int cfi_interleave(void *cfi)
241651d04d672f David Woodhouse 2007-09-06  64  {
241651d04d672f David Woodhouse 2007-09-06  65  	BUG();
241651d04d672f David Woodhouse 2007-09-06  66  	return 0;
241651d04d672f David Woodhouse 2007-09-06  67  }
241651d04d672f David Woodhouse 2007-09-06  68  #endif
241651d04d672f David Woodhouse 2007-09-06  69  

:::::: The code at line 62 was first introduced by commit
:::::: 241651d04d672fb685b2874707016cbbf95931e5 [MTD] Fix CFI build error when no map width or interleave supported

:::::: TO: David Woodhouse <dwmw2@infradead.org>
:::::: CC: David Woodhouse <dwmw2@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
