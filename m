Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9474D13C8EA
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Jul 2025 04:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753851012; cv=none; b=fg9dz23jg5aUk2P6qLn/6tHB+SanxzS4/O8pI8twAJ155DEZP5uM+uHKn3IRzU8tkJgfb15idt7pORwp3ya4Zhenirt7UocSh4mlvNxRhawYdzog17wfYMnDcEEix3hc+kovpzPBUpXwS0Y0NpyoQcu1be6EEjHfJfEEXnJ7dX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753851012; c=relaxed/simple;
	bh=vxd8qI41w4lFXPdg/u1z/zuf8sVSBKRqew8tmzCh8mE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=trWIVnfuXIe5TNXYAErFm5S3peV+LBlKscVhSfS6DidKJP9AkTvNiQKt3jPtCb2ettXNg20jtkb1eJdSoV8bOITD0agqg+wu5ekGfILq/Sg4nasUdxRdz9OsUvRQcKGwRxvX8Q6gDkOx/i9lYr5NG+HGxQtygxaOSh4ROOWY7og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aN++MxP/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aN++MxP/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753851011; x=1785387011;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vxd8qI41w4lFXPdg/u1z/zuf8sVSBKRqew8tmzCh8mE=;
  b=aN++MxP/5CGcjyRsBg5358h1A7/2PtNs/czsV9bEWkfkqpc/eISz25tz
   xz02U4N6S8CmvNP5H9+MZZENivf8lbebvCEJWJMfdd0aj7LOhTLo9FoJB
   yUdpmcCgYckkILmEwBC7JRJY5AC1zVQJBtCthWsqLm+GDMB0nT0ghaDoA
   aKsuBjbCRylDFT6t8/ZN3M+CKCeTVNA3DZhin4Ua5CNNinIaHPeGhM2A0
   sv0nKlnO9hxj2n0z1Swg2bsbrZ1/SDn+eMJt1JgcYQfrR5cAtFt42MkwW
   vlj0Wh17jk7Fbjka1E4IcuMb7FY/1SA2LwJwU1PbV7BL+67cOcC+TBuBB
   g==;
X-CSE-ConnectionGUID: D6LuUBIiR5WT1UHy1gjeRQ==
X-CSE-MsgGUID: iyHybUKNTqWVsdFiB1RyrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="73729396"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="73729396"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 21:50:10 -0700
X-CSE-ConnectionGUID: ba+D2YIaRBWYTQgIr4/ljg==
X-CSE-MsgGUID: 8+oM62eaR/Cz8UGjBNEiVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="200063784"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 29 Jul 2025 21:50:08 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugylS-00022i-1z;
	Wed, 30 Jul 2025 04:50:06 +0000
Date: Wed, 30 Jul 2025 12:50:01 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:config-gpio-legacy 2/17] kismet: WARNING: unmet
 direct dependencies detected for GPIOLIB_LEGACY when selected by
 INPUT_SOC_BUTTON_ARRAY
Message-ID: <202507301224.IcZlZuJX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git config-gpio-legacy
head:   fac637a2acaf3133517ac4fe5774fd46200ebe6d
commit: 995c76328bc34941c467895b511c0f7d16bfa06a [2/17] arch: select legacy gpiolib interfaces where used
config: i386-kismet-CONFIG_GPIOLIB_LEGACY-CONFIG_INPUT_SOC_BUTTON_ARRAY-0-0 (https://download.01.org/0day-ci/archive/20250730/202507301224.IcZlZuJX-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250730/202507301224.IcZlZuJX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507301224.IcZlZuJX-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for GPIOLIB_LEGACY when selected by INPUT_SOC_BUTTON_ARRAY
   WARNING: unmet direct dependencies detected for GPIOLIB_LEGACY
     Depends on [n]: GPIOLIB [=n]
     Selected by [y]:
     - INPUT_SOC_BUTTON_ARRAY [=y] && INPUT [=y] && INPUT_MISC [=y] && KEYBOARD_GPIO [=y] && ACPI [=y] && X86 [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
