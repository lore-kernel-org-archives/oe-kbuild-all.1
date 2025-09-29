Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E4EA1E260A
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Sep 2025 08:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759135583; cv=none; b=gJ241m/GMiAU8qkJou+vCJeEy0CsOpU4KbfUa7Z7nx7P/33M9CnWUeev/XgBAkz/R9MxDgnaTeJAHhC56av3DYP8I721CLFtTHXSE5TQW2gvaFdReXbDpZesHCvnDSlyNPMY17TPKjHuuzxAZI8CZ/58vDdM8568Eny9r3TGMZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759135583; c=relaxed/simple;
	bh=8AqkbB05JBRbZuhpOE+q7kuaSacm2BIt4tA+a8aL+sY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BpStTWOUr6PCb5pDOxPUCDRTYaVkCsGfq8JtZo8czXt2y2LkrDpZ++irui1ZRz73GTtY6KOapahe3nRroeuyxczXJrOfJR1QHRxOepaknJIEgEDrm5ObbVWLknsDBWbos6w5hEVDMngnFcZgeTQwlq8Tn9kb+zpo2amNrXtRVi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i6wtpMCV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i6wtpMCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1759135582; x=1790671582;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8AqkbB05JBRbZuhpOE+q7kuaSacm2BIt4tA+a8aL+sY=;
  b=i6wtpMCVky9PFYthqVRr0W4SsfKPNNJr6VduUaq7OMbJMPtbeHpbmVkD
   7aZ2EwBbEfjDJdIwpt1MrsPEZVSG/KZTKzicEzgjQx06z5omgOjdbB95W
   LfObF71l8ryVlIa8CZs5aDnNyOtc02xp8hjTEca5W9vkpuovddj7ARp+P
   mU7J82qAF1ezzBj/3a7Y9V6yG3YEFlX5fIrtZw0JSOBHHcJAEiXTOjWke
   dtKlvDlkr2kAIyaSuGGbI/k0fFHbMVR0tZ6bnrb+1fnyYKw+NGOV4fqOG
   0chYDasJfCEg9XO36jRSKEByR95mavtXKKvPu2BkR9xVSCJAxUUQkobRh
   w==;
X-CSE-ConnectionGUID: XGN1xOUTRGGTrmZCOp+Yiw==
X-CSE-MsgGUID: 8J3dam0ASaOrlDrk9N/yig==
X-IronPort-AV: E=McAfee;i="6800,10657,11567"; a="61540196"
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="61540196"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2025 01:46:22 -0700
X-CSE-ConnectionGUID: 0BqDvpe6Ti+jfikhTo2yww==
X-CSE-MsgGUID: 9dy1ZL6AS/6Slx+WvkEGTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,301,1751266800"; 
   d="scan'208";a="178007974"
Received: from lkp-server01.sh.intel.com (HELO 2f2a1232a4e4) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 29 Sep 2025 01:46:19 -0700
Received: from kbuild by 2f2a1232a4e4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v39WT-00004p-0O;
	Mon, 29 Sep 2025 08:46:17 +0000
Date: Mon, 29 Sep 2025 16:45:18 +0800
From: kernel test robot <lkp@intel.com>
To: Yonghua Huang <yonghua.huang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Yifan Liu <yifan1.liu@intel.com>,
	Fei Li <fei1.li@intel.com>
Subject: [acrn:6.12/linux 2/10] mm/hugetlb.c:51:10: fatal error:
 asm/hypervisor.h: No such file or directory
Message-ID: <202509291627.vYATRpvH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/projectacrn/acrn-kernel 6.12/linux
head:   a3634b1a933e80ff672cc47bd32d2f036cfbe755
commit: 9ec53c7650a0ddf3081191667b88940dd415a3a3 [2/10] postpone ACRN guest VM memory cleanup
config: s390-randconfig-001-20250929 (https://download.01.org/0day-ci/archive/20250929/202509291627.vYATRpvH-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250929/202509291627.vYATRpvH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509291627.vYATRpvH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/hugetlb.c:51:10: fatal error: asm/hypervisor.h: No such file or directory
      51 | #include <asm/hypervisor.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +51 mm/hugetlb.c

    43	
    44	#include <linux/io.h>
    45	#include <linux/hugetlb.h>
    46	#include <linux/hugetlb_cgroup.h>
    47	#include <linux/node.h>
    48	#include <linux/page_owner.h>
    49	#include "internal.h"
    50	#include "hugetlb_vmemmap.h"
  > 51	#include <asm/hypervisor.h>
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
