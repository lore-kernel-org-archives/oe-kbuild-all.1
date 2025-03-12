Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 482E342A82
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Mar 2025 07:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741763633; cv=none; b=RYdfva1r+Ep3mtdfZmmU+iqRl02Uy2b+HGkn21WruuZgoKhYJM03dyLXOdarov1iIdVesVnrQF+ndLOsjdAo9rR8gmY/qoz0vaJveeosNs+1MeOoP0CIF7xKQMLnwLZmeczZVaTbK7uerOgntOh/gYYSwhKaPNyUPh2gV3qOVgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741763633; c=relaxed/simple;
	bh=TLdaIxPQQYE88NS7LE8/Qww/f4VM2YCJVTLThSP2ZmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WCoyL1d4jtOBoHb3DT0BgAgONgT++fdqIlDiLBgJmSr9zmwt4prT7s8reiv8Stvd2p3IDDcRKJdvYOLCThFQn5gZzwlkatSef7foTXpOg+jK0H3PpHqkKqrXIgxvGXM1XhOxEqLzZpDIfSEhR+sVq/XiWU/lIW7d3BoiAQmIscc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjDFdruN; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjDFdruN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741763631; x=1773299631;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TLdaIxPQQYE88NS7LE8/Qww/f4VM2YCJVTLThSP2ZmY=;
  b=hjDFdruNzY3hGZM6BSGpqVTuiKSA5hDynzQo++RoeyK4FJMDtkVpzTyA
   dfRpfdJ2VwCv5M9Km/hwhFpRqUZG+iQ86X5U/O40DzX3FmQQg0SaPAEPI
   Oyq36aNywako9YLgUVXSx+NEjADC7+MYRfavg+XKuMNlN789dhHQO1pEH
   ZVbS9zZ1GHV1R95nHKRbMFm45FPWjgh+dv/M4qe1mc1vZsUd6LzCp9ZVc
   clThKgfP8EHuYWeLid9zmzUwTig7wvEGbu0joUuJhHKAMARu4SfugCgLg
   5iGalgrb/PbeOXO/Jr/3PzFJqmScEUTgSQQtB6ALPZACkn7XQiWE+nUjk
   g==;
X-CSE-ConnectionGUID: HqvmvyrET12iuNoGkXgp/A==
X-CSE-MsgGUID: 3HdB7UYdQxyqYPJzIgW9Hg==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="42961972"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="42961972"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 00:13:51 -0700
X-CSE-ConnectionGUID: uAVnCtooQCqZFXttDZWLeQ==
X-CSE-MsgGUID: G0eZP4fSRmeGi+wC6j1Z9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; 
   d="scan'208";a="143751007"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2025 00:13:49 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsGHj-0008DI-19;
	Wed, 12 Mar 2025 07:13:47 +0000
Date: Wed, 12 Mar 2025 15:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 6/6] kismet: WARNING: unmet direct
 dependencies detected for DMA_VIRTUAL_CHANNELS when selected by
 GKI_HIDDEN_SND_SOC_CONFIGS
Message-ID: <202503121517.oca7GHRB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   196e23be873afbb2901b85db8be99549a8cbd0f4
commit: dd17237d7284a4f7a881bd3c746e299f5b4675da [6/6] ANDROID: gki: build-in DMA_VIRTUAL_CHANNELS
config: arm-kismet-CONFIG_DMA_VIRTUAL_CHANNELS-CONFIG_GKI_HIDDEN_SND_SOC_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250312/202503121517.oca7GHRB-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250312/202503121517.oca7GHRB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503121517.oca7GHRB-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS when selected by GKI_HIDDEN_SND_SOC_CONFIGS
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   
   WARNING: unmet direct dependencies detected for DRM_TTM
     Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && MMU [=n]
     Selected by [y]:
     - GKI_HIDDEN_DRM_CONFIGS [=y] && HAS_IOMEM [=y] && DRM [=y]
   
   WARNING: unmet direct dependencies detected for DMA_VIRTUAL_CHANNELS
     Depends on [n]: DMADEVICES [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_SOC_CONFIGS [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
