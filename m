Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B95F2D610
	for <oe-kbuild-all@lists.linux.dev>; Mon, 19 Feb 2024 14:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708352057; cv=none; b=jSEj0JVXDDCvRZXCE1ujYVePHtNsvNKbB6QlwLTztrn+EhQVt7z+QvOxdk3JrvjZu0l9UmBanWUZlT+3kHpmzjeo+D9oDpSZMDDcjbzQMfD04r5ZMA3v61wDK0Ob+JBM+jY141ulURUg53wO8IhwJE0L50QksyuYnsXOQ4ws9+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708352057; c=relaxed/simple;
	bh=guzKTakUGZJFO/4L8Zggdhvk7ME5nkYdGpTs20xO6G4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FUFJQRqf5HBZRvoDwAKjGhiHjXXPw9wv1h6MoNc7pzCrW9KqZy4ODcQXVv7vuRIe+S/BROuGIBrAs5Zp6Lw1uPm5UOCGY3SvWAjtnVTatsWF/fD/K5vYv1loIYR3JUaGCHAEzhUbwK7S2DFuDW5tlAmmOYpeDGeoolcxn9I3820=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WakXdZR1; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WakXdZR1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708352055; x=1739888055;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=guzKTakUGZJFO/4L8Zggdhvk7ME5nkYdGpTs20xO6G4=;
  b=WakXdZR1LqVDsu9Gl7rcvNVBuizRnFgiKskvfgGZDClvMzGIfrVgibbT
   tehUACO5p9sHEsbmcbmXbGOKgArr6Lb52UuV/Mok18AUo3j9EOt98IARp
   TWiGCmfwoog+AmeTZ7bKPj5/dp0f1KNyDiGRbDkc88WjIBBnZvL2kzSam
   I+1O9X4PjxNpa1FS+Y5tt81F3DwO76WzhNRltZBQshlmU/i7wMG1dYGS+
   FZWx0dFyqgcP02lXj/RFKR9xyPVVKnQ7cFvo1gxX4nIW7L0PF/gAQmUyT
   X0EzD3SqMkhS+4h8v2pV+CMJOL4QQ6wK/ooDfJk3CpRx9nopyC+vYWdpY
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="2296821"
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="2296821"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 06:14:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,170,1705392000"; 
   d="scan'208";a="9089023"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 19 Feb 2024 06:14:14 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rc4PL-0003pm-2l;
	Mon, 19 Feb 2024 14:14:11 +0000
Date: Mon, 19 Feb 2024 22:11:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-pie-for-sev-v5 10/16] arch/x86/kernel/head_64.o: warning:
 objtool: .noinstr.text+0x2c2: unreachable instruction
Message-ID: <202402192251.bTmdlh8A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-pie-for-sev-v5
head:   60443126b4602860255b0841a62a3f7791452457
commit: e8c932e224a14d0e589cc08024b9340d7081550a [10/16] x86/startup_64: Simplify virtual switch on primary boot
config: x86_64-randconfig-003-20240219 (https://download.01.org/0day-ci/archive/20240219/202402192251.bTmdlh8A-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240219/202402192251.bTmdlh8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402192251.bTmdlh8A-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/head_64.o: warning: objtool: .noinstr.text+0x2c2: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
