Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E09C123BD1F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 09:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768642552; cv=none; b=s6LNE/iq7A0EkJaXsMciKMNLQjEXCMGKmVf0BM5lHSGJ980B7lehXLspaLmtXSHED4oMiEjAlI953wKfY8nEJ4fowi2H7meh41t4hjivIjXWqjtAQnHl6uEXKHQZIzeJCsSqLJQzPbb7HL2z6G7zrdQd5VYiWm8PrGZy0uVKWNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768642552; c=relaxed/simple;
	bh=nFanfIxAgFDwubI9CGybqlXOuykr6IwilV1/tsplGms=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XjLvk64UhPfbJgRAMQ4QCt1RpIqkhRfmtI+gDFBtijR6cgh5px6Z9/OMB3lo2mWqA4JLYrHzYXyvck9kcOSESk83DnetpAEdr/d7em1zDtjdwvpuJIeGok4SGmKSGbvLQL9pxdZtRCSkEmtmlc/Sg0FQG+n/Nf3YO29Ie+NrLjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MB1As0m/; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MB1As0m/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768642551; x=1800178551;
  h=date:from:to:cc:subject:message-id;
  bh=nFanfIxAgFDwubI9CGybqlXOuykr6IwilV1/tsplGms=;
  b=MB1As0m/l+UzrH0aGuPdrkmRuQSyM8oe0e2jlLzhOvdo3XwW5j/YVvIA
   ixyycDfHx1ELTkEDgcH+Enf0je/6QS7Q1HB1zPBtNm/N7Yz78odl4v8Ka
   stJ4ZRsK5Ry7SwzU+JI8BRC0qJifXVpSQnkM4wo2lPxQNSXi2w3FHn7me
   cbzUEJFE7qr7LsgRxSMOHMu0lIYqbJjk3x6vm0yZ6OImUp4SipkqwBP6c
   TP6Bzxrcr3D8oRqWdBt7KpTjCPiktsYivFHb1aWktpYbsb2skweCSfnNK
   qG4ZxarQCm4tn1bcxf+N45mOyvCKcPjWh2CCclPDwCdovp1/3C7vAcHTl
   A==;
X-CSE-ConnectionGUID: 8/K4TDvKS3+7moyAq3vJLw==
X-CSE-MsgGUID: 9e+/MarwTPinIitpiX6rMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="69992011"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="69992011"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 01:35:50 -0800
X-CSE-ConnectionGUID: 7cGqBHjrSXqSrJRNNtm1kw==
X-CSE-MsgGUID: fe8jHwwERFmkT5mnDhTPhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="204598813"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Jan 2026 01:35:49 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh2ig-00000000Lim-3ENr;
	Sat, 17 Jan 2026 09:35:46 +0000
Date: Sat, 17 Jan 2026 17:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 0/1]
 drivers/android/binder.c:7389:9: error: implicit declaration of function
 'unload_binderfs'; did you mean 'init_binderfs'?
Message-ID: <202601171759.FcK68HhB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   ba857eb99ec955367580dc1c301b326e13ef6524
commit: 42393aa5693a216b395461b4edcf1ba46526b64e [0/1] ANDROID: binder: support loading both drivers at the same time
config: x86_64-randconfig-015-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171759.FcK68HhB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171759.FcK68HhB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171759.FcK68HhB-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/android/binder.c: In function 'binder_unload_builtin':
>> drivers/android/binder.c:7389:9: error: implicit declaration of function 'unload_binderfs'; did you mean 'init_binderfs'? [-Wimplicit-function-declaration]
    7389 |         unload_binderfs();
         |         ^~~~~~~~~~~~~~~
         |         init_binderfs


vim +7389 drivers/android/binder.c

  7385	
  7386	void binder_unload_builtin(void)
  7387	{
  7388		genl_unregister_family(&binder_nl_family);
> 7389		unload_binderfs();
  7390		debugfs_remove_recursive(binder_debugfs_dir_entry_root);
  7391		binder_alloc_shrinker_exit();
  7392		binder_remove_trace_events(THIS_MODULE);
  7393	}
  7394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
