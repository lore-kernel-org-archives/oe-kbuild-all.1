Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DD8313527
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Mar 2026 07:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774078744; cv=none; b=SxzbXEiASINPUE9AJuHtaCdVYXsi8Dbx9yI4i5u9pNHtz3I43ngBB+8qREYBUeVLEwPX+kuXi7Ed+6/VVB06Latug6PARrDnr8XcB/nzNNk+6FJjlw3FlIxlQ5B5FvGNYAW0Pmy8co0PKfOLdV9knyEHFtH8mCNi/PZ8zXt9sN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774078744; c=relaxed/simple;
	bh=iOqi7bZpErqvwVE6uo3o18qvKP22xD2IN7VU2U8qHu8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eFGd9dD6FM1VNjX9MDR27egZrcfPq2YnnjDL/JDtjp7rG6UsD4oPom76TKYI8E8QP81q42w6cO2qYadi9qw8Rn8J4KCshBVlaaEoRdoKM1aycVBrBHNFul+dAqrpqOojaKt56jp7vsbaoMrnWFTbv+rEcZsJeN681fQ4+s2IK4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gGhxqwp0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gGhxqwp0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774078744; x=1805614744;
  h=date:from:to:cc:subject:message-id;
  bh=iOqi7bZpErqvwVE6uo3o18qvKP22xD2IN7VU2U8qHu8=;
  b=gGhxqwp0puLPCLVD/qJqZcR2yG5lJDBj0B7QJn6z6jyKHA69Ux5RH4Wz
   sZu34fD2epaQ3LIzgSUxAy2T6+zlGf0ieV3aWyY8g6Ap6VWTxpDScPnKp
   mzgsqpfSpkxWUb1jS/3GI1HyMxnP01/2L7x947tti7wZC7Dt80cPtlVM3
   pP0fggFXDdO+f/Hy7oUc2AuP+l6pEw0V74WhRMeL+u8UqSc1a5WnhX3pk
   jCJcwrV43uP29Ib/KgXk4e7rVee4+wnWTX/w79P7pSuIyGLeoStVwJYwU
   IguMoFEkPvzEsm7yrgWd5VEgXOkQJat6KxcXt9eTE81vxRq26XVquZJgm
   A==;
X-CSE-ConnectionGUID: Cy0mgWH0SV2+9rpv0NG9CQ==
X-CSE-MsgGUID: ikejUDrCTc2Aj6XQopjM7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11735"; a="85858380"
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="85858380"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Mar 2026 00:39:03 -0700
X-CSE-ConnectionGUID: nMnDdcZET/SP13GMpVQHxQ==
X-CSE-MsgGUID: VqoRebl0RJKsDCQ13oE3hw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,132,1770624000"; 
   d="scan'208";a="225366584"
Received: from lkp-server02.sh.intel.com (HELO d7fefbca0d04) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Mar 2026 00:39:01 -0700
Received: from kbuild by d7fefbca0d04 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3qv1-000000000Rd-2z4O;
	Sat, 21 Mar 2026 07:38:50 +0000
Date: Sat, 21 Mar 2026 15:38:17 +0800
From: kernel test robot <lkp@intel.com>
To: Jens Axboe <axboe@kernel.dk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [axboe:rw_iter 38/539]
 drivers/char/xillybus/xillyusb.c:363:12: error: redefinition of
 'xilly_copy_from_iter'
Message-ID: <202603211558.mweI3RyU-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   f36e0fb8d552bd827ef31f4fc1190d0149c44249
commit: da97f6f63575baff63b739fafeff7f02ca236668 [38/539] char/xillybus: convert to read/write iterators
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20260321/202603211558.mweI3RyU-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260321/202603211558.mweI3RyU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603211558.mweI3RyU-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/char/xillybus/xillyusb.c:363:12: error: redefinition of 'xilly_copy_from_iter'
     363 | static int xilly_copy_from_iter(void *dst, const void *src, int n)
         |            ^~~~~~~~~~~~~~~~~~~~
   drivers/char/xillybus/xillyusb.c:347:12: note: previous definition of 'xilly_copy_from_iter' with type 'int(void *, const void *, int)'
     347 | static int xilly_copy_from_iter(void *dst, const void *src, int n)
         |            ^~~~~~~~~~~~~~~~~~~~
>> drivers/char/xillybus/xillyusb.c:371:12: error: redefinition of 'xilly_copy_to_iter'
     371 | static int xilly_copy_to_iter(void *dst, const void *src, int n)
         |            ^~~~~~~~~~~~~~~~~~
   drivers/char/xillybus/xillyusb.c:355:12: note: previous definition of 'xilly_copy_to_iter' with type 'int(void *, const void *, int)'
     355 | static int xilly_copy_to_iter(void *dst, const void *src, int n)
         |            ^~~~~~~~~~~~~~~~~~
   drivers/char/xillybus/xillyusb.c:355:12: warning: 'xilly_copy_to_iter' defined but not used [-Wunused-function]
   drivers/char/xillybus/xillyusb.c:347:12: warning: 'xilly_copy_from_iter' defined but not used [-Wunused-function]
     347 | static int xilly_copy_from_iter(void *dst, const void *src, int n)
         |            ^~~~~~~~~~~~~~~~~~~~


vim +/xilly_copy_from_iter +363 drivers/char/xillybus/xillyusb.c

   362	
 > 363	static int xilly_copy_from_iter(void *dst, const void *src, int n)
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
