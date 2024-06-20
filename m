Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC7E757EE
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 21:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718920352; cv=none; b=PswN/MQzofBsbY8g3IqL332tosJzIS2FzxcMahhWsQGf/WhEmxJ44TS97/DWSMHtzUIQfNvafZb8/jiPYhKkaNC/g1VOuvUcAz1RwuJ8CGI80uhjB8QzXsedcNp4sIqkxPuVTL5ab5BPdmgR+ogZBGSICOyESbBy1C8tW9F9lak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718920352; c=relaxed/simple;
	bh=biNvZsCPgD7ZdDC7AsxF4WjSw2vngcLozJvjFedal3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TbttUMwMhsW4XdZLudT1a3wV39mwTN21z9S0yyfeBtP++znsijZgL4X6JZFN6ry+H4FXyxAhxU9JDzjmFPtVr5yH0HTre81i49fPMtf748hMWusuS5tKv+4U2MIZkvvCxMlWwWa5c25oaP2Prx201bnB/5z9cuDhL893xeRDkJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dl8XlEUC; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dl8XlEUC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718920350; x=1750456350;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=biNvZsCPgD7ZdDC7AsxF4WjSw2vngcLozJvjFedal3Q=;
  b=Dl8XlEUCTZTPLUlfjN4oSRsHIEr+XDjBQ9zEUQ/30Q2N7qSJO6HWjABZ
   KPhAjIffpgmdzsvY8pm3ETwM1FVj9QTPd6rw3Igqc8BeGM3NaylYZa+wD
   Dva/1KBd8M1Nt4dk4ET6WLLbKXVblghgDjHWEwdnIInd1lkq5w96IxfdL
   Vqi7oSydMl0W4WPon2dmgMRDQ7F6/Qzf+sMVfUcd1m9OURzHW3ZARvC5p
   mHbky0+I2AE+Ge0W8E2Rj1tsfb8kd7/c57NVEDwx0Hg/xlKimE+4llDX6
   YJQxbgqZvP88dSN30CxWkM/LdodQh6TTGSL/4S5YNNGpxHKEwScB9eZyz
   g==;
X-CSE-ConnectionGUID: z7Bn6tL2RAOvWmTGTvhPkg==
X-CSE-MsgGUID: J/CLV3WQQSmH6bN8MZu71A==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16047340"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="16047340"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 14:52:30 -0700
X-CSE-ConnectionGUID: V9CssooERt2sfbyHoKWBjQ==
X-CSE-MsgGUID: nUeNf7LzSKKnAMtbTcKvxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="42288502"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 20 Jun 2024 14:52:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKPhi-0007z4-0U;
	Thu, 20 Jun 2024 21:52:26 +0000
Date: Fri, 21 Jun 2024 05:52:21 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: [linux-next:master 7032/7397]
 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi:652.22-662.5: Warning
 (graph_child_address): /bus@f0000/usb@f900000/usb@31000000: graph node has
 single child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202406210537.pWYvKBwC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b992b79ca8bc336fa8e2c80990b5af80ed8f36fd
commit: 3ad6579f106db8f94fb8495063cb4b0f0eaaaa9a [7032/7397] arm64: dts: ti: am62p: Rename am62p-{}.dtsi to am62p-j722s-common-{}.dtsi
config: arm64-randconfig-001-20230929 (https://download.01.org/0day-ci/archive/20240621/202406210537.pWYvKBwC-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406210537.pWYvKBwC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406210537.pWYvKBwC-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-am62p5-sk.dts:367.10-376.6: Warning (graph_child_address): /bus@f0000/i2c@20000000/usb-power-controller@3f/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi:652.22-662.5: Warning (graph_child_address): /bus@f0000/usb@f900000/usb@31000000: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +652 arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi

c1453d3c3e9baf arch/arm64/boot/dts/ti/k3-am62p-main.dtsi Roger Quadros 2024-04-12 @652  		usb0: usb@31000000 {

:::::: The code at line 652 was first introduced by commit
:::::: c1453d3c3e9baf538b5f978c9e7cc24e47cc877e arm64: dts: ti: k3-am62p: add the USB sub-system

:::::: TO: Roger Quadros <rogerq@kernel.org>
:::::: CC: Nishanth Menon <nm@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
