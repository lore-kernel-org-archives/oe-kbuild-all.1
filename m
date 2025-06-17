Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D88927461
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 06:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750141919; cv=none; b=jQJ+/SCjYssOkErtixo6RV7Yk77u6z9HKJr9LNic7UZWhi+RXKYH/3kk25U5PggLlhryKitpOYP04BP9LzPkpR3uNklpg+XkT55kOkhgPR2IQYobjtd6mgjjzs01x2IOI93WcW+yyHO6BQQjVMcaHPdmngpRAaVIOTJPXm/IG8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750141919; c=relaxed/simple;
	bh=hpeO32DZY2QyOdH6W6cnEOVBlZX50TdHsBzhyqtGqrw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h68+KXtiRhAtndeV5UE3O7Y79uxXl0vla8IgSwaQ3Exxo9crw0o1UANgp6E1IEvvF15Z5avRP2a7Jns6ra1P9gfAGsVx4CcQ5EldXCJYqwVhrIzRyAQUfl4onkyZ6o1sztZ+HkiF/meVQi5LCaFioJG5RRXdOakueNEcp11evGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EiQq0AjZ; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EiQq0AjZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750141918; x=1781677918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hpeO32DZY2QyOdH6W6cnEOVBlZX50TdHsBzhyqtGqrw=;
  b=EiQq0AjZDTLB2f8Wxw0UydRvb7JJ6vSTSvJxbcASmV4GhMz33Tu1NZgL
   Lifqs9Y69h2jKQqseWZSBO2DePEBO/duNZzkhSxLVFs5xFFydplL/Bw0e
   wTVRyuasHFCMCpd7w9e+d3n4KzXGoRb/ulqobwwJL0aUvUIIbcLgetGcg
   eYdXHbP6p/NjDQudAp9ttF6zNK53KNdV8Yphw5aTRlU8y/kRpIuQpVB+R
   paqR6srzsrJxEUXB7nIkGIalQumAlaSUPfAIka/7TUESUgnB0tnZ0y7z7
   U0qtY//rYCBxbbde+24cLaA3UITc/9RjcGsO3ruYBXtg9zZr+ctSsdWvT
   w==;
X-CSE-ConnectionGUID: OjmgrFIaR+CjKKMYHWvQpQ==
X-CSE-MsgGUID: R1AR/EOFQWmfpZogEnYpXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="63334018"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="63334018"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 23:31:56 -0700
X-CSE-ConnectionGUID: uEKF9XK5RRe2eg17lxiNyA==
X-CSE-MsgGUID: aIE/wevmQiW6M61N1sdk0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="153983152"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 16 Jun 2025 23:31:55 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRPrM-000FgI-08;
	Tue, 17 Jun 2025 06:31:52 +0000
Date: Tue, 17 Jun 2025 14:31:48 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/25]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error:
 nbl_product_base.h: No such file or directory
Message-ID: <202506171439.AqU0ciBc-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   52f058371994dd007ac842b38bab3e576e84ab5a
commit: 7a025ab026a1cbd5622c8b14875b9e990db7a2b3 [0/25] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250617/202506171439.AqU0ciBc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506171439.AqU0ciBc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171439.AqU0ciBc-lkp@intel.com/

All errors (new ones prefixed by >>):

>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error: nbl_product_base.h: No such file or directory
      10 | #include "nbl_product_base.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.h:9:10: fatal error: nbl_resource.h: No such file or directory
       9 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_tun_leonis.c:1:10: fatal error: nbl_resource.h: No such file or directory
       1 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.h:10:10: fatal error: nbl_resource.h: No such file or directory
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.h:10:10: fatal error: nbl_resource.h: No such file or directory
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_tc_tun.c:5:10: fatal error: nbl_resource.h: No such file or directory
       5 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10:10: fatal error: nbl_core.h: No such file or directory
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_event.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_event.h:10:10: fatal error: nbl_core.h: No such file or directory
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.h:10:10: fatal error: nbl_core.h: No such file or directory
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.h:10:10: fatal error: nbl_core.h: No such file or directory
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
>> cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.h:9:10: fatal error: nbl_core.h: No such file or directory
       9 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
..


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
