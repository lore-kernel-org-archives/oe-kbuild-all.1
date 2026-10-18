Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B3B4078C0
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309960; cv=none; b=Ss7awg0GH6aSTrb8osWpDDCOUenJe2uxtPKbeZiyPRGQbOmetstn0f2wq+L1T29ivPEf91CBhxb4gyHDrHOeYHmfJIVDbEJxoaF7beVLGA1Luj9mQIeynxX2KmCKTvcEgOA8xg6d7x1U24xoQpMXV0iDeudFAV+NXqBabssNQRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309960; c=relaxed/simple;
	bh=Wsc1d54NSH62Z7ZYd1h1pn4VJKliS3eFuATqtppH2Jk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gM7ae/fm8MxO5U8X7nL9B/T8QJ4I9XaajHorsoF7Twrig2FxHGumYkfgTtI1dSxF+axneQuY+G2g0AkCs3BfClPiLdYwqQ0MX074IOD23K8EKDcl3C74dLFmjrpFMZLVkBYbKSL2GJc42k7GM2vMaos3OVEBl2rbp/yfQxd6ey8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ODckCAmG; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODckCAmG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309959; x=1823845959;
  h=date:from:to:cc:subject:message-id;
  bh=Wsc1d54NSH62Z7ZYd1h1pn4VJKliS3eFuATqtppH2Jk=;
  b=ODckCAmGTKdX7uU/hDPzWYEugUgXaOcJilMzYMjBuxHix2MfiWdpwGG5
   JnCZugqIrZ/8JW1G4M3mpJCa6a6UQEv7sKJBfp5j/Gke8uP1gN7ebPiiw
   MqpZ7RBkKHSCNP4Scyu1Ud5vWmaCcGFeQ9uq8eYrp1ZLqNevZkWjJCp2A
   oTWfs3YXF+envT2E6qT8lg+Rj+4Qqc2BlbS1ZyC374UjVKzalEzaMGvRM
   vgNlFpLbFcJ54+LHIjjoR8SajAYjtrf4cFwOD1617MndmGpEhnnw04hyk
   jTnWZ14VuQZnot4qMUy0yLEaYjSWaeTEW8mPERMONnNWkKPHtZdDSh7Fe
   Q==;
X-CSE-ConnectionGUID: njx0xF9GRwiMRl0NTkUKrw==
X-CSE-MsgGUID: 4QGBqSL2TiGQD2zFw9DUgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908847"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908847"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:36 -0700
X-CSE-ConnectionGUID: 25xgpIZSSH+hvU1UP9ry4Q==
X-CSE-MsgGUID: tSViESc1SxyKNt4KNULozQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115546"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh2-000000004x5-3RQN;
	Sun, 18 Oct 2026 07:52:32 +0000
Date: Sun, 18 Oct 2026 09:43:30 +0200
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_1 49/62]
 drivers/ctlv/tests/registration_kunit.c:1706:48: warning: variable
 'init_info' is uninitialized when passed as a const pointer argument here
Message-ID: <202610161928.r7mxYLH1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_1
head:   e63637d55bc3ae7cbef988e3525c79b9381dba1b
commit: 611edc69440d968bf06f3c4018b4a3b4a4660884 [49/62] selftests/ctlv: Add library tests
config: powerpc64-randconfig-r2108-20261016 (https://download.01.org/0day-ci/archive/20261016/202610161928.r7mxYLH1-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 8a679464f19c426ef76aad9f4587b703dd3e584d)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261016/202610161928.r7mxYLH1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610161928.r7mxYLH1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ctlv/tests/registration_kunit.c:1706:48: warning: variable 'init_info' is uninitialized when passed as a const pointer argument here [-Wuninitialized-const-pointer]
    1706 |                 created = ctlv_create(parent, &ctlv_family, &init_info);
         |                                                              ^~~~~~~~~
   1 warning generated.


vim +/init_info +1706 drivers/ctlv/tests/registration_kunit.c

2c4421adfbc30c9 Jiri Pirko 2026-08-26  1696  
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1697  static void ctlv_reg_test_root_init_info(struct kunit *test)
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1698  {
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1699  	struct device *parent;
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1700  	struct ctlv_device *created;
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1701  	u8 init_info;
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1702  
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1703  	parent = kunit_device_register(test, "ctlv-root-info");
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1704  	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, parent);
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1705  	kunit_warning_suppress(test) {
2c4421adfbc30c9 Jiri Pirko 2026-08-26 @1706  		created = ctlv_create(parent, &ctlv_family, &init_info);
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1707  		KUNIT_EXPECT_SUPPRESSED_WARNING_COUNT(test, 1);
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1708  	}
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1709  	KUNIT_ASSERT_TRUE(test, IS_ERR(created));
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1710  	KUNIT_EXPECT_EQ(test, PTR_ERR(created), -EINVAL);
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1711  }
2c4421adfbc30c9 Jiri Pirko 2026-08-26  1712  

:::::: The code at line 1706 was first introduced by commit
:::::: 2c4421adfbc30c9ee180047f914b19954af67851 ctlv: Add KUnit tests

:::::: TO: Jiri Pirko <jiri@nvidia.com>
:::::: CC: Jiri Pirko <jiri@nvidia.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
