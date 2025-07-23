Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA505219A9B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 17:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753292737; cv=none; b=OjlrMO0ZIkxQD0S7BbuzeULxHVpB2+hw2naWEBxSV5kUUMdANcDux/iOKK/Ym4JSk2YtK9ZABT/uNIJWZ+/yS29GXOUK6Jm3vN9TrFL+Kp80s3NivEj0Ipqn4z5GAAeyLW9fry1dsSKXiN4Qmoku/p7fFtm7mCakkMWWjp1nxjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753292737; c=relaxed/simple;
	bh=2BrI3holFVUgUw/nqcmGgA/NSLRLMtM9nm3jTFZWdxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u9Pm437yWKZ1ZtqcGM+KnhPhgyaE0AM5tqrr6+zVEYv1qAgcnFjIfdLI/H38K3y2obEGEfTWR0RLJUiWytWTCzAaHn/n0VnG1QhGeRtbGGrUqdJ8HcGZTN/ms4kYAYKN6sieWfiVDslWlgmUGJh2JqS8yEomekpfOsdFjrOgqcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XHn7uJAA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XHn7uJAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753292736; x=1784828736;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2BrI3holFVUgUw/nqcmGgA/NSLRLMtM9nm3jTFZWdxE=;
  b=XHn7uJAAv1aSvVlC8GnzbZqDu5i10K730nDTnrVcwf74KA5JkCVZFuNx
   0QElylC63CPDY/a6qjpgNU4eTYnZdy8IePLhLj5+IbkbFYjisM71/DkdA
   eRS3pO+XAzpDPyqrOief3Ki79QKaFieKo8Z5GqcburndjweZo0vw3UTV6
   MsbXDH7vJh0NEaSUDmPvY0r3zrTCdkLbzs99XGr1IKAG+LThSCa8jVtcM
   kMUKEF+UXgSM4dxmCup+CcJpcBAiYsmR8N21hjWuuKCpe3ACuEk5+NbFG
   qkKosBV358GJELsBtr9zaWmmZVdiiVSVTadcJp8g6uhbmNIbZyRl4fkY8
   Q==;
X-CSE-ConnectionGUID: AHcLO8BvREqQr++L0J6ZeA==
X-CSE-MsgGUID: cBK6BcLbSxCO7BgDdhBqMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73043030"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="73043030"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 10:45:34 -0700
X-CSE-ConnectionGUID: 3QeNmQ4TQ66gG/mDKUCCjA==
X-CSE-MsgGUID: ZtgqPovLRDW49Gf/us01rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="159417978"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 23 Jul 2025 10:45:33 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uedX0-00001F-2A;
	Wed, 23 Jul 2025 17:45:30 +0000
Date: Wed, 23 Jul 2025 11:37:29 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?B?0JTQsNC80ZjQsNC9INCT0LXQvtGA0LPQuNC10LLRgdC60Lg=?= <gdamjan@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [gdamjan:v6.16-rc6/ipu7-imx471 1/4]
 drivers/media/pci/intel/ipu7/ipu7-dma.h: linux/iova.h is included more than
 once.
Message-ID: <202507231112.vJCQpigd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/gdamjan/linux v6.16-rc6/ipu7-imx471
head:   0cd31a5ce76fc71061a50c1fa71b39df3177c1a4
commit: b9eb58bf78c638d1b8b6cc492f186d2fc0b6f1b0 [1/4] copy drivers from github.com/intel/ipu7-drivers
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507231112.vJCQpigd-lkp@intel.com/

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
