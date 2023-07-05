Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B6327F
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 00:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688515931; x=1720051931;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QKyagUPboxcpQf0rlrW9d6i0lm4pdk3WkpwbACGjPms=;
  b=bXADHarlNSyrcLlgYV/Q2gFqXnzkir34g+YhAdF3Hbd8yzzT+IHZpl1/
   LUxp2NCFBoiitSNvsAIiIUrDXZO/k6s/dhhbmLjaJQXwwfgbNCTQz2NI1
   xv/R4M430uBYlaBm+KqmpN9u82GGjUy9CKpRmDE2sxtOSjWoU+X4buV/W
   l8qITsnCsNBsSfGLKoX4GaC5tSJ1dZ1FSr75RjU0bkEXvsbVzi6WHDWyN
   +VRb4Z/YiUUAPuPsSAyKPupgtJdI3XKGwWtUP/jTKK/bVWZjMBJ8WRt78
   W8h1hDxZgkeg+0uEcchxzdkc/vHKe2wVPjLZCMc48XubS+7RHwN8iyOoj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="362077344"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="362077344"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 17:12:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="696283513"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="696283513"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Jul 2023 17:12:06 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGq7p-000Iep-2Q;
	Wed, 05 Jul 2023 00:12:05 +0000
Date: Wed, 5 Jul 2023 08:11:44 +0800
From: kernel test robot <lkp@intel.com>
To: Andreas Hindborg <nmi@metaspace.dk>, Ming Lei <ming.lei@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Matias Bjorling <Matias.Bjorling@wdc.com>,
	Hans Holmberg <Hans.Holmberg@wdc.com>, Jens Axboe <axboe@kernel.dk>,
	Minwoo Im <minwoo.im.dev@gmail.com>,
	Aravind Ramesh <Aravind.Ramesh@wdc.com>, gost.dev@samsung.com,
	linux-block@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Andreas Hindborg <a.hindborg@samsung.com>
Subject: Re: [PATCH v5 5/5] ublk: enable zoned storage support
Message-ID: <202307050741.XbpaKP7i-lkp@intel.com>
References: <20230704165209.514591-6-nmi@metaspace.dk>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704165209.514591-6-nmi@metaspace.dk>

Hi Andreas,

kernel test robot noticed the following build errors:

[auto build test ERROR on 3261ea42710e9665c9151006049411bd23b5411f]

url:    https://github.com/intel-lab-lkp/linux/commits/Andreas-Hindborg/ublk-add-opcode-offsets-for-DRV_IN-DRV_OUT/20230705-005338
base:   3261ea42710e9665c9151006049411bd23b5411f
patch link:    https://lore.kernel.org/r/20230704165209.514591-6-nmi%40metaspace.dk
patch subject: [PATCH v5 5/5] ublk: enable zoned storage support
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230705/202307050741.XbpaKP7i-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050741.XbpaKP7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050741.XbpaKP7i-lkp@intel.com/

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
   mips-linux-ld: drivers/block/ublk-zoned.o: in function `ublk_set_nr_zones':
>> ublk-zoned.c:(.text.ublk_set_nr_zones+0x17c): undefined reference to `__udivdi3'
   mips-linux-ld: drivers/block/ublk-zoned.o: in function `ublk_dev_param_zoned_validate':
>> ublk-zoned.c:(.text.ublk_dev_param_zoned_validate+0x258): undefined reference to `__udivdi3'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
