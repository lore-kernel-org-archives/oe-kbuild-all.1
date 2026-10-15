Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044CB4FD79C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 15 Oct 2026 22:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792104384; cv=none; b=lhXMmlgofQwCM8et8A4HkIpLOpJEZ+QxH70W/eFw2NXh60flpL8QtUM/smeyUUqGXSCbiQL3L4+/3CoxXeyQcTvqZrMDdJlqm5HTmwOkgrMDWxjBAvJ607aPJVGfjnB+ltnypwgUCsYi2q2aCeVDO/4Ew9JqZpckEpabsh/XPk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792104384; c=relaxed/simple;
	bh=0zqn6aaDJ0XjPQTLOB2Y0LIJtss8uLnbyZXcGV0AbII=;
	h=Date:From:To:Cc:Subject:Message-ID; b=C95VN3c8bwcH0vTfRCOceSytKWH5odG+cF+kDxQE3Luw116mNfGVX8sfsNdQG8Yhv7rp3FKKKNHc2FVCvS2iF01gke7qO7gnXojoOUwRVzHFLp/z7xnfQcf0vfhI1Fk2TnZ/xkexcyabSEQoefW2tQ7CkJMEKwBIKR6wWf7IGZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zmbg11bA; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zmbg11bA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792104382; x=1823640382;
  h=date:from:to:cc:subject:message-id;
  bh=0zqn6aaDJ0XjPQTLOB2Y0LIJtss8uLnbyZXcGV0AbII=;
  b=Zmbg11bAas6FTvfO/BmWcsz+WYpRx9+EBGfa2jED7nvoQ/tN8+oYg2cN
   Lns+uu7EHI0NB1Vw0TiKwM7SgbOGIVnTFTAKAg2XV/DLG+Zlg/UXTvJGz
   VFum5E6Q65Jrgz6cBazEyOX0voLyj5+ayPck2dCBOveDlh1huEEQ0pXgE
   bTMGLXSw5Xd0e2Z4DvuNAPNzbOarJQeODC8L8OaAbbHD8RMZi2icAUWTF
   H/v2OjLosLpfvqZB9VfcjcbwPGgNexg2HILwPx2yMSjDyz4tcks4E9lL5
   +ipOEneqOatnIhtj4UqxV1pJRRrNFvglZEEyeMv3qm6rkcWvYsDmMS8AO
   g==;
X-CSE-ConnectionGUID: mIdEZ9KbSTicMKnaJCRPLQ==
X-CSE-MsgGUID: ZgzrO3e0Qm6nAneIYHIQNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="990711"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="990711"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 15:46:21 -0700
X-CSE-ConnectionGUID: qNJ+0QUVQsaTd1HaJiaBwQ==
X-CSE-MsgGUID: +Ol1ZdJYTPKBc4r1v+CLsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1696270"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 15 Oct 2026 15:46:19 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHUDJ-00000000Bti-36WU;
	Thu, 15 Oct 2026 22:46:17 +0000
Date: Fri, 16 Oct 2026 00:45:30 +0200
From: kernel test robot <lkp@intel.com>
To: Richard Patel <ripatel@wii.dev>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 x86@kernel.org, Thomas Gleixner <tglx@kernel.org>
Subject: [tip:irq/core 3/7] kernel/irq/manage.c:1208:2: error: call
 to undeclared function 'clear_and_wake_up_bit'; ISO C99 and later do not
 support implicit function declarations
Message-ID: <202610160017.QOA49KVT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/core
head:   4351cc74202857f5b85b3573c477c9f798f5cd88
commit: 313fa9ffa302f81b437e1ebbb1e6abae06be0cad [3/7] genirq: Defer kfree(irqaction) until irq_thread_dtor() finishes
config: i386-randconfig-2200-20261015 (https://download.01.org/0day-ci/archive/20261016/202610160017.QOA49KVT-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610160017.QOA49KVT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610160017.QOA49KVT-lkp@intel.com/

All errors (new ones prefixed by >>):

>> kernel/irq/manage.c:1208:2: error: call to undeclared function 'clear_and_wake_up_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1208 |         clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
         |         ^
   kernel/irq/manage.c:1292:2: error: call to undeclared function 'clear_and_wake_up_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1292 |         clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
         |         ^
>> kernel/irq/manage.c:1866:2: error: call to undeclared function 'wait_on_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1866 |         wait_on_bit(&action->thread_flags, IRQTF_EXIT_WORK, TASK_UNINTERRUPTIBLE);
         |         ^
   3 errors generated.


vim +/clear_and_wake_up_bit +1208 kernel/irq/manage.c

  1202	
  1203	static void irq_thread_dtor(struct callback_head *unused)
  1204	{
  1205		struct irqaction *action = kthread_data(current);
  1206	
  1207		__irq_thread_dtor(action);
> 1208		clear_and_wake_up_bit(IRQTF_EXIT_WORK, &action->thread_flags);
  1209	}
  1210	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
