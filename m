Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A46386571
	for <oe-kbuild-all@lists.linux.dev>; Sat, 13 Jun 2026 01:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781313827; cv=fail; b=pBaTRtminrNzPAFAcjeAer3XrzxZoVvCa7SYVoJoTN7jx/uQhoZAkTHIhU3OQ2HHsLhrl/vZd3pnBQD/QKv/MqvilwyyvPEMqQnMQXMqTatje7aGtRDPA4ZdOztJNLhHJ9zAT+/ednrnPbGLNFOljCPZnhYd8BqzH8f3iQb3l9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781313827; c=relaxed/simple;
	bh=7xFiXDAuGQjQMXP02IJMUdNqACkjS3MpqDm+grO2hL0=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=emNE30pgBGeeOhCK7uF2qOK87zJtKRFlNBLay78hlkCSeK4aA1Zgv567llqzN2fTXpyeO0sKxuhWlufgvTd+SAvXHC1Wea6cIYh04e4pEx0YRxAE9Oddxsex/5DhLWqL4zPf67LjXDKhH/QFZwd7jnRs3vMVZJYEBuEDgsEehZs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SYo4rYKr; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SYo4rYKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781313825; x=1812849825;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7xFiXDAuGQjQMXP02IJMUdNqACkjS3MpqDm+grO2hL0=;
  b=SYo4rYKriblGDddsTfdUswA6fApM3lrzNNzI9L427BmRaJ0BSgY4fQky
   lJEzLZAzUp4lgZZvxVoVS8faM9Q4s2PMqH/fXh3iR8GmtpxxY4H7UZ8No
   zUXNsz7wOWLn+skoIvpMZrT14RLP5RHVqLHzJVywf9zb0sXHBc7VE2G2h
   FMSHB5KpT5WTOcasO7WqMgWdC7wPkRCIP63+Wfv1sEPdABWTE5Qc6Kfje
   2epTUkpRHWa5LAQz/8LNtd33bRVFSJs0s7xfhy913upzOW1PWc6tL3cTH
   vYuPVLpC5YBDauewPhuAVmDhmrbHOBpUntbhABkApuibbPojU3B9Y9F6J
   A==;
X-CSE-ConnectionGUID: 4Z6+/6z4Tbe81GcUv98ZCQ==
X-CSE-MsgGUID: R4Y78q4ZQ1uaNSzlHLIhpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="93644159"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="93644159"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 18:23:44 -0700
X-CSE-ConnectionGUID: e7Vf182pQFy7788O39/Wdg==
X-CSE-MsgGUID: pyr2apmUQIux9uRX9gQGRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="251247220"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 18:23:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 18:23:43 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 12 Jun 2026 18:23:43 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 12 Jun 2026 18:23:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UxkldNnh+LuplOWh12kLrUdr0YpNIUao+Uk6xcqwKiGJ3S2j79s7oAO5pqqC08VZqt6z4O/k13GeGvooc1n9vPROWyOD/9E+txEABJghgr8xB417c26+F3sWpdVek3hbUwsaXt/0cIBxOQCGozSb+PUu82R8mxoHomK7lqsdeIJaFYqXgz1LopT1DH7XXl1z2BNiFakT59zrubUYaoG7Oi0GU9Tqi58UmCNWDYMrK79BJlwFYUq5CYj3F3637MX287/fjizodVJWpUPab9Mvq0w+mnpSeOmrscSftzOfxkALeHJlS1aHYBR8YjGbATBiD/qCOqs+Rak92UAyKlbPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91mGh4tz/YL1YVKhlio5VfgqETBV+UcrUsET4xyTs04=;
 b=ntn98JfPODvQZq9raX+5LGs+FDnFhBQ+qshlamvVCgXjaezfFvhR+KlbL3wMKV9gYuwTO6+c2cwMoQK2zNkjc6LmOHrQTc5YIFwOoB3moH3dEplFO5P2A/XJBQQgsl1oHzGSHhAZnkEk5Ur0RiiBVPyaQTxoYmKKHCmMRlxmBXpg1ydqHuLv6co/uROh/Zau//5EYu7VvyQQ4F4RR0vSI3bNEum3ma20Rt2i0SzFT9Fvo/2kMkASvddIt6YtlF94RDy4kDUTnBB5HQPNFv7HWmKoZdUycUDt2kRtxE857d21jewH+f6qyqv6+/L6VoWbiIoB3aG3FK5OUQn1aF1ZjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BYAPR11MB3493.namprd11.prod.outlook.com (2603:10b6:a03:81::16)
 by SA2PR11MB4827.namprd11.prod.outlook.com (2603:10b6:806:11f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Sat, 13 Jun
 2026 01:23:40 +0000
Received: from BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259]) by BYAPR11MB3493.namprd11.prod.outlook.com
 ([fe80::887f:a81a:8389:1259%5]) with mapi id 15.21.0092.011; Sat, 13 Jun 2026
 01:23:40 +0000
