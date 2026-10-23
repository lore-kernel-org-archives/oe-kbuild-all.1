Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778755;
	b=qMgPkkMqV6k4MstZkQzC0wNgLT1Ijz9z+vXyBzu9E+nbmEHon+gUwo3x+6hMSo/anrx/
	 lN2yBXYXxn1eZKNpXKcu6oNDZ9HKzbizPjzN5woOtK+YJRXtS8HKg5JXun4a7q6gruNVC
	 V5khnYMDR6PzuFfZQgY+6KO4uYBqzYQWSbHG8lDAwGHAloVAJnrH3Uoj0qqXK2l3W9w8C
	 5hE4PqgOsOMWVv8bMpbciinsJoz/f6FTn0e2FhS4iLIh9eokzO24eAFt7LvaiVC5MTubr
	 9Wl0BoKE/UXM2NyDJ1gEamxF3oqdAB6kYYphgLr0jxKCC6GqBZMLXaQS+7c9IQC6UxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778755;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=q4glMYMDDS9AzOqbt6yVIHQLPxUuz/XKypbqBVJvnl8=;
	b=5Ubxj01RIEPEI0cKY1aaQrgBIQBNoi/xmaWe9ON/ZunWftwFOOkny8NCJDlGSCDbRIEa
	 nlDK96NR0KHdl4G2OxHMG3xQj4KiHZ5q0LyT5Ei+r72CwaotuStzWc2Su5EbgYjyPwc2w
	 h25rjB4zG8peP2mV6qkotIlVeyG+y/NXlPZFSRD3eZoLGue0hw9giZkjSlH99MKkJIjZc
	 mI67Xnt0zb7uxABsoS0ZfHchtA+CKV2sDjLeLAWWALoas2ypGO8GpNNTk0CD66hgfaD6N
	 wZjXrUAMBOfXnP9KmiS6IxHOPMo8ZoBRlh9m8GKfY1Ecr8/84VJJXlpYDOZdciwhEjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dHQ8tuID;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CC7A606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 18:05:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1CC7A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dHQ8tuID
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792778754; x=1824314754;
  h=date:from:to:cc:subject:message-id;
  bh=lDl/EbZXH3J3kc+UKEyrJuiVIQj20ZJiNogfvUD15d4=;
  b=dHQ8tuIDbzu3SLiXaY00MgGzGc5JmkpjQjUM6zhh3rn+0HO2p3ksjEvW
   NCg8ju1W4C8V5FUW/JvS4njykWi5QWn4tGwZgyBD4BqH9msRZS/QIYVWx
   NT3GemtiQyN/WyiwUgSgqUoUepz+u9qDZiJGThaY23DuywIqDy4PN4+xf
   YkoPQy4IQtLeB/o50O0hiNsELI9e78fAwnLj2f4YwKNDbRoSvw49vxT81
   uagOFJyWXDiJIK3ICdYLGxZ2Sf3jhzt+rUcYgqa0MmhT5z+MM1WmyGcIL
   m5diHfCjVr/apSdvCwmUY7yf4HrKjAW6GvoL3Vz/+l6emT01jwHMfvl9p
   g==;
X-CSE-ConnectionGUID: eSn5mn3YTd6NKUDbn59PJw==
X-CSE-MsgGUID: ZBhAe2HhRQCPVDGK1JiRAg==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1635820"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1635820"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 11:05:54 -0700
X-CSE-ConnectionGUID: B8HoWFe+QXSTu0A/nwiaKw==
X-CSE-MsgGUID: MvPy2ytmSviuguCCSWw2Eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="3811083"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 23 Oct 2026 11:05:52 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKJeI-000000001CR-1Idq;
	Fri, 23 Oct 2026 18:05:50 +0000
Date: Fri, 23 Oct 2026 20:04:52 +0200
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 15/16]
 include/trace/events/f2fs.h:2738:19: error: call to undeclared function
 'get_pages'; ISO C99 and later do not support implicit function declarations
Message-ID: <202610231934.oi64nEaQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   4e2ecc51889d46d6803c200c9d70c38d5049cb59
commit: 25f24ed74ab3a7d7b67e2e82fe504d19295f2421 [15/16] f2fs: introduce trace_f2fs_enable_checkpoint()
config: i386-randconfig-2200-20261023 (https://download.01.org/0day-ci/archive/20261023/202610231934.oi64nEaQ-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231934.oi64nEaQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231934.oi64nEaQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from fs/f2fs/super.c:42:
   In file included from include/trace/events/f2fs.h:2761:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:489:
>> include/trace/events/f2fs.h:2738:19: error: call to undeclared function 'get_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2738 |                 __entry->meta   = get_pages(sbi, F2FS_DIRTY_META);
         |                                   ^
   include/trace/events/f2fs.h:2738:19: note: did you mean 'get_page'?
   include/linux/mm.h:2125:20: note: 'get_page' declared here
    2125 | static inline void get_page(struct page *page)
         |                    ^
   In file included from fs/f2fs/super.c:42:
   In file included from include/trace/events/f2fs.h:2761:
   In file included from include/trace/define_trace.h:133:
   In file included from include/trace/perf.h:110:
>> include/trace/events/f2fs.h:2738:19: error: call to undeclared function 'get_pages'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2738 |                 __entry->meta   = get_pages(sbi, F2FS_DIRTY_META);
         |                                   ^
   2 errors generated.


vim +/get_pages +2738 include/trace/events/f2fs.h

  2719	
  2720		TP_PROTO(struct f2fs_sb_info *sbi, u16 phase),
  2721	
  2722		TP_ARGS(sbi, phase),
  2723	
  2724		TP_STRUCT__entry(
  2725			__field(dev_t, dev)
  2726			__field(u16, phase)
  2727			__field(long long, meta)
  2728			__field(long long, imeta)
  2729			__field(long long, nodes)
  2730			__field(long long, data)
  2731			__field(long long, dents)
  2732			__field(long long, qdata)
  2733		),
  2734	
  2735		TP_fast_assign(
  2736			__entry->dev	= sbi->sb->s_dev;
  2737			__entry->phase	= phase;
> 2738			__entry->meta	= get_pages(sbi, F2FS_DIRTY_META);
  2739			__entry->imeta	= get_pages(sbi, F2FS_DIRTY_IMETA);
  2740			__entry->nodes	= get_pages(sbi, F2FS_DIRTY_NODES);
  2741			__entry->data	= get_pages(sbi, F2FS_DIRTY_DATA);
  2742			__entry->dents	= get_pages(sbi, F2FS_DIRTY_DENTS);
  2743			__entry->qdata	= get_pages(sbi, F2FS_DIRTY_QDATA);
  2744		),
  2745	
  2746		TP_printk("dev = (%d,%d), phase: %s, meta: %lld, imeta: %lld, "
  2747			"nodes: %lld, data: %lld, dents: %lld, qdata: %lld",
  2748			show_dev(__entry->dev),
  2749			show_enable_cp_phase(__entry->phase),
  2750			__entry->meta,
  2751			__entry->imeta,
  2752			__entry->nodes,
  2753			__entry->data,
  2754			__entry->dents,
  2755			__entry->qdata)
  2756	);
  2757	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
