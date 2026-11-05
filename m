Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793855791;
	b=Ruf+CoHUH2r1uAg40gGDMTd4whgafNrc3SWSVxacVaOtCHKYam5jx7y09Z4IQouJNBH4
	 IWq1LORJzN7ja/EZWWsW7SjcOK+C0HTjgLCUNHaZAb1bnXY8xcdWhvqRk2Gy0sTFcLnq8
	 oHHLuvU3U2dWclFtiZcXGghXKRUZSI9v7QXJUciYt6DYBjUVyjgJdT/j7gWNHB8RT4kCJ
	 DD31FTE9QHCgSCMwAGlSsFgpSOoClQfDS9uiJIt6DJ7/SMf1/XljIuNVaqFBHa3fbO0zw
	 +HvCOBz99NCshynifN3W1ubLvNZtKiD6+LHerW9bM3dblnls7F66Kbo1OtQtL41GchA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793855791;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jQEqM0da9xcUG3FlbFu/PNbgO/Ho0E3B9/DARd1XJ58=;
	b=uMT40P8P3pXUL21P+3VuqKMQqA9Qm2AL7mVVjH1UD7p+Y5trYaN/UjExWNVLAvTtG6PR
	 aAQUkhaLhO3bH+hZUEr1KEaH6OghsGUsELWq8DSNpVYwoLxYKIfu3mVp+d4Vzv6h1SU2O
	 svTqYuXCt9UG2Tsh2+kZu3VioMlDgC2DGVEyPOyur+jSNY6K3nWzgzEBrTTuz9mNOXnk1
	 jvfO8Udwtx8sO1vNQew3lZG/jcVOm589OLzsnKrYK2tsZVLGFPdru3SGRUadtdZ1+azKU
	 9qXJPr2hWSGsdtEBf5iRG1x86U2VFclT3L4nz1DGUOOKAyV8LhZSyFFE3CoBze5yFEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="nitja/2n";
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 588C0606A31B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 05:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 588C0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nitja/2n
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793855789; x=1825391789;
  h=date:from:to:cc:subject:message-id;
  bh=L66dxCjgoQcamwztr5IG466RnzO04+UPoN7+xWI4SNM=;
  b=nitja/2ncOoBiHZ1w7uDxLrdj1H8NtzCbsJ1sIJLpkGt/GZWh57tVd4R
   4BbZ2mJa00CHSZl6z86ktn6GXXvIkBn0bnEKKe5fYLd5DhCxLGr99NBQT
   5nJoRyLN4C5vtPJXa4Mpy/mK7+hdnM470q07+U9QkOxtJc9Jl2a4AvFBW
   2GNV3nw1Mq83E2nrpU59gTMEPjcSy4vBxvupBJlp5MPDBEgNO6F5RVvdT
   m63FRxBHS6Ko1kBK0EVuV6EHskDAvYExipLMA3LuahXelTKW5Gso7C3rY
   TW/faMv0wxLMMN9dRMRcHV/et/QyOqf4jTpE/et2ibgsveJH9ngjZ+z/5
   A==;
X-CSE-ConnectionGUID: z3MAbO8LTkeIV1ASVTUIRg==
X-CSE-MsgGUID: MUuIGy9rQwObFQNrV0WUSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2669677"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2669677"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 21:16:29 -0800
X-CSE-ConnectionGUID: Y1qCQsgLTVSuega7+akKNA==
X-CSE-MsgGUID: LGjGBv8kQEWPcWRULH/22g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="6908130"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 04 Nov 2026 21:16:27 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOppp-000000009XP-2g4t;
	Thu, 05 Nov 2026 05:16:25 +0000
Date: Thu, 05 Nov 2026 06:15:34 +0100
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:device-trust-core-v1 16/18]
 drivers/base/test/device-trust-test.c:1222:1: warning: the frame size of 2160
 bytes is larger than 2048 bytes
Message-ID: <202611050656.odYu5bMt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git device-trust-core-v1
head:   de870c841cdc66fcef8c15662d737b49b2356904
commit: 16c0a5ab002de9ece57552721116428855565e14 [16/18] driver core: Cover trust authorization and binding with KUnit
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20261105/202611050656.odYu5bMt-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050656.odYu5bMt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050656.odYu5bMt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/base/test/device-trust-test.c: In function 'device_trust_driver_rejected_write_test':
>> drivers/base/test/device-trust-test.c:1222:1: warning: the frame size of 2160 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    1222 | }
         | ^
   drivers/base/test/device-trust-test.c: In function 'device_trust_driver_user_precedence_test':
   drivers/base/test/device-trust-test.c:1200:1: warning: the frame size of 2160 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    1200 | }
         | ^
   drivers/base/test/device-trust-test.c: In function 'device_trust_driver_matching_test':
   drivers/base/test/device-trust-test.c:1178:1: warning: the frame size of 2160 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    1178 | }
         | ^
   drivers/base/test/device-trust-test.c: In function 'device_trust_driver_precedence_test':
   drivers/base/test/device-trust-test.c:1150:1: warning: the frame size of 2208 bytes is larger than 2048 bytes [-Wframe-larger-than=]
    1150 | }
         | ^


vim +1222 drivers/base/test/device-trust-test.c

  1201	
  1202	static void device_trust_driver_rejected_write_test(struct kunit *test)
  1203	{
  1204		const struct bus_type bus = { .name = "pci" };
  1205		const struct device_driver drv = { .bus = &bus, .name = "test" };
  1206		struct device_private private = {};
  1207		struct device dev = {
  1208			.p = &private,
  1209			.trust_policy = DEVICE_TRUST_POLICY_DISABLED,
  1210		};
  1211	
  1212		mutex_init(&dev.mutex);
  1213		device_trust_init_state(&dev);
  1214		KUNIT_ASSERT_EQ(test, device_trust_set_policy(&dev, DEVICE_TRUST_POLICY_DEFAULT),
  1215				-EBUSY);
  1216		KUNIT_ASSERT_EQ(test, device_trust_set_policy(&dev, DEVICE_TRUST_POLICY_FULL + 1),
  1217				-EINVAL);
  1218		device_lock(&dev);
  1219		device_trust_apply_driver_policy(&dev, &drv, "pci:test=full");
  1220		device_unlock(&dev);
  1221		KUNIT_EXPECT_EQ(test, dev.trust_policy, DEVICE_TRUST_POLICY_FULL);
> 1222	}
  1223	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
