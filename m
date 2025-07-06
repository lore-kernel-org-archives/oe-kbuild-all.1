Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8F031E51EF
	for <oe-kbuild-all@lists.linux.dev>; Sun,  6 Jul 2025 22:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751840093; cv=none; b=dOgAgkjIiMsMO+zoc48Ni7JK45WisPTiURWivp3+ckZhGu69ybxvdxz2f7FxDt08TX9n63CPK0dY8psaSGoecWR6L6f/k7dxRtPfbAyCMcW5efgjnVL6tGYrcDyHq/f0Kebd0pbqhTZJy6l/oPPpicRWVAEulnKhkk4X6A2IcnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751840093; c=relaxed/simple;
	bh=dyThFhp271Q8JlfwOJzm/CEwFhHWw7ilVzK+C95jhq8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D0WGpD0BoS1ctey3pOnGcw0AkEJdwu2+MUT0G06GJIlLRogPeKwlnLahezEcQmdgpC9xnU3u1neFmjJRGK7rwb242yV3gYnYyd5KCKiJ3HCh5rSj6r8XQ3/X+32uOcadXuI294kfQzzFG9mZuLaX1JcKhBgsZBxiq7eKaPkudVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XO/ymKxA; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XO/ymKxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751840091; x=1783376091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dyThFhp271Q8JlfwOJzm/CEwFhHWw7ilVzK+C95jhq8=;
  b=XO/ymKxAwBsZX7AKGcZ1Llm9BEbWOXhiRA1yvKo6CQe5Al7PJNWQzF6r
   L+gFlVkjjTSHDT33oLuk6tsglFKvN37fvu5dQd4XmI2ZPUvUfstylMgVa
   xwRvahs5AfRzPHKyBjT0QFu+lhmBnDKUlukC1RLC7W6cumhlt941AS+YH
   kfwyzTPRwklKa44Az6ZQCm0sAL9q855ij6StXJXncgYW6I/MNOrr0n6e2
   /gI2dgjvlDyOQqWmMxuKygo/aW4nBofED2pmGmu6iMIpA52P6BSDoNRYo
   cd1abijXr/amfsNSz6FQBCh1OCAp9Ak+ssARxjbrcBROenr8tDDuXPO4W
   w==;
X-CSE-ConnectionGUID: yJJppImXTQOGBn6butfWEw==
X-CSE-MsgGUID: sY5i8+jRTqGr2Ky0qbj/BA==
X-IronPort-AV: E=McAfee;i="6800,10657,11486"; a="64750145"
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="64750145"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2025 15:14:51 -0700
X-CSE-ConnectionGUID: 6BiJAg2YSxCGKtAlJ70U/A==
X-CSE-MsgGUID: TbAxkGWVQ+qviyqbSF93yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,292,1744095600"; 
   d="scan'208";a="186075692"
Received: from lkp-server01.sh.intel.com (HELO def1aeed4587) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Jul 2025 15:14:50 -0700
Received: from kbuild by def1aeed4587 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uYXdH-00001F-2u;
	Sun, 06 Jul 2025 22:14:47 +0000
Date: Mon, 7 Jul 2025 06:13:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 0/1] aspeed_wdt.c:undefined
 reference to `__udivdi3'
Message-ID: <202507070336.hoWKuyAI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   6da4371380fb119ad2fbf1fc1fdc635e037cbf2f
commit: 1e0398a349e85cc1a23bafcf005c9a351251267f [0/1] watchdog: aspeed: Update bootstatus handling
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20250707/202507070336.hoWKuyAI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250707/202507070336.hoWKuyAI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507070336.hoWKuyAI-lkp@intel.com/

Note: the android-common/android16-6.12-lts HEAD 6da4371380fb119ad2fbf1fc1fdc635e037cbf2f builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   ld: drivers/watchdog/aspeed_wdt.o: in function `aspeed_wdt_update_bootstatus':
>> aspeed_wdt.c:(.text+0x390): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
