Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73DDBED7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Jan 2024 02:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXP/LKbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705025419; x=1736561419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OWYWgEYf8Dv5W5e16rtc0i4VNmolkYRdAd9ET4rdIXQ=;
  b=fXP/LKbLAD1PLqnjZHuiw+iFO9N8FErRmAR0OVyCZdzAvP4Y+g2RPkeQ
   w6otXuohhLTEdBK6ZFDUSx0bCbupPtCIp9qsX/N5s4kO5XVSjQ8Yd3H5Q
   ernxTaX1qLlApn7++VuDUiAB7lvozsY+d1c/xWhZEcP9+L53PFZ5ZN8qd
   JKRiQS0mBsEEGBdRuDuXSiEBgK6+2Ty3k6DHTtmhwBIGdUy26vj+ta4b2
   YCd4/0w98j5RSyKOE8eQAaPGL8tBjJRF+XJ4xx+AWl+8zP23EW5jK2dRF
   bRBzySc0QVtuMPWHF0ijXgGeuA2XJ22BSGxcm/xdJoisuRI2lIqwB+OLW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="465443271"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="465443271"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2024 18:10:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10950"; a="873229467"
X-IronPort-AV: E=Sophos;i="6.04,188,1695711600"; 
   d="scan'208";a="873229467"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 11 Jan 2024 18:10:15 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rO6zt-0008wk-2z;
	Fri, 12 Jan 2024 02:10:13 +0000
Date: Fri, 12 Jan 2024 10:09:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 686/2356] arch/arm64/kernel/sys_compat.c:68:6:
 warning: no previous prototype for function 'a32_arm_syscall'
Message-ID: <202401120931.ImE5aLcj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xiongfeng,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ea6de9f6732d495c506f9c140b4ec17c957e1b77
commit: c6c09f786dc8ec9ee4aa6be0de310e1075cb91fa [686/2356] arm64: rename functions that reference compat term
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240112/202401120931.ImE5aLcj-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240112/202401120931.ImE5aLcj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401120931.ImE5aLcj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/sys_compat.c:68:6: warning: no previous prototype for function 'a32_arm_syscall' [-Wmissing-prototypes]
      68 | long a32_arm_syscall(struct pt_regs *regs, int scno)
         |      ^
   arch/arm64/kernel/sys_compat.c:68:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      68 | long a32_arm_syscall(struct pt_regs *regs, int scno)
         | ^
         | static 
   1 warning generated.


vim +/a32_arm_syscall +68 arch/arm64/kernel/sys_compat.c

    53	
    54	static inline long
    55	do_a32_cache_op(unsigned long start, unsigned long end, int flags)
    56	{
    57		if (end < start || flags)
    58			return -EINVAL;
    59	
    60		if (!access_ok((const void __user *)start, end - start))
    61			return -EFAULT;
    62	
    63		return __do_a32_cache_op(start, end);
    64	}
    65	/*
    66	 * Handle all unrecognised system calls.
    67	 */
  > 68	long a32_arm_syscall(struct pt_regs *regs, int scno)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
