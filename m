Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46306A8B6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Feb 2024 22:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707343280; cv=none; b=Qjvehta4Msax22nGoLkl6maYO6tTDGRRudWquX5YrwBIuwA9+Vpd/pJ5gv3cVB2SC0JBEZzax4H5IFP3Iv1hJ+50DzIm7XWSu6DMPCyWLIhFwAyDUvNVBlU2zrz656cCW34u93IYivtwAxQtaz33R/KR56B5fmEnqr1L1gEl048=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707343280; c=relaxed/simple;
	bh=wV4USB061/8cvVO3Kr7r3y7D6k0uLUDBPQn8tgwumiE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EUQP3FSlnrVuTJ/6/9MaOV7Grimnum5X+3c99t/2YUEMyj2D60lYDrc1fMn43yVMMsBhzSsQ11XPn23YEC9+fP44yqkpJEkIT1l9EShwV31jRP+r1ni12kNK9z+aqDqHxwDtfSIVYnAy7XTPNK9pyENPWrMZnNWYeD9cNTdsn2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W0q3nCSP; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W0q3nCSP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707343278; x=1738879278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wV4USB061/8cvVO3Kr7r3y7D6k0uLUDBPQn8tgwumiE=;
  b=W0q3nCSP4oZeiRQSPp0fF3sAIQw6pjoBKejMP0CO9tpWarxyVg1InV8d
   4XS7GK5F78i/p0Iqa79haC3dtY+lQ93OsMpE3N/6/L6LuEYVNNtdGZ1GA
   Pc4nL+blvTffBHRxVtTuCa41XsGfCmMZpYdgc2DXwRdEUnz+ry2I9nHzT
   27YdaUblJqcuN+KFYsO2Flv4MUzaM+HBHAFhUHlzH9eImfei922V6ToL/
   /UzVbuQqV4hb1OVewL/mK2To7fNv9MeikexSHovQBotGuLpECcHXtafZV
   MdJw37pyrZYBr/UB9Rjaqy2mbnnmYBbsfDsgCU3LuuA0prCPnZCxQh09R
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="1236299"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="1236299"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2024 14:01:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="910123760"
X-IronPort-AV: E=Sophos;i="6.05,251,1701158400"; 
   d="scan'208";a="910123760"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2024 14:01:15 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rXpyi-00034u-2G;
	Wed, 07 Feb 2024 22:01:12 +0000
Date: Thu, 8 Feb 2024 06:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <keescook@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Marco Elver <elver@google.com>
Subject: [linux-next:master 4186/4898] debug.c:undefined reference to
 `__ubsan_handle_divrem_overflow'
Message-ID: <202402080538.FNTaeLJO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2ae0a045e6814c8c1d676d6153c605a65746aa29
commit: 5084a4cd510f887a4fcc9f3386de1fbea698c7c4 [4186/4898] ubsan: reintroduce signed overflow sanitizer
config: s390-randconfig-r063-20240207 (https://download.01.org/0day-ci/archive/20240208/202402080538.FNTaeLJO-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240208/202402080538.FNTaeLJO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402080538.FNTaeLJO-lkp@intel.com/

Note: the linux-next/master HEAD 2ae0a045e6814c8c1d676d6153c605a65746aa29 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   s390-linux-ld: arch/s390/kernel/debug.o: in function `debug_output':
>> debug.c:(.text+0x17ea): undefined reference to `__ubsan_handle_divrem_overflow'
   s390-linux-ld: arch/s390/kernel/debug.o: in function `debug_event_common':
   debug.c:(.text+0x213a): undefined reference to `__ubsan_handle_divrem_overflow'
   s390-linux-ld: arch/s390/kernel/debug.o: in function `debug_exception_common':
   debug.c:(.text+0x2760): undefined reference to `__ubsan_handle_divrem_overflow'
>> s390-linux-ld: debug.c:(.text+0x2812): undefined reference to `__ubsan_handle_divrem_overflow'
   s390-linux-ld: arch/s390/kernel/debug.o: in function `debug_events_append':
   debug.c:(.text+0x2d18): undefined reference to `__ubsan_handle_divrem_overflow'
   s390-linux-ld: arch/s390/kernel/debug.o:debug.c:(.text+0x2e94): more undefined references to `__ubsan_handle_divrem_overflow' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
