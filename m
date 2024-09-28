Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD7A9154429
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Sep 2024 11:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727523196; cv=none; b=HQv8/lU7KjzKH8CF5LefwCyKvGgW9T6NK01sLpZIQRjpL3IdV1dUUDBw5uiLDOL3k9/kM5hzJUDBYU+ElBPCAQ4DUBqtOIWlOXEE+6m3NaGjm1pbCWR7iL7nmc5vEe7F06f/fatPcOkEfvGULg9tWhmXwFxQFmPZejbd6ykOyiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727523196; c=relaxed/simple;
	bh=AjLOtOzddLanqQmRTHbANGK/XH99DtVBp8Asc7wZ7f8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dJdMkAPbB1wlMQ2CvpqjSUCnfRZs6LM0pIxm9KGZ9Rsc39hB2EqVvqeibT8MEgeLVwFgq+jo9Kz7pKhx6ckrEccafZ7OXekDKMK8OW4/jOuMtifNQNAkGXMcAlfYjenK8wpFSnTDO1aDi0ITGG6+92jWIRcQ1ba21piFMFw68NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z68bcAUH; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z68bcAUH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727523195; x=1759059195;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AjLOtOzddLanqQmRTHbANGK/XH99DtVBp8Asc7wZ7f8=;
  b=Z68bcAUHO4fCwX9vYm7U06TrBtYSnIZd0PNKSg5ZH8uCUs5lmdHTuV4x
   APFCdhogl1SK29kGXsuKMUMbdW4qim5gOxG6tgguNaSYWXpC89ihdKRnn
   1K2x5MgcIpZUaipsON/5h9MGtrUq8LW7GJM/JQE2OxmqweOXaFHNIxawa
   S2qLWAfPaP/qAuVZciCwpv2tzD099nXGx/ZpZzVf8J0mummEuBN5geWqu
   4u29vZuY/2Cts8v+Z/B3o6tmLEp6h25R0Uq6UabuBC9/4kbamR9VASrJR
   Ev4aG6GvqIyoXtL5+qJrWO//Im//OJBgs/otVCvfDI0hNZZrS+xYDCBbv
   g==;
X-CSE-ConnectionGUID: EJbdC8mDR6yVk5sNs5EVgg==
X-CSE-MsgGUID: AIHgD1kkQW+Hc/E9OhXkpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="30452502"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="30452502"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 04:33:14 -0700
X-CSE-ConnectionGUID: supyr+l7SjGoq/eoY3tSGg==
X-CSE-MsgGUID: UzzheVzPRXyeBcNB6ObgsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="77321197"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 28 Sep 2024 04:33:13 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suVhG-000NDD-31;
	Sat, 28 Sep 2024 11:33:10 +0000
Date: Sat, 28 Sep 2024 19:33:05 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip-rt-rebase 771/966]
 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202409281904.15lMOsqe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip-rt-rebase
head:   67ac3270c7aaf93810ea5b43e2bf8361b683718e
commit: 4920224b02bd05fb46e8cfde66f5b211c871f110 [771/966] arm64: dts: renesas: r8a774e1: Add PCIe EP nodes
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240928/202409281904.15lMOsqe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409281904.15lMOsqe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409281904.15lMOsqe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
--
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
