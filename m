Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611222BD58C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 12:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766407942; cv=none; b=bfYy5nntO3P3VztKiaJ8feW4l2HoPqyjULV7mCDe5qIQqCU41UUfOyDUartssDFOki3+kY1z30B6Vv6d/zIp98jlGsYfD8UsC5fUvhR7qagl6A9cKFY4mojdX6KLqN5nkYOfq7Ul7t2mfyzVHgQd8kv6SRq8y9dPe8MXUFHVxPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766407942; c=relaxed/simple;
	bh=ZeO0iYTWUWhifKNNCjU4eIhadxK4gpIXQmczcuUrj2I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=skQF2/dhZO9oQ9HNIVwdw0/amU25RA/G4vIJlAe/5Fe1L9WN6WWe4qVvKg7YaB1uLyrMetRbOCBm9ZclVUwsgDYGJm7TDPpHR9TKc64D2lChIP6Wms/JAx79TShi+/JywdTtrl/uOcM6XJ48CBUl8Syq9e10zBXMJQjDmEIgawA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NRiBRNsp; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NRiBRNsp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766407941; x=1797943941;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZeO0iYTWUWhifKNNCjU4eIhadxK4gpIXQmczcuUrj2I=;
  b=NRiBRNspVFh+ClGqEDb/tDu7wnfRt7qJ/r4eTaQVjbW/31yfjoPYEy5v
   GMHSWdqNBX9Jwo0QrhXb3tU5xdgLPCCYbp5PLx4q3goltU5GGAj9Ckrs+
   k4yQv2KVYJwyHnC0RBQQs/At1CzBzA783NU8bA0D1S2XMvhGLFBDcxvNv
   s+Slhii3iKQuGAa+VFA4yQqMix6xVgp/V3SJVUr2SP1CpfSaJAgKweT68
   YTgVoSSJL6cUv9Xahs2IHUvnhEATKKkRC8qrv8vx9QdeAK/FhgzW5icpZ
   hwg4M3z73QV4Z/UAj66ZyD2cScILT4xgJJCJGzQGv0lxD0LTRUZExwYei
   Q==;
X-CSE-ConnectionGUID: n4+D8fXCSMGyobmjUOkWPA==
X-CSE-MsgGUID: 9IjJEG5RSZyeiR7p73S2AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68016004"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="68016004"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 04:52:20 -0800
X-CSE-ConnectionGUID: 4pfOSU2ITa+upkK2NOmLtg==
X-CSE-MsgGUID: dCoWjbICR+68SgYLzzp9Lg==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2025 04:52:19 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXfOa-000000005TQ-2YmC;
	Mon, 22 Dec 2025 12:52:16 +0000
Date: Mon, 22 Dec 2025 13:51:26 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for SND_COMPRESS_ACCEL when selected by
 GKI_HIDDEN_SND_CONFIGS
Message-ID: <202512221309.hFzdQMLn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   2141da9e498139ac37a520b62dfdc77db8003146
commit: d5ca9935dc180ec57650722a99ae5ec2ba2cff06 [12/12] Reapply "ANDROID: GKI: Enable SND_COMPRESS_ACCEL"
config: x86_64-kismet-CONFIG_SND_COMPRESS_ACCEL-CONFIG_GKI_HIDDEN_SND_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512221309.hFzdQMLn-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221309.hFzdQMLn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221309.hFzdQMLn-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL when selected by GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for PHYLINK
     Depends on [n]: NETDEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_ETHERNET_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
     Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_COMPRESS_ACCEL
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
     Depends on [n]: SOUND [=n] && SND [=n] && SND_JACK [=y]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=n] && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && 64BIT [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
