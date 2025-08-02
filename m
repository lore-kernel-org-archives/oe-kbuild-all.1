Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DE5149DF0
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 Aug 2025 11:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754133060; cv=none; b=LAIW66a44nNhJyW8pgUZyxlJ8g3CikppohfqlqF5KeSyWET46uQ1mz53AfgSiU1fvwlWb2ZOLjG0oGFa+nO8eGvSlXDf9NMTZ7u6Xdw4d3YFkbA7AXGKRZzYqJtvQFunPB23Fy0B52poBk3q1pG+PAPrYRAsEuupm5RDXOR5Lm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754133060; c=relaxed/simple;
	bh=v5rUypWtpBvoKmUpO5Uwe+rHFkeVYZhu2OdV1H1tKFg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p++4mN/IiNB2YJ0cUMZ3IMhS9Hba2T/JUA6m/8JHlxmZ/wt13q71U0GM7xii5wLcONRRL/PZlY9c6M6vZfP3Kd9UlhReW0eUD9YJk4vFkPLZW1x4pt+UyKh7LBozeD+5XhwMCmAzyKxBxYb1mrBegGaenedrsgkyG95y3P9B+MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lVbZiKQk; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lVbZiKQk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1754133059; x=1785669059;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v5rUypWtpBvoKmUpO5Uwe+rHFkeVYZhu2OdV1H1tKFg=;
  b=lVbZiKQk68CqaDwzVUJ2dpNBf9SoOOksMzJTr9e1lS18/R/OAAJeMsYV
   rxBvDdjb4NDYRsnUUvX4tq/MRqUeYLwhS1kDbIb9rYclqSNjB9DC5+itw
   GtrPNhwSs5+A3/H90ZcCTnHiKFM2+f4t6GwDbtbWy6odVngMqgFSuoPE8
   19vBO+VvQK94B9XFMZPfa79TieUhXDoQhUMjbk3kGZ9Y3qNROnlWVSUBQ
   p7IcgJlAQAcFA2eRuJBtWPUy/Kw811Zw4QAS/KFBlvMaYwupSHhk00NBX
   9esfeF2JO9lrijoCe7t8jH5HU6Yfja4IZCmXDpKjrk9GCDiiiPxd5i7sd
   w==;
X-CSE-ConnectionGUID: AKygLholQTKvdywTKCGl3g==
X-CSE-MsgGUID: H6C9pQBmSZifcgyaPQChIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="60295013"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="60295013"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2025 04:10:58 -0700
X-CSE-ConnectionGUID: n7JLlQ+4TO+hQBfrTZ77Zw==
X-CSE-MsgGUID: +akq6qmXRLCzMQwzi7elfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; 
   d="scan'208";a="168033688"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 02 Aug 2025 04:10:57 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uiA8d-0005KK-0d;
	Sat, 02 Aug 2025 11:10:55 +0000
Date: Sat, 2 Aug 2025 19:10:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: flash@0 (jedec,spi-nor):
 Unevaluated properties are not allowed ('vcc-supply' was unexpected)
Message-ID: <202508022102.7NWIZO7g-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   bf0fb8bb181b86adf67dcc60b8269d60814de5a1
commit: 4fd50f6980e2a491ab9b21b42db5f474e85badfa [1/1] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c
config: arm64-randconfig-051-20250726 (https://download.01.org/0day-ci/archive/20250802/202508022102.7NWIZO7g-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250802/202508022102.7NWIZO7g-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508022102.7NWIZO7g-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
