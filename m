Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C9C1802E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 01:08:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727485737; cv=none; b=DwkjTDt/mj1dnxw+qPlqzXGj0YHMXYuBokmKH7FKRWge2LLg8q3mCXhT4IoHhIAbA57fnCyTem7t12mCmsheu9iuqC/wV4jymJnYPr77U8IObzFnaUS7BFJ82FtvCKqmOvNLFlI4NhCG9AwQpEk5iKLUi7tgI76+PlmSHb7ug5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727485737; c=relaxed/simple;
	bh=ZDZh2yrqVlN+x+g1P23Roj42orxVzseOag5Out/Qaoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HouwkKnjMcvWVy62KJ9jlsbBnE4Dxt1wanJZi7RUs4voVaKQbIwKIvQH5A/JsIzVRoHSMCe841Cqh9v4uf2HYxnHw7TMu5z4jhHqbZmfa2cCcxhnlZ9Y8lKxFSSK0tp2+vwN8NDHJmU2yVFFXpPB2M7pFbVZKB989A19oUvspfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4WyHWKq; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4WyHWKq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727485735; x=1759021735;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZDZh2yrqVlN+x+g1P23Roj42orxVzseOag5Out/Qaoo=;
  b=S4WyHWKqDrUFrmA0CB9CLTUbxfcv3eRKR/oYpF33DH/SUP7gVeagicZE
   0Egny0c2kyR13JN2i2JEIKWT76uqw2lL2Fi9ype3HQBggHyt4m5mO55IP
   P3aOIpVgtTbFQApzG25wEPqcAvgVpyGvfUcUlF3Eb6kAlclyO672b7Z++
   OjqJNOVAcV/GCJ4bOlAm6GlF9hdOXdAugC5oUgNIVKVfgCm8Mreu3s1vK
   A+7jqUAHpAu7WgKMLEIJwpQ4vu5vPBPKahBlDTs9fBOpHox5aGdWilyM5
   Zrt9u6+CbhFPODfLSTfThejY/ahOybfjl2gg0tfa9NM+nnnuaOGrCfFDh
   A==;
X-CSE-ConnectionGUID: NZC3y5g5SXqfXT5B0iGKpQ==
X-CSE-MsgGUID: NdUWNJBVR1WTotqLtijyqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="44111042"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="44111042"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 18:08:55 -0700
X-CSE-ConnectionGUID: AnlCnwgcRZ+w+5RvExP4bA==
X-CSE-MsgGUID: xsExzq5IT4m32/8XL/lWpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="76786262"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 27 Sep 2024 18:08:53 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suLx5-000Mnf-1Z;
	Sat, 28 Sep 2024 01:08:51 +0000
Date: Sat, 28 Sep 2024 09:08:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13850/23799]
 arch/arm64/mm/init.c:784:17: error: 'mem_sleep_current' undeclared
Message-ID: <202409280825.5UMBIt9A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ding,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: fdda68feeca82610ccbcdcbda7250623a6d187d2 [13850/23799] arm64/ascend: Set mem_sleep_current to PM_SUSPEND_ON for ascend platform
config: arm64-randconfig-002-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280825.5UMBIt9A-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280825.5UMBIt9A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280825.5UMBIt9A-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/arm64/mm/init.c:469:13: warning: no previous prototype for 'arm64_memblock_init' [-Wmissing-prototypes]
     469 | void __init arm64_memblock_init(void)
         |             ^~~~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c: In function 'ascend_enable_setup':
>> arch/arm64/mm/init.c:784:17: error: 'mem_sleep_current' undeclared (first use in this function)
     784 |                 mem_sleep_current = PM_SUSPEND_ON;
         |                 ^~~~~~~~~~~~~~~~~
   arch/arm64/mm/init.c:784:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/mem_sleep_current +784 arch/arm64/mm/init.c

   770	
   771	#ifdef CONFIG_ASCEND_FEATURES
   772	static int __init ascend_enable_setup(char *__unused)
   773	{
   774		if (IS_ENABLED(CONFIG_ASCEND_DVPP_MMAP))
   775			enable_mmap_dvpp = 1;
   776	
   777		if (IS_ENABLED(CONFIG_ASCEND_IOPF_HIPRI))
   778			enable_iopf_hipri = 1;
   779	
   780		if (IS_ENABLED(CONFIG_ASCEND_CHARGE_MIGRATE_HUGEPAGES))
   781			enable_charge_mighp = 1;
   782	
   783		if (IS_ENABLED(CONFIG_SUSPEND))
 > 784			mem_sleep_current = PM_SUSPEND_ON;
   785	
   786		return 1;
   787	}
   788	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
