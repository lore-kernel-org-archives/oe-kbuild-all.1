Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B6312356C7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Aug 2025 17:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756575458; cv=none; b=DZxZf0GtyfrW94Gpi9M5PcQufTA8w25T+GtGDqSUwZqxjBdaXaN1gAlzTwkPzvujAu7+M8rc8ssSD1toXWEKaejK2WFJgHz5Xk984SfobiYBpLXKE6m/fk+iM7s5cbkb7Welgef1e0v1sPaIBUCASGNbHU/tTGzm0ptFD8QKvKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756575458; c=relaxed/simple;
	bh=8mnXTNdhIA1oqz5j046/lA6njgihmQ4JBkAae2jmttY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hdY+cyBcztPOY6er9/iwNCsUuLmKHnjLYtf3HO1QrRuyQKnDz7zU9kFwPoQF1fnM2ZEMdOIbu3wMN8IwycnuIaDaA5AjV+3OJQpkq+EDDccSKDv9emqTQgCxRKdU8s1VGInSvXiAdqIAmq+K9eNt/Ruff/J3SZDHqhiRb+GhYj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i7HiM6+/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i7HiM6+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756575458; x=1788111458;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8mnXTNdhIA1oqz5j046/lA6njgihmQ4JBkAae2jmttY=;
  b=i7HiM6+/+bYSeasdPvpkiUhyq/FqzroyeSacIq+cHO0TN4/7GVnOsDwD
   ATtkrZvApr82w9Kv1buvt/qnXZ3imRHgmm+PlWirPOgbuvfBv96wQO0Ef
   Oynzh8ntVWoRCgXCnY1rB9rxnCkXJp1Cg4ZHyFcOS6o4t3U9LouS/zr7H
   6vQIkCeEGkHUcP5qxclEge5BxBmy/fNoBWwerVsoAf7rMTOn3AydAnEqz
   cTeioio3SHqyRgAjtXAgAC0hEu2s9I6kPT7SNrDA0d/+8QaIuwiUjBZn6
   2c3wl2nxrNOpV84x+wjhHw8HwMZzaKb9AzHLxLFX5Xm1027dKjhaSkw39
   w==;
X-CSE-ConnectionGUID: BNF33odcSFukbTgVIPPZXQ==
X-CSE-MsgGUID: 9TrBqT9QTqunPIc72jDABA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58906165"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58906165"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 10:37:37 -0700
X-CSE-ConnectionGUID: cwMA4uTtSpuv2An9PJMICA==
X-CSE-MsgGUID: hXfdm5O0RT6ATl90HBq7jw==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 30 Aug 2025 10:37:35 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usPW8-000Vab-2f;
	Sat, 30 Aug 2025 17:37:32 +0000
Date: Sun, 31 Aug 2025 01:37:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sebastian Reichel <sre@kernel.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev
Subject: [sre-misc:thinkpad-t14s-x1e 19/19] kismet: WARNING: unmet direct
 dependencies detected for INPUT_SPARSEKMAP when selected by
 EC_LENOVO_THINKPAD_T14S
Message-ID: <202508310135.utfQPknU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sre/linux-misc.git thinkpad-t14s-x1e
head:   0e21f1dbce44bad4bb05c2541344ff3fb9643230
commit: 0e21f1dbce44bad4bb05c2541344ff3fb9643230 [19/19] arm64: dts: qcom: x1e80100-t14s: add EC
config: arc-kismet-CONFIG_INPUT_SPARSEKMAP-CONFIG_EC_LENOVO_THINKPAD_T14S-0-0 (https://download.01.org/0day-ci/archive/20250831/202508310135.utfQPknU-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20250831/202508310135.utfQPknU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508310135.utfQPknU-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for INPUT_SPARSEKMAP when selected by EC_LENOVO_THINKPAD_T14S
   WARNING: unmet direct dependencies detected for INPUT_SPARSEKMAP
     Depends on [n]: INPUT [=n]
     Selected by [y]:
     - EC_LENOVO_THINKPAD_T14S [=y] && ARM64_PLATFORM_DEVICES [=y] && (ARCH_QCOM || COMPILE_TEST [=y]) && I2C [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
