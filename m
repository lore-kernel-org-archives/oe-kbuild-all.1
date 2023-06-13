Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE3D33E3
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jun 2023 16:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686673993; x=1718209993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ogvtSx9xaumD8vg7K6l/UoJlH/hTJOENURmyqM4OhZI=;
  b=jJEw10kFbkFcpGD//8Tgz0FYxDL9KhQ0p/CojVaw4Taeec4dFPGs6xSa
   ZJjSSR3ngTDyah4oDDeB8IxZY0GMGougoSUNtgaxvgfYuGWuQxxSMaYZM
   /R5f3sQz50eHd6dhK9ghJom1+A0h7TNUVZip6jvUIlFxainK1UHqzV21O
   nuKvBMNh9wga09Fo4T5zKI9wXdAgShyJWyzknYcHXfnvmEztPweSeY2Gf
   E2hFexWJvkMxqzgLHVXoNpUgCaCngXOOUcu1X79SwuzNrs6oBkg0N0lN4
   SvIEwUp/foy4LRgXxrkN9UW8vxgjKL7FyDpADI00QY/nzxSsXyTXCTVv6
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="355887553"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="355887553"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2023 09:33:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10740"; a="1041842909"
X-IronPort-AV: E=Sophos;i="6.00,240,1681196400"; 
   d="scan'208";a="1041842909"
Received: from lkp-server01.sh.intel.com (HELO 211f47bdb1cb) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Jun 2023 09:33:08 -0700
Received: from kbuild by 211f47bdb1cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q96x9-0001Xg-2q;
	Tue, 13 Jun 2023 16:33:07 +0000
Date: Wed, 14 Jun 2023 00:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>,
	Prasad Sodagudi <psodagud@codeaurora.org>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Subject: [sudeep-holla:android13-5.15/ffa 2837/4062]
 include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address
 space '__iomem' of expression
Message-ID: <202306140047.RGLMullJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git android13-5.15/ffa
head:   c6013f50f1ae0e42d14d51a06118779ead3047ef
commit: c7b6c40553f8ae90617595cc851e19520fbd945b [2837/4062] FROMLIST: tracing: Add register read/write tracing support
config: arm64-randconfig-s052-20230611 (https://download.01.org/0day-ci/archive/20230614/202306140047.RGLMullJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce:
        mkdir -p ~/bin
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git/commit/?id=c7b6c40553f8ae90617595cc851e19520fbd945b
        git remote add sudeep-holla https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git
        git fetch --no-tags sudeep-holla android13-5.15/ffa
        git checkout c7b6c40553f8ae90617595cc851e19520fbd945b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.3.0 ~/bin/make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash kernel/trace/

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306140047.RGLMullJ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/trace/trace_readwrite.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/rwmmio.h):
>> include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:38:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:63:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:85:1: sparse: sparse: cast removes address space '__iomem' of expression
   kernel/trace/trace_readwrite.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/events/rwmmio.h):
>> include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:38:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:63:1: sparse: sparse: cast removes address space '__iomem' of expression
   include/trace/events/rwmmio.h:85:1: sparse: sparse: cast removes address space '__iomem' of expression
   kernel/trace/trace_readwrite.c:16:6: sparse: sparse: symbol 'log_write_mmio' was not declared. Should it be static?
   kernel/trace/trace_readwrite.c:24:6: sparse: sparse: symbol 'log_post_write_mmio' was not declared. Should it be static?
   kernel/trace/trace_readwrite.c:32:6: sparse: sparse: symbol 'log_read_mmio' was not declared. Should it be static?
   kernel/trace/trace_readwrite.c:40:6: sparse: sparse: symbol 'log_post_read_mmio' was not declared. Should it be static?

vim +/__iomem +13 include/trace/events/rwmmio.h

    12	
  > 13	TRACE_EVENT(rwmmio_write,
    14	
    15		TP_PROTO(unsigned long caller, u64 val, u8 width, volatile void __iomem *addr),
    16	
    17		TP_ARGS(caller, val, width, addr),
    18	
    19		TP_STRUCT__entry(
    20			__field(u64, caller)
    21			__field(u64, val)
    22			__field(u64, addr)
    23			__field(u8, width)
    24		),
    25	
    26		TP_fast_assign(
    27			__entry->caller = caller;
    28			__entry->val = val;
    29			__entry->addr = (unsigned long)(void *)addr;
    30			__entry->width = width;
    31		),
    32	
    33		TP_printk("%pS width=%d val=%#llx addr=%#llx",
    34			(void *)(unsigned long)__entry->caller, __entry->width,
    35			__entry->val, __entry->addr)
    36	);
    37	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
