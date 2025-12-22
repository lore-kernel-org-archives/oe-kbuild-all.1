Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4921513959D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 09:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766395236; cv=none; b=XTlnsCtFT7GXNkv3l+NzJO97MyGBC6mf88VQQrIO6EhoJsDOQoaP+/dRfxreiuE6gxcKDHR7B2mpNcQyHlzvZcgFx0GBqFhY9PB92k6oWpLS8eFj3ylHWv4ApNTeAO4q7YBFf43lZjzeLIoZSdW2S0QRbTFk9wYL6cM5pPBT5jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766395236; c=relaxed/simple;
	bh=95IsifK7liZtQSaKsiyETFZ6drVOOzSqCOlDPEbmZZI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m4VII64gQrzQ78vxqDSrADIK9Hbcw07bxuDIWwr70Pr0Rg/kklbOSykBpOb0HEtZws9nwf4kGQF68zxXsgvEKYs5M4zzPiqFA53RD1UhbVWcsHWsAtmEXEtRRqa+T/8QznNbYLpEgCi8/3t718S6vd3YBOCjpsou/fzBhbqXFKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T1/okQE8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T1/okQE8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766395234; x=1797931234;
  h=date:from:to:cc:subject:message-id;
  bh=95IsifK7liZtQSaKsiyETFZ6drVOOzSqCOlDPEbmZZI=;
  b=T1/okQE8BXeaI9lULirYT+Kza+6/qUIv8X2c6Q1GUABT4WJTJMbnil3G
   uQ+WYNKWOPrw27T1ZMLjSYXqNC1jvmz7bKgc2iN845SScx1DVfJ1wcNAW
   ZM+cBq1rcXxlTEsDVDrmp3xD4szwP9GH3um89fe/0T07gyebbwviIDXNk
   e65a+dm5s4c6szAGyhy5WOcNghARTcfItjDg4Cp6C98fVHdl7XOxWfLrq
   kSUlNEp9T7Fa5mVmpN/klbWdDytkI4TE9hKr5UAmUpzGfa19PfvfIYwos
   KAkxekkZuB9WK6iRhlmjvpU51Uc2RcRLo8T5PygPCiYbzENgBmR1du8Sk
   A==;
X-CSE-ConnectionGUID: sfEJYacTTceRmnNUPgfIZQ==
X-CSE-MsgGUID: hkPKg5u4RkiNuT7zntEY9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68293323"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68293323"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 01:20:34 -0800
X-CSE-ConnectionGUID: ITZcT7a+SjqgmnfNOACdYw==
X-CSE-MsgGUID: Pc5AvmnuQGWCTPZDxV+jmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199392416"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Dec 2025 01:20:32 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXc5W-000000000Jn-2yyk;
	Mon, 22 Dec 2025 09:20:24 +0000
Date: Mon, 22 Dec 2025 17:19:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 3415/3415]
 drivers/mfd/atmel-flexcom.c:108:32: warning: unused variable
 'atmel_flexcom_pm_ops'
Message-ID: <202512221707.MaznwzGq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   1588d318a9e388d05b6cf5e2a63134c8beb6a355
commit: 1308eef0cd1cb33d5a64a3540b7e73873d9be0f3 [3415/3415] mfd: atmel-flexcom: Use .resume_noirq
config: x86_64-randconfig-072-20251215 (https://download.01.org/0day-ci/archive/20251222/202512221707.MaznwzGq-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 1335a05ab8bc8339ce24be3a9da89d8c3f4e0571)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221707.MaznwzGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221707.MaznwzGq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:2:
   In file included from include/linux/compiler_types.h:69:
   include/linux/compiler-clang.h:34:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      34 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:352:9: note: previous definition is here
     352 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/mfd/atmel-flexcom.c:108:32: warning: unused variable 'atmel_flexcom_pm_ops' [-Wunused-const-variable]
     108 | static const struct dev_pm_ops atmel_flexcom_pm_ops = {
         |                                ^~~~~~~~~~~~~~~~~~~~
   2 warnings generated.


vim +/atmel_flexcom_pm_ops +108 drivers/mfd/atmel-flexcom.c

   107	
 > 108	static const struct dev_pm_ops atmel_flexcom_pm_ops = {
   109		.resume_noirq = atmel_flexcom_resume_noirq,
   110	};
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
