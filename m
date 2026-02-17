Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE84E32AAA2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 10:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771325679; cv=none; b=ib3ETux5a13ae5gbm+pvD4NNklI91yMk0X90OvsetHz49d839hYef5g/Z3RyZQ1A7Lakw8OOsbegZgbpVsPPzhxiA6dQGjRYgkTbsSsNqMhz8ILxdyRfbVzDa9geA89eE3qDRmMiFskhlU9Z1SVqYVcKwLykYCyWZEd/24cl9pw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771325679; c=relaxed/simple;
	bh=AN0pNKuF0TjEMTwSTR369ePHwAk4SpL38L3QX3I1oxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=J0Pmi622+BnOHbjT7zNkjVjbFaSJ9iNwF5rKLPID4xjjTffzTAQ8RDFMk+AyDq+DyiH6k6PIjUs/0OiDA/wBzAVA0+a1O+cDr6nDvHY4efrFHh8vjnMsYk/RzcSK0P7vs0MMkZKlydD1vghdnAeeot7qzgTdjbtBLs/cVRU9qS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fVbufH8m; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fVbufH8m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771325678; x=1802861678;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AN0pNKuF0TjEMTwSTR369ePHwAk4SpL38L3QX3I1oxI=;
  b=fVbufH8mR+3NSWE5fd8BmG2HGPJVi4ywxDI+fcveIFgSo7/88nN6T7gE
   RXgX5XPhUHPnBGW3vaNMm8l+PZck9I9k3XhLgDj1amhzCGP0XAM4xhvjX
   JsofPzTO2gfKx0d9D42xmYmJmdSwu4yUi/aVWfK/7i99zpiOapJAUzaz7
   ueP11W6xRpueegN58wvWfm2+Jr7+wX8xuLHPyQg5iKWuHhKY61ClwsDMu
   pWQIozvLlF4maukeZvsS35ZmDst1TUI9/4ZamkpxGpcDYhIc9m+95vCNY
   ox6JeQjgEWfEq431LTtjAJr5cWpuBHi0nQL2Cu8wbUVHLder1e6vHYmnm
   Q==;
X-CSE-ConnectionGUID: 4EpCIXlsRj6wWURQ+WVddQ==
X-CSE-MsgGUID: BxEtJWhwRLKWHAfbdQ/3xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="72457887"
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="72457887"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2026 02:54:37 -0800
X-CSE-ConnectionGUID: nAXv3qHcT62q1Y0Uvyg+nw==
X-CSE-MsgGUID: PhL8B+CTRgyZ1dqpZgkwww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,296,1763452800"; 
   d="scan'208";a="217986753"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 17 Feb 2026 02:54:36 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vsIiv-000000010rk-1wof;
	Tue, 17 Feb 2026 10:54:33 +0000
Date: Tue, 17 Feb 2026 18:54:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-compat-checkflags 7/7]
 include/asm-generic/bitsperlong.h:23:2: error: #error Inconsistent word size.
 Check uapi/asm/bitsperlong.h
Message-ID: <202602171813.xxkYfaIG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-compat-checkflags
head:   1a699db03cf3a438a7938cc4a050648238e93394
commit: 1a699db03cf3a438a7938cc4a050648238e93394 [7/7] asm-generic/bitsperlong.h: Add sanity checks for __BITS_PER_LONG
config: s390-randconfig-r063-20260217 (https://download.01.org/0day-ci/archive/20260217/202602171813.xxkYfaIG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260217/202602171813.xxkYfaIG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602171813.xxkYfaIG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/s390/include/uapi/asm/bitsperlong.h:7,
                    from include/uapi/asm-generic/int-ll64.h:12,
                    from include/asm-generic/int-ll64.h:11,
                    from arch/s390/include/uapi/asm/types.h:11,
                    from arch/s390/include/asm/types.h:6,
                    from include/uapi/linux/types.h:5,
                    from include/linux/types.h:5,
                    from arch/s390/include/asm/sclp.h:9,
                    from arch/s390/boot/vmlinux.lds.S:6:
>> include/asm-generic/bitsperlong.h:23:2: error: #error Inconsistent word size. Check uapi/asm/bitsperlong.h
    #error Inconsistent word size. Check uapi/asm/bitsperlong.h
     ^~~~~


vim +23 include/asm-generic/bitsperlong.h

    21	
    22	#if __BITS_PER_LONG != __CHAR_BIT__ * __SIZEOF_LONG__
  > 23	#error Inconsistent word size. Check uapi/asm/bitsperlong.h
    24	#endif
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
