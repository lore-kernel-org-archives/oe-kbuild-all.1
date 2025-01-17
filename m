Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD1B01A238C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Jan 2025 20:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737146314; cv=none; b=rdHd1I+F1x2b6kguMrdjCgcBCIs176AI+FxD1lGHqNdGYJHXH0PwsPu+qkPiiU0BRD8XD/xx26X1MLYBaC7/hOc0GOLmG4kZ0ENhFdYOWch8vp1QIIAa9AD29QVMdHD/3q+L8L2dwuGt0DRKJ81dRL75Z17jTIG1ZwSkppR0yn4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737146314; c=relaxed/simple;
	bh=R6Ws9JcE0+mV/xIRnkE+kUqCbKoWnYPHSnont3E2uok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eYcoxjHsGpS5zS+zUvypbhf53Z8KC/Xujo0xbsUmAFG1S9CgXzjlWZCp6bWLbaQVbdfWjSjieqKyq2+xwYpeh5+cUp8c8N2HPNG45n7fF+Hiuch6vTSzfVkOLKdDNYe3C3GlTfOsMSz27IMMpFko/OQ3gMZdrPJDz4uKQk7SUSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MgqtjaUJ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MgqtjaUJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737146313; x=1768682313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R6Ws9JcE0+mV/xIRnkE+kUqCbKoWnYPHSnont3E2uok=;
  b=MgqtjaUJQ4f5LbDJ9K9rIdlw3bQWMexZc9CEsMp1V2XSpDIqm1vR3WMl
   AggMjmUf2Iu0lE5EwyJfeELrU6vWNUJiQI1Su258F8U93pFhc8K4YnvDn
   LXzJfWt4eHktyxQ7pTmxademxZ5ktVFQU1pNd17X/capeu7/Y8g3V7e+3
   yRMuHwdeQn2HvGhbDoH7oXG1Oa7a/eyaJkkRZEuPNi9V55FKj6qQBTEhi
   /GPY5WHPL/TchofetvE6ptx6Ic/YYmhvAvEZ8biP+zVpnxjujRS2SHeeF
   rRtCeiS+ELOfGfIy8/YEaYi1I9xhMBrWc4fzDMQSc/4HA5OS9eBbjqppA
   A==;
X-CSE-ConnectionGUID: Ci1LIpUAR/68vx0JtsJjOg==
X-CSE-MsgGUID: z/60Eub9RXCO1PNwVrwqAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="37750792"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="37750792"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 12:38:32 -0800
X-CSE-ConnectionGUID: 404QihrDSluOqGmN/6j9OQ==
X-CSE-MsgGUID: jPMoEO70S5encwXVRXKV5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="110541494"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 Jan 2025 12:38:31 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYt6r-000Tgh-0j;
	Fri, 17 Jan 2025 20:38:29 +0000
Date: Sat, 18 Jan 2025 04:37:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Liao Chen <liaochen4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1826/1826] arch/arm64/kernel/ipi_nmi.c:39:2:
 error: call to undeclared function '__printk_safe_enter'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202501180414.2c8NAnVD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a5cbe5b715d9cac271b2c6175e728f0c4167f675
commit: 5e3e94b1477ca3f6cb47ae8137a4a99fe0ef6147 [1826/1826] arm64: Add non nmi ipi backtrace support
config: arm64-randconfig-r123-20250118 (https://download.01.org/0day-ci/archive/20250118/202501180414.2c8NAnVD-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20250118/202501180414.2c8NAnVD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501180414.2c8NAnVD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/arm64/kernel/ipi_nmi.c:39:2: error: call to undeclared function '__printk_safe_enter'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __printk_safe_enter();
           ^
>> arch/arm64/kernel/ipi_nmi.c:41:2: error: call to undeclared function '__printk_safe_exit'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           __printk_safe_exit();
           ^
   2 errors generated.


vim +/__printk_safe_enter +39 arch/arm64/kernel/ipi_nmi.c

    35	
    36	#ifdef CONFIG_NON_NMI_IPI_BACKTRACE
    37	static void ipi_cpu_backtrace(void *info)
    38	{
  > 39		__printk_safe_enter();
    40		nmi_cpu_backtrace(get_irq_regs());
  > 41		__printk_safe_exit();
    42	}
    43	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
