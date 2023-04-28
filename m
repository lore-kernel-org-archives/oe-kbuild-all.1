Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F1515B4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Apr 2023 01:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682645259; x=1714181259;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VIH1inNWNEY8JFs7gqJxFqEljo1eVOt2njQlczBmpzk=;
  b=I8mdxTmkeimU1MXg2oEOPbMi3lL7rAy4HdaP4mCzFswv4UxhTpytkO/I
   vepoQURaIybSK6tO0RKDHFlwIU0hc4S44LVVl55+Pnlxanfx3bryxYUP0
   uq+s2r9mYBSd2mA3jFUpptz+0IwoLpZ+ZPSUuDb31LSp3555xA1/ydOce
   1JK/SPvWBYNLTv2PVTjIKObLS9vSHmQR7y7KMVt302FHknp/wOA6DPAel
   IlJ478fBhnLpTH2H+7vAAl4aoPr07y4pCfxHd9TbcQw1cfEpxtKwWi3Kw
   fIAvzWSoRWWgEyk8unKSB6p6U+TBLFwSbNp8miy7UJAwOWSsv4o0OZLdg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="345071974"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="345071974"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2023 18:27:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="727358066"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; 
   d="scan'208";a="727358066"
Received: from lkp-server01.sh.intel.com (HELO b95e16499b55) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 27 Apr 2023 18:27:32 -0700
Received: from kbuild by b95e16499b55 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1psCtX-0000GN-2A;
	Fri, 28 Apr 2023 01:27:31 +0000
Date: Fri, 28 Apr 2023 09:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>,
	Prasad Sodagudi <psodagud@codeaurora.org>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Subject: [sudeep-holla:android13-5.15/ffa 2837/4062]
 include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address
 space '__iomem' of expression
Message-ID: <202304280939.XQYKNioe-lkp@intel.com>
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
config: arm64-randconfig-s031-20230427 (https://download.01.org/0day-ci/archive/20230428/202304280939.XQYKNioe-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce:
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304280939.XQYKNioe-lkp@intel.com/

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
https://github.com/intel/lkp-tests
