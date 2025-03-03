Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E02B35948
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 01:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740965702; cv=fail; b=SyWM/9zd/PkfxTG+zaf75hnEJrsorNeVKXEjagFDnGJQF2tNRTJBj5se5LDfEofQTNqLQ8zCAl0NKPHDKQw9NPxmkycunjQsiW+eyeCf5Lqy8VJSCD2Li06QSqpe1PCmcd6b2e+VqMnxY/Iu5OaCN+K6B6pc0EWSLh/bfmugjg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740965702; c=relaxed/simple;
	bh=c5DZ9W/jwjNeX5OGLL9TCy+V7p6Bl/iEiieSRPBVdBg=;
	h=Date:From:CC:Subject:Message-ID:Content-Type:Content-Disposition:
	 MIME-Version; b=R6KkDNILWQu1ax+NSR2F9/pOfQoHkf/6pwQWMxCw5Hc6XPyGBqqy2FkHFw5vep4s7dKIjISfIQmWObw4p5/MCgAkIWgqzOXCCJGQMJyz5/pysR2gtS1iWIEvTJnVdr2Vi8YLydFvcSlLk3NEpnU0unqCCz7TwADIAW7RWMbkB38=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YlNSnaPo; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YlNSnaPo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740965701; x=1772501701;
  h=date:from:cc:subject:message-id:mime-version;
  bh=c5DZ9W/jwjNeX5OGLL9TCy+V7p6Bl/iEiieSRPBVdBg=;
  b=YlNSnaPoD+Z3SahtfwjvKkaBV1p3RuYbvJ0m3v17AdrIVi58YVVLiuMA
   cxER7PaXUyzfbYc1YFVerrV3awyy1/P/ikvv5gzgntGo18sNp+qZvPSGa
   /8cTuzIksHxEnDPmlDG/X3mMWM02noah1iO0ZxoJJsIhnth1k9dS/XXXX
   HgztZuTB/524sqcrL7mrv5j40AUXX9CfoHv8FzIVo5OCJC+hi2pUtNSm/
   kngPI8Jmd2ZiUx0fAP33u+rldDWK/iKFcFT5RgMWZRnRjZgF6IY33ofIN
   SAk05A8KsLlbslrC0radsB3ndt06Jpg9mO3yl6l5SJguvKoi2cXjimrqy
   g==;
X-CSE-ConnectionGUID: Eaq1P3OAS76Y+XvT2MFIQg==
X-CSE-MsgGUID: CoKe5Mn6SNaTP+UlJpyeEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="59372970"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="59372970"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 17:35:00 -0800
X-CSE-ConnectionGUID: ebFUN+LgQFutxyk0BWbePA==
X-CSE-MsgGUID: e1xwSBJ+TP2Sg5TMHLhxsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="122818857"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 17:34:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 2 Mar 2025 17:34:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Sun, 2 Mar 2025 17:34:59 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 2 Mar 2025 17:34:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3G6sP+xjzloVaKhiFZ7oegfWsdeGx0Py8o9gD8+vgLGomKGxFlc4MZFGmTNn9RSPaw1GX6Dg/43FtrG1MRMqOQ9CmRgufcAZsiOuXbvULwMiT0o78UaCqYsJ+dA5//Ry1jONik3IAz7IzqaGuhEtvjTBgK9mECvGZulHeJxrVKoF3AuLrVNdzBjietaEsveO4WB7F7Aeqlroy4he5lvT45lDA/uJ3xg5cnWxBd7ZnI/s090ogn8uu/bGLDCdisZ5qUsj0BC7pWZxqbqYQTS6zY1XA+/GYiEEkHU41TVOHqaqphUb9s38Ib4jMfDuXcNdOsAmWwJ0kYcwrry7yX7LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lRSD+0PuqSATW9VGhRi66ND/6tAyHZ7N7C7h/W3zPT4=;
 b=lFCTOYZtkvPgz4e1JfcWBFwrR/lSycYvocE6EButJE1+oKCUR+P8lbcCaGjMWixJw1cApCk7eQyB8doxfOtTF1jsNDRJ0GB0AZLUEDXSn5NDGHZcxg4srKCoDVHjEdLoQUuF3jDe6rkoQVvsmdwLEfbAdoooKyQbKDPXRKxTKN6BXeIaEWDP/q0iUI0lnBNOhnyxoXwZPaSUYcDTKDj0fF7bGU7MN+49vy2e+NAHm9j+IPsiRmr4T1CSCRtHkXq9GAcPMPmJWFERbleVBkvwMwWZso3681wMXhGrw9ZDEKLJ2dQINyhOjSUhFN5XaeftiFhJEe15JA2+fTiU1ZALaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Mon, 3 Mar
 2025 01:34:43 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 01:34:43 +0000
