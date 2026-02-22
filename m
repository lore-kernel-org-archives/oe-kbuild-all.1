Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DD4D1F936
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 15:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771772662; cv=none; b=ImQb1NJFEOGBynXdshKZOx/Qq776L4NOFgqeUddLGL9kbMFevL2a5BWrwke88ZfyRQvYnTiE+SlxfLd4Mew28wje+Oe2VmKwIC+rsdTmN8uPADONWhmEFWgE1TIuNf3vyI6bzmKuZZOYdFX1eXdCT7yBUKm9VTzQraUEbhGj7Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771772662; c=relaxed/simple;
	bh=p2HzsGrBB9l3h87LwYGr5/OAscQlTx9GIacVIt3o1Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MP3VNL7TppueCXFL8ycBEpREN0O7Rdmz6+J1UQA5zr0nn8vMQlnB0PhmWJj8ywGHODe6CKyx/N+/PeJ/sUfNZB7/2JdvCxT31vTivhgE6/Ig7y7fglOuBc6YX3VBXMj7gszHbmHZ117WkXwgGBy7Q3kupN84hXXsyiE+UsFtAZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kfRcgXq1; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kfRcgXq1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771772660; x=1803308660;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=p2HzsGrBB9l3h87LwYGr5/OAscQlTx9GIacVIt3o1Hk=;
  b=kfRcgXq1qv/vQfQq4qJ92HY4maXuosB4KiS9tTEOvW4hf5XLBRHbubgs
   iPuU6uDxSRmm3+Kq7SCh2FEdfU7NiRIdiyU9j4lAAo/eonOQQ+qmObTVN
   UY34rcm4fuWWPhW/7QemQdaL9SjSDKL+mS0AQ5Px5ePAEvNt111OEAMbw
   BgCGC8XOqSfz7174OKyto4VtD+7CHPm2JoFbsdVGkPCpFiiFx3oh5Iaig
   A/leW3GgxkuxJzf9TYX62lR4Xa4JWlnmBFFFgCyueWEDsFIrqNVr3ykYc
   mNGuLnV6YtY2JnFenbAyIoScIAH1tyhkgNjL1O5w5YuYWVvA/Zwv6FLTg
   w==;
X-CSE-ConnectionGUID: r7WXUrVSQ32f2FKYoWN3Qg==
X-CSE-MsgGUID: DOhSmzJvS6ycusj+o9lo8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="72693176"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="72693176"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 07:04:15 -0800
X-CSE-ConnectionGUID: vUNSq+e5To6U3/WaNjd9rg==
X-CSE-MsgGUID: +d3QC6MFSwqUd0pNV7xbgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="243587804"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 22 Feb 2026 07:04:12 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuB0F-000000004fp-1CnZ;
	Sun, 22 Feb 2026 15:04:11 +0000
Date: Sun, 22 Feb 2026 16:03:30 +0100
From: kernel test robot <lkp@intel.com>
To: Pavel Nikulin <pavel@noa-labs.com>, Helge Deller <deller@gmx.de>,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, Pavel Nikulin <pavel@noa-labs.com>
Subject: Re: [PATCH v3] Fonts: Adding all Terminus fronts from 12 to 32 in
 bold, and normal versions
Message-ID: <202602221658.VeY8kBpG-lkp@intel.com>
References: <20260222125007.32407-1-pavel@noa-labs.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222125007.32407-1-pavel@noa-labs.com>

Hi Pavel,

kernel test robot noticed the following build errors:

