Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B32413FEE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Sep 2024 06:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727160131; cv=none; b=R7fwLcS4tIePmwAsFVZXRwHASuYq+k8J5OX2jvXEEN9QklWeHaNr97kDkwqICkoN/HaWuYfV+q92jmAAp5NR2R9mqJV/1PWgvsByiIkCOxhqeVctV0lzTLKJQtotkEK++nZfJ7dq42h+BZxjjMR+Yj1AtLbdK172LUVfkKgE+eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727160131; c=relaxed/simple;
	bh=++Nrxw7ljxmSQFkUqOJJz1YRRL71ccQYDpyxaAp6Mgo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NtVscXmk/ZsLK32b+6twU40wKf389ntaF/RogD4ItDZ2Nnh6VR982oQItxWdcK2bEVmbbTBw5macpShpySOwgUS0PSPsGAv+ooU8QvvUtx4anWbKgRacHqc161dEy/HfUztL6cLzjZidkhkSeB+6jGEYYfCMWan8PlOsT/Gjx2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BNw2WSQN; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BNw2WSQN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727160129; x=1758696129;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=++Nrxw7ljxmSQFkUqOJJz1YRRL71ccQYDpyxaAp6Mgo=;
  b=BNw2WSQNYzCVx8524Pulucsv+7uHrFV/4J9N3j5JCdzjCvZ9qbMFr9yQ
   uoe5EfwU+yfnyo0EmiXAKjqD1YIMuObd/brmLaWN/9DKcn6Rp82d6b13j
   P2pxFbOcztrrfijta07XYjLO6w2WlnF4ygFCwJffH3GhZ5izo6knX/zEG
   diaA4Vq7a/esL7Y2UN6dfL/f2hqvQYMHXtH1a/29dEeCRnmtGTzQ+hKEs
   f/DTMbMxdji4Pf5i9itTTU2kDUhrwwd8uy2ezxjHUjtEi9Tt7ReSGMW4n
   /LfLB4CM9ZixaoO9yKbC+75NOLtVZTSdqkEY4oY0M8l4p/BTG+yBdDrII
   A==;
X-CSE-ConnectionGUID: qEvcDQZxRbiRAnu++odNMg==
X-CSE-MsgGUID: 9ah6aa27R0ilH/+90PhBKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26255146"
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="26255146"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 23:42:08 -0700
X-CSE-ConnectionGUID: e5V8t5/9SI6MJiDMTg9ZSg==
X-CSE-MsgGUID: EsVzCGLRTceJabFb1JYgTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,253,1719903600"; 
   d="scan'208";a="76081939"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Sep 2024 23:42:06 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sszFL-000I2L-1v;
	Tue, 24 Sep 2024 06:42:03 +0000
Date: Tue, 24 Sep 2024 14:41:42 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 11/120] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_TAS2770 when selected by
 SND_SOC_APPLE_MACAUDIO
Message-ID: <202409241418.mvbQlYuG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   79e5f455d8c4ad8e5ba25ab4ec5945bdce3d1a91
commit: 5c35f3969b33f8ef71a7a03aa86ea3c285a7552f [11/120] ASoC: apple: Add macaudio machine driver
config: arm64-kismet-CONFIG_SND_SOC_TAS2770-CONFIG_SND_SOC_APPLE_MACAUDIO-0-0 (https://download.01.org/0day-ci/archive/20240924/202409241418.mvbQlYuG-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240924/202409241418.mvbQlYuG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409241418.mvbQlYuG-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_TAS2770 when selected by SND_SOC_APPLE_MACAUDIO
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L83
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
   
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
     Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
   
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2764
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])
   
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2770
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=n])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
