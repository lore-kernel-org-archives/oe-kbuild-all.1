Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD7E3F20ED
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Jun 2026 11:28:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782473290; cv=none; b=Y+UN7o/qGAQYJPV4bcwRC4rPGqRgmHkeKS+YhgydKtGf6tqczgoQBgnTOkhuu8DsXi2y7cYKIMOFy6KVQkFSlnJI+qL/fvBNBI8Gz1j+AY7K6xjJPBgFw1pyW9VKGJjRAd2C5s2m8i6ox2VL5v8eGB0ilHjXSXPDJFBq0r2z+8M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782473290; c=relaxed/simple;
	bh=KCvcFxUmeG7T5qwyxsz2SBZ2tsEV4PlGLxuL+Qwy4uA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lyjI+T16DAx5/LkYNowsho/2W4hAPyfSW3PIVZJx3ZbSUYmJ+7TARPQpPoH1i4bMVvCZJp9jO+tu3Ll05gE0QDX77axLyLAa94iIHt2H2YqgjReRUXgkWtW3sjYDU6+asUqxlCva+ZP4E+/rnaHIHJpkO8kpzl36e6EDh1a/9aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oAWguNSn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oAWguNSn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782473288; x=1814009288;
  h=date:from:to:cc:subject:message-id;
  bh=KCvcFxUmeG7T5qwyxsz2SBZ2tsEV4PlGLxuL+Qwy4uA=;
  b=oAWguNSnjiKFygZCeKcXD8PWB5mUFLT9ZZoYNJ1ti8V74bSZDU0NBj+y
   yZwB5L1nxcOD9WoyARr0Hfylj9J5Nee2hVyQE+MNEMD02/5wpqChzOtgK
   HxFMufB+p0l6ZMJFWZ1b/RQfja0pL9281R1hemvgpuWAgHfPpxjllEJ13
   RA/k2zkoqjx1a+auZF435d7Ony9ZrUDMX2lJ02oiqPgiO1Wdmqb0s/SpY
   e65iUwYCjAbZCwqqYNiAjaws7FCpF+ui5FOMztPOMFkr54aopw9E9eOYs
   /TjXhPnVP1Wbrhdkry2RJ0fcqiRo4ZyVGLoO7VhYrDR4YkvY16y6tDr8z
   w==;
X-CSE-ConnectionGUID: u9yLY3+JShCP9fxISTU41Q==
X-CSE-MsgGUID: 8R9+NXOgRaCsQtJS1T861Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11828"; a="100695726"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="100695726"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 04:28:07 -0700
X-CSE-ConnectionGUID: MWwG1mNPTrWYPAbGeDKOnA==
X-CSE-MsgGUID: om73jc5rS1SHNaYt8sqaXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="253215229"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 26 Jun 2026 04:28:06 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wd4iu-0000000052P-1qCA;
	Fri, 26 Jun 2026 11:27:55 +0000
Date: Fri, 26 Jun 2026 19:27:46 +0800
From: kernel test robot <lkp@intel.com>
To: Rong Xu <xur@google.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>
Subject: error: out of range PC16 fixup
Message-ID: <202606261924.nQqv8BJ2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4edcdefd4083ae04b1a5656f4be6cd83ae919ef4
commit: e88b2fe8b9993c9cae856019b1c31c14b63cad7a kconfig: Remove the architecture specific config for AutoFDO
date:   3 weeks ago
config: mips-randconfig-r064-20260626 (https://download.01.org/0day-ci/archive/20260626/202606261924.nQqv8BJ2-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 6cc609bb250b21b47fc7d394b4019101e9983597)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260626/202606261924.nQqv8BJ2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: e88b2fe8b999 ("kconfig: Remove the architecture specific config for AutoFDO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606261924.nQqv8BJ2-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: out of range PC16 fixup
   1 error generated.

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
