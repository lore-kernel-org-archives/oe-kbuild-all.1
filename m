Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FAF42907
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 22:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727131371; cv=none; b=CG8aGOmK/esmvOPQMw+z9p3x1Dxc7cwgSsZC6xOYKNIg/Iwc3srYaLmUbEoJb47Rhnp3KNvmccKjvwBNPWwoet2HvTvYX2CSPDrPw31EObZBaMnhdNLrl598cq1fhhws5pwf3pJgEvPRWbVaRfP+HQHHopwnzT6E6iuRaUMTrPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727131371; c=relaxed/simple;
	bh=Hn75NT0hM+yHZ1Xf1Uf2JbDqsRdlXSdSPNI7FjhUf2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uboXBnHI3oyV7Ubp60ipNpEe5BPxaH8Zkri1kckcuRQKP9X3SZAnGnjENy1Vt2j6YHBptxvykIF4XBNQ0zI3MBBaEl3InZ4tBxLWkA4RS8q+YoyrgRW4ojnktAlb8cX3sKEa6X5k4sWtGO7pHuJrGh16gKoMWTsveFwUzcy6vTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NgrShd0e; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NgrShd0e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727131370; x=1758667370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Hn75NT0hM+yHZ1Xf1Uf2JbDqsRdlXSdSPNI7FjhUf2k=;
  b=NgrShd0edTGB5V/zcnHAYTw5nqNBGp6npstfmNGPOsD0KHQyLu70cHBB
   mXPFXbEJ1NH7ltf9lMN65zg6SBC9hAukLI2tSmvOOlOdT9T5FZaDZmpYY
   K9hcXBX/ID/VDe7gnTq2aPHhQM0DPdRrSj4ap4l8HvWf/OMoGgJiUZcPs
   6wCtrTy8oRbSiebFhBM84KB5WwVxy2Y7+7LdYr8tE1f6Ovs6/RFL+a3fb
   WWq/dUmHL00O5dEmLdNLCZ7pq16+7EksPSYF+NCSDQrNUDEt8iE4zsF27
   YbX7wzFSIU+AmgWMOR9I/4ktKRHBleVfjHb+H4mcFBbNOhmvaFZs597dE
   w==;
X-CSE-ConnectionGUID: 101V88gwTD2wB26Q5SMJrg==
X-CSE-MsgGUID: bSOLdz26QZ2DEzBMS+IQqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="29888332"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="29888332"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 15:42:49 -0700
X-CSE-ConnectionGUID: vdktbLteS0qA4XdIBh7x6Q==
X-CSE-MsgGUID: yQfuqdniRiah7WmKxoIWhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="72041256"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 23 Sep 2024 15:42:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssrlV-000Hed-00;
	Mon, 23 Sep 2024 22:42:45 +0000
Date: Tue, 24 Sep 2024 06:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 15/120] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_CS42L84 when selected by
 SND_SOC_APPLE_MACAUDIO
Message-ID: <202409240622.CIKIB5Pj-lkp@intel.com>
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
commit: 9ee029babce6b9f263a0cf514395750176e4ff48 [15/120] wip: ASoC: cs42l84: Start new codec driver
config: arm64-kismet-CONFIG_SND_SOC_CS42L84-CONFIG_SND_SOC_APPLE_MACAUDIO-0-0 (https://download.01.org/0day-ci/archive/20240924/202409240622.CIKIB5Pj-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240924/202409240622.CIKIB5Pj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240622.CIKIB5Pj-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_CS42L84 when selected by SND_SOC_APPLE_MACAUDIO
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L83
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for APPLE_ADMAC
     Depends on [n]: DMADEVICES [=n] && (ARCH_APPLE [=y] || COMPILE_TEST [=y])
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2764
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for SND_SOC_TAS2770
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=y])
   
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L84
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
     Selected by [y]:
     - SND_SOC_APPLE_MACAUDIO [=y] && SOUND [=y] && SND [=y] && SND_SOC [=y] && (ARCH_APPLE [=y] || COMPILE_TEST [=y])

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
