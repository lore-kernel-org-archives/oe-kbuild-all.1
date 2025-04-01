Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E600D1EBA14
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Apr 2025 12:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743510427; cv=none; b=DxyTOH7OOd31uGQGculWt8+mf4vyz3lUbmD6S3u2OycnE+V8ptkFu4zAnqDwK9RGvMr5o1FQ9dy6xYApiOwe6eUG7tqcs98Aay95NNPeCbDl7rk31UO111ONhY+7GNw2UQ6GT2o6EnNZp7YpCbwKmHx5HcBOuw8B/CDsXLBIZOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743510427; c=relaxed/simple;
	bh=9zVnxbvG74C+mnKqEnUjBDOs8ETX6ruWCZMBUpB9Roc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=umRhDBpDfJWlbHPF/7jAXLWqYaEh0mLwiVok0aVnB+LKzW1yphqYwK+0LFC+Fim3Th5taq/8dw1qOKDBEb5u4JXbif2GWmyEl5rykoZpLyhUhSrLiwcsIP+piT2ZW2S4nqos4xBp2X72yRcN4gT/W5i44PGhhfws3qgtt4990/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZYiK1DoA; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZYiK1DoA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743510426; x=1775046426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9zVnxbvG74C+mnKqEnUjBDOs8ETX6ruWCZMBUpB9Roc=;
  b=ZYiK1DoAO7qQFxIEKkvvV0zmZr2CFtxL20UMx+nuYpg9q0TE6vbJ9MrC
   nV2lCflOM7cAtscTAQDTynG5gqN7BB9BslqXwuDAq8tAVkBB880c4yb6C
   JwbT9aX99dOIwLKdE5hmeluOvpLCh8agb+zyJ1o6OAgakdOGg+NlXQGDE
   yKrkhmPrhGgjwbIPi4FQxLIk85Od5mVAie5SjAxDLfcTUBiarcykvMGaZ
   4gJV5ezSP7UZn7h2TB/6eC1FMPECUdL9pq/Q4r60D2ZuN/EtLTKhvyc9u
   3fJ1iiV6DK2CwkAhK2ZFuhBkPb2kSv+iw+NBP2wQWhinYNubsb6nWyrzS
   Q==;
X-CSE-ConnectionGUID: jcoZY4s/S4meZo/umeo/Lg==
X-CSE-MsgGUID: m2tetyEYQLCReVbOKgb26w==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48498273"
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="48498273"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 05:27:05 -0700
X-CSE-ConnectionGUID: DY1ZsLYUTa2nF0nouGkKvg==
X-CSE-MsgGUID: hssEDFeuTequ1rEPL+QOhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,293,1736841600"; 
   d="scan'208";a="163601378"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 01 Apr 2025 05:27:04 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzahp-0009rI-2t;
	Tue, 01 Apr 2025 12:27:01 +0000
Date: Tue, 1 Apr 2025 20:26:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1544/1544] block/blk-cgroup.c:478:19:
 sparse: sparse: incompatible types in comparison expression (different
 address spaces):
Message-ID: <202504012009.zDgdqz6W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   54ad6c4559d2bcbb5d7a03050b2f417a326a1ce2
commit: 725ee753b5064f03287858bc346d883b8f39319a [1544/1544] bdi: fix use-after-free for the bdi device
config: arm64-randconfig-r131-20250401 (https://download.01.org/0day-ci/archive/20250401/202504012009.zDgdqz6W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250401/202504012009.zDgdqz6W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504012009.zDgdqz6W-lkp@intel.com/

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
