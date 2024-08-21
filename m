Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF951547DF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Aug 2024 02:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724208545; cv=none; b=Xym7ACC2QfseBSqTqlyR5uvqrk4pY7M5HSDlGXrYWt/AZiE4x0Dk6RUtwRMuTr/haO2j47xX842A/WMYY9jl0HTbqYrZLH1MdJlpEkjHwg+yqdfDLkPvHSeoGKJGJY4WxAvMJo8THVhBHZ3XNUybswCJzs5eg2TP9VHcQg6scXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724208545; c=relaxed/simple;
	bh=AhPwvxIfjoV3Z8ZFBOZWDQTKKeXpFuuO8GsSBHgGKWM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Gfw1Uvc0meE9Rbccn+7ox7uiXa77qq+7NumCkkkSmqDB6EregCrnADCLOfPbzipPe1YFwOOhTZHKJt1u6KRER0QD/aLriLMhr6WLixS0r8t+N3eIsPHTCjQSVWS/a/7Q2ziRM+yZY169+HVaiZniC9qMuYaWFbYCijC0ej0mG2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hO9Gay7Z; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hO9Gay7Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724208544; x=1755744544;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AhPwvxIfjoV3Z8ZFBOZWDQTKKeXpFuuO8GsSBHgGKWM=;
  b=hO9Gay7ZFVs88Nk83z+aOldF6XWAaUMZMC4pL/4Ib2WZgF2C1MnjWR9M
   UQmEtrk3dqJzWL/tma+EfpK15C3KWFX7GgT2ftaDnYR7O8cvwmq9qG0k7
   /7GzE/DB7+ucTzHPQUyehy2EaAflhXw8vmXB4T8nILVm2APcj3UbhDxrX
   emRFizXNT9XPndA2Z0mvpKAkapA+Q4B+FOg7szr9X8G7xRMxy5jSYUIHE
   iJ3KpG9Je0ZYAFthQrRL2sDbjuDXrzVhRaJ/xL385w2WhoUnico10oqDL
   cs2IEBTVr9Lp+RSLFCOOzYqrF6bjMWtctt+lRKaPkRpE52hi05kYRbtkz
   g==;
X-CSE-ConnectionGUID: 9dTZgiVcTMGeG8Hdhh2O3g==
X-CSE-MsgGUID: KP/+pHvZSFOmMg6+rqstdg==
X-IronPort-AV: E=McAfee;i="6700,10204,11170"; a="45072730"
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="45072730"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Aug 2024 19:49:03 -0700
X-CSE-ConnectionGUID: JYM6S4fXSk6XsKxVSRL8zA==
X-CSE-MsgGUID: oPaVMg2eTE6iPqOxHBUa2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,163,1719903600"; 
   d="scan'208";a="60905048"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Aug 2024 19:49:02 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sgbPA-000Aoq-0h;
	Wed, 21 Aug 2024 02:49:00 +0000
Date: Wed, 21 Aug 2024 10:48:25 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-trusty-5.10 7844/7904]
 kernel/sched/psi.c:538:17: error: implicit declaration of function
 'trace_android_vh_psi_event'
Message-ID: <202408211048.LZDH3aRM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Georgi,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android12-trusty-5.10
head:   965c5bcac1fe560c973001599bd2364659dc788c
commit: b79d1815c400c3929bb78a209b6e51a38d6ffcb2 [7844/7904] ANDROID: psi: Add vendor hooks for PSI tracing
config: i386-buildonly-randconfig-005-20240821 (https://download.01.org/0day-ci/archive/20240821/202408211048.LZDH3aRM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240821/202408211048.LZDH3aRM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408211048.LZDH3aRM-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/sched/psi.c: In function 'update_triggers':
>> kernel/sched/psi.c:538:17: error: implicit declaration of function 'trace_android_vh_psi_event' [-Werror=implicit-function-declaration]
     538 |                 trace_android_vh_psi_event(t);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/sched/psi.c:546:9: error: implicit declaration of function 'trace_android_vh_psi_group' [-Werror=implicit-function-declaration]
     546 |         trace_android_vh_psi_group(group);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/trace_android_vh_psi_event +538 kernel/sched/psi.c

   503	
   504	static u64 update_triggers(struct psi_group *group, u64 now)
   505	{
   506		struct psi_trigger *t;
   507		bool new_stall = false;
   508		u64 *total = group->total[PSI_POLL];
   509	
   510		/*
   511		 * On subsequent updates, calculate growth deltas and let
   512		 * watchers know when their specified thresholds are exceeded.
   513		 */
   514		list_for_each_entry(t, &group->triggers, node) {
   515			u64 growth;
   516	
   517			/* Check for stall activity */
   518			if (group->polling_total[t->state] == total[t->state])
   519				continue;
   520	
   521			/*
   522			 * Multiple triggers might be looking at the same state,
   523			 * remember to update group->polling_total[] once we've
   524			 * been through all of them. Also remember to extend the
   525			 * polling time if we see new stall activity.
   526			 */
   527			new_stall = true;
   528	
   529			/* Calculate growth since last update */
   530			growth = window_update(&t->win, now, total[t->state]);
   531			if (growth < t->threshold)
   532				continue;
   533	
   534			/* Limit event signaling to once per window */
   535			if (now < t->last_event_time + t->win.size)
   536				continue;
   537	
 > 538			trace_android_vh_psi_event(t);
   539	
   540			/* Generate an event */
   541			if (cmpxchg(&t->event, 0, 1) == 0)
   542				wake_up_interruptible(&t->event_wait);
   543			t->last_event_time = now;
   544		}
   545	
 > 546		trace_android_vh_psi_group(group);
   547	
   548		if (new_stall)
   549			memcpy(group->polling_total, total,
   550					sizeof(group->polling_total));
   551	
   552		return now + group->poll_min_period;
   553	}
   554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
