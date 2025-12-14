Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9989115624B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 02:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765677703; cv=none; b=Lx7M+WXvUM0GcW97pm2tWiBrNfISSMwsIsMehXBvu0z1+qWuGVLSJwSGyG88FCLzIyDIeGSg+LqW93tcEI9hMpYHvh4BuEH6ZOMsIji1Wur7xsPx7aDfuja2Jggcolu67W70Gbb6dzLdnUfx4yv2bgivtTaZux8Q4OmCQs8QEIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765677703; c=relaxed/simple;
	bh=wURaac3PhhXCFR9WbS9wre3uyFsotvR2khzrrG3rbnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DqvUNgSW39HqOywcFmXpaDnlUNW+nFSDq36la4wI+hwX9Ohir2nZa2sHktLQewIXPazWNs4SRNqVwtMm2YxITdWoyzzrr+2DwURU9IXPOVrM/h4O5lNhYBzccqketJq0uTPUcBj9G5hFiKdRQgGS99YgKJx9sRC1P6RizUAVSm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bknwleA+; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bknwleA+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765677701; x=1797213701;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wURaac3PhhXCFR9WbS9wre3uyFsotvR2khzrrG3rbnA=;
  b=bknwleA+QOL1IvDhna61/PeGlWDqhv9hZZ3ku25Z5kbogJlOcxe+iL2K
   qApVzmkES+Z/sKFkRArQ4fAQ6sT3VtkaDf2va0+bcUngPW82RWxn+Kf0z
   PNgTjJsOipE9DnQKDMHLzKS5QTkAVaSGj6pUkLXMVcR7dj7Kp9zLmKflq
   r722goG3kxAtpJYGpbv8nph8I/dzWkq89ecJz1pjwYAZEVE/MK/IAHrUf
   MgVQ+5mwypO3ZYxvNYiFUr9spfjc/vGmN89xciYaBg9+866bJb0fwptBb
   QC5h5e/s93aK6lyFs3rAyTK7WqUIEEyELCrHlZiafRjll8Ol4/i9w0fcT
   w==;
X-CSE-ConnectionGUID: ipXDQr+fQd+HwHRwG8zfEg==
X-CSE-MsgGUID: dZ4dmm3RRVqTXcoW3XOBRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71256946"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="71256946"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 18:01:41 -0800
X-CSE-ConnectionGUID: t9exGciVTCOVZ9sWdlLJ1g==
X-CSE-MsgGUID: jP2eIDzcSWycglhVfZpOzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201610375"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Dec 2025 18:01:38 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUbQW-000000008SP-2WxE;
	Sun, 14 Dec 2025 02:01:36 +0000
Date: Sun, 14 Dec 2025 10:00:58 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, simona@ffwll.ch, airlied@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 2/2] vt: Remove con_debug_enter/_leave from struct consw
Message-ID: <202512140916.Z01yXO9Q-lkp@intel.com>
References: <20251208102851.40894-3-tzimmermann@suse.de>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251208102851.40894-3-tzimmermann@suse.de>

Hi Thomas,

kernel test robot noticed the following build errors:

[auto build test ERROR on tty/tty-testing]
[also build test ERROR on tty/tty-next tty/tty-linus linus/master v6.18 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Thomas-Zimmermann/vt-Remove-trailing-whitespace/20251208-183541
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/tty.git tty-testing
patch link:    https://lore.kernel.org/r/20251208102851.40894-3-tzimmermann%40suse.de
patch subject: [PATCH 2/2] vt: Remove con_debug_enter/_leave from struct consw
config: arm-randconfig-r072-20251213 (https://download.01.org/0day-ci/archive/20251214/202512140916.Z01yXO9Q-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251214/202512140916.Z01yXO9Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512140916.Z01yXO9Q-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/core/fbcon.c:3176:3: error: field designator 'con_debug_enter' does not refer to any field in type 'const struct consw'
           .con_debug_enter        = fbcon_debug_enter,
            ^
>> drivers/video/fbdev/core/fbcon.c:3177:3: error: field designator 'con_debug_leave' does not refer to any field in type 'const struct consw'
           .con_debug_leave        = fbcon_debug_leave,
            ^
   2 errors generated.


vim +3176 drivers/video/fbdev/core/fbcon.c

fe2d70d6f6ff038 drivers/video/fbdev/core/fbcon.c Simona Vetter  2019-05-28  3154  
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3155  /*
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3156   *  The console `switch' structure for the frame buffer based console
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3157   */
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3158  
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3159  static const struct consw fb_con = {
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3160  	.owner			= THIS_MODULE,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3161  	.con_startup 		= fbcon_startup,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3162  	.con_init 		= fbcon_init,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3163  	.con_deinit 		= fbcon_deinit,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3164  	.con_clear 		= fbcon_clear,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3165  	.con_putcs 		= fbcon_putcs,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3166  	.con_cursor 		= fbcon_cursor,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3167  	.con_scroll 		= fbcon_scroll,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3168  	.con_switch 		= fbcon_switch,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3169  	.con_blank 		= fbcon_blank,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3170  	.con_font_set 		= fbcon_set_font,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3171  	.con_font_get 		= fbcon_get_font,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3172  	.con_font_default	= fbcon_set_def_font,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3173  	.con_set_palette 	= fbcon_set_palette,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3174  	.con_invert_region 	= fbcon_invert_region,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3175  	.con_resize             = fbcon_resize,
d219adc1228a388 drivers/video/console/fbcon.c    Jesse Barnes   2010-08-02 @3176  	.con_debug_enter	= fbcon_debug_enter,
d219adc1228a388 drivers/video/console/fbcon.c    Jesse Barnes   2010-08-02 @3177  	.con_debug_leave	= fbcon_debug_leave,
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3178  };
^1da177e4c3f415 drivers/video/console/fbcon.c    Linus Torvalds 2005-04-16  3179  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
