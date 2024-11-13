Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720C01F81A0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Nov 2024 11:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731496564; cv=none; b=LeOqEWrCDCdo0/TVhAGagsv8p9XBT84H0ELqJfq+mQI7byceKCJCwp4p0oQgDisTj0vIXXd7jFbiuR7bT8K0qyH1oDucMf5OxquKGc/0yBCcexdCJjXpu9gkbyFJkedHEGnPYZHUA3IRClzCayxB5p97PQ+RCdO+8BznaIL7L98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731496564; c=relaxed/simple;
	bh=PqHxdEM7ZRC0oVC3jmv5WbRXsM49r6We4wzRqp0BivQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g8g85iqlkLsXjeySPul7KI0x1uGB3cKMhtM/9Di7yA6zXIMJGXpAGI9II9Q6kPiriYUwaXQtSd+f+nx9yo7Q9prDBHwGfJIF6p4TUk0aYXh0zBn/I6u+CTzrREcTbo6x46QLg2XnpuYmw5yNxMMwkk4MKmm1/55j/wkAbUyeNEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bx9/WtRN; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bx9/WtRN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731496562; x=1763032562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PqHxdEM7ZRC0oVC3jmv5WbRXsM49r6We4wzRqp0BivQ=;
  b=bx9/WtRNGhyAP4LDsAlrOIH8X42aIJyUIZ1mY1FRw93i7j6zaicKWcJt
   gPRE09tDcvBHQrEyBzxXPbWtifEiuBPPWakz1UQpdQ+pVrD14T1PTvqu1
   rVI+XiZcPMVB3vIICxnobnMHYpPdptORBLhhIUPmQI1PyJtlctLnweKT/
   Lk5pQhM3NP3daMZuiQj6n4IAKifOGBoERG+ljzXu3dVeCGrkEdR9yLhfk
   kJfyCzZ8eBho8vQdxDXSPInP7FwddqgV8aLLbgO6tvhXmFa1w7LE9U0WI
   +2NlSMTA6dzGknqrLDTEp+cvGenA7MJWseEeIkhaPu3Y3A+xYMkxV+pw4
   A==;
X-CSE-ConnectionGUID: MJjS9TFnT5uv+vaIGBWl+w==
X-CSE-MsgGUID: Olw23c00R5elrIRXZlkZ/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="41944516"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="41944516"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 03:16:01 -0800
X-CSE-ConnectionGUID: 18H5tZmSQDq2z5+ii8Pwqg==
X-CSE-MsgGUID: W6Kxr6LbRhaBE6oirOjRUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="92774443"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Nov 2024 03:16:01 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBBLq-0000I5-02;
	Wed, 13 Nov 2024 11:15:58 +0000
Date: Wed, 13 Nov 2024 19:15:52 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6661/30000] kismet: WARNING: unmet
 direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by
 GKI_HIDDEN_SND_SOC_CONFIGS
Message-ID: <202411131936.ZgQVWm6e-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   069e12986fd81e33097f806c8f2787f5d5416bfd
commit: dd17237d7284a4f7a881bd3c746e299f5b4675da [6661/30000] ANDROID: gki: build-in DMA_VIRTUAL_CHANNELS
config: x86_64-kismet-CONFIG_DMA_VIRTUAL_CHANNELS-CONFIG_GKI_HIDDEN_SND_SOC_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20241113/202411131936.ZgQVWm6e-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20241113/202411131936.ZgQVWm6e-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411131936.ZgQVWm6e-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by GKI_HIDDEN_SND_SOC_CONFIGS
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
