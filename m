Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AA2819C54B
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Jun 2025 08:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749026430; cv=none; b=I4wkt8ccr+H59aJGPzyNpHg9l2i49xv9tHBs5DeYOGRuQx2nAqMKYVBW9FyLmTn/WhYyQnKPWFZHPBSZM/HYEezk6EARz4vyQagqVq4Ekjt/Xte2z8/qiaebw5Sj5ZM6amsH4zyKmPi4OkGiJwG1s00JWFr6nb3GTEbhU7RgMzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749026430; c=relaxed/simple;
	bh=NHKIPyEaUitsfg3AYCpS1mHs3viY7nXDxynPhZrTwRo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BUnu0cltwxON4DKvQunR/Ntpl+Kze5JAwWOA1ldMzxSLR8GZNbHeX4PE5AwhKNOx+2prDJ2RYYPl7HA4WiNBLs5nEUX55zKZcpSgRTm+y29KnF8EoskoQQqjoN4HgOlHnE0dwOg6KtE7EmZkUqEfF5/D6w2Rzfqjp258D7psS7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N7LyoE/q; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N7LyoE/q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749026429; x=1780562429;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NHKIPyEaUitsfg3AYCpS1mHs3viY7nXDxynPhZrTwRo=;
  b=N7LyoE/qffwnO+cucMHLB/kzNFlYClL1DEMa2Lok41xO1zLvcBaMrfZj
   hPv0T2vw2+HpPARJua2iaMpDndNdZhZcQsiNWPvmT3ax3jC4CkFnz86sK
   /g9ccLaXgyzWWmzmG/M4t9ICa2PwDXDf3alCJDvene6Dkrz6LABuaD1N3
   KpGKuWkig39PsvLvMH5gwcN8pDGUXC9QlXUKGwZb+f+GdB+9l5zGDnVlJ
   5tRxsxRDs/gIUJNtpJMkbHpkT48Kf+LmdonYy5cT3xuSDb/8KxnoZVYsz
   5jcOyGJLzoBOeDKtRB3hX4fa0gHn/NxSEMCSicoP97foCU/4bsEuPngxu
   Q==;
X-CSE-ConnectionGUID: j6mvZkMiQ66DaB0rDMwdCQ==
X-CSE-MsgGUID: snQJyAPwRHKmlonEr9fy6A==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="51168692"
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="51168692"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 01:40:28 -0700
X-CSE-ConnectionGUID: uqN5wJ+PRsmnV9O+IQBAdw==
X-CSE-MsgGUID: f9mXH6ZXSMSOIbU8GPvgOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,208,1744095600"; 
   d="scan'208";a="150401773"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jun 2025 01:40:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uMjfd-0002zR-21;
	Wed, 04 Jun 2025 08:40:25 +0000
Date: Wed, 4 Jun 2025 16:39:35 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/vdso-ptp 34/35] timekeeping.c:undefined
 reference to `update_vsyscall_aux'
Message-ID: <202506041615.ziY930EF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/vdso-ptp
head:   ac543b3745ca8bb8a5e860d52ecbb272fc5607e6
commit: 50335cb2ba9c55319375e3db7020b79989e50a82 [34/35] vdso: Add support for auxiliary clocks
config: sparc-allmodconfig (https://download.01.org/0day-ci/archive/20250604/202506041615.ziY930EF-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250604/202506041615.ziY930EF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506041615.ziY930EF-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: kernel/time/timekeeping.o: in function `timekeeping_update_from_shadow':
>> timekeeping.c:(.text+0x10d0): undefined reference to `update_vsyscall_aux'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
