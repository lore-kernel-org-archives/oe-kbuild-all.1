Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625301C862F
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 10:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740307760; cv=none; b=aNvc+wlW+Scttizm6wiVKDEjXxj+LguKfCHIizd6Nw2B+AtE4BR36H86EkRHQz+yqxslkM2tJQ1xtO0h95zPrZxfJ0jWwVYd0OYVJNdaa3aDf8XxEyqlqC6YgIBIionQTqUBuD0BnDE19xz8hXOntBkb0+LpaF3/opYEjQjWsBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740307760; c=relaxed/simple;
	bh=3tR9cX0+X43EEyA7g9AkK/UIGG5oKAaJKpYgRmAHrjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UvD+WIaBg7Md5piL/ovEco9XKwgXVA4Yn8mVrKEVMLj6rRtYu8eRHgWkWFu6JRQlImLyRMXHJjUJuiF7ImwWX0scPjjI9HiPkPTLKMD6gD/bMWSAZV01p/eRXyRDqJXCdcwA9z8VZcLp4ExcTGXPyTCMOfg0rg2nuhavF6VTOt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EU/QUJ9b; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EU/QUJ9b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740307758; x=1771843758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3tR9cX0+X43EEyA7g9AkK/UIGG5oKAaJKpYgRmAHrjs=;
  b=EU/QUJ9bko4//CFmvjldFbTs2YSDPLNIUsALxM7OME5xUV4vhyiZbknb
   af8eM9N9uegGFQ+nhPmZxMso9wq0YoJrAQ/6ZKpqzEvsLxy4jSMLEbK2B
   ShDuHr6Wm7eADIpTVZQAh/e32jMAEc+4gufGNEcYsAt84+4j7KHoFh0xs
   DESHjwTYzIj74BzBPtewMwMOLZQjIl3KFRjGr6zNdwOpmQ8qGKmmsZNVG
   LXGGqZLe0WL5CRaKEF0iGBN+vVIsBVG2U9rLHWTqTQGMNYwWflZKLOiBT
   GuV6knP+4AqBKQ8gZ4UA+NgPijsX0vloveTI7i4hg3Uhq1QBBwYrb3t51
   A==;
X-CSE-ConnectionGUID: zyjtOxAUT4WICat2IPBytA==
X-CSE-MsgGUID: aX4PXYQ5R8uUUabnImnakg==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="28672652"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="28672652"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 02:49:14 -0800
X-CSE-ConnectionGUID: RJoLh2i6Qju8wNUN4JPDZw==
X-CSE-MsgGUID: Y+88IM8MS86rF5cbwmuj4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="115987703"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 23 Feb 2025 02:49:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm9Xr-0007HL-1i;
	Sun, 23 Feb 2025 10:49:11 +0000
Date: Sun, 23 Feb 2025 18:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: Brian Gerst <brgerst@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 02/11] x86/preempt: Move preempt count to percpu hot
 section
Message-ID: <202502231853.Kren3HuC-lkp@intel.com>
References: <20250222190623.262689-3-brgerst@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222190623.262689-3-brgerst@gmail.com>

Hi Brian,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 01157ddc58dc2fe428ec17dd5a18cc13f134639f]

url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Gerst/percpu-Introduce-percpu-hot-section/20250223-031046
base:   01157ddc58dc2fe428ec17dd5a18cc13f134639f
patch link:    https://lore.kernel.org/r/20250222190623.262689-3-brgerst%40gmail.com
patch subject: [RFC PATCH 02/11] x86/preempt: Move preempt count to percpu hot section
config: x86_64-buildonly-randconfig-003-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231853.Kren3HuC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231853.Kren3HuC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231853.Kren3HuC-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from kernel/sched/core.c:10:
   include/linux/preempt.h:340:34: warning: 'struct task_struct' declared inside parameter list will not be visible outside of this definition or declaration
     340 |                           struct task_struct *next);
         |                                  ^~~~~~~~~~~
   kernel/sched/core.c: In function '__fire_sched_out_preempt_notifiers':
>> kernel/sched/core.c:4958:52: error: passing argument 2 of 'notifier->ops->sched_out' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4958 |                 notifier->ops->sched_out(notifier, next);
         |                                                    ^~~~
         |                                                    |
         |                                                    struct task_struct *
   kernel/sched/core.c:4958:52: note: expected 'struct task_struct *' but argument is of type 'struct task_struct *'
   cc1: some warnings being treated as errors


vim +4958 kernel/sched/core.c

1cde2930e15473c kernel/sched/core.c Peter Zijlstra 2015-06-08  4950  
e107be36efb2a23 kernel/sched.c      Avi Kivity     2007-07-26  4951  static void
1cde2930e15473c kernel/sched/core.c Peter Zijlstra 2015-06-08  4952  __fire_sched_out_preempt_notifiers(struct task_struct *curr,
e107be36efb2a23 kernel/sched.c      Avi Kivity     2007-07-26  4953  				   struct task_struct *next)
e107be36efb2a23 kernel/sched.c      Avi Kivity     2007-07-26  4954  {
e107be36efb2a23 kernel/sched.c      Avi Kivity     2007-07-26  4955  	struct preempt_notifier *notifier;
e107be36efb2a23 kernel/sched.c      Avi Kivity     2007-07-26  4956  
b67bfe0d42cac56 kernel/sched/core.c Sasha Levin    2013-02-27  4957  	hlist_for_each_entry(notifier, &curr->preempt_notifiers, link)
e107be36efb2a23 kernel/sched.c      Avi Kivity     2007-07-26 @4958  		notifier->ops->sched_out(notifier, next);
e107be36efb2a23 kernel/sched.c      Avi Kivity     2007-07-26  4959  }
e107be36efb2a23 kernel/sched.c      Avi Kivity     2007-07-26  4960  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
