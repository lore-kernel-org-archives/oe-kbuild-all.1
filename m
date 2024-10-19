Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6C173
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Oct 2024 00:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729296373; cv=none; b=OnJygFC9qxERKJcp4kzhe/gdcCpTJGbgFXyO0A7CTY+1Fq6+XHrrFkcjp/HbLQHa8P1mDbOxJY9jteaAC/bZ5z7jTHeTrQaHo8qw3WXir+4vCipqaSf3gOpI30D2jVJDYZgCEVxvOz0dk0YFGYS4JcQLCnLsmFJWRpXQCOv7HCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729296373; c=relaxed/simple;
	bh=WH2+Hc5hYw2ylhzOf0pRzOPRFsDkV91obDOgRPjGBj4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nQGVHY34Nqg70szo5x+sx2OcTwr3GK5RkLdWU8kj6kgXnsaafjchpTI9sz68zdt1sPzr2kIxyaamNvWtvkg8z7fy7BtatMmM5aNBYWOHmfKK1b74z0DRqJrc1J08SRmePAPs8xRqD38+NThi+1I/gDyilZdMwRHzq5Nt8zQD6Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DwuuQgFG; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DwuuQgFG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729296372; x=1760832372;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WH2+Hc5hYw2ylhzOf0pRzOPRFsDkV91obDOgRPjGBj4=;
  b=DwuuQgFGmqukvRnxeQDdmlFvnHpo5UMKOWuqBrJ+Rol3q4jJQf+PQFYK
   IKCzCn2VjqrC9f3duJ5cs4211pWT2rrMQH8k6IF3xzjoXjCNNEz9j0Qmj
   2uxa8twE/mpUuyeZNjJ8GS485Zykac5AbNjdkQy9pnLqSXP9Yj1tkmJYz
   X+LxZkBDpAYCkRRgQmJRk4XYAErOknDtUuuzyzYsMBZj3ADfLWhAi4Osa
   c//8UJaEPBVJohc5sPirRoqxm1B4APYYsubKQzTsVeW8GWtVHTGOII7sG
   DZswgcoHf+oQktO12GOQ9RB1AieLbwVSYawMTpsXSZHhYsUAPwCHIONBu
   g==;
X-CSE-ConnectionGUID: 5z5+4t24T7uoeR1k3xdGYQ==
X-CSE-MsgGUID: i6g+coiPRJ2PgC0QYMTt0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="46340739"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="46340739"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 17:06:11 -0700
X-CSE-ConnectionGUID: U9EPNjsrRKS/TUcz16AiSA==
X-CSE-MsgGUID: wn4PutKcSLKoW8JesIJXyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="79419582"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Oct 2024 17:06:10 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1wyt-000ORr-1i;
	Sat, 19 Oct 2024 00:06:07 +0000
Date: Sat, 19 Oct 2024 08:05:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Bennie Yan <bennie.yan@nebula-matrix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 14224/14651]
 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error:
 nbl_product_base.h: No such file or directory
Message-ID: <202410190816.EUZ9uPVH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   980f4346f1fdbd303ad74af8b2a62fbbbb6cf6c1
commit: bad535d287c9c1056d99de3666be7da84de4a8fc [14224/14651] Net:nbl_core: Add nbl_core-driver for nebula-matrix S1055AS series smart NIC.
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241019/202410190816.EUZ9uPVH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190816.EUZ9uPVH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190816.EUZ9uPVH-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.h:10,
                    from drivers/net/ethernet/nebula-matrix/nbl/nbl_common/nbl_common.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h:10:10: fatal error: nbl_product_base.h: No such file or directory
      10 | #include "nbl_product_base.h"
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_queue_leonis.h:10:10: fatal error: nbl_resource.h: No such file or directory
      10 | #include "nbl_resource.h"
         |          ^~~~~~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.c:7:
>> drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_hw_leonis/nbl_resource_leonis.h:10:10: fatal error: nbl_resource.h: No such file or directory
      10 | #include "nbl_resource.h"
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
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_hw/nbl_resource.h:10:10: fatal error: nbl_core.h: No such file or directory
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_dispatch.h:10:10: fatal error: nbl_core.h: No such file or directory
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
--
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_include: No such file or directory [-Wmissing-include-dirs]
>> cc1: warning: drivers/net/ethernet/nebula-matrix/nbl/nbl_export: No such file or directory [-Wmissing-include-dirs]
   In file included from drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_debugfs.c:7:
   drivers/net/ethernet/nebula-matrix/nbl/nbl_core/nbl_debugfs.h:10:10: fatal error: nbl_core.h: No such file or directory
      10 | #include "nbl_core.h"
         |          ^~~~~~~~~~~~
   compilation terminated.
..


vim +10 drivers/net/ethernet/nebula-matrix/nbl/nbl_core.h

     9	
  > 10	#include "nbl_product_base.h"
    11	#include "nbl_def_common.h"
    12	#include "nbl_def_phy.h"
    13	#include "nbl_def_resource.h"
    14	#include "nbl_def_dispatch.h"
    15	#include "nbl_def_service.h"
    16	#include "nbl_def_dev.h"
    17	#include "nbl_def_channel.h"
    18	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
