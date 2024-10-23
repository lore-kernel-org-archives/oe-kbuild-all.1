Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0828D13B5B3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 08:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729670921; cv=none; b=aU263DLlsd6if6GtqjPvfSBhY6jc0jAdwe5LL+5GFwrwq3jdqCs/paBPZq0hqhDQXF2+gWns39TPMeMrz27T3qUK26XJa11yFk1ZDvnAkqTNLVPwpwLd3NGxoscRt8KVHhxVGTIsnJ6cjHojB7FCiAtl0wepaPNlrqaSuyxskhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729670921; c=relaxed/simple;
	bh=PYVkDgNojfIFOwsn1gjcRYqaliC3EFnMvV9FgdMAZk0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KiSea7cVkuV8Y0nOAfxUJtU7YGQ7pm0qFMjSWGWB60DAFfdjnOBKWw8/QSrDghwXKc9Frh5cgYCORQYN46LiEajZZK2tkRCvjIhurfElYKZJX9PTFiDNIpOTUu119UUrq/DXREaXVsFyUyG1OhTDYq0T8O3vUicJf8kYKX82ZPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BW2nVPNB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BW2nVPNB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729670919; x=1761206919;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PYVkDgNojfIFOwsn1gjcRYqaliC3EFnMvV9FgdMAZk0=;
  b=BW2nVPNBzUuaRcuTsn54wYGPNBdDgfs/Tt1F0lME3OjF/SkLlYrKZd5Y
   I0RH3qaKfVCN/pkloajo0i1jqGtfWzB+xWTmdFzeqPNRTguvQfFQbIJz1
   ll2bnygXDam/qc++YjAe/QerCoJzEIGJDBTSyD87L7fl22jjZGPaLGUR7
   zD6zdN2Su1aZZeTSE/aRqyL2gtjT5GmnW0sP4CBw8WoQNAcCDqB/+B/Nr
   iJ1Xl/hiJi0CmRTVrxROJq2OrFy1rLPjCHxtMpyD/7+0pT0Od15cqvUKQ
   JRqalzq37/JUfZQ+4vyzV/Cuyb/NDBfk6dfwatAxEDARdGJkT4syvsRgM
   Q==;
X-CSE-ConnectionGUID: FW1lMPQPQfKDpBoLTgYPuw==
X-CSE-MsgGUID: kSSuwqcWSLu9Ua8KEZf2WA==
X-IronPort-AV: E=McAfee;i="6700,10204,11233"; a="33166232"
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="33166232"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 01:08:38 -0700
X-CSE-ConnectionGUID: ufLZ8qVuRWe/29jzFg5TDQ==
X-CSE-MsgGUID: VLuC+2tJRj2xK4FoeV4bgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,225,1725346800"; 
   d="scan'208";a="84915108"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Oct 2024 01:08:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3WPy-000Udu-0E;
	Wed, 23 Oct 2024 08:08:34 +0000
Date: Wed, 23 Oct 2024 16:07:34 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe-block:io_uring-reg-wait 6/7]
 io_uring/io_uring.c:3262:undefined reference to `__get_user_bad'
Message-ID: <202410231627.NymKyjGz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-reg-wait
head:   454727b3107832a226fbfee1d91a8b74670fc861
commit: edfa7dbed73cb69f803d6cff1fd7e0632777bfa0 [6/7] io_uring: change io_get_ext_arg() to uaccess begin + end
config: arm-moxart_defconfig (https://download.01.org/0day-ci/archive/20241023/202410231627.NymKyjGz-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410231627.NymKyjGz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410231627.NymKyjGz-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: io_uring/io_uring.o: in function `io_get_ext_arg':
>> io_uring/io_uring.c:3262:(.text+0x2570): undefined reference to `__get_user_bad'
>> arm-linux-gnueabi-ld: io_uring/io_uring.c:3264:(.text+0x25dc): undefined reference to `__get_user_bad'


vim +3262 io_uring/io_uring.c

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
> 3262		unsafe_get_user(arg.sigmask, &uarg->sigmask, uaccess_end);
  3263		unsafe_get_user(arg.min_wait_usec, &uarg->min_wait_usec, uaccess_end);
> 3264		unsafe_get_user(arg.ts, &uarg->ts, uaccess_end);
  3265		unsafe_get_user(arg.sigmask_sz, &uarg->sigmask_sz, uaccess_end);
  3266		user_access_end();
  3267		ext_arg->min_time = arg.min_wait_usec * NSEC_PER_USEC;
  3268		ext_arg->sig = u64_to_user_ptr(arg.sigmask);
  3269		ext_arg->argsz = arg.sigmask_sz;
  3270		if (arg.ts) {
  3271			if (get_timespec64(&ext_arg->ts, u64_to_user_ptr(arg.ts)))
  3272				return -EFAULT;
  3273			ext_arg->ts_set = true;
  3274		}
  3275		return 0;
  3276	uaccess_end:
  3277		user_access_end();
  3278		return -EFAULT;
  3279	}
  3280	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
