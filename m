Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16A002F3C34
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 15:09:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766416164; cv=none; b=jUYrKORuuB0gEc7vuzihsGBBC6gjZSPIPbZg0P8VXUVKXYUrQVzx3F+UZDo+drZzTIdaVqRDLUtFWW8Dc45m0ls3ThWOEjw+X2ojzlNgUshopGEqBd1UxWruh/Mi1BWyjG/EQmO98j5JvONaMuAX/QVo3kQRNRBSNDY6MRqbkKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766416164; c=relaxed/simple;
	bh=XRs6A9pv8ezbn6Fuw0PLRVeUah6I8ZgTuylbrwvwL50=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=siZyoljZLuoNPcXnfwuo87lmL1RBSaXnMlXeW/k6FmJu6UnEn2qz7ca0y9DjId+WAQLx3LRJpoBu5SklClEvGbTpxOYcdbEhLrhvTNzB/NocacqdSsfxGL/6BftCwyF4wsoIhbeHTylCNDZm4WqaXjFD/DduNvpXb9CNrxfp8fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P17B9iK/; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P17B9iK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766416163; x=1797952163;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XRs6A9pv8ezbn6Fuw0PLRVeUah6I8ZgTuylbrwvwL50=;
  b=P17B9iK/3Zh7uwwf1H4WeUt/Ulf4eAToawEa76p4VT8XuFmdOYv+2p1C
   XQoe7dzlhSZRE8VLsn9r/7CJz9JAmu9cy4zfdA4Bte3AU6YsCyN8YeZbH
   ougKYb+AnCLnyUMXKze+oaoQXqTw1YgQELGar6KD06qaUheej3nXSl3zv
   4sWaMOlDxNVGlA0X1GIy8eiu2jp5JkYvzi56lo0ZbuGsZktCccD2LsW5L
   0MxBGGNEzlUhyH+AWevSMqR6s4+RTUYxcGIwZPBwg02aCHmLmcJS//xNV
   QqgWiXStcqTRzqoq78M87uqSrwlVNBgBZ6EOApFp5k8OTk1p3eF4ObR7R
   A==;
X-CSE-ConnectionGUID: Yo9KQY6lQduoF1O+274+BA==
X-CSE-MsgGUID: DSZugZK6Tjyu8s1M4wdVOg==
X-IronPort-AV: E=McAfee;i="6800,10657,11650"; a="72119167"
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="72119167"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 07:09:23 -0800
X-CSE-ConnectionGUID: kXHUF8USTH+cu9JTeW1dCQ==
X-CSE-MsgGUID: Gi8z51YORhuI2uwxvoDFqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,168,1763452800"; 
   d="scan'208";a="223029810"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 22 Dec 2025 07:09:21 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXhXD-000000005Xg-2UM3;
	Mon, 22 Dec 2025 15:09:19 +0000
Date: Mon, 22 Dec 2025 16:08:25 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 12/12] kismet: WARNING: unmet
 direct dependencies detected for SND_JACK when selected by
 GKI_HIDDEN_SND_CONFIGS
Message-ID: <202512221648.rLW5F22W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   4e640d57b9513962095028e1186dddf47814e50f
commit: 1e702f432d551041753c46ec0d6d49484e776441 [12/12] ANDROID: GKI: Added missing SND configs
config: x86_64-kismet-CONFIG_SND_JACK-CONFIG_GKI_HIDDEN_SND_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20251222/202512221648.rLW5F22W-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251222/202512221648.rLW5F22W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221648.rLW5F22W-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_JACK when selected by GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for CRYPTO_CCM
     Depends on [n]: CRYPTO [=n]
     Selected by [m]:
     - RTLLIB_CRYPTO_CCMP [=m] && STAGING [=y] && RTLLIB [=m]
   
   WARNING: unmet direct dependencies detected for CRYPTO_ARC4
     Depends on [n]: CRYPTO [=n]
     Selected by [m]:
     - RTLLIB_CRYPTO_TKIP [=m] && STAGING [=y] && RTLLIB [=m]
     - RTLLIB_CRYPTO_WEP [=m] && STAGING [=y] && RTLLIB [=m]
   
   WARNING: unmet direct dependencies detected for CRYPTO_AES
     Depends on [n]: CRYPTO [=n]
     Selected by [m]:
     - RTLLIB_CRYPTO_CCMP [=m] && STAGING [=y] && RTLLIB [=m]
   
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_MICHAEL_MIC
     Depends on [n]: CRYPTO [=n]
     Selected by [m]:
     - RTLLIB_CRYPTO_TKIP [=m] && STAGING [=y] && RTLLIB [=m]
   
   WARNING: unmet direct dependencies detected for SND_JACK
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
     Depends on [n]: SOUND [=n] && !UML && SND [=n] && SND_JACK [=y]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
