Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C8A1EEA49
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Aug 2025 21:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756502198; cv=none; b=Wv+8Cq9oJItOqkqiGsT2McvFPhzwZfWBrvxDG4Zhj1ZysQTdm9efnVxCc61MGq3NKrKubJ0TXs2haxaf//zZqzQ81iLtukgy6OUdMRfxV0TxXLqnEPskXObnsfDX0uu8S3imtPPDuZH6BZSpUC3s75Ab4BPoEnhvdjqXp29B3XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756502198; c=relaxed/simple;
	bh=my0jnKSa0IKoJdj5bxpzYyV9KMKPL+MOfOfukYsPZHg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J5OApv7Vmd///VPGfZQLCbM1hLK5n+fR7kCE0QrEBCcIDZdJY+DuhjYVFPHDh3klNP9jB6bItbqcVu+1y+6puofSTMTzmLj7xgLdEeIpoO9GO5JpJRxp9piNR6ZqDhi51O/vqhe41VvhGvDBO+u8SrjVGjQcnIhS/R4Vr4x0MsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WO4K+Wti; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WO4K+Wti"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756502197; x=1788038197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=my0jnKSa0IKoJdj5bxpzYyV9KMKPL+MOfOfukYsPZHg=;
  b=WO4K+WtioU9sf58pXVMCEf10lcaFp1sq6IipYoJUqDOrlYOA7jFxWvrI
   b3oD8iKnCNV+X1yFkvY71FC9Z9TDsJSQuHd8zEqccXMnotE7EthLJnEl9
   rXLzXHo2+vSOlSwPXrs7cc2ZUInCpbUTpi9rF5hqEf547WMapsu6HDrsB
   AL1aDALwTvq5gba2B12A0VQmqnwifWt4W72KTMYNRcDNtTDnMlW+8VKrG
   QknO19WIjmIuJ/GmTZgOJMLVcomuLiZW/263yWTMqfnMolxuhiBBMvsP5
   jiFdSKTID2cqJN7/7gm0uFZS4IFcS5d5fMX7G/r69uVDsWCmCbJ4TdLRU
   g==;
X-CSE-ConnectionGUID: mddAOqp2Q/qp7EbHiHypfQ==
X-CSE-MsgGUID: lwJ/zO5JRRaP0qJS3/MAUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="57821728"
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="57821728"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 14:16:36 -0700
X-CSE-ConnectionGUID: 9K7rtbJwTqulwdhHXYEZIQ==
X-CSE-MsgGUID: tE/oigy/RPyeHjBxAN7fYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,221,1751266800"; 
   d="scan'208";a="169727860"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 29 Aug 2025 14:16:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1us6SW-000UzH-2j;
	Fri, 29 Aug 2025 21:16:32 +0000
Date: Sat, 30 Aug 2025 05:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-6.6-CWF-perf-core-ANBZ23411 26/26]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error:
 nbl_product_base.h: No such file or directory
Message-ID: <202508300529.ORB9wqg4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-6.6-CWF-perf-core-ANBZ23411
head:   ca90878d49ef2c923d72947e387bfafc2c6d1b89
commit: 059837f47f887848d0068cb0431354e8e1197e44 [26/26] anolis: net/nbl_core: Add nbl_core-driver for nebula-matrix S1000 series smart NIC.
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250830/202508300529.ORB9wqg4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508300529.ORB9wqg4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508300529.ORB9wqg4-lkp@intel.com/

All errors (new ones prefixed by >>):

   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error: nbl_product_base.h: No such file or directory
      10 | #include "nbl_product_base.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_fc_leonis.h:9:10: fatal error: nbl_resource.h: No such file or directory
       9 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_tc_tun_leonis.c:1:10: fatal error: nbl_resource.h: No such file or directory
       1 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.h:10:10: fatal error: nbl_resource.h: No such file or directory
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.h:10:10: fatal error: nbl_resource.h: No such file or directory
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.
--
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Werror=missing-include-dirs]
   cc1: error: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Werror=missing-include-dirs]
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_tc_tun.c:5:10: fatal error: nbl_resource.h: No such file or directory
       5 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   cc1: all warnings being treated as errors
   compilation terminated.


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
