Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C361DE4CA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Sep 2025 14:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757170557; cv=none; b=uWxOj5LqrONKrHdM6jY45wvGS/iUDNFod+EPt7Rcn37PJDei0b7ya6ckcEVQFvQmUy6q2+j51r4ybGfywvUbjAtQeVVk07ULwR971OO623q19Lw0C705rFtGrzIDIS404SCUk1S5EzS8ckuWeVfVUVSRtUsjvkBLOUcuRXNW2vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757170557; c=relaxed/simple;
	bh=CWV0eADg/lHuT9q/v4CBqVNg8ClfbTC1oaQxZJOtZx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nvjtniiOWXBDnpq4NXmgvDkVg+2gIKNMwMUKH+4OKneBR+ecxn4b3RQPPCz2F7P5z7vvGntfkf25pVA3oH+cDdLpHAGPmxiXH68ofzxRsqsFyPoXctQKlYYXWRPr23fq5oxt04ZzrsHS17CYEw7kUcb7y8TLNdcHNx6dnvWrXtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GxprsF0p; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GxprsF0p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757170556; x=1788706556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CWV0eADg/lHuT9q/v4CBqVNg8ClfbTC1oaQxZJOtZx0=;
  b=GxprsF0pCa3QdPERaKreXN9Gwl02cwNz3FWa4cMOjGiVzSsHJXsLiPq9
   4KpKuH6DGgpcdKZV+ZMLiC4TUQNCK5hf+iIF/7bgrROcVThsD03XxQ0ut
   HPkTqaXb625FsIdutmZINw1ZDm+XbXa2hjn2gqBwgdJFtdVPrAIhCigUZ
   GqoMhxVs56XkX9JdwCYezXDxC+3Jvcgs7WVys/Rti3pSoMn4x2Jw2wLZF
   Ngm+goOhBvaX7eUxOSaf3ngl5xRY/KqFjnOLRCvSeQepTgL/69q17WMS4
   TCeyZDq3ufysXWQspuPzAzjwP0Pdi3sr5Ugt2FiGGqBL8X/a8ua8QdlAg
   w==;
X-CSE-ConnectionGUID: Ioz/cWhOS/m2pFScagoTCA==
X-CSE-MsgGUID: GkEA/1KbQS6jzolvtIzzIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="58704972"
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="58704972"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2025 07:55:54 -0700
X-CSE-ConnectionGUID: ufU6ez57Q2GjnBiKJmIvZQ==
X-CSE-MsgGUID: HhkYpYWZTGa1g5ihAEVxsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,244,1751266800"; 
   d="scan'208";a="177600870"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 06 Sep 2025 07:55:52 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuuKU-0001Ya-0P;
	Sat, 06 Sep 2025 14:55:50 +0000
Date: Sat, 6 Sep 2025 22:55:41 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Abel Vesa <abel.vesa@linaro.org>
Subject: [sre-misc:thinkpad-t14s-x1e 6/99]
 drivers/net/wireless/ath/ath.h:346:26: error: 'PCIE_LINK_STATE_L0S'
 undeclared
Message-ID: <202509062228.aBx6UXg1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   20a611d793c180f9a9aee2296bbaf4efcbfa74cb
commit: 7ffdabe098c9cf39a55e78ce2001c23004c49dae [6/99] wifi: ath12k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
config: nios2-randconfig-002-20250906 (https://download.01.org/0day-ci/archive/20250906/202509062228.aBx6UXg1-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250906/202509062228.aBx6UXg1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509062228.aBx6UXg1-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/main.c:23:
   drivers/net/wireless/ath/ath.h: In function 'ath_pci_aspm_state':
>> drivers/net/wireless/ath/ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
     346 |                 state |= PCIE_LINK_STATE_L0S;
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/wireless/ath/ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
     348 |                 state |= PCIE_LINK_STATE_L1;
         |                          ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/wireless/ath/ath10k/core.h:26,
                    from drivers/net/wireless/ath/ath10k/sdio.c:18:
   drivers/net/wireless/ath/ath10k/../ath.h: In function 'ath_pci_aspm_state':
>> drivers/net/wireless/ath/ath10k/../ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
     346 |                 state |= PCIE_LINK_STATE_L0S;
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath10k/../ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/wireless/ath/ath10k/../ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
     348 |                 state |= PCIE_LINK_STATE_L1;
         |                          ^~~~~~~~~~~~~~~~~~
--
   In file included from drivers/net/wireless/ath/ath9k/common.h:19,
                    from drivers/net/wireless/ath/ath9k/ath9k.h:29,
                    from drivers/net/wireless/ath/ath9k/link.c:17:
   drivers/net/wireless/ath/ath9k/../ath.h: In function 'ath_pci_aspm_state':
>> drivers/net/wireless/ath/ath9k/../ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
     346 |                 state |= PCIE_LINK_STATE_L0S;
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath9k/../ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/wireless/ath/ath9k/../ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
     348 |                 state |= PCIE_LINK_STATE_L1;
         |                          ^~~~~~~~~~~~~~~~~~


vim +/PCIE_LINK_STATE_L0S +346 drivers/net/wireless/ath/ath.h

   340	
   341	static inline int ath_pci_aspm_state(u16 lnkctl)
   342	{
   343		int state = 0;
   344	
   345		if (lnkctl & PCI_EXP_LNKCTL_ASPM_L0S)
 > 346			state |= PCIE_LINK_STATE_L0S;
   347		if (lnkctl & PCI_EXP_LNKCTL_ASPM_L1)
 > 348			state |= PCIE_LINK_STATE_L1;
   349	
   350		return state;
   351	}
   352	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
