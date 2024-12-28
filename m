Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEF9433DE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 11:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735384789; cv=none; b=OyDBbJKe6pH1OHTTVGJP4E4yncOsuP7PjmCD3zarR9tFhJAmZQHNEzUveqYUlIawr+AeCF7f7BppRzOzeXKL/8xRg6n9Z4ksRfPdM+/zqYm/AZxoPOenodhyrNoAnfr4D8tQHf4tVfQwD6nheYy3tAFQ8Kp4SUvfIZLFhPAEzi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735384789; c=relaxed/simple;
	bh=pT7fhxxREk7I6ahw31q3HrHEsWztlCmwlRjsXmBm4Pg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ej38b/pArHSCAWljqoeyegYJEbxSoW6PHIJYFAL+44YPLFg07eSeZzAIl6h3zSA5R1jD+iIS2jLmA9noUlI07vR4U1hajFfgd+VhosaN1FiCG8L/UXBJx7UuFZy5fDdIJuTI1IavLG+T0mI/cBPX6hqsoGZIs5yuAwrE9AayFy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IDUENBvN; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IDUENBvN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735384788; x=1766920788;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pT7fhxxREk7I6ahw31q3HrHEsWztlCmwlRjsXmBm4Pg=;
  b=IDUENBvN4u9mymFFyVNmRmo7QtP2/mrw9/t+v1YImbFnpHKhUOelXqfO
   Hb+6d1yZCxMRUVvgJlZYAwMX3ShYHkhkbyk9mnaTDoU++o8piys8mK4Ez
   fRxhDnYjqM/zJV+Db1KwcQKMWUY2nPPa4lsZqtQSo2oXNAYkOJ1jpUYfu
   4ey/GLStjm/YIaiCrcYQfuSGf9EKWuRdwNVVBDz/jHWl1/FfMPEc8F1+n
   S//Uef4ZfPMyksrdZab8pwieKXOrGcSZ13J6m4e4aBuOHPnX1YT8fDogt
   xt6MzuYn7xjDspOvtWIeUsqbG36zAIGluiiR2jP6Y1qxC2ldQLLnuMCz1
   w==;
X-CSE-ConnectionGUID: qJhKpjKpQBOwdNXr8luZSQ==
X-CSE-MsgGUID: S9ADKTzwR/SdEYzfaBkHWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="53154536"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="53154536"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 03:19:47 -0800
X-CSE-ConnectionGUID: 9t+GLLmGTdWpyJxW+n44/w==
X-CSE-MsgGUID: OfVESFXVQjG7l7m6jVvkPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="131196987"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 28 Dec 2024 03:19:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRUrA-00042G-00;
	Sat, 28 Dec 2024 11:19:44 +0000
Date: Sat, 28 Dec 2024 19:19:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1355/1355]
 include/linux/share_pool.h:150:26: sparse: sparse: incorrect type in return
 expression (different address spaces)
Message-ID: <202412281933.AtwopaHj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: 4a280fac30d27ae2aff096f9f99aa12d50f83426 [1355/1355] ascend: share_pool: support share pool features for ascend platform
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241228/202412281933.AtwopaHj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412281933.AtwopaHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412281933.AtwopaHj-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/gup.c: note: in included file:
>> include/linux/share_pool.h:150:26: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct task_struct * @@     got struct task_struct [noderef] __rcu *owner @@
   include/linux/share_pool.h:150:26: sparse:     expected struct task_struct *
   include/linux/share_pool.h:150:26: sparse:     got struct task_struct [noderef] __rcu *owner
   mm/gup.c:1769:47: sparse: sparse: self-comparison always evaluates to false
   mm/gup.c:1794:47: sparse: sparse: self-comparison always evaluates to false
   mm/gup.c:1830:6: warning: no previous prototype for 'gup_fast_permitted' [-Wmissing-prototypes]
    1830 | bool gup_fast_permitted(unsigned long start, int nr_pages, int write)
         |      ^~~~~~~~~~~~~~~~~~

vim +150 include/linux/share_pool.h

2facb5901ceebe Ding Tianhong 2021-10-30  146  
2facb5901ceebe Ding Tianhong 2021-10-30  147  static inline struct task_struct *sp_get_task(struct mm_struct *mm)
2facb5901ceebe Ding Tianhong 2021-10-30  148  {
2facb5901ceebe Ding Tianhong 2021-10-30  149  	if (enable_ascend_share_pool)
2facb5901ceebe Ding Tianhong 2021-10-30 @150  		return mm->owner;
2facb5901ceebe Ding Tianhong 2021-10-30  151  	else
2facb5901ceebe Ding Tianhong 2021-10-30  152  		return current;
2facb5901ceebe Ding Tianhong 2021-10-30  153  }
2facb5901ceebe Ding Tianhong 2021-10-30  154  

:::::: The code at line 150 was first introduced by commit
:::::: 2facb5901ceebe6736c0d192ca50be5d26c70ad9 ascend: vmalloc: export new function for share pool

:::::: TO: Ding Tianhong <dingtianhong@huawei.com>
:::::: CC: Yang Yingliang <yangyingliang@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
