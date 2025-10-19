Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67471FECD4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Oct 2025 23:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760915823; cv=none; b=uvUBhr7goR7IE3bzQfWTIcvEFdO+L3DiVrg/rZo4/7Q4bPYE6icaZm4dnNgVKDEWXh35HC4Yc5hCGespOWRFGHizrex9Qp0pVoFPyu/vqxzcmJenPJejdu9dwlq2RsL7IlP8SdF0usOqKbsrsmy1KqsqKV2EdWXCmaDZ9+U/u2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760915823; c=relaxed/simple;
	bh=+XP3O/pH9VGX4P6NIF+sV/AxaAh3pi1AFopqYI0atx8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LE51TQ6O3HexE8joxYUt2yVO04zpvdbWzmMrqc+WGM0eNgQgD3oipVsmsblk/R8ub9LaUOoFe/B2n6n721RrHTZO5JUQmDZIQeXKTxcKPDx4AgByNRIEo3vROLO59zRI9L4fEgqapUxG3bClq3S6N8yuxIuPXc0z3lROeKsLlVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LJI8l0dO; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LJI8l0dO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760915822; x=1792451822;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+XP3O/pH9VGX4P6NIF+sV/AxaAh3pi1AFopqYI0atx8=;
  b=LJI8l0dOzjJ18qCQlGSJF1+yscslxOvjO9s3j3iIZyoFNQ1GDIxdkQ5z
   PA6A6tbCTPg5R6rQP3jo9Iv2agBIEaox2wadPBocpr9TAkWsZ6qrd35EW
   Bo1KUczf1wrIhweXOBxUR4+XOS8LT268mIrolZWXOVS1HkhIZ9apYeH3H
   /XMMezY5X3oQxMXoJYlpyf0zO2H8p2AuqvIdUGY6K0JYu1R042R+c/mLe
   1USe4hRjmqoAwYK2cizkrO8X+H9NWRXjrcqiI0QKYbsVp9KFsFgFH1gNl
   ZkHQmX7KZJr/lEAJAkh5z4+RDzifZwfMJ2pwgNcyBc74Z3ghzsahS7WAv
   g==;
X-CSE-ConnectionGUID: dnBNNw37TXa5Fou4uvqaqQ==
X-CSE-MsgGUID: gI2kk+2ISTyF0m3DfrP12Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62958321"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="62958321"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2025 16:17:02 -0700
X-CSE-ConnectionGUID: 4gQDfd8QT2ORvqYng+buQg==
X-CSE-MsgGUID: 6KqBbITOSa265aPj1NaLlA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,241,1754982000"; 
   d="scan'208";a="187212966"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 19 Oct 2025 16:17:00 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAce2-0009Lp-0m;
	Sun, 19 Oct 2025 23:16:58 +0000
Date: Mon, 20 Oct 2025 07:16:21 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-CWF-EDAC-ANBZ25520 15/15]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error:
 'nbl_product_base.h' file not found
Message-ID: <202510200718.9NUDHXNO-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-CWF-EDAC-ANBZ25520
head:   31f4ee37032251af8f106ffe418b8235f5e08468
commit: dd70f3837d475e33fd445bd822d8e058547e6dee [15/15] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251020/202510200718.9NUDHXNO-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 754ebc6ebb9fb9fbee7aef33478c74ea74949853)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251020/202510200718.9NUDHXNO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510200718.9NUDHXNO-lkp@intel.com/

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
