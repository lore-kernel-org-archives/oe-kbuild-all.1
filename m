Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FA917B418
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 09:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731920927; cv=none; b=HtyGOyk1xJ2JsCZ5VNQZEddRzrBO/i4P338KGJp/WPNjFoMo7RzpBPPfPva3jXoz7hBst2OXPqnJfpBXI77OA1FVvU6ySczDQF5I39HfmWDvy+QycEv3awSVhi8PSJU5gaIuRqDmfNU2uQeeuno6LAkauSLheJJjx38A/gREfH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731920927; c=relaxed/simple;
	bh=dZxU3dh1PlUmuekWSljo47bTvvM9btaJQUCPtbeDPG4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ClrpmLJ18vp6O/0nYg7IyS8/OetssHBbWbkYksh/HzctxDyDOV1tKwVV3QEB3EVeglGZ1O9BINnnDOou9CCJlE1tl9peA2wn2GgIMQSyH2/rL8iFMsF186kIhq8G2s0quTKddmdOwRs32LS4cUdFLSB8FxIHdBSpVr7oNxeXYWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cgoMtSRB; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cgoMtSRB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731920926; x=1763456926;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dZxU3dh1PlUmuekWSljo47bTvvM9btaJQUCPtbeDPG4=;
  b=cgoMtSRB+lzxgKqizBy3y96Ur2VV5UTn+4MxFXIaVBZr+w7ED+xC6Enw
   mmPqW4whRBmxxzZBm+E1NHlbL0aAIWgTspCpdL6F/he1dD45vS6tdPZTx
   aiiQwav5qaIeX9RTfvjn6phEvcXMc6/G0ro0mPufjgw3NrNl/LzajNsp2
   qGxNh7CtK4UaXT7bq8tC917i/5HIxWswh1RsJdOAXAqBDulahil9EkO7Y
   pHqhje6lw9ZDiSk/UlzZ9H16HEChshXAGKjl3VwvxkYDEHtMowj8z3UQp
   Mv5W0sN70b289cEAXGRVPMNroF0DT+E4UkfMWwZjKAcaWr/OwlxniOp1/
   A==;
X-CSE-ConnectionGUID: ckpQcKp3Q7mbEzCwpNyOGg==
X-CSE-MsgGUID: 2CuhPTg0SFeP8dKBA80SnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="54365541"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="54365541"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 01:08:42 -0800
X-CSE-ConnectionGUID: 2fwLaAJ+RLq8Ezz3TDYRUg==
X-CSE-MsgGUID: /4r+kX+KREK1dnNljgjQTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="120021311"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 18 Nov 2024 01:08:41 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCxkM-0002LJ-0B;
	Mon, 18 Nov 2024 09:08:38 +0000
Date: Mon, 18 Nov 2024 17:08:30 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Berlin <dberlin@dberlin.org>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/080-wifi 31/48]
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c: feature.h is
 included more than once.
Message-ID: <202411181652.cdQ1E4lT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   bae8b9b1d3b8c3fc9e9e35e1b0656cc5bcdae6ec
commit: 26f14256acfc3deb408e23b14236bf15a5beac40 [31/48] [brcmfmac] Support GCMP cipher suite, used by WPA3.
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411181652.cdQ1E4lT-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c: feature.h is included more than once.

vim +29 drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c

    15	
    16	#include <brcmu_utils.h>
    17	#include <defs.h>
    18	#include <brcmu_wifi.h>
    19	#include <brcm_hw_ids.h>
    20	#include "core.h"
    21	#include "debug.h"
    22	#include "tracepoint.h"
    23	#include "fwil_types.h"
    24	#include "p2p.h"
    25	#include "btcoex.h"
    26	#include "pno.h"
    27	#include "fwsignal.h"
    28	#include "cfg80211.h"
  > 29	#include "feature.h"
    30	#include "fwil.h"
    31	#include "proto.h"
    32	#include "vendor.h"
    33	#include "bus.h"
    34	#include "common.h"
  > 35	#include "feature.h"
    36	#include "fwvid.h"
    37	#include "xtlv.h"
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