Date: Mon, 3 Mar 2025 09:34:35 +0800
From: kernel test robot <lkp@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [intel-lts:pr/59 1/1] fs/btrfs/super.c: backref.h is included more
 than once.
Message-ID: <Z8UHKydq9sDyWRLO@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW3PR11MB4748:EE_
X-MS-Office365-Filtering-Correlation-Id: da93a333-84d7-4a75-887d-08dd59f392a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?o4zyqvy1eRvOPnOYC+GC6/ZIHYch3PnkeNHZDEg+0g6O1m9CN57Zws+vZZwZ?=
 =?us-ascii?Q?dezKE7cxXSQG7kJnPmXODfAyI/BfPQNRPa+XeYaBT/tQybz9BLkGYCjr8VBj?=
 =?us-ascii?Q?GqIJbXlgv6fIpch+5qeacgc5Zvz3v/33a3AzdzrgwhuBe3nJdgqSkx60gyhE?=
 =?us-ascii?Q?cZ6naOw0LCw5HWKFLfvp43gjTZDFDfbuIl+pEEqqkztxXSdtPlLL3J8soD91?=
 =?us-ascii?Q?wNKf1lwCaj0NF2S9bcC7VIMATDOuMCBgM1rmcwL0WLUhMycqlYMySlRcMnDd?=
 =?us-ascii?Q?vIGEamgXmYnBksMK5UojIQI0zxrhmf9bllvPlD0fO/Uqe3/zmntbbG7x2k1T?=
 =?us-ascii?Q?U9C03Ujo67g/yPo493txvm6THmMGbbKAKmSUelr1dgFg2qLxjpMAppgrrujT?=
 =?us-ascii?Q?2mglr/bSwAWC8X30cWYi/hzJ3j/E7uj7YlJ+ilB4J/gnEJjJTLMWQdOXsE/B?=
 =?us-ascii?Q?vqMOU3lG1aY6YgMMQiPFbzjQaF4lMm0726X+OZd0kzLgddrgfxPEzcTRRX87?=
 =?us-ascii?Q?iPrr3eTul8otCuAABJS42q+p2i2emy4jK+g9kWATn99SK/JUKhFw0zAiXGfg?=
 =?us-ascii?Q?zNlxKWauzL01luCHBYITGp+ZElxUXsV7zGv23QJly7W0N9kCUqixQ4XPPhU4?=
 =?us-ascii?Q?V4C7P0k3MqxElMUp2MGoheXBDq6EQusisBf+Ql+wz6LTrD9aUFWgBcErSawk?=
 =?us-ascii?Q?aNsWQL72K1Sv/IIzrwNYasjN5S6mCVIfMHMW2Vrm01ZAB2NjYQ2sdYF4vupx?=
 =?us-ascii?Q?vbOI/sQaUSon+zmrQWNUzUvPKPliGMwdt5nq5ZPQveU6DleAue0L0mlhoqAJ?=
 =?us-ascii?Q?8XrS55s82EnhwO4aOPZKPDyU5w96SuF5EZSkQx5euA2y9VB7A41fhdSgukyw?=
 =?us-ascii?Q?PlwVSOYjzp5ps7DdpVpoNgjeFmuKD4SSesQufE8cPsbWdEXpTzJQk5QcCHTr?=
 =?us-ascii?Q?P4eYscJDeDM2O7XjVhKDW6P4nxSN/UedbsFw8v9ZmNTjEYtB8zNWWOVfRPa5?=
 =?us-ascii?Q?d4CAK/TWrqEEb8boMl++oZ1NGVf4furDcx+DE5BppJC7PZ2K6AlNTev08xDZ?=
 =?us-ascii?Q?NOl1vrZaeQITcP+VItZDJj6evkPgsK1eRaktEp2Jvi34EYSV5zP6+T+zLI58?=
 =?us-ascii?Q?sxyzzOSTOz2coZ8DkEWWLqr+kPyF5Gtwz1pM67yM00IFu5GVLLFH0MtqhpPR?=
 =?us-ascii?Q?HarvxTbd77A38BLYpoyFK35XlS7bEXoEI/Zj8rxpJmjJ9ubVn2EeA0y7yDn3?=
 =?us-ascii?Q?jI6TE9ojQl+JlJx+StCer9dUMi6jSL4FC/9XxdFl5etT2Llvgc9jPpMCslgV?=
 =?us-ascii?Q?XWZq/P2w9Y477ugXw2zcvCqaBIKJOPXYx9P+ss1RBKIJccNVmS4Lrc5/mw1f?=
 =?us-ascii?Q?P5EnvFFCTPZWhj/eIE/C2n9coOGSXLNcZSS8NQjG6DFOE9iATw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zX8JQ/J6ou3v+EEXgqJcpXg12CTiMv7P8QZtDfJtl1EaLYZM8jqJR3Z6dbQJ?=
 =?us-ascii?Q?0CzFDhlthmWQ8qhR380AmbJkKh3SZT5XR3MPwjBDaEOyU8eL2C1Ho+w1LVJ4?=
 =?us-ascii?Q?TQfKMAjjntzlsVQ4PaCAhLYKPEaVfxIG/AYrl9xJ9RC/cXY0oJpfgzsN4zUD?=
 =?us-ascii?Q?oXfpWbxbZd1LF/+HwJ7swNP7pZCOqVQtS5cFSQ6rTfzv9w0M+ZtI0N+3VOhL?=
 =?us-ascii?Q?HEs1hxRmDEaxvKNhMsvH7XMs/CFNuqd7bv6KbEIla1Z4d57/ukL/sxkUn6Y2?=
 =?us-ascii?Q?t7Fq1WxCiuqZG/xag7vQ+f1x2nlNVpbykiEYa+meELFDGZSqm3Oy0PoDPhAh?=
 =?us-ascii?Q?0S5vGlFphR/NcCvOVQlflge6TEdddn3S4AuffXESqRCG2bQGPBVaALCGWqEi?=
 =?us-ascii?Q?dq+sSmQdNWm+JNpEXWwRo6UResyxI05llrW/h06iWAkuE/ItaklL6lYPgFpa?=
 =?us-ascii?Q?1VbQECx1fKVL+cKtMLfgYyl/l+1K2guXcdUaJoBL/HyhXc7+JSw8ni/CbQ23?=
 =?us-ascii?Q?+h7V3+Bj8UD8AQTVg34ZJ+eCZMTt3dRWmCRHpLgWFG4l3KoFc2Vvybph9E7w?=
 =?us-ascii?Q?e2bgdJzDAjNBYyAG7Cf0Gwt9EZzuyh4WuXQoBkbtebhrcNXUL8SvanWZORP9?=
 =?us-ascii?Q?SaLWcLcluEGSkY4qo/ByukiIGejjMiGf49M0oD+Tf77RNuN1wngsNYvMSHHz?=
 =?us-ascii?Q?2reffpspdf4JPoXfwzqS2l+tPkRhjQY6DAtqZEcF8GbDZCPLEsMHxeM29oe3?=
 =?us-ascii?Q?MYKp8Rq1if+bc/pMNCNCwAihAm2N00B46xi9ULHS8lidNy5pOSYib1yT1ywy?=
 =?us-ascii?Q?Y6QhR66UW6d9EeR4gUYX2B8geLPBxFp9+iqbJ/NsQoPUqUaUkDv2jlzpL/sk?=
 =?us-ascii?Q?q/NXCTvgo+4csByZzarP9bqub1ZLi5ru5Qujsh8kTmjgLZ0qMlVkm8Dq+sxK?=
 =?us-ascii?Q?NB/1yUe92USW492hbzYlipbIWOoHGgWHz0lDfHeBgKYGNnX/H4y8KtAx4bY4?=
 =?us-ascii?Q?jfJAUcUn6BgOgMFNGJwA9p70dBcCNejSXZuGKIU5b2AID9UcLEe5Kbvtfq/9?=
 =?us-ascii?Q?rqSWIxLddq/R269NyT7ZC2hOoE48JfbzFBm4BVxIF7wzI7WUHhumA1Vcrn9c?=
 =?us-ascii?Q?r2NJH1BQSMlP7VzGdjSSIzmLc+830BFQWbtlhPhgA+FoBAa3UWBGfoQhjWOC?=
 =?us-ascii?Q?fPoXUoN3UkCpB3RzaiBMo94j3VRzxVjRG+luGY0MGRzAx9zyQFSrY+xP3QI5?=
 =?us-ascii?Q?b2T0MblXfyumtK1q9IbHoPbxuV8QnqR8AMVeq/Z4h+ekznqVsH45Whc5zgJR?=
 =?us-ascii?Q?OFMymUYZz++WGrHZBtnWMeDxRiKAbdMdh/Ux7LRNU97bsXQHjXS1PansB5ZR?=
 =?us-ascii?Q?JQYXZoLrDLkTETthvc1XfwJzWTKBBp5asGPEGKGO2y/3aeXr1x75T6P3BSfj?=
 =?us-ascii?Q?a7uO3PEztyLU89mxZVIVqzvS+GSiZbu4mTJrH8WWnsQYdJ/t7WZVTU1R1kOh?=
 =?us-ascii?Q?f/8HyJoy2QUuQpe5ciNfBfwEeTZt9aNnJho8bj8gFedErSpecAv9PPx3BMfR?=
 =?us-ascii?Q?LggvysQRp7Iv6iu7nMR9KzizewOBgaAcdblzu/RL6xGkmlS/0U6ej2zTLVcg?=
 =?us-ascii?Q?jA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: da93a333-84d7-4a75-887d-08dd59f392a1
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 01:34:43.0256
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iEKRErzlmngvPUv+6AsNpoEW6wKUZAoMGlpKHyRiyBZ1BPZ5eApJpglaQp925tmah/57g0AsfHf0fLbFzZdkJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4748
X-OriginatorOrg: intel.com

tree:   https://github.com/intel/linux-intel-lts.git pr/59
head:   19ae9bc73680fd6c1c95edb5b7e2aaa790e7f011
commit: 00142756e1f8015d2f8ce96532d156689db7e448 [1/1] btrfs: backref, add tracepoints for prelim_ref insertion and merging
:::::: branch date: 10 days ago
:::::: commit date: 8 years ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502272332.m24coTUx-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/btrfs/super.c: backref.h is included more than once.

vim +60 fs/btrfs/super.c

  > 60	#include "backref.h"
    61	#include "tests/btrfs-tests.h"
    62	
    63	#include "qgroup.h"
  > 64	#include "backref.h"
    65	#define CREATE_TRACE_POINTS
    66	#include <trace/events/btrfs.h>
    67	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

