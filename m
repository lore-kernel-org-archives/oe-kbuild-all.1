Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968F738F24D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Mar 2026 16:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936791; cv=none; b=IdFfMtGwa27xNL6jNtCj/z+jXIOB28WWEX4uA1K4EzGBN4moVFrecS8dlodYpyxMwhc0C8Bbt2F7KvMKmUm3GysaLfsq5tlvNKaCtYW9djKJuSHcMmPMjJcTydSJVpPTHI7vEJ1/pfn70ciNzkAt0Pd/YI4npH0mlE/DUIyJVcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936791; c=relaxed/simple;
	bh=Jjg3oB7ZdW60JvzO5Cn3s7bxmVkl/N4nxx1G0cHqhio=;
	h=Date:From:To:Cc:Subject:Message-ID; b=l+nfGA2e/qed7Hnu8MivWI76hO43+DfDg/nareZkKtKf2jMW4GKLdOo+K6nZapPI00qFxzK7nNQoMM2Kl3YEd+pHkWEUOMDIyfhBV+uXWVg+qvlHQTrOZ9iHp+vMimsUsT33uQLQgrQ5UPcla2mNHLB3GgugtqD7UA8wDevSsMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bx8cCshf; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bx8cCshf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773936788; x=1805472788;
  h=date:from:to:cc:subject:message-id;
  bh=Jjg3oB7ZdW60JvzO5Cn3s7bxmVkl/N4nxx1G0cHqhio=;
  b=Bx8cCshfLXfdfO/ZWGQ5OgD3cKU52PX1bna8AyBGbCtCS3O7g8z+FdXh
   7FKVgg9qXQRY+TLhXcwt9fb92ggbVPWOo+dCF+/dDXCpuOYix1at97ee4
   bqQQKrfBdsEXu2icF1bQNScmkMNAI2shNZ2rUeMce51rFMUzSmWqaWeD7
   AUWNjXN3PLayvb52NMRDngk/ULUZ2uSTQZb6QgpNW1tbMO3akAF9BXR1W
   8bZOEZCKTvTFaPdyY9P96/E9Hlja9NjSHOPVrohRK8MPkwTwV+Raqc+yI
   7kC8Tc2ucuVUEn+k0yA7tz545R+jn1Mndp/Ski/nUJeVMU6LYhHV35Z3z
   Q==;
X-CSE-ConnectionGUID: uKPhuP7EQM6ndeYuz9wPOg==
X-CSE-MsgGUID: 2rTn+5gAROuHTrJCFNVvGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74925024"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74925024"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 09:13:07 -0700
X-CSE-ConnectionGUID: EOUOYk90RK+bKMYkDfWD9g==
X-CSE-MsgGUID: Win/PIvCQeC3h1iyccWR6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227956883"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 19 Mar 2026 09:13:06 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3Fyr-000000001HB-2FUU;
	Thu, 19 Mar 2026 16:12:32 +0000
Date: Fri, 20 Mar 2026 00:08:56 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 38/539]
 drivers/char/xillybus/xillyusb.c:355:12: warning: 'xilly_copy_to_iter'
 defined but not used
Message-ID: <202603200057.sKhCYcpO-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   f36e0fb8d552bd827ef31f4fc1190d0149c44249
commit: da97f6f63575baff63b739fafeff7f02ca236668 [38/539] char/xillybus: convert to read/write iterators
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260320/202603200057.sKhCYcpO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260320/202603200057.sKhCYcpO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603200057.sKhCYcpO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/char/xillybus/xillyusb.c:363:12: error: redefinition of 'xilly_copy_from_iter'
     363 | static int xilly_copy_from_iter(void *dst, const void *src, int n)
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/char/xillybus/xillyusb.c:347:12: note: previous definition of 'xilly_copy_from_iter' with type 'int(void *, const void *, int)'
     347 | static int xilly_copy_from_iter(void *dst, const void *src, int n)
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/char/xillybus/xillyusb.c:371:12: error: redefinition of 'xilly_copy_to_iter'
     371 | static int xilly_copy_to_iter(void *dst, const void *src, int n)
         |            ^~~~~~~~~~~~~~~~~~
   drivers/char/xillybus/xillyusb.c:355:12: note: previous definition of 'xilly_copy_to_iter' with type 'int(void *, const void *, int)'
     355 | static int xilly_copy_to_iter(void *dst, const void *src, int n)
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/char/xillybus/xillyusb.c:355:12: warning: 'xilly_copy_to_iter' defined but not used [-Wunused-function]
>> drivers/char/xillybus/xillyusb.c:347:12: warning: 'xilly_copy_from_iter' defined but not used [-Wunused-function]
     347 | static int xilly_copy_from_iter(void *dst, const void *src, int n)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/xilly_copy_to_iter +355 drivers/char/xillybus/xillyusb.c

   340	
   341	/*
   342	 * These wrapper functions are used as the @copier argument to
   343	 * fifo_write_iter() and fifo_read_iter(), so that they can work
   344	 * directly with an iov_iter.
   345	 */
   346	
 > 347	static int xilly_copy_from_iter(void *dst, const void *src, int n)
   348	{
   349		if (!copy_from_iter_full(dst, n, (struct iov_iter *)src))
   350			return -EFAULT;
   351	
   352		return 0;
   353	}
   354	
 > 355	static int xilly_copy_to_iter(void *dst, const void *src, int n)
   356	{
   357		if (!copy_to_iter_full(src, n, (struct iov_iter *)dst))
   358			return -EFAULT;
   359	
   360		return 0;
   361	}
   362	
   363	static int xilly_copy_from_iter(void *dst, const void *src, int n)
   364	{
   365		if (!copy_from_iter_full(dst, n, (struct iov_iter *)src))
   366			return -EFAULT;
   367	
   368		return 0;
   369	}
   370	
 > 371	static int xilly_copy_to_iter(void *dst, const void *src, int n)
   372	{
   373		if (!copy_to_iter_full(src, n, (struct iov_iter *)dst))
   374			return -EFAULT;
   375	
   376		return 0;
   377	}
   378	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
