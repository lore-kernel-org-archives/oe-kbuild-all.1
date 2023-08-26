Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5F610960
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 23:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693091858; x=1724627858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E+ipyjVI+6YcaxsNshdrNTVzDBzOljLG/bQZci8i4JQ=;
  b=l9GCzI95UoNBMo7vgp/o3+W1odXwKvqvFYgGZhT6TKMCa8Spt0NcD6+C
   dmbbcmZGY/MeRruOvh6vY8YUGmS3QFce0oWMYNckdRy+1QTfSokgM8Ejl
   sbnjZHx8wz+hfv3R8K03ixTR++qn+v7eINBE5ImP+2J0k8TbWb7S0/YWN
   W5HtvWuXvMWqsDmt9SZMuECaZ3dPss3vy7AFPoGH7S0PO3xvQrFYiwluI
   em3qNCU9dEW6cGVF/aA6EWHzInEgvAkqMgZBrzMuvV/lKZsSXx/Wn7nJs
   2JfU7WecV6KQvdY+NrhifNAfz62vhBOEYTUZDDi9uGtBF+1R6R3BllSKt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="441249800"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="441249800"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 16:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="767274856"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="767274856"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2023 16:17:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa2X8-0005A5-1o;
	Sat, 26 Aug 2023 23:17:34 +0000
Date: Sun, 27 Aug 2023 07:16:37 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_2 11434/11475] ld.lld: error:
 undefined symbol: fdt_path_offset
Message-ID: <202308270753.Ju7wnls5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_2
head:   d6000c552c7d192fdd2d7e21a320c3b269bff5a5
commit: 5d223b90700e4682e6263d8bdedd6c490c2b2e5a [11434/11475] OWRT BUILD: mtd: mtdsplit support
config: hexagon-randconfig-r026-20230827 (https://download.01.org/0day-ci/archive/20230827/202308270753.Ju7wnls5-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270753.Ju7wnls5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270753.Ju7wnls5-lkp@intel.com/

All errors (new ones prefixed by >>):

>> ld.lld: error: undefined symbol: fdt_path_offset
   >>> referenced by mtdsplit_fit.c:297 (drivers/mtd/mtdsplit/mtdsplit_fit.c:297)
   >>>               drivers/mtd/mtdsplit/mtdsplit_fit.o:(mtdsplit_fit_parse) in archive vmlinux.a
   >>> referenced by mtdsplit_fit.c:297 (drivers/mtd/mtdsplit/mtdsplit_fit.c:297)
   >>>               drivers/mtd/mtdsplit/mtdsplit_fit.o:(mtdsplit_fit_parse) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: fdt_next_node
   >>> referenced by mtdsplit_fit.c:304 (drivers/mtd/mtdsplit/mtdsplit_fit.c:304)
   >>>               drivers/mtd/mtdsplit/mtdsplit_fit.o:(mtdsplit_fit_parse) in archive vmlinux.a
   >>> referenced by mtdsplit_fit.c:304 (drivers/mtd/mtdsplit/mtdsplit_fit.c:304)
   >>>               drivers/mtd/mtdsplit/mtdsplit_fit.o:(mtdsplit_fit_parse) in archive vmlinux.a
   >>> referenced by mtdsplit_fit.c:313 (drivers/mtd/mtdsplit/mtdsplit_fit.c:313)
   >>>               drivers/mtd/mtdsplit/mtdsplit_fit.o:(mtdsplit_fit_parse) in archive vmlinux.a
   >>> referenced 1 more times
--
>> ld.lld: error: undefined symbol: fdt_strerror
   >>> referenced by mtdsplit_fit.c:304 (drivers/mtd/mtdsplit/mtdsplit_fit.c:304)
   >>>               drivers/mtd/mtdsplit/mtdsplit_fit.o:(mtdsplit_fit_parse) in archive vmlinux.a
   >>> referenced by mtdsplit_fit.c:304 (drivers/mtd/mtdsplit/mtdsplit_fit.c:304)
   >>>               drivers/mtd/mtdsplit/mtdsplit_fit.o:(mtdsplit_fit_parse) in archive vmlinux.a
--
>> ld.lld: error: undefined symbol: fdt_getprop
   >>> referenced by mtdsplit_fit.c:110 (drivers/mtd/mtdsplit/mtdsplit_fit.c:110)
   >>>               drivers/mtd/mtdsplit/mtdsplit_fit.o:(mtdsplit_fit_parse) in archive vmlinux.a
   >>> referenced by mtdsplit_fit.c:110 (drivers/mtd/mtdsplit/mtdsplit_fit.c:110)
   >>>               drivers/mtd/mtdsplit/mtdsplit_fit.o:(mtdsplit_fit_parse) in archive vmlinux.a
   >>> referenced by mtdsplit_fit.c:167 (drivers/mtd/mtdsplit/mtdsplit_fit.c:167)
   >>>               drivers/mtd/mtdsplit/mtdsplit_fit.o:(mtdsplit_fit_parse) in archive vmlinux.a
   >>> referenced 5 more times
   pahole: .tmp_vmlinux.btf: Invalid argument
   ld.lld: error: .btf.vmlinux.bin.o: unknown file type

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
