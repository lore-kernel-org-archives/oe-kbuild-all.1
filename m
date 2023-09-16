Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34F0125D1
	for <oe-kbuild-all@lists.linux.dev>; Sat, 16 Sep 2023 16:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694881389; x=1726417389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2QpYZngqRuhTxzYgaTxwypC4JYaUqSIYOUNTCs5GHUg=;
  b=XI12yU3qeMeNWnIQYm1UA3jS9epXl4JS+HCakd43QpvpSQDv+YgXeBth
   6BNWn8INwgApxu6gLg8NwRXHbdOGXUScoydLyVKVJM9thjCS8j1lv/7+7
   8Ojo5QZLn/0eqTk/1nFaJrj+nOHhJZhqXVmXUBaZtyLxOPMG6ECGJ9L9B
   QAjMEoTwpW0+ekaXrC5yiAkGj4M95ruFZCoRG228eQL2s3qGTE51tUbtJ
   9zH6EmG/CmD+QQlkxvmBCKqmhVQoUsLNcPgJ4zCzxy6ddroeiMWQG/jZA
   l+i5kvcCAsdxgz62+QIZm7sw7MFXHQzjYa6oesNDvfzgZIu1IdKqnFQ+V
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="359678919"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="359678919"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2023 09:23:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10835"; a="815533554"
X-IronPort-AV: E=Sophos;i="6.02,152,1688454000"; 
   d="scan'208";a="815533554"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga004.fm.intel.com with ESMTP; 16 Sep 2023 09:23:02 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhY4S-0004Se-0S;
	Sat, 16 Sep 2023 16:23:00 +0000
Date: Sun, 17 Sep 2023 00:22:25 +0800
From: kernel test robot <lkp@intel.com>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 3/9] ACPI: APEI: ERST: Emit the mce_record tracepoint
Message-ID: <202309170045.nv6Fat21-lkp@intel.com>
References: <20230916130316.65815-4-xueshuai@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230916130316.65815-4-xueshuai@linux.alibaba.com>

Hi Shuai,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/pstore]
[also build test ERROR on kees/for-next/kspp rafael-pm/linux-next tip/x86/core efi/next linus/master v6.6-rc1 next-20230915]
[cannot apply to aegl/next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shuai-Xue/pstore-move-pstore-creator-id-section-type-and-record-struct-to-common-header/20230916-210612
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/pstore
patch link:    https://lore.kernel.org/r/20230916130316.65815-4-xueshuai%40linux.alibaba.com
patch subject: [RFC PATCH 3/9] ACPI: APEI: ERST: Emit the mce_record tracepoint
config: x86_64-buildonly-randconfig-006-20230916 (https://download.01.org/0day-ci/archive/20230917/202309170045.nv6Fat21-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230917/202309170045.nv6Fat21-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309170045.nv6Fat21-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: vmlinux.o: in function `trace_mce_record':
>> include/trace/events/mce.h:12: undefined reference to `__tracepoint_mce_record'
>> ld: include/trace/events/mce.h:12: undefined reference to `__SCT__tp_func_mce_record'
>> ld: vmlinux.o:(__jump_table+0x3418): undefined reference to `__tracepoint_mce_record'
>> ld: vmlinux.o:(.static_call_sites+0x2e34): undefined reference to `__SCK__tp_func_mce_record'


vim +12 include/trace/events/mce.h

8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  11  
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13 @12  TRACE_EVENT(mce_record,
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  13  
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  14  	TP_PROTO(struct mce *m),
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  15  
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  16  	TP_ARGS(m),
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  17  
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  18  	TP_STRUCT__entry(
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  19  		__field(	u64,		mcgcap		)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  20  		__field(	u64,		mcgstatus	)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  21  		__field(	u64,		status		)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  22  		__field(	u64,		addr		)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  23  		__field(	u64,		misc		)
db819d60f67200 Yazen Ghannam  2016-09-12  24  		__field(	u64,		synd		)
5828c46f2c07b9 Yazen Ghannam  2016-09-12  25  		__field(	u64,		ipid		)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  26  		__field(	u64,		ip		)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  27  		__field(	u64,		tsc		)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  28  		__field(	u64,		walltime	)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  29  		__field(	u32,		cpu		)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  30  		__field(	u32,		cpuid		)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  31  		__field(	u32,		apicid		)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  32  		__field(	u32,		socketid	)
ad440ad66f1617 David Sharp    2010-12-03  33  		__field(	u8,		cs		)
ad440ad66f1617 David Sharp    2010-12-03  34  		__field(	u8,		bank		)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  35  		__field(	u8,		cpuvendor	)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  36  	),
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  37  
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  38  	TP_fast_assign(
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  39  		__entry->mcgcap		= m->mcgcap;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  40  		__entry->mcgstatus	= m->mcgstatus;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  41  		__entry->status		= m->status;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  42  		__entry->addr		= m->addr;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  43  		__entry->misc		= m->misc;
db819d60f67200 Yazen Ghannam  2016-09-12  44  		__entry->synd		= m->synd;
5828c46f2c07b9 Yazen Ghannam  2016-09-12  45  		__entry->ipid		= m->ipid;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  46  		__entry->ip		= m->ip;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  47  		__entry->tsc		= m->tsc;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  48  		__entry->walltime	= m->time;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  49  		__entry->cpu		= m->extcpu;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  50  		__entry->cpuid		= m->cpuid;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  51  		__entry->apicid		= m->apicid;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  52  		__entry->socketid	= m->socketid;
ad440ad66f1617 David Sharp    2010-12-03  53  		__entry->cs		= m->cs;
ad440ad66f1617 David Sharp    2010-12-03  54  		__entry->bank		= m->bank;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  55  		__entry->cpuvendor	= m->cpuvendor;
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  56  	),
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  57  
5828c46f2c07b9 Yazen Ghannam  2016-09-12  58  	TP_printk("CPU: %d, MCGc/s: %llx/%llx, MC%d: %016Lx, IPID: %016Lx, ADDR/MISC/SYND: %016Lx/%016Lx/%016Lx, RIP: %02x:<%016Lx>, TSC: %llx, PROCESSOR: %u:%x, TIME: %llu, SOCKET: %u, APIC: %x",
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  59  		__entry->cpu,
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  60  		__entry->mcgcap, __entry->mcgstatus,
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  61  		__entry->bank, __entry->status,
5828c46f2c07b9 Yazen Ghannam  2016-09-12  62  		__entry->ipid,
db819d60f67200 Yazen Ghannam  2016-09-12  63  		__entry->addr, __entry->misc, __entry->synd,
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  64  		__entry->cs, __entry->ip,
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  65  		__entry->tsc,
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  66  		__entry->cpuvendor, __entry->cpuid,
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  67  		__entry->walltime,
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  68  		__entry->socketid,
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  69  		__entry->apicid)
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  70  );
8968f9d3dc23d9 Hidetoshi Seto 2009-10-13  71  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
