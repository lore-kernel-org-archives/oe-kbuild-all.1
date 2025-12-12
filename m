Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D843B8D68
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 00:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765497778; cv=none; b=SEAfNyzVydjI3bMa6mdRcy4liompiSjjqpbgp58/S5NYnizfSHZAuaGPkGag1SSu8FcSfWv0YeLjxZqiTV7QxNmfowjIi4gUr3r8R3InhEy0mkGeKBbcsm/1vLztOXfjSi/zal5xFhuvdRA8bd7GsMl8nx/20xGbzm0MmSIliSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765497778; c=relaxed/simple;
	bh=I3ztcnz4qDT5Trgh717FSqyy4Gfm8Kwh/0hQlsM8UFU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ChiacaspMdNOf13pj0RIQYNUvGbLL4fOI0K8iCUyldV/cHAGv0c5sp4p2d7qFZJQ4J72GTLWEieS7PhJ1ZbnkE+0QNeQdoBANBmgzxYbkSbQX8YxmyCnIzrYWxd0z23F6Ne1IzOvIbV2sd+TT8fvEOPEvOQ5HFQIqAzs0AOJO4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JBEHzBQQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JBEHzBQQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765497777; x=1797033777;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I3ztcnz4qDT5Trgh717FSqyy4Gfm8Kwh/0hQlsM8UFU=;
  b=JBEHzBQQg90ychnCygWpbWQfddj84jlL/IJ7+vr3dWoqiWxyYYvZd4ea
   eH+knL+Sc1GkWYDKtx52zGFYPFtLVdrumMUH2OOev4EKUgQ00z2HqmlU4
   aChPMKZL3WCTIsZ7l7yA8aeQYwXKHoOVajioTBORFXqPkXlz+Kg9Yzs9H
   jhgDM4bwfq55Xs3vEx2ceFl9v0c/R3Qk57PWwVRy87pITfNUpaCEkjNn/
   qK1XUgtiNiFHW0jjldC8x2EjZMz6pWJNR7M0exuoSXULXX6jWur+bl6hm
   TWk7/myc3fwvdAYw8NeOG1jBnQkHj6AywzPaZ6zbNizlBKO8TYniBNsw4
   A==;
X-CSE-ConnectionGUID: 8tFCHVZzQZmDMxJvpg6B6Q==
X-CSE-MsgGUID: 7L/YP2kITWqBCWMppZw8Jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67565721"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67565721"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 16:02:56 -0800
X-CSE-ConnectionGUID: Mpb2h+kJTNqq+ypkhl95Hw==
X-CSE-MsgGUID: WWYVwUn7QsecbzNU99HktQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201098090"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2025 16:02:55 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqcW-000000001FM-2BOZ;
	Fri, 12 Dec 2025 00:02:52 +0000
Date: Fri, 12 Dec 2025 01:02:25 +0100
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Yu <serein.chengyu@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3534/3534] kernel/sched/debug.c:102:12: warning:
 no previous prototype for function 'is_prefer_numa'
Message-ID: <202512120101.AycyCkRN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5930fa3740c518a9f6ba688fd0c1873d6f3adbce
commit: 0f22304e62d360fce47988586d599e33895ccb01 [3534/3534] sched: Support NUMA parallel scheduling for multiple processes
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251212/202512120101.AycyCkRN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4125e73cdc6188cca4c1c72b72e2b2d85c157483)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120101.AycyCkRN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512120101.AycyCkRN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from ././include/linux/compiler_types.h:150:
   ./include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:367:9: note: previous definition is here
     367 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from kernel/sched/build_utility.c:73:
>> kernel/sched/debug.c:102:12: warning: no previous prototype for function 'is_prefer_numa' [-Wmissing-prototypes]
     102 | int __weak is_prefer_numa(void)
         |            ^
   kernel/sched/debug.c:102:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     102 | int __weak is_prefer_numa(void)
         | ^
         | static 
   2 warnings generated.


vim +/is_prefer_numa +102 kernel/sched/debug.c

   101	
 > 102	int __weak is_prefer_numa(void)
   103	{
   104		return 0;
   105	}
   106	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
