Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A1DB1DDC1A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 10:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749118539; cv=none; b=Dw2kty0L1zAgHeXrTIPTlNVcjCvDEmGnrFOZt535prYHKkxnZwW2nQLlT+u8RS/MnTsely05QaRqE3MntBQ63HR5MsSyj+73ZosMrs7BEAlIjClmXt2+c2wz7wewVU/M8JW3wA3AcPWR2jxdWYbzEwZTYWmDbfShzRi61UFbqiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749118539; c=relaxed/simple;
	bh=t+ZYRDxL5SKJ12lAHctOjIlzS2h8jpy5MYZDCKTqUz4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RV5zXNtb/RvF8z446Fy3gLg1ogT1coWJ4OSpo0oF8SaFNxd/0L61G5yAOvy9govv92gI8nEB8dkBB+gAufaBjB5JTrTPcjhlya2k4FvKxzkC+b4lgBVD9Byx1Uc1fyRpkPZq+2KE7ez/BnnRGr+0UuqxMUHfexFsxYzYctwGtk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=loC8MA9q; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="loC8MA9q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749118537; x=1780654537;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t+ZYRDxL5SKJ12lAHctOjIlzS2h8jpy5MYZDCKTqUz4=;
  b=loC8MA9qmVRUAp/agZayf/80zltA+wKjtGEWlbZpaiyWYRwOgUyn8kRw
   0wyHTij2hs5P1MYCe47Jzs/RwA6Z8RlrMFhq5pVy4MDfWTtxUGR6zCVib
   HM5PhmLGRoT6/c32Q8rr2hkwV3CL3vJ7mfIF7vmmW62WFPild8k1Isb4j
   M9qZLsoIz+6alLV3II30OmXJv0ld+vIPgh093hQhxei3BJXzhTFaIeBW4
   s4EaK9UQpzlI/TZN6ljRUrsZyUFxdl7p0eQv3Kr5vIN0AWskC8QKf6LLN
   Uyfikz490eo3zzaguNGdA8Pp380+nKVz299KBnggwpkD2V2LyG8e2cwBt
   w==;
X-CSE-ConnectionGUID: gS9p7Wp6SuGnMfb3GQqfdw==
X-CSE-MsgGUID: Z5Xg3WSBS4Oodyzg55u6zw==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="62584877"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="62584877"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2025 03:15:31 -0700
X-CSE-ConnectionGUID: x+OXsfxdT3WkDGN0RjLRQw==
X-CSE-MsgGUID: wsrHTOBDQN+DWYzkobUU2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="146446738"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 05 Jun 2025 03:15:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN7d9-0003z3-2Z;
	Thu, 05 Jun 2025 10:15:27 +0000
Date: Thu, 5 Jun 2025 18:14:29 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 3/3]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error:
 'nbl_product_base.h' file not found
Message-ID: <202506051816.R0uqhEGP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   fcd1055a345089eceb6cc018d35067efd4e9340c
commit: dd70f3837d475e33fd445bd822d8e058547e6dee [3/3] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250605/202506051816.R0uqhEGP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250605/202506051816.R0uqhEGP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051816.R0uqhEGP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error: 'nbl_product_base.h' file not found
      10 | #include "nbl_product_base.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.h:9:10: fatal error: 'nbl_resource.h' file not found
       9 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_tun_leonis.c:1:10: fatal error: 'nbl_resource.h' file not found
       1 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.h:10:10: fatal error: 'nbl_resource.h' file not found
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.h:10:10: fatal error: 'nbl_resource.h' file not found
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.
--
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_tc_tun.c:5:10: fatal error: 'nbl_resource.h' file not found
       5 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   1 error generated.


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
