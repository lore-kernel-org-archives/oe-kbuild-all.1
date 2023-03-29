Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC4BAFE6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 13:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680096455; x=1711632455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h2BJAPy4PtTnf8FVMhzEc3F0wluxgiMOP3NtgtVayNI=;
  b=WWzgcTXrL9bIV9sp1NeLVWfm9BK/AgAEokNWhyN/9UOm4zBwVxW5t/Qq
   PfLJG6NGFV80jJDtpHmYE7uLthB6l5WEOrUzPE42PdAVs+XOaqGS/T/4d
   JuH2Qu9IUXTOCLzLxwuVpiKrMAzyq3Sg39y81eYpf+OWuLcI9McRC2BHv
   FmGFR750lroNhHYuwFpum/VtJP0A34rd58cTo4y/OXA/UpV6hxbyhLFo+
   CPW6Ws6lnEzd3Uf8zsR2p41uIJR53duiDpA0mHF83idAJA/GKTQ6OyOts
   YO+h77BGuCovJZ7TregWpEcoI6j5+nROsr7XabhPL+eWJXEm/OwRoWHA5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="343297902"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="343297902"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 06:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="858491270"
X-IronPort-AV: E=Sophos;i="5.98,300,1673942400"; 
   d="scan'208";a="858491270"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 29 Mar 2023 06:26:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phVpE-000JZa-0B;
	Wed, 29 Mar 2023 13:26:52 +0000
Date: Wed, 29 Mar 2023 21:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ammar Faizi <ammarfaizi2@gnuweeb.org>,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ammarfaizi2-block:google/android/kernel/common/android-gs-raviole-5.10-android12-qpr1-d
 1051/8858] include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes
 address space '__iomem' of expression
Message-ID: <202303292147.fLr5ZGcA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android-gs-raviole-5.10-android12-qpr1-d
head:   9771767708df4fcf51cd1642e041c804a86e740c
commit: e091aa59b956dc60ca88a83ce3510a4de2d8dd59 [1051/8858] ANDROID: tracing: Add register read and write tracing support
config: arm64-randconfig-s041-20230329 (https://download.01.org/0day-ci/archive/20230329/202303292147.fLr5ZGcA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/e091aa59b956dc60ca88a83ce3510a4de2d8dd59
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/linux-block
        git fetch --no-tags ammarfaizi2-block google/android/kernel/common/android-gs-raviole-5.10-android12-qpr1-d
        git checkout e091aa59b956dc60ca88a83ce3510a4de2d8dd59
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/trace/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303292147.fLr5ZGcA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/trace_readwrite.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/rwmmio.h):
>> include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:37:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:59:1: sparse: sparse: cast removes address space '__iomem' of expression
   kernel/trace/trace_readwrite.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/events/rwmmio.h):
>> include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:37:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:59:1: sparse: sparse: cast removes address space '__iomem' of expression

vim +/__iomem +13 include/trace/events/rwmmio.h

    12	
  > 13	TRACE_EVENT(rwmmio_write,
    14	
    15		TP_PROTO(unsigned long fn, u64 val, u8 width, volatile void __iomem *addr),
    16	
    17		TP_ARGS(fn, val, width, addr),
    18	
    19		TP_STRUCT__entry(
    20			__field(u64, fn)
    21			__field(u64, val)
    22			__field(u8, width)
    23			__field(u64, addr)
    24		),
    25	
    26		TP_fast_assign(
    27			__entry->fn = fn;
    28			__entry->val = val;
    29			__entry->width = width;
    30			__entry->addr = (u64)addr;
    31		),
    32	
    33		TP_printk("%pS write addr=%llx of width=%x val=0x%llx\n",
    34			__entry->fn, __entry->addr, __entry->width, __entry->val)
    35	);
    36	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
