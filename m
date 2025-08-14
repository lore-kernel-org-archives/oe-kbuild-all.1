Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF55678F2B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Aug 2025 18:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755196055; cv=none; b=d3l+lkOPIT/VRmGuVYW0IzOjf09mBGlHPs0CpHFLxyTYhL81g7eso6Xa5ndkx7HHucN7hAprym44AV+egI2+RfGeTOBJauk2hGRPYs7ntyLG+00nz5n8lwaSU0okhuWf8dGTONLZpxl9+s9/j3DRR/Boknu+7cVGTDjwgr/io8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755196055; c=relaxed/simple;
	bh=KyxJBaDRQmYmb9wEO8EAXLQ968kIHdlkpxN7jhH+4hU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uSlCppushwfE2xvEDWntzfBjZ4dWnJPxvDWktvO0agB87DVgXp+nn13cTuhVOcl7ddYLrWjhL3gO+UYY1An3exuB8gFE6z8Exk3qOcLH/lA3AT4oobbkrGFNrol+QI9n1ry/jN8eJjEZMLZ1KW71Ss89kBoJaTePgq7PT1RMdxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aIEDVcu1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aIEDVcu1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755196054; x=1786732054;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KyxJBaDRQmYmb9wEO8EAXLQ968kIHdlkpxN7jhH+4hU=;
  b=aIEDVcu1h+rnxUQVQSVHNXFV0QR2pPHWjoSqwxJl/YPm+OJ+yudhnmOh
   gc2mpxC8/XKRbNuWZnzBnMhuIqwL/jskQUzhIBD4EbN2ZJiUCdV9peXbn
   kwid8ROUgdh9nnI+mNnX77jm0kyaSnxPDc+E9duoqK6Kwi9J6/rOwlHBY
   sbUI6RMVZ4wn7fInNekd2uyfUH84O7P4ktJXMTFLR+dMFhdCKNgCMF0TP
   xX4rYcTZfbmIUHZ5m8VTKG3bWWNFKsL1vxNMitSiB/zgU4QK6c3bj+YWn
   3yQD2ST9k1+WZOBAECZ0fsnHkLd877pRHLrRZ0lmwZ2UhcVttK2y12Zw8
   Q==;
X-CSE-ConnectionGUID: RSE9Up8WSgi93N5NhI4rBw==
X-CSE-MsgGUID: MrO2Gs41Q8alszD8peqYxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11522"; a="80100188"
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="80100188"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2025 11:27:34 -0700
X-CSE-ConnectionGUID: K0R3rqgfTTGTfUFr4oGTyw==
X-CSE-MsgGUID: izaDUrkyTeKkav1I70OEZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,290,1747724400"; 
   d="scan'208";a="166046483"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 14 Aug 2025 11:27:32 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1umcfi-000BEk-09;
	Thu, 14 Aug 2025 18:27:30 +0000
Date: Fri, 15 Aug 2025 02:27:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, GONG Ruiqi <gongruiqi1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2679/2679] arch/arm64/kernel/bpf-rvi.c:28:25:
 warning: no previous prototype for function 'bpf_arch_flags'
Message-ID: <202508150218.QwK6mXQc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   43d8c124ec4624389b14d42595e5f0195e3e5a1d
commit: 34f3240c8b4a8e1f0531d169c96420eef2e0c8ac [2679/2679] bpf-rvi: arm64: Add bpf_arch_flags kunc for arm64
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250815/202508150218.QwK6mXQc-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250815/202508150218.QwK6mXQc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508150218.QwK6mXQc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kernel/bpf-rvi.c:14:6: warning: no previous prototype for function 'bpf_arm64_cpu_have_feature' [-Wmissing-prototypes]
      14 | bool bpf_arm64_cpu_have_feature(unsigned int num)
         |      ^
   arch/arm64/kernel/bpf-rvi.c:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      14 | bool bpf_arm64_cpu_have_feature(unsigned int num)
         | ^
         | static 
>> arch/arm64/kernel/bpf-rvi.c:28:25: warning: no previous prototype for function 'bpf_arch_flags' [-Wmissing-prototypes]
      28 | __bpf_kfunc const char *bpf_arch_flags(enum arch_flags_type t, int i)
         |                         ^
   arch/arm64/kernel/bpf-rvi.c:28:19: note: declare 'static' if the function is not intended to be used outside of this translation unit
      28 | __bpf_kfunc const char *bpf_arch_flags(enum arch_flags_type t, int i)
         |                   ^
         |                   static 
   2 warnings generated.


vim +/bpf_arch_flags +28 arch/arm64/kernel/bpf-rvi.c

    27	
  > 28	__bpf_kfunc const char *bpf_arch_flags(enum arch_flags_type t, int i)
    29	{
    30		switch (t) {
    31		case ARM64_HWCAP:
    32			return hwcap_str[i];
    33		case ARM64_HWCAP_SIZE:
    34			return (void *)ARRAY_SIZE(hwcap_str);
    35		case ARM64_COMPAT_HWCAP:
    36			return compat_hwcap_str[i];
    37		case ARM64_COMPAT_HWCAP_SIZE:
    38			return (void *)ARRAY_SIZE(compat_hwcap_str);
    39		case ARM64_COMPAT_HWCAP2:
    40			return compat_hwcap2_str[i];
    41		case ARM64_COMPAT_HWCAP2_SIZE:
    42			return (void *)ARRAY_SIZE(compat_hwcap2_str);
    43		default:
    44			return NULL;
    45		}
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
