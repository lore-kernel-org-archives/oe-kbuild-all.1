Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00E9146590
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Apr 2024 22:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714256822; cv=none; b=s78Hcnql3/2eeRXGKBRtSIR4tX2AJNxlFz53cfVFLZAv7bRczRhDycBqSs/6KRUgA9yWhOkxI2blBCdo+Ov+fRGzPQ1LNOnUSTLvzUTHqPkE4eaeYtmI+hJNgbiWEBjRD+ZEzLORuRKA4jmrnvizepbRZVGrL0DLV8t+z7nP/H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714256822; c=relaxed/simple;
	bh=FwFfZrdoYaHZ4X1M6Ljb+bXbLGSsx6mkSU34UCvTR4E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jwz7x6At2BV63g+lWunOPDejCrOsjf4S0VbeeKF8mJjJN4KidoEDKeH/NmcuJE5/5WjKmRrrw+hyr1fYsEjt8nKK3ia9emlHpDwNg3+VDax9oiXJIj8GPM90Yv6c2u2Xq3zVoE6gmpqyPhtVd1mrnaUdV1KN/5jYGpPRR9xcPb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JoT5qWle; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JoT5qWle"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714256820; x=1745792820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FwFfZrdoYaHZ4X1M6Ljb+bXbLGSsx6mkSU34UCvTR4E=;
  b=JoT5qWleyKXZiCcTQuy8VZbYt3xSiOh8bfjPS65JSipdhHfzHw401umQ
   aAtlEc7v0F5omVuc5/VHxwJVcsAqETFnQ6gz9jdZELHNJDo2NHwtIlPn/
   f3rFoJGiCUed+t0PwNuqVORaVRZNEfw0KAbDfDWAC+0CVsuz1oTxEHTzg
   EjKx8JRT42N/AveCAzkDpllsuJzwxJYaFNOR5+4Vc1ONGH+9M/Qnm3wVP
   LNY4SZTfJcEI6jGfHS7YmsqsXRan1qp9POPFCm/jtD0PF8sDs2pGb8lYA
   6RKcS6OpF4oXa3i5uAWqMZb+7XzX3iKo1/H6tALcjRL2rjYBuzIft/kWH
   g==;
X-CSE-ConnectionGUID: 77Xx/XjkTTWJRdZbExOlnw==
X-CSE-MsgGUID: 0f4IAOVERDCbvDJRt/y4nw==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="10125186"
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="10125186"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2024 15:26:57 -0700
X-CSE-ConnectionGUID: JHSQ5IvbR/u0AW2vzVJpKw==
X-CSE-MsgGUID: VTpH91fGQsWhtzrDBUfykA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,236,1708416000"; 
   d="scan'208";a="25622224"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Apr 2024 15:26:56 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s0qVS-0005ZU-0A;
	Sat, 27 Apr 2024 22:26:54 +0000
Date: Sun, 28 Apr 2024 06:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 4982/11728]
 drivers/soc/imx/soc-imx9.c:97:34: warning: unused variable
 'imx9_soc_of_match'
Message-ID: <202404280645.FbSLsgdV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jacky,

First bad commit (maybe != root cause):

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: a5244ebd30622a727c7164f057810a4396e30845 [4982/11728] LF-10572 soc: imx9: consolidate the soc info probe method
config: x86_64-buildonly-randconfig-002-20240428 (https://download.01.org/0day-ci/archive/20240428/202404280645.FbSLsgdV-lkp@intel.com/config)
compiler: clang version 18.1.4 (https://github.com/llvm/llvm-project e6c3289804a67ea0bb6a86fadbe454dd93b8d855)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404280645.FbSLsgdV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404280645.FbSLsgdV-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/soc/imx/soc-imx9.c:97:34: warning: unused variable 'imx9_soc_of_match' [-Wunused-const-variable]
      97 | static const struct of_device_id imx9_soc_of_match[] = {
         |                                  ^~~~~~~~~~~~~~~~~
   1 warning generated.


vim +/imx9_soc_of_match +97 drivers/soc/imx/soc-imx9.c

af940fb78034a2 Alice Guo 2022-05-18   96  
af940fb78034a2 Alice Guo 2022-05-18  @97  static const struct of_device_id imx9_soc_of_match[] = {
af940fb78034a2 Alice Guo 2022-05-18   98  	{ .compatible = "fsl,imx93-soc", },
a5244ebd30622a Jacky Bai 2023-11-15   99  	{ .compatible = "fsl,imx95-soc", },
af940fb78034a2 Alice Guo 2022-05-18  100  	{ }
af940fb78034a2 Alice Guo 2022-05-18  101  };
af940fb78034a2 Alice Guo 2022-05-18  102  MODULE_DEVICE_TABLE(of, imx9_soc_of_match);
af940fb78034a2 Alice Guo 2022-05-18  103  

:::::: The code at line 97 was first introduced by commit
:::::: af940fb78034a28b60ebba62458016fde7b7c4bb MLK-25903-1 driver: soc: imx9: add i.MX93 SoC device register function

:::::: TO: Alice Guo <alice.guo@nxp.com>
:::::: CC: Dong Aisheng <aisheng.dong@nxp.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
