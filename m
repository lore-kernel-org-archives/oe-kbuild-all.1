Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B48137E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 01:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719021393; cv=none; b=NRQy7uVyPgaTc4a5gxfzcshBxM8TmmW5dYOM7nfO7ZJzz74MYHSacRmlOFiJa41bHfy465tmhI1c+Xy31qcbqoujXR3So7w3GxTyV+dOIHzrY3jxwzwnE+kJCc+RTu5U2BxoYnfp2qRgKw8qKQuEtkEBo2YfV+MEknrzt0JcdDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719021393; c=relaxed/simple;
	bh=mcMw1Sk67Q2ozlnYnxIqRMAOO9AkhRWuoAXZyxf+qzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c3UXdYI8ZlAfaOa9e/coZC8oxEFhTl2bcbAWHTo4cS6O8dbR5uEUgHAD2J0wYGWY9ctio+YT3k/3HRQHwPaHlBz77I/+0MV7BHZeIEEIobsVvSY7P7kYIYUulDZhDtlG/l2E1vvSLLu3PQ7lMSl0AUitXMLy6S/f8VLtpX/281M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SvQegQLR; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SvQegQLR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719021392; x=1750557392;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mcMw1Sk67Q2ozlnYnxIqRMAOO9AkhRWuoAXZyxf+qzk=;
  b=SvQegQLRuHn27Ig3mFpzPlqXGX0ZXoRyBvgie9LX6HWUrKI72J8Rkur3
   aNU6RR9KfqvCLmSj8Q7ukIxwAlaJTD6jFtwKT5jfoZDJfiukZzk/88iBP
   8EzM56ZM8kF6DSHpgRlpKTx9ZJ/ISS4QSnSLzjP44RAwPkDECMh3eTT20
   o3mmw1HFqJZn8sJxtLfCtmK0hpswOnL9oAIkE13TcG8jye8OwOoheGGzt
   Rqml9TNwQ5YCu/h0MUHi4v7J9ZOrpB2txZJCvYuT9bKW2gjZmTxh00ITW
   VeOuVPq6oUuzMUWYQ4wc1bskDadj9ipGDRx+9hld+CsERtBao5gcq3fMD
   A==;
X-CSE-ConnectionGUID: EVtM9Ro4QAuIGVn5uw40jQ==
X-CSE-MsgGUID: yHzYYmPgQMCyPPfUXx703w==
X-IronPort-AV: E=McAfee;i="6700,10204,11110"; a="19848130"
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="19848130"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2024 18:56:31 -0700
X-CSE-ConnectionGUID: MnXmzOhATtiSDiqbs83P0Q==
X-CSE-MsgGUID: zUJe53u3Q1CrbpgF/wtZTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,256,1712646000"; 
   d="scan'208";a="47927745"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 21 Jun 2024 18:56:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKpzP-0009Da-0j;
	Sat, 22 Jun 2024 01:56:27 +0000
Date: Sat, 22 Jun 2024 09:56:00 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 5984/9999]
 arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406220912.oy0ZXRl2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git linux-4.19.y-cip
head:   80b2464ae89aaaa73b7a2daa3526c1ed9971ab5a
commit: 4f5bb7f8a45eb17c4be9fcb71e4caa85e90cff1a [5984/9999] arm64: dts: renesas: Add support for MIPI Adapter V2.1 connected to HiHope RZ/G2H
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240622/202406220912.oy0ZXRl2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240622/202406220912.oy0ZXRl2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406220912.oy0ZXRl2-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@ee800000: duplicate unit-address (also used in node /soc/pcie-ep@ee800000)
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r8a774e1-hihope-rzg2h-ex-mipi-2.1.dtb: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
