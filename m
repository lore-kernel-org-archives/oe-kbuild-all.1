Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 241523AE6FF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Mar 2026 11:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772538190; cv=none; b=h9DIKiWqpx45fWZWkbu6KSonLpL+REVJTA9Sm8TBTaYQzPrIp48QP6LySRn74IQdj/FPO5yh9A2ew5dtGj605U6M/wgFl949zE/H9bCzLrvjxntpr7eh7hIRaQD1OIRW80UZe3FqE+XX2qdYuLQn7xsNTXbLb5DB4tN2Zni7jic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772538190; c=relaxed/simple;
	bh=Q4xTvuB8laG7GvQcf26AaUlNslK2iJQtKd++ylMBGfM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pei4AHxIUdm6cMVBC+0JDZOEj3VzqgWybp2zC9bHg1dSKo1FBYWwNkLUe9/de3IAF0JniGASHC3vZLGEUGf/dFOy1G9ChIn5F+5kfh2CroR90yIbhfwxxE31KLovNGiV8KMjge00MVVEF2+f0kODEggZiOEc4pXA+R9HjjAF7dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hroFpSU8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hroFpSU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772538186; x=1804074186;
  h=date:from:to:cc:subject:message-id;
  bh=Q4xTvuB8laG7GvQcf26AaUlNslK2iJQtKd++ylMBGfM=;
  b=hroFpSU8mol0t1V3NESRUAVYx34Qi9Sp635OpsYd88q1Fbe4OOmtzaab
   d94LAruwciibB+eWEW9Usf93VNBXE5N3CG71y1jbqTemWiaFWFg8jk3l+
   VWy5uH2yazGIZhAIQjcNE1N/3qb3XALZWKqOoqW/kDZDp4Wa0ubRpXMXK
   IrKWgMreYesamRvxxxvT7alidOiM9rFPovLw3Cf2caQ3r0x0Z/cbpvmpv
   VgR1Z3fmWE9nGlX1lDQMakulTEi+8u6kAqXDHqf5WYXpLBJhRlCjAVRou
   vOn4VluIp3ZeGSo1iyelMP29pgp2g0fFyVVLhZlUVM9McOos7czFru0xZ
   w==;
X-CSE-ConnectionGUID: sAK7F3M9T9O3LvtjYCad0Q==
X-CSE-MsgGUID: GvkiX1NGRIm209PxcBtfYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="83911424"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="83911424"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 03:43:06 -0800
X-CSE-ConnectionGUID: Q/rpL+Y/SPuUOA2bJARO+A==
X-CSE-MsgGUID: LVbgTYl1SLaBSqGoh15lxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="218081987"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 03 Mar 2026 03:43:07 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxO9Y-0000000029t-0qhQ;
	Tue, 03 Mar 2026 11:43:04 +0000
Date: Tue, 03 Mar 2026 19:42:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 6/6]
 drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such
 file or directory
Message-ID: <202603031910.3cuWaE2n-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   8426c769398ef6f4ac3f61df3f3ec10bd11b0e50
commit: d9a579535cd0f4623e627c3375781fb29c78692b [6/6] BACKPORT: arm/arm64: Probe for the presence of KVM hypervisor
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260303/202603031910.3cuWaE2n-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260303/202603031910.3cuWaE2n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603031910.3cuWaE2n-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such file or directory
      11 | #include <asm/archrandom.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 drivers/firmware/smccc/smccc.c

     7	
     8	#include <linux/init.h>
     9	#include <linux/arm-smccc.h>
    10	#include <linux/kernel.h>
  > 11	#include <asm/archrandom.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
