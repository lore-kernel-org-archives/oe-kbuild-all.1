Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DB03C5535
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 May 2026 09:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778147700; cv=none; b=j+80wwaQ+f8HBSPpUJJRB0hRbkGnmfndm/DHrwSWgPVYZhlapIdJZSl5zAVFjLBVFQ8S29FlHZURPPHc420AfdN6onsSLaaob7lY95MtZ8Z3fCAxiykrYs3WU8lYnjSkGFFBM/t5niyeLaCGkouVhtIH8aZz25nNEgX4FLoArDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778147700; c=relaxed/simple;
	bh=ESOXChg+VzqGyU/Nm+69hNmCDd8YLuWxuyVOEWTDJmo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=HCUr+VzpIttUhXtnTQziLjx98Ujaar7GayHNWD40QLKeVKKMHQBXXixl6BSJAYw6RrhIoIg/+yhV13rpqA9BWvRSKCsU3438ZJHnJDkG0lAsvNoVEZoK5eqARf+tyJfUS+SiUHsQYW5m+brGK7fMO72553vZ//9P4Vs2JC5/8qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNYp9ej9; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNYp9ej9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778147699; x=1809683699;
  h=date:from:to:cc:subject:message-id;
  bh=ESOXChg+VzqGyU/Nm+69hNmCDd8YLuWxuyVOEWTDJmo=;
  b=eNYp9ej9AXIhEuLeYjpR4fVfxQ9sMvp3/dDY/DQZRvmfoFp5GcET7RV9
   3gj7uUlnGFqH4NMd/XXnlgVYLKhfuPpWaXnpJRveUC9jLASr9OuZEABKK
   D2VYp/PuScxgj67fkN3wDBT9vCqvUQKr2lPTE7Z1f3ie/UHPafjtu4DfR
   +1t+Ph0f+UrQKVENIx6tJehulBVpHFAqkDGxmqFIZ3qRnwvZmiNluR4bG
   VFacKwOcO0roWqBKeRxVCIUQRX0PHhzWAAaRTcc17kpTV6lQqdqn1vzby
   sncusXA+WBiHTC/TQoquJgZKYuZfTq7BNzBnFtgaaRtgRTaZAUvUuWUMl
   Q==;
X-CSE-ConnectionGUID: Hn9Fv1mhQJ27ZuyWqa7ZQQ==
X-CSE-MsgGUID: A/ArGU00Q6mf+ROx8dmwfw==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="79110502"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="79110502"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 02:54:58 -0700
X-CSE-ConnectionGUID: CFFoL27AQtqV9loHkwbRAQ==
X-CSE-MsgGUID: njLyixnWSy64kLF94kjoNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="233331414"
Received: from lkp-server01.sh.intel.com (HELO 8365ac1094ea) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 07 May 2026 02:54:57 -0700
Received: from kbuild by 8365ac1094ea with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKvRW-0000000009x-0qQr;
	Thu, 07 May 2026 09:54:54 +0000
Date: Thu, 07 May 2026 17:53:59 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ljs:project/cow-context 1/18] mm/init-mm.c:26:21: sparse:
 sparse: incorrect type in initializer (different modifiers)
Message-ID: <202605071732.qhO2KwOh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: 1be9d553f4be97b754471cc04735f215e75c4bf2 [1/18] mm/rmap: add cow_context data structure and assign to mm
config: alpha-randconfig-r134-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071732.qhO2KwOh-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.4.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260507/202605071732.qhO2KwOh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605071732.qhO2KwOh-lkp@intel.com/

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
