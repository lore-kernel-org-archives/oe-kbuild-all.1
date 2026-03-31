Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB54240DFCA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 07:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941504; cv=none; b=VDeoQBhlOhP3UhwEwuVKxnpkTEcpIKE4rcFUv+fUj99wmxeuRgipr4UylAQrPC/uCv+arSg0EUBmGAJnRU3sfw+ZOgHKJS7g10pHl6Hgs/3tqBhDqYoEXrQtiDwFBjulE9tGJIfltJ534zQ1tNmiSF7bGIlYoHdn35jEKIU0YDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941504; c=relaxed/simple;
	bh=7fHquU+QxsKodTo8iQjAjOj7ah3WHL0VXjAUdNkRYIo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=WoYMXmn/NzcTZQZDndrOpgFHVah8sXK9g5aa3zF+uCfuRtMqZDS6KuQN+Jdw0y7DOpsnxHQk/euqO8Q07j1dG+8Deei7eIwbRdfUL3EiPwa1Lzfc2AxrwCuU5AAixTIe3WMPgLDqM+dS3j1FeyaojfhvYiq4BBOxozLuUhkjiCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NAytujK2; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NAytujK2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774941503; x=1806477503;
  h=date:from:to:cc:subject:message-id;
  bh=7fHquU+QxsKodTo8iQjAjOj7ah3WHL0VXjAUdNkRYIo=;
  b=NAytujK21U7J4ztRtn/WAUHqxPkMN7H+UhLEyaX0RfwbPpB4oSR4RzSf
   d3nJR96OUDmpFTp7b98m9e4OZozcxTQe+cnNGaGAz0mLmiTFxNe2Op6El
   p9yGGzRBDFnKLg1RuM4H48Xn49CvhFG6eKyZ6uMn4QO9ZWDxHWBpDcfKV
   m3qdbnQbbvrz+A5oifmAU9SGcVagttx5dnZKXoTuk0y7Uf27ROnCYlG73
   Sj//sYqa/lEecuhuImM3zrbd7/nENTie43u2wPRW8VSnUXue0K8exvX6l
   OW/GVUA/SoWF8JCAF5K8/CeFH4vAbp+HKAq+i+Dz5VsEFi6DHKxW6yGv+
   w==;
X-CSE-ConnectionGUID: lsfwxbkXRpa4m+5wYaNYXg==
X-CSE-MsgGUID: LnhlThAPTduSZUOPnov8/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="86245157"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="86245157"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2026 00:18:22 -0700
X-CSE-ConnectionGUID: jRiDhdscTJqzxO7PQHYLnQ==
X-CSE-MsgGUID: xGGBHWlfSWq27GoTdq2ujg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226161563"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 31 Mar 2026 00:18:21 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7TMg-000000002M3-1Ftu;
	Tue, 31 Mar 2026 07:18:18 +0000
Date: Tue, 31 Mar 2026 15:17:47 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 arch/arm64/kvm/pkvm.c:70:3: warning: unused variable 'host_s2_mode'
Message-ID: <202603311525.cZcOlkBP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   e11a237a359eaf99627d25e0c1f026d9a108cf96
commit: a834e9b6ddb8d401b3ded1fb0bf4906024f99228 [2/2] ANDROID: KVM: arm64: Add kvm-arm.host_s2 cmdline knob
config: arm64-randconfig-002-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311525.cZcOlkBP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260331/202603311525.cZcOlkBP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311525.cZcOlkBP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/arm64/kvm/pkvm.c:1063:6: warning: variable 'pages' set but not used [-Wunused-but-set-variable]
    1063 |         u64 pages, nr_busy;
         |             ^
>> arch/arm64/kvm/pkvm.c:70:3: warning: unused variable 'host_s2_mode' [-Wunused-variable]
      70 | } host_s2_mode;
         |   ^~~~~~~~~~~~
   2 warnings generated.


vim +/host_s2_mode +70 arch/arm64/kvm/pkvm.c

    66	
    67	static enum {
    68		PKVM_HOST_S2_CMA,
    69		PKVM_HOST_S2_CARVEOUT,
  > 70	} host_s2_mode;
    71	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
