Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FDA5254855
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 12:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358502; cv=none; b=GGA48R/iEqRHzvaeSkPSnU1Los/yM7k8XHfKc6hl5i3vuBFx58MigpZBY7Xum15mufd6aRTbE6shrubz4njHpa/je+QneOX9I5vJ1fkedLYXoMY/PcC4xXedq5PV1vaOH2aCKPIsuh+bwa1GXZaS7Qb3DBakaI6JhM3Ebm4KOVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358502; c=relaxed/simple;
	bh=5nW9JRN69m9kdhveIMKasd5vhnMw/sX/sOevpN8uGkA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DeUdKe7YddInutcH6ZDzrLC1uqcN4mXynN7dSZGroN2jXur9ePB2edVInV7JT8Jbrt0GV4YGZJcvPzGEazuWq61KxpCWTYucdVRLA6XuMoX3ceiUgsvXNrc0jPygvhvpSW5PXrwv7eNaGpV2icSv9hfB6BnBPTJxiai4F5wcjqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iabFuste; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iabFuste"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760358500; x=1791894500;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=5nW9JRN69m9kdhveIMKasd5vhnMw/sX/sOevpN8uGkA=;
  b=iabFusteN53El6s4GYgaI86JIIM9Gg/Yd5zs++NXt0TLtELynmy5/y0J
   32gTmY2Uvcz+Y1/wNevfaPqk5HU6VIPY8vAPvvIYBUmGUqZGpxgmnla71
   /vGTCMQq9Yw+Lt1XH7228Y+S7ZGrHO96MtVECipMsuIQH2cxpkLkJ/jfm
   NxrNCO+R7AmZUlh8PrNClcSJrSXhJ1+Pb0dO/j9xG9FAouVCZbNo8NU/h
   jkXlONcgSiFB/vHggYCJVkhxAo72fYByde7tWhi1Vv6qOCPud2MdM8ZXn
   sVrBZ7P66ZMu4e4+Pr9o7ByVkOHEVktsEuRKwkCBju73iX5ZF9kMU9+jy
   w==;
X-CSE-ConnectionGUID: 2pyya9GqQFq1OE5EIWf4fQ==
X-CSE-MsgGUID: ZNTWRN4mQlW8mYr4weqgbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="79937204"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="79937204"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 05:28:19 -0700
X-CSE-ConnectionGUID: G8NxeLCjT42oBXmLu1ik7w==
X-CSE-MsgGUID: zqflzLanR9q466CtVHg/cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="212544865"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 13 Oct 2025 05:28:18 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v8Hey-000000008sf-2g48;
	Mon, 13 Oct 2025 12:28:16 +0000
Date: Mon, 13 Oct 2025 14:27:19 +0200
From: kernel test robot <lkp@intel.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/rv-reactor-signal 7/9]
 kernel/trace/rv/reactor_signal.c:71:13: warning: 'rv_reaction_sigbus'
 defined but not used
Message-ID: <202510112330.laeKZR4O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/rv-reactor-signal
head:   5f1e83d0ead9b8fc09102bea3ac5c9c87daeb8a9
commit: a76f73540c61e3be2a51a2461888479973f5029c [7/9] SIGTRAP
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20251011/202510112330.laeKZR4O-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251011/202510112330.laeKZR4O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510112330.laeKZR4O-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/trace/rv/reactor_signal.c: In function 'rv_reaction_signal':
   kernel/trace/rv/reactor_signal.c:53:17: warning: function 'rv_reaction_signal' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      53 |                 vsnprintf(message, sizeof(message), fmt, args);
         |                 ^~~~~~~~~
   kernel/trace/rv/reactor_signal.c:60:9: warning: function 'rv_reaction_signal' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
      60 |         vsnprintf(work->message, sizeof(work->message), fmt, args);
         |         ^~~~~~~~~
   kernel/trace/rv/reactor_signal.c: At top level:
   kernel/trace/rv/reactor_signal.c:79:27: error: 'rv_reaction_sigtrap' undeclared here (not in a function); did you mean 'rv_reaction_signal'?
      79 |         .react          = rv_reaction_sigtrap,
         |                           ^~~~~~~~~~~~~~~~~~~
         |                           rv_reaction_signal
>> kernel/trace/rv/reactor_signal.c:71:13: warning: 'rv_reaction_sigbus' defined but not used [-Wunused-function]
      71 | static void rv_reaction_sigbus(const char *fmt, va_list args)
         |             ^~~~~~~~~~~~~~~~~~


vim +/rv_reaction_sigbus +71 kernel/trace/rv/reactor_signal.c

b9d5e7add1cc88 Thomas Weiﬂschuh 2025-07-03  69  
b9d5e7add1cc88 Thomas Weiﬂschuh 2025-07-03  70  __printf(1, 0)
b9d5e7add1cc88 Thomas Weiﬂschuh 2025-07-03 @71  static void rv_reaction_sigbus(const char *fmt, va_list args)
b9d5e7add1cc88 Thomas Weiﬂschuh 2025-07-03  72  {
a76f73540c61e3 Thomas Weiﬂschuh 2025-10-10  73  	rv_reaction_signal(SIGTRAP, fmt, args);
b9d5e7add1cc88 Thomas Weiﬂschuh 2025-07-03  74  }
b9d5e7add1cc88 Thomas Weiﬂschuh 2025-07-03  75  

:::::: The code at line 71 was first introduced by commit
:::::: b9d5e7add1cc88d34c4a0c36c25fd8ceeeebe0e4 rv: Add signal reactor

:::::: TO: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
:::::: CC: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
