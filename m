Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5297F13AC1
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 07:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737704591; cv=none; b=BHsuk/ShWMqNzZBToIXJ98uE4Z6RTNPih01gGwJAOjvALbHwvIY3fMe59J4JT65E8YPLRqei+SQzlePxLC/9an79mWW/pbyfp8OAZjHo6nxQA8dN79JNV+QKYk6A3q1TeeytAbXLhl9oZYdpa7oK/M6My3KMZxNY6XLbvIiCiaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737704591; c=relaxed/simple;
	bh=pTmnLeFd0IgqFN2Grb+T9epxWByafSJfs4M8RFQ5QuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r5md/7jjiivfjaD2ezlny0osf1edSU19wkhkg/TceRmOA+90pnNeCioeCZzdsg8+N3kSzQs1pltr/+N8M1k47Tifg42+W023x2MfA/Qau//uGr19oPfsvFcvvW9+PeoProDHH4RSu1IpKePz2h57N72BWwAFwkB7gq+TlbtS3ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UYpDQCki; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UYpDQCki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737704590; x=1769240590;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pTmnLeFd0IgqFN2Grb+T9epxWByafSJfs4M8RFQ5QuY=;
  b=UYpDQCkiIBcUhq8QoNSmerr2I+3OtvMhth9Bv+E+FXnSzKlwQUi7wgLx
   ig40xqDfaWwm+DZ8GPGmdJAeKO4JVatDjY5bU/54QxL7WA0Z9HHGjJIUK
   V5mbTlO5mZIGG3qbH2Y2Nz6SqA6B4k5bZ4H1NbdOrmbA9AcL5VMTAAbiF
   fKY87P7mxpnRS1NG6e9yKnWwu6hbU01FYDVTBwJM4Jm3BAzY1sBq96+49
   Jm68WQL77Ud5GkGWuTwHI7/yatxyY3aAoLcCIHmw/K3Tsq2fmwlCv4FT1
   y2uOG/PqxDhlfHChXN4B/RhedBRpjRcvpTMonuBnzu96bBnQp2yqf8Yit
   Q==;
X-CSE-ConnectionGUID: +W6qqOeVR1iLrP9/zik74Q==
X-CSE-MsgGUID: 50JHiCEwTR6ehEShMuvqwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="41896310"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; 
   d="scan'208";a="41896310"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 23:43:09 -0800
X-CSE-ConnectionGUID: j/0Nnq3/Szm9uOCL+AF1BQ==
X-CSE-MsgGUID: UdjSLwNyTGubRTFrdgnZbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="112333049"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 23 Jan 2025 23:43:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbELI-000cMP-30;
	Fri, 24 Jan 2025 07:43:04 +0000
Date: Fri, 24 Jan 2025 15:42:58 +0800
From: kernel test robot <lkp@intel.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 SND_SOC_WM9712 when selected by SND_MPC52xx_SOC_PCM030
Message-ID: <202501241519.l6GwYVpH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bc8198dc7ebc492ec3e9fa1617dcdfbe98e73b17
commit: 5a309875787db47d69610e45f00a727ef9e62aa0 ASoC: Fix SND_SOC_ALL_CODECS imply ac97 fallout
date:   4 years, 11 months ago
config: powerpc-kismet-CONFIG_SND_SOC_WM9712-CONFIG_SND_MPC52xx_SOC_PCM030-0-0 (https://download.01.org/0day-ci/archive/20250124/202501241519.l6GwYVpH-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501241519.l6GwYVpH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501241519.l6GwYVpH-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_SOC_WM9712 when selected by SND_MPC52xx_SOC_PCM030
   WARNING: unmet direct dependencies detected for SND_SOC_MPC5200_AC97
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC52xx [=y] && PPC_BESTCOMM [=n]
     Selected by [y]:
     - SND_MPC52xx_SOC_PCM030 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC5200_SIMPLE [=y]
   
   WARNING: unmet direct dependencies detected for SND_SOC_WM9712
     Depends on [n]: SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_SOC_AC97_BUS [=n]
     Selected by [y]:
     - SND_MPC52xx_SOC_PCM030 [=y] && SOUND [=y] && !UML && SND [=y] && SND_SOC [=y] && SND_POWERPC_SOC [=y] && PPC_MPC5200_SIMPLE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
