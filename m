Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51D7158A09
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 21:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735419765; cv=none; b=HF5LeZiVa+gAfxIFy0Ro4wh97DkaFT3c5PvTGmQ1Wzgvvpa43GPOcKVUqGz0kg8EL3LE2XcST+OLjZffNrtntvYzLUv6V87nBuPgkP8pRsBAUZ79pnlnCrpU/0nWGi+1K6pXw2RAHNb8Qf/ZnRUNTGHfUMl9fIb7SBwZX9KoTic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735419765; c=relaxed/simple;
	bh=b4osAFGCeAmEENHbPUJmL+fRmvq+Cfu3YCnj6J9jxPA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gNZWjuylVcA7hXQhyZBuAzRcozdfwK7+L7AF+rVbE4RSIGDfhtX+1VfiH0QzyPgtfWMIlxOK8Ib/qOJGdVXcZwu8UqVOoNu4M0FB/GMw3XCpnrj3v0dQHOMKWblsQimAA0Qfw1ysYiZUlUhpB6N75D6zD1eha2fWChwASvEsSFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7uY/vA1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7uY/vA1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735419764; x=1766955764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b4osAFGCeAmEENHbPUJmL+fRmvq+Cfu3YCnj6J9jxPA=;
  b=G7uY/vA1nVFlzxv8GSuQ33ZbfCpGcSnB8PefVwfHeF/edPT9H2o3JM52
   gIr9pPQhI4OE1KafHkskjBAyXyP81kByoEMQiRuBlYYF1nG23VYGEqFqR
   xBvDvgIQ4vOELjiGSSYN9efhhwQVJ9tRhzOSijOUlfyqc//QCLjMMGCsQ
   lipYjXHEzE9y07serhf/NicwMRoRltWV2Bg4SEk5exDslnbtmH/UT1Frj
   luGtEvjNEAUs7DiuzqduiV59aNbqhJ/gkT7n/ydBckBFV7Mckc6TKUIVd
   0Hkm82b6AR4UiH/XkPxivhlx1XZi1dtWxGGuT2MVhiYhCBr41En1If/Wj
   A==;
X-CSE-ConnectionGUID: Yhykt0PEQCy4MdvK2KAg0w==
X-CSE-MsgGUID: MEQz4DeXR6Sj5KIJfTIrfw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35926091"
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="35926091"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 13:02:43 -0800
X-CSE-ConnectionGUID: Z0juAw2GRFOTle1DB4NXqA==
X-CSE-MsgGUID: 6QTSbEM7RP60YcYgivFj0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,273,1728975600"; 
   d="scan'208";a="100545983"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 28 Dec 2024 13:02:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRdxH-0004JM-1N;
	Sat, 28 Dec 2024 21:02:39 +0000
Date: Sun, 29 Dec 2024 05:02:30 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1358/1358]
 drivers/edac/i10nm_base.c:135:19: sparse: sparse: cast removes address space
 '__iomem' of expression
Message-ID: <202412290441.n0ZIl7ko-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: 3b7ad71a0a415eb51fb41ddc01ef538a7e163de4 [1358/1358] Intel: EDAC, i10nm: Add a driver for Intel 10nm server processors
config: x86_64-randconfig-121-20241228 (https://download.01.org/0day-ci/archive/20241229/202412290441.n0ZIl7ko-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241229/202412290441.n0ZIl7ko-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412290441.n0ZIl7ko-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/edac/i10nm_base.c:135:19: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/edac/i10nm_base.c:157:31: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/edac/i10nm_base.c:158:37: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +135 drivers/edac/i10nm_base.c

   130	
   131	static bool i10nm_check_ecc(struct skx_imc *imc, int chan)
   132	{
   133		u32 mcmtr;
   134	
 > 135		mcmtr = *(u32 *)(imc->mbase + 0x20ef8 + chan * 0x4000);
   136		edac_dbg(1, "ch%d mcmtr reg %x\n", chan, mcmtr);
   137	
   138		return !!GET_BITFIELD(mcmtr, 2, 2);
   139	}
   140	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
