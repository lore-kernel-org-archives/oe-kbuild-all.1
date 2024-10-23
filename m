Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6991E00A2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 22:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729721182; cv=none; b=PU686ZGpzcHecFhVcfWB3214jm8VaoRtA1yk4g0z4+Mus1704rd0OLfU4gqYC8s8k+GTX6ngAuOkXNGs2X/OQJew7lwRILYFiaVdcYiOOk9h5y/yX9naZOCMN1w51kQVExIcg4f72b1vKpChz8mZpgGSh2eeiXGi5aQMhA3bbs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729721182; c=relaxed/simple;
	bh=8+0CemGcPQX4WJXHsCGny9zRxFbFg1S66BuoxBQ7Jns=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z7zGDJzUtjIeEWbRLjo9mFosH2S0Sy50affb6Y74Nf5+KPOmq41/17emvdqVSj9ukIlaZewGkULVg4hoai3wjxuVLhaRWvcjhZxM6x3c/2/tzd36j4OrrD6u4is9QrgB/f3xCrx25gP7GASjqq5zYfhcs1M20JgY6aQckc4gZCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifMdq/x5; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifMdq/x5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729721180; x=1761257180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8+0CemGcPQX4WJXHsCGny9zRxFbFg1S66BuoxBQ7Jns=;
  b=ifMdq/x5mG1oUuX0icX/gsbOlxRPHYjfLMQGIWcF5ZKIpUqFyohGYiEe
   HNtRSsByAZX/0VwtY2Dgr1r43Dti5nfn3b9HtjnttB9OLuZDn2VDrHgC2
   h00sodFAGc5aDWhxhoto8hfgwD4GuPWjpotTqi4Jy91OojGwK0vt1m2C6
   W/iGkzXsif68774vQZBZXw2RHM9PizDqr1hZLffsuUBG/q4q9isE9YoUS
   6Y3s1RzL3FTkBRKy6foyDTRV7v0HwxURDjUc1dehMbQpetqLmpPUFr8PD
   iyKEx9NzQjXGmm3mO1NTCnJt0x9CN0WRrcnKshasfTzigVFMlb/8lUf8K
   Q==;
X-CSE-ConnectionGUID: TyeU839uRDWvWxNaf9Z+5Q==
X-CSE-MsgGUID: LSzLBR81SGK9GsTqAegHbg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39878848"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="39878848"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 15:06:19 -0700
X-CSE-ConnectionGUID: Jzi4E42/RXaXhnDei1xeUQ==
X-CSE-MsgGUID: qnfgSNLdSgSPzxB/PaUkAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80575288"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 23 Oct 2024 15:06:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3jUe-000VdE-0n;
	Wed, 23 Oct 2024 22:06:16 +0000
Date: Thu, 24 Oct 2024 06:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15515/23855]
 arch/x86/events/zhaoxin/core.c:505:12: error: redefinition of
 'zhaoxin_pmu_init'
Message-ID: <202410240541.Jo4ftqeo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi LeoLiu-oc,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3c02090eb0ad149880a8c798014249ad2d642617
commit: 0ce7c3b6e8a986ee9ef92a07ae18964835446c07 [15515/23855] x86/perf: Add hardware performance events support for Zhaoxin CPU.
config: x86_64-randconfig-001-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240541.Jo4ftqeo-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240541.Jo4ftqeo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240541.Jo4ftqeo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/x86/events/zhaoxin/core.c:505:12: error: redefinition of 'zhaoxin_pmu_init'
     505 | __init int zhaoxin_pmu_init(void)
         |            ^~~~~~~~~~~~~~~~
   In file included from arch/x86/events/zhaoxin/core.c:19:
   arch/x86/events/zhaoxin/../perf_event.h:1054:19: note: previous definition of 'zhaoxin_pmu_init' with type 'int(void)'
    1054 | static inline int zhaoxin_pmu_init(void)
         |                   ^~~~~~~~~~~~~~~~


vim +/zhaoxin_pmu_init +505 arch/x86/events/zhaoxin/core.c

   504	
 > 505	__init int zhaoxin_pmu_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
