Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA25A15ECE7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 13:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720703014; cv=none; b=CUA1C6cFhEI//GiGuysnJdN1rxRhH5zje7HYbYI0p2RSGKYprxw2hZWB9AszNySdO5a9+67K2atSuue2ETA4gZZ3OTDEDAGVRu1nQdAJEcH9yPec579nIrRN9CxWSEPlbo6OABXzrCZdcjQpzNdxKMaBC0ZM8DgzWpYfmBNPKko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720703014; c=relaxed/simple;
	bh=mdW54hKPeINYRIPYgh5FFkfiBFIvWtRmXrBPjWfkDII=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JYfK8I4toK4YehSlyO3EM9KLUljOmVczz4zXTFKzqeRZp3wyURkfq16ua7tVXNIaO8l4u3Vu6Nj9eBIiBpkrhMPA9cqEo4uExwc2erxzvZlhAI3IG8M7V4M4Zaqmb9S8QpssRRE9ZyKRegWkus0+dY6cZ73pMha9kZYlr4uqaHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oArIx5jN; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oArIx5jN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720703013; x=1752239013;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mdW54hKPeINYRIPYgh5FFkfiBFIvWtRmXrBPjWfkDII=;
  b=oArIx5jN71JJjSbgFZgldVJaSPXU2GOr9NtOksopCJfdJB0eA8Q/GxGn
   LTMdtJnxfDcmkZ5Lk81AS7epfOl8umExIMgQCvi/Z2qWXBVyKtRTKxm+B
   oOiu33BuwSKDEPGMP8nYKG4y5A6wKVVWhC6E0rKQWeGHCmxehy+ioGSY9
   +/kB9UfmhZFDjweCqpFWyzP5cyQWwKF2RaVVlOn1LsbzGVdzlKS6RpR/z
   tSTZKLF5bdwD7qMgeP95HiZ3saSr/xp13PI9fYTfI4d35RNH1O8Q42sVZ
   PFJibtyq9i9WWNu1JlhFdYq6244wS4R0tzTeg99LYciXtRGRHKb9UL7VP
   w==;
X-CSE-ConnectionGUID: Ob5xS7Y8S9yTOWi04vQPdA==
X-CSE-MsgGUID: iMXjDYnVR+O/RQMun8GA2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="17923965"
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="17923965"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 06:02:27 -0700
X-CSE-ConnectionGUID: JJCsjd9mQASZdT56oMCl+A==
X-CSE-MsgGUID: pMKNkPXSRwyAdxXp/l/k5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,200,1716274800"; 
   d="scan'208";a="48626125"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 11 Jul 2024 06:02:25 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRtRH-000ZIP-0B;
	Thu, 11 Jul 2024 13:02:23 +0000
Date: Thu, 11 Jul 2024 21:02:07 +0800
From: kernel test robot <lkp@intel.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>
Subject: [linux-next:master 11606/12643] arm-linux-gnueabi-ld:
 arch/arm/mach-pxa/devices.o:undefined reference to `gpio_set_wake'
Message-ID: <202407112039.cyyIQ3Js-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: 917195d6f8293c35fcf9ed4bfe18f52cc1c9d2e6 [11606/12643] ARM: pxa: consolidate GPIO chip platform data
config: arm-pxa3xx_defconfig (https://download.01.org/0day-ci/archive/20240711/202407112039.cyyIQ3Js-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240711/202407112039.cyyIQ3Js-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407112039.cyyIQ3Js-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: arch/arm/mach-pxa/devices.o:(.data+0x167c): undefined reference to `gpio_set_wake'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
