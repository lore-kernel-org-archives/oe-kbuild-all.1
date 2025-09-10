Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B2A4A1A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 Sep 2025 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757511082; cv=none; b=QCI5fBm/b5BgMIDODJ+PbOkL+qLtcEOfeqtRxB60DOH3Sal/kJ5sBijlrvzqK4xaHwe4yPMIrpUDETCMe7fPCeNYvHhTawGrJ+DnJ532nOcTwHIDDf268DeLzLClhl7ZJyt4yCGGfJdae4qppKFnB8ZUsC1ICfrDdTpsSMSuGRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757511082; c=relaxed/simple;
	bh=EsaNiEKdOhnr7xP0xbC/yxJ79TjAi50/NA3c5cCYQ3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Kege0wcuQ6qf8rXB66DvKucDLO+gLsMd01yPLxYQItWpLV/a5d/kBem7QgUatw+6mVIW6H8G6ZnFaKeKFtgpvSsq3/bZwDoBG41gWW1zqqPGiCwhUJ/KY0qUNw9i7AQn0fl8LRc1SKfRNIr4+RJqHbgT+Fag2vvhAIWk7g1fi7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+53dPW6; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+53dPW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757511080; x=1789047080;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EsaNiEKdOhnr7xP0xbC/yxJ79TjAi50/NA3c5cCYQ3A=;
  b=f+53dPW6Io2ZyV9BuspnGg+KD8nJ0xhkmyJlDj+cZwphSFlfpkYUeD5a
   a7QSeRNTr1CP4I7Ti4IGLML0cGSaTkZl3tN4q3bClgiaU4sbZPov9kk8C
   c7vnnfZMSh1XCceepx+77AqjNSW5SJ/UTdt6IXGQawvCzjjpKt7/aZPLm
   vAWnhANLVDMuGgj6iCE0V6PYtpvY4reak5AepDbwEoFRzUQ4Un5Z+JLa2
   inYTqqo5MK4SFtPeqUnjTnpK06OK3urBFDbzh/ySCHOm8oEO3/MRWrDMT
   rGV3I3OwFJAf0aD/HxWoBE0TSJJ5fk25BC1W1f8cJt2sQi/I7bRW5ZJJM
   A==;
X-CSE-ConnectionGUID: +Hgv6/WjTn6wR7WqtJqXrg==
X-CSE-MsgGUID: QYB7mDJrRqu6BDTDGtH0JQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="63648908"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="63648908"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 06:31:20 -0700
X-CSE-ConnectionGUID: H9iJiinaQ9y7aO89FNnYmw==
X-CSE-MsgGUID: aGWfISFUQCe0AraS5Glbzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="172986804"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 10 Sep 2025 06:31:19 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uwKuq-0005xv-2y;
	Wed, 10 Sep 2025 13:31:16 +0000
Date: Wed, 10 Sep 2025 21:30:22 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 16/16]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error:
 'nbl_product_base.h' file not found
Message-ID: <202509102102.dYcz97e0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi nebula_matrix_driver,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   ae6246bd42d227be5e06227f13f5fccf6a0f2154
commit: dd70f3837d475e33fd445bd822d8e058547e6dee [16/16] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250910/202509102102.dYcz97e0-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 7fb1dc08d2f025aad5777bb779dfac1197e9ef87)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250910/202509102102.dYcz97e0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509102102.dYcz97e0-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error: 'nbl_product_base.h' file not found
      10 | #include "nbl_product_base.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.h:9:10: fatal error: 'nbl_resource.h' file not found
       9 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_tun_leonis.c:1:10: fatal error: 'nbl_resource.h' file not found
       1 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.h:10:10: fatal error: 'nbl_resource.h' file not found
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.h:10:10: fatal error: 'nbl_resource.h' file not found
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:7:
   In file included from include/net/xfrm.h:26:
   include/net/ip6_fib.h:273:10: warning: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     273 |                 return time_after(jiffies, f6i->expires);
         |                        ^
   include/linux/jiffies.h:106:3: note: expanded from macro 'time_after'
     106 |          typecheck(unsigned long, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.c:8:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dev.h:10:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error: 'nbl_product_base.h' file not found
      10 | #include "nbl_product_base.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.
--
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_include' [-Wmissing-include-dirs]
   clang: warning: no such include directory: 'drivers/net/ethernet/nebula-matrix/nbl/nbl_export' [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_tc_tun.c:1:
   In file included from include/net/vxlan.h:6:
   In file included from include/net/udp_tunnel.h:5:
   In file included from include/net/ip_tunnels.h:19:
   In file included from include/net/dst_cache.h:8:
   include/net/ip6_fib.h:273:10: warning: default initialization of an object of type 'typeof (f6i->expires)' (aka 'const unsigned long') leaves the object uninitialized [-Wdefault-const-init-var-unsafe]
     273 |                 return time_after(jiffies, f6i->expires);
         |                        ^
   include/linux/jiffies.h:106:3: note: expanded from macro 'time_after'
     106 |          typecheck(unsigned long, b) && \
         |          ^
   include/linux/typecheck.h:11:12: note: expanded from macro 'typecheck'
      11 |         typeof(x) __dummy2; \
         |                   ^
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_tc_tun.c:5:10: fatal error: 'nbl_resource.h' file not found
       5 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +10 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h

     9	
  > 10	#include "nbl_product_base.h"
    11	#include "nbl_def_channel.h"
    12	#include "nbl_def_phy.h"
    13	#include "nbl_def_resource.h"
    14	#include "nbl_def_dispatch.h"
    15	#include "nbl_def_service.h"
    16	#include "nbl_def_dev.h"
    17	#include "nbl_def_common.h"
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
