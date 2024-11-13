Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F95812C484
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 08:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731485206; cv=none; b=ad7QUTOawgAAbg9Zn6u6OALRO7oGJKld7XwifyWpZYJrGv54niUwhlab8p10w6Tpn52AeJI3SfZur4tQe5TE2OM80nUxjpFS+HKOJfIthyLREHdEi040zd5flawH/SwH3DcmJAeyyyCauKhlZ2UXA7qaaKZ8quEXUJbMlxZIItc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731485206; c=relaxed/simple;
	bh=sZq9CHpbq99YmNcGSXRCHPHwkNXJyZsO73J9BW69mig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EwgRAtPb/zQdIaga13LG03mhFywC7qu0S6rqDqcXb/6Jw0lV62Ml/RkgvTNQOLZTMBvihs1GBxGEAmTy3oR/VS1ycYZcewgRf6hI4pNdL58xsUDXcXtVQ5K4oIM7ooq8Cc/WZOSLCwYOFSbfx9oR2seOXEoPj/QA0KNjHcZfllw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cn1XO4tD; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cn1XO4tD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731485204; x=1763021204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sZq9CHpbq99YmNcGSXRCHPHwkNXJyZsO73J9BW69mig=;
  b=cn1XO4tDo5uQXUdrxcbJgHYvXB82nP1TV7EoSt9fqS0Cqu0e+g60FQYj
   zcjjK8UTOCf0PknKZ3ea708elu6SNI1rIjCXjU/ATtF0hAjcFYdNDo05v
   OsMRDS/eatfX1ySSs/uRMxrEraBdbo7D1YhvoXWHHcjL3me0DOB+MSv3l
   hhgAR8sQgM9iwn4NX3WALPQu9+0RY11OnWaBuZhJ5eCeGfWRQ9bB/k/SF
   ufXjD/JmRXCrur5wQJzbw3rZhknl9jtlgiXeEb7Hr6pUFPFJ974i/ScMQ
   00g3Q32MWCtVdj6DWxeIH+MgyteI4T/H+kOpH0VmGvPBsIdmYHINNQKgu
   Q==;
X-CSE-ConnectionGUID: m8uIt/hzTe+XZjkeLBfqfA==
X-CSE-MsgGUID: 07Qx8dHnS/Strfm0YNgmvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11254"; a="42756136"
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="42756136"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 00:06:39 -0800
X-CSE-ConnectionGUID: YBz2rNWHQUeD2t+yqLT6Zg==
X-CSE-MsgGUID: FZ6FXe+2SPO7Kkx6JvkTPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,150,1728975600"; 
   d="scan'208";a="87696112"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 13 Nov 2024 00:06:38 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tB8OZ-00007v-25;
	Wed, 13 Nov 2024 08:06:35 +0000
Date: Wed, 13 Nov 2024 16:05:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291]
 arch/x86/events/zhaoxin/core.c:505:12: error: redefinition of
 'zhaoxin_pmu_init'
Message-ID: <202411131657.OqTk2Uu6-lkp@intel.com>
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
head:   d047cc727adb896a530936ced8c98485e6654a11
commit: 0ce7c3b6e8a986ee9ef92a07ae18964835446c07 [1291/1291] x86/perf: Add hardware performance events support for Zhaoxin CPU.
config: x86_64-randconfig-013-20241113 (https://download.01.org/0day-ci/archive/20241113/202411131657.OqTk2Uu6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241113/202411131657.OqTk2Uu6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131657.OqTk2Uu6-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/events/zhaoxin/core.c:505:1: warning: attribute declaration must precede definition [-Wignored-attributes]
     505 | __init int zhaoxin_pmu_init(void)
         | ^
   include/linux/init.h:50:17: note: expanded from macro '__init'
      50 | #define __init          __section(.init.text) __cold  __latent_entropy __noinitretpoline
         |                         ^
   include/linux/compiler_types.h:222:38: note: expanded from macro '__section'
     222 | #define __section(S)            __attribute__((__section__(#S)))
         |                                                ^
   arch/x86/events/zhaoxin/../perf_event.h:1054:19: note: previous definition is here
    1054 | static inline int zhaoxin_pmu_init(void)
         |                   ^
   arch/x86/events/zhaoxin/core.c:505:1: warning: attribute declaration must precede definition [-Wignored-attributes]
     505 | __init int zhaoxin_pmu_init(void)
         | ^
   include/linux/init.h:50:39: note: expanded from macro '__init'
      50 | #define __init          __section(.init.text) __cold  __latent_entropy __noinitretpoline
         |                                               ^
   include/linux/compiler_types.h:221:33: note: expanded from macro '__cold'
     221 | #define __cold                  __attribute__((cold))
         |                                                ^
   arch/x86/events/zhaoxin/../perf_event.h:1054:19: note: previous definition is here
    1054 | static inline int zhaoxin_pmu_init(void)
         |                   ^
>> arch/x86/events/zhaoxin/core.c:505:12: error: redefinition of 'zhaoxin_pmu_init'
     505 | __init int zhaoxin_pmu_init(void)
         |            ^
   arch/x86/events/zhaoxin/../perf_event.h:1054:19: note: previous definition is here
    1054 | static inline int zhaoxin_pmu_init(void)
         |                   ^
   2 warnings and 1 error generated.


vim +/zhaoxin_pmu_init +505 arch/x86/events/zhaoxin/core.c

   504	
 > 505	__init int zhaoxin_pmu_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
