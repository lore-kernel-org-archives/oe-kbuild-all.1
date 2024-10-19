Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A172F1CC8AA
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 03:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729309464; cv=none; b=bGW6rMjrs44hapPCVscrcfhKxCoQHaqPL0RChSXjUH8wKWyjpZM/Y3BzINpqnL0BJM7GPC7i4kcU5+6pb/rQLQ3HLYVKAPfOXMR4TrTdpIMLuQ8INhUMCE3WnW8ZVoU6APBHA2s2xrVabgcoYHX17n+XdPBiBklJtoR8APOnlzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729309464; c=relaxed/simple;
	bh=UsGVFwIrkIfjXzINT4GZNOFO1JM7D0B4ubJa1cBvFOw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JSUa35tK7UPQ9erRuf5TgkSzzMey+vc6c5c/bnhmPiDn2HDJEVoqd5D31JDlb1wf1PRi5NHd6ecZxO7cxgPeKHXXl3fa8DOjEs2ZUS8Tt6H9aUgINGcbSs4knfrdxefJKLO/ROzBCAByQr8ls9F5vFI4WJcL/YAZcpKPfGsPDpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZ2UJ/iE; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZ2UJ/iE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729309462; x=1760845462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UsGVFwIrkIfjXzINT4GZNOFO1JM7D0B4ubJa1cBvFOw=;
  b=YZ2UJ/iEdm9cMw8YoHDIGE8R9goyUQN1ljpDpBVPy0i6obBJZbV4aN9i
   Q73GE3fbKpt34diGKeZ29EnFReX9y5077Yv+2U4D/MDRQpglRt5tEUkf1
   iNJ9bdm04bdz9CHyP7XU5XNvbLzb70s5n7mSMCmUGj2szeG6BH6v/4ly9
   JtBPe+sGS0ZM2N7y4Rf5R5Oll+rHe0RNcQUKOwMsm6NSZOJ7Wk3ti1b+c
   QTcbGhjrXUICrJYjp78kUpxyssCpV5uzkbJ8GaMMNP2F96NOk0PMAa0HL
   7ZbsehWSzB0q/Jc1M+xZ2R8quoF4ihos6UlEXZoF4UEGoLRM7ThioukiE
   w==;
X-CSE-ConnectionGUID: uchzArboT0CGeMSlxXsLhw==
X-CSE-MsgGUID: y0Rt0zINTHqMnhyoE3+aSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="46351199"
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="46351199"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 20:44:21 -0700
X-CSE-ConnectionGUID: 5Mztuf+mQkWGv5clchq5OQ==
X-CSE-MsgGUID: pZXhZSSaR9SXqpO+47bJMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,215,1725346800"; 
   d="scan'208";a="79003896"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 18 Oct 2024 20:44:21 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t20O2-000OgF-2F;
	Sat, 19 Oct 2024 03:44:18 +0000
Date: Sat, 19 Oct 2024 11:43:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1624/14651] loongson3-acpi-cpufreq.c:undefined
 reference to `acpi_processor_unregister_performance'
Message-ID: <202410191113.e2y65UAz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi liuyun,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   980f4346f1fdbd303ad74af8b2a62fbbbb6cf6c1
commit: 47a0b6f372d7f05822d021f86b21a34fd2142225 [1624/14651] cpufreq: Add cpufreq driver for LoongArch
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20241019/202410191113.e2y65UAz-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410191113.e2y65UAz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410191113.e2y65UAz-lkp@intel.com/

All errors (new ones prefixed by >>):

   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `loongson3_cpufreq_cpu_exit':
>> loongson3-acpi-cpufreq.c:(.text+0x6f8): undefined reference to `acpi_processor_unregister_performance'
   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `.L333':
>> loongson3-acpi-cpufreq.c:(.text+0x2a20): undefined reference to `acpi_processor_register_performance'
   loongarch64-linux-ld: drivers/cpufreq/loongson3-acpi-cpufreq.o: in function `.L372':
   loongson3-acpi-cpufreq.c:(.text+0x3390): undefined reference to `acpi_processor_unregister_performance'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
