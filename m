Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C773D60
	for <oe-kbuild-all@lists.linux.dev>; Sat, 20 Jan 2024 10:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705747720; cv=none; b=UbvdjHKxphF/K/zzMg1hykS2rGDYAzVAuE3XyfxJiMx4DtdG5+IgVW6FOtP256MUTgYsskdnANMW0R/be7eIckAzcPS5HOVPbhiDEPnnp0P9+3pX/5FZDaHbi6zwgRVXuUwnTdMFNac3daJiN0Efei5O8byngmhS+SX40Awwc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705747720; c=relaxed/simple;
	bh=4y9+LkUAJou2a/p3S+WeFtJ7U51sDiXmXeMHQvyBZAo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AOgJNdw5tczH0RtTvo2CxDHoZ5w0CQCTnOIX9ID0+Gsv1eZMR/5uh+lZUnShHGcTlT4pD6zaAB0i+Xpx8Rigvp1xGZdb9AzZMEtDT0PSOMGqD1AUlSLwX/Qn+9vdyQMOEbcrFn5QAPw+N1+oJkgx8Hm76J1/l0D3eXe6eQOf8+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OLRCGrqs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OLRCGrqs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705747719; x=1737283719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4y9+LkUAJou2a/p3S+WeFtJ7U51sDiXmXeMHQvyBZAo=;
  b=OLRCGrqsLUPEJbYb39uByf95pd7ckFxSZRqb0aghUIRQx0m1bM6K0CbK
   XVXhBO7lFJll7o8eK+vZhPVH+dZw7F+Fh1zF7Mr6td0uyXEY23ue4HJiW
   ElyHgpMfvQhHla1g81U53Lkufbs8mx0Wk9XSUHcXMfomQietNJMtIohLR
   c9XKK2WKxP+LIum+vVkbUDQU1UFZxv7FObljkrd8EAZUMyCC/r3G/psIz
   iw7KPrL++iLzDrge+CgBo74VgRTs8UX6hS5qYxuFq5mH9SDLNVzzEib3K
   IX3v1qJ00IyJ7cYO3Z17r3xpxAydDXDq+nDM6Pg7f1V8k7B6Bsw+cuLby
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="823697"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="823697"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 02:48:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10957"; a="928596428"
X-IronPort-AV: E=Sophos;i="6.05,207,1701158400"; 
   d="scan'208";a="928596428"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 20 Jan 2024 02:48:36 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rR8tu-00051G-1D;
	Sat, 20 Jan 2024 10:48:34 +0000
Date: Sat, 20 Jan 2024 18:48:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15515/21561]
 arch/x86/events/zhaoxin/core.c:505:1: warning: attribute declaration must
 precede definition
Message-ID: <202401201844.FPamnRdN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   0d29fbb6f9321a629cbf0ca30f15ce6f333ed7b9
commit: 0ce7c3b6e8a986ee9ef92a07ae18964835446c07 [15515/21561] x86/perf: Add hardware performance events support for Zhaoxin CPU.
config: x86_64-randconfig-014-20240120 (https://download.01.org/0day-ci/archive/20240120/202401201844.FPamnRdN-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240120/202401201844.FPamnRdN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401201844.FPamnRdN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/events/zhaoxin/core.c:505:1: warning: attribute declaration must precede definition [-Wignored-attributes]
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
>> arch/x86/events/zhaoxin/core.c:505:1: warning: attribute declaration must precede definition [-Wignored-attributes]
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
   arch/x86/events/zhaoxin/core.c:505:12: error: redefinition of 'zhaoxin_pmu_init'
     505 | __init int zhaoxin_pmu_init(void)
         |            ^
   arch/x86/events/zhaoxin/../perf_event.h:1054:19: note: previous definition is here
    1054 | static inline int zhaoxin_pmu_init(void)
         |                   ^
   2 warnings and 1 error generated.


vim +505 arch/x86/events/zhaoxin/core.c

   504	
 > 505	__init int zhaoxin_pmu_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
