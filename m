Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33BE20E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Sep 2024 00:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726274556; cv=none; b=gds/ANMH9po/VSfSBYrNh/sTG3Vkc/MpaJebY10f5yR1UvsXekdQmgTT2VyIGk4yBCVbBlfWyZr0Vgup4IF//fK16tF7E0YKt50iUREbcTeUQxw1prV3yfxrfsIxhlt/OhgJFhK1szShvAcUeSvccKhh5CmLrCMP4CaM7JpWSxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726274556; c=relaxed/simple;
	bh=O8JRzOTHHwDPREReWkSl8TWQ7/60Kze9TGqyXehJ0Ek=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IrgoA+zZCGoOrXV87r61pOk3F2y8AKTn6UF4kyi+leTRjktALevMVYLIFndZga/yi6sKlIE7QFpQrNILbAfLDwvXBVVA4zsLXg8MeBiGrq4XNvRnRqTA0EIm7MeFxm7gWR0QYQHcvROVR9WV2RoNUYUvUnfuXHB7aDez7p2I9DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hYavHMss; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hYavHMss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726274555; x=1757810555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O8JRzOTHHwDPREReWkSl8TWQ7/60Kze9TGqyXehJ0Ek=;
  b=hYavHMsskmKm+EoABAFyfiHG0BYnprni0SsA4g7GnNC1GiFuoa5K4ebs
   wkuceGx+DBy0sgesdFZcubOcpUcgenpMtF0zN1CWIsgczNuHROy7j/Qz9
   l0yZnHRsnaEbssKu31/S2WwrQLwp2qG2VquZCqWAh+Vc4U23RxIpYS3G2
   28i3CGk/6zzXo0RDmZWLPwGb3tG/DqR0AWX0qCIGVhVA+5njSrVfcGNjh
   PF7k5pZepePnE7P03BJQ0YCWsaCrkb2hZhpecEB9M7O/u2WWdj2qZnXkj
   AWZOPH9ren8u8h0uUAsVLhirCbMwkkq3Zw7ActlUiK8w/IXkOmp+9JwVf
   A==;
X-CSE-ConnectionGUID: DxkvUDW4R+eBXq9ryDhsJg==
X-CSE-MsgGUID: Ea0HYYqFR5uK3BrOaDibkw==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="35764470"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="35764470"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2024 17:42:34 -0700
X-CSE-ConnectionGUID: 16CtzT9NQJOeapHcoyREUQ==
X-CSE-MsgGUID: 7CtOZmKsR0+7pYURy0ecGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; 
   d="scan'208";a="68238405"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 13 Sep 2024 17:42:33 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1spGrv-0007CQ-0H;
	Sat, 14 Sep 2024 00:42:31 +0000
Date: Sat, 14 Sep 2024 08:42:10 +0800
From: kernel test robot <lkp@intel.com>
To: Hardik T Shah <hardik.t.shah@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "Pan, Kris" <kris.pan@intel.com>
Subject: [intel-lts:4.19/android_s 825/30000] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_SVFPGA when selected by SND_SOC_SVFPGA_I2C
Message-ID: <202409140853.Wax9OXMP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 4.19/android_s
head:   84d5fc421289417e51781e27e64fbb0fc44216ae
commit: d7a49dd5fcce1d2295e1c63f2fbe3802663e4292 [825/30000] ASoC:Codecs: Add support for SV FPGA SoundWire PDM Codec.
config: i386-kismet-CONFIG_SND_SOC_SVFPGA-CONFIG_SND_SOC_SVFPGA_I2C-0-0 (https://download.01.org/0day-ci/archive/20240914/202409140853.Wax9OXMP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240914/202409140853.Wax9OXMP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409140853.Wax9OXMP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_SVFPGA when selected by SND_SOC_SVFPGA_I2C
   WARNING: unmet direct dependencies detected for SND_SOC_SVFPGA
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SDW [=n]
     Selected by [y]:
     - SND_SOC_SVFPGA_I2C [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_SVFPGA
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y] && SDW [=n]
     Selected by [y]:
     - SND_SOC_SVFPGA_I2C [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
