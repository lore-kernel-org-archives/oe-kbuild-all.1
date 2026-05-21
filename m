Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A64F19C556
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 May 2026 07:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779349691; cv=fail; b=ewnC8JtwbM4GU3zC2GrDoTpJdGJNojGm7T9il37qo9FLARi776h1ohjFJJlXfAzoD/mpJzAu0Ax01XKZIew/0LI69RsyjPmrMrXSEW2APciw0Cs5Ujl2LCPVXzgkDQPULeMzKRd0emnbb9zha1XAL9j97XMLpCf5YQ+vy+XzOy4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779349691; c=relaxed/simple;
	bh=IlmGwNCun7JDUUbBrpN/CLmE4Z36iXloB3f4zLfC2x0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=XcyiTFAWtMQtswiw4AdNra2mgAxV0fjog4QYfWze5iv6m2Ww2mqFYMmNmMbY/aDr+PnVM5VMYNJ/FLaSZV4npnlih20yobebG6v8AgwcQ8mCPGLIrq2BqjoA0DTlWRDCz0HM3uEifoqO1omN3cZbJAwixxdRr1Oafm/mVXyX2xQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=flsJc4m5; arc=fail smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="flsJc4m5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779349690; x=1810885690;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IlmGwNCun7JDUUbBrpN/CLmE4Z36iXloB3f4zLfC2x0=;
  b=flsJc4m5Sho4msNKuiBNyNXDS45NW2ExH89hIJCghR1QtsXwllCeRxq3
   6o4UDB59aaQ/Ojkj8KBGnjdAT5WegUZbIE9BG52r6adEJpc8WWOrplyG1
   oJstxBae7mEK+vCeK2rUACMJ/KhUEPPnqXTqXjCG2rW9e82Ep35+3HrTz
   irdIWJsWrjk47qQGdZt65gNiS1A4qdeeT9SxjvhG1GA/NiNTjeRqjJEst
   PPs7Lsz288R7faijvJMKA/twgi+TPr0H6R81h405RTg/ixOm+KbEU2zwe
   ++0/aVlRuzTMbhLaq0HH4BZsAiXDxkwnas8svWOrR9/H521DJfHhTwxnm
   A==;
X-CSE-ConnectionGUID: mKsXST7NTzK+UJE4jQ105A==
X-CSE-MsgGUID: mzml+SdrRRWl+obMWYIoBw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79290091"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="79290091"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:48:09 -0700
X-CSE-ConnectionGUID: s/oeELxrQUmic4aYrxbzvw==
X-CSE-MsgGUID: fU17KLIkQD6CyAo5usjRmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="242256115"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 00:48:09 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 00:48:08 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 21 May 2026 00:48:08 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.47) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 21 May 2026 00:48:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vqhi+RvSyh4t6faidMiYziDhwoZrLcJOv7w6KP4OpDm4+2p5kM5Z2g/HPjfWDITaFpFS0nbroON1eC+vioX6a+JUfT6guVG16g4PG+6Xk3VE1qh/loPhaCZsV7JIE/hs2R6SRp8H0iNYlUihC43kNWZFrk6yb2NciaLLnwq67RslUGOV/KunUmGHDinBsH6sxKTaj6kG7SMAm3K43SNHQhMaDX2ST59B8e2YYn/4tcDLOyLH4bqS+TFVw2W2D49YKBPp02/yhajXoufupuYush71wwxN3KYL6edZa4n874BXggKbDZQ7vjv9/rXNye+paYTAlU/7sPE+lvjX91Wpdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5dJH2+iqdYUgRu1k/GOA99vsYZz4qN4lBM0fSS1N1Cc=;
 b=j7Hm/3CCo4zje/D+M9hhq/ZmLsYzsksMT//prMdShZjtk0zp2FnkKp7Ysersj3Ae/tdPs3GRR6JFAFaTcu7yoMgKzrE/HdP5brqwlee5pYs2rQ4Ws3KCJdsg40AMcxRqfI6sz+mCzaxZvQAs4308zNLEXTP1XxMSoo88qwvvBVHeYil9zTru/pD4wy0uenu7wSLMWYwPHw8X/0HVDgBzxgcT+EieEwsT/pnKUhc90wZMz5TDxec6AGWi1VLb5T94DtS4MIrvhu70ZiBn3ckctYfsH51JXbIezfVH6aivJ3yYwzgyeb5G67Cx48m1oZEA12zzdz64+zSl1z0dPL3bKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH0PR11MB5428.namprd11.prod.outlook.com (2603:10b6:610:d3::19)
 by DM4PR11MB5229.namprd11.prod.outlook.com (2603:10b6:5:39f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.17; Thu, 21 May
 2026 07:48:05 +0000
Received: from CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da]) by CH0PR11MB5428.namprd11.prod.outlook.com
 ([fe80::b8c4:d29:c56:a2da%4]) with mapi id 15.21.0048.016; Thu, 21 May 2026
 07:48:04 +0000
