Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC5E19DFB4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 15:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729783924; cv=none; b=pZJYo3r2aZxIKoJlEPUxmG5X0yKLI7/QYDsdQnvzr17Aa71x1pghyGKt3iXjYZMEQBfsjWQHUup7ywJASOnoh8aj0SHkOrexRzSUqlwwCVg+CpMmRx1Eas1rVMMQ3yhmSxr+6XQQ9FgEP1VQW0DIBFLfd9K1E/mtV+uqtxIIvSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729783924; c=relaxed/simple;
	bh=jiAglY022TxIzOFWR4Cs+um+qbTZOcvrs36WPTEPrpY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X1JC54aXoZapJ8M/nCsOW6WBuIE1DjsIpdi6Ep5bRG5pJORghnTlw34OhjtC92YeOradeWbP+1oHdWZlvU3ST8vAmmuuj+V5t2d2a7MB7tBdOGqIiIM72+F3hIq8L9S50ISO7v3RhlI2PDwb/895LUYPZhhu0bU/342uFhNc8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KuczX+ch; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KuczX+ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729783923; x=1761319923;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jiAglY022TxIzOFWR4Cs+um+qbTZOcvrs36WPTEPrpY=;
  b=KuczX+chDSKnehd7PDXnIqDeKKcm6XSWvl4++dRpA6JzOV44V6wg77CN
   NedGF2vyJA3lC5YIvIMXyCSo4xenc9Mw9zt7h9wCZBQ8Ot8X/UY5oxV/w
   egBZgNWninnrG6cScWvO1Bbu2sJRZ+n5z4KCbZU+1Unrx5TQMgHYx+O0i
   /llGLPkLzmvzd8IqiIq4QbmVqlWPbVEWqJYLs0GRsPjCOv32y9eI5vGKV
   1YFq0jV1d3l+cYu2EyIx05698lzPr37RqiBEZPJ3zmqeRu5MRcOIIXrcd
   dVM96Pl3FuuR/O+EE82JzRtzzm6XuGQPuI2uN1HaAwv5Z2oEJpMya4LHK
   A==;
X-CSE-ConnectionGUID: tuquyiHEQd2wcozNiEKWYw==
X-CSE-MsgGUID: XrjmFZQhQa6rREOvQ8mh2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="32277208"
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="32277208"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2024 08:32:02 -0700
X-CSE-ConnectionGUID: RH3n7ADjRveXbenpho5Y5Q==
X-CSE-MsgGUID: 63IU82PCQEG8kuO0lbc41A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,229,1725346800"; 
   d="scan'208";a="103943670"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 24 Oct 2024 08:32:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3zod-000Wam-0z;
	Thu, 24 Oct 2024 15:31:59 +0000
Date: Thu, 24 Oct 2024 23:31:34 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 158/176]
 arch/arm64/kvm/hyp_events.c:134:6: warning: no previous prototype for
 'hyp_trace_init_event_early'
Message-ID: <202410242324.Qc5JoLZQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   7f1ad2ebaa24958e3b0527f36d96e58f42cf3f0e
commit: 898e4d2aa33bd70705040b7c2f485c968cc3d594 [158/176] ANDROID: KVM: arm64: add support for early enablement nVHE hyp events
config: arm64-randconfig-002-20241024 (https://download.01.org/0day-ci/archive/20241024/202410242324.Qc5JoLZQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410242324.Qc5JoLZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410242324.Qc5JoLZQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/kvm/hyp_events.c:9:
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_hyp_enter' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_hypevents.h:14:1: note: in expansion of macro 'HYP_EVENT'
      14 | HYP_EVENT(hyp_enter,
         | ^~~~~~~~~
   arch/arm64/include/asm/kvm_define_hypevents.h:17:14: warning: no previous prototype for 'hyp_event_trace_hyp_exit' [-Wmissing-prototypes]
      17 |         void hyp_event_trace_##__name(struct ht_iterator *iter)                 \
         |              ^~~~~~~~~~~~~~~~
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
