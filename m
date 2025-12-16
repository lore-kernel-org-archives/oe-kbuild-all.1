Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA2B3451AB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 11:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765885502; cv=none; b=Qekr6WsVr/umDS/u8M8VyOv4SuVfCW5bislZK8seJxmLzOuotku5HrtIHQfwQlIlr8f6xLhynyBYvgdyCblWDv2hEGU6xl6z2U9KFgzGIed4fp4T2LJUV9dPm0NYoRXwiYmkLplj6Lo/Kci6w/NJISBPfN0kwEsmMfY4qpaOx78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765885502; c=relaxed/simple;
	bh=9ETBOOAJ6+9XIcFoH3OL/eNvz+bH0vjXeFvSsMoz64A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KrKQ5sTnfdHZIVrUK+Vdsh9TMwyzyn/lBxZYATxix7lWtWCBkO7wfSwT2e8gF3TEn8I/uSibvE4LKlR+Q+V70h3wFHl1KOPiyUKXdYSZyf8m57nXiiqIP4dj/XTvfOflVAyJIJGM5YOj2BqwH+4chcW4utKXCBfjNsZQIByJvrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PW8NYoWF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PW8NYoWF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765885500; x=1797421500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ETBOOAJ6+9XIcFoH3OL/eNvz+bH0vjXeFvSsMoz64A=;
  b=PW8NYoWF7+pwxNN8V8OOKEIF1G2eDhSnvA+oE30xzsJJLELBWDDSYzFZ
   YvMhCN7sJ+IL0kwnABNnNnUjDhfnpRA7GtUrx/LLeJGNGkSTuAbTTtYug
   biZXC9QEl6n+rvreT54Hjjyq+sk3XCwzUQgJ7zF8OU7fW41JfZvbHWj0e
   bKitcNMrvbFMHeK4VpmupaCtCsTr+rsQ94bRXBizDWdl8TlXxUx3esRFm
   nJWuGoigmLzWxH7QYJRDIlI8TY+gOBOxzqd3yU6hSo3sCJ4H6IIWbT3ij
   NtYImErmSs9uTDKVfaEaOPQKNRmLy0D6iPJjLPewbVXmcb/oCkuzR4pJD
   Q==;
X-CSE-ConnectionGUID: d5fmkrZNRyiJp39dUqDrBw==
X-CSE-MsgGUID: +gHOvSTsT9Ojx84DnAEjVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="93277186"
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="93277186"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 03:44:58 -0800
X-CSE-ConnectionGUID: 1hf9V9ccS/SWOfq8C26tZw==
X-CSE-MsgGUID: XOqrvgpXTL2yuTl6eHUCrA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,153,1763452800"; 
   d="scan'208";a="198804562"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 16 Dec 2025 03:44:57 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVTU6-000000001vA-3Ivc;
	Tue, 16 Dec 2025 11:44:54 +0000
Date: Tue, 16 Dec 2025 19:44:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1943/1943]
 arch/x86/events/zhaoxin/core.c:505:1: warning: attribute declaration must
 precede definition
Message-ID: <202512161945.q1Ihd2Pk-lkp@intel.com>
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
head:   49bc452fdcb1e9ec3f9bb20cd3e15b865a2933fd
commit: 0ce7c3b6e8a986ee9ef92a07ae18964835446c07 [1943/1943] x86/perf: Add hardware performance events support for Zhaoxin CPU.
config: x86_64-randconfig-005-20251216 (https://download.01.org/0day-ci/archive/20251216/202512161945.q1Ihd2Pk-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251216/202512161945.q1Ihd2Pk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512161945.q1Ihd2Pk-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:59:
   include/linux/compiler-clang.h:20:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      20 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:354:9: note: previous definition is here
     354 | #define __SANITIZE_ADDRESS__ 1
         |         ^
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
   3 warnings and 1 error generated.


vim +505 arch/x86/events/zhaoxin/core.c

   504	
 > 505	__init int zhaoxin_pmu_init(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
