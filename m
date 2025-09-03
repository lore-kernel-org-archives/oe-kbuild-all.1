Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9127B7080D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Sep 2025 18:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756924130; cv=none; b=l89RUXO4K9UjgWfoIDVT+BxNx8ZZ+dKpJmTHfbFR9r8j2CDLRpppP+wLYlg1H3rIIA3jHKXHFysSJMXPhI4IHpmNIv6z2aVyleSwTkQ5NEqrVieQm/qLyXn4bnVEIBDBwWxlU7oqGkFywRCThem97y4F1DIJC65cKEi2P7s9O20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756924130; c=relaxed/simple;
	bh=SgsKeZk1VFs8j0X71hOlrCJtfLNb6QLW57gOO4hayxs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fElFyQrO0hHAm1DM+WkiZrkMdw3LJAljS09/q5eVreL45n6f519neoCfusInw2h2GItAjOy6T86Feb9CFjnpRlQ4hhYwZnWU0K2OYoCSoPpwJTt8zyNCoCntKh8ylLjJsy/qX59MJVNLdA6m2FtFGUxwCBxDyfqV6C+g09nINH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MURy1iT5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MURy1iT5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756924129; x=1788460129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SgsKeZk1VFs8j0X71hOlrCJtfLNb6QLW57gOO4hayxs=;
  b=MURy1iT5XkppPxy5Er1mgxyvmHIeat6KUR/sz0QWrotZ0NZs/m8QO0jP
   fZJ0dd3kvNAVQ8Sc5yJorrCEIwoHJup5d5oiqcYTyMMfJkilwsOgZHxSZ
   mJT6I4zdrlBIEpcxqQkYexe0wkXrYBQZBfArz7UO7jjd5S8eTyHXGIE3K
   UhNXhQcJ01cZX3BcToNXx3ReMbE5DcdP27LFDaRU6W5TdM/ftc+gAyQew
   3RisDxmzAy8H9fje3gzKPWnN4mFjkkzL3VXPeFWx7yC1wF7KpxP/Mz+eP
   UcRhUNapNqFVQ5EYCyxxsNC5OxPTbRqHMlQTHjQoVmibuSGjsqVBKc9Rs
   g==;
X-CSE-ConnectionGUID: pnOHGW63SP+63kqeXDiWkA==
X-CSE-MsgGUID: S0l7pHjtSV+mtFXStbcAmA==
X-IronPort-AV: E=McAfee;i="6800,10657,11542"; a="59186762"
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="59186762"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 11:28:48 -0700
X-CSE-ConnectionGUID: P+8ro/X9SVa4ZlG/gRdF/g==
X-CSE-MsgGUID: 70XldLhLSe2COgCVPxHodQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,236,1751266800"; 
   d="scan'208";a="195324107"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 03 Sep 2025 11:28:47 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utsDs-0004Id-1a;
	Wed, 03 Sep 2025 18:28:44 +0000
Date: Thu, 4 Sep 2025 02:28:34 +0800
From: kernel test robot <lkp@intel.com>
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Abel Vesa <abel.vesa@linaro.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [sre-misc:thinkpad-t14s-x1e 6/99]
 drivers/net/wireless/ath/ath6kl/../ath.h:346:26: error:
 'PCIE_LINK_STATE_L0S' undeclared
Message-ID: <202509040241.TMbOqbPQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[community] /zdci/src/lkp/sbin/sync-produce --item /zdci/kbuild/indicators/d6/d6bbb3844ce141a954d7c3c09ecd824cc2403d19-first_error_kconfig --flag create-dir

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   dd3e9d84551ad5ab322a8cabaf9c250916db874e
commit: d6bbb3844ce141a954d7c3c09ecd824cc2403d19 [6/99] wifi: ath12k: Use pci_{enable/disable}_link_state() APIs to enable/disable ASPM states
config: i386-buildonly-randconfig-003-20250904 (https://download.01.org/0day-ci/archive/20250904/202509040241.TMbOqbPQ-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509040241.TMbOqbPQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509040241.TMbOqbPQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/wireless/ath/ath6kl/../regd.h:23,
                    from drivers/net/wireless/ath/ath6kl/wmi.c:24:
   drivers/net/wireless/ath/ath6kl/../ath.h: In function 'ath_pci_aspm_state':
>> drivers/net/wireless/ath/ath6kl/../ath.h:346:26: error: 'PCIE_LINK_STATE_L0S' undeclared (first use in this function)
     346 |                 state |= PCIE_LINK_STATE_L0S;
         |                          ^~~~~~~~~~~~~~~~~~~
   drivers/net/wireless/ath/ath6kl/../ath.h:346:26: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/net/wireless/ath/ath6kl/../ath.h:348:26: error: 'PCIE_LINK_STATE_L1' undeclared (first use in this function)
     348 |                 state |= PCIE_LINK_STATE_L1;
         |                          ^~~~~~~~~~~~~~~~~~


vim +/PCIE_LINK_STATE_L0S +346 drivers/net/wireless/ath/ath6kl/../ath.h

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
