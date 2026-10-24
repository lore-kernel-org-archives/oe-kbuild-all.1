Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792809468;
	b=foyN2V5VgD2WqQXSYbvsX6yDkXrItFEdyIYydgHBJH3WdRATWQu8PATmvko3TBE6hjkk
	 HpsY6oMITMApE8uK4ModS8/C/V76K1yqxEjr8tVU2+pAZQnJi4lEPPVbnLEhwRYxS4nFx
	 OEJJG86qMwJbrq8uvwwXBCbT83L/HwvsxA2kZu6IAwMvziaC7n3SIypo6gnQRB7Zzk2ZC
	 fERhuXqnizaIwjY0/yebfl7wnyywnHkBNF45JNOikJ4ZXcseb/WpdPYC53G6JORpHYzK4
	 VZiyBnw0C+J9EEJ6V3ZbsAwJNaXW6wJuR7g8uSxelLu1hZc8mb/k8ebKj5Qz4ZOQ11g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792809468;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bwkS21RHjpBNq+wHTqKD1mGMG6QKIeNPMDUlzsG2pYI=;
	b=IjuL3aPUdPlwfEl5zRUzLWBxu3of+kMMQCBwfCjl8kLtyI7N17koKml2nNrZ+x8LMY/r
	 sH6PcBUiFe+z80Ks14lrb2rUn6W5L7kVSCyMx5eIiADxcksiv1O03HMYPTG7tAORKcQCO
	 DO4WrYJOirBkKEk7Qc2eRBjo0a5Dqq+yTmzAxul4Prb4oOcxY55YV2c7OeJo50xXDSbIQ
	 hr6YZAWyPU5XCATyHWAS0BJvjWfErwd2Ls/Oj7qsB4i9ToqyIijaG23lQJgCnPjxKHV3s
	 lPrNdokqBr/Bets3VpCUqYIvtl+Y/tYxEcgwMvjQ/wOotZF8l2a2igR8Yv7dCRfb7eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TaBER7Fh;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF64606A31A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 02:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7AF64606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TaBER7Fh
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792809466; x=1824345466;
  h=date:from:to:cc:subject:message-id;
  bh=OKzZlPVDsk+GJGUFNDrbp/tiIx8T1zRtJKaQDVrzrXU=;
  b=TaBER7Fh51QdH14F1zKAK9uNytT+yq4o3ZoYNw8pcBPSgIFwo9RsIFDn
   tjdTFFW3belU3eLsrFP6eR/sgXR3wWWdyCtKxOzE2gneo6iG+EorAjZ+Q
   TOv57UWTUiVJCSJ0DZoEAdU6tg9Cxxg24sgplvEbb9xjloe/UG+wrV8lK
   dkU4nWfD0ncRTT9kxi4UiU0JhwUt/nmMyp3e0r8FSfB2uzSLr5lFnw5om
   E4awiMIOzJxDtsrX/ukumEsNLpwde9sNuwPjBU6USbUr1eX7heqkvXLbm
   S+f8p2s3HAjc0i45+Obx9UFk2c4AWf1kRYeIdmM5qD23kk7Ju3nGrYB0H
   Q==;
X-CSE-ConnectionGUID: frNbiatUTl+SVNHOWVAVdQ==
X-CSE-MsgGUID: gAuv1TThQM+2k2LlMT2AFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1576550"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1576550"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 19:37:46 -0700
X-CSE-ConnectionGUID: mS799zCtQ1CMekqORDzSXg==
X-CSE-MsgGUID: J8WY73/ORGOs5e0n2xnyZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="5636991"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 23 Oct 2026 19:37:45 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKRde-00000000TVw-1Aow;
	Sat, 24 Oct 2026 02:37:42 +0000
Date: Sat, 24 Oct 2026 10:37:03 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 15/16]
 include/trace/events/f2fs.h:2738:35: error: implicit declaration of function
 'get_pages'; did you mean 'get_page'?
Message-ID: <202610241012.JKkOV0Bo-lkp@intel.com>
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
config: x86_64-buildonly-randconfig-1001-20261024 (https://download.01.org/0day-ci/archive/20261024/202610241012.JKkOV0Bo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610241012.JKkOV0Bo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610241012.JKkOV0Bo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/f2fs.h:2761,
                    from fs/f2fs/super.c:42:
   include/trace/events/f2fs.h: In function 'do_trace_event_raw_event_f2fs_enable_checkpoint':
>> include/trace/events/f2fs.h:2738:35: error: implicit declaration of function 'get_pages'; did you mean 'get_page'? [-Wimplicit-function-declaration]
    2738 |                 __entry->meta   = get_pages(sbi, F2FS_DIRTY_META);
         |                                   ^~~~~~~~~
   include/trace/trace_events.h:448:11: note: in definition of macro '__DECLARE_EVENT_CLASS'
     448 |         { assign; }                                                     \
         |           ^~~~~~
   include/trace/trace_events.h:456:23: note: in expansion of macro 'PARAMS'
     456 |                       PARAMS(assign), PARAMS(print))                    \
         |                       ^~~~~~
   include/trace/trace_events.h:41:9: note: in expansion of macro 'DECLARE_EVENT_CLASS'
      41 |         DECLARE_EVENT_CLASS(name,                              \
         |         ^~~~~~~~~~~~~~~~~~~
   include/trace/trace_events.h:45:30: note: in expansion of macro 'PARAMS'
      45 |                              PARAMS(assign),                   \
         |                              ^~~~~~
   include/trace/events/f2fs.h:2718:1: note: in expansion of macro 'TRACE_EVENT'
    2718 | TRACE_EVENT(f2fs_enable_checkpoint,
         | ^~~~~~~~~~~
   include/trace/events/f2fs.h:2735:9: note: in expansion of macro 'TP_fast_assign'
    2735 |         TP_fast_assign(
         |         ^~~~~~~~~~~~~~


vim +2738 include/trace/events/f2fs.h

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
