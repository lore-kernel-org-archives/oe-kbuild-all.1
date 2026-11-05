Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793845805;
	b=4zOCMvvyZGORNNvRIVkBEXmagZrRqr0EsIudfna1K7tMUGoprtqwCiq+ulnM8Xv39xSs
	 KHPjNa2oCc8WK7hcelF18vI39NgU7C2h1EWYDpWi8eE3Qxvyc3zfO7wRkYvH6Al6fH2hg
	 hvtFerOXOKj5/DXaD0mWowOCeEyM/o464vKtI4uVpYVGFJicjhq4tz8CtltjpEI6rEkHa
	 LGxsj/izzSq4+7ezUv3OA3absQuoD7Bxms79zFlF7YwXQ+k+2iMzw2qYAmOnlHht6Xt3D
	 7yPUmCCdxQ2+MIN/0Dic3NSbdEMJwRI+6TboIph5Hn08lipN3DTGeOZU6jhmoZRBAeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793845805;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kagnmg63pzZ+btqBPQTJwd3grEVh5EVLQuuPQbErfJE=;
	b=GrPl/3QMyweVWt1CrKLTY5ZBOLajMXiEU93Nc4ouWooXUqPutI/lTeK6oBX296mRJOx+
	 Uu7Rp7JXQiCLmFHT2NdBx9DVgwDVKeAc5hT1v6o2p4+fWSmJfC2mwt4LOyqdDf5z4DX9Y
	 5DMjRJQ2J2ZuFBG11dzrD3Ipd8Kyrtm+xYXlcwgNDT9r3tC8QKevriZ3gW7CnpBGAlprJ
	 iJkiFLQ3O9G1VvY9uXs6mKSij5IgIVde5pR+vMHKEYb42HpFvLkg0TQChtJ/pNgzE+L0o
	 ZFbvBVz4Fhy2UiVhWGrHepXmHdsMooOGSEBmGcsLse/nCMNPwDO0n29YUqAFn8f0GOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hOER4OO4;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6DE606A328
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Nov 2026 02:30:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A6DE606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hOER4OO4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793845805; x=1825381805;
  h=date:from:to:cc:subject:message-id;
  bh=QVOKtLY1bGBk2WxL8Xx+XWBGMvzzAGbMdIVM0xGYsfo=;
  b=hOER4OO4HiIab4otx9a2JI6uYnB3iAFgQ6jcsUFN9mLs6qjKAywfB/tK
   S7bpH9fVZ4RQogdjsFv61kpMFBEn/W7iP3AhuW5FpgQH2vFMkRudA6KSE
   eeSqx4vBNCGBPbw/BxaB4CkM6RDC/osY2UyvePt0zh2ypqueTp+4H2R03
   qgSR1UtOe2hoOm6pcBXddG9LuvV68f8piVJYrYuyaSLhi1kfN/LaCKaEl
   142Yh1pqQtMBdfBPkxDBpLrTljYBluHNltkvDcE0SqZqlTr0cboOHxTRO
   JTTW3dgI9lhlzX4tqsAaDzAY0uyZiV+b9B0SVxE6ZgA16JEad73S1NY0R
   A==;
X-CSE-ConnectionGUID: vvty45GdTzq+3dHOg4bcfg==
X-CSE-MsgGUID: ouSL5vX8RRK5osZOWVVfJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2656172"
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="2656172"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 18:30:04 -0800
X-CSE-ConnectionGUID: e3drVJSnRWa0e9JiMw5bCA==
X-CSE-MsgGUID: y8oPPifYSdWYfVqPAc1YTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,196,1787036400"; 
   d="scan'208";a="7038872"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 04 Nov 2026 18:30:03 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOnEm-000000009SH-3BiK;
	Thu, 05 Nov 2026 02:30:00 +0000
Date: Thu, 05 Nov 2026 03:29:36 +0100
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:device-trust-core-v1 16/18]
 drivers/base/test/device-trust-test.c:1106:13: warning: stack frame size
 (2432) exceeds limit (2048) in 'device_trust_driver_precedence_test'
Message-ID: <202611050324.haR7ZTLI-lkp@intel.com>
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
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20261105/202611050324.haR7ZTLI-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050324.haR7ZTLI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611050324.haR7ZTLI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/base/test/device-trust-test.c:1106:13: warning: stack frame size (2432) exceeds limit (2048) in 'device_trust_driver_precedence_test' [-Wframe-larger-than]
    1106 | static void device_trust_driver_precedence_test(struct kunit *test)
         |             ^
>> drivers/base/test/device-trust-test.c:1152:13: warning: stack frame size (2368) exceeds limit (2048) in 'device_trust_driver_matching_test' [-Wframe-larger-than]
    1152 | static void device_trust_driver_matching_test(struct kunit *test)
         |             ^
>> drivers/base/test/device-trust-test.c:1180:13: warning: stack frame size (2384) exceeds limit (2048) in 'device_trust_driver_user_precedence_test' [-Wframe-larger-than]
    1180 | static void device_trust_driver_user_precedence_test(struct kunit *test)
         |             ^
>> drivers/base/test/device-trust-test.c:1202:13: warning: stack frame size (2320) exceeds limit (2048) in 'device_trust_driver_rejected_write_test' [-Wframe-larger-than]
    1202 | static void device_trust_driver_rejected_write_test(struct kunit *test)
         |             ^
   4 warnings generated.


