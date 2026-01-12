Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8266142A96
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 01:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768179987; cv=none; b=S46zbgOjFoCYkylLGYqOPHelEj6A/7BYkagXilfvpqTr+/8XPMpkuQK8zuj4KyVgn/dTH8R++4vz1/CMNUPwZWV+ZMnKU4xWDzmIXW2WBcEqEV+K+X2H39GDNzD5S3LVaf1wcpQEe4RuYzosAL+8UJ3dndwidLEzYS0oJfShbYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768179987; c=relaxed/simple;
	bh=QFuMiycfS6EB1KsswS8FUYHax5vPFrnMsW2RovXBPwE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=m+g9xwEe74ij1pb8bd13lBzZec6KdKNg5lfOmxAZR6Lnpz9zyHdgJ1uUJmw/XAUDjfBxcUwXN7SyqIC+pelQ4WH3AOWAYHrUyM+rDnxWUZzvCEM93SumWxxmIu0XzphAWttZpQM681omsziCXSmK8Rg0rAqo1hRtNRGZGaarNEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eyZMHW15; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyZMHW15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768179985; x=1799715985;
  h=date:from:to:cc:subject:message-id;
  bh=QFuMiycfS6EB1KsswS8FUYHax5vPFrnMsW2RovXBPwE=;
  b=eyZMHW159ATq/ujk+22PRXh1A1E3rltAro3VnCCcLu5stROw0UaHdQiY
   8bxBEHD4fRRKXkTkebyDs4FKuB2LqCilqLiZOdvUHTugYowvdY6pCXui7
   WqJNlDkqVRbxqzjqZVWyUm34Yrw4xjV9NFnSWKD9342QrL3IhcM5F5TNv
   4iMZs90K+bfKpVWPzYcFLZGZtXVDawHKRWkcNQ8aZUPT9wZVzl7EjK4Eo
   tYjYQvykG5zEVTDATQNz19xSZ/bSi9GhBLb+Ij37vpPZ6bA7KhD+uEOWj
   H55nb+/gotT3Wb5kpevCg4QPEgp2gYfTmO2NFWSi3MjQJ7t80PzXvCRL6
   w==;
X-CSE-ConnectionGUID: CnT1N9q0QZCG2OBM7z29SA==
X-CSE-MsgGUID: joCpoKz2TXG3+PvWdcNHXQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69506379"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="69506379"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 17:06:25 -0800
X-CSE-ConnectionGUID: gYWRcARRQ7OCFsq2WdUWCg==
X-CSE-MsgGUID: DxItrJ01SpajU2k2H0O5Og==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="203972742"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 11 Jan 2026 17:06:23 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf6Nw-000000000aV-3zf9;
	Mon, 12 Jan 2026 01:06:20 +0000
Date: Mon, 12 Jan 2026 02:05:31 +0100
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_WM8731_I2C when selected by SND_SOC_DB1200
Message-ID: <202601120202.3vJDCiw7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f09079bd04a924c72d555cd97942d5f8d7eca98c
commit: 9dc15f81baf273b5aaaa3302ee8faacd78f361fd ASoC: wm8731: Factor out the I2C and SPI bus code into separate modules
date:   3 years, 9 months ago
config: mips-kismet-CONFIG_SND_SOC_WM8731_I2C-CONFIG_SND_SOC_DB1200-0-0 (https://download.01.org/0day-ci/archive/20260112/202601120202.3vJDCiw7-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601120202.3vJDCiw7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120202.3vJDCiw7-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_WM8731_I2C when selected by SND_SOC_DB1200
   WARNING: unmet direct dependencies detected for SND_SOC_WM8731_I2C
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_DB1200 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AU1XPSC [=y]
   
   WARNING: unmet direct dependencies detected for IIO_BUFFER_CB
     Depends on [n]: IIO [=y] && IIO_BUFFER [=n]
     Selected by [y]:
     - JOYSTICK_ADC [=y] && INPUT [=y] && INPUT_JOYSTICK [=y] && IIO [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