Date: Sat, 13 Jun 2026 09:23:29 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [hare-scsi-devel:configfs-ns.v6 21/24] ERROR: modpost:
 "mnt_clone_direct" [fs/configfs/configfs.ko] undefined!
Message-ID: <aiyxEdnJl7cTPAGE@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: TP0P295CA0039.TWNP295.PROD.OUTLOOK.COM (2603:1096:910:4::8)
 To BYAPR11MB3493.namprd11.prod.outlook.com (2603:10b6:a03:81::16)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR11MB3493:EE_|SA2PR11MB4827:EE_
X-MS-Office365-Filtering-Correlation-Id: 8309f623-e87d-4453-702c-08dec8ea6640
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info: kC3cijt2ROwbbdDpJC4CaqDUwCRzTRqt1WjZSBIhWWYlkhNo2Ej+DAjlix3K15bX8fy4iadK1l9c78zkyklj532YI9IeZyGwNcG9t2waYRo+X997FxlQFRPk9/KvU2qbw9SG+qbyUl6PfYPEwS7jxhJ0KnyGInDng3ZUqMcqFrT5ZG+fVFDT6sE4HIDzRcRq5pyiNlS4zAjSfRA9HJxrFvp0TKI3ihJXRRDsl1Gs8W1GRrvMjTP5zb0vQc3/EXh7JA2N9MzZ44qVoM2jENk0NZhjeJrbEvYv5r7Pq+AQPBa5LwY4GqnrS3QiLL9lE3dngnzTu/E9XrGpNwFwZHqM8+vqN+qLir19248XU32qAvV0I1M8AAspq6XTq05S6dizjpPHVM9fwYfeWToE4w7UVXAILGJcNr1W3wkOMA+ib23J11IZQbymKf0S1Z/DwZMpX/V++8Y1tVRK/TCxOcRb/zxdONTdHHBLdiMgtisEfeA9xJDQ1Q3/6W1RvZNiGm0vosv6TMHSITBKgi7hsrUzoFcPGeZSJH1Dia1wLOs3AyWb2SYm/CaOQ/lKW2NfRuyGyLQ09S65O0F42BACNPuGds/rnqbUJVj0OeyDOUrrlnwP6798kIjgXTpU017aFK2iRo/PCG0EqnbE1iv1o3kxrkzPW9mDnOOC7oAzZ0KeksX0JjrFAO5MPnzcbCFAOgpc
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR11MB3493.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QfUD7CWohh5VsNIaOdhfj1BH5rYMBjGhulY38oovTRVr4LqjprlE8qqE/GNJ?=
 =?us-ascii?Q?DF1DssbUyKlLNUOs4xVkfX2Dd8arqp3NyQWtszAXcWQJ9o4TN+Uf0HJNSVHJ?=
 =?us-ascii?Q?Y7/guBhV5iKnOcxIsMQqpqjmMyQUsxwSqbSI8hpzwzYdxB3fqA7BLN3SnFG4?=
 =?us-ascii?Q?w+qPeATs82XnKLJ/OaNA/rQkM1T4PgjlDQ2u+QvD63nyrI+wimpUKBpo0A05?=
 =?us-ascii?Q?yyqOb35uny1mQ1UsgnyStCZ/MKDP1djNQGBwCk397tknKDrt/p6t1EXIw3lr?=
 =?us-ascii?Q?SADyc42DKMW8FxB9oevxEsOkcDz+Vu5hhYdHS4b9KSVzIWO3eXPOZdYId+Yg?=
 =?us-ascii?Q?cZOsMdFDA4pnQtOgTe6E+9kVU/X1gEMq27fm6I2aUyFb2TxCCPApM4QV6U6H?=
 =?us-ascii?Q?INr2lWCHZ40V4gORGsvW95p9jVZUONpsWhv8yqsoXqkBQEf1iirbKA0NHex4?=
 =?us-ascii?Q?qev6n2Ah1mknZA1pDp3CBqMUjhDjyTVBIkTbS94ZGbU189ADaQBZV3deDnif?=
 =?us-ascii?Q?jS42PvqAzGzB2Q6hBxkl/QxMTYCmnYhUj30yesFZoFUVahWv7G8TW/S0U+EM?=
 =?us-ascii?Q?apILEJyLFaUW0SY/qupX9CHiwBIidARDrHr2QFGns4UhoRbBLjSgLZYGJoMX?=
 =?us-ascii?Q?H+ef4Ya9ti390z8FIc8oGxS6YRpZZn4wj9SldyTyW9pE0HnwtHtBS/KiMJXk?=
 =?us-ascii?Q?N+FeUMHEl3vce8Uuhx1yDnviQG3sQVtaw2/5ykZ6oTvqnW5jSx/2qA7SLoVS?=
 =?us-ascii?Q?V/2IdACMiavzQQ4tWjy6Id0NOK2oslRWFK/tT7hilW4bcwpE7TfWLNkIlcVM?=
 =?us-ascii?Q?ZgWAcYGBemM3r/Vjq9LM80l8UZ7bJR0GAHPc5TqYpB3EoTwqrE4PUWUxmlte?=
 =?us-ascii?Q?VXpT7meKgVLwuOafH25mBhjkZxRiqdOSMID+RgV90d14jGnckiyGU2uFTcdH?=
 =?us-ascii?Q?H3yTeKjH3UO5sI4gU1kOU87wOOomkkLpQSpXa4guLcWxY4+CWAiM8kGtMJcU?=
 =?us-ascii?Q?xdgBHZcUbv/njMUOZvXJ74ZMkta1URum+jewbjSpTOkPgawxFBcRf2jD2BmB?=
 =?us-ascii?Q?nyDqWbjEpDQA4I+zDN5isawkBxdtBH8SghfmWfvvS+JhkFdAGREfCHEvnFfD?=
 =?us-ascii?Q?ILecoKjKu2PHnEC+P6WAcycELMd1YwntUtU5Lcp6E3Qh5EofzdFpRFBkqNYX?=
 =?us-ascii?Q?Ifwg7D++OcmGzzhWMyWHfrWdMQECe45UznKu1O+ZG84Zz0ZBDYpypmICZQqu?=
 =?us-ascii?Q?m0c9sBncZ2lENOM/EnHh8JhH7yvyBi7lxXPzq430O+dZuRxhQNcv0VILp+/r?=
 =?us-ascii?Q?eqgMOYrlEPGh42OxK4O37ZlwRoIKeLBE7CO2xyC3d8EBlUKlwGalEAy/EUIC?=
 =?us-ascii?Q?/QV4lcjJdXoN4Zbx+eAQO897OeMFWIa8eNw2BB54y6xsolZrfkYR4humotQg?=
 =?us-ascii?Q?qcff0l3xMGLSmueXtozY0+syiB1wj9zdRdtQJ39axm4BoPeL1osnpMD+RYLx?=
 =?us-ascii?Q?R6qkCg6U6eIpPA4gd4DKzTaopHlKO+SQBbmI6RwMYSqBWa+FWAyjlhxCnkvA?=
 =?us-ascii?Q?ZIOjYBI9aGyD/mNFj3Z+DP2sh8Ksq1eHUYrxW5oSpZXbpp7zMB62bY1fIvsh?=
 =?us-ascii?Q?mCwMxmpN51yeQyUQt7T1H2qTHPVBXfloqEzWxNHEgku/Dhri7LnBXHateAhN?=
 =?us-ascii?Q?u/F86jpCr8R52tBYLVcO/euSRbNhSGyryN4NMWgFsZeqPN9QdNWu08C2CdMK?=
 =?us-ascii?Q?6qoYIRwLWA=3D=3D?=
