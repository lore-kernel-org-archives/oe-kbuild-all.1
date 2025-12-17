Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F399030F53B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Dec 2025 21:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766007859; cv=none; b=E4frI9vxgh0vVY2lY+xN4D0/e9AbAMYpD8hARUhwt3MxDw0aoRyTt4G45scg7IveW7ij2G5vVoFm/rlKwvWSvnrPks/xlZvk4uDIBPAjpbbqV//IyhwsLQvmuFxEipjRdvjlxSi7mXGi7OwWlEmD72eShTRz2dC1+dSPiD1Nfk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766007859; c=relaxed/simple;
	bh=5gDLdPUqfRKQaq5zqHzuDam/dWy2AJw8JTH/g5F9gO0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p3Jd9aZuZDdvWwmYpcELjlWB3DxAUxPvXP/bh+xTLTwo+2QsRk2fyP8fWOsqpIo8SLQIJMDRWEDGp2k9Lh2O6jq1m56FBNF9I4KmAIkXq7I1BoaIA0yCpc4GSmaCXIj2u0/9Qhv9LgwoM+66AO+hctfEwIon5Au+pnKYJpFq2FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EBa9rtu/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBa9rtu/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766007857; x=1797543857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5gDLdPUqfRKQaq5zqHzuDam/dWy2AJw8JTH/g5F9gO0=;
  b=EBa9rtu/05Z5zYqblslH5eYHBlGxTSrgjsSir/aX3nj4B5MUuqcLJ01s
   huBRKWzEnGqTGnLTLX9Q+ns8QfHytMKr6ia3HW084noXW1kwLhIK/rPfC
   wioUnWZkRSRNMXozpdJ8qcCCoBoLnMW1yhbKYpYgm1bjqwNle38k16eQc
   TCHxShtUTI68SiTSHPbKdmbfJ3expMdkTq0Jcgb/1A304IJSrG7ga2Krn
   N008T//BkL9SSVYjhveaCsJTe26gRp6Itq5ItyW+n39Hao2v8WxkEPQO/
   IaJIbm2tyBmlTkfAbIoYDbFBmTvWXv10lhlFg2h/FJacMSIXahSYnKBnS
   w==;
X-CSE-ConnectionGUID: MCb6P0bkSTGbGj3BK7jBGg==
X-CSE-MsgGUID: NRCanHuiR42R9Oi4aUAonQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11645"; a="67998223"
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="67998223"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2025 13:44:16 -0800
X-CSE-ConnectionGUID: tlPvvL2aRgegh2WyCwnMaw==
X-CSE-MsgGUID: oWGEi4WTSUCyesjcSWL4Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,156,1763452800"; 
   d="scan'208";a="203499836"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 17 Dec 2025 13:44:15 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVzJc-000000001Gr-0fSV;
	Wed, 17 Dec 2025 21:44:12 +0000
Date: Thu, 18 Dec 2025 05:44:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 2/2] drivers/perf/arm-cmn.c:356:15:
 sparse: sparse: symbol 'arm_cmn_debugfs' was not declared. Should it be
 static?
Message-ID: <202512180530.DownGIbY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   d36711b0a31fb7c6682f53e306fa330cc0b125a2
commit: d2cfc10a38e4a45765fc93227da9a5826fba3734 [2/2] UPSTREAM: perf/arm-cmn: Add debugfs topology info
config: arm64-randconfig-r132-20251216 (https://download.01.org/0day-ci/archive/20251218/202512180530.DownGIbY-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251218/202512180530.DownGIbY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512180530.DownGIbY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm-cmn.c:356:15: sparse: sparse: symbol 'arm_cmn_debugfs' was not declared. Should it be static?
   drivers/perf/arm-cmn.c: note: in included file (through arch/arm64/include/asm/io.h, include/linux/io.h, include/linux/irq.h, ...):
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:379:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long long [usertype] val @@     got restricted __le64 [usertype] @@
   include/asm-generic/io.h:379:22: sparse:     expected unsigned long long [usertype] val
   include/asm-generic/io.h:379:22: sparse:     got restricted __le64 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:325:15: sparse: sparse: cast to restricted __le32
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:338:14: sparse: sparse: cast to restricted __le64
   include/asm-generic/io.h:369:22: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] @@
   include/asm-generic/io.h:369:22: sparse:     expected unsigned int [usertype] val
   include/asm-generic/io.h:369:22: sparse:     got restricted __le32 [usertype]

vim +/arm_cmn_debugfs +356 drivers/perf/arm-cmn.c

   355	
 > 356	struct dentry *arm_cmn_debugfs;
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
