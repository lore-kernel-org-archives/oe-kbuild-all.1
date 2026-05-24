Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9B52356D9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 May 2026 03:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779593604; cv=none; b=S2M2H9yENCdVAgbGl4OZT2q3T9GubO3sV5HTH9L68F3m8RWwKnlBsDhYH7janSlFJbGdRLiQo/tBttbOr2/cPM6Xq6iTZ4sr2qpxRzKie6vCJljBKtrujO0pKDzN0yYMwnq1v4XUWRyFLUm2B3Y4QNHYLS5mpCvPA188bmNckGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779593604; c=relaxed/simple;
	bh=81Ari1e6OqGvZs1wrTKBIS8PJfIpcUQgmxz2CcxW0Ho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=azrMyeiR9ZeAB8g//4Zurw8CvKiiGg4uiACWqxKNJJNfZY0CuTj/igSAHK59FFGuxr0nLPoAdMU2LuIIsv55jU2vFO+hvPgzJXubS/mXyfRlRtHiue2HZmoan8PHsuZiz/X+tRaOVxQJ6OX60iQw2X874hbyuXaV8qBHrG04NZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVaD1mvE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVaD1mvE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779593603; x=1811129603;
  h=date:from:to:cc:subject:message-id;
  bh=81Ari1e6OqGvZs1wrTKBIS8PJfIpcUQgmxz2CcxW0Ho=;
  b=aVaD1mvEbmfAUD0e9alPZDin8dswdcdQY7JNOQUIV/hoA8V9Hf2921lw
   DBR/o/wqLEGUmmY+DCiXNlZB+d8EfJB1CaR0DCpkgm0F1KDuNjm7WDFq0
   0gizXJCVUG8sbUUJbR86E4KjN/1It86uKr3x1jwwgfHWBkwqADOAmgggj
   8KEu6hBQINPKSp2XCdTUX5uA4MKydZTJPzZqGV1G9rKdynaqmmdonQilr
   4jJ7YdZ3GH5d4d/DFjmnfYJHmXHgzFzReAkjC3FYNIS7Goy6lGJqFqphL
   lJ/1NcMuRmxzI9wyKsSWPCNwiTrJzL+0DyRil+4NYQfY2zxCla4M09tjc
   A==;
X-CSE-ConnectionGUID: 3/enqTuKQAuKIjIw0X9znw==
X-CSE-MsgGUID: LTA0yz9bRKanl1s3bjR0nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11795"; a="90761570"
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="90761570"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2026 20:33:23 -0700
X-CSE-ConnectionGUID: ashk1ncHRyedTAKXmRwJMg==
X-CSE-MsgGUID: hm8v7TKYQvGwlplIWy3TBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,165,1774335600"; 
   d="scan'208";a="241141972"
Received: from lkp-server01.sh.intel.com (HELO 6ba8523b1a8f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 May 2026 20:33:21 -0700
Received: from kbuild by 6ba8523b1a8f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQzaY-000000000f3-2VlZ;
	Sun, 24 May 2026 03:33:18 +0000
Date: Sun, 24 May 2026 11:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Chuyi Zhou <zhouchuyi@bytedance.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [bigeasy-staging:smp_call_function_any 4/12]
 kernel/smp.c:806:30: error: implicit declaration of function 'kmalloc'; did
 you mean 'mm_alloc'?
Message-ID: <202605241101.w6T2LApw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git smp_call_function_any
head:   cec01329013ce633ca5857f5bb9273e000fdc6cf
commit: 98f51da91a96beeef4adf696e0c4f768fee75f33 [4/12] smp: Use task-local IPI cpumask in smp_call_function_many_cond()
config: x86_64-buildonly-randconfig-001-20260524 (https://download.01.org/0day-ci/archive/20260524/202605241101.w6T2LApw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260524/202605241101.w6T2LApw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605241101.w6T2LApw-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/smp.c: In function 'smp_task_ipi_mask_alloc':
>> kernel/smp.c:806:30: error: implicit declaration of function 'kmalloc'; did you mean 'mm_alloc'? [-Wimplicit-function-declaration]
     806 |         task->ipi_mask_ptr = kmalloc(cpumask_size(), GFP_KERNEL);
         |                              ^~~~~~~
         |                              mm_alloc
>> kernel/smp.c:806:28: error: assignment to 'cpumask_t *' {aka 'struct cpumask *'} from 'int' makes pointer from integer without a cast [-Wint-conversion]
     806 |         task->ipi_mask_ptr = kmalloc(cpumask_size(), GFP_KERNEL);
         |                            ^
   kernel/smp.c: In function 'smp_task_ipi_mask_free':
>> kernel/smp.c:818:9: error: implicit declaration of function 'kfree' [-Wimplicit-function-declaration]
     818 |         kfree(task->ipi_mask_ptr);
         |         ^~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +806 kernel/smp.c

   800	
   801	int smp_task_ipi_mask_alloc(struct task_struct *task)
   802	{
   803		if (static_branch_unlikely(&ipi_mask_inlined))
   804			return 0;
   805	
 > 806		task->ipi_mask_ptr = kmalloc(cpumask_size(), GFP_KERNEL);
   807		if (!task->ipi_mask_ptr)
   808			return -ENOMEM;
   809	
   810		return 0;
   811	}
   812	
   813	void smp_task_ipi_mask_free(struct task_struct *task)
   814	{
   815		if (static_branch_unlikely(&ipi_mask_inlined))
   816			return;
   817	
 > 818		kfree(task->ipi_mask_ptr);
   819	}
   820	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
