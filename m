Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2F13E493
	for <oe-kbuild-all@lists.linux.dev>; Sun, 28 Apr 2024 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714312777; cv=none; b=ZhQFB4wOhvn5SusTDN8SaD+oAKMrC3xhg/dWsk0WfB17j8ZBVBqfNEPxPUvkan+/2fThZEvarwtPg7aOSP5Hug4/BtRH0I70zRlg3JugtLiyCvAMq2EFhZk0ea2RGFHSQbXAKbo4HEyMtKckY0d4gE50IFZMVKhmq3IKVSgeABg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714312777; c=relaxed/simple;
	bh=htqlEnfD1il93x+O1F4QB8K1I0MztOTrmHrjE78AoVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e0uI+ZOpM2TFJ0RhpPkSRwtuAk4whserhx9nJ+fY42xgXehlz1bLW/zcpGP6a5799tfKtPt/5uAgeWEcr0oxaP1MLkY12nCXf1WFnn7yJevZAkSRcZ1PJiCmHNIkcOBlcD8ssyClXgbGISBxL7Bb/q9y+D0ArhbRd9/1PjPykRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IckOdC46; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IckOdC46"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714312776; x=1745848776;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=htqlEnfD1il93x+O1F4QB8K1I0MztOTrmHrjE78AoVA=;
  b=IckOdC46zoUivsutW3uxw4s034Hdwibm7vnt5btOpRso+C4dhxGjjCHQ
   CGABZOSYhNZ0ShXI/462ttpoo2abGhIRihmUPMYDQpWqClXYxiigu4ghk
   i3Ov6H/wGGiPOLsmspqugxjyusz1C6pq98EDWceoiqmu1xAD9pPv9Kuks
   0w7nDp+9eFuvJQPFc2/tYl49cvCjMMtnWPVwyVb0JVwTp44KNkmTqE7k6
   yQ5esJBlSZxLORgLlpFefeEJu3UFXyi/Slw1qKPaov2v7wW98RIyrBDjH
   pPRmPs0ewjdqfdBZt2ALsa0i25YLrFYWx3dyLu0ihJteArOdFtypCaGg2
   w==;
X-CSE-ConnectionGUID: XMp5Vi2NQW6dmTJpeYHSGw==
X-CSE-MsgGUID: ExonTsldTHqV1B34OE2t/w==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="13760845"
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="13760845"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2024 06:59:35 -0700
X-CSE-ConnectionGUID: I+19/p4ZSiWqvDsqJItIYw==
X-CSE-MsgGUID: aJ0tVesjRfGHJYzKju5dRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,237,1708416000"; 
   d="scan'208";a="25844219"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 28 Apr 2024 06:59:33 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s153z-0006Oo-0R;
	Sun, 28 Apr 2024 13:59:31 +0000
Date: Sun, 28 Apr 2024 21:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:6.6-1.0.x-imx 5892/11728] hppa-linux-gcc: error:
 unrecognized command-line option '-march=armv7-a'
Message-ID: <202404282145.SaYwuBL8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Freescale/linux-fslc 6.6-1.0.x-imx
head:   37770f55ac9c4f6cd958eb5544939207eed8478f
commit: 4ee746439830c24ac6722d15237c9992279f74ef [5892/11728] Merge branch 'mxc/next' into next
config: parisc-allyesconfig (https://download.01.org/0day-ci/archive/20240428/202404282145.SaYwuBL8-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240428/202404282145.SaYwuBL8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404282145.SaYwuBL8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> hppa-linux-gcc: error: unrecognized command-line option '-march=armv7-a'
>> hppa-linux-gcc: error: unrecognized command-line option '-mtune=cortex-a9'
>> hppa-linux-gcc: error: unrecognized command-line option '-mfpu=neon'
>> hppa-linux-gcc: error: unrecognized command-line option '-mfloat-abi=softfp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
