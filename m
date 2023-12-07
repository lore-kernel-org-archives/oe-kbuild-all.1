Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AA341759
	for <oe-kbuild-all@lists.linux.dev>; Thu,  7 Dec 2023 14:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FSgg7evi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701958378; x=1733494378;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=otLh6o1rX99RrYIJ5oiet7dYcuo6Lqn/Ua6HMYdsT5w=;
  b=FSgg7evi0HCVD3HM6icVuCDC//oIh26txGoTFK4WS5K2Dki9hKuFtckz
   grIClCfNoY/n7bXjoVBAbj9+lZ4F5GForKroaTjBpG9G1DAmn8YDDARE6
   t69LLdfGMQNpGnd/zZtKn1+ishc7SGXO+zdq4UYshXpENTG6zijcqdk8O
   akomfTMT08SXwcdLvZUAU+aH+2vyst5AZz6jGu1Z/8aTAiEmkKJyctHFc
   jPT+ri9S7/iZvyBAEkjgfPaRqevDxm79QT30P8uSvSoS8up8ad0MOqeYW
   8ZJYiqISKRBqeLK1ADpLcQ1xo2VDRlnYLEJD1yz98ztVs3FLD1pZAK4uj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="397026055"
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="397026055"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Dec 2023 06:12:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,256,1695711600"; 
   d="scan'208";a="19716476"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 07 Dec 2023 06:12:48 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBF7N-000CLV-1J;
	Thu, 07 Dec 2023 14:12:45 +0000
Date: Thu, 7 Dec 2023 22:12:34 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Leif Lindholm <leif@nuviainc.com>
Subject: drivers/firmware/efi/libstub/arm32-stub.c:12:28: sparse: sparse:
 symbol 'efi_entry_state' was not declared. Should it be static?
Message-ID: <202312072219.Qpsizncn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bee0e7762ad2c6025b9f5245c040fcc36ef2bde8
commit: 2a55280a3675203496d302463b941834228b9875 efi/libstub: arm: Print CPU boot mode and MMU state at boot
date:   3 years, 6 months ago
config: arm-randconfig-r113-20231116 (https://download.01.org/0day-ci/archive/20231207/202312072219.Qpsizncn-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231207/202312072219.Qpsizncn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312072219.Qpsizncn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/efi/libstub/arm32-stub.c:12:28: sparse: sparse: symbol 'efi_entry_state' was not declared. Should it be static?

vim +/efi_entry_state +12 drivers/firmware/efi/libstub/arm32-stub.c

    11	
  > 12	struct efi_arm_entry_state *efi_entry_state;
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