X-Exchange-RoutingPolicyChecked: T0x6kcMzKn1yusyyZ1stGSZJS3RCDx0tonc6k3yjBGkKlGLHaO+zlobJTnei8R5v5QtO7eWQSvO2xn6mhOePIezkrUVOgo9DKtCAo9mmURlvsQLjLtm1DaMfiZsoTklq466Li8YUxxCe0FQEWerPn5bClESUV0gJkQ1RPCAtEtJvbasZ4e8JJ3EZwZNucsACq0uY7UKlkxn0vBJsBDq5i1ymWt5CvfoCiA2Kn+k7Ov8LgMlHHj5UYaMss0/IS6j9XpxozUnS2u0thlcC5jnCZHy9KMiDqoLqvM51WWArOuZzxD4+PxfhYQEi5wi+sB3T8ZDAz0fBzNUzexr04ZLKdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8309f623-e87d-4453-702c-08dec8ea6640
X-MS-Exchange-CrossTenant-AuthSource: BYAPR11MB3493.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2026 01:23:40.1012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: etZIJaC8lWT650hHbKtwABTTexa31nL1t9C9dP0zUP4ZSrJVkx2+ZzqvFlllEGomdYMlDncd5zm2a4yPxKVFww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4827
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v6
head:   65843faa046b6a3ff4953aba7319313104638535
commit: 6c327e2c66e67e1296c6bd57719991db3a0f250c [21/24] fs/configfs: add superblock as attribute to configfs_pin_fs()
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260612/202606122115.g8BLJRxb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122115.g8BLJRxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606122115.g8BLJRxb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mnt_clone_direct" [fs/configfs/configfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

