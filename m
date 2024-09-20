Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C885DEEC8
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 04:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726807821; cv=none; b=nRCMs4aaQI2fE0eeqBqZIxlsPR0EEQKKEZP9jknO3qaYAHdNX8gZ9oXG7OJga/r4FnVQn4pKOBPaBisIGxCrUCULdYGWxiRtes188Z4VPnF0wsIWKHXGgHZ6T7ivMg77Zd8UZp3EiDfBXfHYmJNYi8TORpX4z0T3SR+pGdD/MyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726807821; c=relaxed/simple;
	bh=7ewElyAQ5g0ROd0D4B6ECB3D0m3movhS/uYKmSpCeDA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YD5o0k8Sxeql+Dcui28qDxFBeB/L8vxkCXvQuJ4aVc3OGY8n2jMfzgwCRwJq5ot5PGzWQYy3kH7nstCGMUVuW3/34nXi6N4ZAvUQvQBYUqPZSMktbuGgcV2yfih6JQ2SUvvoMXjsn9iyIZ/NlbLwnkzEmT6Q3iE8TVO6Qf8hm9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B1XAwA9v; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B1XAwA9v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726807819; x=1758343819;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7ewElyAQ5g0ROd0D4B6ECB3D0m3movhS/uYKmSpCeDA=;
  b=B1XAwA9vqI4kMn2jKOqrRxop0InPm/LMphBpvxpyQ1qnXNUYqOGJt2T4
   eSYQo7ncoZb/zxeSA7qO2NNcv1SJSwJTee6sduVGoMfAO/gJViY+4/Z0s
   0dz6mTNvYU24oQkm977oiQ+2bGdGqJ548yTnJ5P2WM7qNaTdbfpAMxquk
   vlKIdhKGPis6qMRGuSB3fziJhw6ccUfVltgqNZuB4/peck/8dzFdNcnBp
   LcIVKW4Q/kEE0khzY1IaPXNu6M7s/zq7P3+ZAkNAZwKlPo5RNVALw+w8A
   pME/2CRXXesu03u/Mm6CwK/GdtyrVmEG20tu6FJtaobzd2lzC5o1zJesT
   w==;
X-CSE-ConnectionGUID: Yv7vVh3rSD2peVUHgavQ2w==
X-CSE-MsgGUID: XghkCfT1RryAB6l/EP9Wsg==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="37166657"
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="37166657"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 21:50:19 -0700
X-CSE-ConnectionGUID: 5EDh6nM4SxmY/vEMJrsqrQ==
X-CSE-MsgGUID: VVwxjASgQ8u90lDUsr+q8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,243,1719903600"; 
   d="scan'208";a="70303166"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Sep 2024 21:50:18 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1srVax-000Dyg-2t;
	Fri, 20 Sep 2024 04:50:15 +0000
Date: Fri, 20 Sep 2024 12:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:x86-remove-absolute-percpu 4/5] kallsyms.c:undefined reference
 to `symbol_absolute'
Message-ID: <202409201233.ruVsyeRD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git x86-remove-absolute-percpu
head:   67e86d7019bb6713f5e8a2a2d46a42dd4f56720e
commit: 664e6ea70ed0b9558e678dd5d293978eda4d642e [4/5] scripts/kallsyms: Remove support for absolute per-CPU variables
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240920/202409201233.ruVsyeRD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201233.ruVsyeRD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201233.ruVsyeRD-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   scripts/kallsyms.c: In function 'write_src':
>> scripts/kallsyms.c:479:33: warning: implicit declaration of function 'symbol_absolute' [-Wimplicit-function-declaration]
     479 |                                 symbol_absolute(table[i]) ? "absolute" : "relative",
         |                                 ^~~~~~~~~~~~~~~
   /usr/bin/ld: /tmp/ccH04tyT.o: in function `write_src':
>> kallsyms.c:(.text+0x780): undefined reference to `symbol_absolute'
   collect2: error: ld returned 1 exit status
   make[3]: *** [scripts/Makefile.host:116: scripts/kallsyms] Error 1
   make[3]: Target 'scripts/' not remade because of errors.
   make[2]: *** [Makefile:1178: scripts] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
