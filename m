Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E6C4AD58
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 00:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729730492; cv=none; b=fcEPfgwiPdUcf1NjDZBamhAY5b6wBFP6yx+NqQjXaX0C4HShkhCY+/Kk2YfQYk2lQ63Z7+lrBwwaol+6Es8bGl1nRZ1ygHyxTABndT18V1/pqkUKgxv2aOdr9V9uOt+NA7SFPHf+Okx0zSkZbn+9Ve7qMDnjC0jSaaUA5wjfa3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729730492; c=relaxed/simple;
	bh=uy/oALUdEfAo3KCAj5Xv7TxODiTmXR8ap8WJ/agrsKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kyMuqTsBkHjCpWZ7AGk7Sh03tyoF/8iL/1uupqfl2hwDSmkr9kznxtn44HOJ9a1bK7wJ3ALtVH2bznhuH+0jj4zhrqibIib5UEjWMDVOffC71wadzUXqfVbxcySPN6Bfcal9cM64soU+RC/u7qsEtrMxOy+E5pJe6C6A/9Y0t20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JrRyCDiL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JrRyCDiL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729730490; x=1761266490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uy/oALUdEfAo3KCAj5Xv7TxODiTmXR8ap8WJ/agrsKg=;
  b=JrRyCDiL/M68A+XHlhp1p790DZptVIfQhzOU9XrR831krhDgJyJvW+EO
   lniG3FddXAjzhiGAxN6zyC7EAVGf6HARJXCZ5p2nkNtEzIUqzYw2u/weu
   CwatFXluGm/7mV4OGr9l8uoCyPjuPSoN+w1ezRLxq7iE+ja3xnOga3xJh
   zlsxu2LbVGFcWaeG8FqICLRVXDJvBDtJmjXmxRzthXJ7JQC/0plUmPMKp
   ROHqUg0SRiKf8aPIB3x/ao7i32QrADrLsd6X7ga/gjjqavQbiITbW+o7S
   a1lwl5Qkp2QuXtwS2bPtsnDTJLJkx7xoP1B06202u28pR5YlTaugLzkfD
   w==;
X-CSE-ConnectionGUID: ao5Fzl/QShSoBlNmePmWVA==
X-CSE-MsgGUID: Bpm6UVlzRRuuP5QfiO/KqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="33255480"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="33255480"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 17:41:29 -0700
X-CSE-ConnectionGUID: 08UQ/c/8QzKj3gAS12hGWA==
X-CSE-MsgGUID: kSOPngWkTIOs7SQiBkU7Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80847756"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Oct 2024 17:41:27 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3lun-000Vku-0e;
	Thu, 24 Oct 2024 00:41:25 +0000
Date: Thu, 24 Oct 2024 08:40:28 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev, Keith Busch <kbusch@kernel.org>
Subject: [axboe-block:io_uring-reg-wait 6/7] io_uring/io_uring.c:3266:9:
 error: implicit declaration of function 'unsafe_copy_from_user'; did you
 mean 'unsafe_copy_to_user'?
Message-ID: <202410240808.hivhiccU-lkp@intel.com>
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
config: i386-buildonly-randconfig-003-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240808.hivhiccU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240808.hivhiccU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240808.hivhiccU-lkp@intel.com/

All errors (new ones prefixed by >>):

   io_uring/io_uring.c: In function 'io_get_ext_arg':
>> io_uring/io_uring.c:3266:9: error: implicit declaration of function 'unsafe_copy_from_user'; did you mean 'unsafe_copy_to_user'? [-Werror=implicit-function-declaration]
    3266 |         unsafe_copy_from_user(&arg.sigmask, &uarg->sigmask, sizeof(arg.sigmask),
         |         ^~~~~~~~~~~~~~~~~~~~~
         |         unsafe_copy_to_user
>> io_uring/io_uring.c:3267:33: error: 'uaccess_end' undeclared (first use in this function); did you mean 'access_ok'?
    3267 |                                 uaccess_end);
         |                                 ^~~~~~~~~~~
         |                                 access_ok
   io_uring/io_uring.c:3267:33: note: each undeclared identifier is reported only once for each function it appears in
   cc1: some warnings being treated as errors

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for GET_FREE_REGION
   Depends on [n]: SPARSEMEM [=n]
   Selected by [m]:
   - RESOURCE_KUNIT_TEST [=m] && RUNTIME_TESTING_MENU [=y] && KUNIT [=y]


vim +3266 io_uring/io_uring.c

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
