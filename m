Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED74F3BE643
	for <oe-kbuild-all@lists.linux.dev>; Fri, 22 May 2026 09:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779441409; cv=none; b=JdO/gZvDw23Q1ZFmiUcBlydGsHY3/A1v6mfL4CjwsQLDq5smKXSMghArtbraVVrRZDb1qyAn7AQyxKv9CZME/6rhI2mWM6Akaetcqp9+2k1gRHVmvAlH97e8MhqHS46pwbv0QGSUejjJeT14zRqx7fIn3xJ8+a+4jpn5aH8Bjl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779441409; c=relaxed/simple;
	bh=1gSaf25/Zct+6LsAPBjydCpGljDmBRI4RTP4wYbXLC8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GrptyIQEUrMoQSO1/np9lZ9TRrfj4yJklJ5ZKfufG21XYPs3iNE8kUHAQ5M941cSivUAOjYjHwovl3Eymso6qr/QvwL0CFSZAz5a1vMZAhfk0uMGZxN1wNTyBF1hrX/Uvrs854f8F18O9lgqfI7guI+8GtbkAdiBNILwx+0VZ/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MK+YYzx3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MK+YYzx3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779441407; x=1810977407;
  h=date:from:to:cc:subject:message-id;
  bh=1gSaf25/Zct+6LsAPBjydCpGljDmBRI4RTP4wYbXLC8=;
  b=MK+YYzx3s0Cy0C6lS7yAsdu1A03tirbcXX/JWkG2dshbsb/XqxK/w6bw
   lCfe2KNBmkMdTfaJK+sgY0Orl2znkrtzMfmT6UFzTh0sJUIjccpSsQg2b
   eiTpV2mSKGGdfBLHsKPNF3gkAHC/42Z9D1rElIzAW+tL9l6aL9maOGg11
   Aqn9YbYP/+XoRCMEdZu6dJIgBKvqSGsVr6oYtZHFuVs+OEdW7amEyrjvY
   62caEXhYO8rYpfUzqrPZLRwOi77NyrK4OQ4AksmRksAxtCgIQ5tymejet
   4bY+xwmWfrNLAJaaBGtsu15KuhkhjkCsbufTkHel5+Jensj4jQQZVW4Bp
   g==;
X-CSE-ConnectionGUID: HNpBkuUcQl+geyeTZiS5Eg==
X-CSE-MsgGUID: ivo/8FF5S+SlHGde3MfJUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11793"; a="80270940"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80270940"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 02:16:44 -0700
X-CSE-ConnectionGUID: tz8byy8yQG6gQV7xr5KhSg==
X-CSE-MsgGUID: OkP+jqnwR+uDnbhcte3PRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="240737974"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 22 May 2026 02:16:44 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQLzk-0000000026n-2kOY;
	Fri, 22 May 2026 09:16:40 +0000
Date: Fri, 22 May 2026 17:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 551/1197]
 arch/arm64/kernel/stacktrace.c:509:1: warning: 'annotate' attribute directive
 ignored
Message-ID: <202605221747.M5AdA2es-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: 0477c54f6820c4333d2c5853d92ade41dcef36ae [551/1197] cheri: Fix ARM compile after rebase to v6.15
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20260522/202605221747.M5AdA2es-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605221747.M5AdA2es-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605221747.M5AdA2es-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs/super_types.h:13,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/proc_fs.h:10,
                    from include/linux/efi.h:19,
                    from arch/arm64/kernel/stacktrace.c:8:
   include/linux/uaccess.h:1078:9: warning: 'get_user_ptr' redefined
    1078 | #define get_user_ptr(x,y) __get_user(x,y)
         |         ^~~~~~~~~~~~
   In file included from include/linux/uaccess.h:13:
   arch/arm64/include/asm/uaccess.h:470:9: note: this is the location of the previous definition
     470 | #define get_user_ptr    __get_user_ptr
         |         ^~~~~~~~~~~~
   include/linux/uaccess.h:1079:9: warning: 'put_user_ptr' redefined
    1079 | #define put_user_ptr(x,y) __put_user(x,y)
         |         ^~~~~~~~~~~~
   arch/arm64/include/asm/uaccess.h:479:9: note: this is the location of the previous definition
     479 | #define put_user_ptr    __put_user_ptr
         |         ^~~~~~~~~~~~
>> arch/arm64/kernel/stacktrace.c:509:1: warning: 'annotate' attribute directive ignored [-Wattributes]
     509 | } __attribute__((packed)) __attribute__((annotate("underaligned_capability")));
         | ^


vim +/annotate +509 arch/arm64/kernel/stacktrace.c

   502	
   503	/*
   504	 * The struct defined for userspace stack frame in AARCH64 mode.
   505	 */
   506	struct frame_tail {
   507		struct frame_tail	__user *fp;
   508		unsigned long		lr;
 > 509	} __attribute__((packed)) __attribute__((annotate("underaligned_capability")));
   510	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
