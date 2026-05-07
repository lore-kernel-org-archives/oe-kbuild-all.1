Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85DFA2E2850
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 14:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778164261; cv=none; b=qkVm4m8esuXjoudS7UIMX+zqCy8C8wZkt6gy68635PC2SHt36vnr+9yrt87qZHuxtr726Z8thxbDsRfuiooB9m1JV/eTXY9FPOX5fqPB4xsTaoFLMX71qXDEzZGvfq4ieBilbCLmAQMnyHwGyYVB+eMFP6EgryFsUTOedHsfCyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778164261; c=relaxed/simple;
	bh=bccvo9vMYXGP6rTN9EEQjbkgdHL/rHEu/I0Bj+92x+Q=;
	h=Date:From:To:Cc:Subject:Message-ID; b=jO+F5/AmCFNt1mVFUc9Ir7K99q5BciUl7fHiOt6dWsi3waIwhFAXoGDd6UG0STaHNURZ23cLeJqMT6fmQLvJlwuTxBBqiy63ZSsQdxfvBULfsRVLBFA/6bxdRxv2392Qld8fOD0ak1o1t+9Cfd8n3TOj15INRk+RWUzZvskZZEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OS17/SfG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OS17/SfG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778164260; x=1809700260;
  h=date:from:to:cc:subject:message-id;
  bh=bccvo9vMYXGP6rTN9EEQjbkgdHL/rHEu/I0Bj+92x+Q=;
  b=OS17/SfGZrH81PX2DWEXGJfNn30TefLs2orkyeCZLO1utduCi61MD0hs
   qpR1QXqdSgdSHj9deP0evBp3S29bHXyQ9sF4mVs0T5v3Ir+Cm+GT597HY
   b5/go2JI3n+ZAIY5KlZHRF6MEXMsFmw++2XFUnr1Ad1/HeQeiaAuspqsM
   NZMW1tN7viia9ihfI82CGEwzfy0zC39DKX6FQF+5BHo/VrQtQDxHlloUX
   qYILdr/oTHtw8Gr2M9/iNrpysJGSMaKL9R9VZ8q4LGInTtYEQ3Iz3+m6h
   Mdmor4oqnqI7GutpfAJm8DGMQlZj+5/OBhO6RZjuIGAEqReFNwc8Qb0da
   g==;
X-CSE-ConnectionGUID: cwZYsI1TSfWmncK6F4iu0g==
X-CSE-MsgGUID: 7E5CmneoRleErP5auX9mfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96684147"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="96684147"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 07:30:59 -0700
X-CSE-ConnectionGUID: T42k+n6FSj6izlCsZaj95Q==
X-CSE-MsgGUID: km6obHKSTbCP/1Ng9zdCjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="241480481"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 May 2026 07:30:57 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKzkc-0000000009h-3gFs;
	Thu, 07 May 2026 14:30:54 +0000
Date: Thu, 07 May 2026 22:30:30 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ljs:project/cow-context 1/18] mm/init-mm.c:26:21: sparse:
 sparse: incorrect type in initializer (different modifiers)
Message-ID: <202605072229.SxWRTBhQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: 1be9d553f4be97b754471cc04735f215e75c4bf2 [1/18] mm/rmap: add cow_context data structure and assign to mm
config: alpha-randconfig-r134-20260507 (https://download.01.org/0day-ci/archive/20260507/202605072229.SxWRTBhQ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605072229.SxWRTBhQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605072229.SxWRTBhQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/init-mm.c:26:21: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct list_head *next @@     got struct list_head [noderef] * @@
   mm/init-mm.c:26:21: sparse:     expected struct list_head *next
   mm/init-mm.c:26:21: sparse:     got struct list_head [noderef] *
>> mm/init-mm.c:26:21: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct list_head *prev @@     got struct list_head [noderef] * @@
   mm/init-mm.c:26:21: sparse:     expected struct list_head *prev
   mm/init-mm.c:26:21: sparse:     got struct list_head [noderef] *
   mm/init-mm.c:27:21: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct list_head *next @@     got struct list_head [noderef] * @@
   mm/init-mm.c:27:21: sparse:     expected struct list_head *next
   mm/init-mm.c:27:21: sparse:     got struct list_head [noderef] *
   mm/init-mm.c:27:21: sparse: sparse: incorrect type in initializer (different modifiers) @@     expected struct list_head *prev @@     got struct list_head [noderef] * @@
   mm/init-mm.c:27:21: sparse:     expected struct list_head *prev
   mm/init-mm.c:27:21: sparse:     got struct list_head [noderef] *
--
>> mm/cow_context.c:27:23: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head *entry @@     got struct list_head [noderef] * @@
   mm/cow_context.c:27:23: sparse:     expected struct list_head *entry
   mm/cow_context.c:27:23: sparse:     got struct list_head [noderef] *
>> mm/cow_context.c:42:17: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head const *head @@     got struct list_head [noderef] * @@
   mm/cow_context.c:42:17: sparse:     expected struct list_head const *head
   mm/cow_context.c:42:17: sparse:     got struct list_head [noderef] *
>> mm/cow_context.c:64:23: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head *new @@     got struct list_head [noderef] * @@
   mm/cow_context.c:64:23: sparse:     expected struct list_head *new
   mm/cow_context.c:64:23: sparse:     got struct list_head [noderef] *
>> mm/cow_context.c:64:43: sparse: sparse: incorrect type in argument 2 (different modifiers) @@     expected struct list_head *head @@     got struct list_head [noderef] * @@
   mm/cow_context.c:64:43: sparse:     expected struct list_head *head
   mm/cow_context.c:64:43: sparse:     got struct list_head [noderef] *
>> mm/cow_context.c:77:25: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head *list @@     got struct list_head [noderef] * @@
   mm/cow_context.c:77:25: sparse:     expected struct list_head *list
   mm/cow_context.c:77:25: sparse:     got struct list_head [noderef] *
   mm/cow_context.c:78:25: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct list_head *list @@     got struct list_head [noderef] * @@
   mm/cow_context.c:78:25: sparse:     expected struct list_head *list
   mm/cow_context.c:78:25: sparse:     got struct list_head [noderef] *

vim +26 mm/init-mm.c

    21	
    22	struct cow_context init_cow_context = {
    23		.refcnt = REFCOUNT_INIT(1),
    24		.mm = &init_mm,
    25		.remap_mt = MTREE_INIT(remap_mt, MM_MT_FLAGS),
  > 26		.children = LIST_HEAD_INIT(init_cow_context.children),
    27		.siblings = LIST_HEAD_INIT(init_cow_context.siblings),
    28		.list_write_lock = __SPIN_LOCK_UNLOCKED(init_cow_context.list_write_lock),
    29	};
    30	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
