Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E981FF60C
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 06:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730789834; cv=none; b=hbpO5pxkHxfBJOdvb8j4CvfbQJbKckVueyBSUTWX1GsveCETDI2hBJ6Owp/G3nVZIalbmteDwTRRiHXmgdPEgyQlJymKnu8MJ5D+KbAo8yv8+AlzSzkD5dagVesb0v+QKDQhJUy+zHhrNOewy7LVLJ/CX7ScqP/gsQsCMKBxh1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730789834; c=relaxed/simple;
	bh=1cO7Y5Z8UtBdJ1ya75r7xZPnNobLD2iFpsVzTi7HM08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Tl50B1kxIti/TyJBnnuKuwrGuanuikIzW9ylKPpguqsqA2VervNshiq4h/lRqjvvXcrnktwMqYmQ/tPOHPhrwLIsAtPnivduYTb6O5+kwp/PWjFCq0366X/qRIPoqGXn+oTEfOxLMiuY+cj/Sb2rBEiOUML6ND2giOZcLfQSZQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJWC86t3; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJWC86t3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730789833; x=1762325833;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1cO7Y5Z8UtBdJ1ya75r7xZPnNobLD2iFpsVzTi7HM08=;
  b=NJWC86t3bc9CtH6rMS1TDtJMouytLOwr/qdNLfDLn5dprFEoakUTTl1X
   m8pA/Oqd1Fx6lqWqByqIrTujxWfdJZUcEauEmXnRa4UUVQzNtSco8HeMu
   IVnUmEvwMf8yHnv3BcYlQT3GPez/FpF2suf68KNzS3vMaNB0A9+rL5x1Z
   +6VYAu9FfTwLq4C0+1WejdQBIRCuJ/DpduO3+SoVlHsXZmvHWy3s7ofdU
   tzyqZo559Ql5qomhKluta0vEcaRDYS1AAqzT61HY77GL2aRf9EFd9crk4
   o2KE9ty5yO8sSnyY1le+nONSjKI8gLIy82edERpE+7V95mXUiD4wiWPO0
   A==;
X-CSE-ConnectionGUID: fX5ZSSAvQTm490hfIelaiQ==
X-CSE-MsgGUID: MNWNZNFpQ4WPH1pFRJp3nA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30472327"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30472327"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 22:57:12 -0800
X-CSE-ConnectionGUID: Qa9uln9dTneLPciS3AjuJw==
X-CSE-MsgGUID: imh0gthNS7SosGgkIw0Abg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84309881"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2024 22:57:10 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8DUx-000ljR-23;
	Tue, 05 Nov 2024 06:57:07 +0000
Date: Tue, 5 Nov 2024 14:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jacob Keller <jacob.e.keller@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Wojciech Drewek <wojciech.drewek@intel.com>,
	Rahul Rameshbabu <rrameshbabu@nvidia.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Simon Horman <horms@kernel.org>,
	Mateusz Polchlopek <mateusz.polchlopek@intel.com>
Subject: [tnguy-next-queue:dev-queue 67/85] iavf_main.c:undefined reference
 to `iavf_ptp_cap_supported'
Message-ID: <202411051410.QeBCuZ5y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   676d779106de51fc4e2685ca8de610ee5a70d35f
commit: adcff768e70df6a1905ffe1387259da00b859521 [67/85] iavf: add support for Rx timestamps to hotpath
config: parisc-randconfig-001-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051410.QeBCuZ5y-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051410.QeBCuZ5y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051410.QeBCuZ5y-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_hwstamp_set':
   iavf_main.c:(.text+0x1924): undefined reference to `iavf_ptp_set_ts_config'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_configure':
>> iavf_main.c:(.text+0x61ac): undefined reference to `iavf_ptp_cap_supported'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_remove':
   iavf_main.c:(.text+0x73cc): undefined reference to `iavf_ptp_release'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_main.o: in function `iavf_init_config_adapter':
   iavf_main.c:(.text+0x8594): undefined reference to `iavf_ptp_init'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: in function `iavf_configure_queues':
   drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:381:(.text+0xf08): undefined reference to `iavf_ptp_cap_supported'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_virtchnl.o: in function `iavf_virtchnl_completion':
   drivers/net/ethernet/intel/iavf/iavf_virtchnl.c:2710:(.text+0x4778): undefined reference to `iavf_ptp_process_caps'
   hppa-linux-ld: drivers/net/ethernet/intel/iavf/iavf_txrx.o: in function `iavf_process_skb_fields':
>> drivers/net/ethernet/intel/iavf/iavf_txrx.c:1111:(.text+0x185c): undefined reference to `iavf_ptp_extend_32b_timestamp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
