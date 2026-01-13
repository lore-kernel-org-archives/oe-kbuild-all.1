Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF5D27B34D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Jan 2026 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768313714; cv=none; b=fR8BatIB9pB4MPXblzTmDP8UJ+1Yq3MRp7x9NMfbjqAjdtNaRkLfXf9CNXGGSXJBzf764szEnHKqmZuKZIahJYecU/WXf3o5AU6KFbuf5fPrcFdXR+9VKPxgFp/4DrqYOHe3dx6wPVzFj9kyptNNyPwZ8OUfS4faWWDgNJapBPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768313714; c=relaxed/simple;
	bh=0+JWtDRalY/zVmhmwDG+rRmLMUmlh2s4s/j3qnggUro=;
	h=Date:From:Cc:Subject:Message-ID; b=FShXuy9Ds8r6sjMB+eR6TrlhaWokzxeQ4PvOGYcu5WdCy/8KandyGdl7rHiDUUZ2NMWgN1fINI1LqPBQEblzjqBanL5DSpo6v0CbQPJQ8HYdBzQ8/Y5nTvjXdiIwgjeoVkNdk31ZcOgy8qcdvQH5J+4+X5QwKCCBIl5xbOncxjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fYM1WS6B; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fYM1WS6B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768313713; x=1799849713;
  h=date:from:cc:subject:message-id;
  bh=0+JWtDRalY/zVmhmwDG+rRmLMUmlh2s4s/j3qnggUro=;
  b=fYM1WS6BDQHVSqdGvpvMCOXgKAp3GTzd27H5XVigb98PQKiMzs753mPD
   nc30KNaM78xX0gFi2gMI87PpCor9Jd4GPmFuSg+SaGIU//5yxc0NfKCzy
   23+8gVViUuynHA7I19ysTXB+vQv6+kofJY9Aa5pBP4YCQi94Drx99pmsE
   JI8Y5zfERUyiSN1z26MqWa14UbC2NANaB9R46lwqHRtlQ2/MwrQNTmij+
   pN531CcNCJOwoQAVxWya8W6qgxKw5aPNNgm7cszAy0MMJ3eC76epJ1g1F
   vPCDfJUt9Jz+4E8fQtowX5CPQvnUCdg0mbhNPCnKci3lkKIWUlT82pr9i
   A==;
X-CSE-ConnectionGUID: 73CYuLsbQbqS5A6fSAg7yA==
X-CSE-MsgGUID: 7/OZV9muRC2dTtY0DcMndw==
X-IronPort-AV: E=McAfee;i="6800,10657,11670"; a="69651677"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="69651677"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2026 06:15:13 -0800
X-CSE-ConnectionGUID: y2FHuNCXSY2Tvzlk7h2Rxw==
X-CSE-MsgGUID: jMdt6H8US5eCvF+TPATxXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; 
   d="scan'208";a="209231978"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 13 Jan 2026 06:15:11 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vffAr-00000000Ett-1lWv;
	Tue, 13 Jan 2026 14:15:09 +0000
Date: Tue, 13 Jan 2026 22:14:24 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: drivers/regulator/dummy.c:59:24: sparse: sparse: symbol
 'dummy_regulator_driver' was not declared. Should it be static?
Message-ID: <202601132238.010kK8PS-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b71e635feefc852405b14620a7fc58c4c80c0f73
commit: dcd2a9a5550ef556c8fc11601a0f729fb71ead5d regulator: dummy: convert to use the faux device interface
date:   10 months ago
config: i386-randconfig-063-20260113 (https://download.01.org/0day-ci/archive/20260113/202601132238.010kK8PS-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260113/202601132238.010kK8PS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601132238.010kK8PS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/regulator/dummy.c:59:24: sparse: sparse: symbol 'dummy_regulator_driver' was not declared. Should it be static?

vim +/dummy_regulator_driver +59 drivers/regulator/dummy.c

    58	
  > 59	struct faux_device_ops dummy_regulator_driver = {
    60		.probe = dummy_regulator_probe,
    61	};
    62	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
