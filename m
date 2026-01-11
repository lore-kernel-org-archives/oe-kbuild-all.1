Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 463A4150997
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 23:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768174406; cv=none; b=tjr4ds8BBiOW/mM7pW3pp8Fo1bym2k9zYJNdDyPSTM69y6kdQ5ymA4pfqTlWHw7Qw2c9SRGPn/AIXQundsaS6+ZZeiqGdrKX8cfVbdKmi1BlHv3SMwZO/jm6DLH/L090SZq4yc6xoLt+j3Evx234h/MMkcSv4v1T7XZy3h9bipc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768174406; c=relaxed/simple;
	bh=1Sw5IJlTePcCKxUVFxjzBPEfLyQmJNBf7wrpFx/w7ow=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=X6ZclME/r9ZdZdMQTgc9ig/eB3+22TxWXYgl+5MjLJRQl8eU0kAUhtFEqc4qaZqe8cr1veLW8p/fQ+t45MOLEAb5lQVo+w+Lu0PMLNlyfGev5385jJEKS/lMPRdy8PX/KfTgxk8TfwD9Fvr5/iRNZMDTh1yv4T31PzmtFpZ54b0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Abuo1x1V; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Abuo1x1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768174404; x=1799710404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1Sw5IJlTePcCKxUVFxjzBPEfLyQmJNBf7wrpFx/w7ow=;
  b=Abuo1x1VEGNqLJCDNTH16I7olzTXK2f+2wFEYHJHPW3vRqtxKsnfRl47
   TDYub8Y85L78BE0YsyxoMAIr6Y/Ec6Uf07ypMvx/YOwy3T0TKw8RdYcZK
   Y08WiD61wUXtWDlMVF7DhNpDfpHl7EnELiCExzTK2PzPTXaykICKurLWk
   Lrir3U6XWSvyh1g0LTxYzz88YA2WbMtx3aF+DRpmYg3yN4OOZoNWvOn9v
   uTTiW4j3Wm9QLiQSBXmafrqDcKEJlFQbuwKysT47R4OoXDyQCB7KH4nRB
   eCKsbPSE6XDmeqBeRfQWf0fVgULSaDdr1T0MmPJxKEx14xmnejapq//0V
   Q==;
X-CSE-ConnectionGUID: mBtmOjDEQ9OZO+viHFJ2+w==
X-CSE-MsgGUID: r8A3ZueNSj6i21f0nkQTzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="57004129"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="57004129"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 15:33:24 -0800
X-CSE-ConnectionGUID: lGR5gkyORyuqmTo5r9L5xQ==
X-CSE-MsgGUID: 9e7wO2OvQySp+kD6PrBMaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="204017707"
Received: from igk-lkp-server01.igk.intel.com (HELO 8581b2e2a62c) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 11 Jan 2026 15:33:21 -0800
Received: from kbuild by 8581b2e2a62c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf4vv-000000000Xl-0eyO;
	Sun, 11 Jan 2026 23:33:19 +0000
Date: Mon, 12 Jan 2026 00:33:07 +0100
From: kernel test robot <lkp@intel.com>
To: "Duje =?utf-8?Q?Mihanovi=C4=87"?= <duje.mihanovic@skole.hr>
Cc: Paul Gazzillo <paul@pgazz.com>,
 Necip Fazil Yildiran <fazilyildiran@gmail.com>,
 oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 LEDS_EXPRESSWIRE when selected by BACKLIGHT_KTD2801
Message-ID: <202601120036.2Xd4g2KD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c7ef209cd0f7c1a92ed61eed3e835d6e4abc66c
commit: a5554f1b5bc3be5d01f41b7550aa5b05b7c88c09 backlight: Add Kinetic KTD2801 Backlight support
date:   1 year, 10 months ago
config: hexagon-kismet-CONFIG_LEDS_EXPRESSWIRE-CONFIG_BACKLIGHT_KTD2801-0-0 (https://download.01.org/0day-ci/archive/20260112/202601120036.2Xd4g2KD-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260112/202601120036.2Xd4g2KD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120036.2Xd4g2KD-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE when selected by BACKLIGHT_KTD2801
   WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
     Depends on [n]: NEW_LEDS [=n] && GPIOLIB [=n]
     Selected by [y]:
     - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
