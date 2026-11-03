Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793748825;
	b=en25Zw0Wzd7QbsjmDdHt8voUbQoUGTNmI2D2+XHcbDjEOHKtmbOK31SRmkYqmqJFhMnR
	 xlu/vltBKFAhNG+/eSt/DpC1O//mJUA+zXPOipSK8PStglVydwbhs1fIZH5TdhsP9iuEz
	 mlXKI9/rtK8/mgyApP5VwL80QoQ1xu9kkwRlV4yQ/XNOFcpV5BSdq53TdeuMQFivjZZSs
	 3hRW7gr+21DYB7R2yPQwAPR57MFkqhUkVHXziCjEC2m5dgLK4Yj3NBaX0nlXUEA19MRPl
	 OOEkG3Pr1yskA9vZRwY0t1FfOEOFfBDltYONRykpFtEAvWeaaprx/2VtM97xAbCw5aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793748825;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=Om6lwbotcsPG9CymFwvhbltj2xeA3JFfZBgBlWZ9bHk=;
	b=PtEahEQBtRppm1iEWo8BfgvnUPxp/j6yAi6NfHltfZVVPOLeDaTAC55vALV+9iv2nMGI
	 vqLMjMduPnduXt+WRGOHv0qo18tsUDkbQ0CQ6EWXm6CznDYHNh4jlvsjjoAKWC5YbMbsv
	 45CbRxTAYc6XPDeI/AtimArTmTmaFn3BiWoyfHsAUfrBUFeR/HDDh/sZALMPdOGM24dre
	 uhBdB38nZx5hQtlY2XyHNf6xrDI/g5da9jSAJwEb4vFev+IaYKy++UehbPHQm6OKq9SjR
	 6G02rn1yJiMX0txrI+IcXhC4XXXJIsuSnrVXsqza5OnSVdqljbqfz398uTXHj5DIIYg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Fp8e5/tv";
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01653606A324
	for <oe-kbuild-all@lists.linux.dev>; Tue,  3 Nov 2026 23:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01653606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Fp8e5/tv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793748824; x=1825284824;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yskDC2w5KrPpMamTgrkxUIxF8k8I+Ap9GokBWkJMIbA=;
  b=Fp8e5/tvz8Z7PXVFeuEkM2zjX5nyDVN2KSoTu9qZQScZZzMFasw0OPIX
   S9dt1D2I0MH2b2qIUhsZHTSfSZirslX6Yd3QZM+02FB3vUxvz1Z6h9Fe8
   niT5yACbXpBV3yDSURFjRXgriA/xW8H9zn6S5yHarhJ2j1LI9zS75N8bB
   dFnUUMXfNTLfzAYDEJXXY3L3o0R6tCCHEaICMnTYaIYjFePqJrnJQRdLu
   1MHEkR2cthxcVKE0syUey391/Zhwqr81DKQZ2cz3qVPHasDCESj6dbke7
   QuiiN57x7a3oq2A9ssoicv/pbk3/k1rCcx8GNkiG8maQ4RsYRnKJhcMZD
   w==;
X-CSE-ConnectionGUID: n3L6IccnS8O3BFtbptHEIA==
X-CSE-MsgGUID: Drwq5pXcSXOIr/SAZP7evQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2500378"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2500378"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 15:33:43 -0800
X-CSE-ConnectionGUID: oLP/kVq7TvKfdTseyJp5Mw==
X-CSE-MsgGUID: 6V3Sx68XR0SrpsBkRgCsEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="6680233"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 03 Nov 2026 15:33:41 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOO0Y-00000000jTF-3XVh;
	Tue, 03 Nov 2026 23:33:38 +0000
Date: Wed, 4 Nov 2026 07:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: Wentao Liang <vulab@iscas.ac.cn>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <helgaas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, Wentao Liang <vulab@iscas.ac.cn>,
	stable@vger.kernel.org
Subject: Re: [PATCH] PCI: keystone: drop host bridge reference in
 ks_pcie_quirk()
Message-ID: <202611040751.abETm1WS-lkp@intel.com>
References: <20261103104239.1373754-1-vulab@iscas.ac.cn>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103104239.1373754-1-vulab@iscas.ac.cn>

Hi Wentao,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/PCI-keystone-drop-host-bridge-reference-in-ks_pcie_quirk/20261103-104239
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20261103104239.1373754-1-vulab%40iscas.ac.cn
patch subject: [PATCH] PCI: keystone: drop host bridge reference in ks_pcie_quirk()
config: riscv-randconfig-1000-20261103 (https://download.01.org/0day-ci/archive/20261104/202611040751.abETm1WS-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611040751.abETm1WS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611040751.abETm1WS-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/pci/controller/dwc/pci-keystone.ko: symbol 'pci_put_host_bridge_device' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
