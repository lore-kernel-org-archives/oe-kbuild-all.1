Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9247D129A7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Apr 2024 12:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713272009; cv=none; b=EeUiJ6CrHh48l+nQ0YOI4DpzoFx7XV9E5JSGNVvmJ/gh/85rCLM2BqIwatLXcvDbuKu0Ns+3STuMxA4E5SjnELWr/aZyq9k5x1aXjJvWnPOQhECC35k4rZezMF12euxNB1/vfhyrGoaQWFu9P3tNRHivZNj1Zbn7jXLKYWjPz0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713272009; c=relaxed/simple;
	bh=wXDaIPiB/wfBZXjKuFA7MvWN41+cmxsp/+szTRlcC64=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KFcVHDMHMR/5lyGDG1hXF81kbQuS3GxiObX1E6Aysza7rEjIlhrhzs483SbVqEFhvv5RN6jir9wb9VNY2w+C1HQ223NqSBy8+UMJl+1oId8BZUGDcdysrJqgmCpvB4UaNOPZuoSD8mbnNlJ2d+lk+6JFL0huW670qFLOlx8Y0AM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lgFNGP+U; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lgFNGP+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713272008; x=1744808008;
  h=date:from:cc:subject:message-id:mime-version;
  bh=wXDaIPiB/wfBZXjKuFA7MvWN41+cmxsp/+szTRlcC64=;
  b=lgFNGP+Uunzia5KoAAmbte+868JeaRft8mRlBvGVf80e4iaGna6xffAA
   A7oKeeLW7k4IrpPbsB02qBZjhD1jCHRGVGqEZxvGbOuIiDLNaZVSIQ8SI
   YBGby4YpF438+Gu9I79mHzsWuhG2SnqB+FQo/NmwP+JBeIfIyxj7jPFMN
   r4XRR8GHbLjjYZWwaSlyQQYxMlRqtTZI5nidLojmthMfl2EaB4OpB+yVq
   5ySLMri4Tbj3wyGxqXg5MQOqm2nfWwfjf97ptXe29XVpY3WPTPiuuoCDz
   Z/xS46zdMLk/dZbmBWDzDPsBC0Lwdd21lJdZ/m1Tor2Sxvcp5Wj9GL5SI
   w==;
X-CSE-ConnectionGUID: 3XzK74GzTqmzgqiTcveW+Q==
X-CSE-MsgGUID: KfESde04Sn+ye52pKaDW1w==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8817794"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8817794"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Apr 2024 05:53:27 -0700
X-CSE-ConnectionGUID: huCfCbimS0qfljfNdhcnaQ==
X-CSE-MsgGUID: fy6TD3x3Rc+zOg94MfD7Ag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="27046533"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 16 Apr 2024 05:53:26 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rwiJP-0005HI-2Y
	for oe-kbuild-all@lists.linux.dev;
	Tue, 16 Apr 2024 12:53:23 +0000
Date: Tue, 16 Apr 2024 20:53:06 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: fs/select.c:783: Error: unrecognized opcode `csrs sstatus,t1',
 extension `zicsr' required
Message-ID: <202404162033.T1OYgmGc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git 6.1/dovetail-xenomai-cve
head:   ae50ab5b35a1f535d25c6c9576c161702409774a
commit: 00bf25d693e7f69497cb7f61d46ef99fe295a8a5 y2038: use time32 syscall names on 32-bit
date:   5 years ago
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20240416/202404162033.T1OYgmGc-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240416/202404162033.T1OYgmGc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404162033.T1OYgmGc-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/select.c: Assembler messages:
   fs/select.c:1014: Error: unrecognized opcode `csrs sstatus,a1', extension `zicsr' required
   fs/select.c:1014: Error: unrecognized opcode `csrc sstatus,a1', extension `zicsr' required
>> fs/select.c:783: Error: unrecognized opcode `csrs sstatus,t1', extension `zicsr' required
>> fs/select.c:783: Error: unrecognized opcode `csrc sstatus,t1', extension `zicsr' required
   fs/select.c:784: Error: unrecognized opcode `csrs sstatus,t1', extension `zicsr' required
   fs/select.c:784: Error: unrecognized opcode `csrc sstatus,t1', extension `zicsr' required
   fs/select.c:803: Error: unrecognized opcode `csrs sstatus,t1', extension `zicsr' required
   fs/select.c:803: Error: unrecognized opcode `csrc sstatus,t1', extension `zicsr' required
   fs/select.c:804: Error: unrecognized opcode `csrs sstatus,t1', extension `zicsr' required
   fs/select.c:804: Error: unrecognized opcode `csrc sstatus,t1', extension `zicsr' required


vim +783 fs/select.c

9f72949f679df0 David Woodhouse 2006-01-18  767  
9f72949f679df0 David Woodhouse 2006-01-18  768  /*
9f72949f679df0 David Woodhouse 2006-01-18  769   * Most architectures can't handle 7-argument syscalls. So we provide a
9f72949f679df0 David Woodhouse 2006-01-18  770   * 6-argument version where the sixth argument is a pointer to a structure
9f72949f679df0 David Woodhouse 2006-01-18  771   * which has a pointer to the sigset_t itself followed by a size_t containing
9f72949f679df0 David Woodhouse 2006-01-18  772   * the sigset size.
9f72949f679df0 David Woodhouse 2006-01-18  773   */
d4e82042c4cfa8 Heiko Carstens  2009-01-14  774  SYSCALL_DEFINE6(pselect6, int, n, fd_set __user *, inp, fd_set __user *, outp,
e024707bccae15 Deepa Dinamani  2018-09-19  775  		fd_set __user *, exp, struct __kernel_timespec __user *, tsp,
d4e82042c4cfa8 Heiko Carstens  2009-01-14  776  		void __user *, sig)
9f72949f679df0 David Woodhouse 2006-01-18  777  {
9f72949f679df0 David Woodhouse 2006-01-18  778  	size_t sigsetsize = 0;
9f72949f679df0 David Woodhouse 2006-01-18  779  	sigset_t __user *up = NULL;
9f72949f679df0 David Woodhouse 2006-01-18  780  
9f72949f679df0 David Woodhouse 2006-01-18  781  	if (sig) {
96d4f267e40f95 Linus Torvalds  2019-01-03  782  		if (!access_ok(sig, sizeof(void *)+sizeof(size_t))
e110ab94ebc714 Al Viro         2006-02-01 @783  		    || __get_user(up, (sigset_t __user * __user *)sig)
9f72949f679df0 David Woodhouse 2006-01-18  784  		    || __get_user(sigsetsize,
e110ab94ebc714 Al Viro         2006-02-01  785  				(size_t __user *)(sig+sizeof(void *))))
9f72949f679df0 David Woodhouse 2006-01-18  786  			return -EFAULT;
9f72949f679df0 David Woodhouse 2006-01-18  787  	}
9f72949f679df0 David Woodhouse 2006-01-18  788  
e024707bccae15 Deepa Dinamani  2018-09-19  789  	return do_pselect(n, inp, outp, exp, tsp, up, sigsetsize, PT_TIMESPEC);
9f72949f679df0 David Woodhouse 2006-01-18  790  }
9f72949f679df0 David Woodhouse 2006-01-18  791  

:::::: The code at line 783 was first introduced by commit
:::::: e110ab94ebc714de57f75f0c7c576dde8cf80944 [PATCH] fix __user annotations in fs/select.c

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
