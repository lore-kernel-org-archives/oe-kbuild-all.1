Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AAD1DE894
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 03:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774409632; cv=none; b=Kg2/64Y+xJSYMSrrUX4TgCvBS6t+ePeeqfxBMPsdek6Wi5Up+eoXhZsm2s6CQ39WT/D/kl2wvnpiIZZCGUwKwwT/lgVPupctYOF5jjPAeqaPgTay9FHL+qC5bd8F4/Ehj8GoNQel0jFSokB2PeRkOIGRC2cAX2mAJNqElxBQjMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774409632; c=relaxed/simple;
	bh=Dae0rV+OAX4NN3jlqISRNVXWSYO1bJg6sveOwRdGZW8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pfkTyN7GSNB8ESXb42jEez9hWhXM1cgZ6gvSBZ4XreQgu3AwdU1yxTnkn1EL9uijRq8Z3oIzwyB17u/cfy6ZxY9FBkafaTE0P2GZ7CgnW05Lj5JG7pQLa7WiDUQXbybNhBi2Ebh3q3dTzmTcS8kLvGDhMUSP+IryJ83IN0imnbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f1d/oyWY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f1d/oyWY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774409630; x=1805945630;
  h=date:from:to:cc:subject:message-id;
  bh=Dae0rV+OAX4NN3jlqISRNVXWSYO1bJg6sveOwRdGZW8=;
  b=f1d/oyWY+zJTuuf+MQ5tkA+JmBLvy45Ol2wnfH+VQTMgXKBuhNuKXcPB
   MAziYH0RigbV2gFIf5Vf1Ip40shA6u//HlaeOK0fQtDIfEQHM8x6QLxYm
   JHS+b8EwHm8AiVceB7DbSJCvRC66+BCfkfr5AbIPp5yqoS/mR5UnnfKyr
   vzPZnGGBhh0NaabYNA8qcxBi2VS/zJD1hU1hmm6StG3KG+L061zKX8Z5u
   4IWdAYGXEFPMptQruVwsLIts4gO/79GjgHaLYr/ZOrU+i7hI+goy0T4Kc
   biacxsm/wGrZ/yZtR5iuzzCeeWF8VURUVeJ1L8UiFt59gKQvSi1OtDLvP
   A==;
X-CSE-ConnectionGUID: qEykhi30QGCdXqm5FqasgA==
X-CSE-MsgGUID: qB1qt9g1R0qRfkRyUofAOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="86917589"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="86917589"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 20:33:49 -0700
X-CSE-ConnectionGUID: KOhrVDSgT/WfnSeahI+tyg==
X-CSE-MsgGUID: Fx6eNyMxQZCN363rabcpPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="221212038"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 24 Mar 2026 20:33:47 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5F04-000000005rB-3mlr;
	Wed, 25 Mar 2026 03:33:44 +0000
Date: Wed, 25 Mar 2026 11:33:18 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1]
 drivers/powercap/dtpm.c:358: warning: Excess function parameter 'name'
 description in 'dtpm_alloc'
Message-ID: <202603251150.LK6LxHpK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   767574e87d5c797ccebbf3b513b0fac4e5102be7
commit: 082e8dcea9a8df7967266dd7d1204f67ad496a15 [0/1] UPSTREAM: powercap/drivers/dtpm: Add API for dynamic thermal power management
config: i386-randconfig-005-20260325 (https://download.01.org/0day-ci/archive/20260325/202603251150.LK6LxHpK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603251150.LK6LxHpK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603251150.LK6LxHpK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/powercap/dtpm.c:358: warning: Function parameter or member 'ops' not described in 'dtpm_alloc'
>> drivers/powercap/dtpm.c:358: warning: Excess function parameter 'name' description in 'dtpm_alloc'


vim +358 drivers/powercap/dtpm.c

   350	
   351	/**
   352	 * dtpm_alloc - Allocate and initialize a dtpm struct
   353	 * @name: a string specifying the name of the node
   354	 *
   355	 * Return: a struct dtpm pointer, NULL in case of error
   356	 */
   357	struct dtpm *dtpm_alloc(struct dtpm_ops *ops)
 > 358	{
   359		struct dtpm *dtpm;
   360	
   361		dtpm = kzalloc(sizeof(*dtpm), GFP_KERNEL);
   362		if (dtpm) {
   363			INIT_LIST_HEAD(&dtpm->children);
   364			INIT_LIST_HEAD(&dtpm->sibling);
   365			dtpm->weight = 1024;
   366			dtpm->ops = ops;
   367		}
   368	
   369		return dtpm;
   370	}
   371	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
