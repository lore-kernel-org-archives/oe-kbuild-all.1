Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734A31D47BF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Sep 2024 11:06:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726225616; cv=none; b=CH88Dp62etR3kAKdJ8DasmFSpZBuSu107aPFzHNxnB6Jbgnkg1CxqTAW+pKnnCibXEUrw41ckBBudbkLQ9HJBhXASSS4cXVXcU4L0yoLsctjN2HQJR65dTVLG1E6pX382U4cufHjBwrdQg1SxZ1qwM61ujok6tmj7hNvUgOh7VI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726225616; c=relaxed/simple;
	bh=aSSs9FiXhFxkUZmjx20tsZCH6JjjL/T4ceHZnibJqMo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NSy0d6QJi4qtFkTthNdBEUWfNcfavyDLdZH6NyCO/IJrkLy3DA1/G6wTIhf6FMQ1nx2oyX1y72gs2O75z+QyhiDUXBbSKBxBU3bRoC2lXGuMjBrf/TplLI+rwlSVmYs2DC0M9T1hwIcYKc04tQgTMZlBWQcFsBrCQh3FVvMM6xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YbjADHeO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YbjADHeO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726225615; x=1757761615;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aSSs9FiXhFxkUZmjx20tsZCH6JjjL/T4ceHZnibJqMo=;
  b=YbjADHeOWThCkUO0SiL0rhe2FUkfkrhMS93cWtLwzQa7S/yAE7ZtbhQI
   cNjqDSnKIm5m8TDUFh8UYXGfzf4wVxEgfxHawRh1H/OX+Pp7Fg3t9AEpr
   aC6Rugv5qDWSIQaBLyzlbCwA3LbSlTeX60eFGpgnGz0FS0lVu9wW3Rrr1
   byYwRmiDiAC5YZEFpVAqTaxvJIJW0xIEbKFGIWJ6rbIlERZL+V9bTcpvR
   wNs042GeI8rxbRSo6OdjvbWzMOnnnQ9+JCYePCHigHehZk5IWWQPSkPbi
   C3naDNPsSTFqHO53aJXoFZdtN7Grz3MjvluDtri6Z0GjcF3IxTjSpw8Gd
   Q==;
X-CSE-ConnectionGUID: 77R7n/VEROCBLlSrYlpGXA==
X-CSE-MsgGUID: 4tJQE3ZYTACy7njvoY55Sw==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="35694699"
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="35694699"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 04:06:54 -0700
X-CSE-ConnectionGUID: pGK2osuhR66j0/34sNptOQ==
X-CSE-MsgGUID: M0ZwxQe8Tq+augECB7fKJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,225,1719903600"; 
   d="scan'208";a="67869498"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Sep 2024 04:06:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sp48Y-0006RC-2C;
	Fri, 13 Sep 2024 11:06:50 +0000
Date: Fri, 13 Sep 2024 19:06:10 +0800
From: kernel test robot <lkp@intel.com>
To: Anna-Maria Behnsen <anna-maria@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anna-maria-devel:timers/misc 6/15]
 include/asm-generic/delay.h:21:49: error: implicit declaration of function
 'DIV_ROUND_UP'
Message-ID: <202409131913.5HjH48Ru-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/anna-maria/linux-devel.git timers/misc
head:   d8b99542c586f757608f98bb341fb75cbf96619d
commit: c774df411d1da02f75334976241deb88f8b9e256 [6/15] delay: Rework udelay and ndelay
config: i386-buildonly-randconfig-003-20240913 (https://download.01.org/0day-ci/archive/20240913/202409131913.5HjH48Ru-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240913/202409131913.5HjH48Ru-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409131913.5HjH48Ru-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/delay.h:5,
                    from arch/x86/kernel/reboot_fixups_32.c:11:
   include/asm-generic/delay.h: In function 'udelay':
>> include/asm-generic/delay.h:21:49: error: implicit declaration of function 'DIV_ROUND_UP' [-Werror=implicit-function-declaration]
      21 | #define UDELAY_CONST_MULT       ((unsigned long)DIV_ROUND_UP(1ULL << 32, USEC_PER_SEC))
         |                                                 ^~~~~~~~~~~~
   include/asm-generic/delay.h:61:47: note: in expansion of macro 'UDELAY_CONST_MULT'
      61 |                         __const_udelay(usec * UDELAY_CONST_MULT);
         |                                               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/DIV_ROUND_UP +21 include/asm-generic/delay.h

    15	
    16	/*
    17	 * The microseconds/nanosecond delay multiplicators are used to convert a
    18	 * constant microseconds/nanoseconds value to a value which can be used by the
    19	 * architectures specific implementation to transform it into loops.
    20	 */
  > 21	#define UDELAY_CONST_MULT	((unsigned long)DIV_ROUND_UP(1ULL << 32, USEC_PER_SEC))
    22	#define NDELAY_CONST_MULT	((unsigned long)DIV_ROUND_UP(1ULL << 32, NSEC_PER_SEC))
    23	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
