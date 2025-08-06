Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE311F03C7
	for <oe-kbuild-all@lists.linux.dev>; Wed,  6 Aug 2025 07:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754467053; cv=none; b=TY1vQ+sgp93BCPp8fe6cR9nlZe5ECwWFoyNd8n0qoIb6vKE1scRMTRaE3oF2MSEPKAzrzShtNV2klZWEcjyrMgsa/iSX1Q98GtYIjislkgZzKVJY4wtOb45Qzvw3XWFbVOqoQPf1xIyur0EUWQrWqIn/oGvJ8BDbOY/kjxFiBhI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754467053; c=relaxed/simple;
	bh=/RUVsQNJLcZysedzesQmrYpB8n11NzILSK6Y+A4lSak=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q3BzJsNH+iPnbNw05o+NV4QFeK82Od+KkQo98/t9rbZhQ8NuvelconCkIEYWtJIyBNGQ0OXxyb4gVd2D1qCRT3QVWAyna13SsFLo1LwZSt9wQo6qN+9yr4IK6+RkctzF2r5czhFlSEMw35JIfldvW/p2a7xTiqxUE6/E1fjq2Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YTDa7/5w; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YTDa7/5w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754467052; x=1786003052;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/RUVsQNJLcZysedzesQmrYpB8n11NzILSK6Y+A4lSak=;
  b=YTDa7/5wKoZa68PqsprKi06yFi2kWeexT1vocpCGGw5L/JK4UzUQnPCp
   tfQpbz6N2GiX7UzQIDQBVb7s2hd+eyURcsmmYPVNkFQcpZolbLE0hxFbn
   NlDv6O9qywFyM16uZJmzkEjmjjdfbOVWr/rdzXYQGKY3aYw5jiqn7BtUw
   gaiAWK8o+qZanvneSjrYW/egcpGvtAFaV/p/Wqtv6/+W5wzQGYr6lxGQ0
   XHnoUNhwxKuXJuNpBUl08U4HAOnvhcC0tAFhseibrE/7xWicKZHwLDO09
   8PihGnBFK36gfY+M20Z12VRWXSlX/As4SbRnzVWMsLvhrdWSfW+LzN+r2
   Q==;
X-CSE-ConnectionGUID: 7e9YyyObTwaYZJuFlUUYnQ==
X-CSE-MsgGUID: 6nW9WPhkQl+8bGwP7aK5Ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11513"; a="74235789"
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="74235789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2025 00:57:32 -0700
X-CSE-ConnectionGUID: T/J84TENQKSUjbHcVu4fGA==
X-CSE-MsgGUID: lYWvZHIuSOy7f6/ytnLsPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,268,1747724400"; 
   d="scan'208";a="164242779"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Aug 2025 00:57:30 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ujZ1c-0001O6-0J;
	Wed, 06 Aug 2025 07:57:28 +0000
Date: Wed, 6 Aug 2025 15:56:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: flash@0 (jedec,spi-nor):
 Unevaluated properties are not allowed ('vcc-supply' was unexpected)
Message-ID: <202508061510.mXU8SmBt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   052da8f4d40816c8c7522def8c32ccf4dcca35e6
commit: 4fd50f6980e2a491ab9b21b42db5f474e85badfa [1/1] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c
config: arm64-randconfig-051-20250726 (https://download.01.org/0day-ci/archive/20250806/202508061510.mXU8SmBt-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250806/202508061510.mXU8SmBt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508061510.mXU8SmBt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
