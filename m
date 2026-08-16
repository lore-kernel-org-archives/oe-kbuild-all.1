Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E5C17A30A
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 19:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786909050; cv=none; b=nxmayGJXMuQz8QJLGf7FR+WRVa0nllmF1OAFx6oPfjHmMw/O82DkpwxAiFCKgeKlGHgRmzHWU635f2yrO/uMogZ9t3UMl/CjDsWDPvu2TWVR5jf0v9kKkAMJ5UvBBoxGpAv/NWvT9yArrVmpTb+msX/hROGU3j6GzaLBLILDN3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786909050; c=relaxed/simple;
	bh=68/6RH2HBE6G7yzzP1OB/BbzALgWVRz+F9jwjG+eCcU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Oiz51KPbfMQqkNJ+B9uxwNYPyA0AU8PCJURfXqllQ80FOMelK5CQQe8KPzf6nG5vLkTawHLhFEJIEjfoxGvxcoTDURm/WIRpBkHB8JFa5PBB1ZxRt62DuyAh5U/TOYs0ufNRZc5qp9OiaU48AFPoU1gS+N6V3MPfn7aE4YASbtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ns+mXwYy; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ns+mXwYy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786909047; x=1818445047;
  h=date:from:to:cc:subject:message-id;
  bh=68/6RH2HBE6G7yzzP1OB/BbzALgWVRz+F9jwjG+eCcU=;
  b=ns+mXwYylidT0W7kuHw4ALT8tCvEOBYW/fW90hw4RBHgI1b1mw/9CoWy
   N79sYjuZOciaCk2QLHkv3Ni2qhXGG9exaXaC/lybnkV37xnQsWqfDC8Bo
   s5f7JossJDcBo71QsGEWXNVducHdJvI2s91BwKFMGSeMDJILAml8iLp6N
   cf9deZoR7lK6iq2KcMvFauxJxdxS4MSVfaPX8TG1o9Ru4LYPbVqN7HbeH
   JFA4J3Jly+Da5sSAsVm+GsZ0Fnl3IolhNB9xPkfsb/fop0A4sDchAgEfM
   bBlBbzLpT73pxSkQ2c+v/eBTp4EjmUBRF1R6sS2pdHe1urDFrrpGrgEUB
   A==;
X-CSE-ConnectionGUID: NvgS+b6SRyyQnoJcvg3VuQ==
X-CSE-MsgGUID: yELxkjJ2THSPa3idTnRwsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11877"; a="87413372"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="87413372"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 12:37:27 -0700
X-CSE-ConnectionGUID: LvjQJcpIQeKXObox5qT6lw==
X-CSE-MsgGUID: jiUGsPqKT6Wf1KuhdZzMag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="262961491"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 16 Aug 2026 12:37:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvgfb-00000000d4c-1S23;
	Sun, 16 Aug 2026 19:37:23 +0000
Date: Mon, 17 Aug 2026 03:36:49 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 2/2]
 arch/arm64/kvm/hyp_events.c:134:6: warning: no previous prototype for
 'hyp_trace_init_event_early'
Message-ID: <202608170357.BWkU8XT7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   24c059d9e217f32d61570fdbd7eb66bc999657a9
commit: 898e4d2aa33bd70705040b7c2f485c968cc3d594 [2/2] ANDROID: KVM: arm64: add support for early enablement nVHE hyp events
config: arm64-randconfig-004-20260816 (https://download.01.org/0day-ci/archive/20260817/202608170357.BWkU8XT7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260817/202608170357.BWkU8XT7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608170357.BWkU8XT7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:9:
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:7: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      17 |  void hyp_event_trace_##__name(struct ht_iterator *iter)   \
         |       ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:23:1: note: in expansion of macro 'HYP_EVENT'
      23 | HYP_EVENT(hyp_exit,
         | ^~~~~~~~~
>> arch/arm64/kvm/hyp_events.c:134:6: warning: no previous prototype for 'hyp_trace_init_event_early' [-Wmissing-prototypes]
     134 | bool hyp_trace_init_event_early(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:169:6: warning: no previous prototype for 'hyp_trace_init_event_tracefs' [-Wmissing-prototypes]
     169 | void hyp_trace_init_event_tracefs(struct dentry *parent)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:199:19: warning: no previous prototype for 'hyp_trace_find_event' [-Wmissing-prototypes]
     199 | struct hyp_event *hyp_trace_find_event(int id)
         |                   ^~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp_events.c:212:5: warning: no previous prototype for 'hyp_trace_init_events' [-Wmissing-prototypes]
     212 | int hyp_trace_init_events(void)
         |     ^~~~~~~~~~~~~~~~~~~~~


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
