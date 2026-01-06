Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB3546BF
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Jan 2026 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767700623; cv=none; b=pzqAvq0h/p1IFTMsBqcV6hcAYkyWiibar683Su6Knpe4fzfzQCv+G/8vOHqZFXimbCu4yNry2VeNKa03LXtVPIXaouKyOo886Udumv85gguYHjoZZi7XryuQW9GuTCr6R4xa8jFjYpyc8T90lbotCFJsziIfDgOC5JTbmjhLx5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767700623; c=relaxed/simple;
	bh=KqCl18kBXkWaZ+VOmwUy2iL+DdSqAXi6Kjcc2cUBHVU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=vGT3WwQuPTeuEAiTiAeHTkgAUfdheFdSrCkyQTEJNfFYqJsH960NGaLIqDz+f27nrS2Sdji5T253MC1Vp17VNOFnagLc/2XS8ewwpfR1h6G1rZsDo1pe9UW35D/EE8TlJx+H7kc4ikyv6QYXusY1L2dch6homGMQiTUYVdSr9Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gq/6XPng; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gq/6XPng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767700621; x=1799236621;
  h=date:from:to:cc:subject:message-id;
  bh=KqCl18kBXkWaZ+VOmwUy2iL+DdSqAXi6Kjcc2cUBHVU=;
  b=Gq/6XPngX8A3yp0/8WCCfIWoT/RYYVPTajuFFmvy+miJykZDj7msgfyA
   +08MEsDwsEolCBbol+qTRUz4Zflc/j5TWP0/p8IAsZrGxWpXnk0yw1OfH
   U/WV5kBIhE2V5oWfsT6nmdKlz4gK0AycYRIbNwxECVmKfzX7tA9c5g5jq
   +1GcyZUaQAPzNX8vOa6pfETXH2vdr9f+bZCQXW32S4sphMoS+2E1qjKQW
   vBDBQF27FZ0volsj9Fx7EKHl/XV96aryIiYZ2umnBHymH5PxoGUWiOqg/
   OT6y6zwWfU55HEIyaDtHAbZnVqDd33RX6ZcmAfXSKFxw8aveC+KYPrjPc
   Q==;
X-CSE-ConnectionGUID: Y1KxAwnjSzmRW7PEap/1Sg==
X-CSE-MsgGUID: Vhz4DyLuQp+e8skZzhhfkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="69106895"
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="69106895"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2026 03:57:00 -0800
X-CSE-ConnectionGUID: s46zrliCT3yp/d6pbfcNnw==
X-CSE-MsgGUID: 7TtUBx5HS7GLcQYuLE159g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,204,1763452800"; 
   d="scan'208";a="202696593"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 06 Jan 2026 03:56:58 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vd5gF-000000001uX-3jFl;
	Tue, 06 Jan 2026 11:56:55 +0000
Date: Tue, 06 Jan 2026 19:56:40 +0800
From: kernel test robot <lkp@intel.com>
To: Terry Bowman <terry.bowman@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: [davejiang:cxl-port-err.v14 28/37]
 drivers/perf/../cxl/cxlpci.h:96:1: error: expected identifier or '(' before
 '{' token
Message-ID: <202601061921.NlfSHbts-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/davejiang/linux.git cxl-port-err.v14
head:   a1102a7118289d39c0fdc11e0331763822387705
commit: dfdb8cef4f5c9cd4c6e7e3e151b607a6b9c4234f [28/37] cxl: Introduce CXL Uncorrectable Protocol Error handlers for Endpoints
config: s390-randconfig-001-20260106 (https://download.01.org/0day-ci/archive/20260106/202601061921.NlfSHbts-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601061921.NlfSHbts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601061921.NlfSHbts-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/perf/cxl_pmu.c:23:
   drivers/perf/../cxl/cxlpci.h: In function 'cxl_error_detected':
>> drivers/perf/../cxl/cxlpci.h:95:58: warning: no return statement in function returning non-void [-Wreturn-type]
    static inline pci_ers_result_t cxl_error_detected(struct device *dev) { }
                                                             ^~~~~~
   drivers/perf/../cxl/cxlpci.h: At top level:
>> drivers/perf/../cxl/cxlpci.h:96:1: error: expected identifier or '(' before '{' token
    {
    ^
--
   In file included from drivers/cxl/pci.c:16:
   drivers/cxl/cxlpci.h: In function 'cxl_error_detected':
>> drivers/cxl/cxlpci.h:95:58: warning: no return statement in function returning non-void [-Wreturn-type]
    static inline pci_ers_result_t cxl_error_detected(struct device *dev) { }
                                                             ^~~~~~
   drivers/cxl/cxlpci.h: At top level:
>> drivers/cxl/cxlpci.h:96:1: error: expected identifier or '(' before '{' token
    {
    ^


vim +96 drivers/perf/../cxl/cxlpci.h

    79	
    80	#ifdef CONFIG_CXL_RAS
    81	void cxl_cor_error_detected(struct pci_dev *pdev);
    82	pci_ers_result_t cxl_error_detected(struct device *dev);
    83	pci_ers_result_t cxl_pci_error_detected(struct pci_dev *pdev,
    84						pci_channel_state_t error);
    85	void devm_cxl_dport_ras_setup(struct cxl_dport *dport);
    86	void devm_cxl_port_ras_setup(struct cxl_port *port);
    87	void __cxl_dport_init_ras_reporting(struct cxl_dport *dport, struct device *host);
    88	void __cxl_uport_init_ras_reporting(struct cxl_port *port,
    89					    struct device *host);
    90	int __cxl_await_media_ready(struct cxl_dev_state *cxlds);
    91	resource_size_t __cxl_rcd_component_reg_phys(struct device *dev,
    92						     struct cxl_dport *dport);
    93	#else
    94	static inline void cxl_cor_error_detected(struct pci_dev *pdev) { }
  > 95	static inline pci_ers_result_t cxl_error_detected(struct device *dev) { }
  > 96	{
    97		return PCI_ERS_RESULT_NONE;
    98	}
    99	static inline pci_ers_result_t cxl_pci_error_detected(struct pci_dev *pdev,
   100							      pci_channel_state_t state)
   101	{
   102		return PCI_ERS_RESULT_NONE;
   103	}
   104	static inline void devm_cxl_dport_ras_setup(struct cxl_dport *dport)
   105	{
   106	}
   107	static inline void devm_cxl_port_ras_setup(struct cxl_port *port)
   108	{
   109	}
   110	#endif
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
