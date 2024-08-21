Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60EFE2595
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 04:32:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724214730; cv=none; b=H7MA9K0h6pHF++fuwsLcqbqf70QQmpY6t2hAwSXthDeWZnDLLXvcJ4rpxDmPJ/jfg5Rz7DRYNgJOrEnp3oXPYZrkrLbhD9BHfMo4/52IM39r6ip5kXm0AlwDykeI3Wt0S44gzXy1dsecZbPkJ0dlQFgzVx9aouRkoNeAx8HZYEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724214730; c=relaxed/simple;
	bh=gpHeaFwRv7C1OtQFV72ECw3XVm9P6jfW3KZkejiyl3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1JKHvmpws1r/YMKuUwpL8zoa+mbuJgFBpg0VTedm6z+h+h3s2hmK0FCtr/M2ZvZo/niie/Okeb02D1+23nSJO/gMm84QqDa5aV7Zl2V8UbTa7fvroZdtxCQKGXBuAft/Du5O0mKKLYmywAHsGrxDjIcncu/XK/CNCNmqG0k+Tc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UNFJ/SxZ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UNFJ/SxZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724214728; x=1755750728;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gpHeaFwRv7C1OtQFV72ECw3XVm9P6jfW3KZkejiyl3Q=;
  b=UNFJ/SxZKKTcsm0PN+7qkqtGo2x8ClRqpmOfL5Ja1hOfw5h+yNF1v+fL
   g1V8Sv9qzD9aqEHMieaPYVToIkiu2bkJbqshTuFOKINvlnaXP5wgQmVMK
   zXSpCBtqP1ep94Dw00vHWUx2d1eXGWeJALuegy89CRq8ekvnwk6biBI4X
   FypwiN1stwjH0oJk2cC5XeY5o4m7ZbBi5VYrzvA7vh0+UjLW9agYsZOXe
   J4smQpc/E9HE8enmsiqOzpUCMCzOoCttIy/VUFwME3SJ0BW15Kg+5c8UZ
   +UTjIdYqTHt56T53P1KZlvns0FYCSVEXra1ndgxyb2wKHnsR3ayW1Oo4z
   Q==;
X-CSE-ConnectionGUID: 3IGpxZPWSkqfIM75+rXKnA==
X-CSE-MsgGUID: Jxp3vw7STHGlRxllv229uw==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="25449605"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="25449605"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 21:32:08 -0700
X-CSE-ConnectionGUID: ijsXaz9CRX+mi1QoILcQ7g==
X-CSE-MsgGUID: dwW27/gYTEyWX9mgkzxy7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="60927941"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Aug 2024 21:32:06 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgd0u-000AtQ-1w;
	Wed, 21 Aug 2024 04:32:04 +0000
Date: Wed, 21 Aug 2024 12:31:51 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 13841/14250] htmldocs: Warning: MAINTAINERS
 references a file that doesn't exist:
 Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
Message-ID: <202408211258.N75PUM9l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   064a48f955e1d6177d42b7643b70779916c6197b
commit: 9170c596a361a8d254985050d344793b88694622 [13841/14250] UPSTREAM: ASoC: starfive: Add JH7110 PWM-DAC driver
reproduce: (https://download.01.org/0day-ci/archive/20240821/202408211258.N75PUM9l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211258.N75PUM9l-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Warning: Documentation/devicetree/bindings/media/mediatek,mt8183-fd.txt references a file that doesn't exist: Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   Warning: Documentation/devicetree/bindings/regulator/siliconmitus,sm5703-regulator.yaml references a file that doesn't exist: Documentation/devicetree/bindings/mfd/siliconmitus,sm5703.yaml
   Warning: Documentation/devicetree/bindings/usb/rockchip,dwc3.yaml references a file that doesn't exist: Documentation/devicetree/bindings/phy/phy-rockchip-inno-usb2.yaml
   Warning: Documentation/trace/coresight/coresight.rst references a file that doesn't exist: Documentation/devicetree/bindings/arm/arm,coresight-
   Warning: Documentation/usb/gadget_uvc.rst references a file that doesn't exist: Documentation/userspace-api/media/v4l/pixfmt-packed.yuv.rst
>> Warning: MAINTAINERS references a file that doesn't exist: Documentation/devicetree/bindings/sound/starfive,jh7110-pwmdac.yaml
   Warning: drivers/gpu/arm/mali/debug/mali_kbase_debug_ktrace.c references a file that doesn't exist: Documentation/filesystems/seq_file.txt
   Warning: kernel/Kconfig.kexec references a file that doesn't exist: file:Documentation/s390/zfcpdump.rst
   Warning: mm/hugetlb_vmemmap.h references a file that doesn't exist: Documentation/vm/vmemmap_dedup.rst
   Warning: net/netfilter/Kconfig references a file that doesn't exist: file:Documentation/kbuild/modules.txt
   Using alabaster theme

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
