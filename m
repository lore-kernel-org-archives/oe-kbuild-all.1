Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD4C73815D8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 04:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779336534; cv=none; b=fN67j6AXZ/c+Y+XF5DAf6F6BRfKco44kgeIK58Te1j0KPMnc6+8JtHLoNOjF+p33j61/6HY4HTL37eTNiUclQsDRF+dK8MPJZR/FPlk9a/BcHfcf7wTg3lhc0KXR9zc5VN722QzaY8D+rvS902TOPPG8NtN6sQFguNIeeNpibYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779336534; c=relaxed/simple;
	bh=Tgq1/Ui2unzCNlV6fXbw/FlWXjGsJ42mV0xkMtrXxsE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=J4DxlP3GDD9HYuLn03H4y3Kl60hlhL92eXM+TJpE7esozzvpY98CP66HXSyec5UxNe6sphV/+s7sF8H32BbEIpjg1MzSbtMZkrFGGQrFUN0QYQ8UA/Bqve+ZMa6OLPMhY+CNtS9opsREHnUVOoATFfMSdrbKwc3PmGnqGsyPBS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=myo1JlB2; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="myo1JlB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779336533; x=1810872533;
  h=date:from:to:cc:subject:message-id;
  bh=Tgq1/Ui2unzCNlV6fXbw/FlWXjGsJ42mV0xkMtrXxsE=;
  b=myo1JlB2NM8h2084V2MBHLDiqivbF9HNdB2yYjdqKKmchgDyfm8E4WNT
   JYGx547sW54GYrPECcDUiEUf1yX52NJgSEoWykED8Z3MIV/3+vx2uoulu
   bOAFdGyvtZKwWqkLqdByq69WVyq9Spqlo3uau8vKx1i2976K78Kz9Ugqn
   FQNic57w5mEmxb42sIBN43YWreJxZSHwTTvNXFYUcphk8loMG67OxE50d
   wvkOUJ8nbQeIrHOwWVk+5A2OoCrs6ksaCuK+MloPYiIGwW7F/BKxAO4HZ
   wrHAZqtbEUEfDAWw3p27dugIgHb3+/fqIzmWtsTGtZvELj7RkOmV0zWyX
   g==;
X-CSE-ConnectionGUID: fxvVrOKFRgu0xT5/+icKJQ==
X-CSE-MsgGUID: c4TagGgqROOx/41l/F8TtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="97820696"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="97820696"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 21:08:52 -0700
X-CSE-ConnectionGUID: 89xQ0zqHTNGny2xHhtkdKA==
X-CSE-MsgGUID: Xv1yktbNSSCb/QxwNaIXHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="242213136"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 20 May 2026 21:08:51 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPuiG-00000000Alb-3U8l;
	Thu, 21 May 2026 04:08:48 +0000
Date: Thu, 21 May 2026 06:08:27 +0200
From: kernel test robot <lkp@intel.com>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Linus Walleij <linusw@kernel.org>
Subject: [linux-next:master 517/6922] Warning:
 drivers/gpu/drm/drm_panel.c:119 function parameter 'dev' not described in
 'devm_drm_panel_add'
Message-ID: <202605210648.RI4ufD66-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   687da68900cd1a46549f7d9430c7d40346cb86a0
commit: e43a8e3ad8fa3c2c2220a06fa46545c7ff82a9b7 [517/6922] drm/panel: add devm_drm_panel_add() helper
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260521/202605210648.RI4ufD66-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210648.RI4ufD66-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210648.RI4ufD66-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/gpu/drm/drm_panel.c:119 function parameter 'dev' not described in 'devm_drm_panel_add'
>> Warning: drivers/gpu/drm/drm_panel.c:119 function parameter 'dev' not described in 'devm_drm_panel_add'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
