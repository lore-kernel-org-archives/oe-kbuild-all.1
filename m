Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D40221FB4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Dec 2025 18:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766340825; cv=none; b=dSSRgQMGmMuxsoCAez0vyz0l6mPWgdAMpGgbeJQO/dFnq72e8RnZi74hE7b5hvzzn7qhsF3T/eEmR5HjSv06FsmbtAVlSjAL0W54ZXeqJLEadRA995Ogy106JxWePyzShuwmZzTvD7KXpb9M0AamiTT9m+7aFIYnRGwY8HtsI0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766340825; c=relaxed/simple;
	bh=vDhok3mumGA9dSx7d5ldGfOJO7stu5h7N1ywv0Xu9o8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L1Hi4aj6SPp/3QodxShLmt7OFGcvhWMsMgvmOWV0xKbm1vswUAysCwhKHXVEZKL/tswZu+fg+gyLhOaPYGbJ4t8kZmuL2rWXZ8ta/xFWNALMdR6Mtw2mI0BixH7o5rlZ8NgN06NO1vqnnZWM/kWHinu/2L2CkFi+JaqH5kFq1jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WOgIePWo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WOgIePWo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766340824; x=1797876824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vDhok3mumGA9dSx7d5ldGfOJO7stu5h7N1ywv0Xu9o8=;
  b=WOgIePWoihAi/8jfetPEbyYkZjDmdWSVm6LSL81BwqdpFReoiNQKPUL2
   Jq/H5ci+aLgbR8FK/T1AFALnX2Ge4z4ieB9ClgSLpwZNYEshzlQMDL291
   kLg/naqFeqMsGbWqY5boyfUiNoOGneIB/3PG04UIPtkyDZbJQiwbnwKws
   mW8ja8Kf4ldwCxK7gE9Qqvyo90OMBrZ/KqP+5ZxfJLRr+h3pN3NBy8z3Y
   aI3tVBhVdvfELJYC1CVfT+c72kwhr+4rUlUwoRIRngbCuBW9kGQLgCY6G
   ziU+9BSSy649QcigXzBDOF6MDhTGlObHDxusRZEy4DSHmcM0x73FWcDmh
   Q==;
X-CSE-ConnectionGUID: FDZ3/hcFR8qVvsxN3xTibw==
X-CSE-MsgGUID: T+TDGR2fS8qwW9mktT7pQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="78932791"
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="78932791"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 10:13:43 -0800
X-CSE-ConnectionGUID: Cu/3exryTFWZMIEmUIBoqQ==
X-CSE-MsgGUID: L5z/XYbxRdGOoGWO+3uNLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,166,1763452800"; 
   d="scan'208";a="203874061"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Dec 2025 10:13:42 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXNw3-000000005w3-26os;
	Sun, 21 Dec 2025 18:13:39 +0000
Date: Mon, 22 Dec 2025 02:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3415/3415] arch/arm64/kernel/ipi_nmi.c:40:9:
 error: implicit declaration of function 'printk_safe_exit'; did you mean
 'printk_nmi_exit'?
Message-ID: <202512220254.DKUPaC7y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Li,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: f86d165bfe5f6248743774bb07af0bd7cff12443 [3415/3415] arm64: Add non nmi ipi backtrace support
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20251222/202512220254.DKUPaC7y-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512220254.DKUPaC7y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512220254.DKUPaC7y-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/kernel/ipi_nmi.c: In function 'ipi_cpu_backtrace':
   arch/arm64/kernel/ipi_nmi.c:38:9: error: implicit declaration of function 'printk_safe_enter'; did you mean 'printk_nmi_enter'? [-Werror=implicit-function-declaration]
      38 |         printk_safe_enter();
         |         ^~~~~~~~~~~~~~~~~
         |         printk_nmi_enter
>> arch/arm64/kernel/ipi_nmi.c:40:9: error: implicit declaration of function 'printk_safe_exit'; did you mean 'printk_nmi_exit'? [-Werror=implicit-function-declaration]
      40 |         printk_safe_exit();
         |         ^~~~~~~~~~~~~~~~
         |         printk_nmi_exit
   cc1: some warnings being treated as errors


vim +40 arch/arm64/kernel/ipi_nmi.c

    35	
    36	static void ipi_cpu_backtrace(void *info)
    37	{
  > 38		printk_safe_enter();
    39		nmi_cpu_backtrace(get_irq_regs());
  > 40		printk_safe_exit();
    41	}
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
