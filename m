Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822C234BA2E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 19:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761678497; cv=none; b=P8H3O2U+/czr10MTdUzy6Y82bdAZusbHHgurOTFifkD0FyLjPPIkSREwqx9+oVX+rk9olkP5/TjS6tCjgI8+UBaYc7MV/70huf3rOpa1yY4LyZ3+qcYgq1AZoRBi5c3GcVY0g5mg565lYFpi2T6kwz5b61e/HJqpUCvbHpxticU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761678497; c=relaxed/simple;
	bh=2/UBEO3OWA00zksKyx3skJNt6KPrFumxma9R9dUP7s4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eKvy0NV8TyIzNiNMn4BB5nJGEwClIgVRu1p0gBDEDdoo1wM1bliLkh8Zt2ivqS40vXcblF/zMw1X2ehfnwZ0xCp5A2UUIKR0fL9rPIgr16UCaZjWOB82QPZi86Dv7kG/LJ/DAYNRJfE7M8ykIt5Lqf9+5xcJiUKMW02nTbRtNFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RJvlniTw; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RJvlniTw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761678496; x=1793214496;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2/UBEO3OWA00zksKyx3skJNt6KPrFumxma9R9dUP7s4=;
  b=RJvlniTwR533fNJhHYpA9h5h4KVyeDtLIp+6nX8MYzanqI0r/0H4YKpN
   XnAjkB9cS8/fBqcsGOW52dRHB9pAh5JIiSDXe7P1CaFuYmniKgBOC24ki
   xA8jQnpWqMOJ+roYyRcQUQQ02D53Oa/btbU2KJLo25UvsIaDEuBcoaXTV
   W5oSPGu4wlvVL5RBwSQ+WmTpexxjm6aKeqxKB830jugtZNTX7K8fGO/I1
   XvCy/ncrAeGm3ODXbiurg+5vkFu5GMuDFYWlcw4NAL4tWIqCxQIEVe6re
   YtAhiI8BL9SP6TN5Ut2zFmFx/xC+MfROq15zTB9k0aC2A0qCN2ZEJbeWM
   A==;
X-CSE-ConnectionGUID: pGMQd3z7Q0iQrYA32EQ1WQ==
X-CSE-MsgGUID: C8UMeQ1gS4SvHth59j8ytw==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63885695"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="63885695"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 12:08:15 -0700
X-CSE-ConnectionGUID: 3erfYueLQRKyRJXpOf5OAg==
X-CSE-MsgGUID: AS00nihtRZSrc4JiDaRmyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="186189821"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 28 Oct 2025 12:08:13 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDp2z-000JeX-2M;
	Tue, 28 Oct 2025 19:08:02 +0000
Date: Wed, 29 Oct 2025 03:06:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Pu Lehui <pulehui@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3058/3058]
 include/../kernel/sched/stats.h:156:20: error: no member named 'last_waking'
 in 'struct sched_info'
Message-ID: <202510290340.h9hoFwT6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   ab8573e771fc00691b546bfb1b7432ed6b19f9bc
commit: 4c89400decb94cca83aae81bf0838c6a85bb8161 [3058/3058] interference: Add sched wakelat interference track support
config: loongarch-randconfig-001-20251029 (https://download.01.org/0day-ci/archive/20251029/202510290340.h9hoFwT6-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d1c086e82af239b245fe8d7832f2753436634990)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290340.h9hoFwT6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510290340.h9hoFwT6-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:150:
   include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:368:9: note: previous definition is here
     368 | #define __SANITIZE_ADDRESS__ 1
         |         ^
   In file included from kernel/sched/grid/qos.c:27:
   In file included from include/../kernel/sched/sched.h:2131:
>> include/../kernel/sched/stats.h:156:20: error: no member named 'last_waking' in 'struct sched_info'
     156 |         if (t->sched_info.last_waking)
         |             ~~~~~~~~~~~~~ ^
   include/../kernel/sched/stats.h:159:16: error: no member named 'last_waking' in 'struct sched_info'
     159 |         t->sched_info.last_waking = sched_clock();
         |         ~~~~~~~~~~~~~ ^
   include/../kernel/sched/stats.h:166:21: error: no member named 'last_waking' in 'struct sched_info'
     166 |         if (!t->sched_info.last_waking)
         |              ~~~~~~~~~~~~~ ^
   include/../kernel/sched/stats.h:170:30: error: no member named 'last_waking' in 'struct sched_info'
     170 |         delta = now - t->sched_info.last_waking;
         |                       ~~~~~~~~~~~~~ ^
   include/../kernel/sched/stats.h:171:16: error: no member named 'last_waking' in 'struct sched_info'
     171 |         t->sched_info.last_waking = 0;
         |         ~~~~~~~~~~~~~ ^
   1 warning and 5 errors generated.


vim +156 include/../kernel/sched/stats.h

   153	
   154	static inline void ifs_task_waking(struct task_struct *t)
   155	{
 > 156		if (t->sched_info.last_waking)
   157			return;
   158	
   159		t->sched_info.last_waking = sched_clock();
   160	}
   161	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
