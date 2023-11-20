Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5572DEAEF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VlXZt2cn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700477713; x=1732013713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ug9Id+CrjTX7bb6MLdd1T5KMsUuapzU6zXA3yPTOnNM=;
  b=VlXZt2cnteZMAf2DxGfcTJEyf0B3EEMqatJsF4j9eQeAe3HtpRBIXB/4
   S9uTRyhmPe1+92R8TePvLxcfVY5SdXus7/Fzxv4WoV1s5pQPvVO3RB4CW
   qXGctu9uBIw6AfEUObOUJXGN1NzZ7okha+864aSmCZ2Ms5q3AxgNpLb3a
   mbCWJBWdZhCm5QDwnve7yvfffiSGPM4paAXkbOqL6U2y+E0fNnoXMRZ1h
   6Msa0Dl91QVRFANQdLyTvAfaM/rRYi0OJLe4fEiGqmX3QoMzLxZ7HpOKe
   Fbp3uuDv/yO+Pz7S/1IWm4X1UqmxQCy5L/ecwqkjsy/O/S3MuYWZEyMXm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="455921353"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="455921353"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 02:55:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="836712256"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="836712256"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 20 Nov 2023 02:55:10 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r51vo-0006Nd-1e;
	Mon, 20 Nov 2023 10:55:08 +0000
Date: Mon, 20 Nov 2023 18:54:58 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 11/105] kismet: WARNING: unmet direct
 dependencies detected for APPLE_ADMAC when selected by
 SND_SOC_APPLE_MACAUDIO
Message-ID: <202311201832.388YMmxu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/070-audio
head:   1c71b1fa2c491cc29c94d29f1a450dba39f27557
commit: c58ceb13a4c2cc59f093a06dfd9ce4804826264c [11/105] ASoC: apple: Add macaudio machine driver
config: alpha-kismet-CONFIG_APPLE_ADMAC-CONFIG_SND_SOC_APPLE_MACAUDIO-0-0 (https://download.01.org/0day-ci/archive/20231120/202311201832.388YMmxu-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311201832.388YMmxu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311201832.388YMmxu-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for APPLE_ADMAC when selected by SND_SOC_APPLE_MACAUDIO
   
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L83
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
     Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2770
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2764
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for COMMON_CLK_APPLE_NCO
     Depends on [n]: COMMON_CLK [=n] && (ARCH_APPLE || COMPILE_TEST [=y])
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && (ARCH_APPLE || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
