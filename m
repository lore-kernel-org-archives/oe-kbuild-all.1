Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B768939B975
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Mar 2026 12:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836464; cv=none; b=kQ+UIE4w9qttQ7hhCo1bvnlztisyjOsBkMQaJYkbBrKS3PZIvR+JnGSV9DG100ZmsvVCz0+ry4I8KLxuk/8EbY4iwVl2B3hw2Krsiin8KwffEPIWkDihtSx1W0412kwT52QsilZPlb81yJE6Y2Sn7XCr5Ko4fxWMiZWQLZvebwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836464; c=relaxed/simple;
	bh=lS8IzyBxTNBCKUfAn3HWWo0WX1vaqaj9oqrfdCX1/D0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=daS2DE4TuLcNszBIY/olaBsS/0E8nePbrUMNzRHymwUBja0JrVr6Bs5Z/bC280QikyJanlYJYSAGcHBAKGK73wBGkZqSIqm+kP2Vipdyg9ScWsUxXukA4bJrCK4OLaAswNNpvJSnipYP49veMbXqjYFZ6rOwevpk61nbEhwfDno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G0046AU4; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G0046AU4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773836457; x=1805372457;
  h=date:from:to:cc:subject:message-id;
  bh=lS8IzyBxTNBCKUfAn3HWWo0WX1vaqaj9oqrfdCX1/D0=;
  b=G0046AU4EcQf/ePBC5yFcdCQZWzoamEWSKR52rAoOkKlXGBCocSCXMaO
   B+6lVcZG3+zbh9Igh43r/KTK0QKbPO3AVAymf1gR7sDFgFwH5s7zWVhbu
   7be6cmuR+YT/OdzemWTAxiuPmQoTVyVnPRAExDygS19jWv40+ykz0YmED
   fTjkcrw9YNvVGXvsRQH77VJygaTbH5HwjdbPi4yMXF72CXVAGyw2nvhUN
   PY3ZhzURXk34df80rd0xlf4+hgJC1qLN3p/Hkm1/WZbAuAOZWBym38tjp
   5+3Ycclt2sN1GLYCe47SoiolUH1ElJx1QO6bzqFV28KJRpsz6yHrgr+L9
   g==;
X-CSE-ConnectionGUID: 9jhZyVqsT+Kqw19X81HoPg==
X-CSE-MsgGUID: 1v2mPTHJTl2MWT7eQgmKpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="75067877"
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="75067877"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 05:20:57 -0700
X-CSE-ConnectionGUID: zkZD9+HATdGn/QoQtb6JdQ==
X-CSE-MsgGUID: mD+yRCmHRQ2NsYb1mxOCBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,127,1770624000"; 
   d="scan'208";a="245635890"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 18 Mar 2026 05:20:55 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2ptM-000000002tN-0rVK;
	Wed, 18 Mar 2026 12:20:52 +0000
Date: Wed, 18 Mar 2026 20:20:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2] Warning:
 drivers/virt/gunyah/rsc_mgr.c:158 struct member 'adev' not described in
 'gunyah_rm'
Message-ID: <202603182040.kQuSn0K7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b0e662fb17ec139a265b282999e920fe1f021414
commit: 96f4587757641b28c77ef6a22d7303cabd726864 [2/2] ANDROID: virt: gunyah: Add RM info struct as alternative to devicetree
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260318/202603182040.kQuSn0K7-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260318/202603182040.kQuSn0K7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603182040.kQuSn0K7-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/virt/gunyah/rsc_mgr.c:158 struct member 'adev' not described in 'gunyah_rm'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
