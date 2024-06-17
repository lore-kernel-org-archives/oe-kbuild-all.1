Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6348C136
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 05:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718600877; cv=none; b=PsaEKM4eOLFS6BOQMVC8+N0KEdFbDsK5JofxUVH1CXFREmnByEpSavHdfpxydrcbPmYRR4HbQVoP1epwaSGM4KqPsbEFGIrh7F4OvpO9ajpZB9jIrLHrBhd3ikAFAF0VO5H5St/lKco7zJnQldj7d03xGSyv9jx/ajSW4DLbz5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718600877; c=relaxed/simple;
	bh=Ha+t+6367BT30LrspVWUDsXYQBoQVBWlitRxIPRWBXM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SoLWaUyanTn4ve9A6JiJZYbaBW0Y2VYW9WW2EiyBdMw1Isyfx7+LEKAgDHINeOiHd5DqHSkX4XCoQlybqYlypwHL52QkR13z1GH/biHmoiJYqBbyu6JGKRrdwKdWs4w1V3wm1VCaVO89ZwyfKnUmWKNK0iYCoUd4pVEkbzRao5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hls59OGT; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hls59OGT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718600876; x=1750136876;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ha+t+6367BT30LrspVWUDsXYQBoQVBWlitRxIPRWBXM=;
  b=Hls59OGTJvin07UR5UsHp3rA2WhZwTcWriecuFeYUBNG9GLK6LVXTF10
   LCr1BT+c6IPVEjvnXJgQyr4BuSvzfB/hZoYvC7Zb2DoKe4d16cHeOiGb5
   TRHf1xfT51rJDBi7lCcqQKackbbqZS51wIjyiKfiSuy7eXZ09vYV0hl1H
   RhDLgU2UVxi9dpgIwCZsaW40fFy6mG/IfQiOiWd1mUzMgs9xOWbchGzwX
   C8EMDc1bPfu88kUW67nIkJDYF1dchUftNGZrvtTiYCfH6LfpJnu5r6/Wa
   JZT+w96cbv92K5eG48rBAYyX9jPFM4L9p+GHxXmNbMO2IGSZS8KXZCs6W
   A==;
X-CSE-ConnectionGUID: HzfvDjy4Rfe+Zo9lo8g/qA==
X-CSE-MsgGUID: 2hc76ZW/RCOSaeLiGtdO8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="15548848"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15548848"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 22:07:55 -0700
X-CSE-ConnectionGUID: iohLOQyuSfSKPbJ/doWikg==
X-CSE-MsgGUID: V1FWTQ+qQViCZzf5PHir/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41221904"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 16 Jun 2024 22:07:55 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJ4au-0003py-1N;
	Mon, 17 Jun 2024 05:07:52 +0000
Date: Mon, 17 Jun 2024 13:07:28 +0800
From: kernel test robot <lkp@intel.com>
To: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Pavel Machek <pavel@denx.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cip:linux-4.19.y-cip 5967/9999]
 arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: Warning
 (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used
 in node /soc/pcie-ep@fe000000)
Message-ID: <202406171347.Uctz3qBx-lkp@intel.com>
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
commit: 6b1096c1eac4032ca030c106c7592566b015dc7f [5967/9999] arm64: dts: renesas: r8a774c0-cat874: Add support for AISTARVISION MIPI Adapter V2.1
config: arm64-randconfig-001-20240609 (https://download.01.org/0day-ci/archive/20240617/202406171347.Uctz3qBx-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406171347.Uctz3qBx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406171347.Uctz3qBx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: Warning (unique_unit_address): /soc/pcie@fe000000: duplicate unit-address (also used in node /soc/pcie-ep@fe000000)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
