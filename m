Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AEE17BD3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 01:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729732355; cv=none; b=l8ku/X5FWNJgD8Y+zjeEI1jWr4waAENZaIPI3kGKmJjYeCD77UsBkSwvsVFCWelNNFSkr/mtfh2yN2RPi+6S0VRWZxKf+4BNXeAVzxhilyZAPdyLbO+KAYKE2RTcuJl95IQ4+iOldE9ZFxTH6F2AbF1pKreJkIfOGFV9q1ZtXsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729732355; c=relaxed/simple;
	bh=rGreXcXBNfLxQK6/gVaThrNStudNQ7iPzUTN1JwcTxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YoLDPdscHUXbhy9gcclkV3OEZaUyDLLddqfhrQyYk24mWPdPtPnT/QWvbH5l2E7qtlSSH4dD9qaxKcjXgJfAEEwXGTpZgIwFA00w55mXjy88lSoea778Eofg/H40P57J00sIG1mgrApXWbFFQgTBNZYWB7DMffBd8M6k5dLddpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kInsBesC; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kInsBesC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729732353; x=1761268353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rGreXcXBNfLxQK6/gVaThrNStudNQ7iPzUTN1JwcTxQ=;
  b=kInsBesC1iDXJbNfJnDhkuc6CX5gpfXiseOn9e+7mLlGz90+bI4utXdj
   O8FX2BMEeQTOCVI0mlf5LEJq8+q94rhYu87189gAn4U2j4Ix1Nih53tJI
   KWFvPKUeJ3jUdzSjvUDUxjAW3681/xKvPo5F1OEBtf5zsxrW/GdOxFrV7
   LNKfHOku5pdauOiTnTN/mRHrhZooEt3gcGfu4ARS4/+k3g+dgZrIYoHJ6
   btN87cajkU6nwE1M56ScNbTXtkkOMMRCkTa+vLh1lofiMpS5Fedx4aDV0
   YSevRwRL6RA401TXuP67HHHZYnTXG/wx84VBkptJ7IJSuETeYYzzZQDv3
   w==;
X-CSE-ConnectionGUID: fAsIPxLkRgmVDXxJZ99P8A==
X-CSE-MsgGUID: O4kRcpn7RLa9PQDexA8New==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39930106"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="39930106"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 18:12:29 -0700
X-CSE-ConnectionGUID: 48TLZz+lSH+bqqaG43razA==
X-CSE-MsgGUID: +rWlPpvlTxiBEhYFF1KWlQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80356655"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Oct 2024 18:12:29 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3mOo-000Vmk-0v;
	Thu, 24 Oct 2024 01:12:26 +0000
Date: Thu, 24 Oct 2024 09:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, Keith Busch <kbusch@kernel.org>
Subject: [axboe-block:io_uring-reg-wait 6/7] io_uring/io_uring.c:3266:2:
 error: call to undeclared function 'unsafe_copy_from_user'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202410240952.0AH7sqy6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-reg-wait
head:   e6f2a14df3bb9933ef212240bdf8ead32bed1009
commit: 3b7a19988e4c7ab49db44fa9ef1f2e3309b92b5e [6/7] io_uring: change io_get_ext_arg() to use uaccess begin + end
config: i386-randconfig-141-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240952.0AH7sqy6-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240952.0AH7sqy6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240952.0AH7sqy6-lkp@intel.com/

All errors (new ones prefixed by >>):

>> io_uring/io_uring.c:3266:2: error: call to undeclared function 'unsafe_copy_from_user'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    3266 |         unsafe_copy_from_user(&arg.sigmask, &uarg->sigmask, sizeof(arg.sigmask),
         |         ^
>> io_uring/io_uring.c:3267:5: error: use of undeclared identifier 'uaccess_end'
    3267 |                                 uaccess_end);
         |                                 ^
   io_uring/io_uring.c:3268:60: error: use of undeclared identifier 'uaccess_end'
    3268 |         unsafe_copy_from_user(&arg.ts, &uarg->ts, sizeof(arg.ts), uaccess_end);
         |                                                                   ^
   3 errors generated.


vim +/unsafe_copy_from_user +3266 io_uring/io_uring.c

  3238	
  3239	static int io_get_ext_arg(unsigned flags, const void __user *argp,
  3240				  struct ext_arg *ext_arg)
  3241	{
  3242		const struct io_uring_getevents_arg __user *uarg = argp;
  3243		struct io_uring_getevents_arg arg;
  3244	
  3245		/*
  3246		 * If EXT_ARG isn't set, then we have no timespec and the argp pointer
  3247		 * is just a pointer to the sigset_t.
  3248		 */
  3249		if (!(flags & IORING_ENTER_EXT_ARG)) {
  3250			ext_arg->sig = (const sigset_t __user *) argp;
  3251			return 0;
  3252		}
  3253	
  3254		/*
  3255		 * EXT_ARG is set - ensure we agree on the size of it and copy in our
  3256		 * timespec and sigset_t pointers if good.
  3257		 */
  3258		if (ext_arg->argsz != sizeof(arg))
  3259			return -EINVAL;
  3260		if (!user_access_begin(uarg, sizeof(*uarg)))
  3261			return -EFAULT;
  3262	#ifdef CONFIG_64BIT
  3263		unsafe_get_user(arg.sigmask, &uarg->sigmask, uaccess_end);
  3264		unsafe_get_user(arg.ts, &uarg->ts, uaccess_end);
  3265	#else
> 3266		unsafe_copy_from_user(&arg.sigmask, &uarg->sigmask, sizeof(arg.sigmask),
> 3267					uaccess_end);
  3268		unsafe_copy_from_user(&arg.ts, &uarg->ts, sizeof(arg.ts), uaccess_end);
  3269	#endif
  3270		unsafe_get_user(arg.min_wait_usec, &uarg->min_wait_usec, uaccess_end);
  3271		unsafe_get_user(arg.sigmask_sz, &uarg->sigmask_sz, uaccess_end);
  3272		user_access_end();
  3273		ext_arg->min_time = arg.min_wait_usec * NSEC_PER_USEC;
  3274		ext_arg->sig = u64_to_user_ptr(arg.sigmask);
  3275		ext_arg->argsz = arg.sigmask_sz;
  3276		if (arg.ts) {
  3277			if (get_timespec64(&ext_arg->ts, u64_to_user_ptr(arg.ts)))
  3278				return -EFAULT;
  3279			ext_arg->ts_set = true;
  3280		}
  3281		return 0;
  3282	uaccess_end:
  3283		user_access_end();
  3284		return -EFAULT;
  3285	}
  3286	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
