Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606591;
	b=a2gQsIl07wLbQqQP+ZsMfRN9U8FdLWiaU+9LrmhjwnoSVWFsmj64ZvlM8aodHsXAwjr5
	 rSlVAU0Qma5xcPGPhQi6dguy9uPUGCMT4V3t7T7BglqTx1EgjGwMHNMsasjWUezoaF3rH
	 hbzBYaLbEWMmq6982eLzKKM+R4/rMzkEfJahZ62BpBTj2C5s0OIL2Uweb092h9QqT1TAX
	 yG9Rbx3IOUfmyi0kiJbiFDZ32sPLnNXMaHIh75PsBX6CPcW6p0YAF1oukQ1L+iOr5Wr9g
	 V9ycyNwpr6mro6rl73HOWRPs8pg75W2uIPMP03KYun1wcRjOlhdX+O4ZNQo1J0xAzHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606591;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kOt6841u44Fwd2AvjKVp3Wgc/3wgl72YoWylPbeyB14=;
	b=nVQV4dBwBC3tpwbz9eiEjlnxzv/i0VzueOtz8gk3lhUjDUn2i3gSqVt6BLsHom7b2/Rp
	 8Ajs+cCrwS1PTnWbu9VSJUStzqYyRtYZddqMUD5ZxDwIimfr6ndNjW3/wfl7H797quQEk
	 2icN6bmDszu44nmlTuv0GB4PvNVAu16cDKLFT09cu2lR6oN2zoMBTS8W4xUsSkxKPK9/j
	 6OPQKJ5xBHVD9ODNhEjwvpfIAYkAw6Vma8E3Iw0IcqZz/3TG6ohRHpc4fe8s3YL3kcnSR
	 fHc+Oh0TILrOwlr1qa1Cbf75PUyq5GK4lybzxAdMqEntTZz4J0wJThtR87vaLPyXeUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lDQfxLHK;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2C9760A6F6B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 21:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2C9760A6F6B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lDQfxLHK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794606591; x=1826142591;
  h=date:from:to:cc:subject:message-id;
  bh=u8O471YZAMPohmakEd9Zc+PN908TkJzLYtwToGIX6QM=;
  b=lDQfxLHKoHBmFjHrA7Sdsc1M+xCBW1cp4sRcKqOx4s2Vd7b5mgOHWxj3
   CBth3ZZqhMymBpoPfkaHTirDzHvtKBJ5MCK43cmndEf0xYXeSaVIbJ+O1
   E7OWIKZuWBhl/QVN1Q091JAn0xlfv4Xm6PzCKY5TsprE56o+xUqA2R5nT
   FiPj5RALPpimgCYb5Sh//WGmffDHx1kGkB2GsK93fJbys4tCKB12x+SnO
   SJTTViPsGas6bmtkaRjvEm/vD/pB4Mi49OlIeFDbi4z5ymxySvGP0JUB4
   mjT2O9X/lq0F/YrNHPvz2iLdrsTFU7VAtmCvlV+jSO2hjrKLyjxSI3e3i
   Q==;
X-CSE-ConnectionGUID: i9p60KmATO6lh55vUmNSVg==
X-CSE-MsgGUID: oMiZsozhQ++mVUPF1lDeFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3318973"
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="3318973"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 13:49:51 -0800
X-CSE-ConnectionGUID: 2nou6bQFTEKGxkGxu5GrVw==
X-CSE-MsgGUID: W3JQ7R1sRc2jbCg+HjuFWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,212,1787036400"; 
   d="scan'208";a="9558750"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2026 13:49:49 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRz9W-000000001LL-3zgz;
	Fri, 13 Nov 2026 21:49:46 +0000
Date: Fri, 13 Nov 2026 22:49:22 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Pirko <jiri@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpirko-mlxsw:wip_attestation_all_2 49/68]
 lib/ctlv/tests/device_kunit.c:211:9: sparse: sparse: incorrect type in
 initializer (different base types)
Message-ID: <202611132206.tE52NKWl-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Jiri,

First bad commit (maybe != root cause):

