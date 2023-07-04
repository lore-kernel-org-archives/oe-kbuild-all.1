Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C98472CA4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Jul 2023 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688488563; x=1720024563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6DcBfF6UYncnX4CzL6VBR976/do95la7p4Qu6Z8s9Uk=;
  b=Uw3tuVbUxhHDqWxsO5tH6THr+o7Q8dtqBX2ulpxFquI2L65YwSyXL6AI
   k29HUkUMVWQXygxd7bK8cpvGPS275RJ9ZSoNdgMowVlZn7vpyyrRbaUwU
   12ug3x7CtJiu3oGQq37my05Ip95W02KGcdnKu3LJ4fwQTKkUa4BITEbEC
   E7q5N5JnoiB8zP5forAWycgVjwVBZGNXpqHxlW7naEaVjrFj0CnMYvkyF
   FKgTtQUJ7fVQvgNBDi2nLDQO+r9Cs1I6iSnp715LgZvyiDXGcLHLHvTKS
   pkAO+DK/yXK8FmBS0Ar2VJ1aTulDKUSNi4iU0M1W6eNatqHHqr9z2AoGj
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="362020037"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="362020037"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 09:36:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="788908358"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="788908358"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 04 Jul 2023 09:36:00 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGj0S-000INv-0P;
	Tue, 04 Jul 2023 16:36:00 +0000
Date: Wed, 5 Jul 2023 00:35:03 +0800
From: kernel test robot <lkp@intel.com>
To: Vamsi Krishna Lanka <quic_vamslank@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Todd Kjos <tkjos@google.com>,
	Prasad Sodagudi <psodagud@codeaurora.org>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>
Subject: [sudeep-holla:android13-5.15/ffa 2837/4062]
 include/trace/events/rwmmio.h:13:1: sparse: sparse: cast removes address
 space '__iomem' of expression
Message-ID: <202307050039.YxktNdfP-lkp@intel.com>
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
config: arm64-randconfig-r081-20230703 (https://download.01.org/0day-ci/archive/20230705/202307050039.YxktNdfP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307050039.YxktNdfP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307050039.YxktNdfP-lkp@intel.com/

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
