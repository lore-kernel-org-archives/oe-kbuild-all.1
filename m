Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819D4183CB7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Sep 2024 18:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726684661; cv=none; b=VIYVKemfLCVgkaaDQ3mcCQ8S0w/ZPXgfg+bPYOvgFfjEu5NVKP27IH6lVa9keV0Wh/3XSJgDSTEjZEWn+EA85vGx+CVZPOaavg/WfY5/e2Jg6xSHOzNlgJ541CPlNsGS6WcscCi5eqOrnKcB0gFeqLphLcrKEWn4cHsmNicKQCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726684661; c=relaxed/simple;
	bh=K+3HQ0d1NzlmCvM98ntEPZgUZZuCkWLcCwrb8KJ/Tq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NGX89LtV1MUQ33Ag7ZjQ0kKMe6shHcLiJI20zAt3Hwo9BiQKsYJE4SXDTrJ2fuQVCF7aNQFOAcead+AFhp25Y7/w1Nv6X02vuKNvCt98cdoAaWrh4bma6k8MmPrK62IVUfsb3gYxcKNS+EB8+BIVr9as443uJKugODCFVWqM5SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OdY20M2O; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OdY20M2O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726684660; x=1758220660;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K+3HQ0d1NzlmCvM98ntEPZgUZZuCkWLcCwrb8KJ/Tq4=;
  b=OdY20M2O+6AdG6krrHodjAnNiQggIOZpaHTI1/9PP+FTgaHGxixOQsjd
   AIHmszreff7Poh6RYPCW1M+pcSz3SAnNBZ3z0llE+bs/8eQGQszpkHigu
   eSWQj0mi+VtjBPWhHFZBd2pFkGLEndO1cr/cYAKPk924OTrw6l2+twgh6
   quRg8Svs3hQ6r0/fLnF2WkepNCcQPPFvwtCr8ZoIf346R9TKygFSXmWPK
   rNfou9RBSvXrwvD2BDvx6X+tDHj8H/pFQI1ge0H+YfpQ+TOUQzkpN2aiU
   Vs2Wnh5mXgM6DldBTA9GMfTO8fUFGC/UKbk7sqY1DsfH5TjThGIup/m9A
   g==;
X-CSE-ConnectionGUID: C8EdhoZuQxGTmkGJjb8O0w==
X-CSE-MsgGUID: Mo6AOM/6Rwy5PuwAlS1H2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="29406037"
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="29406037"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2024 11:37:39 -0700
X-CSE-ConnectionGUID: slsI/8dtQLW+eJ90IpflLw==
X-CSE-MsgGUID: aONnUXKaQFqMzKm3M2gTnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,239,1719903600"; 
   d="scan'208";a="69271780"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 18 Sep 2024 11:37:37 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sqzYT-000CVu-1f;
	Wed, 18 Sep 2024 18:37:33 +0000
Date: Thu, 19 Sep 2024 02:36:55 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 18546/30000]
 drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such
 file or directory
Message-ID: <202409190213.O87MrkjZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   e073ff7900b8b62320a79db4897d0767b85c54ab
commit: d9a579535cd0f4623e627c3375781fb29c78692b [18546/30000] BACKPORT: arm/arm64: Probe for the presence of KVM hypervisor
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20240919/202409190213.O87MrkjZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240919/202409190213.O87MrkjZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409190213.O87MrkjZ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/firmware/smccc/smccc.c:11:10: fatal error: asm/archrandom.h: No such file or directory
      11 | #include <asm/archrandom.h>
         |          ^~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +11 drivers/firmware/smccc/smccc.c

     7	
     8	#include <linux/init.h>
     9	#include <linux/arm-smccc.h>
    10	#include <linux/kernel.h>
  > 11	#include <asm/archrandom.h>
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
