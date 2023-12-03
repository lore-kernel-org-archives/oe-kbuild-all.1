Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F131115AE
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 06:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZG3pAez4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701583669; x=1733119669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7KYcWgwLsMoyVqLFSY684yly5/cD8UmHcRCZe4oaSpE=;
  b=ZG3pAez4hE4qo0iU4ywfQvktYExsuvNZJ5N/HHkMqYMfxIaXZEBheYAo
   7JZ1ycYD5xrwNz8lsIVcChKvsM0frp36AASAkkS7AGVGjuiZrWLXi3rpd
   r1lcF7Tgmj0kXObAyOddObTIG/9a7N2wIuyIwiqo0C7/Dv2hvnuhDkaSl
   JONn1SGhLPZB07v82o3KHBap4qnvaCVdqIpYIogA2OIMOQpTzjAOlwoTC
   CEjNM5RoWBrCQZcRhc5LYfRn531hAURZPWF1NqMxWm4SCBD0CDEMCKNUc
   YqHjofeOBDv66CrNEqQHqPOpSIl1eDOnFiRjNxo61OvU87GIa9bYBLdiv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="373049283"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="373049283"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2023 22:07:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10912"; a="770187869"
X-IronPort-AV: E=Sophos;i="6.04,246,1695711600"; 
   d="scan'208";a="770187869"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 02 Dec 2023 22:07:43 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9fdk-0006I8-32;
	Sun, 03 Dec 2023 06:07:40 +0000
Date: Sun, 3 Dec 2023 14:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: Geoff Levand <geoff@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: arch/powerpc/platforms/ps3/setup.c:229:24: warning: '%u' directive
 output may be truncated writing between 1 and 5 bytes into a region of size
 between 4 and 12
Message-ID: <202312021810.bCVHtweA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   815fb87b753055df2d9e50f6cd80eb10235fe3e9
commit: 07e2d6cf91079ca01db7fb989a02edd8009dcacd powerpc/ps3: Add firmware version to sysfs
date:   2 years, 6 months ago
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20231202/202312021810.bCVHtweA-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231202/202312021810.bCVHtweA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312021810.bCVHtweA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/platforms/ps3/setup.c: In function 'ps3_setup_arch':
>> arch/powerpc/platforms/ps3/setup.c:229:24: warning: '%u' directive output may be truncated writing between 1 and 5 bytes into a region of size between 4 and 12 [-Wformat-truncation=]
     229 |                 "%u.%u.%u", ps3_firmware_version.major,
         |                        ^~
   arch/powerpc/platforms/ps3/setup.c:229:17: note: directive argument in the range [0, 65535]
     229 |                 "%u.%u.%u", ps3_firmware_version.major,
         |                 ^~~~~~~~~~
   arch/powerpc/platforms/ps3/setup.c:228:9: note: 'snprintf' output between 6 and 18 bytes into a destination of size 16
     228 |         snprintf(ps3_firmware_version_str, sizeof(ps3_firmware_version_str),
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     229 |                 "%u.%u.%u", ps3_firmware_version.major,
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     230 |                 ps3_firmware_version.minor, ps3_firmware_version.rev);
         |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +229 arch/powerpc/platforms/ps3/setup.c

   219	
   220	static void __init ps3_setup_arch(void)
   221	{
   222		u64 tmp;
   223	
   224		DBG(" -> %s:%d\n", __func__, __LINE__);
   225	
   226		lv1_get_version_info(&ps3_firmware_version.raw, &tmp);
   227	
   228		snprintf(ps3_firmware_version_str, sizeof(ps3_firmware_version_str),
 > 229			"%u.%u.%u", ps3_firmware_version.major,
   230			ps3_firmware_version.minor, ps3_firmware_version.rev);
   231	
   232		printk(KERN_INFO "PS3 firmware version %s\n", ps3_firmware_version_str);
   233	
   234		ps3_spu_set_platform();
   235	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
