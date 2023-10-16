Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02061369
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Oct 2023 01:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LeyNAQ4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697419660; x=1728955660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3AAHPRkNATl1CCS2KLwll22HQssrNALjBx0l+DhzaQA=;
  b=LeyNAQ4UtiLhvBv2os2EDWgVqicCL8dSvA/msZ4EUSfRjIoiJZxtgRcw
   KEpPOE3TBMS3CfwflJcGjIjcKabf/mPxHCJ9gUi7sdZsGceYsX8fWIZHy
   d1/lJlm+/Mw0vrBDm26sqySKFJC9XJrnobW4Znw5suKui37gln88fBZxg
   YKmyyc+SNXmYiJuCDY0iDg5hxSrf/HPO7T1Qp9qOIoxhkkPyABIepPNW0
   oX7WL90wwUaRCFkq65oLj+IUNfWY+yJ6d4hbYpJV/vfVoq1SbtvZjSHaA
   fpmaalb05jKjfrHkMphYrlitIVc1DRX12gRiCAx44NO58biJoYMw6viOd
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384303272"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="384303272"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 18:27:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="705416283"
X-IronPort-AV: E=Sophos;i="6.03,228,1694761200"; 
   d="scan'208";a="705416283"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 15 Oct 2023 18:27:37 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsCON-00080U-0q;
	Mon, 16 Oct 2023 01:27:35 +0000
Date: Mon, 16 Oct 2023 09:27:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.1-2.1.x-imx 3612/15768]
 include/linux/irqchip/arm-gic-v3.h:604:10: fatal error: asm/arch_gicv3.h: No
 such file or directory
Message-ID: <202310160918.LkP6sPf4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.1-2.1.x-imx
head:   3f41fbe42851375d3d5996e4bf9e9809e6c79517
commit: 7202e9d68c0e202221485803b0caf354f5898051 [3612/15768] firmware: imx: scu-pd: Add IRQSTEER wakeup support
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231016/202310160918.LkP6sPf4-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231016/202310160918.LkP6sPf4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310160918.LkP6sPf4-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/firmware/imx/scu-pd.c:60:
>> include/linux/irqchip/arm-gic-v3.h:604:10: fatal error: asm/arch_gicv3.h: No such file or directory
     604 | #include <asm/arch_gicv3.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +604 include/linux/irqchip/arm-gic-v3.h

7e5802781c3e10 Andre Przywara        2014-11-12  603  
7936e914f7b082 Jean-Philippe Brucker 2015-10-01 @604  #include <asm/arch_gicv3.h>
021f653791ad17 Marc Zyngier          2014-06-30  605  

:::::: The code at line 604 was first introduced by commit
:::::: 7936e914f7b0827c2dcfe63fbefdc21de2d61dcb irqchip/gic-v3: Refactor the arm64 specific parts

:::::: TO: Jean-Philippe Brucker <jean-philippe.brucker@arm.com>
:::::: CC: Marc Zyngier <marc.zyngier@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
