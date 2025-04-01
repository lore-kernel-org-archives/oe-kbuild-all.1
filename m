Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE351E2606
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 07:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743492301; cv=none; b=ETnDn6Jj4H9pvcQVYRaYO7CSAVmnMyJ9FX3yNcr1Tqc3Tlkoz9zVpV0aK2YtwbI7LIJ2ewmC49iMcem9D6FhXMvviXDTLZiZIOBHprKlflQtqiUT7PGxiOF4pknDLzWUFKVhbo5S15CrEdPY3Uf/Kf/L+ewzR1Lu+rUd8wnt2BQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743492301; c=relaxed/simple;
	bh=UDbVeHeglcJXPgF8uywx216Sd3FNhOEfuyYnkvdnuH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=W9KjjybZ94VIa5GcVasgr9wNEFIg2mo1eNDMz7wsYYuhXlIf+zE7m6Na5dvgbmLi/cuM6s0wXXCdPQTSkDELaxyFriNn6CNbAKqp0etW3wxXxVJstYbE7PPPJR0I/PYjWgcJz84H8bUkQLhvJDHJDP+N6TpTnDXjaEmqgvKggBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AuWJD6TM; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AuWJD6TM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743492299; x=1775028299;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UDbVeHeglcJXPgF8uywx216Sd3FNhOEfuyYnkvdnuH8=;
  b=AuWJD6TMObiG1Pxvy6BbKhStaDRgwQRcuAV4htY3GW6PcrrVzJPPjY6O
   m8Vh8gcnGZgeHN6Z0G+7fHF3MWTy5joozPddhFzo3+9I4q6a5kHk2LPWe
   dHgUP2RotKEReE5hGTA/VaoiSot7YvQU0KuY+1TGl4D4KsMj8NQ62g1Pc
   QQVhnekmE6ezacmQXoNqUdOHda0iBuHaAED/KlaZ2ETVHc3ePsRwryZqC
   8HhYHxXiOJCYDn0Ge6H5QBfQr4TB2kvTgwUmtjz4EmQurzXgdFqwoinAk
   tkgMSpu2fPxeFnoKi66GA+bQA1lp2O4Tw9XOdsDEZ4f1eNbehhOesS0BP
   Q==;
X-CSE-ConnectionGUID: d0rTl4N4Rz2mmOndh1/apA==
X-CSE-MsgGUID: fUepD5lIR+OVa6YkahkkHQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="55461916"
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="55461916"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 00:24:59 -0700
X-CSE-ConnectionGUID: a9Nxg2/5Q46uuTjm4ZT3GA==
X-CSE-MsgGUID: 45gFO+oYR2eFrnWSEcdDBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,292,1736841600"; 
   d="scan'208";a="126193615"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 01 Apr 2025 00:24:58 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzVzN-0009hy-24;
	Tue, 01 Apr 2025 07:24:51 +0000
Date: Tue, 1 Apr 2025 15:24:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1544/1544] block/blk-cgroup.c:478:19:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202504011531.jatxCuOT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   9866a4dd6fd198f871f6c1692e61ce7d10c96836
commit: 725ee753b5064f03287858bc346d883b8f39319a [1544/1544] bdi: fix use-after-free for the bdi device
config: arm64-randconfig-r131-20250401 (https://download.01.org/0day-ci/archive/20250401/202504011531.jatxCuOT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250401/202504011531.jatxCuOT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504011531.jatxCuOT-lkp@intel.com/

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
