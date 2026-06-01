Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34AF357CF3
	for <oe-kbuild-all@lists.linux.dev>; Mon,  1 Jun 2026 19:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780341665; cv=none; b=A8gg5Y5rHAoft/VhTQjHOt5h/tx/k7Q8+Obe659Fo1x1M53voK/d6wMTakeVsBpsA9F5HmR0pEytiNPqFPgfL8XhuMYgZWDYVgtn/1WXqSbVb+iKcebxelpWw+dkPGnbkXAwSYv/EnwxGPM9pA5+xIoDzZn/4QQF9IOvagoBf/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780341665; c=relaxed/simple;
	bh=pZM/A/sJdbmusg4rl5m0RiTwSehPGCzJVwZkF68DH0A=;
	h=Date:From:To:Cc:Subject:Message-ID; b=cxaTfVX6SUVeeje5sbbzHr0T3Wkc4CyTcysSxC10u2ATdldHdfVnBjq4Pv1gIK5JizzeSM6YUd+1C6D6NurjRvE1xR2QkzD7M4BDyDC4x+uNDnhMuqbfICwI+OCaDIlUGzIL1q2TkQGUPQwY1LjvaaLi1ht9biQF3WGZXeySw2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b3SO8XO1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b3SO8XO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780341664; x=1811877664;
  h=date:from:to:cc:subject:message-id;
  bh=pZM/A/sJdbmusg4rl5m0RiTwSehPGCzJVwZkF68DH0A=;
  b=b3SO8XO1FZSRoU9XMte6yW9yrZcwKA/iX4mysPANt295dXR8vxRn6l7q
   ZXCohLddzi/fzRoqjCgLuXm4WD/S96sS16qGCJ59sUTSwhDnK8bkh9i/e
   U0zVKN6IWxwQWcDyfy0uuKzKN8dtlipihQWjS1vBYWpybddLbIsUzWQoQ
   7WClLUqKZlWGHFvdckvPYQT1NGHn4Sags917Ufx8ryJO+lUDd4xYgSx/n
   /YifisF/oXIbHSHOv6Ii092OdjEsDwcGUyIUXptvoiKS8L1zuVoCra4s5
   Ttk6S1XG/Ui0SoeBPYtbH8eb6TvidIYFq6O3cGQKGillTPL+qoLPHZwfH
   Q==;
X-CSE-ConnectionGUID: zteIKJEQRR6WroHIUg5M+g==
X-CSE-MsgGUID: jiAd25uPT8W3ugSwUkeXiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81083307"
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="81083307"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 12:21:01 -0700
X-CSE-ConnectionGUID: lzjFIHGdTbmmfza9Id35JQ==
X-CSE-MsgGUID: kDs/Ztq4RGeN8j5nY6fXmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,181,1774335600"; 
   d="scan'208";a="273943773"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 01 Jun 2026 12:21:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wU8C1-00000000Aze-30Jj;
	Mon, 01 Jun 2026 19:20:57 +0000
Date: Tue, 02 Jun 2026 03:20:20 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 4036/9870] Warning: lib/rhashtable.c:1030
 expecting prototype for rhashtable_init(). Prototype was for
 __rhashtable_init() instead
Message-ID: <202606020301.Un7nzzO0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 060d4e94b8d400b62453890821bd7feecd4cde2c [4036/9870] rhashtable: give each instance its own lockdep class
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20260602/202606020301.Un7nzzO0-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260602/202606020301.Un7nzzO0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606020301.Un7nzzO0-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: lib/rhashtable.c:1030 function parameter 'key' not described in '__rhashtable_init'
>> Warning: lib/rhashtable.c:1030 expecting prototype for rhashtable_init(). Prototype was for __rhashtable_init() instead
   Warning: lib/rhashtable.c:1104 function parameter 'key' not described in '__rhltable_init'
   Warning: lib/rhashtable.c:1104 expecting prototype for rhltable_init(). Prototype was for __rhltable_init() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
