Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9E52E36E0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Jul 2025 02:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752891504; cv=none; b=m1K4fImK9qIFq4VMF2TQYrnU6jgbHrLkMYOZXOJNXI9QZJUqU47zaBAcMmF9rz/IdWR5YCzNkTeSGcZvN2DWzGw2YnvHDTw3LVLSo2lB4z8+ifn7YRze68dMEP/xgt9a2XgX5UkjN5OLEnZOlDTKBdDuZWN3YRFRofuZYvsI0eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752891504; c=relaxed/simple;
	bh=v9bIwQcsB1VvuQxFOVqJyhhsUQ48SCNjR05iKjBnE0Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkyZYl4NQIkXzyF319HvyoRvBg4xRYNbS0Y0iRVNmRumSni5u5BfeT2LL+xCXN8HjQSGiRYUL8HNS5YuPTfmQyZRVnIrXLqZ5Ra7AcMKdtzBRsMgUmYAi0/w6JV6UULcYUWmaLRd3CoY71dgjkczcV3R3UJR9yLOdVMjkVl0elg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LaA7Dk8Q; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LaA7Dk8Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752891503; x=1784427503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v9bIwQcsB1VvuQxFOVqJyhhsUQ48SCNjR05iKjBnE0Y=;
  b=LaA7Dk8QybFon1y/yhKiyjZ2eSba/65KYiZ0ERbUWvIeIJOtjlTiT3Bu
   b3oh7HguVVALO6n11VHUWDsi/2RqKavalFSiK52kfuIn8khdVWjgIDBA2
   sL2i8viv+PkDtPtuQVpdQF2KNXPmyNVuKC/LE9NAvs5BumUTVAXUYQWUF
   RpR2cYQdNLqtSk4CrigMTCKnGFd9W0deMt72mEye+hgePpZvz/kaqVl0O
   Y5l0sdT5/hbR2cnA2qgBiM2zkAkQFgyAnuGR/+h14GVnW7epP7PiVeQlb
   p/0Huq2GDBuANOTPMt5sdtJpg84Oak+sy5XHxyz38zKUpKapDAOZSPLnF
   Q==;
X-CSE-ConnectionGUID: A9RqnGk7TKGnbsHfdUYsNw==
X-CSE-MsgGUID: e4zeTGUDRYe5rNfsfh65wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11496"; a="58851477"
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="58851477"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2025 19:18:23 -0700
X-CSE-ConnectionGUID: g8QnR6hZSsech616V63T1Q==
X-CSE-MsgGUID: fwu4dNylQ5qDEEHgtOzVsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,323,1744095600"; 
   d="scan'208";a="162920317"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Jul 2025 19:18:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucx9X-000FC3-13;
	Sat, 19 Jul 2025 02:18:19 +0000
Date: Sat, 19 Jul 2025 10:18:05 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.4 1/1] kismet: WARNING: unmet direct
 dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
Message-ID: <202507191012.1SNMWSYJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   0e19b105776d91ea3d68c2e767bfd4a3fd6fde48
commit: c3e816a56786096a2f1521a3445a5f6b056af6f9 [1/1] ANDROID: Incremental fs: Add zstd compression support
config: i386-kismet-CONFIG_CRYPTO_ZSTD-CONFIG_INCREMENTAL_FS-0-0 (https://download.01.org/0day-ci/archive/20250719/202507191012.1SNMWSYJ-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250719/202507191012.1SNMWSYJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507191012.1SNMWSYJ-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for CRYPTO_ZSTD when selected by INCREMENTAL_FS
   WARNING: unmet direct dependencies detected for CRYPTO_ZSTD
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
   WARNING: unmet direct dependencies detected for CRYPTO_SHA256
     Depends on [n]: CRYPTO [=n]
     Selected by [y]:
     - INCREMENTAL_FS [=y] && BLOCK [=y]
   
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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
