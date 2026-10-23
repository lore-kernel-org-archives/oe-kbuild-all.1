Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792775675;
	b=wfRURF5/DGtKRHZTW7RdTqb2NHCFZmgqMFRoBLxyCEM1sIEnmJZti3TACxkVQ0vzTDIq
	 gO7B/7RAhYCB1k9dmrENWSlekX6y/i7D77fsm8d0FOP0xsrdv/Fk24nXRtQFcSHPcqicx
	 RYhR1OINuRqwx3G8udS+UjMusRQ7nlllWmEcRDYCoB0sSPNynkTE16o4mm80wWQ6Iz5Og
	 b7TX4+IkWe0mT5cS+OknRkHgW9S/jLCblCFUTwpxrc/es68/FygbEJWHqO+LfXP5QoKMQ
	 72udSI9KPPoTsk2Pe7za4oBvdFnGFCVuKrBuFrWn8trM0l+yIbplMz4NIP0KwcwsVYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792775675;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=b08P1z9GmIuWDsV71t/dHdsfUFvPVa8ra/ODE0fpulg=;
	b=OFAXeT0tJKOzM4jzbyvZzZ52FvkZOKzTfk3zjq1z9VIQ2RaSAnm2HLPgWC92FE0Sh0XB
	 LHdSzsT12DEPlwiZWPNn7szW2WZM5PKaiYpYL9ZqYKgeV1R5I5CgIKXZ2cK4k5nNrvLXu
	 bMMo/eLXtfM3bpDItzm2EJW7pdIzFGqTxHHb8hyixn0pr+vFx8opS269hE5m1aoAIKJ+r
	 zOAtWDnWq+D1XRfVjZMdHkVtDgYavdVH/yCY8GQqU+UZ09wA2x27jRvjZ9rs5YDHJph53
	 E7AWl7LHo84fXRvUlB7XAkuZCgSe8+ZxFEWToq7VN+HXPxemHLHiG+oLB0SkPsWoerg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f8xO6xKA;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CEFF606A328
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 17:14:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CEFF606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=f8xO6xKA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792775674; x=1824311674;
  h=date:from:to:cc:subject:message-id;
  bh=FRiugY+fkq59wMBeOOcDsuWAYygrhzw2v61iqUer4Fg=;
  b=f8xO6xKA30184rgIgp/PyKvC2TAD6UtWPFbs0bsEFwWYgeATHSn835nP
   UnyEcTSZ/gVwSw1s5G3V8c/2/srj29Ue0UMUvHUlreN0ePySUQzuivxm9
   1SjgA+buhmxcy+e8X6hhD1i4lrUUi6n0xY79TcJ2qfwXWt1eexymxVhO0
   fdOTqHx/BzXIAmzMjKAQ98ZhM7FDM9mMiVgSJ6A+7m2mVPYwLteNrfHyT
   kdF0ATaMoxbxWzcoh0MBfcVlor/ZfQtQpzbpcx6F5o9qjwmioKGnvm9U2
   P8XA0ouzoiwr4wDNgleP0N2ENuIbcOqQ9kifIKgS89uvrBQ44/IprM1Kl
   w==;
X-CSE-ConnectionGUID: xdpgZQ87TLyj8yC0FgTAWQ==
X-CSE-MsgGUID: 7u9PtVgQRlGy4th6SFWg6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1575262"
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="1575262"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 10:14:34 -0700
X-CSE-ConnectionGUID: t1it2UUgS2aO+l0RxnMDWQ==
X-CSE-MsgGUID: YtO+R7BYQT+ryNLT2hV77w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,174,1787036400"; 
   d="scan'208";a="4019395"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 23 Oct 2026 10:14:32 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKIqb-000000000wJ-1yGP;
	Fri, 23 Oct 2026 17:14:29 +0000
Date: Fri, 23 Oct 2026 19:13:35 +0200
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/common 15/16]
 include/trace/events/f2fs.h:2738:35: error: implicit declaration of function
 'get_pages'; did you mean 'get_page'?
Message-ID: <202610231939.xrwtnR1u-lkp@intel.com>
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
config: microblaze-randconfig-r2200-20261023 (https://download.01.org/0day-ci/archive/20261023/202610231939.xrwtnR1u-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231939.xrwtnR1u-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231939.xrwtnR1u-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/trace/define_trace.h:132,
                    from include/trace/events/f2fs.h:2761,
                    from fs/f2fs/super.c:42:
   include/trace/events/f2fs.h: In function 'do_trace_event_raw_event_f2fs_enable_checkpoint':
>> include/trace/events/f2fs.h:2738:35: error: implicit declaration of function 'get_pages'; did you mean 'get_page'? [-Werror=implicit-function-declaration]
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
   cc1: some warnings being treated as errors


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
  2758	#endif /* _TRACE_F2FS_H */
  2759	
  2760	 /* This part must be outside protection */
> 2761	#include <trace/define_trace.h>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