tree:   https://github.com/jpirko/linux_mlxsw wip_attestation_all_2
head:   7ff5e548abbc2312431d4eea9ad283347963a6e2
commit: 4c0c6abf1208b44af1e04883852d0180266345a9 [49/68] ctlv: Add the test family implementation
config: nios2-randconfig-r2305-20261113 (https://download.01.org/0day-ci/archive/20261113/202611132206.tE52NKWl-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611132206.tE52NKWl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611132206.tE52NKWl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/ctlv/tests/device_kunit.c:211:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long left_value @@     got restricted __poll_t const __left @@
   lib/ctlv/tests/device_kunit.c:211:9: sparse:     expected long long left_value
   lib/ctlv/tests/device_kunit.c:211:9: sparse:     got restricted __poll_t const __left
>> lib/ctlv/tests/device_kunit.c:211:9: sparse: sparse: incorrect type in initializer (different base types) @@     expected long long right_value @@     got restricted __poll_t const __right @@
   lib/ctlv/tests/device_kunit.c:211:9: sparse:     expected long long right_value
   lib/ctlv/tests/device_kunit.c:211:9: sparse:     got restricted __poll_t const __right
--
>> lib/ctlv/tests/message_kunit.c:901:43: sparse: sparse: cast truncates bits from constant value (100010000 becomes 10000)
   lib/ctlv/tests/message_kunit.c:980:45: sparse: sparse: cast truncates bits from constant value (100010000 becomes 10000)

vim +211 lib/ctlv/tests/device_kunit.c

3e5d2a45aaa3688 Jiri Pirko 2026-08-26  176  
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  177  /* The node announces its family, and a file open on it sees the device go. */
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  178  static void ctlv_device_test_add_del(struct kunit *test)
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  179  {
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  180  	const struct file_operations *fops;
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  181  	struct ctlv_device_test_node *node;
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  182  	struct ctlv_device_test_file *file;
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  183  	struct kobj_uevent_env *env;
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  184  	int released, ret;
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  185  	__poll_t mask;
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  186  
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  187  	file = kunit_kzalloc(test, sizeof(*file), GFP_KERNEL);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  188  	KUNIT_ASSERT_NOT_NULL(test, file);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  189  	env = kunit_kzalloc(test, sizeof(*env), GFP_KERNEL);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  190  	KUNIT_ASSERT_NOT_NULL(test, env);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  191  	node = ctlv_device_test_alloc(test, NULL, &ret);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  192  	KUNIT_ASSERT_EQ(test, ret, 0);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  193  	KUNIT_ASSERT_EQ(test, ctlv_init(&node->ctlv, &node->ctlvdev.dev, &ctlv_family, NULL), 0);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  194  	ctlv_publish(&node->ctlv);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  195  	KUNIT_ASSERT_EQ(test, ctlv_device_add(&node->ctlvdev), 0);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  196  	KUNIT_EXPECT_TRUE(test, device_is_registered(&node->ctlvdev.dev));
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  197  
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  198  	KUNIT_ASSERT_EQ(test, node->ctlvdev.dev.class->dev_uevent(&node->ctlvdev.dev, env), 0);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  199  	KUNIT_ASSERT_GT(test, env->envp_idx, 0);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  200  	KUNIT_EXPECT_STREQ(test, env->envp[0], "CTLV_FAMILY=ctlv");
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  201  
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  202  	fops = node->ctlvdev.cdev.ops;
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  203  	file->inode.i_cdev = &node->ctlvdev.cdev;
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  204  	file->filp.f_mode = FMODE_READ;
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  205  	KUNIT_ASSERT_EQ(test, fops->open(&file->inode, &file->filp), 0);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  206  
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  207  	ctlv_device_del(&node->ctlvdev);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  208  	ctlv_unpublish(&node->ctlv);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  209  	KUNIT_EXPECT_FALSE(test, device_is_registered(&node->ctlvdev.dev));
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  210  	mask = fops->poll(&file->filp, NULL);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26 @211  	KUNIT_EXPECT_EQ(test, mask & (EPOLLIN | EPOLLHUP), EPOLLIN | EPOLLHUP);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  212  
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  213  	released = atomic_read(&ctlv_device_test_released);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  214  	kunit_release_action(test, ctlv_device_test_put, node);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  215  	KUNIT_EXPECT_EQ(test, atomic_read(&ctlv_device_test_released), released);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  216  	fops->release(&file->inode, &file->filp);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  217  	KUNIT_EXPECT_EQ(test, atomic_read(&ctlv_device_test_released), released + 1);
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  218  }
3e5d2a45aaa3688 Jiri Pirko 2026-08-26  219  

:::::: The code at line 211 was first introduced by commit
:::::: 3e5d2a45aaa3688da1de5a2430c2993c39451793 ctlv: Add KUnit tests

:::::: TO: Jiri Pirko <jiri@nvidia.com>
:::::: CC: Jiri Pirko <jiri@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
