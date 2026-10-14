Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E228325B091
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 Oct 2026 00:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791937503; cv=none; b=BeKF8bGgSjpROXvu9rkmVVgffa+tEY4250AalnMNYOE03vxcKMvQn6is2iZgPh0Tbsf0Ib7j+mAWrt6NyKnkMLR2ZhG5L7K36gWIZ2tEcpQDeJXSsET0VaXPR50s3g4aDOx3QFryu4QspwEyNZ+pXXnBywd9YEi3I44GM1wDcTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791937503; c=relaxed/simple;
	bh=bQMPtMBNAOARJNXfCWES7/V0rdhGr54+C90xoUGFpE4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kjDDSpYxGHu9aDIBMUpWNjk0x80ZRFCsiqqgO0OpCMDmNKc09yvXcqj1i6kHew6N4btMy2iFpQ3sW5oH7doQMFQfi36B0Or5Rcr6hWbCeD8mkwWTouMeVGa67+hyMWXo0T7SyqL8buVJ2qokw6Woyyf0LKGSTAgcCC16IWev4mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=edProNdY; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="edProNdY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791937498; x=1823473498;
  h=date:from:to:cc:subject:message-id;
  bh=bQMPtMBNAOARJNXfCWES7/V0rdhGr54+C90xoUGFpE4=;
  b=edProNdYztHKGB3pL5MSpySClnPxwmlDK46/KrK+kuVm94qIP96R1gEx
   sAIB7+s2+BmTzf1sitQ6Vlmq1Ik22ELvOmhy7CSnVoRQm7F2T3d1lIds5
   yGjBusI0f9DVRJfte8sm3OI3OIPb9GQJ40voTIXhLlqfPu5SNeqrk+9kC
   CsiMvNyNKxY7CtpDqBr1WP4U/FmjJDrSXbgm8FLqgi8nHPMtdkJji9Bbl
   GJSAm0Bhu0CPAGCvP19sfnYepIt1Bf4tACuaOM+y1DopSBCVDsFfSVRd6
   Epd0Y+kIcUEKIQpMTQIYncCrMGgCZvuLkdsoqHHoC/PUW0H/AiTIHHL7i
   A==;
X-CSE-ConnectionGUID: H0xH/57VQb6M512ZzOV6TQ==
X-CSE-MsgGUID: eTxJx7qCQhqLfkTJeG+Ckw==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="580961"
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="580961"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2026 17:24:57 -0700
X-CSE-ConnectionGUID: WEJsGnrRTDmTRoUS2Gov4g==
X-CSE-MsgGUID: KaHak2foTBGGS3ltcfIwnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,156,1787036400"; 
   d="scan'208";a="3066616"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 13 Oct 2026 17:24:56 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xGmnd-00000000AmB-2wDE;
	Wed, 14 Oct 2026 00:24:53 +0000
Date: Wed, 14 Oct 2026 02:23:57 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 20/20]
 kernel/sched/core.c:198:35-53: opportunity for
 str_enabled_disabled(sched_proxy_exec ( ))
Message-ID: <202610140202.z0KlXk2k-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   f6007b8a95335ca4a32dcf17f7250bf132fc56f1
commit: ab57c5d354dad6e7eebcb10a7c831f4d36d658a8 [20/20] ANDROID: sched/core: Improve boottime output so we can detect if proxy-exec is enabled or not
config: i386-randconfig-2101-20261013 (https://download.01.org/0day-ci/archive/20261014/202610140202.z0KlXk2k-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610140202.z0KlXk2k-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/sched/core.c:198:35-53: opportunity for str_enabled_disabled(sched_proxy_exec ( ))

vim +198 kernel/sched/core.c

   193	
   194	static int __init setup_proxy_exec_toggle(void)
   195	{
   196		int retval;
   197	
 > 198		pr_info("sched_proxy_exec: %s\n", sched_proxy_exec() ? "enabled" : "disabled");
   199		sched_proxy_exec_kobj = kobject_create_and_add("sched_proxy_exec", kernel_kobj);
   200		if (!sched_proxy_exec_kobj)
   201			return -ENOMEM;
   202		retval = sysfs_create_group(sched_proxy_exec_kobj, &attr_group);
   203		if (retval)
   204			kobject_put(sched_proxy_exec_kobj);
   205		return 0;
   206	}
   207	late_initcall(setup_proxy_exec_toggle);
   208	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
