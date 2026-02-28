Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD15830274D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Feb 2026 04:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772251778; cv=none; b=degC0qIJg+mcOEhQtuN1O3SwdhIqK/qBE1W22KHMLyL+Xebl8yFltm9GJzcdshKJzV1JjEyglRh8nSizp0e8aNlnMrZCGF7nl2sP17D5fwH40OLJN7XvcOLhZQ7c0ezohrqXHxnIhjoTtbAmFI5W2KDOH4A/ymQhXZl1pRl2h+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772251778; c=relaxed/simple;
	bh=5bf3GmbpxE2XLk3+yCscEY+QR1t/EONTiDRQOvBk/U0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mG/n63BmAeC1PZwA44ShN8LZw2hh2p0Ie4VDI+Na68FfbTL5wdj6HZlVpqNmfiD/DlVGB7GoOJhTw7sdwuMcRPGCQkiLA9fGAdFD0CvpoD4Qg1RmOOSDrYcuaTZFAyaOqiB0RLJH26z96zbKCBzAgeIPavBk+DJkQXiWAtaQOhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JkgXmZd0; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JkgXmZd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772251776; x=1803787776;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5bf3GmbpxE2XLk3+yCscEY+QR1t/EONTiDRQOvBk/U0=;
  b=JkgXmZd0nhAgq/dD6jk52zBYfk9EDu1l0c3QdclkQS+oau0FC+fEjqp7
   Eb9jjerRbbRxC9vNy0D174D0TIF5Ccr5654qvg93bht8xiMPmLYDu7/de
   uH+sNh8Ffy4FlR3bdGJ08NRoc7Xp2sRFREAwVpQ9Ks1IHCuZetHr0r7CK
   1OIrK6XitaDbKBY7Q529B0at7vQWmvv/1m+G9TaIMWV/WSJfXAw1ikxXH
   olUNjoKpO45ClYmaG092u1rOm0rJRj8BE2AQv9uLfInb4QsYFV7MA2/1y
   ujgZ6nf+Ijw0dIg27Nx5wtbVttvKnhJ7TeHlmMkewYyT88subPYbHUFzo
   w==;
X-CSE-ConnectionGUID: Q/C8irkOR2WSLroinqcNsA==
X-CSE-MsgGUID: PU2zsUi4QR+u0Y4ITHnEsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84420843"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="84420843"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 20:09:36 -0800
X-CSE-ConnectionGUID: 5QRql65XTEe678n8WkC8kQ==
X-CSE-MsgGUID: ieLMY0qiTyWOMW9A31Dmmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="220290739"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Feb 2026 20:09:35 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vwBe1-00000000BJ1-14KE;
	Sat, 28 Feb 2026 04:09:33 +0000
Date: Sat, 28 Feb 2026 12:08:59 +0800
From: kernel test robot <lkp@intel.com>
To: Chen Jun <chenjun102@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] fbcon: Fix out-of-bounds memory in fbcon_putcs
Message-ID: <202602281237.VJhwHzj8-lkp@intel.com>
References: <20260227144358.101173-1-chenjun102@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227144358.101173-1-chenjun102@huawei.com>

Hi Chen,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on drm-misc/drm-misc-next]
[also build test ERROR on linus/master v7.0-rc1 next-20260227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chen-Jun/fbcon-Fix-out-of-bounds-memory-in-fbcon_putcs/20260227-225307
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260227144358.101173-1-chenjun102%40huawei.com
patch subject: [RFC PATCH] fbcon: Fix out-of-bounds memory in fbcon_putcs
config: hexagon-randconfig-r071-20260228 (https://download.01.org/0day-ci/archive/20260228/202602281237.VJhwHzj8-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
smatch version: v0.5.0-8994-gd50c5a4c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260228/202602281237.VJhwHzj8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602281237.VJhwHzj8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fbcon_rotate_font
   >>> referenced by fbcon.c
   >>>               drivers/video/fbdev/core/fbcon.o:(fbcon_do_set_font) in archive vmlinux.a
   >>> referenced by fbcon.c
   >>>               drivers/video/fbdev/core/fbcon.o:(fbcon_do_set_font) in archive vmlinux.a

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
