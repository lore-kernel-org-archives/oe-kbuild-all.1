Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658E72F83BB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Dec 2025 10:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765621412; cv=none; b=Eg9FWfMKVpf26g3O7Myn1HNEhRiQqbjGNiuk5tmI4l6J1RDq1jPstGpnn7WWFrdaI89bErG+VpIA8kILBlme5bc1NDurFgCNMjCX6DzJdTbTor13QH1v8drbHt16RNlbhKNdhrPcTcUFEwRTsrDA3CI7tIdFJNpNbrOClXgS4Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765621412; c=relaxed/simple;
	bh=jniVvrowmgVe+XHpegflumYeby/BMJYRXilVI+v65L8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IYnnCjB7Rs5Be+B70xasZJD/UGxC/5/lRO9RvY70VbblkQkkxZr6ZP9OO9C22mT2y80fQ9RxJvtdaKI2K5Kdl9UGviUTHVcp7Te88mzHV+MxfC9zv6FW0tF1ql3mAXTosMGukdptir+0w3ptky8m7FlmyDDSRkI4t+z305DH9Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QZYAO1+Q; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZYAO1+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765621410; x=1797157410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jniVvrowmgVe+XHpegflumYeby/BMJYRXilVI+v65L8=;
  b=QZYAO1+QTeFjsprFx3zKAyQeRGFcnlrL/5oW/PlbenNW0PQPdaiRtg4v
   mdT+4zrqB7JhuxGhYd5QAgixfQKbnTuu0PkgQYxVlbmIJ3Am8R/3W8tgx
   N4uFnwurJTt1lmjx0GNEvdoRTyKaVskrR6J9CCUE9lJ7Nv9H4wisLRkdH
   gu/VuGa9s/eoX4EbtGLDZa022xH3tm9cCa8hSg/UMs/PfPq5cSVN2V17t
   exc/U1dW5jXIatJMVRUIZBfDg8FpMul1YTl95U3z/RRb55PWJMN+T1dUV
   ZGNcgHlxJiqOs/vAvffC/utwfgPPY4AVmR3bxaYBGx+XVZqdB7J9MkgXv
   w==;
X-CSE-ConnectionGUID: BUT61827T++N2ie8I3WVDQ==
X-CSE-MsgGUID: h23H/Cf4QqW8TrXCJsItEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="71456922"
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="71456922"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 02:23:29 -0800
X-CSE-ConnectionGUID: v0HcxcYoRIup8IgmxC3eFA==
X-CSE-MsgGUID: AOIig4aNQ7Ov5y7UXKpzAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,146,1763452800"; 
   d="scan'208";a="197051762"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 13 Dec 2025 02:23:28 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUMmc-0000000021g-2HV8;
	Sat, 13 Dec 2025 10:23:26 +0000
Date: Sat, 13 Dec 2025 11:22:32 +0100
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 50/50] mm/memcg_zombie_reaper.c:47:6:
 warning: no previous prototype for 'memcg_reap_background_set'
Message-ID: <202512131103.lLkJBCG2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c285f40a964b427534f3dab33b104ee9cab6245
commit: 9d805ccab1e8f43af37cb84b5795c7501e772dff [50/50] anolis: mm, memcg: introduce per memcg switch to reap zombie background
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251213/202512131103.lLkJBCG2-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512131103.lLkJBCG2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512131103.lLkJBCG2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memcg_zombie_reaper.c:47:6: warning: no previous prototype for 'memcg_reap_background_set' [-Wmissing-prototypes]
      47 | void memcg_reap_background_set(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/memcg_zombie_reaper.c:53:6: warning: no previous prototype for 'memcg_reap_background_clear' [-Wmissing-prototypes]
      53 | void memcg_reap_background_clear(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/memcg_reap_background_set +47 mm/memcg_zombie_reaper.c

    46	
  > 47	void memcg_reap_background_set(void)
    48	{
    49		reaper_kthread_on |= REAP_BACKGROUND_MEMCG;
    50		wake_up_interruptible(&reaper_waitq);
    51	}
    52	
  > 53	void memcg_reap_background_clear(void)
    54	{
    55		reaper_kthread_on &= ~REAP_BACKGROUND_MEMCG;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
