Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B78A41D86F2
	for <oe-kbuild-all@lists.linux.dev>; Sun,  1 Dec 2024 21:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733088391; cv=none; b=iqWwO5BHZbz6Dgg2aboezERkBvDpohWcqaVJKdBaqzGRvnkmUlMwnp66JieY7IqhFVoPFeCb9XSdcSi3D7zaordWBbQhIsA7EUnG6yEpKZ2yL/UFR/Cg/0UCkoP/ceE1H2wcFsNBQiSS7jJpBW/Kn2CHTR3ohH2+oYavR69Poz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733088391; c=relaxed/simple;
	bh=9SRgZlXi3cqp16S18RspiJ6UTvavy6tmnRPbb72Sdmw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C0fxiflr+TZl98840657e9AJPmCbZ2F4sSVUnFviAeqYX02n7hXqUCNQE7z2TpYM8nb17jgG7qFgWpSZNNcBOSw+w8hkjJeDpo5BxXKqMSGFhQnIc9wxLUFET5mYUwGU+DUXmXOgPY2PkOxf91D20P+dNEVYqKqAoJEGYKJPaPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BeCjb8CN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BeCjb8CN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733088390; x=1764624390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9SRgZlXi3cqp16S18RspiJ6UTvavy6tmnRPbb72Sdmw=;
  b=BeCjb8CN++YmF6knH0iik4djSS0U+tu9SgG9DClXA/3Cdfai2nRGlK7V
   vMejw0RfoGUId8L/2VqaX5BM1rufTqYowtbEvWayjKI020BhhCoSDqx3z
   ZuERM4xshUMsGZ7VwpElNdOPyHY6uFjYc8bAMeTSWhSw27oUoJSEFVgRE
   5My7/WAqAzZahTdTZp9OxS7s5Y/E8UKbSZ3Kq6kF+cKMCYnQsCFGmdwOm
   EcLF2nM8t4AXme0PQQtw1KTAZ0Zxm1UgkchWyI0Yf9ZrXbN5cbr7A//Vo
   jtfwBXPWlEHCu8uX73+7gLQIFBv1IZZrI/peVHsMMjuL0KhWo/e/wXN3D
   w==;
X-CSE-ConnectionGUID: F3DfjJRXRliZbtpMnQQq3w==
X-CSE-MsgGUID: ME8Kx2EITlS0CIaNc9valQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="37021405"
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="37021405"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2024 13:26:26 -0800
X-CSE-ConnectionGUID: abZ7TI66TJCycAxspe3DrA==
X-CSE-MsgGUID: 2VXXlQW0S7yEOv7GJpHKeA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,201,1728975600"; 
   d="scan'208";a="93248817"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 01 Dec 2024 13:26:25 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHrSR-0001rJ-0U;
	Sun, 01 Dec 2024 21:26:23 +0000
Date: Mon, 2 Dec 2024 05:25:44 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1291/1291]
 arch/x86/events/zhaoxin/core.c:505:12: error: redefinition of
 'zhaoxin_pmu_init'
Message-ID: <202412020554.iOBx6LMV-lkp@intel.com>
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
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: 0ce7c3b6e8a986ee9ef92a07ae18964835446c07 [1291/1291] x86/perf: Add hardware performance events support for Zhaoxin CPU.
config: x86_64-randconfig-013-20241113 (https://download.01.org/0day-ci/archive/20241202/202412020554.iOBx6LMV-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412020554.iOBx6LMV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412020554.iOBx6LMV-lkp@intel.com/

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
