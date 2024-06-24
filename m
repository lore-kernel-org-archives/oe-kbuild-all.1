Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1616645010
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Jun 2024 20:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719262529; cv=none; b=bBb7vbgaXGH67FueHH1mtHi7le5JTlNKbr5OYCbX/OtcGnHVU0WEWGBUzgZZF0e/L8ShqEpdrMUuu0U57lqnWE/GWfRk0/YpJczPkT7LtDMMd0gNA4STVecM5Same5rPrXyQ7BlgJbbIQW0PVM36R6IAwgtSj4yhp1nqcASiahM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719262529; c=relaxed/simple;
	bh=ts9lKXomBpWdApTr3E/hrxAcIFfDS3l8oO9EFsnf1pA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=E/aVffG9ZmO9Zp0DEiRihpENjCOgiWskKAyCQnAPB0P5XdOuA38t0I74KP+xOM3Yt4mL+KCwI4ZmJL/6Gxnt2/w6XkSIBM17+DGJwRgvhgSzYlEAHsEfwXPbRUhDx9tmjm4r0Qg7XYosX6jkOO+BBbKn5duYnOoGPnhGtMjCReU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A7Uecg7m; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A7Uecg7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719262528; x=1750798528;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ts9lKXomBpWdApTr3E/hrxAcIFfDS3l8oO9EFsnf1pA=;
  b=A7Uecg7mB8doMQhBc6Gay5bjJfiXtoUZNrr/R+bwDn4n0sV9QAyfTMnO
   9j/vmq0uYl6yJ1vVNxqRtWKDm65yZqmIPAlf2eaSL1Wo/bFdh5l9yeizv
   bR2B2mrmzZ5i/eSZ+BGI93U2rN8tMu9MtOfQSVUyxxWhdHcBCe+ykLmSz
   HGjquokWiKendXCE5u55uknx1p6Ie57OLT0XqxFk5SC+OoTdarWu4Ru+J
   uuod/8n/0guZyWK2NK+UCjItfE+8WJSwF9BqC9T7EEEdUWfpcplpCzCGu
   dND9PyFdeVuhxg3zTsNtohHbx2t2wPjF/ZTA3wSDu2R7DEqgvxIGbaHUH
   w==;
X-CSE-ConnectionGUID: GHhozvo4S9GM/vGh+OKp0Q==
X-CSE-MsgGUID: Vp1zcp6YTdmETbEeoKK7FQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11113"; a="20136258"
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="20136258"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2024 13:55:27 -0700
X-CSE-ConnectionGUID: /kGziZ2CSL+CHnjxoFyyYg==
X-CSE-MsgGUID: dvfkDxsdRIW52z/5HQ5tug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,262,1712646000"; 
   d="scan'208";a="43520394"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jun 2024 13:55:26 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sLqii-000Dj8-0P;
	Mon, 24 Jun 2024 20:55:24 +0000
Date: Tue, 25 Jun 2024 04:54:56 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Hewitt <christianshewitt@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 7720/8016]
 arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: sound: Unevaluated
 properties are not allowed ('assigned-clock-parents',
 'assigned-clock-rates', 'assigned-clocks' were unexpected)
Message-ID: <202406250406.PfkX0bDF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   62c97045b8f720c2eac807a5f38e26c9ed512371
commit: 5feff053b08ce5d2167b9f44bcea3b466b5a81a0 [7720/8016] arm64: dts: meson: add support for OSMC Vero 4K
config: arm64-randconfig-051-20240625 (https://download.01.org/0day-ci/archive/20240625/202406250406.PfkX0bDF-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project ad79a14c9e5ec4a369eed4adf567c22cc029863f)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240625/202406250406.PfkX0bDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406250406.PfkX0bDF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:363.31-774.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:146.28-300.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gxl.dtsi:363.31-774.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: sound: Unevaluated properties are not allowed ('assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson-gxl-s905x-vero4k.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
