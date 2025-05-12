Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D671FC3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 23:00:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747090836; cv=none; b=U8JvuMzbGY2PpeUtjdO6TQzCXzWniThXUnb8o6ZlBVGw+Bu4H6T9WhxmBs4XsJwmttQxERMgP95FZMmAks69m0uarj89mDEIQJt3v5EiwMUU12VFKmtBl8YHHHDyW6u62kRw1E0JMvPMQJesrzLBtwxg/dO12aNxTHHUcSO30DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747090836; c=relaxed/simple;
	bh=MgwD+FUu/elyRuRs/F14sUJe0G6/m4ca2VEE6xORJy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UhSDROYphuN+lSrD3zMK3iUeGLEmL/55FGgqK7ok+clR9pIFvsn/8mtx85PuiE2fxGP7LDj4QYgEeQqi9pc8FJ86YRj3N6VB056Cyb7HoKLOfBPsg48q1I093JPVjq3GS/2+rQvY8O62P16yI3bEq5tuCy8XawsNFneDZeDnWKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UrI5ERg2; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UrI5ERg2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747090833; x=1778626833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MgwD+FUu/elyRuRs/F14sUJe0G6/m4ca2VEE6xORJy4=;
  b=UrI5ERg2uem1rHCcd0gPBzxtW+LfOsVE1Cw7z1j2XCGw/QuNO0tyg2Mq
   SUytwgQFMIQe1fMn0G9Xuh70NZK0T/9B5YPbwDAAtFwNlYfwFlr+ilOce
   ZNCukBBD4pqshWDbAAHCKxg9s94Y3bHEqc9kd9gLLlfzD3hoMxVIoIs99
   RJh1UBjebCi0Dlm2o8HfzF9DCUErmKDeUVIxu8BtzXTWcZTMWqdsEbPrQ
   tGycAZ+kpryOEc8BStILJxyLdcYmYKK+OuPAiRj8WEGfWNjy1b+07ZUA3
   WoNxR+hgJKU4G7pGILvJcw+OC/s8LLczTjQhXSihmJtsSTAvmyfU2q8tM
   w==;
X-CSE-ConnectionGUID: KunrwE86RvuMaKOmj178Fg==
X-CSE-MsgGUID: NLaiLigaQQG0ItvDYRDP+w==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="74312438"
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="74312438"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2025 16:00:32 -0700
X-CSE-ConnectionGUID: 4Wu/FS8bTAGeZRIjYXJ0Aw==
X-CSE-MsgGUID: 0IlKUrttS1eZQmPw7FvOcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,283,1739865600"; 
   d="scan'208";a="142641050"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 12 May 2025 16:00:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEc8L-000FVb-0U;
	Mon, 12 May 2025 23:00:29 +0000
Date: Tue, 13 May 2025 07:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Shi Jing <shijing34@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2220/2220]
 drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c: mag_mpu_cmd_defs.h is
 included more than once.
Message-ID: <202505130655.7iroL05g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e1106320058bf1d983657f80490249b4f919ebad
commit: 0bf0c942a09ba92e1d22e6960464b628dd4408fa [2220/2220] net/hinic3: Synchronize new NIC features and bug fixes
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505130655.7iroL05g-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c: mag_mpu_cmd_defs.h is included more than once.

vim +21 drivers/net/ethernet/huawei/hinic3/hinic3_mag_cfg.c

    16	
    17	#include "ossl_knl.h"
    18	#include "hinic3_crm.h"
    19	#include "hinic3_hw.h"
    20	#include "mag_mpu_cmd.h"
  > 21	#include "mag_mpu_cmd_defs.h"
    22	#include "hinic3_nic_io.h"
    23	#include "hinic3_nic_cfg.h"
    24	#include "hinic3_srv_nic.h"
    25	#include "hinic3_nic.h"
    26	#include "hinic3_common.h"
  > 27	#include "mag_mpu_cmd_defs.h"
    28	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
