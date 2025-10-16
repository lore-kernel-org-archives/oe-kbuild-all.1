Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF09111A8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Oct 2025 10:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760610357; cv=none; b=FczXN1rtN83vFsmG+SX6kWUZQM6xZe6dfdG4r+XlMvXmUcez6xNg3s+TUTNwI3QA147yDPPmIpMjyqBmdnMWFTLr9Y11DX8/iOmI4dxb1hEA1zDPhKi7oHLd9XRoWYTF40t5N+fe42u59XK9ajsVsVshrCQjAH6ChhHStFiiHlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760610357; c=relaxed/simple;
	bh=1IN8O8fdbDSuSZmD5/ZtMkg/MvQxMu4OJe6V08slP9c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XZrWqTMn8EP/GzQDbnZtfJDBBNHDN5ccx9jZ8Xg716sEmLMk8Xvti6CmxqHXJfcjVIsMUTInl+W9grhRBL6AF/6wKtPIeaizm++ufDK6fkDijgLDOOvThzCymYWZnKq8gV8XkaBYElDwWdcX0QJeucCIaHeYDDC6kikoSFxab70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J4HOr8+D; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J4HOr8+D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760610356; x=1792146356;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1IN8O8fdbDSuSZmD5/ZtMkg/MvQxMu4OJe6V08slP9c=;
  b=J4HOr8+Det3tfZ9OwglfnvYSo132+TUfi3L54buycJb/rNxmJm4gK+xz
   OGhDeIfdJrTW2OnAMvIFrAJviFCEjiswEXXjmhl2oBt7gfMpvBEJOMj4b
   DcyMbqA8gSlw5WYk/FQUWVAu5AlF4kakT5dH40nMJRDPH9Prw835YizhI
   rlyLf0O75kBIuSUDPD6Lr14+xsu+76SAjPPktdsLvXN9VQUQvx9B3ifp6
   b8gHyafyKQRiupdY8jA++RgGfGcJT6U8qsqtSOXvs+XWsI+0HaUJ8WMlY
   DekTx0OX02HjnrRIbLxbAXNY+GIIAmGNA/SGPOVW13dZKSAMnnAroelmB
   A==;
X-CSE-ConnectionGUID: YBztoaTuSou6iQVTPout4w==
X-CSE-MsgGUID: j1Gm/fVqS06Xn3q9u5iVzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62508103"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="62508103"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2025 03:25:56 -0700
X-CSE-ConnectionGUID: XreW6MDmQ36Tr02JdQW6Lg==
X-CSE-MsgGUID: GzTQj1sWTnS268tuTQRC6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
   d="scan'208";a="182891879"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 16 Oct 2025 03:25:54 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v9LAt-0004hR-22;
	Thu, 16 Oct 2025 10:25:38 +0000
Date: Thu, 16 Oct 2025 18:22:32 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/kunit-kselftests 15/26] Warning:
 kernel/umh.c:359 function parameter 'dirfd' not described in
 'call_usermodehelper_setup'
Message-ID: <202510161820.5zvCZfDF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/kunit-kselftests
head:   f55c4073139308d7f4b672c67400b0397a58a9ef
commit: 7e229a9615222a2e3e463b73f2a7b78d9c13979e [15/26] umh: add dirfd parameter
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20251016/202510161820.5zvCZfDF-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251016/202510161820.5zvCZfDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510161820.5zvCZfDF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: kernel/umh.c:359 function parameter 'dirfd' not described in 'call_usermodehelper_setup'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
