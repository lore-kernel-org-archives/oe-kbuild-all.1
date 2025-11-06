Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 843A7E573
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Nov 2025 07:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762413760; cv=none; b=izzJIjJNnBy8uF1gU61ZBPv2R9PAbQZiKikkwl27el0x/FIOR4AQEQkoiFrW+DLH305jvIYGIPtHbxGAM50QsCJg15bdc59G8zLHqGNDOZL46soZn3oumsGkAGWvixvSIiC+ze+LKkMP2yg3/T6yCRsOVxw4Mrxt1LoR1YlUgyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762413760; c=relaxed/simple;
	bh=HJQ8XVVNQwVW91qCqEfgpnQdAjx30LzFil0Knzpe0OM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jnjKpKc26g7Wcgg8KXua/Yqm7UBo3E1i/b14qajMlmqNx1TiIw6M+eZwy/XVyyLyxr3M8Kx2RgyLOCzaKMfjggMTxUep+qEU7MYb9mzuNBNtTG7DMQ60B0yr8yjs89YvOXJNVOX35n7ZA2eDaomaRbyjl0r6M8tHsAyZuL2RXPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k/UK4+il; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k/UK4+il"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762413758; x=1793949758;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HJQ8XVVNQwVW91qCqEfgpnQdAjx30LzFil0Knzpe0OM=;
  b=k/UK4+ilbBQD5ApGSfvbaE6/S5LzVnYjlRu6M1KuqFAtP4JsV2pCd3r9
   U72UaOu2FeHYZQjAX8fpwnPoz4lsWQPRe75TGXzuQDFVrxTs8LVPZRXxT
   HHyvn7KwQ6CqDiqSz7VLNvCDMWZlfS32Jv4xkCQjpJGmi3D34gslGnLFP
   UUwSv2pbzMSHJ1pDPxt+rnSj+t9t7KxDcuCOKblLt01E9fY1wRtBj/RFn
   oHZUr1baSQmLTXDT91NgfTbUdukYB6O9kuh6P4M1qrw+ut1ZZ3G3/HlFc
   u1EOmb4iK/h0M7F47oacyVMBk1ePdAxSeS/NrqqAmJjgg/lSgELpxyQB+
   w==;
X-CSE-ConnectionGUID: Cf2FRnWpS4qp8serl9yF4A==
X-CSE-MsgGUID: JQmbYv5OQeeStqtmNZHSjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11604"; a="64424578"
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="64424578"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 23:22:37 -0800
X-CSE-ConnectionGUID: rcxZGJQYSducliTZe7/+yQ==
X-CSE-MsgGUID: oES65+DWT9CouWond4glVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,283,1754982000"; 
   d="scan'208";a="187527941"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 05 Nov 2025 23:22:37 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGuKI-000Tbc-2P;
	Thu, 06 Nov 2025 07:22:34 +0000
Date: Thu, 6 Nov 2025 15:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: Weidong Wang <wangweidong.a@awinic.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [broonie-ci:v3_20251028_wangweidong_a_rework_the_awinic_driver
 41/46] sound/soc/codecs/aw88261.c:16:10: fatal error:
 aw88395/aw88395_data_type.h: No such file or directory
Message-ID: <202511061527.HotyfTQe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git v3_20251028_wangweidong_a_rework_the_awinic_driver
head:   6911f5ed5253f3a0deaa3dea2e9e8cfa4324048e
commit: dc3ed59a386ff3ca76a05e77f29f5c34f9e4b23b [41/46] ASoC: codecs:Rework the awinic driver lib
config: sparc-randconfig-002-20251106 (https://download.01.org/0day-ci/archive/20251106/202511061527.HotyfTQe-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251106/202511061527.HotyfTQe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511061527.HotyfTQe-lkp@intel.com/

All errors (new ones prefixed by >>):

>> sound/soc/codecs/aw88261.c:16:10: fatal error: aw88395/aw88395_data_type.h: No such file or directory
      16 | #include "aw88395/aw88395_data_type.h"
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +16 sound/soc/codecs/aw88261.c

028a2ae256916e Weidong Wang 2023-08-04  10  
028a2ae256916e Weidong Wang 2023-08-04  11  #include <linux/i2c.h>
028a2ae256916e Weidong Wang 2023-08-04  12  #include <linux/firmware.h>
028a2ae256916e Weidong Wang 2023-08-04  13  #include <linux/regmap.h>
028a2ae256916e Weidong Wang 2023-08-04  14  #include <sound/soc.h>
028a2ae256916e Weidong Wang 2023-08-04  15  #include "aw88261.h"
028a2ae256916e Weidong Wang 2023-08-04 @16  #include "aw88395/aw88395_data_type.h"
028a2ae256916e Weidong Wang 2023-08-04  17  #include "aw88395/aw88395_device.h"
028a2ae256916e Weidong Wang 2023-08-04  18  

:::::: The code at line 16 was first introduced by commit
:::::: 028a2ae256916eeae1040049d2d0129535ace60e ASoC: codecs: Add aw88261 amplifier driver

:::::: TO: Weidong Wang <wangweidong.a@awinic.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
