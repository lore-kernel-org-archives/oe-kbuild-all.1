Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF1A264FBA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Apr 2025 21:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745442170; cv=none; b=ltNu/UJG4mhFZYeqYLrsY0aiUPPr32X6nWnRL4kP8wgUTJ47NFP7g3XLT4Ph+9dDs+BzDJFPGLJ7XAQKy3tpklprdeNC3NQ9Z1NkjebWHFQw6Ya7jNuQ3/VkXKH9R+b72rEo/F/7zS1uBYJTTAytexghQOSDF0k+p/iHHMx9ruQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745442170; c=relaxed/simple;
	bh=ZNnBN3X8l3e4k8cFUARWKKlBuP+iQfw9/drf85wJZxo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DCxThuTmtIc/9fGEYyCh1ZQ650zgEvng/2dtgFgMsi5nbc4hctv46e1F6x/tG5+tW+vyXbxN9QSqCNPL1jwlOslEHG3fhiEvE/M/habjxUuIpoIWjD69QyAAA12ERuTeVfi++4rW7Mb7XY5rbG19ldZtnGELTKU93YQT8nH/7Pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jy+f++Ht; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jy+f++Ht"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745442169; x=1776978169;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZNnBN3X8l3e4k8cFUARWKKlBuP+iQfw9/drf85wJZxo=;
  b=Jy+f++HtKKOjsPcReRwURTOuO5Y5D5I73uuJQqihH68hl7SnhWoVLJwD
   x7s+bs6J8hxXpQ9Gv84SZyOe+gWg7G1M8a2VKCKFNo4KuHwFtQuV/1q15
   7SlFzcq6gVYc84rb9frlcpNKIzuOI8BXWomBZ8f3ZYTTQ0QXmI1aHWw5g
   +qTiAdaTRSagugLEWE4LfN6OptQk3i4it7dT3ZulKxltjxS42yZLCjsR9
   ewk8masKtZpEKFVsYtTLuFgshA6Lx1FuLnzTkGYbAaBe/62LwLf/xnvR+
   4LHpEW+FGK7E6Sv052Tvba6m13wHphVASehzrzfd9VnyjDYtPLhcMe1un
   w==;
X-CSE-ConnectionGUID: W476bBbtSFCm4rk4VbGxYA==
X-CSE-MsgGUID: GRri1VmySdyPPFJjpw25jA==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="58427280"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="58427280"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 14:02:49 -0700
X-CSE-ConnectionGUID: H82fYLNmQyefsFUD84eHBw==
X-CSE-MsgGUID: O2RL1ibfTpWZBDTT2RujiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132167115"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Apr 2025 14:02:47 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7hEy-0003cx-2u;
	Wed, 23 Apr 2025 21:02:44 +0000
Date: Thu, 24 Apr 2025 05:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:sink 91/184] kernel/sched/wait.c:59:9: error: expected ','
 or ';' before 'if'
Message-ID: <202504240453.eNSsOvch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux sink
head:   c1ca89c57593906261007798ee8911b57cd71595
commit: e061a317245ac5e48ce480f26cb8bb1e431daa30 [91/184] sched/wait: Add a waitqueue helper for fully exclusive priority waiters
config: x86_64-buildonly-randconfig-003-20250424 (https://download.01.org/0day-ci/archive/20250424/202504240453.eNSsOvch-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240453.eNSsOvch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240453.eNSsOvch-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_utility.c:81:
   kernel/sched/wait.c: In function 'add_wait_queue_priority_exclusive':
>> kernel/sched/wait.c:59:9: error: expected ',' or ';' before 'if'
      59 |         if (!list_empty(head) &&
         |         ^~
   In file included from include/linux/list.h:5,
                    from include/linux/smp.h:12,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_utility.c:12:
>> include/linux/container_of.h:23:55: error: expected statement before ')' token
      23 |         ((type *)(__mptr - offsetof(type, member))); })
         |                                                       ^
   include/linux/list.h:601:9: note: in expansion of macro 'container_of'
     601 |         container_of(ptr, type, member)
         |         ^~~~~~~~~~~~
   include/linux/list.h:612:9: note: in expansion of macro 'list_entry'
     612 |         list_entry((ptr)->next, type, member)
         |         ^~~~~~~~~~
   kernel/sched/wait.c:60:14: note: in expansion of macro 'list_first_entry'
      60 |             (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
         |              ^~~~~~~~~~~~~~~~
>> kernel/sched/wait.c:60:62: error: expected expression before '->' token
      60 |             (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
         |                                                              ^~
>> kernel/sched/wait.c:60:88: error: expected statement before ')' token
      60 |             (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
         |                                                                                        ^
   kernel/sched/wait.c:60:89: error: expected statement before ')' token
      60 |             (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
         |                                                                                         ^


vim +59 kernel/sched/wait.c

    49	
    50	int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
    51					      struct wait_queue_entry *wq_entry)
    52	{
    53		struct list_head *head = &wq_head->head;
    54	
    55		wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
    56	
    57		guard(spinlock_irqsave)(&wq_head->lock)
    58	
  > 59		if (!list_empty(head) &&
  > 60		    (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
    61			return -EBUSY;
    62	
    63		list_add(&wq_entry->entry, head);
    64		return 0;
    65	}
    66	EXPORT_SYMBOL(add_wait_queue_priority_exclusive);
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
