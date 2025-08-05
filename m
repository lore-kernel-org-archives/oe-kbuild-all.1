Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B95F15ECCC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Aug 2025 19:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754420638; cv=none; b=NOpmKsH6TdPngbU5aBBs/qL8MJ9+GQq0NDCC+Xm70rArYTj85Tfy+a9AP/xpzQkhetiHm8gudiBWfo0eodwewCBYUWbJIYlvHkIxi0O2usilQ5fvo4v5nxe8TUdrkKTDAkblVV92M8+ElmthnigqQqk9wBl4fJRl8L0Oh8bOt1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754420638; c=relaxed/simple;
	bh=4976wWvdvExgQYIPDcl/jmLeS+9npG2+jtKbfhgbB4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eWO8x7XgCV1rziexMiXqsm2tgtB6tVVwVhDSJ9AZF9MduUFCYH4jZjiFfwyhJk+8RZVXEGnDSSC9Je8bcHnSK4wkDrtsPjIoEE3u5J8apG6YXbrXpRKfdy+bvKV0plxQr1pVXCXrJCtBSi2qcrNbX0/+DZ6JTwpvm5fQ8pa7Mxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hhLqZql1; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hhLqZql1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754420637; x=1785956637;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4976wWvdvExgQYIPDcl/jmLeS+9npG2+jtKbfhgbB4g=;
  b=hhLqZql1kshe+8yuBTCMEShupD8wbG2T5wfHBgwrnPGYy5bG+gnHO4bk
   CZ2DlWUCLv1LP3f6o9v95RyTDS7DgR316VSNQyxfaqtIzFCrl9cUEDXEB
   MRZP8QfEwmem+rQg01taq134cXiEqtxIRSZUlSbGNvAuqgzVHYBN/W+Xb
   CT8f2yVxd37dCgWhoVm8B+nbtvKhpglcFOomj3SloqpJkbnf5akEGVHso
   WPu6/z80l48e1LPHFBoQWnhd86TOyvgmL/ok5hFOrMZwI/lQHa7ZA/j1M
   /EbAnt9JYLi7eZynU48yonxavXS1eGVykIMBGaAmDp0Xn4vHjJCSz4E6Q
   Q==;
X-CSE-ConnectionGUID: JafpA45TSnefk5ALIVed8g==
X-CSE-MsgGUID: itemjYIuQLiLAAJ6nzIQQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="67431807"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="67431807"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2025 12:03:56 -0700
X-CSE-ConnectionGUID: Xq+vMy45QDC7M01X+jAnmw==
X-CSE-MsgGUID: ck8RpZyZQvaVKQYeZn6TKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="168743346"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa003.jf.intel.com with ESMTP; 05 Aug 2025 12:03:55 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujMwy-00022x-2j;
	Tue, 05 Aug 2025 19:03:52 +0000
Date: Tue, 5 Aug 2025 21:03:25 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 arch/arm64/boot/dts/apple/t8103-j274.dtb: wifi@0,0 (pci14e4,4425):
 Unevaluated properties are not allowed ('local-mac-address' was unexpected)
Message-ID: <202508052107.FMDBuysn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   b81b7955a6b4a374f56d4369ff697d4b6ba67dc7
commit: 3962e5a3845dfd66d9918598f1e0c974e9841f3c [1/1] arm64: dts: apple: t8103: Fix PCIe BCM4377 nodename
config: arm64-randconfig-2051-20250803 (https://download.01.org/0day-ci/archive/20250805/202508052107.FMDBuysn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250805/202508052107.FMDBuysn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508052107.FMDBuysn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8103-j274.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j293.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j313.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j456.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#
--
>> arch/arm64/boot/dts/apple/t8103-j457.dtb: wifi@0,0 (pci14e4,4425): Unevaluated properties are not allowed ('local-mac-address' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
