Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D05B829BDBD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Jan 2026 15:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767887718; cv=none; b=F8WZnzSaL4QlnuVrXsVL6B6RCVY7HK8BA8ujq8DRbtBD4JU7LlPyAkMpnFvRh0NplP/z+Bg5WEuTKg5Heje5qVt4Upo3rzCEBJ1q+OpVTUGO9/JavYuasP/1kulEA3yhTTPml6URR1T+tRly5EuQzCa1WZncWMrkqU1Ow6BtzTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767887718; c=relaxed/simple;
	bh=sBT3ddbICfHocX0erckb7vnIhpO7n6ZboooT5Tdsm2E=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tzgbQEl+1Uec6ye+4jOujTAhU+/24hhsv5FGA8PTRR1bpZg+cOuJCE75tCooXabpEZ3wf0ALbXxZFQ612Tdp5N06olw3wwZh6v8CGIU7ycwEVCdU23KRp9DyA0opIZ5UbfsCxhqAeUOrmJFCkzHGGjNXgtDpDcDm8nDnnu0l6HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fDunx928; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fDunx928"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767887715; x=1799423715;
  h=date:from:to:cc:subject:message-id;
  bh=sBT3ddbICfHocX0erckb7vnIhpO7n6ZboooT5Tdsm2E=;
  b=fDunx928l7GaMnnJ49GBvgqdIEYWvYHJrsCW2zZph9gRhbDZOv4QgcbL
   NwuYOBbUP4ocMR6wMEVNtoHHbZfTS3WAgEDb9aNHwc8ZtohQvQVyqw8Yu
   9FqqQ1V+CBb/I/+eAGHxg2sQzXeoKBWifXIjUEDwISF+A/V3XigxmXbAg
   xWQDCuS1qkbZTQvTtkTk1bC7vlSinlj0/iAPRA1XJ8lZDlJSAA/V1iGAt
   6KJr9p70tOMtpvoy+OeMgscBeAvry8jJBj3OrUaIU0iJbXgmGNmeoS+x1
   NS80xy/iTMR4+xX17BsrreiXakR69LeRAuPWNuZUjs7TCCnFKe1IQl9s1
   A==;
X-CSE-ConnectionGUID: UOdBgUwbSU+P4n4GiDwzjA==
X-CSE-MsgGUID: hO7Y/vNaTtGFTrztyo2H4Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11665"; a="79908755"
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="79908755"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jan 2026 07:55:13 -0800
X-CSE-ConnectionGUID: 5NbSFWVrSqyjdnpYHpW0Rg==
X-CSE-MsgGUID: IYYXcPK0TnmjE/u701hnHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,211,1763452800"; 
   d="scan'208";a="207722962"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 08 Jan 2026 07:55:10 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vdsLs-000000001oO-0yAt;
	Thu, 08 Jan 2026 15:55:08 +0000
Date: Thu, 08 Jan 2026 16:54:53 +0100
From: kernel test robot <lkp@intel.com>
To: Hai Pham <hai.pham.ud@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Vinh Nguyen <vinh.nguyen.xz@renesas.com>,
 Takeshi Kihara <takeshi.kihara.df@renesas.com>,
 Khanh Le <khanh.le.xr@renesas.com>, Huy Bui <huy.bui.wm@renesas.com>,
 Phong Hoang <phong.hoang.wz@renesas.com>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb:
 serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
Message-ID: <202601081618.NFixlKBk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0b9d8eb98dfee8d00419aa07543bdc2c1a44fb1
commit: ad142a4ef7106326bbf5c67eb39f21ef77fe8be3 arm64: dts: renesas: r8a78000: Add initial Ironhide board support
date:   2 months ago
config: arm64-randconfig-2051-20260107 (https://download.01.org/0day-ci/archive/20260108/202601081618.NFixlKBk-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260108/202601081618.NFixlKBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601081618.NFixlKBk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'resets' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml
   arch/arm64/boot/dts/renesas/r8a78000-ironhide.dtb: serial@c0710000 (renesas,hscif-r8a78000): 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/renesas,hscif.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
