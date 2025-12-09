Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B01B640
	for <oe-kbuild-all@lists.linux.dev>; Tue,  9 Dec 2025 20:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765312395; cv=none; b=hIPkm4+l9a3yDDv+XIW9/ZytDe8QSLGHnOCn0yHx0z+4WgEkOBnhiGEhrVZ7pG2a9WaPKPbS6Md8tiVoptyauZrd195m5sWGXbLvZ13YI7iez2PREe4icc17DDUxS5nTfwnVRgoJ+bcbmOcq1/D6OsuHK4YpMNRscYpA2fzeXF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765312395; c=relaxed/simple;
	bh=lqw+bet0v1kyJYpO5/mzcHGq/C2GnGjgV85q7slhyEg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dBmCJYY8awLPltEuoNpSxHOPSZMLkNhx7WhkfOc8etZe9RA+mEYVpgRENSPz4zjvgRONIAzAGmV5dSHKaIgq7E0tibkPt5wuX3PljzXtp4b5I4TffElMMdC4cqtALyEyqMGA5HtU20tRZ7b7hhDsSC0PQkTk09T136cQBxTFHt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=girr27jF; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="girr27jF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765312394; x=1796848394;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lqw+bet0v1kyJYpO5/mzcHGq/C2GnGjgV85q7slhyEg=;
  b=girr27jFHn4ettg/1h6/thnQ5yJ26fyCbTHzJJgPJkcmDJz/EhRLabbf
   QNXDqmY2xEMwu7rcYGSRoB4KkIzm0qkQbCEINojn23UqwB+IVxI6mxV8Q
   RCTdCa36qymwtxkEfmtJD1iACggIWWKLxQyRSuzsi8sCFGw3Vs83yscFR
   j134OzYzAq2PJh0UJiA0hySEAIxZBn515DE7hgTeZZN8u5rk/orpqWosz
   RXAHLssTxzt4IJruQRnYqOYKoly7XS57HS54MW+c2AJDJbN5mPiuRuYOa
   8342l7z1sjX1CcK2gdzJ2ErvjmFDdqd7KYgTdxWgK93GkT52btRq3TBHQ
   A==;
X-CSE-ConnectionGUID: mDB3yDpQS3y8+nPzv1GBmw==
X-CSE-MsgGUID: W4yAcpGJTcKhflQD0aRYkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11637"; a="54823483"
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="54823483"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2025 12:33:13 -0800
X-CSE-ConnectionGUID: Dc8kbcc9R2uCpv4BCpwMWA==
X-CSE-MsgGUID: xyjpeaY0STmNjFeUGkdIwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,262,1758610800"; 
   d="scan'208";a="195921658"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 09 Dec 2025 12:33:11 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vT4OT-000000000Mt-2DKd;
	Tue, 09 Dec 2025 20:33:09 +0000
Date: Tue, 9 Dec 2025 21:32:33 +0100
From: kernel test robot <lkp@intel.com>
To: Duje =?utf-8?Q?Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Daniel Thompson <daniel.thompson@linaro.org>
Subject: kismet: WARNING: unmet direct dependencies detected for
 LEDS_EXPRESSWIRE when selected by BACKLIGHT_KTD2801
Message-ID: <202512092103.1VaXbm2Y-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cb015814f8b6eebcbb8e46e111d108892c5e6821
commit: a5554f1b5bc3be5d01f41b7550aa5b05b7c88c09 backlight: Add Kinetic KTD2801 Backlight support
date:   1 year, 9 months ago
config: um-kismet-CONFIG_LEDS_EXPRESSWIRE-CONFIG_BACKLIGHT_KTD2801-0-0 (https://download.01.org/0day-ci/archive/20251209/202512092103.1VaXbm2Y-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20251209/202512092103.1VaXbm2Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512092103.1VaXbm2Y-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE when selected by BACKLIGHT_KTD2801
   WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
     Depends on [n]: NEW_LEDS [=n] && GPIOLIB [=y]
     Selected by [y]:
     - BACKLIGHT_KTD2801 [=y] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
