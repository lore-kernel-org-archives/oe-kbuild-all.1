Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D404CB5D
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Nov 2023 23:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RiJj6j2D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701299433; x=1732835433;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QjyuhnkMVX/js4mzvDsU7S4M0dl3xR6ZBycVbDZwBCY=;
  b=RiJj6j2DgZ6JLIynu1g/bZqJLMi9L6BoO3SGK3ZwFfqYdap6Q6d8BG1N
   7YVbqGkCIaSeM5camqantQTY0uqgUkVRYC5MiurRMvzOpeq5hH6cXj04P
   7iT22efYJ8DvYlGtEGp5AD+brFWUlYZeOEgB+FSV9jxhHRIGlaTaJv/TZ
   KbEv4pwiAMv257zJE/bwt97pehTkE53KVNnNvMbkZ7+o82bCg1yWvAIg9
   fuvjQhMJuDmh5CiNVMS3mNjX9+xZQdI3SwH3D7nMCHenE+Y0BLXk7Tg/V
   +VKE43HXzAFMSNdNrSruXipsKSvw+lFzE8wIKGf+JqIQQoH88r3SCnKYA
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="383637576"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="383637576"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 15:10:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892609134"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="892609134"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 29 Nov 2023 15:10:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8ThJ-00013y-2A;
	Wed, 29 Nov 2023 23:10:25 +0000
Date: Thu, 30 Nov 2023 07:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [freescale-fslc:pr/639 6175/24603] m68k-linux-gcc: error:
 unrecognized argument in option '-march=armv7-a'
Message-ID: <202311300335.YqxQ1aow-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dong,

FYI, the error/warning still remains.

tree:   https://github.com/Freescale/linux-fslc pr/639
head:   857fbf7cebaba3b1ffccc558deee1d13ac0e11d7
commit: b83a99edcb3eb46360f4b4470a51e0f0749bd73e [6175/24603] Merge branch 'mxc/next' into next
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231130/202311300335.YqxQ1aow-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311300335.YqxQ1aow-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311300335.YqxQ1aow-lkp@intel.com/

All errors (new ones prefixed by >>):

>> m68k-linux-gcc: error: unrecognized argument in option '-march=armv7-a'
   m68k-linux-gcc: note: valid arguments to '-march=' are: 68000 68010 68020 68030 68040 68060 cpu32 isaa isaaplus isab isac
>> m68k-linux-gcc: error: unrecognized argument in option '-mtune=cortex-a9'
   m68k-linux-gcc: note: valid arguments to '-mtune=' are: 68000 68010 68020 68020-40 68020-60 68030 68040 68060 cfv1 cfv2 cfv3 cfv4 cfv4e cpu32
>> m68k-linux-gcc: error: unrecognized command-line option '-mfpu=neon'
>> m68k-linux-gcc: error: unrecognized command-line option '-mfloat-abi=softfp'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
