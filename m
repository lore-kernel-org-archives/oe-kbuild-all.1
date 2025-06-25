Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D189A275AED
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Jun 2025 20:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750884303; cv=none; b=pj+UGscOpp6hype9Ki5JXJM96cWeuIeCR3rNx/hBq16rIXlO1dHt/O4Jtm0SkvZszVuqzVE6v8XhK+O2K6VRrgkygnjD7YAPnwaGp5ItbKJOgipv3MYD12y9qIYYtY3L9DvA3HtIpyRgoOG8xLhbxuFZCOOK4UXiwmp4srOGv9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750884303; c=relaxed/simple;
	bh=/J+d7hlZ8+cF12QkBJhzWBj50+tbg+QN+VrApRHgneM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cbwuSPs7xKdP2M3W+i6DJN0Nuacbuq+QzpIZi4dZ04PuB5dTHyJHv/N6QJwVteGysmI8n4TYJkQ38dOqZvPg8OdjUssxbqSlu++udy50QPOdN4cZexm0tPKzc271ifZsomHdpqhzArbCCD20Eg273dTlKD3PeDlQ61yPGHBxfr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ESVlop4m; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ESVlop4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750884302; x=1782420302;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/J+d7hlZ8+cF12QkBJhzWBj50+tbg+QN+VrApRHgneM=;
  b=ESVlop4mUh1oHHTw1CkvMXCOC07GBa8CeV9ksh8FPSPQpKbBDX4v1lHq
   fknpdlxnZZTERLZt+HxiqDyI9hMWywA4EDaDGcxo9HK0Vtq/FiGecpQwt
   G3eApAAu87P91r3DstVM7NQcipXAEW9KuJu+ohGFkpFKoZ34soCCtOgS8
   7aESKeYZk/1a+Fbn9lcxzfcZ94j+mfdnIUEq9RVRVpXISrvEBFFYrFNMs
   90lG1adh+ffh3ci/uuy7iAzrE3S4iPyhlIZUd8k0lNPo4PzQQk+2XBUp2
   i5Que61TjfYHWv5YEX30wtb/xgGm/WGW/1ssvLyjhfzWtqR2S6/fsV2Zd
   A==;
X-CSE-ConnectionGUID: w9wsBS0mQACEgp1I0R1wSw==
X-CSE-MsgGUID: 19HHnhoARYCySloFiEmfcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="64227411"
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="64227411"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 13:45:01 -0700
X-CSE-ConnectionGUID: h/VRnDx+TNS6BLD3UrJqxw==
X-CSE-MsgGUID: RXiD8j6AQUqwJ/FmIpGSyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,265,1744095600"; 
   d="scan'208";a="152809131"
Received: from igk-lkp-server01.igk.intel.com (HELO e588e990b675) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 25 Jun 2025 13:45:00 -0700
Received: from kbuild by e588e990b675 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uUWzK-00004V-0x;
	Wed, 25 Jun 2025 20:44:58 +0000
Date: Wed, 25 Jun 2025 22:44:09 +0200
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2195/2195]
 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_ethtool.c:3: warning: This
 comment starts with '/**', but isn't a kernel-doc comment. Refer
 Documentation/doc-guide/kernel-doc.rst
Message-ID: <202506260454.xpU5DsPU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   c02455c4cce8052f74fc11c09e9073c01c7f33a4
commit: dd013ad487534c1838afc2f55efdb5daec15aace [2195/2195] Ethernet: Linkdata: Supports Linkdata ethernet Controllers
config: x86_64-randconfig-2005-20250501 (https://download.01.org/0day-ci/archive/20250626/202506260454.xpU5DsPU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250626/202506260454.xpU5DsPU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506260454.xpU5DsPU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_ethtool.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
--
>> drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_main.c:3: warning: This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst
    * Copyright (C), 2020, Linkdata Technologies Co., Ltd.


vim +3 drivers/net/ethernet/linkdata/sxevf/sxevf/sxevf_ethtool.c

   > 3	 * Copyright (C), 2020, Linkdata Technologies Co., Ltd.
     4	 *
     5	 * @file: sxevf_ethtool.c
     6	 * @author: Linkdata
     7	 * @date: 2025.02.16
     8	 * @brief:
     9	 * @note:
    10	 */
    11	#include "sxe_version.h"
    12	#include "sxevf_ethtool.h"
    13	#include "sxevf_hw.h"
    14	#include "sxe_log.h"
    15	#include "sxevf_tx_proc.h"
    16	#include "sxevf_rx_proc.h"
    17	#include "sxevf_netdev.h"
    18	#include "sxevf_msg.h"
    19	#include "sxevf_irq.h"
    20	#include "sxevf_ring.h"
    21	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
