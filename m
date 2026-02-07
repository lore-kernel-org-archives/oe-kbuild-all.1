Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C492D136E3F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Feb 2026 05:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770442653; cv=none; b=YilJJqVj2+0lpnx9Qv8gXy6odIo5CItDGkqYmpjrsoLxfMc1Xw/SdIRkQO/SRoUSuhYFRfC5REtNmpeXPzIhpb9zgEl8dfiJ9AgZ85/L3h3kH5NH4LB0NYCT9rAq7RWSEM+TiuCxxNc1ZPD3A4ApT5uA82Rlu3L4iFSDCBcz/gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770442653; c=relaxed/simple;
	bh=T1Hb8ruxTE/iMnX/kUOeom7I+xtUdNvC8i1h+QZ0uuI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MS3oBE7CE4sMydW4BC5uaJ9MOJXcTSrtVjLqZYfOoseNb9MK3trV3MOln8XXgtGqCHd5vrR/fYGwN++owwjmwGv8/kUXxkVznNnc5aG1Lef6EyvXX9R8jmdW64KhURP1MD1I8knY9XEI2fLoOgKI0mAM1UFsUCmVt5bs9hmrALg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F12kSnr1; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F12kSnr1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770442653; x=1801978653;
  h=date:from:to:cc:subject:message-id;
  bh=T1Hb8ruxTE/iMnX/kUOeom7I+xtUdNvC8i1h+QZ0uuI=;
  b=F12kSnr12dSnCdhwFXQTC120BFj30abEKY74DI762dleCEDKVaxuB2SU
   rh9SaB0L/epToy+EXNXE7EQoaM/rSZcrdTjx53PDVIdpTdcMWSerdynSG
   ghnC9ELeNMSEhtyBG0rc2xacuBGYe/DRWFFFUF3ffjHkoLFG9fzqxE/OX
   3io4g4TzzsXZSRf2MdF5+7cEpXeKDP9G5iiqL+pU/48b26ap+nn4ikCVl
   EnUib8SupdQgzDpc0lXc4THwW7JgWD7TSDw6CGQODBhyGMeHFWsLmnYJq
   1IgJfS1y0pb3ftOgkwj3/Uv60VviEIel3zUdEwkVOWyJuHuMCH7JpOYDD
   A==;
X-CSE-ConnectionGUID: GqQ444B4TgGShuhXWiYmLQ==
X-CSE-MsgGUID: 57d79d4+TMWMfs41iqfpjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="94293785"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="94293785"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 21:37:33 -0800
X-CSE-ConnectionGUID: GUpbqp3GR5eC8XmZS62fSA==
X-CSE-MsgGUID: x/zIwwriQaGXzoncT8/9lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="216039692"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Feb 2026 21:37:31 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vob0a-00000000lRE-4425;
	Sat, 07 Feb 2026 05:37:28 +0000
Date: Sat, 07 Feb 2026 13:36:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android15-6.6 1/1]
 include/trace/hooks/bug.h:10:1: sparse: sparse: incorrect type in assignment
 (different address spaces)
Message-ID: <202602071324.59378wJW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   eeee2f3cb9b462b9954fc31022a42fe014fbdc24
commit: b526ca121f119fffadb6f92056861047326a340e [1/1] ANDROID: bug: add vendor hook for bug trap
config: i386-randconfig-r111-20260207 (https://download.01.org/0day-ci/archive/20260207/202602071324.59378wJW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602071324.59378wJW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602071324.59378wJW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/bug.c: note: in included file:
>> include/trace/hooks/bug.h:10:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct tracepoint_func *it_func_ptr @@     got struct tracepoint_func [noderef] __rcu *funcs @@
   include/trace/hooks/bug.h:10:1: sparse:     expected struct tracepoint_func *it_func_ptr
   include/trace/hooks/bug.h:10:1: sparse:     got struct tracepoint_func [noderef] __rcu *funcs

vim +10 include/trace/hooks/bug.h

     9	
  > 10	DECLARE_RESTRICTED_HOOK(android_rvh_report_bug,
    11		TP_PROTO(const char *file, unsigned int line, unsigned long bugaddr),
    12		TP_ARGS(file, line, bugaddr), 1);
    13	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