[auto build test ERROR on 32a92f8c89326985e05dce8b22d3f0aa07a3e1bd]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavel-Nikulin/Fonts-Adding-all-Terminus-fronts-from-12-to-32-in-bold-and-normal-versions/20260222-205557
base:   32a92f8c89326985e05dce8b22d3f0aa07a3e1bd
patch link:    https://lore.kernel.org/r/20260222125007.32407-1-pavel%40noa-labs.com
patch subject: [PATCH v3] Fonts: Adding all Terminus fronts from 12 to 32 in bold, and normal versions
config: x86_64-rhel-9.4-ltp (attached as .config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221658.VeY8kBpG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221658.VeY8kBpG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/fonts/Kconfig:115: syntax error
   lib/fonts/Kconfig:115: invalid statement
   lib/fonts/Kconfig:156: syntax error
   lib/fonts/Kconfig:156: invalid statement
   lib/fonts/Kconfig:157: invalid statement
   lib/fonts/Kconfig:165: syntax error
   lib/fonts/Kconfig:165: invalid statement
   lib/fonts/Kconfig:249: syntax error
   lib/fonts/Kconfig:249: invalid statement
   lib/fonts/Kconfig:250:warning: multi-line strings not supported
   lib/fonts/Kconfig:250: unknown statement "This"
   lib/fonts/Kconfig:251:warning: ignoring unsupported character '.'
   lib/fonts/Kconfig:251: unknown statement "It"
   lib/fonts/Kconfig:252:warning: ignoring unsupported character ','
   lib/fonts/Kconfig:252:warning: ignoring unsupported character ','
   lib/fonts/Kconfig:252:warning: ignoring unsupported character '.'
   lib/fonts/Kconfig:252: unknown statement "If"
   lib/fonts/Kconfig:256: syntax error
   lib/fonts/Kconfig:256: invalid statement
   lib/fonts/Kconfig:257: invalid statement
   lib/fonts/Kconfig:258: invalid statement
   lib/fonts/Kconfig:259: invalid statement
   lib/fonts/Kconfig:260:warning: ignoring unsupported character ','
   lib/fonts/Kconfig:260:warning: ignoring unsupported character ','
   lib/fonts/Kconfig:260: unknown statement "Terminus"
   lib/fonts/Kconfig:261:warning: ignoring unsupported character '.'
   lib/fonts/Kconfig:261: unknown statement "for"
   lib/fonts/Kconfig:281: syntax error
   lib/fonts/Kconfig:281: invalid statement
   lib/fonts/Kconfig:282: invalid statement
   lib/fonts/Kconfig:283: invalid statement
   lib/fonts/Kconfig:284: invalid statement
   lib/fonts/Kconfig:285: invalid statement
   lib/fonts/Kconfig:286: invalid statement
   lib/fonts/Kconfig:287: invalid statement
   lib/fonts/Kconfig:288: invalid statement
   lib/fonts/Kconfig:289: invalid statement
   lib/fonts/Kconfig:290: invalid statement
   lib/fonts/Kconfig:291: invalid statement
   lib/fonts/Kconfig:292: invalid statement
   lib/fonts/Kconfig:293: invalid statement
   lib/fonts/Kconfig:294: invalid statement
   lib/fonts/Kconfig:295: invalid statement
   lib/fonts/Kconfig:296: invalid statement
   lib/fonts/Kconfig:297: invalid statement
   lib/fonts/Kconfig:298: invalid statement
   lib/fonts/Kconfig:299: invalid statement
   lib/fonts/Kconfig:300: invalid statement
   lib/fonts/Kconfig:301: invalid statement
   lib/fonts/Kconfig:302: invalid statement
   lib/fonts/Kconfig:303: invalid statement
   make[3]: *** [scripts/kconfig/Makefile:85: oldconfig] Error 1
   make[2]: *** [Makefile:746: oldconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'oldconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'oldconfig' not remade because of errors.
--
>> lib/fonts/Kconfig:115: syntax error
   lib/fonts/Kconfig:115: invalid statement
   lib/fonts/Kconfig:156: syntax error
   lib/fonts/Kconfig:156: invalid statement
   lib/fonts/Kconfig:157: invalid statement
   lib/fonts/Kconfig:165: syntax error
   lib/fonts/Kconfig:165: invalid statement
   lib/fonts/Kconfig:249: syntax error
   lib/fonts/Kconfig:249: invalid statement
   lib/fonts/Kconfig:250:warning: multi-line strings not supported
   lib/fonts/Kconfig:250: unknown statement "This"
   lib/fonts/Kconfig:251:warning: ignoring unsupported character '.'
   lib/fonts/Kconfig:251: unknown statement "It"
   lib/fonts/Kconfig:252:warning: ignoring unsupported character ','
   lib/fonts/Kconfig:252:warning: ignoring unsupported character ','
   lib/fonts/Kconfig:252:warning: ignoring unsupported character '.'
   lib/fonts/Kconfig:252: unknown statement "If"
   lib/fonts/Kconfig:256: syntax error
   lib/fonts/Kconfig:256: invalid statement
   lib/fonts/Kconfig:257: invalid statement
   lib/fonts/Kconfig:258: invalid statement
   lib/fonts/Kconfig:259: invalid statement
   lib/fonts/Kconfig:260:warning: ignoring unsupported character ','
   lib/fonts/Kconfig:260:warning: ignoring unsupported character ','
   lib/fonts/Kconfig:260: unknown statement "Terminus"
   lib/fonts/Kconfig:261:warning: ignoring unsupported character '.'
   lib/fonts/Kconfig:261: unknown statement "for"
   lib/fonts/Kconfig:281: syntax error
   lib/fonts/Kconfig:281: invalid statement
   lib/fonts/Kconfig:282: invalid statement
   lib/fonts/Kconfig:283: invalid statement
   lib/fonts/Kconfig:284: invalid statement
   lib/fonts/Kconfig:285: invalid statement
   lib/fonts/Kconfig:286: invalid statement
   lib/fonts/Kconfig:287: invalid statement
   lib/fonts/Kconfig:288: invalid statement
   lib/fonts/Kconfig:289: invalid statement
   lib/fonts/Kconfig:290: invalid statement
   lib/fonts/Kconfig:291: invalid statement
   lib/fonts/Kconfig:292: invalid statement
   lib/fonts/Kconfig:293: invalid statement
   lib/fonts/Kconfig:294: invalid statement
   lib/fonts/Kconfig:295: invalid statement
   lib/fonts/Kconfig:296: invalid statement
   lib/fonts/Kconfig:297: invalid statement
   lib/fonts/Kconfig:298: invalid statement
   lib/fonts/Kconfig:299: invalid statement
   lib/fonts/Kconfig:300: invalid statement
   lib/fonts/Kconfig:301: invalid statement
   lib/fonts/Kconfig:302: invalid statement
   lib/fonts/Kconfig:303: invalid statement
   make[3]: *** [scripts/kconfig/Makefile:85: olddefconfig] Error 1
   make[2]: *** [Makefile:746: olddefconfig] Error 2
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'olddefconfig' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'olddefconfig' not remade because of errors.


vim +115 lib/fonts/Kconfig

    10	
    11	config FONTS
    12		bool "Select compiled-in fonts"
    13		depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC || DRM_CLIENT_LOG
    14		help
    15		  Say Y here if you would like to use fonts other than the default
    16		  your frame buffer console usually use.
    17	
    18		  Note that the answer to this question won't directly affect the
    19		  kernel: saying N will just cause the configurator to skip all
    20		  the questions about foreign fonts.
    21	
    22		  If unsure, say N (the default choices are safe).
    23	
    24	config FONT_8x8
    25		bool "VGA 8x8 font" if FONTS
    26		depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC
    27		default y if !SPARC && !FONTS
    28		help
    29		  This is the "high resolution" font for the VGA frame buffer (the one
    30		  provided by the text console 80x50 (and higher) modes).
    31	
    32		  Note that this is a poor quality font. The VGA 8x16 font is quite a
    33		  lot more readable.
    34	
    35		  Given the resolution provided by the frame buffer device, answer N
    36		  here is safe.
    37	
    38	config FONT_8x16
    39		bool "VGA 8x16 font" if FONTS
    40		default y if !SPARC && !FONTS
    41		help
    42		  This is the "high resolution" font for the VGA frame buffer (the one
    43		  provided by the VGA text console 80x25 mode.
    44	
    45		  If unsure, say Y.
    46	
    47	config FONT_6x11
    48		bool "Mac console 6x11 font (not supported by all drivers)" if FONTS
    49		depends on FRAMEBUFFER_CONSOLE || STI_CONSOLE || DRM_PANIC
    50		default y if !SPARC && !FONTS && MAC
    51		help
    52		  Small console font with Macintosh-style high-half glyphs.  Some Mac
    53		  framebuffer drivers don't support this one at all.
    54	
    55	config FONT_7x14
    56		bool "console 7x14 font (not supported by all drivers)" if FONTS
    57		depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
    58		help
    59		  Console font with characters just a bit smaller than the default.
    60		  If the standard 8x16 font is a little too big for you, say Y.
    61		  Otherwise, say N.
    62	
    63	config FONT_PEARL_8x8
    64		bool "Pearl (old m68k) console 8x8 font" if FONTS
    65		depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
    66		default y if !SPARC && !FONTS && AMIGA
    67		help
    68		  Small console font with PC-style control-character and high-half
    69		  glyphs.
    70	
    71	config FONT_ACORN_8x8
    72		bool "Acorn console 8x8 font" if FONTS
    73		depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
    74		default y if !SPARC && !FONTS && ARM && ARCH_ACORN
    75		help
    76		  Small console font with PC-style control characters and high-half
    77		  glyphs.
    78	
    79	config FONT_MINI_4x6
    80		bool "Mini 4x6 font"
    81		depends on !SPARC && FONTS
    82	
    83	config FONT_6x10
    84		bool "Medium-size 6x10 font"
    85		depends on !SPARC && FONTS
    86		help
    87		  Medium-size console font. Suitable for framebuffer consoles on
    88		  embedded devices with a 320x240 screen, to get a reasonable number
    89		  of characters (53x24) that are still at a readable size.
    90	
    91	config FONT_10x18
    92		bool "console 10x18 font (not supported by all drivers)" if FONTS
    93		depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
    94		help
    95		  This is a high resolution console font for machines with very
    96		  big letters. It fits between the sun 12x22 and the normal 8x16 font.
    97		  If other fonts are too big or too small for you, say Y, otherwise say N.
    98	
    99	config FONT_SUN8x16
   100		bool "Sparc console 8x16 font"
   101		depends on (FRAMEBUFFER_CONSOLE && (FONTS || SPARC)) || \
   102			   BOOTX_TEXT || EARLYFB
   103		help
   104		  This is the high resolution console font for Sun machines. Say Y.
   105	
   106	config FONT_SUN12x22
   107		bool "Sparc console 12x22 font (not supported by all drivers)"
   108		depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
   109		depends on !SPARC && FONTS
   110		help
   111		  This is the high resolution console font for Sun machines with very
   112		  big letters (like the letters used in the SPARC PROM). If the
   113		  standard font is unreadable for you, say Y, otherwise say N.
   114	
 > 115	<<<<<<< HEAD
   116	config FONT_TER6x12
   117		bool "Terminus 6x12 font (not supported by all drivers)"
   118		depends on FRAMEBUFFER_CONSOLE || DRM_PANIC
   119		depends on !SPARC && FONTS || SPARC
   120		help
   121		  Terminus Font is a clean, fixed width bitmap font, designed
   122		  for long (8 and more hours per day) work with computers.
   123	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
