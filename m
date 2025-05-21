Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D0F23644D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 21:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747861908; cv=none; b=mZ12Xa7wigW8OdFvKkRp05rKj2BCHNDobH4uU7xQ2FSe0HfhFiVw8NwFkaKOljltiAiMMj9fXUm8PKsbdnTrVzDmmCzZetVh40zKhKywiDpjuZEPqihhCZFY4fyr4+TZFIFocUsHdaF6wkn0tAHxtrBYiBleKFzAQO1pzJphq9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747861908; c=relaxed/simple;
	bh=MStgpufgSKCCSySF//lKTy6gjrljmyEZH5bP1VAKH5E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UqTcjMWxVZveMZm9TW77To7Gy6sMVBYV4zkugWmGtXE/PWmW6kkqOpUajJ15sOiQ9C+2PgU4mfS+ctJBAy3hKB/49SHpFXSF3LCJd4i5JTF0n5gKFtIV9tqnIGqDB+vcBoZwEoLVaP2obHC1q3lnqca9mUIfl8rDWxvUiBWlPX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BjB+QZYN; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BjB+QZYN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747861907; x=1779397907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MStgpufgSKCCSySF//lKTy6gjrljmyEZH5bP1VAKH5E=;
  b=BjB+QZYNBMxsXnJPR7zgiq4e0ARsxL/CstdF4rENTJegZFnOPSZcpUOl
   awKFxPWHpVy1/jzH5A0B8lDVdvs7tX66hKWwLibuqBLwS2q6CIclB+5yT
   4Z+CbbtjxvwgQEKku7c5DyxGWQ7nyn1FbAJGTQvnVuiALNA7gOdLIPVCo
   PjwAAk9MWeLmmGT5KplwghuBWdNiHK9maodhElH0/Bi8CA9rvX56ItONt
   E1bsdZktDTkCczImste64U8Y1vo5gIvn4YhbNhri7QOrHiTC4ktZBi4Nu
   FXX08WOOFyAZnFR87Wyjqi6ZIZJYhbFtus9HCEd5XgPBmxwea89YhmFUj
   g==;
X-CSE-ConnectionGUID: K98rD6ZXS6+8RrMZHQCidw==
X-CSE-MsgGUID: mZGgOU4CTzmMJeKfzvmHMw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="61269791"
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="61269791"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 14:11:47 -0700
X-CSE-ConnectionGUID: +KEcEN10RfSPh+ZV5hGv7w==
X-CSE-MsgGUID: 6NFxjqXIQzuUd4uScPu5og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,304,1739865600"; 
   d="scan'208";a="141316888"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa009.fm.intel.com with ESMTP; 21 May 2025 14:11:45 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHqj1-0001B5-1R;
	Wed, 21 May 2025 21:11:43 +0000
Date: Thu, 22 May 2025 05:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6-2025-01 4/4]
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: sound
 (simple-audio-card): 'simple-audio-card,hp-pin-name' does not match any of
 the regexes: '^pinctrl-[0-9]+$', '^simple-audio-card,codec(@[0-9a-f]+)?$',
 '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple...
Message-ID: <202505220526.tfENxDjf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6-2025-01
head:   97728a1436424265258cd2b247753e19e79202d3
commit: 893c17716d0cf68f5ff4dc71c90e0c2bd1f7da46 [4/4] arm64: dts: rockchip: Add NanoPC T6
config: arm64-randconfig-2051-20250516 (https://download.01.org/0day-ci/archive/20250522/202505220526.tfENxDjf-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250522/202505220526.tfENxDjf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505220526.tfENxDjf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'msi' was expected
   	'err' does not match '^int(a|b|c|d)$'
   	'aer' was expected
   	'pme' was expected
   	'hp' was expected
   	'bw_au' was expected
   	'bw_mg' was expected
   	arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: pcie@fe160000 (rockchip,rk3588-pcie): interrupt-names:4: 'err' is not one of ['intr']
   	from schema $id: http://devicetree.org/schemas/pci/rockchip-dw-pcie.yaml#
   arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: /phy@fee80000: failed to match any schema with compatible: ['rockchip,rk3588-pcie3-phy']
>> arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb: sound (simple-audio-card): 'simple-audio-card,hp-pin-name' does not match any of the regexes: '^pinctrl-[0-9]+$', '^simple-audio-card,codec(@[0-9a-f]+)?$', '^simple-audio-card,cpu(@[0-9a-f]+)?$', '^simple-audio-card,dai-link(@[0-9a-f]+)?$', '^simple-audio-card,plat(@[0-9a-f]+)?$'
   	from schema $id: http://devicetree.org/schemas/sound/simple-card.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
