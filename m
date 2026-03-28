Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A84288D2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 00:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774658804; cv=none; b=IDT45dfwtZChABY6Hupi/N0w2XOYBvauaZIKgWCuQwOpwvg9XGMO/xCtS5hY4QujD6FhWD6ScHj0y1V66iqRprKnY0/JadQmnJdezMucOA5X+6GUIHu25nbhPxqRQIbfKiPh7dEeOtpwj05Zh3RZyBEvJUm23/+K6pP+mCl66f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774658804; c=relaxed/simple;
	bh=FPC63S/rF4Znk/vsa+vhmjXuHmMSS7QWOkvixB4rqoQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qKnrb79I/XdZwVDpGiNkWO6ygLNJh6prWWTHu8svOfsPxtRfXAjdv5RErhzGC6GOKe33jehUPmKvAbhwBRA6liBoDZQv8kyCw5EKZ4ZocHM8RS9BsbF1ErUPFH/ewR8EHqcvMuxz+3uuI2CqQNr/ShtQqusj26d8zuYywc9H4h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VpMe++ng; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VpMe++ng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774658802; x=1806194802;
  h=date:from:to:cc:subject:message-id;
  bh=FPC63S/rF4Znk/vsa+vhmjXuHmMSS7QWOkvixB4rqoQ=;
  b=VpMe++ngAsnoh5+4AN5caXxi+5uwoh6xDpMN0vQ6xyzHBuacglkch81f
   MGSHrHdxFpdAOOW9ujnmq/8RMas0kSXTCGyrDndBrDa0I2CpvypsMGa+b
   x2sVVeHVrhA9w+CpiGyxDjTY0Wf7Hi5Vkoyc6+ks5fqVKGeYHWSmRC+cQ
   MOxYoOe9zbFek8wz+xGqqi/4nu6DcXd4vB+todf5fXI55iXVWwD6+4Ygq
   tPhIMDgCu9N2W4jgy3P3MToErFUOEGbC2o6y1i/SBVM03MA7t+tJt3uC4
   TR6fN7QcMTqsqYFwFu+6H2JDnitzyGZzM5KEpAR+jbIC7yBSpRTNtVHam
   w==;
X-CSE-ConnectionGUID: QnluANyzTK+Swer5lqp2SQ==
X-CSE-MsgGUID: mjvCtOEiQyioT15fNjTrUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="101196585"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="101196585"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 17:46:41 -0700
X-CSE-ConnectionGUID: wkGKaf/WQuCQUcy+7vjO6A==
X-CSE-MsgGUID: ig12ntCdRtGvxdglxwtW+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="222148871"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 27 Mar 2026 17:46:40 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6Hp0-00000000AxN-2KS2;
	Sat, 28 Mar 2026 00:46:38 +0000
Date: Sat, 28 Mar 2026 08:46:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 14/14]
 mm/../drivers/staging/android/ashmem.h:20:20: warning:
 'RUST_CONST_HELPER___GFP_IO' defined but not used
Message-ID: <202603280853.KbsgyROu-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   adbff0436c47509e0fdb9e6a9cfa1db221f41c9f
commit: 453cb76c605cfc3405a95bee4888782c7218b92a [14/14] ANDROID: mm/memfd-ashmem-shim: Align ioctl handler name with Rust version
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260328/202603280853.KbsgyROu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603280853.KbsgyROu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603280853.KbsgyROu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from mm/shmem.c:95:
>> mm/../drivers/staging/android/ashmem.h:20:20: warning: 'RUST_CONST_HELPER___GFP_IO' defined but not used [-Wunused-const-variable=]
      20 | static const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/../drivers/staging/android/ashmem.h:19:20: warning: 'RUST_CONST_HELPER___GFP_FS' defined but not used [-Wunused-const-variable=]
      19 | static const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/RUST_CONST_HELPER___GFP_IO +20 mm/../drivers/staging/android/ashmem.h

    17	
    18	#include <linux/shrinker.h>
  > 19	static const gfp_t RUST_CONST_HELPER___GFP_FS = ___GFP_FS;
  > 20	static const gfp_t RUST_CONST_HELPER___GFP_IO = ___GFP_IO;
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
