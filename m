Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9BD2900
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Oct 2023 11:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bQp+f6rB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697371062; x=1728907062;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x9MxdwtIRWZoQP3uuH/5apZvdHnT0MwfsVHhD4FZTI0=;
  b=bQp+f6rBneuxli+mPs6iaWieg/zUXHb67DLE2bsAxmdH/NZSKuedHJYG
   f5R4pfAnBAsSZH/7GBr01Kel1kGhzNbMJEE4PpKOKJll6a0BvBf1ha2Ik
   MQvn26VSb/y7hK3EDXxiRCle6MsYEN/NscDUn+OjUKxwTJUpIzzhR1kXU
   bTGvz3GVBNWH8wJxZspjb3Ye6MxcaNi80sqNoTlcjj7wpxkwe9khQ20pu
   slmC6IY46LT23tl9YViMmUqyYxJciWyP1GKewA0xqpp9gfz0TInonCEUx
   dl2IGP+Qd2lL8lRxKau3KZm7MSN27U4vHRx0fxYuUcAMTCt1+5swTkUaF
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="449577250"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="449577250"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 04:57:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="790478502"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="790478502"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 15 Oct 2023 04:57:39 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qrzkX-0007Nt-1x;
	Sun, 15 Oct 2023 11:57:37 +0000
Date: Sun, 15 Oct 2023 19:57:00 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/643 4631/15767]
 drivers/firmware/imx/ele_trng.c:91:5: error: redefinition of 'ele_trng_init'
Message-ID: <202310151956.a2fiayzb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Gaurav,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/643
head:   1fef7a26b48f767bcda4f5147cea10e83903ecf6
commit: 45df0f582836b4f75f20627d85dff2668bde0f17 [4631/15767] LF-7285: firmware: imx: ele: Add support for ELE HW Random Number Generator
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20231015/202310151956.a2fiayzb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231015/202310151956.a2fiayzb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310151956.a2fiayzb-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/imx/ele_trng.c:44:5: warning: no previous prototype for 'ele_get_random' [-Wmissing-prototypes]
      44 | int ele_get_random(struct hwrng *rng, void *data, size_t len, bool wait)
         |     ^~~~~~~~~~~~~~
>> drivers/firmware/imx/ele_trng.c:91:5: error: redefinition of 'ele_trng_init'
      91 | int ele_trng_init(struct device *dev)
         |     ^~~~~~~~~~~~~
   In file included from drivers/firmware/imx/ele_trng.c:13:
   drivers/firmware/imx/ele_mu.h:146:19: note: previous definition of 'ele_trng_init' with type 'int(struct device *)'
     146 | static inline int ele_trng_init(struct device *dev)
         |                   ^~~~~~~~~~~~~


vim +/ele_trng_init +91 drivers/firmware/imx/ele_trng.c

    90	
  > 91	int ele_trng_init(struct device *dev)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
