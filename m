Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B42A73859E6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 17:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777742674; cv=none; b=aWZ7aqZDyPKSzpnJo400QgEwUtPa9mgh/kheC22weQn6yGReuXi3RnDmS3gQEXFJkP9uWZqZQjw8zKEdyqrlC3p3VhYWrxOkEUQ1wtLMsILFskfrDeKxyLxfofJRBili7HU9n+XLA4h1yDAY36kwq6zbwrNgJRX7I9dG1T1VOp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777742674; c=relaxed/simple;
	bh=EGnwQsE6P7jCBjM0G5aU1z8kq2t0VK2VjkNSKsTI7V0=;
	h=Date:From:Cc:Subject:Message-ID; b=sfOZYr1tHf3GawU4DrnGFOtRkuIj0+od3PgM6LzPqVXrou6xcDXWcyyacEcUF2m6S+rti/z3ndyZscvbVUhDezbWXS8gMKmARQ0V+r8rF+gvrruMpRSjfwPzJw2rVFE5WaMqAVoajQD7KATOFHoRmlVN5oBpowaKDlU7IrgjAOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gnMZUj24; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gnMZUj24"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777742671; x=1809278671;
  h=date:from:cc:subject:message-id;
  bh=EGnwQsE6P7jCBjM0G5aU1z8kq2t0VK2VjkNSKsTI7V0=;
  b=gnMZUj245bKYBXMglUUT+VarMnyypZtf0gGo1rW2pKqVRYTbsBMs1Eaz
   4oT/orAfyV8xm9Ys2AY/A91LIoftJshftSb8fgZk6tVkwsMzCsi40kn1S
   ambJQiGClVBuSpiYBZwqiMjhczC4eXrewLsqq9ryoVGrhzw6pXwfpAi3Q
   abWzJBmXtDjzWbKpbJYP38KLZ/3uObd8dfjwDqyp4LkptolbcWTAjVo9F
   LebGUbaXVze6MXFT1txJ0P8vqQFJEZP7mAYNy7ysNZ5HKEG8BUgFhH6Co
   RlUJ6CMq+KK64GdOPtBnEW3Nl4rJzmXA0riv9iXZ5YHwbcUyj2r9N08zi
   A==;
X-CSE-ConnectionGUID: WdDeVwpkQmm28rrmeJMmug==
X-CSE-MsgGUID: 5mjsuRTsSDW1bRc91jelCw==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="77690839"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="77690839"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 10:24:30 -0700
X-CSE-ConnectionGUID: vVwE1Am3S8qq/8IQ4D2Xjw==
X-CSE-MsgGUID: Rroz5eB1QkmGOZFgB7wFbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="228639273"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 May 2026 10:24:29 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJE4o-000000001ep-3nq8;
	Sat, 02 May 2026 17:24:26 +0000
Date: Sun, 03 May 2026 01:24:17 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Intel Wired LAN <intel-wired-lan@lists.osuosl.org>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Sridhar Samudrala <sridhar.samudrala@intel.com>,
 Larysa Zaremba <larysa.zaremba@intel.com>
Subject: [tnguy-next-queue:dev-queue 4/145]
 include/linux/intel/virtchnl.h:480:30: error: enumerator value for
 'virtchnl_static_assert_virtchnl_irq_map_info' is not an integer constant
Message-ID: <202605030146.fEzMWDym-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
head:   03bfd1fd4cea5b5be0d50475802a29a8de476969
commit: 02f11e95790d60c0713cceb05399ca93da4e0093 [4/145] virtchnl: create 'include/linux/intel' and move necessary header files
config: arm-randconfig-004-20260502 (https://download.01.org/0day-ci/archive/20260503/202605030146.fEzMWDym-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260503/202605030146.fEzMWDym-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605030146.fEzMWDym-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from drivers/net/ethernet/intel/iavf/iavf.h:40,
                    from drivers/net/ethernet/intel/iavf/iavf_adv_rss.c:6:
>> include/linux/intel/virtchnl.h:174:43: warning: division by zero [-Wdiv-by-zero]
     174 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                           ^
   include/linux/intel/virtchnl.h:480:1: note: in expansion of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     480 | VIRTCHNL_CHECK_STRUCT_LEN(2, virtchnl_irq_map_info);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/intel/virtchnl.h:480:30: error: enumerator value for 'virtchnl_static_assert_virtchnl_irq_map_info' is not an integer constant
     480 | VIRTCHNL_CHECK_STRUCT_LEN(2, virtchnl_irq_map_info);
         |                              ^~~~~~~~~~~~~~~~~~~~~
   include/linux/intel/virtchnl.h:174:60: note: in definition of macro 'VIRTCHNL_CHECK_STRUCT_LEN'
     174 |         { virtchnl_static_assert_##X = (n)/((sizeof(struct X) == (n)) ? 1 : 0) }
         |                                                            ^


vim +/virtchnl_static_assert_virtchnl_irq_map_info +480 include/linux/intel/virtchnl.h

62683ab51e487fb drivers/net/ethernet/intel/i40evf/i40e_virtchnl.h Greg Rose         2013-12-21  479  
5e7f59fa07f86f5 include/linux/avf/virtchnl.h                      Alexander Lobakin 2023-07-28 @480  VIRTCHNL_CHECK_STRUCT_LEN(2, virtchnl_irq_map_info);
5e7f59fa07f86f5 include/linux/avf/virtchnl.h                      Alexander Lobakin 2023-07-28  481  #define virtchnl_irq_map_info_LEGACY_SIZEOF	14
73556269aab30c3 include/linux/avf/virtchnl.h                      Sridhar Samudrala 2017-05-11  482  

:::::: The code at line 480 was first introduced by commit
:::::: 5e7f59fa07f86f554c301c7a383bba54d5ef9819 virtchnl: fix fake 1-elem arrays in structures allocated as `nents + 1`

:::::: TO: Alexander Lobakin <aleksander.lobakin@intel.com>
:::::: CC: Tony Nguyen <anthony.l.nguyen@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
