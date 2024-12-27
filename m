Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19DE11CA9
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 22:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735339257; cv=none; b=qtVl2C8uIzVVogja8b4PHzovyaEwNQh/EpDNNNBRf+0ZwdXzeKYxAhSFcYS4QA1m6Zuww1nU5yY26d5nuPwMDzw5thSFejWsC+sNSkOLBqEDRtWGB1E/ogCg9QXLPp2kADeuGlj3mjP0mg8JtXCXDZXJYb68AcwqQrS5bM9OqtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735339257; c=relaxed/simple;
	bh=tjTdbrVua4j0N44IYZidACMpI6zWbeF/KGx5BdcZCWE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iXbNqY9KswK728xzXgsPg2niAfTwtBu04Tqcj/CGum3CMkNk9tzl1icR5Kj6dTqdlfvMVkGEMbu+YsKLkK2EQIvnLTnG3Bs/Ddsp0OpnU169rAx01TGgr3PZISliG3gzMA2s7se08G5CG/r1VnY87FloqlOydXkjoKDv8zl6/Ms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DFuANs94; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DFuANs94"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735339255; x=1766875255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tjTdbrVua4j0N44IYZidACMpI6zWbeF/KGx5BdcZCWE=;
  b=DFuANs94z2gy1FEELl+YT6Hs2GBCBi7qV6odCj33r1u9pL9oCQSqtBt2
   eWkEdSQVXV689sGmxKgIUuMyOw53Q2r2x0R7EO7YxpaevLYCuWwLQroPp
   AWLXvIu8NdpNeVA0YpNWzJq9Y1STUjXCsfBW3XJoapyP9EXJZSyMeVbeJ
   tzH3WXJjPXTUeZsrZjejm1dvjm6imS4JDwFELWmy3P8JBs0PZciBPX243
   oS4szESV0IvZK0VzVdNOkHnIDQNwUXzjYqH15mPwdjHg5XV2FfJbn4iy4
   +ZBe1YzlRuUvwR4GqECHOQZIypnWzyMtFZM0Pwg+v1nYpwktm4/tTkoai
   g==;
X-CSE-ConnectionGUID: j0JIS220SPyQZBi9nUtHNQ==
X-CSE-MsgGUID: gZMrioN+S7WCuevUJ08z0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39669794"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="39669794"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 14:40:54 -0800
X-CSE-ConnectionGUID: 4JoaUxxNQ62W2B+Ut1aI2g==
X-CSE-MsgGUID: IKNqBkP9RZSZl+YWZCsQ3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="123536514"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 27 Dec 2024 14:40:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRJ0l-0003hQ-0f;
	Fri, 27 Dec 2024 22:40:51 +0000
Date: Sat, 28 Dec 2024 06:40:21 +0800
From: kernel test robot <lkp@intel.com>
To: Xin3 Li <xin3.li@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [xinli-intel-fred-public:fix_sp_calculation 13/13] clang diag:
 include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only
 applies to functions
Message-ID: <202412280657.OUjgtLtS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/xinli-intel/linux-fred-public.git fix_sp_calculation
head:   04e87989806be09036718fa57acd80ea138c2319
commit: 04e87989806be09036718fa57acd80ea138c2319 [13/13] x86/msr: Use the alternatives mechanism to call Xen MSR APIs
config: x86_64-buildonly-randconfig-004-20241228 (https://download.01.org/0day-ci/archive/20241228/202412280657.OUjgtLtS-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280657.OUjgtLtS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280657.OUjgtLtS-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
--
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:10:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:345:2: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
     345 |         __cold;
         |         ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
     113 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:10:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:568:2: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
     568 |         __cold;
         |         ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
     113 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:10:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:594:2: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
     594 |         __cold;
         |         ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
     113 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:10:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:636:2: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
     636 |         __cold;
         |         ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
     113 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   In file included from rust/helpers/helpers.c:10:
   In file included from rust/helpers/blk.c:3:
   In file included from include/linux/blk-mq.h:5:
   In file included from include/linux/blkdev.h:9:
   In file included from include/linux/blk_types.h:10:
   In file included from include/linux/bvec.h:10:
   In file included from include/linux/highmem.h:5:
   In file included from include/linux/fs.h:10:
   In file included from include/linux/stat.h:19:
   In file included from include/linux/time.h:60:
   In file included from include/linux/time32.h:13:
   In file included from include/linux/timex.h:67:
   In file included from arch/x86/include/asm/timex.h:6:
   In file included from arch/x86/include/asm/tsc.h:10:
   arch/x86/include/asm/msr.h:671:2: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
     671 |         __cold;
         |         ^
   include/linux/compiler_types.h:113:34: note: expanded from macro '__cold'
     113 | #define __cold                          __attribute__((__cold__))
         |                                                        ^
   8 warnings generated.
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
>> clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
   clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
   clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
   clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]
   clang diag: include/linux/compiler_types.h:113:34: warning: '__cold__' attribute only applies to functions [-Wignored-attributes]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
