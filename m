Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74270199EAD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Aug 2026 00:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787358775; cv=none; b=p0HJxynRgTYdkPu/i/APq9XFLDmb9ezDnSgwM3RrO/BY36sgoF66UnVjCkhLO/M8mrjGK6eilV9gnORDgx1FLmBA7PAtUWtHiOXPdBerrBMrER9asD0w4RgXRifW6Zq3zYW4t/rUHuwtYKF45Sv8rR1YOCkBchP5uE6lA/8IBzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787358775; c=relaxed/simple;
	bh=mZfdniIMKu420UHqyWBCSq03sy03fncEvYNLUovTRQs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=PLy3WU5XLa+QpEkoibYAYOHLETOzQ2/ECJ+Qh9pBtN6+7ArDJ8L5cphfXUbPuIuCVmTJlZRVS1ZqCT7ICe8Zb/ey1G7tmFuyTqcZdpDx51tf9EnKTjkMpDo01n6wflgI3jTQJowYTDHAsmvNgLW1P1Jce/lU4A8/68Jj9PusnwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XVD5b6ZW; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XVD5b6ZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787358773; x=1818894773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mZfdniIMKu420UHqyWBCSq03sy03fncEvYNLUovTRQs=;
  b=XVD5b6ZW08t4V5ZNM17prO/o11vE64UCzkT57zZrNwIYrmOAQrgi+zSi
   QruJ4eeEngrYDgX5C/TaAsE03vTgsTpI14T/4hfItChNkmOIMB7W33ZAk
   +GmqQtzb0TpwK+327YUDaIemXCsBM4qQV4FtpROspHyUjyX4UaM+M80YG
   Q0K3HTYJcbO10PEunWwjRhW2M1MnoPNXXTYxkcntw4VQGpLt5oUN64205
   QAiw3r9j4jI/cQ5zZdT9OPvFQ1UR0CxQbka6R4A9MfSCGoOZ1aeCA2k8C
   ECXrhxCyCOwNc7iA5gzACxVAQP/8PLpEw6Bl9mxovskOwwLFZqGGoFOyf
   Q==;
X-CSE-ConnectionGUID: SspoYx3XR1+oJn2pYqoCog==
X-CSE-MsgGUID: yPaC4eneT7SdpTUikFZXUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87969631"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="87969631"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 17:32:52 -0700
X-CSE-ConnectionGUID: c6B3CPMKTkaEss9bf1ndUg==
X-CSE-MsgGUID: wjHStcRRQ4iOp/kO+CvEAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="264712743"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 21 Aug 2026 17:32:50 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxZfE-000000007nV-0R4R;
	Sat, 22 Aug 2026 00:32:48 +0000
Date: Sat, 22 Aug 2026 02:31:48 +0200
From: kernel test robot <lkp@intel.com>
To: =?utf-8?Q?"Gr=C3=A9goire?= Layet" <gregoire.layet@9elements.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>,
 Jacky Chou <jacky_chou@aspeedtech.com>,
 aspeedyh <yh_chung@aspeedtech.com>,
 Tan Siewert <tan.siewert@9elements.com>
Subject: drivers/tty/serial/8250/8250_aspeed_vuart.c:50:17: error:
 implicit declaration of function 'FIELD_PREP'
Message-ID: <202608220207.eiTRxzFs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://github.com/intel-lab-lkp/linux/commits/Gr-goire-Layet/dt-bindings-serial-8250-aspeed-add-ast2600-and-aspeed-vuart-over-pci/20260818-102914
head:   28e6fa9a9ae89ef5b7ad92e1df59fea67a5f7c0d
commit: 98949d2e1e8bfc6849ee8ee049efd883ddd970ba serial: 8250_aspeed_vuart: add VUART over PCI
date:   34 hours ago
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260822/202608220207.eiTRxzFs-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608220207.eiTRxzFs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608220207.eiTRxzFs-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_aspeed_vuart.c: In function 'aspeed_ast2600_vuart_over_pci_set_enabled':
>> drivers/tty/serial/8250/8250_aspeed_vuart.c:50:17: error: implicit declaration of function 'FIELD_PREP' [-Wimplicit-function-declaration]
      50 |                 FIELD_PREP(ASPEED_SCUC24_MSI_ROUTING_MASK, 2)
         |                 ^~~~~~~~~~
   drivers/tty/serial/8250/8250_aspeed_vuart.c:480:41: note: in expansion of macro 'ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1'
     480 |                                         ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1);
         |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/FIELD_PREP +50 drivers/tty/serial/8250/8250_aspeed_vuart.c

    46	
    47	#define ASPEED_SCUC24 0xC24
    48	#define  ASPEED_SCUC24_MSI_ROUTING_MASK				GENMASK(11, 10)
    49	#define  ASPEED_SCUC24_MSI_ROUTING_PCIE2LPC_PCIDEV1 \
  > 50			FIELD_PREP(ASPEED_SCUC24_MSI_ROUTING_MASK, 2)
    51	#define  ASPEED_SCUC24_RESERVED_14					BIT(14)
    52	#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_SCU560_EN	BIT(17)
    53	#define  ASPEED_SCUC24_PCIDEV1_INTX_MSI_HOST2BMC_EN	BIT(18)
    54	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
