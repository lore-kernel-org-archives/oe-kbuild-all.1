Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 197292D8375
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Dec 2025 19:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765222444; cv=none; b=PHHuGxzV3PeLvmhOM2nrSzEBb3V9lRgTPmxLg7GC1CB8SUZxBxv35tEygbWUFf8NLa+vYmyW7n47L50dahKd+ABQwNSfwUWBMBE1OVo3gYhujM3CoKiBxmOx1MDcyMmKf0dZey5/5AyyyTtdLDB2GID3OCPOZcHox4oq2YrVlok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765222444; c=relaxed/simple;
	bh=8qTHzy9A2/DnpF5tKycJDu/Itl4CuCHmba0gotsl0ds=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JpM42gUThlnFeSv3I7RoGMhDMToDzjorje+SBBSKyzHNB+VLvSVd1p1xxu+Wd5lO64p9T/Pmsm8dCDJERO3SFZ1pYZkMomOxNWSwWVQl2fSkrr8OjUxwaCTH1ANbGj1XUEBQT9S531DyCJlGU/34+UevdEQ/xoppY6DVkjmmkzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a1ZPhUfO; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a1ZPhUfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765222443; x=1796758443;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8qTHzy9A2/DnpF5tKycJDu/Itl4CuCHmba0gotsl0ds=;
  b=a1ZPhUfOysYeb4CP9gfbN6IR2hBq1TarTWXgrwgphl/msFu83bve7Mk+
   BSv07NsdEiZfqEUUgryuIStugCs+TPB72kyh0oKGH5c1X3rH3pVbwoE2c
   Mmtj63iLCLgBO+HekEglZ7f8Q+QD5qFQvWTS2TBi94UQamKENhxiP8acl
   egaBc76C26ISrqjvTSzfQAOvWMrbC3tPw0DKRUcSDmvPcsg3npW/s8bhn
   pIOtMS3hst9zH3ecb9vpPadCWJ0t+J26w5WU+HYawLL4ZQBqDxN1T9bDL
   XZrOhe+pVb4VGdIX3H83oDJJPlkd7cwCqAFrksk8UyUIaeVEo9Y0AdSbI
   A==;
X-CSE-ConnectionGUID: Y1VIYtqEQzWAuDYhx7XXTw==
X-CSE-MsgGUID: NSllXmsSQQG4Qtig8BYcHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11636"; a="66174835"
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="66174835"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2025 11:34:01 -0800
X-CSE-ConnectionGUID: +VM5KlyESceQFAP0vSkuQQ==
X-CSE-MsgGUID: jn/YIWenTE+viOJymvuWWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,259,1758610800"; 
   d="scan'208";a="195809722"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Dec 2025 11:33:59 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vSgzc-000000000m5-3ZxF;
	Mon, 08 Dec 2025 19:33:56 +0000
Date: Tue, 9 Dec 2025 03:33:11 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Biggers <ebiggers@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ebiggers:wip-nh-lib 14/20] lib/crypto/nh.c:82:1: sparse: sparse:
 static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
Message-ID: <202512090359.7BkUaiC9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git wip-nh-lib
head:   d471b579f29c765ebaeba7a3b653052f029dc550
commit: 7f1c9dc7e0f3540a978f65f4d2d48ea1cd475a3e [14/20] crypto: adiantum - Convert to use NH library
config: i386-randconfig-r134-20251208 (https://download.01.org/0day-ci/archive/20251209/202512090359.7BkUaiC9-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251209/202512090359.7BkUaiC9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512090359.7BkUaiC9-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/crypto/nh.c:81:1: sparse: sparse: bad integer constant expression
   lib/crypto/nh.c:81:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/crypto/nh.c:82:1: sparse: sparse: bad integer constant expression
>> lib/crypto/nh.c:82:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/crypto/nh.c:82:1: sparse: sparse: bad integer constant expression
   lib/crypto/nh.c:82:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +82 lib/crypto/nh.c

98c1450f1f24a0 Eric Biggers 2025-12-06  80  
98c1450f1f24a0 Eric Biggers 2025-12-06 @81  MODULE_DESCRIPTION("NH almost-universal hash function");
98c1450f1f24a0 Eric Biggers 2025-12-06 @82  MODULE_LICENSE("GPL");

:::::: The code at line 82 was first introduced by commit
:::::: 98c1450f1f24a0da7966a85ba15fb0f637ae155d lib/crypto: nh: Add NH library

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
