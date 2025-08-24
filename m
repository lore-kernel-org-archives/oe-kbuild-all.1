Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52684213E6D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 21:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756070785; cv=none; b=K1Bn78yFAoMuA/M5lQPFnBDJ4NktHbEfYJWxbB8G8HltrFpadKz+BHU6OuyTxlQtbkPp9PSgIWK+kA5+PVy4pnlXTQPCdmiFySmXiBWuhufpYuxyIaTsbTFNHhYq2WUhJlyyHfeDSaVQAMy0Y5FdhFeH9HPV2WfNuQRSpHcTMx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756070785; c=relaxed/simple;
	bh=QI6FDgz3zC/BdhFvek2cR9PyeP4g/9vtrExyTYplqAY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H7Hu2+3szEil8AcV2iaZJ8VCBiPvxK8AVnTj4OJ42gPfeofrE+GjwdM2VD0K1V7qxKPz0IVHmAGiWnOdv/B+Bj0Z6sL9g/xF5P5Gehgyen03OgSeE3awqOOdR0ybz+4x/W/94dpjlTW/Rp5u96FlCl0cHp9Z7lLcspOyKLQkuOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AXFK+O4X; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AXFK+O4X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756070783; x=1787606783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QI6FDgz3zC/BdhFvek2cR9PyeP4g/9vtrExyTYplqAY=;
  b=AXFK+O4Xgb1EtbqKKEYxKMFNTmIXG+wJiXaL0kvUlGoBdLwVEYGs4Uqp
   DWW5b9WVkfdGLYG0VLaDLkAdjZTtyCE2v27dnW0gvRdBjIEjkn94qj3E1
   wXMs4ZASj/3Ext4OQDjopCibgLNKB6ODKphSB9ejVCUo3rF+xRhKqXdPd
   BFrRa3KsMDJhJd0hawy4DqSu0/V0F5IIOWqRf5j+7QqHDt0fE9UQqMfLJ
   cOX+rSH8SDBepbR7UjMdmBuyLJWUA79O0m5opZJEhj/J/muOFMmdTWj/c
   1x6aBvuhtMMlzgFdHMTfr6llTrW0D5aRhQaEu+jdLVR86g7nxARLB0CBr
   w==;
X-CSE-ConnectionGUID: sV/heVKSTYewIgdh4yGI0A==
X-CSE-MsgGUID: JoVLsnUvRg+0Cf+k/ytT/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="69660682"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="69660682"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 14:26:22 -0700
X-CSE-ConnectionGUID: o5cOQ/UARhCGZE5xumFo1g==
X-CSE-MsgGUID: vlrvz7/pSmqIVVqSzcv0+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="206310389"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 24 Aug 2025 14:26:22 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqID5-000NDq-1R;
	Sun, 24 Aug 2025 21:26:04 +0000
Date: Mon, 25 Aug 2025 05:24:54 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sven:wip/atcphy 6/21] ERROR: modpost: "dwc3_enable_susphy"
 [drivers/usb/dwc3/dwc3-apple.ko] undefined!
Message-ID: <202508250558.qPhGWbmo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git wip/atcphy
head:   85466c2f0af7311c8d300394873d5be2e111d752
commit: 3a184a84b76cb46d8c3485830ee340e705adba4d [6/21] usb: dwc3: Add Apple Silicon DWC3 glue layer driver
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250825/202508250558.qPhGWbmo-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508250558.qPhGWbmo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508250558.qPhGWbmo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "dwc3_enable_susphy" [drivers/usb/dwc3/dwc3-apple.ko] undefined!
>> ERROR: modpost: "__tracepoint_dwc3_readl" [drivers/usb/dwc3/dwc3-apple.ko] undefined!
>> ERROR: modpost: "__traceiter_dwc3_readl" [drivers/usb/dwc3/dwc3-apple.ko] undefined!
>> ERROR: modpost: "__tracepoint_dwc3_writel" [drivers/usb/dwc3/dwc3-apple.ko] undefined!
>> ERROR: modpost: "__traceiter_dwc3_writel" [drivers/usb/dwc3/dwc3-apple.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
