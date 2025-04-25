Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB71E25771
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Apr 2025 01:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745543295; cv=none; b=rVonPPfM2yNGE7lQBNLdEJ2rqGvz40snH4NopxIrx7Kdgyg7TNCnNZyPlVQDhsEoQC1F+gMfyGD8hUIx+eomWiaxLJnOQz53Px0yyjybGr/qhmOiHnNGwyH1m+7Dfk070R8Y+fxl36nk4ND4a0estAgF3RHaJyW21SqUc4KiTSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745543295; c=relaxed/simple;
	bh=ELnIq3cUxmxJPcylyc7ZDyrlSniGnm6ZQNfNAdO9kd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HdjUQOWeMHa5i7nKPbGOLZMvOVFlLslsbLLI/5YnbTAH4VXqTETCYjkvGhvxo7mkdNJw8lTuIMoWrGDVLkOmg6zFWFlDAmOLx81zNVfRxovycB3eSGa0ZSmZEotNnVI3YHDnuU5AXhFwI9cSqbg1DkduAcQlbqwTgEn6UUTT/Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZKQ5c8fY; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZKQ5c8fY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745543293; x=1777079293;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ELnIq3cUxmxJPcylyc7ZDyrlSniGnm6ZQNfNAdO9kd0=;
  b=ZKQ5c8fYh2uvZWxgWLmCuJWx9uhI/kRnNmx++l52ZJqEi/swIeeRDRDc
   CVMkuHIG/FkBLl5U12AwF8lv7cF0u5Mk5WW9QnZS8mjNfADFYjCtxv40K
   Ggpbag9nEIrq2eb9S2yWW63r5RdpBO1jdHqVdCpP9ODCY8FSrzTHAKXRE
   umk46kDSiQ+wqfLIYKmmyK8vHNXqpy09XeGj0FteFOXOI+3E1GwB/uYtv
   GIX8IQxy87aObkI2nlnT17S454uxYzPYPFLmA5aD7QgePjeZrSKDw8x7l
   98HdDBct+3/jA9LbCerp7JkXww3Jz+aMuANB0hphDe8Km+GG8Jc0dP5y0
   g==;
X-CSE-ConnectionGUID: SWs0FlCaQgq7zR3tW0qxJQ==
X-CSE-MsgGUID: qbeupFypQiuLyp/PDliwtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11413"; a="49856040"
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="49856040"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2025 18:08:13 -0700
X-CSE-ConnectionGUID: 9Qq/XAPAS2ihB4EJ/9rMYQ==
X-CSE-MsgGUID: nv1s5Xe2SoCXPpbNgS37GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,237,1739865600"; 
   d="scan'208";a="155996564"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Apr 2025 18:08:12 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u87Y1-0004hV-2h;
	Fri, 25 Apr 2025 01:08:09 +0000
Date: Fri, 25 Apr 2025 09:07:32 +0800
From: kernel test robot <lkp@intel.com>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 4797/6092]
 arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb:
 /soc/bus@fe000000/serial@7a000: failed to match any schema with compatible:
 ['amlogic,s7d-uart', 'amlogic,meson-s4-uart']
Message-ID: <202504250940.I4ER0z0T-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   393d0c54cae31317deaa9043320c5fd9454deabc
commit: 1a30661c20dee51675a1ddee1b81b6a0e8580412 [4797/6092] arm64: dts: add support for S7D based Amlogic BM202
config: arm64-randconfig-051-20250423 (https://download.01.org/0day-ci/archive/20250425/202504250940.I4ER0z0T-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev19+g53ef030
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250425/202504250940.I4ER0z0T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504250940.I4ER0z0T-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	['amlogic,s7d-uart', 'amlogic,meson-s4-uart'] is too short
   	['amlogic,s7d-uart', 'amlogic,meson-s4-uart'] is too long
   	'amlogic,s7d-uart' is not one of ['amlogic,meson6-uart', 'amlogic,meson8-uart', 'amlogic,meson8b-uart', 'amlogic,meson-gx-uart', 'amlogic,meson-s4-uart', 'amlogic,meson-a1-uart']
   	'amlogic,meson-g12a-uart' was expected
   	'amlogic,s7d-uart' is not one of ['amlogic,a4-uart', 'amlogic,t7-uart']
   	'amlogic,meson-ao-uart' was expected
   	'amlogic,meson-gx-uart' was expected
   	from schema $id: http://devicetree.org/schemas/serial/amlogic,meson-uart.yaml#
   arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: serial@7a000 (amlogic,s7d-uart): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/amlogic,meson-uart.yaml#
>> arch/arm64/boot/dts/amlogic/amlogic-s7d-s905x5m-bm202.dtb: /soc/bus@fe000000/serial@7a000: failed to match any schema with compatible: ['amlogic,s7d-uart', 'amlogic,meson-s4-uart']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
