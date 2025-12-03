Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B9C257435
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Dec 2025 03:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764732794; cv=none; b=HGVKS5jnm45IjEztCh8b6mEI1yM8aX2kuWkWcIMVSCqnykXrWGFW+eVek9KqJsGgzWEesKjCyxacpkb7avgoyC0bTW2fEayHgTpOTIZu2Un6IN9AcwZ2LRB1RN9N5PON8Xjs/wnYzqnw3QI3aCbi5WsnEpklDPvzI384tyL9vqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764732794; c=relaxed/simple;
	bh=ctlbi4cN7KtKwVEGaDT3AnPy7qmffmRBZ3jkqumTcqs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X4i8cDFihEwc+WYEfQWV4ikIJL0KYb3eNktu96ymeIbeBDQ5IIOqvbEvPcYwAJfbZF76Zx9jgaSnDb0eXrW8p8kXIqanmIt+5fQvjOHkuBgHisB75Kn4UYGItunR+tdtw+uIOh0qeqyeTArQIGW0Clf6aehCkSG765uVoCKqWMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FIJZm8Qh; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FIJZm8Qh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764732793; x=1796268793;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ctlbi4cN7KtKwVEGaDT3AnPy7qmffmRBZ3jkqumTcqs=;
  b=FIJZm8QhtzT6TDMAWC8dG3ApSo2n6suK95yX0yjnTnZUxCrroMGf9cHh
   q3SUBH6YVd7zGpoV5kt1rokK43fcyVtRemi3m3XtDXk1XiRq/SVj02CsV
   HAJNjd04AvNe3qwDUKdNmGz0jECgW3tuSU1SdcRlE1ijalGQ4xnqvDhs+
   70sgTEB6WNVkdhqR9zQzNUWea/2DbVp2QqVJg+iQ9ewMn0lTQWdY+p9ef
   +WsE+jAV4sN/HtKDM7xNb4cf6a6+SoAlOFGLmuDmL4qd7YNVfHUPkEfLV
   QjXfiykX84MNc3S5516KlYoO+J29+rhhlts6jOvUGngdwghmKrtLxLADS
   A==;
X-CSE-ConnectionGUID: VNwRxSv2T0G/SLgBu+ydjg==
X-CSE-MsgGUID: dTm3TIWtSTy+V/QZRbwNng==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="70575446"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="70575446"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2025 19:33:11 -0800
X-CSE-ConnectionGUID: MQXcXllZQg+eU06FdVlcuw==
X-CSE-MsgGUID: QjefpB4NQca5CbNN9QYosQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; 
   d="scan'208";a="194554549"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 02 Dec 2025 19:33:09 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQdc3-00000000AVp-0rPN;
	Wed, 03 Dec 2025 03:33:07 +0000
Date: Wed, 3 Dec 2025 11:33:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/memcg_zombie_reaper.c:47:6:
 warning: no previous prototype for function 'memcg_reap_background_set'
Message-ID: <202512031134.U3l4MiL7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Xu,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   495c6b49736046cad5a06a343ca0be2750aed6fe
commit: 33bbe281782b11cc34512292d2957e86a0b2cc21 [2/2] ck: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251203/202512031134.U3l4MiL7-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251203/202512031134.U3l4MiL7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512031134.U3l4MiL7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for function 'memcg_reap_background_set' [-Wmissing-prototypes]
      47 | void memcg_reap_background_set(void)
         |      ^
   mm/memcg_zombie_reaper.c:47:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      47 | void memcg_reap_background_set(void)
         | ^
         | static 
>> mm/memcg_zombie_reaper.c:53:6: warning: no previous prototype for function 'memcg_reap_background_clear' [-Wmissing-prototypes]
      53 | void memcg_reap_background_clear(void)
         |      ^
   mm/memcg_zombie_reaper.c:53:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      53 | void memcg_reap_background_clear(void)
         | ^
         | static 
   2 warnings generated.


vim +/memcg_reap_background_set +47 mm/memcg_zombie_reaper.c

    46	
  > 47	void memcg_reap_background_set(void)
    48	{
    49		reaper_kthread_on |= REAP_BACKGROUND_MEMCG;
    50		wake_up_interruptible(&reaper_waitq);
    51	}
    52	
  > 53	void memcg_reap_background_clear(void)
    54	{
    55		reaper_kthread_on &= ~REAP_BACKGROUND_MEMCG;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
