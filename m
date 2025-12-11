Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 761EB26FDBD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 13:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765458720; cv=fail; b=mq5/ZGptEl+hK8x0JlS1a2SjcCVqsXs/Gy59ZHvQhaqh52moZzCXHMK9tEBkJkvox6Es7bZ1UTBx7AegGwrAla0iB1hWSgFmQX9F4vqkrkimZYgs+jAcyzqOKZuhlHoMld3Ed4uRL3pMHifNFZ5gyxe6xzysHk/ncHriZXhRTZQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765458720; c=relaxed/simple;
	bh=hl1E0SzsSWcFQaxwZrcPy/nDQNoxM7hXdRQuj8JT8HI=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=CRwr0+zOIey/gOpllXoyAxGl6B/UgVwSdqMVa+R+YAdv0nD0b5FI3vBSL0AA2ISZrfhdsAvXz0bPwyO4MM4wHgkI9DqwaFly8uDlnKLChGlrXSKqPwrEz9r1dEJ+8Nx3ow4+10jU/8VItHNVTJWOvwDZz8bOfTBnCvEZtbcGsX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kmNoiNHA; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kmNoiNHA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765458718; x=1796994718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=hl1E0SzsSWcFQaxwZrcPy/nDQNoxM7hXdRQuj8JT8HI=;
  b=kmNoiNHA7/eSpPZERHqWSQy8USmVkEzJ1vc1dZ/1BFzKAc2gyT+Z9Y0O
   17VMf9HOgn/O1MCmUtN9SFT5n2dyyknEs67BXF4++5R6J84z8xL5MOrWU
   tIQ+dolWrW9H99dKdpqKJfhfk3R43k87zWBF94LDRyV29kMlBa57fBchH
   MOK/HxTFHmRDjzm5tXaHJ5aWBcZqyoa9bQSHIh6UReRBblyTaesIbLdi1
   rx2POsWQnLgcPYKaHSdbRdrV8YIpxOA5dGpjBcnrkFoMQhe6DBfQXH8lO
   zBflnHr1444g4aRWs5zNgn9Q0EEZaC0brf9JZGFCU+Yd0stgfC04+Adm0
   g==;
X-CSE-ConnectionGUID: 8aFlnMM3RaGW3ZHkKvdi5Q==
X-CSE-MsgGUID: JSm8HunCTpi01t1hEmrTQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="84848271"
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="84848271"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:11:58 -0800
X-CSE-ConnectionGUID: JmKrEN5nQZijE3QnD5jmqg==
X-CSE-MsgGUID: ko52e+nNSySVsxy0wrMXiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,267,1763452800"; 
   d="scan'208";a="196799660"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 05:11:58 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 05:11:57 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 05:11:57 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 05:11:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O6Hzkczgf27FFKRBPc4WelwcM6MMH9jkOauehaipBLtMKSMNq/g3UCS9LjCetTW9fVXtWHE6YXb5KfQdp5YeoylD3fns9KQoQYCU7b8xOxC/Y3BmlGhLrr4mrL4A8wOsR0IskHUffXW6/xEY5/RUQYpxQiV9RoarnKYXbRWa82p5c5RaUmobAaCom8pE4xsgjtl2m7Ce+DI4ojHQ3tlCkf0emzv4e4ScaCF3deywTuYCGkL4rfn638os4vYGxRc1Uv4o96p09XXGm06xjE8/FNkmoDE7N9BA9etuQbLbsyi2Iyg54YJlDt856yu5yiC2KXjAwBC35So+AkG/gUyuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0D3K2aKVVgpf5aMOkGnBDSsBm5rHLlclDO+QncUZNNI=;
 b=Q6jqQK8VSMNQSCDq00g9SIRi4QZOaakhC2fzLsDQy6hFMJ75Q2llAC5ZKH7YUVUXnBxUnDIQMHge7AWFB7dfSsHatEcY6FKX5BBOuNE07RLdubhOBIZbyrQvWK+XqBBQNUVenmA2VeJexVQ8GfLKEMpImj/cZJdYuiVU/zuOy0wf6I2BpeoDdP5EoMsstVdvSHwMf6A1iax/5Qk3TyBx9X1qFv+0TXYbqER9UBVSb7t+EBjLZkF5jgCZT24mMf7rdgkunhHiE0OhVMCFonv0JgeUYLPt3URCoQaYRVLjsSpW4W+PEKQLij1mPVf/pVhnvgn/7YC+eFI7KQq9T7O+fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by IA3PR11MB8917.namprd11.prod.outlook.com (2603:10b6:208:57d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 13:11:55 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%3]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 13:11:55 +0000
