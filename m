Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1D21C7009
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Jun 2025 20:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751141284; cv=none; b=oJ5scGlGuEJ3faxzDrOKwUmpeWmCxYTOGgw5XNS/yGXzp980TsGyeDdb1ypMqZ1bizk29He3eLd4C7iaXHXVCY7eLt/cAtdjGlV0rO0gmEFKjZ0KR7Qvw8WSrt/JGnJ8UrfpqVpzFjv48UMXOsNZu4apW8fv4mP1AaYNgi+1Z4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751141284; c=relaxed/simple;
	bh=fcQHLlZqBoiEDrIt5/F3ZQ8A0HrIWQAcDnsjevvnNYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K9dMZRK20B9ftFLkyCetQI8ouXtxnswmk0zZjJI5ASeJux4qU7Xs/DZ3Pb/TnGXf3xNya5Q1odT8FHEu067mcSkB1vRA9XZsWrC1P6Dsah5Nm7DfiVzOWbhd8jc52Kv6Pmj4AMP6SE5P5sPV81Nc+wUNw9nzHTZbDvGg218p7Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oE7srqxV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oE7srqxV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751141284; x=1782677284;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fcQHLlZqBoiEDrIt5/F3ZQ8A0HrIWQAcDnsjevvnNYk=;
  b=oE7srqxVFt8DCO+1qTZ9ywymGxPNk1Zs5Z8IqZix98hVdC05XwuG0lc2
   yj87j45I4u+3iu1nnKToy1FyOwwA8qJa/AiA8MnEA2oO77EBCn0LeTenB
   t1ONlrSwZLAdUccLV6nfyoXiChNJ4q2Opdn1UR+vGasy8TpGsYwVOcfBy
   8mm0GHVF5LdFbAMGn/W9qQas3ruyhAXDujDNqb6vGaMjtQgcyzL2yM4g0
   GQElkO7JZFQzCrJgtMdmcF6sdtPLnR3gp+DmTJcXDkIPV9c6MIni9x0oG
   IaV7rWAyeDoptc2xH+32sDGpT31GyLmPmAI60cT81MgmAKRtSaIThuhAF
   Q==;
X-CSE-ConnectionGUID: 9eWNuCrCTKWu32v63E6aLw==
X-CSE-MsgGUID: U/1dpMwxR+eum02J+ImZ6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11478"; a="53517467"
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="53517467"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2025 13:08:03 -0700
X-CSE-ConnectionGUID: PWj5w7ZKRhq4f6xYWQ+9KQ==
X-CSE-MsgGUID: 3KZG4+/vS26z+xxUCMpYDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,273,1744095600"; 
   d="scan'208";a="190262670"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Jun 2025 13:08:02 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVbqB-000XLS-1d;
	Sat, 28 Jun 2025 20:07:59 +0000
Date: Sun, 29 Jun 2025 04:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?0JTQsNC80ZjQsNC9INCT0LXQvtGA0LPQuNC10LLRgdC60Lg=?= <gdamjan@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gdamjan:v6.16-rc3/ipu7-imx471 1/4]
 drivers/media/pci/intel/ipu7/ipu7-dma.h: linux/iova.h is included more than
 once.
Message-ID: <202506290333.pcOWxijL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gdamjan/linux v6.16-rc3/ipu7-imx471
head:   045e8700d4a10d6d9159291b2df0b84413501874
commit: 8e9f82059ae3a9e0439a15584792a8935f9272dc [1/4] copy drivers from github.com/intel/ipu7-drivers
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506290333.pcOWxijL-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/pci/intel/ipu7/ipu7-dma.h: linux/iova.h is included more than once.

vim +9 drivers/media/pci/intel/ipu7/ipu7-dma.h

     6	
     7	#include <linux/dma-map-ops.h>
     8	#include <linux/dma-mapping.h>
   > 9	#include <linux/iova.h>
  > 10	#include <linux/iova.h>
    11	#include <linux/scatterlist.h>
    12	#include <linux/types.h>
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
