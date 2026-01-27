Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A9E6296BD0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Jan 2026 22:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769553764; cv=none; b=Yij8z5YLJf3v8gLluVTSp+FSrSybCpqfP3GiWZ44l169hJyKal5LgjQkEAkM08es9vB+leGnJAne0VLcd6w2i0J7c3mXrfUh0uuum/z0GskDsTxK7indZmgO0g3NqW2mKCl4TcVpC1PYPY+CTQKM7TWsXRccULYMJ4WxSyLceAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769553764; c=relaxed/simple;
	bh=WegCnwwfSGmFUDGmIHHWKiorY5XXEnGLbJKRRJMRbTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhYa7CLZqnWJQhJ2CXeIyQJ+wIVSdqczAKTJ296X0VHFF5aty/0RLoy2fUDUP6e2h8Wh6Z9VCrwUj0d5cM6gUbEgLK3J4CTBrFOw/Z+1PgE0264FLNGGCuOiJ2Ybyo0fDe64kNTKQ+hUKo8Wz+FxvkQdc0emkVRgAPgkJk0rt+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HO5PmLVK; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HO5PmLVK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769553763; x=1801089763;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WegCnwwfSGmFUDGmIHHWKiorY5XXEnGLbJKRRJMRbTE=;
  b=HO5PmLVKcJ6V5VBF9HTrvmsFITCGbhXHwV5HLpQIiinieVj8AW1qkeGB
   5TwNob5bHbH6U4/wxaIT70gN0adLbWqPzqmeObL/kiO5IjvUZieZgUjci
   1cZiD+DB8FYIniaXy3X0H93Jf2EFWAMrOMuAMEWBs84UKFcbbFVMatogq
   3zIYfn5Kjl/vg89ffrveYm4t2z04ygjUFU0zw+AtQJK0LIKxIqYtUaISN
   jTuqicVig+CADVzVViwoJ1uhs1uKD1jZrfDdkllgygKapg9L090R2306F
   BYb7cKuP/Nyp7pgsyLbZfejLrx+9Lfb8HHl7kwRxDtK9RqaF/xRhfFb+6
   w==;
X-CSE-ConnectionGUID: nYJYuPmfRgK6jgacDyfIPg==
X-CSE-MsgGUID: L01P84ZvRQ+ewDyJckFNvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="81072688"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="81072688"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 14:42:42 -0800
X-CSE-ConnectionGUID: kKcIGy8jRWWrDFK1YjcHLw==
X-CSE-MsgGUID: 9u1eQUZ9QuKhf53PbOOTMw==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 27 Jan 2026 14:42:40 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkrle-000000001wr-02Yr;
	Tue, 27 Jan 2026 22:42:38 +0000
Date: Tue, 27 Jan 2026 23:42:36 +0100
From: kernel test robot <lkp@intel.com>
To: Romain Gantois <romain.gantois@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>,
	oe-kbuild-all@lists.linux.dev,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Romain Gantois <romain.gantois@bootlin.com>
Subject: Re: [PATCH 2/2] misc: ti_fpc202: Support special-purpose GPIO lines
 with LED features
Message-ID: <202601272312.EmjoBjHO-lkp@intel.com>
References: <20260127-fpc202-leds-v1-2-ebd0cfb9f9a1@bootlin.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-fpc202-leds-v1-2-ebd0cfb9f9a1@bootlin.com>

Hi Romain,

kernel test robot noticed the following build warnings:

[auto build test WARNING on a8a6d9b4da001a84dd715d92f034d2bf777199c8]

url:    https://github.com/intel-lab-lkp/linux/commits/Romain-Gantois/dt-bindings-misc-Describe-FPC202-LED-features/20260127-215935
base:   a8a6d9b4da001a84dd715d92f034d2bf777199c8
patch link:    https://lore.kernel.org/r/20260127-fpc202-leds-v1-2-ebd0cfb9f9a1%40bootlin.com
patch subject: [PATCH 2/2] misc: ti_fpc202: Support special-purpose GPIO lines with LED features
config: parisc-kismet-CONFIG_LEDS_TRIGGERS-CONFIG_CHASSIS_LCD_LED-0-0 (https://download.01.org/0day-ci/archive/20260127/202601272312.EmjoBjHO-lkp@intel.com/config)
reproduce: (https://download.01.org/0day-ci/archive/20260127/202601272312.EmjoBjHO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601272312.EmjoBjHO-lkp@intel.com/

kismet warnings: (new ones prefixed by >>)
>> kismet: WARNING: unmet direct dependencies detected for LEDS_TRIGGERS when selected by CHASSIS_LCD_LED
   WARNING: unmet direct dependencies detected for LEDS_CLASS
     Depends on [n]: NEW_LEDS [=n]
     Selected by [y]:
     - TI_FPC202 [=y] && I2C [=y]
   
   WARNING: unmet direct dependencies detected for LEDS_TRIGGERS
     Depends on [n]: NEW_LEDS [=n] && LEDS_CLASS [=y]
     Selected by [y]:
     - CHASSIS_LCD_LED [=y] && LEDS_CLASS [=y]=y [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
