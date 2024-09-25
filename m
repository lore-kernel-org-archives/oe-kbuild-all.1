Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA1E18D63B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Sep 2024 01:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727226113; cv=none; b=m3zmcGKOOFRfS3Jit7TEjfPFQREriYOuxGgouJdAH+NRrON0yhpgxKqRIjlwvvsmApchEUdg/OKQod+X6A8w5Zbnzv0I5W9TMFcdcNTXi3Bsz/k7wtHcwT8F4W8Bo147h6/Ux09BabsJwl6C2qnmSqaQVxrL4qegu2RmLvDeGzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727226113; c=relaxed/simple;
	bh=LeoRuQUSOkNLziGIuydu/aCrD8Jok0/+YSzwOGBPjP0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bcDYsXiY3wj23amcTCNeM8HAQwGkLoZAMwOgFapaIPsd50E80a/2yd4MwJx7uh3neSMTboBTcjp+pCxXukB2gj9d3nvSohSTD9AQkq5dOzONs74SaMaJVZnQCWsVmiSeybNDOeNtkfwZnUTqsz4XRk+YzxNqhBNrbe2EdIpYrEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X/keP+/Z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X/keP+/Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727226111; x=1758762111;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LeoRuQUSOkNLziGIuydu/aCrD8Jok0/+YSzwOGBPjP0=;
  b=X/keP+/ZCn3wXBwmKbphTZsCXLwqiM6wxXh7WovnEBv5dlvoVD7RRe/5
   6eyZXnsMD/7FNAamBTtAbu/mgRKnsglUUUoj4bGQX0nvJ5ZExqbuzTDpJ
   jExtnQS0vNwzTgOVLKR/x6bkwAXpby+etyt0h1KdbXNbNvTWOW79QquwM
   8a9K324GFVO2FBaaDj+LBhw4AmwLtrbe3LZ3p8Q+OAaaLIZ+J8vMARoWb
   H7Rpeobj9vfMqtO71wCUZJNoR2LnaWBezBqehrgxpv46ToJXDxoKd4GNH
   NjANmNRQnz6GPryq7C9JGLondTTBtL7a44z6PUPr9H6saovZuvnElUg82
   w==;
X-CSE-ConnectionGUID: jPBBiIAaQASvRpb79FcFUA==
X-CSE-MsgGUID: bDJQcuUISWWZe9nsLS8bFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="36820211"
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="36820211"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2024 18:01:50 -0700
X-CSE-ConnectionGUID: 6XERYsU6TNyAWyOySc7U9Q==
X-CSE-MsgGUID: slZV3q+ER4aTjX0DR+d3+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,256,1719903600"; 
   d="scan'208";a="76396926"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2024 18:01:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stGPa-000J0F-2l;
	Wed, 25 Sep 2024 01:01:46 +0000
Date: Wed, 25 Sep 2024 09:01:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiongmengbiao <xiongmengbiao@hygon.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 13560/14103] include/linux/psp-hygon.h:257:1:
 error: conflicting types for 'vpsp_try_do_cmd'
Message-ID: <202409250819.8xNdiVIP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   d25e57f47750555950b12145f98d5168319e6712
commit: 3ce4cb81ef2b148f6c830c7debb4405e26cded1c [13560/14103] drivers/crypto/ccp: support TKM run on CSV
config: x86_64-buildonly-randconfig-006-20240925 (https://download.01.org/0day-ci/archive/20240925/202409250819.8xNdiVIP-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240925/202409250819.8xNdiVIP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409250819.8xNdiVIP-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kvm/svm/svm.c:25:
>> include/linux/psp-hygon.h:257:1: error: conflicting types for 'vpsp_try_do_cmd'
     257 | vpsp_try_do_cmd(int cmd, phys_addr_t phy_addr,
         | ^
   include/linux/psp-hygon.h:253:1: note: previous definition is here
     253 | vpsp_try_do_cmd(uint32_t vid, int cmd,
         | ^
   include/linux/psp-hygon.h:285:5: warning: no previous prototype for function 'psp_register_cmd_notifier' [-Wmissing-prototypes]
     285 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^
   include/linux/psp-hygon.h:285:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     285 | int psp_register_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         | ^
         | static 
   include/linux/psp-hygon.h:286:5: warning: no previous prototype for function 'psp_unregister_cmd_notifier' [-Wmissing-prototypes]
     286 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         |     ^
   include/linux/psp-hygon.h:286:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     286 | int psp_unregister_cmd_notifier(uint32_t cmd_id, p2c_notifier_t notifier) { return -ENODEV; }
         | ^
         | static 
   2 warnings and 1 error generated.


vim +/vpsp_try_do_cmd +257 include/linux/psp-hygon.h

   247	
   248	static inline int
   249	vpsp_try_get_result(uint8_t prio,
   250			uint32_t index, phys_addr_t phy_addr, struct vpsp_ret *psp_ret) { return -ENODEV; }
   251	
   252	static inline int
   253	vpsp_try_do_cmd(uint32_t vid, int cmd,
   254			void *data, struct vpsp_ret *psp_ret) { return -ENODEV; }
   255	
   256	static inline int
 > 257	vpsp_try_do_cmd(int cmd, phys_addr_t phy_addr,
   258			struct vpsp_ret *psp_ret) { return -ENODEV; }
   259	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
