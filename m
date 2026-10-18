Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8156B43F0B9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309967; cv=none; b=Ot2UrebOUDurjKPkFDwIheJdFSClOGD7t+hRonMJeHLr+EeQ7k6qnUrJ3tFPsdwZ7ZaNmIawkAjwQYK9oRq80wKqog1VDYbV0dSemdyK304XiegwaeEF0Tmspcep52FVCzQMFtz/B7Uo95a2VzaoFj4H9ZgF3BfW/uM02QmcpZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309967; c=relaxed/simple;
	bh=oro8V5YVMqDm0ETP9m5iq0Y5bI/5BVumXww7xyc5UTI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=P9I85GIvm/i607Hb3grK4CZKOxkUwlE8chagaenm8JsNg4Z3teNO08Jy5GXDEf/Nlkh8dJldoIXpmKgsSkEGtXBJTSHaNwsLD1fdbIgd0+/l2bK+HmvR8vuvauVMVx00zgfFKkyxolUMcDm1l/rc8Tfax/4qkFTwwtxUI/DhB78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQeKc/1/; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQeKc/1/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309967; x=1823845967;
  h=date:from:to:cc:subject:message-id;
  bh=oro8V5YVMqDm0ETP9m5iq0Y5bI/5BVumXww7xyc5UTI=;
  b=cQeKc/1/nZYvYfx2JNb7NqHe5RQs+NXhNqHZsodS4oWdNM4UhgwJuMVi
   9sfzxyHb5x1XgnzxSL5Tod8Cf8VYusdkFGUpLuhB8RLGuAewVXw5Mfdn0
   dfOrfkIdDfmMLcwrOAoKfaGPwo2CpGqOVc5+ExEU7NSR1WVx4D1sCuwHf
   rryUH1at5JD/pwqPAN+N0cSXMeyY7WgKaapahVYpLQzZR59mii2j94Dve
   6K0rnCxq3fmeM12RxDJoJJywMGD5oGqRUZbWUYuUmWZI2H3pHzHfgV1Y7
   abUwzpZ4eT5u0mxMoqpyzrdecizHyu3wF2cnv+cteSS+b8kgWEScFgqo5
   g==;
X-CSE-ConnectionGUID: wAYqc6jFQeGJjDsaKtrnoQ==
X-CSE-MsgGUID: AOEUY39vTMqAdzM9wpiHCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="916685"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="916685"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:39 -0700
X-CSE-ConnectionGUID: pXmPSWsLST2hTKXHQO6S/A==
X-CSE-MsgGUID: Tmn3hx01S56H0ekcmCkqAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="2340810"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 18 Oct 2026 00:52:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh3-000000004xK-03fS;
	Sun, 18 Oct 2026 07:52:33 +0000
Date: Sun, 18 Oct 2026 09:49:03 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 18057/18293] mips-linux-ld:
 fs/fuse/dev.c:undefined reference to `fuse_backing_open_64'
Message-ID: <202610171457.cCWt8oEZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
commit: 693a206243f02abdd96f040d19c9c8c12f482e2c [18057/18293] fuse: support 64 bit, server allocated backing ID
config: mips-randconfig-r2111-20261017 (https://download.01.org/0day-ci/archive/20261017/202610171457.cCWt8oEZ-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261017/202610171457.cCWt8oEZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610171457.cCWt8oEZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: fs/fuse/dev.o: in function `fuse_dev_ioctl':
   fs/fuse/dev.c:(.text+0x55f8): undefined reference to `fuse_backing_open'
>> mips-linux-ld: fs/fuse/dev.c:(.text+0x5680): undefined reference to `fuse_backing_open_64'
>> mips-linux-ld: fs/fuse/dev.c:(.text+0x571c): undefined reference to `fuse_backing_close'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
