Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7B636655D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 07:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779260868; cv=none; b=i7ntDOJzA5oeFJgrPxV6pKt8Nfgnj96adgfgHRSK94M2UcC+iiniw2ts0tHK8vcfYT36BZm5u8KV/tcmhcG6tHkF8VwcbIfIqi3dalaqANkJ0taIRE1sX7SIDZn4bB1GFaW3U7sdAQsk6Fy+Hiil+8eUBDBMYL3G0NwTGF1xgwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779260868; c=relaxed/simple;
	bh=e2gw+qXpQ5I267qUfOtC+V2JuZ+SEJ3GuLgKVmYcxh0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bMbH5hnUqdHmpKKoMy0OghkH+vqcB0XNrsoG1N/0DVDEZ1BSDJJc8A8qSXlMYtGsiey0RrBDORoxuEQODx9WeFUZe0xxZVO1EVehCbFtMM4DRx/J85+mRp3M2bk8zNiJdazq21RKqKfVqsuuWikr1Ywr22snZOH9KLHzKTcUk4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OuWgylSj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OuWgylSj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779260866; x=1810796866;
  h=date:from:to:cc:subject:message-id;
  bh=e2gw+qXpQ5I267qUfOtC+V2JuZ+SEJ3GuLgKVmYcxh0=;
  b=OuWgylSjkiQSynYQMoXKxdVXl+U+TZc34abH9caYvXlSJQyUZ5qiryz+
   qneF2OLogRxYyk946gZ8zeLNFf4472MkixwmxiZeCAQw7eV4t+hSb7SBb
   r0eAC29gxR6qR9j2meDdJmNAPA53/QwVZrJqaK22saJXom4DPxixAGstk
   KMo9+ciMnUBy79dglW5tV1OxN4KMVhx3CZH6ci++3JPJtzfc6a1uv3wdq
   7oVJgueMGqEwjnpbMirTbRoDyH2UCLkAjK/xT1lcwjq72R+FUgaIWJ0Sb
   e5kw4rCfpZLwZebRd3HNZ2jtVWg8upRgkkMKHeb0XJbdX/t/HT3yQRZxg
   Q==;
X-CSE-ConnectionGUID: k1xT1OPxRbu/hxSL6WDlYA==
X-CSE-MsgGUID: rgjVV9biQheMzDaebaIIFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="79876736"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="79876736"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 00:07:45 -0700
X-CSE-ConnectionGUID: WU+ZDksERMuqstrGRiYQOQ==
X-CSE-MsgGUID: dxNUsqvPTA6iIKPSva7cpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263567529"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 20 May 2026 00:07:44 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPb1p-000000002hR-1S7p;
	Wed, 20 May 2026 07:07:41 +0000
Date: Wed, 20 May 2026 15:06:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jack Allister <jalliste@amazon.com>
Cc: oe-kbuild-all@lists.linux.dev, David Woodhouse <dwmw@amazon.co.uk>,
 Paul Durrant <paul@xen.org>
Subject: [dwmw2:kvmclock5 3/33] usr/include/asm/pvclock-abi.h:5:
 include of <linux/types.h> is preferred over <asm/types.h>
Message-ID: <202605201418.j1tq6jR0-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   git://git.infradead.org/users/dwmw2/linux kvmclock5
head:   40a616f7a0699f14c21881de07b02ccf85a887a4
commit: e0806885ce9debb4a790a6beb72cbfd25716015d [3/33] UAPI: x86: Move pvclock-abi to UAPI for x86 platforms
config: x86_64-buildonly-randconfig-006-20260520 (https://download.01.org/0day-ci/archive/20260520/202605201418.j1tq6jR0-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605201418.j1tq6jR0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605201418.j1tq6jR0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> usr/include/asm/pvclock-abi.h:5: include of <linux/types.h> is preferred over <asm/types.h>

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
