Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74D71E529
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Sep 2024 14:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726151528; cv=none; b=ispIhjRPKPtarKfN9sGtvOCf5ND3IvTpzJRxUmDco4YpfL0DTy4i/iSCGM0rvCIxYlRdvhWchlMfpgsZEBx6/ZXRxAv/1UrM8y7+X8xtHKu8NpHsyNyNEL5zPotYGQ4fjFctAuJ4pewRsgiuCCzr0BE34Yo390yXWXFhVmVsuK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726151528; c=relaxed/simple;
	bh=qo2x0UlR+UWXWCrJ6n3X4DMlzVWuDaJkEX2llhg0wcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rmVXcyiSU0KueUYaOeEjOSteN3vZOYhw64iPTgqnk4+VgLfNAfDY7HDQuHEPWhosYGOjplsZDVf0jCyAwVtQvYc/kCuQ4e8zegugYTShF/CC28F2LUVWb7+AqKR64iMXlno62pwWbevZW+s1oUs2cuTPOPVY4fSLiwByyS2PDoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VnBy6T/B; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VnBy6T/B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726151526; x=1757687526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qo2x0UlR+UWXWCrJ6n3X4DMlzVWuDaJkEX2llhg0wcg=;
  b=VnBy6T/B5KlSormvuudy9Xm4F4y2n+Z5OmbEG6WwwEP7Cl6AHwxnU4jJ
   L9N4rJQFZkbyuNfSJ+74CpOy6WFkKV46ecKSGBuBY6RXseE14neHqFg6q
   j+yroN3Cmdtv42Wo4Yyux/3Dsq2LKIJufP+E0B6HxPq9EzqRJiaOXpChx
   fhBhqWjQsD3ZOZ/gm1+9s+Hw0rrYb/7ef3320p6CmU/ZQDHMeya2YMT4v
   7z6VLTknweAmcCWKVNsCBs9etjrTlmx+f6MszUQFfgI0z0By90H8C2w0q
   pNNcC1/wJaUQv+fNE+15qA8GxSjzXpDhSRdeqbpYAaI8FiUj85RKwHZvp
   g==;
X-CSE-ConnectionGUID: GcTYKOkiSW+Z973GlAUjKw==
X-CSE-MsgGUID: MYF5oIYgQwquxcPBSTSUJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11193"; a="28786943"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="28786943"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2024 07:32:04 -0700
X-CSE-ConnectionGUID: eQZTEfReRXqdI02awbV48Q==
X-CSE-MsgGUID: SDC3Zr7sRtuHNsnj7YmtHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="68504274"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Sep 2024 07:32:02 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sokrY-0005HU-1I;
	Thu, 12 Sep 2024 14:32:00 +0000
Date: Thu, 12 Sep 2024 22:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-4.19-stable 4933/30000] aarch64-linux-gcc:
 error: unrecognized command-line option '-mllvm'
Message-ID: <202409122255.VfpV46Pg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andrey,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-4.19-stable
head:   1b3964c5e070d088ca4c9591cbadd91a22e438ea
commit: 2d4373a48297e4cd2ef2d194ad3beba41195c4ed [4933/30000] UPSTREAM: kasan, arm64: select HAVE_ARCH_KASAN_SW_TAGS
config: arm64-randconfig-001-20240912 (https://download.01.org/0day-ci/archive/20240912/202409122255.VfpV46Pg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240912/202409122255.VfpV46Pg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409122255.VfpV46Pg-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-gcc: error: unrecognized command-line option '-mllvm'
>> aarch64-linux-gcc: error: unrecognized command-line option '-mllvm'
   make[2]: *** [./Kbuild:21: kernel/bounds.s] Error 1 shuffle=3086756856
   make[2]: Target '__build' not remade because of errors.
   make[1]: *** [Makefile:1167: prepare0] Error 2 shuffle=3086756856
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:146: sub-make] Error 2 shuffle=3086756856
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
