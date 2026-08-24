Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8409D2F6565
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Aug 2026 08:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787558518; cv=none; b=g0MMVYLfuo5KcTEYDli6q+UWCV3dVnDW4vM3gtYqtAhDNgrubAd0ynOSTcI4KTS6DhfKAp6a4nNlrt+eIzXmp/NiF/kfhTHReAFCGd/+QcDY/FL43Yl7VeR7HWt2g/ctNEVBSbokhY36yjUQKW4N9HQYyey+08fMBBAqpLFDDvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787558518; c=relaxed/simple;
	bh=qS93RPkZy9CBTOyjgugVHhnBQLVS/V65SxBs3llZ0c0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Yf4ExC3G+L/boUc8qTxZPyYdg1LjCKK/kiJVbrngrV/yzwXzTNAEa8YX93ISv7xytcax/3JoB+7j4UHwYLkZfbC/7Dg/K9HdPpZpxAQvCfQNhBAkvUV8QJIWnxIjjhWXORSoQzQxiYXH2gOvGRovLfJNiLlaV9heeqNWrVSA4l0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RCklw2QY; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RCklw2QY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787558516; x=1819094516;
  h=date:from:to:cc:subject:message-id;
  bh=qS93RPkZy9CBTOyjgugVHhnBQLVS/V65SxBs3llZ0c0=;
  b=RCklw2QYk9FpFDn7gmXmL3ne6AfmAUY2Sbf1Lps2vHnBmKy9AJv7rw0R
   D6k8BwVG4uATHuIvIRrkM+ao+97REuqwvzdu1ETKd18p4QfVQl/3D0hn9
   vHayCTV8fqwDGUJuxnsli5N+3K+pKsupMRYp38mikvMvdGwFu+qaGbacg
   9TuGZZF2f61B9OvpvUMxKcgA40Hd5imQzri06XGRqR4GtYBueEenQXT1I
   nQsZ73c3Tv1F4/1eBz+tO8eqk/LsuQTeW0PnvwmmYMzoNLP49fRBhS6YU
   OKxI/ySJTVWzSBhh6xfg0NPykhGMbhEwHv7nthtRpg388HnncxILxeqFi
   w==;
X-CSE-ConnectionGUID: v9OHa3WlRoCBUX7iRV3xBQ==
X-CSE-MsgGUID: HjPydxcrSsOk86liZrqCkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="88017382"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="88017382"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 01:01:56 -0700
X-CSE-ConnectionGUID: k+Zj55MKTy6wVptBUzkh2A==
X-CSE-MsgGUID: wW5KfnwaTAKJ6Dx2s9zHvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="290456899"
Received: from igk-lkp-server01.igk.intel.com (HELO b49262788783) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 24 Aug 2026 01:01:54 -0700
Received: from kbuild by b49262788783 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyPct-000000000Ip-367d;
	Mon, 24 Aug 2026 08:01:51 +0000
Date: Mon, 24 Aug 2026 10:01:35 +0200
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/090-spi-hid 12/19] Warning:
 drivers/hid/hid-magicmouse.c:616 expecting prototype for struct vendor.
 Prototype was for struct tp_header instead
Message-ID: <202608240906.bVlUmH48-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux bits/090-spi-hid
head:   682d68b1e8c669b225978e4b02d2f81999107221
commit: 19226c43f548ebd9e4256bcb1505715de884102e [12/19] HID: magicmouse: Add MTP multi-touch device support
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260824/202608240906.bVlUmH48-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608240906.bVlUmH48-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608240906.bVlUmH48-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/hid/hid-magicmouse.c:616 expecting prototype for struct vendor. Prototype was for struct tp_header instead
--
>> Warning: drivers/hid/hid-magicmouse.c:631 expecting prototype for struct standard. Prototype was for struct tp_mouse_report instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
