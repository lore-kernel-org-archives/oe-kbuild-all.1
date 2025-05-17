Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BDB442C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 May 2025 06:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747461612; cv=none; b=dFVpmmCzxasgutj+wS2D2JugmToD87JDueixgnDyzXANt6SzQCS3L43RfoSSSUgnSsJfEBVYupkgsDvBqMBVQ1EtzaisITwL5LJ4763JXgwiCyD9tgWdHl7Qn2VMT2BmzBjyVGwBHUSu+DrMNKUHsMRW7iPE0U4l9B2VNvNehOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747461612; c=relaxed/simple;
	bh=xMJpRX7P1nu70rRpp7OI0B/kwrSTmiOOMsIBuNkqr30=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rogIGXUB/rob53avinvoFxRozmcgi7dgaGJmxJAew+7DOAZ1EgcGwopgF12VbI+62bcZTugfHMpBjWUJ+HRDD+phsvyQZnwCCw4W4rG2/tPZinrelFJ1KsScq3Ib9N6ieFl8JJk39abbHyiEwwN7KnxManq962I7XtSPmnLH52g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQI1vmSM; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQI1vmSM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747461610; x=1778997610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xMJpRX7P1nu70rRpp7OI0B/kwrSTmiOOMsIBuNkqr30=;
  b=jQI1vmSMibzUci1rQqGETmUjpOzcD8uJwDdkLAWXEDbLLbHFQfjrZAsQ
   il//RpDB3Xzg0Q2eXzMWs3XEDzeIG84x/Xq6DhPlbN0AkmnArnO+NhpZ1
   lOQitZX6j/eEL/NjVX0dkV+izl253c6LEd0RT93mfGn7FyR7BJQSUagWH
   kc8yhsVaBgPSpWU/ISR1evR0UivqsHSfByO5R1hJpR2M3TjEa9rCQeH8a
   yBiKKOsv87325Y3iZ2Q6OLQX88H5L6aKVAAioClE/tB5EaHws5ojwcMO4
   yuwKfwnCUL3Kt0v6jDwORZ5/sBLCxX6zZoU8TGnnqGflYaTlgm+JKvQ6U
   Q==;
X-CSE-ConnectionGUID: ENuF4nOFQmuDZvIVMFei6Q==
X-CSE-MsgGUID: F2u1h8DsSJisT49/xjQQzQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11435"; a="53236650"
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="53236650"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 May 2025 23:00:09 -0700
X-CSE-ConnectionGUID: 5gjfVPF1Rh6ixOFsK8B0fw==
X-CSE-MsgGUID: kl0JiyNsRR+Pa59EFpnz9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,296,1739865600"; 
   d="scan'208";a="143670792"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 May 2025 23:00:08 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGAac-000Jxw-0I;
	Sat, 17 May 2025 06:00:06 +0000
Date: Sat, 17 May 2025 13:59:23 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 141/141] include/linux/mmzone.h:
 linux/android_kabi.h is included more than once.
Message-ID: <202505171322.53Yjhc4G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   147b27e8d66c20bee7541b52cd32243cd495c94c
commit: e80ed6bcfb0903613f0a006b20175087cf6c3f3a [141/141] ANDROID: GKI: Add memory reclaim ABI padding
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505171322.53Yjhc4G-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> include/linux/mmzone.h: linux/android_kabi.h is included more than once.

vim +8 include/linux/mmzone.h

     7	
   > 8	#include <linux/android_kabi.h>
     9	#include <linux/spinlock.h>
    10	#include <linux/list.h>
    11	#include <linux/list_nulls.h>
    12	#include <linux/wait.h>
    13	#include <linux/bitops.h>
    14	#include <linux/cache.h>
    15	#include <linux/threads.h>
    16	#include <linux/numa.h>
    17	#include <linux/init.h>
    18	#include <linux/seqlock.h>
    19	#include <linux/nodemask.h>
    20	#include <linux/pageblock-flags.h>
    21	#include <linux/page-flags-layout.h>
    22	#include <linux/atomic.h>
    23	#include <linux/mm_types.h>
    24	#include <linux/page-flags.h>
    25	#include <linux/local_lock.h>
    26	#include <linux/zswap.h>
  > 27	#include <linux/android_kabi.h>
    28	#include <asm/page.h>
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
