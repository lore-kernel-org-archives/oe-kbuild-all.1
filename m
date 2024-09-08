Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313C6290F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Sep 2024 01:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725758741; cv=none; b=eCeikkkYB52SqLNNVik4i/cYV/sj36PF4W+RBVxiZ3yGnOdS6KPtt1PjxnL3bUl5vREuHaz9J7rDiVEs1vi4TSmC/SjNDXGPOxoZbXOqhvB+xs6aLsYMwg6qdu0t2WsgDaNC+VfIjIcy9YsoLQtgWCLdOIPrW3oZueem8ndVDP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725758741; c=relaxed/simple;
	bh=uR9HWPrpk8IMqW2i4OQtaSHLxVVN9HoXtwdQo/hUVCA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nq2jaAiZJO/AxOwadNM45LcrITZycP/V4J8VhOSaePakv9V3xBENNWZ4wkreHn1jourE3flLcomjXeoQInonnQYm67X7jTHbX2kyxdMERc+294Is6o/a1rTlM1d/kQS8piXQeXN9CGqGn0W/yxCfzvLO91mtE/qlqtiEeYlXfiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DsMrkKhJ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DsMrkKhJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725758739; x=1757294739;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uR9HWPrpk8IMqW2i4OQtaSHLxVVN9HoXtwdQo/hUVCA=;
  b=DsMrkKhJFvz+w5imsUBy3oCuLMOfc78tgBVSbQu97e4MkMHoRuY9rj2P
   VgAci7WlYOnjsUhDnqgTONiIrlgUiWqn/zLvPbH1rMh8keGtsCixvQ/IA
   QmkNbDEirNmyjIYtBumBEhfITH8UBF5eBrtBWyp8sVftFV+B3RA4gSwCR
   4C6M/MRdvSk0O0xMmK0UkZntksMPu2jooeDjZWgix4SAyAXzkd6aGgBGF
   ufnyGsWoYgJiSwQaXCae7R+5FHE3rB4qX+K/yUTst21aaXWI96z2U3pUS
   6T/dxme6RSMe1y3eSZWIuR6WHk+WNYLQXJ6q+/wCKG+5qpWm92llLz7yL
   g==;
X-CSE-ConnectionGUID: PC+end/yQvWig8ADNxp3BA==
X-CSE-MsgGUID: 9ZjctmKDShCBf7cb2yQU/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11188"; a="24675793"
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="24675793"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2024 18:25:38 -0700
X-CSE-ConnectionGUID: w4QrBZNXRuaJVLDg4IHWhQ==
X-CSE-MsgGUID: 8VeEXSBBRB+uUV7JUBhnsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,211,1719903600"; 
   d="scan'208";a="66554282"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 07 Sep 2024 18:25:38 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sn6gJ-000DBK-2f;
	Sun, 08 Sep 2024 01:25:35 +0000
Date: Sun, 8 Sep 2024 09:24:41 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.6.y 49/82]
 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts:706.27-717.4: Warning
 (i2c_bus_reg): /i2c@fe5b0000/touchscreen: missing or empty reg property
Message-ID: <202409080929.Tk7HgnHy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.6.y
head:   c970a63609188f53cf758a3dcd395e777150a29a
commit: 80809145e0b3da448b457a4048c7dcad0a4d24da [49/82] ODROID-M1S: arm64/dts: add support MIPI interface with touch screen
config: arm64-randconfig-001-20240907 (https://download.01.org/0day-ci/archive/20240908/202409080929.Tk7HgnHy-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240908/202409080929.Tk7HgnHy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409080929.Tk7HgnHy-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts:706.27-717.4: Warning (i2c_bus_reg): /i2c@fe5b0000/touchscreen: missing or empty reg property
>> arch/arm64/boot/dts/rockchip/rk356x.dtsi:1216.21-1227.4: Warning (avoid_unnecessary_addr_size): /i2c@fe5b0000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +706 arch/arm64/boot/dts/rockchip/rk3566-odroid-m1s.dts

   697	
   698	&i2c2 {
   699		status = "disabled";
   700	
   701		pinctrl-names = "default";
   702		pinctrl-0 = <&i2c2m1_xfer>;
   703	
   704		clock-frequency = <400000>;
   705	
 > 706		touchscreen: touchscreen {
   707			status = "disabled";
   708	
   709			pinctrl-names = "default";
   710			pinctrl-0 = <&touch_gpios>;
   711	
   712			interrupt-parent = <&gpio0>;
   713			interrupts = <RK_PC4 IRQ_TYPE_LEVEL_LOW>;
   714	
   715			irq-gpios = <&gpio0 RK_PC4 IRQ_TYPE_LEVEL_LOW>;
   716			reset-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
   717		};
   718	};
   719	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