Date: Thu, 11 Dec 2025 21:11:46 +0800
From: kernel test robot <lkp@intel.com>
To: Raghavendra Rao Ananta <rananta@google.com>
CC: <oe-kbuild-all@lists.linux.dev>, 0day robot <lkp@intel.com>
Subject: tools/testing/selftests/vfio/lib/sysfs.c:2:10: fatal error: fcntl.h:
 No such file or directory
Message-ID: <aTrDEjKiNUVpl1t/@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|IA3PR11MB8917:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e8e25d-abac-4cac-9271-08de38b6db78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9SUhfMcnq0adLTbZQjQ/Nt+RgyN7asg6WatGX7vaEYqVgtb2MkAyXfNvekQN?=
 =?us-ascii?Q?PL/otRRAsdv2+OT/076D1Mpt6PQxAkxpnRe64P6eVuzJIOs0gJusgw59eWOD?=
 =?us-ascii?Q?IDaCQYQv8dBta6Vc3cW3FJ1kWHfuMtKntCGkRjCCUGDVigJSimhjx9RWgKCx?=
 =?us-ascii?Q?NRdvA79qdS4IIuseexOmSQf2xElprbTPR12j5lI2Tg08cqnMejRnawUqRE3k?=
 =?us-ascii?Q?ziNNjUC2gXLm95fmsao8KtloMsQR1sVgb0ptfCFP+w4m0jzOY74wsW/V4DZs?=
 =?us-ascii?Q?r7Q7LtalriWlnp9xM2tNIimSeH/BQb/3eqz4yGjH2nOWR4Z6XqDShtd93UU3?=
 =?us-ascii?Q?cifavXfrN10Itp/j0QxsATmb6DwNrp4VANUR6Yiev/1Etpbi01f+C6j11LUn?=
 =?us-ascii?Q?SXQhhbJhMKx5hMqcoea0Yy1i324UrCvTz57uK9Xmr7mZXofTpdwfauaUO05e?=
 =?us-ascii?Q?i+aPNvXnv4IS0zeO0DKA0/CVkprIZks6I2tAsQflkWmYSN7bdqmvTa6SExrb?=
 =?us-ascii?Q?i6SLH6gIErbPQfS6M0L8Z8K8pO9MGM3i0r2I9BQR7RlJzA+D3O/9phX9MFXj?=
 =?us-ascii?Q?SlevYXvKwz6dqfxsunjsm1+SxGBcb9qe47DYM+uM6bUZnCZZbX6Dc6jmMPdS?=
 =?us-ascii?Q?HPHsQpbe54+d0/608qNdITi92Eitl3iX8q51b4N/NbPwHIXsY4OW8KX3vzzY?=
 =?us-ascii?Q?CdkA+EM56LzKX0ahwzS+4Kw580Mp85nj8RQ6YtsNtkBhYyA8UXDuxA/Sn57v?=
 =?us-ascii?Q?9Yc+X/toaWnHGitqSQJNBfb/A1iyTaySa2YpMfOknQnBBU16Hsl+LfH1yh8Q?=
 =?us-ascii?Q?iv4909TSSUX+HMnaLv/iMyyES5PjPBqDEgdv3dG2TEiDBJ23LsdB2NflAty3?=
 =?us-ascii?Q?FhT9XUSK+gbl1pfurb+O5K6zEf7shKn2Vv8PQ6pKFR+lsjY8nMZzOZ5ks+RR?=
 =?us-ascii?Q?TKcA4aDbUxaUCwxpOdbGrxQ8YoovArFnkL2kj+ncjqcatjhXhjG5H6E7J/lT?=
 =?us-ascii?Q?fSa8nTbBIV5b8L75v11GbRYgE+0V4Z66VtMsskdzcbmipfXl9WrJqArN+Lkk?=
 =?us-ascii?Q?4rT5Ad2JPLb68Ooo1fdShtz7lgp0RwQbGe94CwjHJ5LOOFGkexWwn4hIv1fh?=
 =?us-ascii?Q?Xxjo4eFkGD5+eJjapgU4naIrrTg0YaTNB0a5M7wp3hqxJ6J/4zIyDHdOylD9?=
 =?us-ascii?Q?Q8HXlzoLvu/JQM81vU4z0p3Ds33HU0JfiDCdPVxbZ0dA5OcsX7CGUKszMSxR?=
 =?us-ascii?Q?C8owyLpCWxybh2Ro+5vYEByqVjEb9Vt5es9z5qxmjy/+v5Y4yGXnE/eeabr+?=
 =?us-ascii?Q?LQnzyeREW6svSC0Sj0xZPvp8hXMRXWz7XBoSooL/bev4hq/p/+XBDa6PwyCP?=
 =?us-ascii?Q?OLyMBLGqoRq15Yoyrd/5kr6h+iYcsEGimE0vwjTBzNJA9+p4VF9HbKvAE91L?=
 =?us-ascii?Q?FrO3ZGlg0vw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pyXxu0F/Bw2OKlr5XhxbXCVOya15QNjs/pM43R8mp7Q5Nt3FlNcGBgSO2y+/?=
 =?us-ascii?Q?eLmHYIqO2nuXnM4GKzJ+Gwu2DkOUrPwtwYlOnbrHRvlgt2bbD29cd5aDkR/n?=
 =?us-ascii?Q?sGWjobQVZ6Jw54D/i3HyE3iU7TAb2Fg4XaFI0QupXzs1OpAOXXLALTzJrd8M?=
 =?us-ascii?Q?J8D80DzgHQy+3cMtxG4a8aBdEyRmSR+kUo/Lluhx6HR7kQOrb+GYHb0wuJZu?=
 =?us-ascii?Q?7i8VECRGN+gYJgfqoQd9hwNG4xHKyFsIOPyx3WWVNPwA21u6q4nwzjfiPqqw?=
 =?us-ascii?Q?2CHSnZWiUPIZE6z/RH+lvGeB7Ju2+q5yPpwvkRPMMcYThAkmeisMVwFfVnU2?=
 =?us-ascii?Q?jNRvCG1JMd4xgUAHmh2OJslL/AS7UL+D8ZHRXkoNGNuJXlhuiY3rb71jSENZ?=
 =?us-ascii?Q?eVPu8CoZeB6cJzQjkpKAbOKaO6x5MnTlqXNvFq2MaLdMruo3GgPkbjL0l4Co?=
 =?us-ascii?Q?DM3V6oGqg9h/SAak6kx0d8ARrmjDs+bPVfFS72n7R1CRT4bbDFnZxf+OdsfW?=
 =?us-ascii?Q?mb0tZd5QiJNMG+u2Dsn8vYOLb47xQ3K+ai2e8cBcrcOW/ya+6ljFapiQDTRV?=
 =?us-ascii?Q?W6z0NaDBlQerZBAQUKHUJcQrqnzIBx4crjUWU7bePIj2dQIJ2Rf4RUOQ8lW8?=
 =?us-ascii?Q?Kp+AB/p06qRTSbt81BtcStJcipPdIVmo78e9QfveL9kLAkcfE+OpN4lFXvTB?=
 =?us-ascii?Q?btfu+FFi+lR7VTjCGJHTn7GUzAYTpFXftcuZSuvU0/vLUj0VBvWyAgqgfwzk?=
 =?us-ascii?Q?uPWJyVBwkuM7szBPS2Pxs5BomeW9bVtuz4eUK9tqd+iWx6KdmIzCXaoEG5SI?=
 =?us-ascii?Q?SeBxE0sDJhai56wpf6ZdnvwSHAnZE4ZbeF57wT9e1KFoOsL5rFH8mBH3aemp?=
 =?us-ascii?Q?3RXXh/ITJOr3pag321GwPakc6cdwyxlTiRAMEvS2KaOJHwFLApJ6kUeZBJpm?=
 =?us-ascii?Q?WPjnddOhIgs6ANwJbmIr/pdmInbhRywT28SnJeRYF/EOYRcWFNC8hIGeJwjG?=
 =?us-ascii?Q?MkKqH5Mr0KqM0B3l0Hju1n3Jb83eFiD5Ycblq0IQNWEEt+SDi7Xj2MUuHhcv?=
 =?us-ascii?Q?1YPvDYmG3eqUhKx8+SsLNARWU6zrNRU9caXtkxq/YkdyryM+Ky6eUwjEzgx/?=
 =?us-ascii?Q?1kb4OhwSxgNqN/L8FTzq5seYxksv8V6mLiYNYIcVZpz45jUwmFaS1x4iaTYl?=
 =?us-ascii?Q?2Qpz1/9dVXdxNV9J/0q462Qr9XaZ2B/rplALAkEdULXjQDRUay7nZJRMA6o2?=
 =?us-ascii?Q?H6jQVj8hVHzEYb4wlG7ebFnSaIX+LLHWSG3JVs/nQCDB4cwild6NqiW1wThH?=
 =?us-ascii?Q?PCXJimDGhGx9s134rcVp5zf5GG19J9tByqR9y3lCHT+h3vDZmi0dW0gbIK8Z?=
 =?us-ascii?Q?L4F3ZxgXMLCagF9SsrFfmVIuhhroGwD9OJGTf1fzeONoDLaeB/cYwfrJ2UIa?=
 =?us-ascii?Q?ccHkXqUgzkUfyldO9rdPop3vCxT2eVI+c6Q2hJ//wVRVhgrI+2q4b3zg8cjN?=
 =?us-ascii?Q?2XvLsJ9YyvNAGNkrWkqmcMIPmulwc2CJUNpmfPHBt6B7RDIQhOZt+j5Sit97?=
 =?us-ascii?Q?/iJeAiQzReiAgev0E6kFcuRdPXiF9GAOBuJ5d2i1pQuaPb/iDa90xhte5JNa?=
 =?us-ascii?Q?7w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e8e25d-abac-4cac-9271-08de38b6db78
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 13:11:55.4353
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GttvArt0J8e9lWbXLy4jr+2XjoXCd/xR68dLaeIgTnPBmXcJkqgY4Z7BDrGiCtO3Nf7rYRjXolzkDAJDyixpbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB8917
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/Raghavendra-Rao-Ananta/vfio-selftests-Introduce-snprintf_assert/20251211-021935
head:   4a5587b56280853c777a57f0d0ed02bf603d00c9
commit: b7d1ae2c582c89062b3f85a1f94c1b39ebb547b9 vfio: selftests: Introduce a sysfs lib
date:   19 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251211/202512111413.6b3YU1iC-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251211/202512111413.6b3YU1iC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512111413.6b3YU1iC-lkp@intel.com/

All errors (new ones prefixed by >>):

>> tools/testing/selftests/vfio/lib/sysfs.c:2:10: fatal error: fcntl.h: No such file or directory
       2 | #include <fcntl.h>
         |          ^~~~~~~~~
   compilation terminated.


vim +2 tools/testing/selftests/vfio/lib/sysfs.c

b7d1ae2c582c89 Raghavendra Rao Ananta 2025-12-10 @2  #include <fcntl.h>
b7d1ae2c582c89 Raghavendra Rao Ananta 2025-12-10  3  #include <unistd.h>
b7d1ae2c582c89 Raghavendra Rao Ananta 2025-12-10  4  #include <stdlib.h>
b7d1ae2c582c89 Raghavendra Rao Ananta 2025-12-10  5  #include <string.h>
b7d1ae2c582c89 Raghavendra Rao Ananta 2025-12-10  6  #include <linux/limits.h>
b7d1ae2c582c89 Raghavendra Rao Ananta 2025-12-10  7  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

