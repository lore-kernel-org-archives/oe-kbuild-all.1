Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810E81EA74
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Apr 2024 08:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712652420; cv=none; b=pICJIyA4GvxRNEiR4aB9asKyTXwLYw3YVu1tTuzcvSN6u1dAbZ2sbGZ2g5HskJUWuMphtNB4abokJETuDQj3wU/4GA222YV3HyAjNpj9YhgSxKnylKY4Tne7l738l+Cb2OINTU6TamgxHLb+iEVhw+PlDvweTtYCL0inWh2i0sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712652420; c=relaxed/simple;
	bh=QWvNW1xGW5tZXGufRZZ6+uq0xtdGGqeZyhxPn2QEJ8c=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AgGfoMvhZ7IM5ytojgqaDT/X6kmQbKRh/wD4NFzlC3HI8B6+mLiLzypjjs7pl1e1PpJvohdxkHJpKfJs0UWL8lPC/uvqrTTfsDqtXA8r5zF7W/az+zl9z/EBUAjvGFVpfSQ94sKQ5yRPqhwCBY1SOsLyB19sr4zyIe0nasEK/Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gR3xhJc3; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gR3xhJc3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712652419; x=1744188419;
  h=date:from:cc:subject:message-id:mime-version;
  bh=QWvNW1xGW5tZXGufRZZ6+uq0xtdGGqeZyhxPn2QEJ8c=;
  b=gR3xhJc38hguHWNxsGn2wpI+Y/oRcc3s4C06LOOeuBXYUYr9QVwuOSA1
   tDZ3Hko1LtogXQQiajrhcNiqSs2a5Tik3ON6VhsR2acDqzAUPHAqMEvFu
   7OHISUGiPBczOA8bSz9q2c/vudYStHoBV+I+GQfgaCv2kx4oVG2jZRhBU
   lWuWg7PiK4AV8e5OICQwxsBhIA1pe49vJarDlTjIRybKxxCVSkR3TL0Im
   U+UPCQSO4gefYe9SWSXNylG8lFgAWPbIBu3fPejhVhMF8iH+kGXzkMuOX
   gF5mtj/vOmi3QgvlUhGyt1rHp0pb6j50bPpQBaghz9jrcky2ADDtWSrjg
   Q==;
X-CSE-ConnectionGUID: z8AvZaHvQlOoeeZBrIAmQg==
X-CSE-MsgGUID: FQ88+YH0RKmGM7FV04Of4A==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="33362903"
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="33362903"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Apr 2024 01:46:58 -0700
X-CSE-ConnectionGUID: gTZLTqmxS9e/u2hMkGhyTw==
X-CSE-MsgGUID: A/rgjDH8Qnevky3ahkAfIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,189,1708416000"; 
   d="scan'208";a="20234497"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Apr 2024 01:46:57 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ru782-0005vW-2s
	for oe-kbuild-all@lists.linux.dev;
	Tue, 09 Apr 2024 08:46:54 +0000
Date: Tue, 9 Apr 2024 16:46:14 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:4.19/android_s 1/2] lib/usercopy.c:64:9: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202404091648.NSToEhRO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common 4.19/android_s
head:   71b63f21a8292ca960a4c363d69d5e95c0265597
commit: 6a1e36af9d0e008f78f324581e5f1cb5c4393aee [1/2] BACKPORT: lib: introduce copy_struct_from_user() helper
config: m68k-randconfig-r123-20240406 (https://download.01.org/0day-ci/archive/20240409/202404091648.NSToEhRO-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240409/202404091648.NSToEhRO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404091648.NSToEhRO-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/usercopy.c:64:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const *__gu_ptr @@     got unsigned long [noderef] <asn:1> * @@
   lib/usercopy.c:64:9: sparse:     expected void const *__gu_ptr
   lib/usercopy.c:64:9: sparse:     got unsigned long [noderef] <asn:1> *
   lib/usercopy.c:75:17: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const *__gu_ptr @@     got unsigned long [noderef] <asn:1> * @@
   lib/usercopy.c:75:17: sparse:     expected void const *__gu_ptr
   lib/usercopy.c:75:17: sparse:     got unsigned long [noderef] <asn:1> *

vim +64 lib/usercopy.c

    35	
    36	/**
    37	 * check_zeroed_user: check if a userspace buffer only contains zero bytes
    38	 * @from: Source address, in userspace.
    39	 * @size: Size of buffer.
    40	 *
    41	 * This is effectively shorthand for "memchr_inv(from, 0, size) == NULL" for
    42	 * userspace addresses (and is more efficient because we don't care where the
    43	 * first non-zero byte is).
    44	 *
    45	 * Returns:
    46	 *  * 0: There were non-zero bytes present in the buffer.
    47	 *  * 1: The buffer was full of zero bytes.
    48	 *  * -EFAULT: access to userspace failed.
    49	 */
    50	int check_zeroed_user(const void __user *from, size_t size)
    51	{
    52		unsigned long val;
    53		uintptr_t align = (uintptr_t) from % sizeof(unsigned long);
    54	
    55		if (unlikely(size == 0))
    56			return 1;
    57	
    58		from -= align;
    59		size += align;
    60	
    61		if (!user_access_begin(VERIFY_READ, from, size))
    62			return -EFAULT;
    63	
  > 64		unsafe_get_user(val, (unsigned long __user *) from, err_fault);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
