Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6254C24BBFD
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Dec 2025 18:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767119089; cv=none; b=iPTkkKAFv9qOOAy/5fzxIzYD0CT1Gx24Po9z5aI44yF4NX2r42mwA7MqhqkvsMWQOvEcBq0tjiliURQ4ICd7W/AENU9n2dPcTltJeQSqpUFOE/w4+2i+5ZOsVann9pEgPNEF14BVxTqHrfzCxHnwjNd7rG1MJocgMoDADOfs86Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767119089; c=relaxed/simple;
	bh=cHvRSZlVUMr+b2MgusEI/XFX3df8wkSK6guuRDpNxsY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vCNQnADVBkXalGHsKCWbLprVcxjwyp8vcDr7fiGMSJiXr9CJDJ4u7Ou+8HSn/XjyPcU4wVg/GtEsoAGtrQOAuXmp7gNp8qEmhbgi0jKr4Z5/99T9CLnM6MM07vjh3eI43t3UJoh3CL8dZhvqx6Kwu2g/DNdSHPyEktHrt7vQohM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lUPaW2KC; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lUPaW2KC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767119087; x=1798655087;
  h=date:from:to:cc:subject:message-id;
  bh=cHvRSZlVUMr+b2MgusEI/XFX3df8wkSK6guuRDpNxsY=;
  b=lUPaW2KCoIp6oS14/xdDYlHBViEcTxl2F64eTg+MrKAWASz4cSSzSwtD
   TdvDIiexQgtgT+ytvv3fQqU2zY5sJhg5M7nFoAAg5U91oLl6H7CEsGGcu
   mJkQAyXp84qpO69LV2dZlQoTxVSn72rBPHddADM7qhOwWmawX8uhY1TM+
   va0NC9SoGDqBM4mc+dwAW2bGiIPJjJgGuG2GvKIs0v6AOJqGGt67L+Tnu
   CIstZbFUraxkay3SLKhSD53Nul1by3b8YUqhlJQyG8gMmrAuB6fBZRk1w
   isLWTQTlDihqPLjik2+iXHBxNtbCq/aQIEPHp/s6YytJe0jfdrHnOrne+
   Q==;
X-CSE-ConnectionGUID: AUPwC21ZS56iYljFsHbktw==
X-CSE-MsgGUID: 5mJqsb/CQu2er2jJQw4xFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11657"; a="80158482"
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="80158482"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2025 10:24:47 -0800
X-CSE-ConnectionGUID: UPWkG/5hSmCS4Mzd0gDgkQ==
X-CSE-MsgGUID: oIIV1CvYSv24V1a+Jpw2rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,189,1763452800"; 
   d="scan'208";a="201151764"
Received: from lkp-server01.sh.intel.com (HELO c9aa31daaa89) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Dec 2025 10:24:45 -0800
Received: from kbuild by c9aa31daaa89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vaeOg-000000000c1-3e5q;
	Tue, 30 Dec 2025 18:24:42 +0000
Date: Wed, 31 Dec 2025 02:24:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [linux-next:master 2254/2671] ERROR: modpost:
 "arch_enter_lazy_mmu_mode" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!
Message-ID: <202512310238.ViLCpEnx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: a525b83d913f000bed66b69f6d9c05c0c04551dd [2254/2671] mm: add basic tests for lazy_mmu
config: sparc-randconfig-r073-20251230 (https://download.01.org/0day-ci/archive/20251231/202512310238.ViLCpEnx-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251231/202512310238.ViLCpEnx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512310238.ViLCpEnx-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "arch_enter_lazy_mmu_mode" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!
>> ERROR: modpost: "arch_leave_lazy_mmu_mode" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!
>> ERROR: modpost: "arch_flush_lazy_mmu_mode" [mm/tests/lazy_mmu_mode_kunit.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
