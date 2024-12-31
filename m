Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AF428E7
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Dec 2024 05:29:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735622996; cv=none; b=sJS/dppgP4585DM4vafjlpSwkWiZ3Yo99x3S9fpxiP2TdpkBEoLEaLXM2CHz7wfrjA8ufletJkMlYV2IWfAfuLU3wz85eo1xoSRcxaRcGbH5hua+k13XPRrfIMQ9CtI6z4hK9oy72+gnHNn+6Gf5z5Osqtixt9HVbcT/DOXLoQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735622996; c=relaxed/simple;
	bh=46MQTabXq5ydAV5SwNjWWjsbyfltdwuq55Fb2CSd9MU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nButwhCstEkDevi8+jazSfbdj452E+gjVyjvGZkQffo+mzIucLDLDiDu8To3J8YWF7GSaSY/GyMS9GvjNRVqI3cAUKI8KDSJkls7YicKUAAwZxs1TxejcN15xWleAsNkLwBsqwVmScFaIWNjk0NvoI0KSFozaz9lUAm8CN8QARw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8J4M+9J; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8J4M+9J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735622994; x=1767158994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=46MQTabXq5ydAV5SwNjWWjsbyfltdwuq55Fb2CSd9MU=;
  b=P8J4M+9J3Z4y8iSn4Z2iJbf3tQi4aabSDIioByDxRKn0Sop5Zb5D9qaF
   ufz7TszS/UMU+8PMKBpdWyCw63tMa3hMPJxattNI3i1BVw/gCrGwIfBhj
   oGJljUQ4YRMVcHskuucxHuFHQ8aFrTl2iiZkc7ZEkwuc4qhbXRG8N5/lh
   //jjgjd/B7n9l+UHDqPErvyEZsKPrYU+dkACDHueEIoVtbOuUAzjyn+/B
   552odNCL2X++/MZF40jgrPVqzjbB47HWfiOSm4k5w14+xLoWLWJ4jWF7f
   aWomZFnr6oCbk4LypxWEJA2AyTYSZKCnoa55MNKoAOZi+rE7NUJCQtA5B
   Q==;
X-CSE-ConnectionGUID: PB/HnmWDRzGw+1xaIJWPAQ==
X-CSE-MsgGUID: FQAlHbU/Tzata5kyLmig1w==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="53449948"
X-IronPort-AV: E=Sophos;i="6.12,278,1728975600"; 
   d="scan'208";a="53449948"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 21:29:54 -0800
X-CSE-ConnectionGUID: rDl3hahdSiaetnnBjOVxeg==
X-CSE-MsgGUID: QcwEBsnJQhuQ+phjg8m5GA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="105971467"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 30 Dec 2024 21:29:52 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSUpC-0006nJ-0z;
	Tue, 31 Dec 2024 05:29:50 +0000
Date: Tue, 31 Dec 2024 13:29:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Baokun Li <libaokun1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2612/2612] fs/fscache/main.c:52:21: warning:
 'fscache_min_op_max_active' defined but not used
Message-ID: <202412311354.iggKIx0H-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   908c8608d2c0fcf6f49b1f48f074515c42474946
commit: c55fa11d134b40dbe1a4a5512a7fe43497cb6d5e [2612/2612] fscache: limit fscache_object_max_active to avoid blocking
config: x86_64-buildonly-randconfig-002-20241231 (https://download.01.org/0day-ci/archive/20241231/202412311354.iggKIx0H-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241231/202412311354.iggKIx0H-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412311354.iggKIx0H-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/fscache/main.c:52:21: warning: 'fscache_min_op_max_active' defined but not used [-Wunused-variable]
      52 | static unsigned int fscache_min_op_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE / 2;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/fscache/main.c:51:21: warning: 'fscache_min_object_max_active' defined but not used [-Wunused-variable]
      51 | static unsigned int fscache_min_object_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE;
         |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/fscache_min_op_max_active +52 fs/fscache/main.c

    46	
    47	/* these values serve as lower bounds, will be adjusted in fscache_init() */
    48	#define FSCACHE_MIN_OBJECT_MAX_ACTIVE 4
    49	static unsigned int fscache_object_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE;
    50	static unsigned int fscache_op_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE / 2;
  > 51	static unsigned int fscache_min_object_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE;
  > 52	static unsigned int fscache_min_op_max_active = FSCACHE_MIN_OBJECT_MAX_ACTIVE / 2;
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
