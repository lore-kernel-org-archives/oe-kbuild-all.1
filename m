Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB6138F86
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Nov 2023 21:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LjN0tIPw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700516294; x=1732052294;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8e8loWr3UT4o5wa46nqV/ZiiJv1I2kF9lzJ0CxkE1UQ=;
  b=LjN0tIPw1k0wUVpuh1yO9PJCOb01rb5IGLWxqYvcQcKikbU1a+3qapLf
   dKdE0QX+I3quKvd6ykhsITxtBBrSwUPx9CtTqrIL7E/7vZoi8xdd61E3o
   H9VxF6mYOrE0UNhf5MCxraHiBNywilCmW2jX8OFj0vzS9PUwU1BQil+fN
   uDuZ+woVniZ5wi66pISJaxyWnuLftlREic5iU9u1pZHxl1cAoIvFYhzqz
   C7NWwqfcwi9ABkxp+Pyvd59HxEEA840FEXdV0dwuuqPN/Kht36r9NtgfH
   MvVEQo8ojYRmeGka+V3OIFtn5NCIYYRhFHFel4geMoV5IG8KyeuZYbCy5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422814194"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="422814194"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 13:38:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="939901795"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; 
   d="scan'208";a="939901795"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Nov 2023 13:38:11 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5By4-0006wo-2A;
	Mon, 20 Nov 2023 21:38:08 +0000
Date: Tue, 21 Nov 2023 05:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: Martin =?utf-8?Q?Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, Hector Martin <marcan@marcan.st>
Subject: [asahilinux:bits/070-audio 11/105] kismet: WARNING: unmet direct
 dependencies detected for APPLE_ADMAC when selected by
 SND_SOC_APPLE_MACAUDIO
Message-ID: <202311210516.5oKyLgoR-lkp@intel.com>
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
config: alpha-kismet-CONFIG_APPLE_ADMAC-CONFIG_SND_SOC_APPLE_MACAUDIO-0-0 (https://download.01.org/0day-ci/archive/20231121/202311210516.5oKyLgoR-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311210516.5oKyLgoR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311210516.5oKyLgoR-lkp@intel.com/

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
