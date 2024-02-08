Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A569A50245
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 22:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707432367; cv=none; b=tDc/OFhosNdXFVhAwElGDFCHaS5s/vY9bv0sSJVELNkGs05/qVfSzfSU2wJcs6IVieAWZLjlfjthS7B5fKx+2xk+6z4Sa0UWj18eAdXbEJhCA4hR3X9gj+ulQfrgUeXml0oxJbwz3an8AbFrcjdbd213U7Pn+x8RY/uJKXYIKf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707432367; c=relaxed/simple;
	bh=79xV96CXjquft7H7TQaDmUxNJgAF46RO2wrEdZkH9Hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LyuDrODIJ9c/E72TfRFXy+e92NWJk1cHf/JowLWYnLZQwjoOSGujfCOcBWwylLIxv9kPPX4wpQ4ObvC6ZWrASjjGpT4zn02E4YvrdDuNuv1VJet8fq0Z40H5ouNGkkqfWkBkQpq4UCRub/xPV7q+LPaRAZbQXFiG1IcibOZrdo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SE8X4f8L; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SE8X4f8L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707432366; x=1738968366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=79xV96CXjquft7H7TQaDmUxNJgAF46RO2wrEdZkH9Hg=;
  b=SE8X4f8Lx+E2uG3ry2MPuzPG4b/GTVix/HOqjg0FJU6pNBRgvzz7JCES
   uCeeaeCgi7OJbawHC8HGQ3Dl1SM5F0YBGckO46aaVS5juMLhK/D4KWnRm
   uVxL7YHbdH9hMxdXou8koCn8gw2rYbeuQILYFmC4b0gS71jaNniCq/qeB
   raynUa0UTg5rdZ5rfQM2gZ2mAw25XN35+ZRdDtyk3I80E+AJZT7U8+Dkm
   u++FRnckUvR4J5uaCCoYdRRCPJAWEcWo26vG1xM3LUR7hkD4IDY+34MhO
   Kc3mJTqMrl1Gteocg2h3pJc4N9yOq28NjUs/Dhvv6bfdVzulzz4CA6z10
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="1215411"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="1215411"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 14:46:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="6553945"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 08 Feb 2024 14:46:03 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYD9c-0004Aw-1Z;
	Thu, 08 Feb 2024 22:46:00 +0000
Date: Fri, 9 Feb 2024 06:45:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 13023/21625] block/blk-cgroup.c:478:19:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202402090649.euI3JhvL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7efcac7603953bb58d80041f410b079378b5174c
commit: 725ee753b5064f03287858bc346d883b8f39319a [13023/21625] bdi: fix use-after-free for the bdi device
config: arm64-randconfig-r123-20240125 (https://download.01.org/0day-ci/archive/20240209/202402090649.euI3JhvL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240209/202402090649.euI3JhvL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402090649.euI3JhvL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> block/blk-cgroup.c:478:19: sparse: sparse: incompatible types in comparison expression (different address spaces):
   block/blk-cgroup.c:478:19: sparse:    struct rcu_device [noderef] __rcu *
   block/blk-cgroup.c:478:19: sparse:    struct rcu_device *
   block/blk-cgroup.c:816:5: sparse: sparse: context imbalance in 'blkg_conf_prep' - wrong count at exit
   block/blk-cgroup.c:1794: warning: Function parameter or member 'q' not described in 'blkcg_schedule_throttle'
   block/blk-cgroup.c:1794: warning: Function parameter or member 'use_memdelay' not described in 'blkcg_schedule_throttle'
   block/blk-cgroup.c:1819: warning: Function parameter or member 'blkg' not described in 'blkcg_add_delay'
   block/blk-cgroup.c:1819: warning: Function parameter or member 'now' not described in 'blkcg_add_delay'
   block/blk-cgroup.c:1819: warning: Function parameter or member 'delta' not described in 'blkcg_add_delay'

vim +478 block/blk-cgroup.c

   472	
   473	const char *blkg_dev_name(struct blkcg_gq *blkg)
   474	{
   475		/* some drivers (floppy) instantiate a queue w/o disk registered */
   476		struct rcu_device *rcu_dev;
   477	
 > 478		rcu_dev = rcu_dereference(blkg->q->backing_dev_info->rcu_dev);
   479		if (rcu_dev)
   480			return dev_name(&rcu_dev->dev);
   481		return NULL;
   482	}
   483	EXPORT_SYMBOL_GPL(blkg_dev_name);
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
