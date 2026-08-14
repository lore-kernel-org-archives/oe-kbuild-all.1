Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31BF48D87C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 19:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786734405; cv=none; b=kcQ7tvBDZTIX7SQOU/dGYWJReIlC9rNxSlXPTRIDaQ8cxd1nZTu3E2iM0/XjxxvbjWD5CcHw2owJLt57On+2bwz+pmjSJq91Mk+Fy0af0AX8idobSATFmJG7/euAUvRYhd8CHEicEJfnQhF4zWr8//ovlVFj1z3y8vBfCy+0mRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786734405; c=relaxed/simple;
	bh=rIL8OI+PtDM6Pwglv5btZcC/S3yI2l85yfcMowHrgYI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=sbKBzfnOLUcPqMgff7669kro+cv6LZpO+wuiadX8LgnWkIgn5yw7K9kNHkQCrQ9gMpx3qNM/t3uIrzTr8iqZAIPeDCIVtTIx+qq8E9qxmnVnxxunC6mxGAKXGcFI3U40QTkR92CLxIbuQ73LPHahXnEEVTuRkpOU83AgPuAZCV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kFSzaxJo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kFSzaxJo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786734405; x=1818270405;
  h=date:from:to:cc:subject:message-id;
  bh=rIL8OI+PtDM6Pwglv5btZcC/S3yI2l85yfcMowHrgYI=;
  b=kFSzaxJolpncYhWNidD9RLmU51alrz5lZI95FsxAXDknbCN87ikkKPZ0
   3j6Gn0M9B3/lMgiMQHNQ5sczg/WYN2IJfNAwHANVanBMmZlNcwHbOkyd2
   MZyEK9Di4xEaMkNnCbX7ohxujzOI7+Knnc+PE3FdKrNXXu/6Zb9gpNKym
   07JYWSjsDGk+TDIOP05u32cm8rVTexzf0q6lBBHQZCNkU2DAz9kKKuF6v
   XVUm9JTlrTtcK0IdhVNTHZgvLCh3wgkswwJA5xWYn9qAfVopG4zHuuDSO
   o8inD+wfGcxmpC2PFB6KcJspCVd8tg8H+5Jp9G4jdIPPtIJ0pbX8HkE3M
   A==;
X-CSE-ConnectionGUID: mp1/Rj4oR26TOCDb2qnS5g==
X-CSE-MsgGUID: QWqobxysQ3ui18p7Dx26/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="87338180"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="87338180"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 12:06:44 -0700
X-CSE-ConnectionGUID: guRk6WfHTCq1tTbyiKwK/g==
X-CSE-MsgGUID: 2QWSkTtHQOuf3vwClsB4dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="264342158"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Aug 2026 12:06:43 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wuxEm-00000000ZsA-14Wo;
	Fri, 14 Aug 2026 19:06:40 +0000
Date: Sat, 15 Aug 2026 03:06:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such
 file or directory
Message-ID: <202608150216.QeANRUDE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   8b4ccabf3e6b7ef8ad04f513e8e5b1a5a1021267
commit: d9a579535cd0f4623e627c3375781fb29c78692b [1/1] BACKPORT: arm/arm64: Probe for the presence of KVM hypervisor
config: arm-randconfig-r051-20260814 (https://download.01.org/0day-ci/archive/20260815/202608150216.QeANRUDE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260815/202608150216.QeANRUDE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608150216.QeANRUDE-lkp@intel.com/

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
