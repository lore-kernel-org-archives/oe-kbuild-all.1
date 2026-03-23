Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EA4175A68
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Mar 2026 12:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774269919; cv=none; b=t7oXZt9cOHJVAc6tdO3yWfflSaS9ihi1B5XpSq4QJuLUVk34gBPDobLq1scf9vXxCA3XLz2y9Fb3r1599oVs5wjcslXJORFLw6ipieFucIXdMjSX6ilPYqh6gsSc5aNyrf1/l5VaucdNJlI1VhSWhQ/Ne61XoX+Kz9F/pN5W51A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774269919; c=relaxed/simple;
	bh=+lSk9pAMh/+ysUYDJ00kcmChf6evLNFbq6VKXFr8+mA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dsf3Ix3IHtxOokCQLoYV9vTuR1xw8PMQ/iTJ/TvaxQzypFPE/dSJec4Z2lBNmEJ1qAZ/zsp43pveTcvrhKsZmD2HwjzFVRYImMB39z2Jgvqh1S+GILREx0UxvxLFG69sJZGYcU7mxqJZ+H5zghK+ipoKOpj+K+NE+ijNSuFbjj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8GDRtnv; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8GDRtnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774269916; x=1805805916;
  h=date:from:to:cc:subject:message-id;
  bh=+lSk9pAMh/+ysUYDJ00kcmChf6evLNFbq6VKXFr8+mA=;
  b=Q8GDRtnvRuzEHiYWNmm+XeCL9PFY55/XTnEVOQpALxTU9It+6bYlV3lj
   mA/pFxfR0qFawcip1HAnD34aqUc3phHcjJZEqp3pFWiNLmq4pMbtCOTUY
   VlNjlzYDtcJ5KWQQFGoPwMiBoFM+AdUDcNMoSmvymx5y8KK5umn1jVNCv
   1BNUH4bEu/RHurbDuNpNSGQ1Zt3FLgZjqrJf8lfxMcMwjMg1vaV+miw/A
   ZLdqRIAn5VuvcF+ZyIpA+Z7xWstv68btJuQqRJ0lCTZT/1yrPtEp4xlon
   kqRFryRLT361ZcKS0SyeLTmWmNwEOskzmkaC5rWYULOrctzcUDE+9ssqU
   w==;
X-CSE-ConnectionGUID: mVv5VDEWSq+Cnqwt0ycnEA==
X-CSE-MsgGUID: UB9NRsj7QPOznO86Zp2dGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="75147447"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="75147447"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 05:45:16 -0700
X-CSE-ConnectionGUID: Lm/Rs391SnONICfm8gAYPw==
X-CSE-MsgGUID: gb/jiXJ2TtG5fQP2a2g6ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="254498036"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 23 Mar 2026 05:45:15 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4eee-000000000Wv-0qZE;
	Mon, 23 Mar 2026 12:45:12 +0000
Date: Mon, 23 Mar 2026 20:44:12 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/5] WARNING: modpost:
 vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove
 __init or EXPORT_SYMBOL.
Message-ID: <202603232007.DBddFSHX-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Zhou,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   037660b116cb733997f7aac8aa34d76a7da7905e
commit: c0383ca2116fdaefcc84987374253442c64a6675 [0/5] Revert "ANDROID: memblock: Remove memblock_end_of_DRAM() export"
config: x86_64-buildonly-randconfig-004-20260323 (https://download.01.org/0day-ci/archive/20260323/202603232007.DBddFSHX-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260323/202603232007.DBddFSHX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603232007.DBddFSHX-lkp@intel.com/

All warnings (new ones prefixed by >>, old ones prefixed by <<):

>> WARNING: modpost: vmlinux: memblock_end_of_DRAM: EXPORT_SYMBOL used for init symbol. Remove __init or EXPORT_SYMBOL.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