vim +/device_trust_driver_precedence_test +1106 drivers/base/test/device-trust-test.c

  1105	
> 1106	static void device_trust_driver_precedence_test(struct kunit *test)
  1107	{
  1108		static const char * const driver_rules[] = {
  1109			"pci:test=default", "pci:test=disabled",
  1110			"pci:test=adversary", "pci:test=full",
  1111		};
  1112		static const char * const device_rules[] = {
  1113			NULL, "pci:0000:01:00.0=default", "pci:0000:01:00.0=disabled",
  1114			"pci:0000:01:00.0=adversary", "pci:0000:01:00.0=full",
  1115		};
  1116		const struct bus_type bus = { .name = "pci" };
  1117		const struct device_driver drv = { .bus = &bus, .name = "test" };
  1118		unsigned int initial, global, driver, device;
  1119	
  1120		for (initial = DEVICE_TRUST_POLICY_DEFAULT;
  1121		     initial <= DEVICE_TRUST_POLICY_FULL; initial++) {
  1122			for (global = DEVICE_TRUST_POLICY_DEFAULT;
  1123			     global <= DEVICE_TRUST_POLICY_FULL; global++) {
  1124				for (driver = 0; driver < ARRAY_SIZE(driver_rules); driver++) {
  1125					for (device = 0; device < ARRAY_SIZE(device_rules); device++) {
  1126						struct device_private private = {};
  1127						struct device dev = {
  1128							.bus = &bus,
  1129							.init_name = "0000:01:00.0",
  1130							.trust_policy = initial,
  1131						};
  1132	
  1133						mutex_init(&dev.mutex);
  1134						device_trust_apply_boot_policy(&dev, global,
  1135									       device_rules[device]);
  1136						dev.p = &private;
  1137						device_trust_apply_boot_policy(&dev, global,
  1138									       device_rules[device]);
  1139						device_trust_init_state(&dev);
  1140						device_lock(&dev);
  1141						device_trust_apply_driver_policy(&dev, &drv,
  1142										 driver_rules[driver]);
  1143						device_unlock(&dev);
  1144						KUNIT_EXPECT_EQ(test, dev.trust_policy,
  1145								device ? device - 1 : driver);
  1146					}
  1147				}
  1148			}
  1149		}
  1150	}
  1151	
> 1152	static void device_trust_driver_matching_test(struct kunit *test)
  1153	{
  1154		static const char * const unmatched[] = {
  1155			NULL, "usb:test=disabled", "pc:test=disabled", "pcie:test=disabled",
  1156			"pci:tes=disabled", "pci:test1=disabled", "pci:te*=disabled",
  1157			"pci:test=disabled,pci:other=invalid", "pci:test=disabled,",
  1158		};
  1159		const struct bus_type bus = { .name = "pci" };
  1160		const struct device_driver drv = { .bus = &bus, .name = "test" };
  1161		struct device_private private = {};
  1162		struct device dev = { .p = &private };
  1163		unsigned int i;
  1164	
  1165		mutex_init(&dev.mutex);
  1166		device_trust_init_state(&dev);
  1167		for (i = 0; i < ARRAY_SIZE(unmatched); i++) {
  1168			device_lock(&dev);
  1169			device_trust_apply_driver_policy(&dev, &drv, unmatched[i]);
  1170			device_unlock(&dev);
  1171			KUNIT_EXPECT_EQ(test, dev.trust_policy, DEVICE_TRUST_POLICY_DEFAULT);
  1172		}
  1173		device_lock(&dev);
  1174		device_trust_apply_driver_policy(&dev, &drv,
  1175						 "pci:test=disabled,pci:test=adversary");
  1176		device_unlock(&dev);
  1177		KUNIT_EXPECT_EQ(test, dev.trust_policy, DEVICE_TRUST_POLICY_ADVERSARY);
  1178	}
  1179	
> 1180	static void device_trust_driver_user_precedence_test(struct kunit *test)
  1181	{
  1182		const struct bus_type bus = { .name = "pci" };
  1183		const struct device_driver drv = { .bus = &bus, .name = "test" };
  1184		enum device_trust_policy policy;
  1185	
  1186		for (policy = DEVICE_TRUST_POLICY_DEFAULT;
  1187		     policy <= DEVICE_TRUST_POLICY_FULL; policy++) {
  1188			struct device_private private = {};
  1189			struct device dev = { .p = &private, .trust_policy = policy };
  1190	
  1191			mutex_init(&dev.mutex);
  1192			device_trust_init_state(&dev);
  1193			KUNIT_ASSERT_EQ(test, device_trust_set_policy(&dev, policy), 0);
  1194			device_lock(&dev);
  1195			device_trust_apply_driver_policy(&dev, &drv, "pci:test=disabled");
  1196			device_trust_apply_driver_policy(&dev, &drv, "pci:test=full");
  1197			device_unlock(&dev);
  1198			KUNIT_EXPECT_EQ(test, dev.trust_policy, policy);
  1199		}
  1200	}
  1201	
> 1202	static void device_trust_driver_rejected_write_test(struct kunit *test)
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
  1222	}
  1223	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
