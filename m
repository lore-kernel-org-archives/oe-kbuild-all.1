Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0CC155757
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 03:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775877661; cv=none; b=avAPDpCoFUPAkBL4KqfahxbdfVOydKFcgN2M/Evgv3pRV6Iqsi/LBRuMFqiMNGHMnYgTdekw4Ehg7Xyurs1LuZ/Tcl+AY+FNARQaUa9Iy+QulBxUi8MESjr5NSQwqxlS1yVKDVpp5IbR9UydgGMjxpxeQ43r1Om63KqPEMYWpoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775877661; c=relaxed/simple;
	bh=ymhoBZrhlkv1d/VLwn5flS/kSU0kkT0ldQMU0GVDdSI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ux06CGw9HKVZ7hqn6a1fnY3a7Va7abKBSRvky/WxCATOCOrmgCN6d0UdSYED9TnFnkqKDue9W/tvoDIsLc22dfvg5oykQ/zHjl1D9WnrcKAOhN2rHURjTiBqZtV0P3lNheDCpQgc2WPOJPE/9MST95+N7f46Xq4FquoPrAKVD0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ncBis+/a; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ncBis+/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775877659; x=1807413659;
  h=date:from:to:cc:subject:message-id;
  bh=ymhoBZrhlkv1d/VLwn5flS/kSU0kkT0ldQMU0GVDdSI=;
  b=ncBis+/aesG4P9rEapxioqPq/KU4AcfWqHj59UAELbyfUmcU72NR8j+/
   GJtLPiTpNob+KqfHWlY2xip1im5z8dEJjpGWr6yfiBKEyv7DcWYd5bsEm
   25RVRta9TO+tOmWYU4reMabZgwO7bnK8kpCD5+DavXslOPTug+6lGg1Wb
   rm3IVXvmfaq6VzhChrLqoOaj0bZnRhiOzmua5nkusj95cjHAvdwJ4kAsS
   teMtNzdPcF9jUFBnOg1upiEfkUCYVLomyE0ZL0mt5Rj85dRSgz8+Guxa3
   +1s1iziyEdIIGvpX8IQndtYgD57DIEslZTRrGJ2ZiB2l3AJmkgSZhD4t+
   g==;
X-CSE-ConnectionGUID: WWfHidcuQqylhM3FcHNKHQ==
X-CSE-MsgGUID: PTU9Tow2RLqSJtCmfHb7ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76775770"
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="76775770"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2026 20:20:58 -0700
X-CSE-ConnectionGUID: 3qQ56wFhQkCYP0qIN9cBOw==
X-CSE-MsgGUID: 2sMIAsJ6Q3W7S7rsHIuoVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,172,1770624000"; 
   d="scan'208";a="259733487"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Apr 2026 20:20:57 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBOty-000000000gX-2Ix5;
	Sat, 11 Apr 2026 03:20:54 +0000
Date: Sat, 11 Apr 2026 11:20:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android-mainline-desktop 3/3] Warning:
 net/netfilter/xt_quota2.c:47 Cannot find identifier on line:
Message-ID: <202604111121.MWoMTd7z-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Carlos,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android-mainline-desktop
head:   10c66f822f75b2351fa6d60c873ee39b7219218f
commit: e9b494f04d4f01eca4146d044b6143afde11c3ff [3/3] Merge 2b60145734a0 ("Merge tag 'wq-for-6.19' of git://git.kernel.org/pub/scm/linux/kernel/git/tj/wq") into android-mainline
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260411/202604111121.MWoMTd7z-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604111121.MWoMTd7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604111121.MWoMTd7z-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: net/netfilter/xt_quota2.c:47 Cannot find identifier on line:
    * @lock:       lock to protect quota writers from each other
   Warning: net/netfilter/xt_quota2.c:48 Cannot find identifier on line:
    */
   Warning: net/netfilter/xt_quota2.c:49 Cannot find identifier on line:
   struct xt_quota_counter {
   Warning: net/netfilter/xt_quota2.c:50 Cannot find identifier on line:
           u_int64_t quota;
   Warning: net/netfilter/xt_quota2.c:51 Cannot find identifier on line:
           spinlock_t lock;
   Warning: net/netfilter/xt_quota2.c:52 Cannot find identifier on line:
           struct list_head list;
   Warning: net/netfilter/xt_quota2.c:53 Cannot find identifier on line:
           atomic_t ref;
   Warning: net/netfilter/xt_quota2.c:54 Cannot find identifier on line:
           char name[sizeof(((struct xt_quota_mtinfo2 *)NULL)->name)];
>> Warning: net/netfilter/xt_quota2.c:56 bad line: };
   Warning: net/netfilter/xt_quota2.c:57 bad line: 
>> Warning: net/netfilter/xt_quota2.c:58 bad line: #ifdef CONFIG_NETFILTER_XT_MATCH_QUOTA2_LOG
>> Warning: net/netfilter/xt_quota2.c:60 static int qlog_nl_event = 112; error: Cannot parse struct or union!
   Warning: net/netfilter/xt_quota2.c:200 function parameter 'q' not described in 'q2_get_counter'
   Warning: net/netfilter/xt_quota2.c:200 function parameter 'q' not described in 'q2_get_counter'
--
>> Warning: drivers/md/dm-default-key.c:50 expecting prototype for struct dm_default_c. Prototype was for struct default_key_c instead

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
