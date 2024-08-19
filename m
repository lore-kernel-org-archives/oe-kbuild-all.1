Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1160C1804E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Aug 2024 17:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724086856; cv=none; b=Rh1DuXRmzqPVI68Flwh1lF4CXMNGID5JhaMMNLgJVeJ7/QsRBhxsL/P43SsTs5In4b71KTyiJkysdpFqpRXpfu1bn/lKcAs/To+Pi/QXziddvkBD7Bf8cB3o/6ExJ+LR1EnEtBvBy9H+QVFIJgLa3/wTIjfWJdb/3q8Wr7yW9dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724086856; c=relaxed/simple;
	bh=uHcD7MdxAndnVqDiFcRciG3nzg4W3W9nLzUUwJC8C6g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e/kiHW1vbC0zLXrX4SRQJP4Fp0BU1BX9SqstSsJY6K5Dp6VTRqmPo6rFbuCUNrJEo2zmGrbzqZ6Mr0Oybt+KfrfvVoZ8yZNo4lbQ7ZEl0wgVt5qXgEIXHbKD7QABZofBs2XUz+FSV1dzi1V76+Y1477eQDiYXcmzmOZlXNMqU48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OaSnU9FH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OaSnU9FH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724086855; x=1755622855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uHcD7MdxAndnVqDiFcRciG3nzg4W3W9nLzUUwJC8C6g=;
  b=OaSnU9FHnE8VEVdwSe/y6+v0XC18TzsPhUqOE6aEL4yF6UV2J4AOsuLV
   YCnWh9GmStiHjONBxLnwkwajBvKvwGBl9iyCCeatw02DQUpTmMotYk4nD
   9peLJ7OS97pnGBE1MRVAySAtUtSkbXJwdyoNpgxw2fYZWlyMzE24BGJqE
   rbDlhcIzIctZaNoBaIXnTdJGq6ChiKPdh8VQa6Lo+BvkYbvMcJpa4SWTT
   u850fImOvMySOdG+QnYizja/FvDDdUevDvmhTLx2nbxh4K+orZ1Y+GovO
   iYCYd1ewJPmPCEyZ4dLW8rcpMORywt5Rs4pXLct+RM0ybqwlFWIbvDBef
   Q==;
X-CSE-ConnectionGUID: vt5VSHRJR6iJ/dqWuyhdGg==
X-CSE-MsgGUID: AOvX5pSQRGW6M9HngTAeXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11169"; a="32921067"
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="32921067"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2024 10:00:54 -0700
X-CSE-ConnectionGUID: JiSCO+MdQd2HAiaTm36Fsg==
X-CSE-MsgGUID: P2jJGbiIRQGAZXTtxoMG+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,159,1719903600"; 
   d="scan'208";a="60093689"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 19 Aug 2024 10:00:53 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sg5kR-0009DW-0B;
	Mon, 19 Aug 2024 17:00:51 +0000
Date: Tue, 20 Aug 2024 01:00:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Xie XiuQi <xiexiuqi@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 10131/23506] kernel/sched/debug.o:
 warning: objtool: missing symbol for section .text.unlikely
Message-ID: <202408200045.LpVCr73z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   36fe9923e738b237c70af2304f0d1d2a033fc632
commit: acfa0f545c7dd43f959c28e8ab4b139c927ba387 [10131/23506] svm: reduce log of run queue and atomic->atomic64
config: x86_64-buildonly-randconfig-001-20240819 (https://download.01.org/0day-ci/archive/20240820/202408200045.LpVCr73z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240820/202408200045.LpVCr73z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408200045.LpVCr73z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/sched/debug.c:797:6: warning: no previous prototype for 'sysrq_sched_debug_tidy' [-Wmissing-prototypes]
     797 | void sysrq_sched_debug_tidy(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/debug.o: warning: objtool: missing symbol for section .text.unlikely

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
