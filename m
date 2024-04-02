Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70CEA5A0FD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 10:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712053265; cv=none; b=PCt4yvF70jJLcS7tgfKph2V6Hbwf1z2gzgLBUdJx5fhaZPrO3O9sGQzjrRHN9WWMVQzMAbQUo+GxgEnET52I46RCc8spTdCYJ93ajZUtmAzFg64q8wcfceqY7YBUYTktDnaIlf4eL3WiiPJl79eRVdl9GbV/l9kJTglm4U20GtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712053265; c=relaxed/simple;
	bh=Avn13VlMDePtXneVlG0imVf8flw4lkgh8cfvaYHhcac=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AsprWU/GRQWDXBJ6T5uM3m0Um3PyHv//xJZm1M5s7HgahYqwmalTy+OPskXG9G/31Gvbc471o30EgxUfVIxKLcrB5SrFYeVaSMXtR1LFSmMy2K74GOdr8ve5HSXAWTioDrEo0vpQlFlrU0yDfn5HlDZsW4Bx6VFdRPNAIJ5bhFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ihVXRm3J; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ihVXRm3J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712053263; x=1743589263;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Avn13VlMDePtXneVlG0imVf8flw4lkgh8cfvaYHhcac=;
  b=ihVXRm3JES1uR0PWo65+m5Ttd6g+IEKtjdGad1k++GUvzsCokecrvw9T
   fzr0wwHBuBi8pi44jL95AXn7OeXzo72C9rytsETNYGWzzjyoN5pkpm71k
   TeS5oFiQQHzMIThrIH2wNNkeYh21HrMBUGMhTmnnsMn6quGlpJkQfvCQd
   vXZ03vnWD+2PRlpQJapa/3wmrfixjmlzBmjHsWSIYSyJ+sDNFlrKYFOUO
   JUK/T8i3i6TGWp8dZyqo7y1gTdB4DDM2igqKzPbFNGHhCRH1OCu9jQBmu
   2pkLoVgXsj5/R7tzd4KMTEOIZw7VA3nl/hfrJqSsmCfi0PHkTHryx2C/q
   A==;
X-CSE-ConnectionGUID: jx4MHdV5QY6z07HkkdtFDg==
X-CSE-MsgGUID: XXizblZmSda1NsXUYo3czA==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7148804"
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="7148804"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2024 03:21:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,174,1708416000"; 
   d="scan'208";a="18099378"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 02 Apr 2024 03:21:01 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrbGE-00016r-1x;
	Tue, 02 Apr 2024 10:20:58 +0000
Date: Tue, 2 Apr 2024 18:20:23 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Janne Grunau <j@jannau.net>
Subject: [arm-platforms:kvm-arm64/asahi-base-6.9 343/699] kismet: WARNING:
 unmet direct dependencies detected for REGULATOR_FIXED_VOLTAGE when selected
 by SND_SOC_APPLE_MACAUDIO
Message-ID: <202404021826.h08vFKrP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/asahi-base-6.9
head:   6e6d48dc1d559c7d80766249a90e9f94bc6bece5
commit: 3da860c6862d8068d5b337e9ccdb58d4487a38a2 [343/699] macaudio: Fix missing kconfig requirement
config: alpha-kismet-CONFIG_REGULATOR_FIXED_VOLTAGE-CONFIG_SND_SOC_APPLE_MACAUDIO-0-0 (https://download.01.org/0day-ci/archive/20240402/202404021826.h08vFKrP-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240402/202404021826.h08vFKrP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404021826.h08vFKrP-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for REGULATOR_FIXED_VOLTAGE when selected by SND_SOC_APPLE_MACAUDIO
   
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L83
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2770
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L84
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for REGULATOR_FIXED_VOLTAGE
     Depends on [n]: REGULATOR [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2764
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
