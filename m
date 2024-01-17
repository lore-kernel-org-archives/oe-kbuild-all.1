Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629801DA4C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 22:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705532184; cv=none; b=MyZmvzPr26oAZIRti+2pxeCsuSh8uL7nO1RdJelf4mh+chBlfWP29WUc87SL1oAcq2dzGhr2qXl1IWYD+3GJMvm84Dz0Obl8fv19iKx7DIKXZ7h3fQRq/1relWiJOrXLGgmCA5+SlJzMvL9OR7oj1FjZqwQhDSQ/R12KZkWzl44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705532184; c=relaxed/simple;
	bh=kpjhPp5938oeGMzq26H20ONHh3gjwKsCllNcnhcRihU=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:Received:Received:Date:From:Cc:Subject:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition; b=WS3pOgY1XpAi7rdO4BpMKTtaXCoQzJOdSeylRdNRuPxU1KTGUSzO+RWrqQUXkIC0bB3bjvNSEGSWqYINNyeAeEeuucjh72t5hDwxBKjR9uSTfHZmqxx03jJtKxlSMMOJx6alXRiATCoRFEvQ5W0kr1iXpOrjgGc2Nm9qXrHZU0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YtHeF1Ni; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YtHeF1Ni"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705532182; x=1737068182;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kpjhPp5938oeGMzq26H20ONHh3gjwKsCllNcnhcRihU=;
  b=YtHeF1Ni8XmoEsJJLP75Z1qJ8qcFmf/xBmKKG1cEDespVg05aqZAVnim
   L4Y8rTaE3aVeZ/Jyh22oZHe4XVpTxgcmd5h4MxDP96UZ6tcilsX10uBxx
   golumfyun1TWXiBwy02EImUaNfVavPuG+R8l1GIqTfV8MmtJwFs4BGrcD
   LxmvUHoYZF+VJIPQRjFpzBBxKSaSshFDvwarL305mTKxE1Um9fTdP1U2W
   j6B5dxrld1cR/HTx24Yaxnh1vZUawlANdRjkJjRFNUW/XqAulNUVuihLE
   FJ8toO6pQwEwfXMMmgO3VjMrj4vOvzS1NOqNogIS3neG15tY4Qk1PXo28
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7665973"
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="7665973"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2024 14:56:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,201,1701158400"; 
   d="scan'208";a="26301364"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jan 2024 14:56:21 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQEpW-0002Pa-2G
	for oe-kbuild-all@lists.linux.dev;
	Wed, 17 Jan 2024 22:56:18 +0000
Date: Thu, 18 Jan 2024 06:56:07 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:topic/chromeos-4.19-s0ix 6403/9999]
 kernel/watchdog_buddy_cpu.c:89:6: warning: no previous prototype for
 function 'watchdog_check_hardlockup'
Message-ID: <202401180636.D6J9fDPY-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: c257fa8632bb98df1fbc4e2ac46c91c938428be2 [6403/9999] CHROMIUM: hardlockup: detect hard lockups without NMIs using secondary cpus
config: x86_64-randconfig-012-20240118 (https://download.01.org/0day-ci/archive/20240118/202401180636.D6J9fDPY-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240118/202401180636.D6J9fDPY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401180636.D6J9fDPY-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/watchdog_buddy_cpu.c:89:6: warning: no previous prototype for function 'watchdog_check_hardlockup' [-Wmissing-prototypes]
      89 | void watchdog_check_hardlockup(void)
         |      ^
   kernel/watchdog_buddy_cpu.c:89:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      89 | void watchdog_check_hardlockup(void)
         | ^
         | static 
   1 warning generated.


vim +/watchdog_check_hardlockup +89 kernel/watchdog_buddy_cpu.c

    88	
  > 89	void watchdog_check_hardlockup(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
