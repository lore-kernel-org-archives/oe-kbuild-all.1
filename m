Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFAF17FF0
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Aug 2023 20:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692907605; x=1724443605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IQfaHD+DuyVsbsv8z1qkTOosiOK8pcjMsTTt+TvyONE=;
  b=l6CjqtQ9g0yEzH7exgot6uT3JmJw9X4DPrULV8c3PBDQ3gMptQ4E/29S
   QQhIugC+564bNaTSQ33x9Ed3KADbWejd/iIHkJcHRWMXwN5q5FPkPRTHb
   Pg0COQcWPaNqR7KCfjvYlIxRlVpvVlV95/4p3WqJyzsrvlahLDyOQDvzk
   erKaazOrzYP19zx4uTkEaJcWr08kAzaeE8zdctCFJX8GsANVOY1ROQ40n
   14Bkp90JA0FScJCZZ0UnM32pwVmH/fmKqJfD9lX23pP2hOop4MWKYNfGj
   OekS/r14zodIQQ9RG2xYiNedT9FzOaK/TQKvNzLWPlu2nbyBDBLtJq2Px
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="373422298"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="373422298"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 13:06:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="1067965430"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="1067965430"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 24 Aug 2023 13:06:25 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZGb2-0002wa-1G;
	Thu, 24 Aug 2023 20:06:24 +0000
Date: Fri, 25 Aug 2023 04:05:44 +0800
From: kernel test robot <lkp@intel.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: test_set_error_stamp: rm
 /kbuild/obj/consumer/parisc-randconfig-r016-20230825/.reduce_errors/drivers-mtd-nand-raw-nand_base.c:internal-compiler-error:in-maybe_record_trace_start-at-dwarf2cfi.cc
Message-ID: <202308250338.Upxr6yeb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5cc3833f13ace75e26e3f7b51cd7b6da5e9cf17
commit: 43c249ea0b1e10baac4a1264a25d69723ce5d2c2 compiler-gcc.h: remove ancient workaround for gcc PR 58670
date:   1 year, 1 month ago
config: parisc-randconfig-r016-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250338.Upxr6yeb-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250338.Upxr6yeb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308250338.Upxr6yeb-lkp@intel.com/

All errors (new ones prefixed by >>):

   during RTL pass: dwarf2
   drivers/mtd/nand/raw/nand_base.c: In function 'nand_do_write_ops':
>> drivers/mtd/nand/raw/nand_base.c:4370:1: internal compiler error: in maybe_record_trace_start, at dwarf2cfi.cc:2539
    4370 | }
         | ^
   0x788517 maybe_record_trace_start
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/dwarf2cfi.cc:2539
   0x788a5a create_trace_edges
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/dwarf2cfi.cc:2687
   0x788d8e scan_trace
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/dwarf2cfi.cc:2911
   0x789127 create_cfi_notes
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/dwarf2cfi.cc:2938
   0x789127 execute_dwarf2_frame
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/dwarf2cfi.cc:3309
   0x789127 execute
   	/tmp/build-crosstools-gcc-13.2.0-binutils-2.41/gcc/gcc-13.2.0/gcc/dwarf2cfi.cc:3799
   Please submit a full bug report, with preprocessed source (by using -freport-bug).
   Please include the complete backtrace with any bug report.
   See <https://gcc.gnu.org/bugs/> for instructions.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
