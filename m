Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5AC2701A5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Apr 2025 01:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745457620; cv=none; b=gnov0631nVFiqE7fkPEeFCtxizKbGubzF8bk1Ob0FAPCWQwXvLBPbRp9IeGiIKEkrkfn1y4/T77ChNSB2Q84KVq1K3p5kQgeM+BLXca/j1G+0/dfFfUL2p/qCG4pjbz8dp4rd+lJUMeKRc4ftNAc+qtimH7QcjSPnQlgXyh9vLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745457620; c=relaxed/simple;
	bh=6RAiTj0GQe8pqiCOzaIPmAqsYbwYRFJfXZ0RDFDFxHw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AtpjnKSq6FjbxtB0uS65ton3GPN+qnxeVB03SgUtFIIy71o46HEkH2pxirZvi+L/hRW3x4VhBkiDvAZLQFbG4F+b90/HOuEI0BA0iStH3tqubvfMsRyOigE5ux/SFjqlvZi1GqM8OCerHnIA/KruDkCKXk4AgftpZxPkmk3ln38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LTbqAZAk; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LTbqAZAk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745457618; x=1776993618;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6RAiTj0GQe8pqiCOzaIPmAqsYbwYRFJfXZ0RDFDFxHw=;
  b=LTbqAZAkVF2+nz8DGsNEJWQkgypZSZDb23m2cXDGShHfRAXzwnkGn5ul
   Nds7gQffGZUq0X5NPHV78K2spPGXXjJxZ6eB0G9qUOJWTBT+smSHcRYxe
   L73Je7DBjBoI2rQxRfNgNAO8E1BhwNC+TA9P+4le4u/CKcJL7u3cdEYwi
   92PNF3WYbgZ+kCBwR+AO3pBai3tzIZzJcNEgYqyaI1ctJPDMii/Sx2x+v
   rCa56onUsjfO8aDuz87unGhWC78MG8cKrVh+kqoigrlkL35q7dXIWhCkp
   e73Awog1SXmm7dVXA0GAuUa17aww9FyeBF/0yiw1coAFsn05dDKAEI414
   Q==;
X-CSE-ConnectionGUID: lU2FNKt+S16bcJAI80cjEA==
X-CSE-MsgGUID: RbZGr/m4RNupJaFvWohE1Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11412"; a="34686251"
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="34686251"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2025 18:20:16 -0700
X-CSE-ConnectionGUID: BlF81UEMQ1+6JZ/6QzbwVQ==
X-CSE-MsgGUID: No3IiBQYQa2DiJDdMWt/KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,233,1739865600"; 
   d="scan'208";a="132996349"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 23 Apr 2025 18:20:14 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u7lG8-0003lN-1H;
	Thu, 24 Apr 2025 01:20:12 +0000
Date: Thu, 24 Apr 2025 09:19:43 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 12/12]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.h:9:10:
 fatal error: nbl_resource.h: No such file or directory
Message-ID: <202504240920.xCaJ4PMi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   8dcd583e3465e0c2cdc7613c2cbbb752a196373b
commit: dd70f3837d475e33fd445bd822d8e058547e6dee [12/12] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
config: x86_64-anolis-intel-cloud-devel-5.10 (https://download.01.org/0day-ci/archive/20250424/202504240920.xCaJ4PMi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250424/202504240920.xCaJ4PMi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504240920.xCaJ4PMi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error: nbl_product_base.h: No such file or directory
      10 | #include "nbl_product_base.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.h:9:10: fatal error: nbl_resource.h: No such file or directory
       9 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_tun_leonis.c:1:10: fatal error: nbl_resource.h: No such file or directory
       1 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.h:10:10: fatal error: nbl_resource.h: No such file or directory
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.h:10:10: fatal error: nbl_resource.h: No such file or directory
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_tc_tun.c:5:10: fatal error: nbl_resource.h: No such file or directory
       5 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10:10: fatal error: nbl_core.h: No such file or directory
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_event.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_event.h:10:10: fatal error: nbl_core.h: No such file or directory
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_channel/nbl_channel.h:10:10: fatal error: nbl_core.h: No such file or directory
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_phy_leonis.h:10:10: fatal error: nbl_core.h: No such file or directory
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_flow_leonis.h:9:10: fatal error: nbl_core.h: No such file or directory
       9 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
..


vim +9 drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.h

   > 9	#include "nbl_resource.h"
    10	#include "nbl_core.h"
    11	#include "nbl_hw.h"
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
