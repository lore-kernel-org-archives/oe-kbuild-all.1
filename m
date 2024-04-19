Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD8013CF83
	for <oe-kbuild-all@lists.linux.dev>; Fri, 19 Apr 2024 21:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713562716; cv=none; b=CXf5oYRdI7K1v/UdBKEJqBkDhDWIR8hwv+Y93NoExXUqBe/G+dYD5OgWLudxpzdauV4glmaM+mumUG0dl2HHtuOFM8kl7s8fPm0RCNJf5gc4yswLcXll6wCEfUOCCQ5E7U53pHbVbGzxWdEx+jYDJ0ZauulEzGH78PQZcb44PmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713562716; c=relaxed/simple;
	bh=lk4Bzrv4Y9L5KJenSD0rEHYEB9L3XWSH7SS5Z+VYUsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TYNshlS8lt5w7rzZsiPA04cRXp3SCuBLS4GOQNsBnHa340XZnO/O0iTYIRVdPb+3lhRtBaWEtWMsknJRtMUbOSv/RWgCf7P1fVCUd/S3tN7/nhaiR9gMFj1pbUR98zcO6YHiFNrqK7R85ta60r59Ltag/+ASYQp70QwARImQ6Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6qdnAN4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6qdnAN4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1713562713; x=1745098713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lk4Bzrv4Y9L5KJenSD0rEHYEB9L3XWSH7SS5Z+VYUsM=;
  b=D6qdnAN4HHRg0HxfR/Ug1bXj5LHx0Gz9EZTullPIoI2aOhnMIn7Pdecb
   Qmv38pvO+qoYheS1Url3dXIOu1owflFLVBpB4QgUKn82QxJconYuYGseV
   5JdXUaPWMB/W2elER/Ru+SHsSglMgmt/gg5X7P9++ZlIb9PJFYE0UfEuy
   I3dtTsyMqFajVz+GxZLajvlO4f9Nrt7s6hzwqwIS1mCDud65VvEViVuga
   v4iafRzns/rEnxJjTqvklzW5qbbsAgVAqd+CzZmpvB7bM0AV2XNUvTTAY
   mv2on49O358XAzkoylSwqLc8AeoFKN7tfaqGgAgsCD8XLGPOYRDsRgBB/
   A==;
X-CSE-ConnectionGUID: SIqTbYWlTvmnhnx9HLYGDg==
X-CSE-MsgGUID: 3MoyqH7mRBmXAPxup/zuUQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11049"; a="9046733"
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="9046733"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2024 14:38:33 -0700
X-CSE-ConnectionGUID: jmiCFxkZT6aBj16//J1xkw==
X-CSE-MsgGUID: zx1l7ZBBSYuK/P6rsEM5Bw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,214,1708416000"; 
   d="scan'208";a="46742754"
Received: from unknown (HELO 23c141fc0fd8) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 Apr 2024 14:38:32 -0700
Received: from kbuild by 23c141fc0fd8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rxvwD-000ATI-2w;
	Fri, 19 Apr 2024 21:38:29 +0000
Date: Sat, 20 Apr 2024 05:37:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 5114/30000]
 samples/livepatch/livepatch-sample.c:38:6: warning: no previous prototype
 for 'load_hook'
Message-ID: <202404200507.JbeBb2uA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   f8ab733c9440022fd40f3c6d44e18f6ae930dc48
commit: a3cd8c3301c773a031f2dd37474734d1311ec9f6 [5114/30000] livepatch: Adapt livepatch-sample for stop_machine model
config: x86_64-randconfig-014-20240420 (https://download.01.org/0day-ci/archive/20240420/202404200507.JbeBb2uA-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240420/202404200507.JbeBb2uA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404200507.JbeBb2uA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/livepatch/livepatch-sample.c:38:6: warning: no previous prototype for 'load_hook' [-Wmissing-prototypes]
      38 | void load_hook(void)
         |      ^~~~~~~~~
>> samples/livepatch/livepatch-sample.c:43:6: warning: no previous prototype for 'unload_hook' [-Wmissing-prototypes]
      43 | void unload_hook(void)
         |      ^~~~~~~~~~~


vim +/load_hook +38 samples/livepatch/livepatch-sample.c

    36	
    37	#ifdef CONFIG_LIVEPATCH_STOP_MACHINE_CONSISTENCY
  > 38	void load_hook(void)
    39	{
    40		pr_info("load_hook\n");
    41	}
    42	
  > 43	void unload_hook(void)
    44	{
    45		pr_info("unload_hook\n");
    46	}
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
