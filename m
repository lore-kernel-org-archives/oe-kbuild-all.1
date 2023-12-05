Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9814312E55
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 06:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1iVLU+z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701758228; x=1733294228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7gVSY4zP/GKPP85JaqwSFt9KaRTQEJBmOXzboqPqXa0=;
  b=B1iVLU+z2J13QX0UcU1p6Cw79EWSyabykUHrKSpSmq1qAbQjTCbzvEob
   kqs5nDu6oB1E0uUC8FaQ45SrGr8rK5IHVMRwHyTOso/yUGPW/vRGmVzQy
   fPzdQx62eWO2Zkh4d0MSHXpIhw5zexHeB72KVf4XauhlIqH/+7XQalPP8
   ha/liajGTjxzHMOWRIkPKuozmPD7C2ChtnBKUJYDKhFbnXJVc3Ws7czvK
   5JiZ5KYeI9hdP1VNjDX7/j+dWcpysNhBbMidDp5kUN6fT1i7CtSNp047W
   wT0x3nXZASn1fujUv/EoZA5887HZNqHs+ii1nea1Ras6mAZ7S0sHEzRzA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="374035357"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="374035357"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 22:37:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="764224099"
X-IronPort-AV: E=Sophos;i="6.04,251,1695711600"; 
   d="scan'208";a="764224099"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 04 Dec 2023 22:37:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAP3F-0008Rg-1j;
	Tue, 05 Dec 2023 06:37:01 +0000
Date: Tue, 5 Dec 2023 14:36:11 +0800
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 4150/4884] qcom_stats.c:undefined reference to
 `__aeabi_uldivmod'
Message-ID: <202312051418.JkBRBDyP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0f5f12ac05f36f117e793656c3f560625e927f1b
commit: e84e61bdb97c14cf989094394c6e6a6dcb1a3381 [4150/4884] soc: qcom: stats: Add DDR sleep stats
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20231205/202312051418.JkBRBDyP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231205/202312051418.JkBRBDyP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312051418.JkBRBDyP-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: drivers/soc/qcom/qcom_stats.o: in function `qcom_ddr_stats_show':
>> qcom_stats.c:(.text+0x398): undefined reference to `__aeabi_uldivmod'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
