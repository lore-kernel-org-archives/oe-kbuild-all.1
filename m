Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B761FA5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Sep 2024 18:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727116965; cv=none; b=Y42bzalOhnR1jebwnPJv2K7/3utoKGI5C4Zqmk0lj3pDqEjUCR/R7avdeh9IVRa2y5IL1cAjcaObKnblN8YrmF53B1d997rFdE3z7e7Gf/9D4KDWcW1zURg5e6moNHc6I9pIHycoLoX5svVAlwbEQStk52NTnOjYMrv8t7zcZMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727116965; c=relaxed/simple;
	bh=6peBv5OV04tlaG4zXNW/y22NxYIageRxEH/DfiAxPbM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uXR9UjRb+fUXTFOLj9WPUIvzp3se+B0XPGQzqhpklYONndpI2mmhf6WvVU+s/yZC0ckKnVGEBLGMhjJI22ogyMeATA3K3jQb7CNWZ5GU5VkNe+FiWMimUbXew50DKMbBb2X9/RXEmY5DzQnduQp6HR36WqYMszn7/6OptnOhBGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UI5W7B2q; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UI5W7B2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727116963; x=1758652963;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6peBv5OV04tlaG4zXNW/y22NxYIageRxEH/DfiAxPbM=;
  b=UI5W7B2qj8vH94oNrNDw0nNuUoPGi5uBIPJ8OnB+XT7mTouyICVAIWoG
   o/mm5w+FpxsF/wHCYw51SS7DWKrtN2fjwHRviQKilUJTJe/lIgd8SuMJu
   GbkIL+ddyVGg0Zpu3Dkl9DLReklKyQ40DWJ3EXTalYTnKjm6b2ypjWunE
   Zk1tEU26iB5Y4Xng6w3Nn7mYN5u4kpa3FGc3aV1Ou9ohkxONjZT7IB5fQ
   iVekLW+aAQQqXMQ3jnTXQG3xny/AlFUP20U5sN4tfpSvo6KwcF+PB3IvB
   MPksprL2rhfRRp/HnHh1MI+TTSI7q+GOpQhTZC+lV1QKeQuqzNA5bRfW5
   A==;
X-CSE-ConnectionGUID: l9HKRTOBSHSS2gEFsEBy9A==
X-CSE-MsgGUID: XJkgILcASbye7IXwUFezHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11204"; a="26273320"
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="26273320"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2024 11:42:42 -0700
X-CSE-ConnectionGUID: dPUnhcBySdWevbAGF/ocKg==
X-CSE-MsgGUID: 4JWmkNGoRIuun4Mb7bqalw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,252,1719903600"; 
   d="scan'208";a="70740741"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Sep 2024 11:42:41 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sso18-000HW6-2V;
	Mon, 23 Sep 2024 18:42:38 +0000
Date: Tue, 24 Sep 2024 02:42:20 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/070-audio 11/120] kismet: WARNING: unmet direct
 dependencies detected for SND_SOC_CS42L83 when selected by
 SND_SOC_APPLE_MACAUDIO
Message-ID: <202409240201.VG5WftGz-lkp@intel.com>
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
config: arm64-kismet-CONFIG_SND_SOC_CS42L83-CONFIG_SND_SOC_APPLE_MACAUDIO-0-0 (https://download.01.org/0day-ci/archive/20240924/202409240201.VG5WftGz-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20240924/202409240201.VG5WftGz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409240201.VG5WftGz-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_CS42L83 when selected by SND_SOC_APPLE_MACAUDIO
   WARNING: unmet direct dependencies detected for SND_SOC_CS42L83
     Depends on [n]: SOUND [=y] && SND [=y] && SND_SOC [=y] && I2C [=n]
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
