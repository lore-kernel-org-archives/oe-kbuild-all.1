Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79F627F
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 03:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694663157; x=1726199157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dB086TJsqLflrxTf+0uV3v7v9c3c69TPxCadeV/zp5E=;
  b=GZGCe+v42tYju7XxUp++756Uy6+C6LRQJUn/RphA5ChhsN5mkporZUHX
   l1E+HRPF+qsx/UT44GiWhh54ViGdgBVBkoxp5ZAg01+K5ysABQ+vNDv7F
   +4wZIa/5iuTBePFVcbTuArhjjzRf4wBZhi2WCvCfqo1pMxfS76F53NDcZ
   2IPikCOM5wZXfNtS1y22bHUd9fptA7NUt5xQFeQ1zEr7p94c0ShWFjI0+
   dHr3H9wn4tUIlC4XwiObsuh/dQtiEAkGasuO3EoOIVHJgj+tQjozlfjN/
   XdtBZHnhQl86CiqhVlJPhLWfm+HqA2dlcSzg+4NZjvsqBTOt/0pUMRlFO
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="409799571"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="409799571"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 20:45:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="721054313"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="721054313"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Sep 2023 20:45:54 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgdIe-00017J-19;
	Thu, 14 Sep 2023 03:45:52 +0000
Date: Thu, 14 Sep 2023 11:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Jens Axboe <axboe@kernel.dk>
Subject: arm-linux-gnueabi-ld: error: .btf.vmlinux.bin.o is already in final
 BE8 format
Message-ID: <202309141131.pNe5J6HH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   aed8aee11130a954356200afa3f1b8753e8a9482
commit: 5f2779dfa7b8cc7dfd4a1b6586d86e0d193266f3 blk-iocost: avoid 64-bit division in ioc_timer_fn
date:   8 months ago
config: arm-randconfig-002-20230914 (https://download.01.org/0day-ci/archive/20230914/202309141131.pNe5J6HH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141131.pNe5J6HH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141131.pNe5J6HH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arm-linux-gnueabi-ld: error: .btf.vmlinux.bin.o is already in final BE8 format
   arm-linux-gnueabi-ld: failed to merge target specific data of file .btf.vmlinux.bin.o

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
