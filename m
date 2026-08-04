Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E650D330B3F
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Aug 2026 04:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785817970; cv=none; b=GZ69c3keiJCrM6eyDGqCZODYYUcJxOZ/dRIsphZuKvuht6TznPtcybLlRmXd5wB51eURM0T+AGAoOYOWA08rbBLUDRaPyJ6bcLfEyrvL8mJCI8jJywK6TXcSks2U//o5dAlzj6WahvLTlIO7gOVxtEz0VA1mSNlOPfBw/IkYBt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785817970; c=relaxed/simple;
	bh=iGVnAHmg3GTt0an7xCJPSQi2hWTnkoO0trj8mYQJZ5w=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RnchFFVklsm0SS3l2lKqBWPG+ggbFQCK+FO/4hH2iiZ42PQpbxrhVMxJ1ORp8Mm6KvIcsUdxMlBk7LwpNXiC7CnByI7j7oRDLOU7OyHbpD6Q8FLl8rtDF+OYDPIExTqUVzGdHbRlJf1oET2/eSHigmmtoQqOhSZ1PxdSnYJwCSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ckVEeDsP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ckVEeDsP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785817969; x=1817353969;
  h=date:from:to:cc:subject:message-id;
  bh=iGVnAHmg3GTt0an7xCJPSQi2hWTnkoO0trj8mYQJZ5w=;
  b=ckVEeDsP34MKrKU6wVa3vLfH9jnoI0i2BK5dTupFy5nzn3ZFyO7vHdDy
   KyCCZ+cuyXH+fS1VI6L7WDewVKSfspJuPPTeNL8SRpQq1OHdWJX4u3Apj
   VsSZOwWWhsxXQ2iGO62Gm1JWgky03AoJQjBcuut5heNrsoHrB2HiCLCgO
   BiG90j2UFY704WLyZTEevhIO+nBSCeGJjaJw9W+Nn9Q6SfcAviXgpP69v
   L1rnvwvMR6IFpPVZfIGnb/j/Vj49i65wh1VmCPvmbOl6M64XhJY8yKx6a
   1ugSgwTMWOmGNHPM9ovn3yTed7egRT7gORRawxmiWA2iXl3FXqtepWWtE
   g==;
X-CSE-ConnectionGUID: jrs8XpxsQSyH4eZuvgz8xw==
X-CSE-MsgGUID: DjWnjNUMRmSTISzqerdu+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86129904"
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="86129904"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2026 21:32:48 -0700
X-CSE-ConnectionGUID: giewOwgDR5CwYEF84yMZLA==
X-CSE-MsgGUID: 23iKCXKhSoev9J5f5J88EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,203,1779174000"; 
   d="scan'208";a="258737196"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 03 Aug 2026 21:32:46 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wr6pX-000000008wP-43bn;
	Tue, 04 Aug 2026 04:32:43 +0000
Date: Tue, 04 Aug 2026 12:32:33 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Palmer <daniel@0x0f.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenxing:mstar_v6_5_reorder 537/700]
 drivers/misc/dt-dummy-irq.c:67:25: error: 'msc313_fcie_dt_ids' undeclared
 here (not in a function)
Message-ID: <202608041210.7LoSoWZY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/linux-chenxing/linux.git mstar_v6_5_reorder
head:   1a5c60e65ea399670a5384b869c4958338af2799
commit: 5ffe59ecd11b8ae1f1acd2e5b03e758913e65aea [537/700] Create a dummy irq driver
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260804/202608041210.7LoSoWZY-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260804/202608041210.7LoSoWZY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608041210.7LoSoWZY-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/misc/dt-dummy-irq.c:9:
>> drivers/misc/dt-dummy-irq.c:67:25: error: 'msc313_fcie_dt_ids' undeclared here (not in a function)
      67 | MODULE_DEVICE_TABLE(of, msc313_fcie_dt_ids);
         |                         ^~~~~~~~~~~~~~~~~~
   include/linux/module.h:244:15: note: in definition of macro 'MODULE_DEVICE_TABLE'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |               ^~~~
>> include/linux/module.h:244:21: error: '__mod_of__msc313_fcie_dt_ids_device_table' aliased to undefined symbol 'msc313_fcie_dt_ids'
     244 | extern typeof(name) __mod_##type##__##name##_device_table               \
         |                     ^~~~~~
   drivers/misc/dt-dummy-irq.c:67:1: note: in expansion of macro 'MODULE_DEVICE_TABLE'
      67 | MODULE_DEVICE_TABLE(of, msc313_fcie_dt_ids);
         | ^~~~~~~~~~~~~~~~~~~


vim +/msc313_fcie_dt_ids +67 drivers/misc/dt-dummy-irq.c

    62	
    63	static const struct of_device_id dummy_dt_ids[] = {
    64		{ .compatible = "dummy-irq" },
    65		{},
    66	};
  > 67	MODULE_DEVICE_TABLE(of, msc313_fcie_dt_ids);
    68	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
