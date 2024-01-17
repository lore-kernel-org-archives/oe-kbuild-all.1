Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1BDB662
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 07:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705476496; cv=none; b=Ald2Gr8jt3MDfjVg3YAA4btiUDxz80l/M61RMD8u/DecH9VAvX2FOJWSBDlx/aSd/P/SduZeKrvRiWq7LIWLQCTJ9p8st6oOSST++jg86r+4XfhGN1pc+0QIjTnYOW7GVlgNezsSbTMZBQ8/JodMipVAQkH1BxQt3d0pCqt0H9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705476496; c=relaxed/simple;
	bh=WCAP34ifVVrebyuULA1gmoH/Hd24nJzMReStTERK51g=;
	h=DKIM-Signature:X-IronPort-AV:X-IronPort-AV:Received:X-ExtLoop1:
	 X-IronPort-AV:X-IronPort-AV:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	b=CfouZu29EUYB9RjBR3m0VRIQR4yRGgprOBpsLxG8GS2yOzFS+Ap5ufav/e70/rgLYqnFI6rkR1s925QAn341qzTc0D6NwlV2V2yF0nQhBjakVpeGXZ/PXpue25+vj39uTG9v+h0P2EexejkNTvA/IYvfC4RMGA+PjAH5wnllFQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MRukyWHX; arc=none smtp.client-ip=192.55.52.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MRukyWHX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705476494; x=1737012494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WCAP34ifVVrebyuULA1gmoH/Hd24nJzMReStTERK51g=;
  b=MRukyWHX9MOMEPgSBhjCkKb6EW0KZGaswtI52TUdTT92Wrwd/cIvyxgl
   B3daiiWBFMDWFhnHcwOWIfIeT0ZkfAslZ3h8kEkaPfoz/DYCvOyV1BPW2
   LEg1FEMm0m6Xs34AqXPStSYDbJPsd5R07H4BPem3p8MM683a+0UszKvOz
   25ZHJN31vpvtO/lQXYaJhdOHLFXE+ruFetC1Qi8wCSNxxrkn9YgGAGwwq
   XgEAArHF95HfvhWP7JUOr9gGUIQ7Hi9FGymSqwi3wWDzixOM3p1zT4iyC
   71zIxuQCxWoy+jZg90Qvwj9JTiVk1xq0cPfpvW9w1iOHLADg0EhCTdExw
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="397252686"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="397252686"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2024 23:27:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="787714221"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; 
   d="scan'208";a="787714221"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 16 Jan 2024 23:27:50 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQ0Ky-0001kS-0l;
	Wed, 17 Jan 2024 07:27:48 +0000
Date: Wed, 17 Jan 2024 15:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.1 157/175]
 arch/arm64/kvm/hyp_events.c:134:6: warning: no previous prototype for
 function 'hyp_trace_init_event_early'
Message-ID: <202401171536.gvFq9khD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.1
head:   00d46b7d4ac191fcc28b0ea7cbdb8611a8628fce
commit: c000ecee29196ed7412f2bdef7a35c7f8e2df5b5 [157/175] ANDROID: KVM: arm64: add support for early enablement nVHE hyp events
config: arm64-randconfig-003-20240116 (https://download.01.org/0day-ci/archive/20240117/202401171536.gvFq9khD-lkp@intel.com/config)
compiler: clang version 18.0.0git (https://github.com/llvm/llvm-project 9bde5becb44ea071f5e1fa1f5d4071dc8788b18c)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240117/202401171536.gvFq9khD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401171536.gvFq9khD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:9:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:14:1: warning: no previous prototype for function 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      14 | HYP_EVENT(hyp_enter,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:59:1: note: expanded from here
      59 | hyp_event_trace_hyp_enter
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
   In file included from arch/arm64/kvm/hyp_events.c:9:
   In file included from arch/arm64/include/asm/kvm_define_hypevents.h:27:
   arch/arm64/include/asm/kvm_hypevents.h:23:1: warning: no previous prototype for function 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      23 | HYP_EVENT(hyp_exit,
         | ^
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^
   <scratch space>:64:1: note: expanded from here
      64 | hyp_event_trace_hyp_exit
         | ^
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   arch/arm64/include/asm/kvm_define_hypevents.h:17:2: note: expanded from macro 'HYP_EVENT'
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |         ^
>> arch/arm64/kvm/hyp_events.c:134:6: warning: no previous prototype for function 'hyp_trace_init_event_early' [-Wmissing-prototypes]
     134 | bool hyp_trace_init_event_early(void)
         |      ^
   arch/arm64/kvm/hyp_events.c:134:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     134 | bool hyp_trace_init_event_early(void)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:169:6: warning: no previous prototype for function 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     169 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^
   arch/arm64/kvm/hyp_events.c:169:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     169 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:199:19: warning: no previous prototype for function 'hyp_trace_find_event' [-Wmissing-prototypes]
     199 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^
   arch/arm64/kvm/hyp_events.c:199:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     199 | struct hyp_event *hyp_trace_find_event(int id)
         | ^
         | static 
   arch/arm64/kvm/hyp_events.c:212:5: warning: no previous prototype for function 'hyp_trace_init_events' [-Wmissing-prototypes]
     212 | int hyp_trace_init_events(void)
         |     ^
   arch/arm64/kvm/hyp_events.c:212:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     212 | int hyp_trace_init_events(void)
         | ^
         | static 
   6 warnings generated.


vim +/hyp_trace_init_event_early +134 arch/arm64/kvm/hyp_events.c

   133	
 > 134	bool hyp_trace_init_event_early(void)
   135	{
   136		char *token, *buf = early_events;
   137		bool enabled = false;
   138	
   139		while (true) {
   140			token = strsep(&buf, ",");
   141	
   142			if (!token)
   143				break;
   144	
   145			if (*token) {
   146				struct hyp_event *event;
   147				int ret;
   148	
   149				event = find_hyp_event(token);
   150				if (event) {
   151					ret = enable_hyp_event(event, true);
   152					if (ret)
   153						pr_warn("Couldn't enable hyp event %s:%d\n",
   154							token, ret);
   155					else
   156						enabled = true;
   157				} else {
   158					pr_warn("Couldn't find hyp event %s\n", token);
   159				}
   160			}
   161	
   162			if (buf)
   163				*(buf - 1) = ',';
   164		}
   165	
   166		return enabled;
   167	}
   168	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
