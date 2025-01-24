Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31A5D29406
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Jan 2025 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737727251; cv=none; b=MZnTZq80lt5sbkkme04ogYBbPckqQI7otRiGuG+57fnpksJiGcF1Uw3gNIIjkJlfgbCEVqVT0KMjRwFiJQmSY5JHWrVFnIbqzwDC0LLcprSTPQ+rFJDiCDgSgFzuswkvsZBBLHqsp6KlNoHiz4SDsprGkp2J39XpNZYnHPcdiJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737727251; c=relaxed/simple;
	bh=4DcF3/Rs8nzmVYHsfV0XKvZ7JXzSzbOvIkJoDeAzTLE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lXz7Cl55H9ui2OYQ0oLozcGIHQWBcByeM7MFdjUMdazRxC48yDoHynUh3XFo/c1+dNIw9EmSHpUY59J+P1lvIH8MOI2oUPbQHfonJFYuj9WSC0YWMv3WIxFGocqzwY59i15DDq3UfJFrbUfSG/Ged6qWU+OQK8RiXKKbbhW0WA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODkpVJPE; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODkpVJPE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737727250; x=1769263250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4DcF3/Rs8nzmVYHsfV0XKvZ7JXzSzbOvIkJoDeAzTLE=;
  b=ODkpVJPEhizphGAi8nLn3P2ZTdrDEPlr6WUsZzIxzugAfL15hwuluXHi
   MfisloH7DCs7n87ueSQEmIGwiPQljHI/BYQPN68D3l+/vHtXSjy2XALbK
   xqL2CfiQR1eMEaiES060u38vHur6e089swiA2cpuBahJw8Alsm8EBUSMz
   0K5iYNskZljRW0EcNoDpEPDvVyz90hSj/am623UtMe+T4xf5NphjK8L6d
   UuHjTqJLaNoiU1rxaWD83n3HmEsYqyEcN2CMgZPw01wDa8EbQP693RPx/
   UByhP7GH/4xJGzPVVPCBBxMiRXg8uHUteKJJE/ftgAFuzpi8a+Y0hAzWZ
   A==;
X-CSE-ConnectionGUID: 1p0k3VAaQBO9Tj9x11Zwcg==
X-CSE-MsgGUID: KgSi9hmbR4Ol2ETwMHEn4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="38360949"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="38360949"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2025 06:00:49 -0800
X-CSE-ConnectionGUID: gQJF3KbtTrah/hwb6FGAww==
X-CSE-MsgGUID: 1JaGieZdSVeV8z1DF1ktNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,231,1732608000"; 
   d="scan'208";a="108314752"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Jan 2025 06:00:48 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbKEn-000cjf-1v;
	Fri, 24 Jan 2025 14:00:45 +0000
Date: Fri, 24 Jan 2025 22:00:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1] kismet: WARNING: unmet direct
 dependencies detected for SND_JACK_INPUT_DEV when selected by
 GKI_HIDDEN_SND_CONFIGS
Message-ID: <202501242143.5CIrRAn1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   6c8f4d44bf2509856209eeac0dd81cdef3e5230b
commit: 1e702f432d551041753c46ec0d6d49484e776441 [1/1] ANDROID: GKI: Added missing SND configs
config: arm64-kismet-CONFIG_SND_JACK_INPUT_DEV-CONFIG_GKI_HIDDEN_SND_CONFIGS-0-0 (https://download.01.org/0day-ci/archive/20250124/202501242143.5CIrRAn1-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250124/202501242143.5CIrRAn1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501242143.5CIrRAn1-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV when selected by GKI_HIDDEN_SND_CONFIGS
   WARNING: unmet direct dependencies detected for SND_VMASTER
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y]
   
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
   
   WARNING: unmet direct dependencies detected for QCOM_RPMHPD
     Depends on [n]: QCOM_RPMH [=n] && QCOM_COMMAND_DB [=n]
     Selected by [y]:
     - GKI_QCOM_CLKS_CONFIGS [=y] && ARCH_QCOM [=y]
   
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
     Depends on [n]: SOUND [=n] && !UML && SND [=n]
     Selected by [y]:
     - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
