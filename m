Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C08C2EB5D3
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 13:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753279100; cv=none; b=RjrROxR7V2HPCcNU62VP6k0z0AkXOuNPgOpfEU0IgBWF8vP6FHXiz6StrFj5s3llbfv45Ui4SPpvj38BqeAs/4XjjexFOnPDS7cgNkvNS05SN+7J0I98vpQQtbK3biVHJGIW5QIVC5hPs/flv1V3BqHCwFmcPzkyt3aXIEopGtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753279100; c=relaxed/simple;
	bh=eW8zAUwQha7I5GAJdrCG+C3VCZC9dyaaMwtU41wahfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gKW5XoJoHDh6Lvcw9sDrnVx/ECO7t98Nq+o9eunGWJ8aMT4Zt5eZcKchJGODguQcbg9XA3hGWT0OJ7wav3K+qG1q1QyjhvhwFigYy04e1M26QpMsUzt0vQRtee/WJzcYQFeIR8ucYSLHYR7w9RR3+QMdNEhafLTW6ShJqrK+eio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cEMjTUtX; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cEMjTUtX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753279098; x=1784815098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eW8zAUwQha7I5GAJdrCG+C3VCZC9dyaaMwtU41wahfQ=;
  b=cEMjTUtXVv2lzupnz/YejEp6ftIWJ7V+hAjBS9YH8Vs49ARGPRlnRh4+
   SklsG3l0bb0m4sTKNf7KuTytX2j18jeanpkihTfHByGOwe0N8SVFK6FXZ
   o1QXqa2rnx7veEXRNAZn41F5C9Rb17LKmsmdDLxh69WJjyk2JM0rfqlYW
   60JyOpaS3tv1OS4dLOMBZDqmwsKS0KutX9tdCkx+4OrXHfsgzicmy+Yyf
   U9es/I4Jzf+WHoNr4SAqQ4YP3pWVxFvt+CNjKaApH/tvYejweNhWRHhTm
   P4IhMsBOJ1hP//NSDDetK2smK88XRRPnrXFqhERvRAOYV72GVTwu9dFVg
   g==;
X-CSE-ConnectionGUID: Z4dcdEI5TxC6wi5hqjACnQ==
X-CSE-MsgGUID: 7IkAnuDHSuKEZS8IvR48Tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55440915"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="55440915"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 06:58:17 -0700
X-CSE-ConnectionGUID: 7C5J038gQYmXHwGD8A2EQA==
X-CSE-MsgGUID: f1ZxmwejQX2A63WxzatM8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="164007646"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 23 Jul 2025 06:58:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueZz4-000JPn-0T;
	Wed, 23 Jul 2025 13:58:14 +0000
Date: Wed, 23 Jul 2025 21:58:01 +0800
From: kernel test robot <lkp@intel.com>
To: Lukas Wunner <lukas@wunner.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [l1k:aer_reset_v1 4/7] drivers/infiniband/hw/hfi1/pcie.c:569:3:
 warning: ignoring return value of function declared with
 'warn_unused_result' attribute
Message-ID: <202507232117.pPyrrytf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/l1k/linux aer_reset_v1
head:   aa7d1cb67ab66436de55f08005a7130768067322
commit: d3a669b8ded4ab05c102071648f1a737062fdab2 [4/7] IB/hfi1: Fix PCIe error handling
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250723/202507232117.pPyrrytf-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507232117.pPyrrytf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507232117.pPyrrytf-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/infiniband/hw/hfi1/pcie.c:569:3: warning: ignoring return value of function declared with 'warn_unused_result' attribute [-Wunused-result]
     569 |                 pci_enable_device(pdev);
         |                 ^~~~~~~~~~~~~~~~~ ~~~~
   1 warning generated.


vim +/warn_unused_result +569 drivers/infiniband/hw/hfi1/pcie.c

   560	
   561	static pci_ers_result_t
   562	pci_slot_reset(struct pci_dev *pdev)
   563	{
   564		struct hfi1_devdata *dd = pci_get_drvdata(pdev);
   565	
   566		dd_dev_info(dd, "HFI1 slot_reset function called\n");
   567	
   568		if (pdev->error_state == pci_channel_io_frozen)
 > 569			pci_enable_device(pdev);
   570	
   571		/*
   572		 * Running jobs will fail, since it's asynchronous
   573		 * unlike sysfs-requested reset.   Better than
   574		 * doing nothing.
   575		 */
   576		if (hfi1_init(dd, 1)) /* same as re-init after reset */
   577			return PCI_ERS_RESULT_DISCONNECT;
   578	
   579		return PCI_ERS_RESULT_RECOVERED;
   580	}
   581	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
