Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09A122D7B7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Apr 2025 12:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745670066; cv=none; b=KjUIr7zlh0pfmI3+Yrus59AO1SYOJtiV0dq4PPXmGC6rWpij48VbIde4fQkT7i4VnyWmUMiudn28Z5TVIHeP7OBw+cWnE2K/dXG7PgCv6xd5c08IOZmcH8CCPZAKxRWlcFFot+SMJ5QRBjWGXhMxu7EKp/GGOl193Riae0KY/2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745670066; c=relaxed/simple;
	bh=9B36O3TVmdU2j+6b4aV49wQf8xcZzj1Fs7I7g7pbQx0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mrnBYaPT5aqZgx8v6B8+tk/Dhp/HlHgheIpN4FnFJ6iqDYf6PWez5pARMESc9ngzfIcGWA87aEOlntzlIoHOno9JShgBZOVRS0Aa7lg5UWwI8wUy+bR+dI9Kh6ZGZSN1vrYEfCy2KK3Ljby10SxfdmkbfKJOMpfC/Zv/j84KPIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=imfDSZhF; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="imfDSZhF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745670065; x=1777206065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9B36O3TVmdU2j+6b4aV49wQf8xcZzj1Fs7I7g7pbQx0=;
  b=imfDSZhFbRxZLdQJpAK+rJDxw8AvHbgYk/tLTEgPpXo4OCkyV/STEoQi
   vo4Vfe8o6/L4kIpevLEbqgTTe0VzEAy1ZAHWTq5nU7vRWHzqOsNMATJK0
   X6TXI121M0qzMFJs0TFQOv2Fuq1NjnvBCLqLnpw9N9HGr5vqpswamEoYx
   HATnddtFyQMiaDExy1nzyIbcdfZy3jNT9MBJ1uQGGGY/Qiju3mlhIUdQh
   F+7qXhy6+UN6CuMbx3+jAskNBt81pL0BZuCn6lwevH7yhHIcmoni4cvoI
   Vog2Av86mEpZEaD1ZIw0m+s3i20//ACoHHeQ99GdY82WHZ4DvfclD2m3G
   Q==;
X-CSE-ConnectionGUID: w6hyG5mpQSGsy42+SCaBuQ==
X-CSE-MsgGUID: 8h/iHua6Rm+/sV7mbC2EFg==
X-IronPort-AV: E=McAfee;i="6700,10204,11415"; a="57963016"
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="57963016"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2025 05:21:02 -0700
X-CSE-ConnectionGUID: iS2RKCw5SIiaFGyDyD6oXQ==
X-CSE-MsgGUID: DgBZyib7QYe3MbEeDrrp8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,241,1739865600"; 
   d="scan'208";a="137170500"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Apr 2025 05:21:00 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u8eWg-0005ou-0P;
	Sat, 26 Apr 2025 12:20:58 +0000
Date: Sat, 26 Apr 2025 20:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: Mrinmay Sarkar <quic_msarkar@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: drivers/pci/controller/dwc/pcie-qcom.c:247: warning: Function
 parameter or struct member 'no_l0s' not described in 'qcom_pcie_cfg'
Message-ID: <202504262001.OoBjFg5j-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   02ddfb981de88a2c15621115dd7be2431252c568
commit: 1d648bf79d4dca909f242b1a0cdc458e4f9d0253 PCI: qcom: Override NO_SNOOP attribute for SA8775P RC
date:   10 months ago
config: sh-randconfig-002-20250426 (https://download.01.org/0day-ci/archive/20250426/202504262001.OoBjFg5j-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250426/202504262001.OoBjFg5j-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504262001.OoBjFg5j-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/controller/dwc/pcie-qcom.c:247: warning: Function parameter or struct member 'no_l0s' not described in 'qcom_pcie_cfg'


vim +247 drivers/pci/controller/dwc/pcie-qcom.c

82a823833f4e37 drivers/pci/host/pcie-qcom.c           Stanimir Varbanov 2015-12-18  236  
1d648bf79d4dca drivers/pci/controller/dwc/pcie-qcom.c Mrinmay Sarkar    2024-03-11  237   /**
1d648bf79d4dca drivers/pci/controller/dwc/pcie-qcom.c Mrinmay Sarkar    2024-03-11  238    * struct qcom_pcie_cfg - Per SoC config struct
1d648bf79d4dca drivers/pci/controller/dwc/pcie-qcom.c Mrinmay Sarkar    2024-03-11  239    * @ops: qcom PCIe ops structure
1d648bf79d4dca drivers/pci/controller/dwc/pcie-qcom.c Mrinmay Sarkar    2024-03-11  240    * @override_no_snoop: Override NO_SNOOP attribute in TLP to enable cache
1d648bf79d4dca drivers/pci/controller/dwc/pcie-qcom.c Mrinmay Sarkar    2024-03-11  241    * snooping
1d648bf79d4dca drivers/pci/controller/dwc/pcie-qcom.c Mrinmay Sarkar    2024-03-11  242    */
b89ff410253d74 drivers/pci/controller/dwc/pcie-qcom.c Prasad Malisetty  2021-10-07  243  struct qcom_pcie_cfg {
b89ff410253d74 drivers/pci/controller/dwc/pcie-qcom.c Prasad Malisetty  2021-10-07  244  	const struct qcom_pcie_ops *ops;
1d648bf79d4dca drivers/pci/controller/dwc/pcie-qcom.c Mrinmay Sarkar    2024-03-11  245  	bool override_no_snoop;
d1997c98781459 drivers/pci/controller/dwc/pcie-qcom.c Johan Hovold      2024-03-06  246  	bool no_l0s;
b89ff410253d74 drivers/pci/controller/dwc/pcie-qcom.c Prasad Malisetty  2021-10-07 @247  };
b89ff410253d74 drivers/pci/controller/dwc/pcie-qcom.c Prasad Malisetty  2021-10-07  248  

:::::: The code at line 247 was first introduced by commit
:::::: b89ff410253d7468f84720d2d5c2bb0bafedf3bd PCI: qcom: Replace ops with struct pcie_cfg in pcie match data

:::::: TO: Prasad Malisetty <pmaliset@codeaurora.org>
:::::: CC: Bjorn Helgaas <bhelgaas@google.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
