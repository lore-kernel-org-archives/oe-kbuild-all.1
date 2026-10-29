Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793267384;
	b=XGHqUl6dGXlKdfNrrCXdFzIU6Ut/x3D3rKgUXxuPOWo9AVLS80um+FlwPlZnd1b+XtgU
	 WI2/Rn22VBzeHrsDQ99ryJ24tBt3Td/i5qdHyzaLg/njK9NgXtTjQL5J9UlLdGuEfj87d
	 +tnSJYTbDbjCF/yazaYez7RjPBe7qjVBmygZqVUsrkAXVoCTC3udO7OAKFRVODAvXVUCw
	 dtF2otVKfXe6B6H5MeGEyVj/i6y8BJmwAyaJCcn1Oqro64gxX/WqnBt7nIxhGCvWgy3Wu
	 MU/Hpb1xB/9avY13GuCfOJw0elrEn17b4bSOjYPbGhAdbjWhf4QvujFu61hvqRuyoZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793267384;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7A/e2CVZPB1B4o5fReieiwEgrH3inu/+ZJClj3ViNgA=;
	b=VU1TI+RoFL06QsbQQeERlIRKksfZhQMJE2x7x0lMoxBvaKxWvIL5jVfnNVRismgHPxw6
	 wix0RQOGJNN/yHrtqVCRfto0k0ysKkhELjhogXEeiGtrou7h7PIT46P/DDH1VujBZckJG
	 +v+o+WLJ5wi4bVJyZlBeaelGgK8fEE7+XqG6nSE+EuRxZyBVp8nfN+f0gAI19ajM7uMbN
	 H4JnRG46UwoDVpt3EYczMZMkaJHAp6rOX2aZ3OsTw95+spj/Mu4I0E9v9KGRVtJDRxpjP
	 MDROSWCnKO6j6DaHuEAOGxejmfXKo/5M1VjAson0Mgzx8nJjFAlQx8TEYKqD7eVKGMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UOrfhdgo;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E020606A31A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 09:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1E020606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UOrfhdgo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793267382; x=1824803382;
  h=date:from:to:cc:subject:message-id;
  bh=fj19YMMmxSwN1vocUI33kHeRfuu7dLy2zKuEapReTHs=;
  b=UOrfhdgon7YymbaxGqpupdutEQWTLxcc4dIdazGAzTPTRuyF2JbGyCR6
   SEtlmpvs5g3Ch89bzwoXU+UaQJebFuVmJBMKgQmucJmvdxdCVDUM7yzVY
   E+7QL6GbP/RURovDinKlPXFezdVokEv8RZ25NKsk5ziyicXYbqQ1MR2MR
   +6InHcMpNxKsYXnO5HEO2zDotk5feNYtM75My2+E1FFrIy5Tz5lm6DF5A
   zmUW1OtaUaQmY2IAXOB+JTTqXY57yXGA6XD5bvlHt1AqeKku19NB91vpp
   jFsAafwAYnrz6f5TauhCNaD3Xj6xX/d1ntoXiherNBfx4DP39jpe5AhkB
   A==;
X-CSE-ConnectionGUID: IE8yxw13Tg6+6n/I8qg+Qw==
X-CSE-MsgGUID: uchk7XNwQFuFGnxRL1EUhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="2021444"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2021444"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 02:49:42 -0700
X-CSE-ConnectionGUID: wtiyghDMTuyrdV+uKTgO6w==
X-CSE-MsgGUID: vIUmUC5kQ4KDqSUkJob92w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5188932"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Oct 2026 02:49:40 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMMlO-00000000Zv0-1bzi;
	Thu, 29 Oct 2026 09:49:38 +0000
Date: Thu, 29 Oct 2026 17:48:49 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:bugfix/misc 3/7] include/trace/events/f2fs.h:2738:35:
 error: implicit declaration of function 'get_pages'; did you mean 'get_page'?
Message-ID: <202610291714.dzEEWOHB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/misc
head:   df1ed8c6e6ade66abf786248b520f59b8a62e8e5
commit: f73f52daa2c47803a5139f277cae951aea207015 [3/7] f2fs: introduce trace_f2fs_enable_checkpoint()
config: i386-randconfig-1001-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291714.dzEEWOHB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291714.dzEEWOHB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291714.dzEEWOHB-lkp@intel.com/

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