Date: Thu, 21 May 2026 15:47:54 +0800
From: kernel test robot <lkp@intel.com>
To: Jihong Min <hurryman2212@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: ERROR: modpost: "__netdev_update_features"
 [drivers/net/bonding/bonding.ko] undefined!
Message-ID: <ag64qvdO28YiZiId@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0105.apcprd01.prod.exchangelabs.com
 (2603:1096:820:3::21) To BL1PR11MB5431.namprd11.prod.outlook.com
 (2603:10b6:208:315::11)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR11MB5428:EE_|DM4PR11MB5229:EE_
X-MS-Office365-Filtering-Correlation-Id: e1a9461c-a5f8-4fda-f12f-08deb70d4a25
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|6133799003|11063799006;
X-Microsoft-Antispam-Message-Info: UuwelK0hUmLRgbO2Zg1NBygiKrQh6Y19jqumOiiyUgn3DdLSk3lMrb8Yli9kwctk0GnoQulkjTPkOn5fUnTe8dqRz7QFxi0dgU4okx0FiSC2xeGXLB8EKillcGfSrSF1ud7/mXz/hfPRGL42rkHpqEsNNObENW8YetvqI0EJDcf+uRcKQ9hO9Uf2jKVKfmZNiY84KBKQlbe26719KlnhRMVMgc79z8gvUmUJ82/ioQHdtQfrDninX16fKAAjPUV1RxC2Y31XbVQ5Tfm++SjxlObpDQSRsR8DkNUUbXZ+IpDcJ0Joi2GCswhwwkckhtraLgVDQm+YXLDcO33S+xnvTi89K6tDSmfOhn1bym/OB8/hr3il9zNnFfsAedPVtj/Fck56xErjBV9eDm+SGepZeOFw+iwAU2chNupAGmDdWIwt6wjhMnK/PpAvW3QhnIamw3iUBi1UdVDxo0YjIluJ+b8IcNoOyJlV81p+gj+hIaLXvsgt7ALa2GsOJVRRDNB1axXQpGFWRUuxHxqxaMp14co7K6mVi1AwsoeY3w1NCY75Z1m5dTb8dDVTL1oy/kUa6jtPfiHN/pQHGTxKbcmp2etFWIImNQcRT5qorXnb0Zu/yLKNvIfqgYzoH8AZzUKGfY1OI/Rgz9vmAGmnc5q2PQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR11MB5428.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(6133799003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?97zrIwZ/Ws0VB7i+vhaTwZ9/mSOR5zp1tc7ClnN0fmQn0UPG4FDOk6uZiQLQ?=
 =?us-ascii?Q?CURFkP3QuGpYuncCY4DwknjRLj74HaZyrTQp0KYLJU5n9DI5pCMqk7diUTX/?=
 =?us-ascii?Q?fjysN3QHBhnPR2ISJtP1aHsnjyTC4sytTwH/q6lyyVocmvyOKFVPQl9BIYh1?=
 =?us-ascii?Q?259HrSjQP+KAQmPA9mvuUQfUKu/27hwCMlfZ8mSCxee87eV60BygHUqZlIYR?=
 =?us-ascii?Q?PY9nxnS+M5HS2xf0m06Wxz9dAT/hYSGgE88FimLNuFSXB/i77nAG7UgS5Lfy?=
 =?us-ascii?Q?tZkH100NPPBkWVfE+sPkGtzKhIpMNrarism6ULGHMuOlX7isz1YDJ4H2TH1q?=
 =?us-ascii?Q?5aoKqvQQvLk4Pjz9J8KR0aAXk75NUNzKmTbZOVXnWBD4gxNkZcDsm4gT1T2J?=
 =?us-ascii?Q?OnPPVz4hqhhu9N2p9L8NzQ7YDq0MFCKdOjf/dbsn9OOFroitxB+ebSLHUYk3?=
 =?us-ascii?Q?9uNv2InLGo//bJBFF7DPNM6uRcqsDCwMop4zbCkznJMy3j7Sjnp5JvJMZhnR?=
 =?us-ascii?Q?OwRMSP2+AQuTHgBGrWyPBCvTXQgs7kOsko8EGzjB9OorTNHn3lIkDgJKl703?=
 =?us-ascii?Q?EdT/rCxleRQ/m1vj1bpdhibIV4Zn8WP7drdI30mH6KZ9KLtmKWnva7dFGdPY?=
 =?us-ascii?Q?HqZIMjfR7pdWNxJsCFoMHcaK5Q5jS21Lenc2Z3Vzn3X2T7ytJPPlsrj7b8gz?=
 =?us-ascii?Q?svox2iqHbcB3IW4HgJd+X8aeJUqxi0faNhef+syGbUDsRuFR3oEAaM7GumW1?=
 =?us-ascii?Q?MwjEk51kQEqxi+Z8qqx9YpxbN6NrpYw94ssGoOa/C7xEJkkonfY2TXPUv1uM?=
 =?us-ascii?Q?W5kaH4ogmH10KixvR+dtcOuwExxBNFefLA3ymVW5EAp2DtRBk7jZZk2+J11G?=
 =?us-ascii?Q?9AK9KvrwhjLIh/QnCSXT9ZcRZcUicKdDtzZDvGFPukF6TRgi+xP/ZJY4Fu2r?=
 =?us-ascii?Q?llFY6eECR7N+kDhZcfBqjhKZOHJ5LO1bWjpweRIjrkYOTSAHh2q+t5IRLqwz?=
 =?us-ascii?Q?WnnO3pzbzzkKS6QTQNBbH2MTXcEm5t7x4HwdL6swQdTxiNAiM2KdwXV/zWv/?=
 =?us-ascii?Q?HVtDgkGFiotOfCu6O9tjk3hO2conzZeEjFxuMSr45vdtw2nlxRXkcX6BnAuS?=
 =?us-ascii?Q?9TqDTN0FYNyAwdM8XOwtrgj3sExIKkX760Q8xPFDUaQPAZifn7s6vRinApr8?=
 =?us-ascii?Q?/OOOm1LZY8a98KxwI1Q+NmRwR9wUlth2pSFnteBj8/w/59lc8BD0WQI4c1fH?=
 =?us-ascii?Q?TuWmFCK+bpujaDWXYyBOzs2VN5psWz01UgEXU1QPZEsigg74+0XdGJCfopa+?=
 =?us-ascii?Q?P1LdMybuXQBX+zdzqCRXz8AbJAOA8TY79it7skz/7zCabay9l1WvCI2z7TZ8?=
 =?us-ascii?Q?iVtC+RhNmNVbCmyqyP/7lZRbGvepvXQUX+XnvwdM08m/QY36TiSlJ2Dvy1m7?=
 =?us-ascii?Q?8Ufie7xjsNpEljd5IFB5DgUmP9bld35TFDQ8s/xmfO7gyz3NfOUsBpO4BHyR?=
 =?us-ascii?Q?x2DSBUeyUbYr1pBI/zL3ndfXNNpdq1BvXfZGN73C/tLWmH5tL22IeviYoApO?=
 =?us-ascii?Q?A6+BF6Ho1MjUgr/XLiuUgLZEcERETLfG5+gCbZdz0rS7WUIyFgNor5hWbTJN?=
 =?us-ascii?Q?4Dl4ez43fLAbz58O2y4Uf6DDMa2w8ih4mnc0G/woAIwrFeivIak1AXZSDrnY?=
 =?us-ascii?Q?Mnfq/7xejNSh63pX30ImIVk3g8kPH9MfYfwPH0lpyAIZxqFUsRy72wzGd6af?=
 =?us-ascii?Q?uOlhlh+xCg=3D=3D?=
X-Exchange-RoutingPolicyChecked: ZHdQ+9T/432wkmvVoo3WnecjfTm/ZZ8+zGx+IB4UYzjJ1H7tBIaOcKyxb/RGErEmP82Fe9t35Lc6jYZLq6J+ASA3qimPuAIqIPX4Q8kbIlgtk4yjxdAF/G+9clzxSPgoFl4HfcTt8wJV228pcxoKLjK9G9QzoiBomu2J/lou/8YnlWkz3DpDF8zPpRu3a7m6F+WdCE9lwfmEoeA7sKMT10W0SUV5BebJsOlT0JBJlvC3OLQas38dwH4tuAzDeaKNILbGRm0iH5Weg5slbbUIiLcMMDRFgz4O2VdZJYWxkKr6HiiGwqnhLkdeP3ds+fuhB8UX8dvftpkhOZZPzUuUGw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e1a9461c-a5f8-4fda-f12f-08deb70d4a25
X-MS-Exchange-CrossTenant-AuthSource: BL1PR11MB5431.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 07:48:04.8210
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O3ZGdCx8peL+vGLKaWeobNCoxkd3dQqTfY4hoqiua+uh/4lsMN5LRikdYuBr+Fdin2UdmDmYPms23YSYyjUICQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB5229
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Jihong-Min/xfrm-add-a-lower-device-offload-handle-resolver/20260520-162948
head:   bcd1877590171e39d1afa5918b534f20a01d0506
commit: 79f3bc097e51b114682d9dea7428053cf6cbb955 bonding: expose user-controlled IPsec features for LAG
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260520/202605202332.QJE5bHVo-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260520/202605202332.QJE5bHVo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605202332.QJE5bHVo-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "__netdev_update_features" [drivers/net/bonding/bonding.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

