Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC633CB8E5
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jul 2026 07:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783582105; cv=none; b=mj4WYe5hvpZpxz2zGCEFwPtObrvhBEi8faPdvbVwzDr6R5Ck/sx6i6NRnLYi5Swd6oD9J7kc5wUc2IUEUP54C35V7T75T9HEQnOq3RNgeLARdYAiMvpy5MxAz71Alz286tqnpiin8QmVc4T61ROAWPHLqoIGmYAFLH4SehLvRYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783582105; c=relaxed/simple;
	bh=ZF6hahlVR6EAxE6wIl6oSfFd/7M7sJI3MCuXLJ9sLCQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=GO25F7Z3cNutmeNSWCFCZ5YHdB2G2vKKNZ8aMzr7l9haoxvuqcoykbe4QMRpH4aslg7g9nUaa+ukJcK2jbGOYGjHf0TkRWf8xd8ZOvz4A2r0LoHUYQk2PF7uCHP6cgEL2UMg7/rzx+Vnau/MtkdfRD09eshr0cPNe/XkOj//JNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jXHsaZ23; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jXHsaZ23"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783582104; x=1815118104;
  h=date:from:to:cc:subject:message-id;
  bh=ZF6hahlVR6EAxE6wIl6oSfFd/7M7sJI3MCuXLJ9sLCQ=;
  b=jXHsaZ23AM1MD84BXWbVaO3tozaEv0nK/EnoyFaKw3x+DO2ZxqNTY3HU
   794r5F55FeR6+cKZ4IY6zXpQdG5emyHeUu0bl7vdRTuasQf7hHF0MnXuN
   1qDsTBaBUcf8vKK9XVdvSJpe/6P5dbzJZAsPdYURLJh8WndqUItROdxR5
   uO29aQXrOQMeYitNBjgscqmh7+A0udwU5Juv4UR40zQsiAuwZTduUjQtL
   WGxFfeM5i24lzVyWXliLRG8T0aMQEQuPTjJXmgyElPlpGgkv0GjE3XiXp
   vjNnBdzXAOB29swaUpXZzEnBwd20MnooyOMh+5D+UbFRZ0VpdImh2eEkQ
   g==;
X-CSE-ConnectionGUID: slR0z62ORfCitaLYaElRLQ==
X-CSE-MsgGUID: hK/Olcp/Ty6Wek01ENaFxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84308297"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84308297"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 00:28:23 -0700
X-CSE-ConnectionGUID: nUY/4AlSTw6YA0WR15rcoQ==
X-CSE-MsgGUID: cgBORSHVS5+nnetqeCkVTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="251852704"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 09 Jul 2026 00:28:21 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whjAz-00000000HON-2QEW;
	Thu, 09 Jul 2026 07:28:08 +0000
Date: Thu, 09 Jul 2026 15:27:54 +0800
From: kernel test robot <lkp@intel.com>
To: Dongcheng Yan <dongcheng.yan@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>
Subject: [intel-lts:6.18/linux 1/1]
 drivers/media/i2c/max9x/max9296.c:35:5: sparse: sparse: symbol
 'max9296_serial_link_timeout_ms' was not declared. Should it be static?
Message-ID: <202607091552.a2uOdoXc-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Dongcheng,

First bad commit (maybe != root cause):

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   5100e1c74efeba843945492f8d5840e6166c0392
commit: baa76709460c288499d118e2daa55ca3df5a6436 [1/1] media: i2c: add gmsl & isx031 support
config: x86_64-randconfig-r113-20260708 (https://download.01.org/0day-ci/archive/20260709/202607091552.a2uOdoXc-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091552.a2uOdoXc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607091552.a2uOdoXc-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/i2c/max9x/max9296.c:35:5: sparse: sparse: symbol 'max9296_serial_link_timeout_ms' was not declared. Should it be static?
--
>> drivers/media/i2c/max9x/max96724.c:37:5: sparse: sparse: symbol 'max96724_serial_link_timeout_ms' was not declared. Should it be static?

vim +/max9296_serial_link_timeout_ms +35 drivers/media/i2c/max9x/max9296.c

2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  33  
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  34  // Params
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08 @35  int max9296_serial_link_timeout_ms = MAX9296_DEFAULT_SERIAL_LINK_TIMEOUT_MS;
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  36  module_param(max9296_serial_link_timeout_ms, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  37  MODULE_PARM_DESC(max9296_serial_link_timeout_ms, "Timeout for serial link in milliseconds");
2445b17eae1d53 Shahidan, Muhammad Shahmil 2026-04-08  38  

:::::: The code at line 35 was first introduced by commit
:::::: 2445b17eae1d5356936a0a598940dfaad469c29d Add serdes drivers

:::::: TO: Shahidan, Muhammad Shahmil <muhammad.shahmil.shahidan@intel.com>
:::::: CC: sys_oak <sys_oak@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
