Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A5837A845
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Aug 2026 19:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787858152; cv=none; b=VaTEkQbZzb8xdW/YPPN6z2ERO27XPh6maQL4OpuEAXE6N+0UZrAOs/BAXbXv1mRYnGYl+3z+daVezCyemc6pmKFyQhjr0nPuyI//gdxgbVeaGfHRZQaB/mFFC3D66T2wLII81q/zr3Z6p5DqNNC23ZHSL+4yDrYmYzB8xKNIoVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787858152; c=relaxed/simple;
	bh=6yUeJZTVirkaCqYk5MQLzfGHIYCdZlL5SJFEARy59Ws=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bAStBrpvRZ/FMrhF/E9pIpCsrq6ebTgFD/uhsyMTkzw1X/wnoi2+VH9aDxeCEwNUoKRTD88j125ksi4EGkoapnYCA1P9nJdmkYm3bi72sHfF1F/bLXdAto2ylcmAkN6O9WoFzObHPTEHfOoTB0YCaHEfyVMw2biI0PKjMi43buU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I9WZH5xx; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I9WZH5xx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787858150; x=1819394150;
  h=date:from:to:cc:subject:message-id;
  bh=6yUeJZTVirkaCqYk5MQLzfGHIYCdZlL5SJFEARy59Ws=;
  b=I9WZH5xxPeDtkfPC2QzYpH/v5ddmEdnMfdaL2Qtq0rtgtntPklmFejqu
   CxS4T2DDxoVg6cXtmWfqbR9etqPwC4v0YJyJYjlxZIXlq1075dq3ZE6az
   tkv2szpRsBmhzlOQn7BSo1F49rNyMQ5DNTEKQ/UNzMN0ja29LaUH57eLl
   0JiOdNbOBcWlotiSZaFQnXubnxFXalWUQQnLHHsNgypEA8fTz9IU9XrC6
   kU5JOopz/HtbKJx2zpKCHtyuzFK1o0sbbb+355nm3rWUO3xv0cwPI8XJo
   +C4irS3aaGih6ENt+AEoxhQtOuK8IT4XYmaAKSDawvm2oMkcmL5ckLnAE
   Q==;
X-CSE-ConnectionGUID: 47hNFfK8Rz6nwCIeVFvs4Q==
X-CSE-MsgGUID: ykxlCqFJSsigN/1GciR60w==
X-IronPort-AV: E=McAfee;i="6800,10657,11888"; a="88572212"
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="88572212"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 12:15:49 -0700
X-CSE-ConnectionGUID: S1iioA0EQRqLSNqM2dZsvQ==
X-CSE-MsgGUID: 2j7UHNPuTkKdYb4ySszbiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,247,1779174000"; 
   d="scan'208";a="267980173"
Received: from igk-lkp-server01.igk.intel.com (HELO b2f8001b2633) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 27 Aug 2026 12:15:49 -0700
Received: from kbuild by b2f8001b2633 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wzfZi-000000000qf-0l5F;
	Thu, 27 Aug 2026 19:15:46 +0000
Date: Thu, 27 Aug 2026 21:15:45 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 6/6] kismet: WARNING: unmet
 direct dependencies detected for DIMLIB when selected by
 GKI_HIDDEN_VIRTUAL_CONFIGS
Message-ID: <202608272136.wTlvDa1O-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   9331e8caf0b91bc59e1c69068a59bf93d5e8a31a
commit: 1dfbe413d21f18f714cca818435299947bf5649a [6/6] Merge 6706415bf9f3 ("Merge tag 'gfs2-v6.10-rc1-fixes' of git://git.kernel.org/pub/scm/linux/kernel/git/gfs2/linux-gfs2") into android-mainline
config: x86_64-kismet-CONFIG_DIMLIB-CONFIG_GKI_HIDDEN_VIRTUAL_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20260827/202608272136.wTlvDa1O-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260827/202608272136.wTlvDa1O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608272136.wTlvDa1O-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DIMLIB when selected by GKI_HIDDEN_VIRTUAL_CONFIGS
   WARNING: unmet direct dependencies detected for DIMLIB
     Depends on [n]: NET [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for HVC_DRIVER
     Depends on [n]: TTY [=n]
     Selected by [y]:
     - GKI_HIDDEN_VIRTUAL_CONFIGS [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
