Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51B119E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Jun 2023 00:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687393950; x=1718929950;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=whUQQ7p3Kv39swt7Nc9mKmmDgQShezxRctKle3kzDgU=;
  b=OVyd2xXlEcugJcdUIo8o4MEkmzJrbR2AcajSYLsI5nn17jpgHz7O3f7t
   eivHAnE/vJaGTGNPhk/0YIiHwleYG8Na5aScu73IpqWMcz2ZpQVxlvPRo
   xBAVxYZZBohrx39uXY/ouFbG0TfZpj3W0wk6oejtWGWx5mnvMu7zZus3A
   3e9tEhKb4nPRjrhGrtimd3ZEME/vQWGx0hj1YCb5q1d9VrjNhXpjeX/Co
   vLu/GZHB4YibkTrIw07te4Boq25CO3WoKjQvAG/ncSmHUeAY/3kgMWS7j
   RSFIR61NxhjxvQDVuJPQYYwBk2Hz6IdNJISb1pG2uKQ2eVOjxtPA/zMHx
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="389975018"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="389975018"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 17:32:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="804578167"
X-IronPort-AV: E=Sophos;i="6.00,262,1681196400"; 
   d="scan'208";a="804578167"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 21 Jun 2023 17:32:23 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qC8FK-0007CB-2c;
	Thu, 22 Jun 2023 00:32:22 +0000
Date: Thu, 22 Jun 2023 08:31:37 +0800
From: kernel test robot <lkp@intel.com>
To: Pankaj Raghav <p.raghav@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC 2/4] filemap: use minimum order while allocating folios
Message-ID: <202306220838.ymG43hqV-lkp@intel.com>
References: <20230621083823.1724337-3-p.raghav@samsung.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230621083823.1724337-3-p.raghav@samsung.com>

Hi Pankaj,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]
[also build test ERROR on axboe-block/for-next linus/master v6.4-rc7 next-20230621]
[cannot apply to hch-configfs/for-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pankaj-Raghav/fs-Allow-fine-grained-control-of-folio-sizes/20230621-172322
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20230621083823.1724337-3-p.raghav%40samsung.com
patch subject: [RFC 2/4] filemap: use minimum order while allocating folios
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230622/202306220838.ymG43hqV-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230622/202306220838.ymG43hqV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306220838.ymG43hqV-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/mips/kernel/head.o: in function `_stext':
   (.text+0x0): relocation truncated to fit: R_MIPS_26 against `kernel_entry'
   arch/mips/kernel/head.o: in function `smp_bootstrap':
   (.ref.text+0xd8): relocation truncated to fit: R_MIPS_26 against `start_secondary'
   init/main.o: in function `set_reset_devices':
   main.c:(.init.text+0x20): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x30): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `debug_kernel':
   main.c:(.init.text+0xa4): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0xb4): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `quiet_kernel':
   main.c:(.init.text+0x128): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x138): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `warn_bootconfig':
   main.c:(.init.text+0x1ac): relocation truncated to fit: R_MIPS_26 against `_mcount'
   main.c:(.init.text+0x1bc): relocation truncated to fit: R_MIPS_26 against `__sanitizer_cov_trace_pc'
   init/main.o: in function `init_setup':
   main.c:(.init.text+0x230): additional relocation overflows omitted from the output
   mips-linux-ld: mm/readahead.o: in function `readahead_expand':
>> readahead.c:(.text.readahead_expand+0x158): undefined reference to `__divdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
