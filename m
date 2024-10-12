Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD4F12C549
	for <oe-kbuild-all@lists.linux.dev>; Sat, 12 Oct 2024 20:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728766582; cv=none; b=OlLkrrOjpq9XzM3Km3P7kd062OZZ73/4VLmEEii6QiVG05L55LRfL5iJ7XNdnT00V1oDk6lSG3htHvq7qV3W+1reZu1SidG58yMhq7OHpZeoDtDBE4LRwjA43GhD1HP4ncQapuIzepVniLgjJ3m2XpJUo7DmhzGdNQxAkU/CKUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728766582; c=relaxed/simple;
	bh=zwmK1oRkD5CVUdRE5DC/UgGMRMRtJ/2cH4384HUo7ok=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SQS1ArgbsnwU4hlMfbpDjDj8gX5nDUosEb1IC87AGzlVReR5XEIw/wf24L6ilw2zKugSY/JW+XA0XhtN1ReTSJbC7cftVOQWn0at6bL2xVq08Qw55X4q0Ee/ozbJj0e4Gk3BIMIPZMGRo0HrgnwEzr9h01CK73s8PxGt0rc56E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bakDaXw+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bakDaXw+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728766581; x=1760302581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zwmK1oRkD5CVUdRE5DC/UgGMRMRtJ/2cH4384HUo7ok=;
  b=bakDaXw+X/RnpuqLhl8CJg6UPSesBnSaJ+0+Tcw/rK8W2LtOvRvzkItS
   f7zaOCwFd3APnuZva7rkUPllPGDXkU4WoZKHY/n9QW20i2yj/C8e/0wyY
   APJuySIoJoLMoS8tsaw0mY+fkA2CFfNDkgyEsbl3JAQw6xin2FYL1xtxV
   piGciBQXzzF7F3MOzRtW8CLMgxbmPRwHAQcDoS0L7fsFG4P1vVyL5+FDT
   wJjuhLWiI2QoT1rJVR5HH2uKoPRyyc94Su21h+4ZxUUnUbS5dOz/xFaCY
   tNA84RrOYwJGMrbUVbXZnOb8R4tuF6gBB+VOLbR2Z/X7ioIsInNJ6BoQQ
   A==;
X-CSE-ConnectionGUID: wduzEGfwQFaeJ1ZXWf6nfw==
X-CSE-MsgGUID: zdeG3k1VSEKHQV2XP4FRiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31949482"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="31949482"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Oct 2024 13:56:20 -0700
X-CSE-ConnectionGUID: h50Cd1/JSeeOw3SqhV+2Xg==
X-CSE-MsgGUID: JYAncbkbQN6KxR/xNeuy0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="77135215"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Oct 2024 13:56:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szj9s-000Dih-11;
	Sat, 12 Oct 2024 20:56:16 +0000
Date: Sun, 13 Oct 2024 04:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6790/30000] kismet: WARNING: unmet
 direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by
 GKI_HIDDEN_SND_SOC_CONFIGS
Message-ID: <202410130413.IYf04xo8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   171355878e09938c06396498f584662e3eddcdbc
commit: dd17237d7284a4f7a881bd3c746e299f5b4675da [6790/30000] ANDROID: gki: build-in DMA_VIRTUAL_CHANNELS
config: i386-kismet-CONFIG_DMA_VIRTUAL_CHANNELS-CONFIG_GKI_HIDDEN_SND_SOC_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20241013/202410130413.IYf04xo8-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241013/202410130413.IYf04xo8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410130413.IYf04xo8-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by GKI_HIDDEN_SND_SOC_CONFIGS
   WARNING: unmet direct dependencies detected for ASYMMETRIC_KEY_TYPE
     Depends on [n]: CRYPTO [=y] && KEYS [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
