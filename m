Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E657E1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Jan 2025 08:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737362972; cv=fail; b=bHyd8dQXY5wMCkKT00TfOTzNy38pi2Gq3/imFTmV38ZQTYI0SmTnXMcQMG2QpaEF3gYr1CP5sF3F6Iaozy7vzvxyl0bvf2J2UrFFIILmyj2OtLHfQmqpbIazUOkUFUvcD+l0nelDfJ422It32rk0w9e7zv/Hgv4yvL0nNTgg65c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737362972; c=relaxed/simple;
	bh=d6kAGsmA9w9TmYZmLJ9iNzsTwoSwJNX0foavo2YV/Zo=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=aSpZu5+ici1iMNgjx3mMjT1WDSvGV84Mto89eB/WxRPDu6aTgZgUXPIb1uSuHCX8bFMj9mjuM4IDap7X2Ygem93gXV6P4fHb0HkOjsquyrBZoXe3gAXvDiqpux+l/SicRdzJheEC5MfcdqfxETE0Kso7vLHDLaTViU3HXfzISBI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBovzhQL; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBovzhQL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737362970; x=1768898970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=d6kAGsmA9w9TmYZmLJ9iNzsTwoSwJNX0foavo2YV/Zo=;
  b=XBovzhQLC/IPQ6+SVfI/N7wqhtJmzZE2gsPr42x7B7V/C62fACVuQSdZ
   DOsBstW79elirnNEceiomkWC1UVvg5e2iH56xGATlPiPsuwzdeDSmUZNR
   JXyVwVrRBs82tAsfRoEMjHy6jB6knLwUJnLbrGhEnjt4utLTTWMBI5rn+
   vCjtkBM8i/2pDTnmg4q8a1sZsCpvOHOxEAgY6/R1IihyLq4LyI0lOJ+pp
   heWA738AJfEZaJ1EUuo/0OPFLls4Wje/aI+0z6zNT9NrR6jGyPOi2VhB5
   IwDXOuDXcVGmMg7PfDEie250cbmM4J+88T8M0Uc9wp06O9rgFTVfK0gL2
   A==;
X-CSE-ConnectionGUID: RrlN3fuJSbmbXQOrGREWjw==
X-CSE-MsgGUID: uEqA1n6xQYyBQgxegKYsIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="49131033"
X-IronPort-AV: E=Sophos;i="6.13,218,1732608000"; 
   d="scan'208";a="49131033"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2025 00:49:29 -0800
X-CSE-ConnectionGUID: DnxK10gjTN6cS52WfM4hUw==
X-CSE-MsgGUID: 3QXQ3ZFjQrmQf5/kHC3LSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="129709328"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Jan 2025 00:49:29 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 20 Jan 2025 00:49:28 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 20 Jan 2025 00:49:28 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 20 Jan 2025 00:49:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iGzUXhLGTxMwCkExXKzYKiDow2X9BqnwWcyG36duT1hAXqee8g7OEmjZwsy8mQzBb0yxY1eSOKNMC38uKSx6lT02fL6nUYXLPGDzW63waWqPPAaY+Wul9DCbrQV4BLCygrDWv9ZAGZ2CyNpjM9XrGSRMT4RNV0AIJ4zYQi1oqErzfJ8AmfryAn7/p6mFdnZ/pG5QfIj6zeUfLSoevwbqiSTCNlpg0TIyXtLKragPxDzYPD60BMiNxAjTlYhGiG/5jPBJu4lKsbpokGsPvd8vX51YOC+1iYgfPkJDjLxTTtK6wsfT2AHu55+dPhRef2frnm0r+7ssK1zqOwn2kDgDrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a7qpRj1FgT1BOnH397fv/gFWx/dFAh4M+QIgzq58iPI=;
 b=IW51qa3CajOMMYcVBAbJe+qtfyQN95YUDSOjXl49DXBm8oNQQPGioNHLVQoKsrDnnRBjJM8O6iyE4cTXT2ugORSQJK8GjiP1BqYO1LGHiNDJrJUk1JhMqKbNMAN+zbdsUoJaX891cKGKXegiT1fC/5bnwf5aXQX5Dg/iU+t+HtFvtRZTcrnP2wgIOhlIJ2dh4JPtWlkup2ZiHhmBAnJPeP5zJGlBtUEegMiD8wfYXpKbPdulqE7Gq5ZcccW9YfYA2+kmoWb2NHDx8z0EvihEYUrVjHOEE+N9aTTmqX+qsvRt54EDS9lS+P5RRmvIM+wQMo4lNlwBPPa75hrLUYlD3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by MW3PR11MB4764.namprd11.prod.outlook.com (2603:10b6:303:5a::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 20 Jan
 2025 08:48:46 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%6]) with mapi id 15.20.8356.020; Mon, 20 Jan 2025
 08:48:46 +0000
Date: Mon, 20 Jan 2025 16:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: Golan Ben Ami <golan.ben.ami@intel.com>, Michael Golant
	<michael.golant@intel.com>, Johannes Berg <johannes.berg@intel.com>,
	"Emmanuel Grumbach" <emmanuel.grumbach@intel.com>, Miri Korenblit
	<miriam.rachel.korenblit@intel.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [iwlwifi-chromeos:chromeos-6.12__release/core94-22 1/1]
 drivers/net/wireless/iwl7000/iwlwifi/mld/mac80211.c: iface.h is included
 more than once.
Message-ID: <Z44N5myHawTkBDP7@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0158.apcprd04.prod.outlook.com (2603:1096:4::20)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|MW3PR11MB4764:EE_
X-MS-Office365-Filtering-Correlation-Id: be0be272-9df7-4bc4-dd66-08dd392f402d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a99jpjEKHCpUv5HciYP4i+a6zgO0BSscMDJOxZQ/l+6YGU1fDnBW6JwzmEtJ?=
 =?us-ascii?Q?WV3RqVK+GL04mYRZf8E2H0Oe/iDr47iic2YaRpXxHzpAyBMMccaNMTKSTRk8?=
 =?us-ascii?Q?WYWsdzpJNmQlh2CdSwalyeRggtq9eS02n3/fP4zd3fweN8AOsbdILpIlaKwZ?=
 =?us-ascii?Q?fI0eXofrLnDabQzL8JEfJqEA3oMeWb1dbYJyUJnlCQzHv9Zs8fQP2I9ay7lG?=
 =?us-ascii?Q?c9TUfyTo8CrBW4y4kNWvb/L+/RQRlKeWIS9BPlPw4mpN0Mz638oe+Or+zZJu?=
 =?us-ascii?Q?mErPLR6T6drMxm/jDDmyiiTgU8eFl2GHwEr3ikNnsM8Y0/g+Zh6IsnZcxtsW?=
 =?us-ascii?Q?57C3IZf2tghMbjo/d2by79G91eTP5z3UaW/mM1dpvjEidwnAgq/JcplsEeYe?=
 =?us-ascii?Q?MqVinMuwqgkSv6Un3AbO+v7X6YWsB7RlMD5iN1HL8Im2FSRdWNsMdjNwXKMv?=
 =?us-ascii?Q?q98qOgrQpEpLj9kMUa7Tbe/TXradU5dOtII6iFYvpc0EAQdavxYhYGHn3ZM5?=
 =?us-ascii?Q?cF25JMkJYb/8oYixb3vgp0dzhWeU/eqjanRfQRg4/0xPpVdMmjGKoBKXEEhN?=
 =?us-ascii?Q?HbyhQ9uR40PYCyYpYyJla6CCMKvfh/YNdA2KCIFG8xd3MeifUJlhH0wJtyUh?=
 =?us-ascii?Q?w2aDQ7S015hiiCdVQHzUUCafsh04dVHRFHU0T4s0UBlOUBAfqPexSemyBRV5?=
 =?us-ascii?Q?OilvQaZjA5IytxbbLH2vhcrkSowxw0qiUus4UEUJJtWHU1WIgle3nd8S+Cf4?=
 =?us-ascii?Q?3yMrttfnUHJBxiDgbYaFmfeoCyvGVMNKgXIVNDGJl8hhdDnrf74vu6KZR0gS?=
 =?us-ascii?Q?mRvAhx3TKLcDbHPX2bRfvMIGCIfNwTc+fIb8+03H2Alb6iG8INv1YOYQnvD9?=
 =?us-ascii?Q?QzCkmU/RTvdo3WHlB5SpMz0q/f+Oz/3CkOcxgoiOuwo6Mba4rN1OtC0xpHOH?=
 =?us-ascii?Q?cDAzCr1a//I35K+rFC5HdW8H8FvxqlHckzbYq9AoYMObhxoAwQcVpbafl1/R?=
 =?us-ascii?Q?Ta/V1iktT9FkxBVRjXsmKINPjD6sYbYGiDyTEVrFXUnjhyLb8+vkIoF+bsJJ?=
 =?us-ascii?Q?g208+Ct+0loYMtjJ0mBfLbHh0NgJBDoRNIeWLNmi4T4OL3IjlT19U4NWPvZp?=
 =?us-ascii?Q?Rki4g3Yuh08NPqH7xJT52SITEaAJP3cMMBwkt/PRDILR4nOwJkhr6qx6InQ8?=
 =?us-ascii?Q?8PNMP3BCcjJUZH5rINpA0jJZ3hGACzlE0avnRRXwnhV9CY6SOGhdFTjqSAoH?=
 =?us-ascii?Q?I5qMQ73Ugkyrma3bi0QkLtvRjPOu/pfEsgKKmj/bSKrHJQZp3BRTFMoJb4a5?=
 =?us-ascii?Q?7B+DwpPs8lq8HtzVRVnu/hs5Mg4l2zIHhApGCQUKdejECg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o4DCF0M5+d4bbOiE3k2TH1+xFtkWidAGPo0tCm8NGe0clAXuuKmHVU/ebXUZ?=
 =?us-ascii?Q?feYIc8AX0PqG5oypRZ0DQJ1PDpzLnlVIhmi5VZZUFflY42tKJs5r1XE+nc1L?=
 =?us-ascii?Q?vMXPWG+QYWZ//2kb733nVVd1LlQFhThyoGkkntLnR9RfykSzHa+qJVE6IHiZ?=
 =?us-ascii?Q?ym/7G0hPwlAY8JVXBf3c0kbflZ3Pa6pgGBCxVkOqnISEXGzWsmVIPSkjCzAk?=
 =?us-ascii?Q?LhsmA45zgPkAhpZOD1OogEetgccfTRfUWn1Tb1GzsQThl+r4nqICKYkSjLkX?=
 =?us-ascii?Q?hEHU+EWXj5ANgHonJ7KmJK7CFOghUdbvOe277mqTOIYOlpY7N2eLYf2MXd5A?=
 =?us-ascii?Q?bRPL6pzLQQkqztv9rAyrGR44W/jnYrRWNXBv/hPIbueN4c421Nguc24zuBsf?=
 =?us-ascii?Q?lPE6M88ahrwUWs5YVfR2YXNkUsFV3HEth5rIMVB4Al6BW96qVHUqZay0rutM?=
 =?us-ascii?Q?eOAklL3Kld6DFbW0zfr5hoB4zgax8XZd12ENZqR1ksPd6K7xqjxE0ovBGbjD?=
 =?us-ascii?Q?fqwvZpFLab+am84fT2FueJ8Tj/Rd0gfRpDTVGL3KBXWQVDsYPceKWWQwXbxl?=
 =?us-ascii?Q?f4XLSOA9nENIj2dU+e8hJY0xg1vmII9PFC2HxfQEU+JszFMJY6tKNQ7BqDyK?=
 =?us-ascii?Q?LjQ4Wj9r0z/SNz0TK0sE7Xkd1zHi5AKqX0pW52FyR4orbbkKcL7Gnt2H45QW?=
 =?us-ascii?Q?ai+Hs+/18fEnz5dpHIVPpCroX276D8nibn54oj/aUvJzKiGJOYl79RD3k3wo?=
 =?us-ascii?Q?nTPsBS94fEDoubUNkJG79MYUg1vOj9VyjO5bpNDUmeVRuGlxDRbL3ZxxUrio?=
 =?us-ascii?Q?HRcWbu4c6Df8O20kVCUSPhJhwix/m24wdSPhEp28aZRSEfXP+YqFPKBC7a2B?=
 =?us-ascii?Q?4UlpTJpah50PFJQq8gb4Elugv8B7oAovjJ9ijO4uVx1VWN4k+NGMUlzvvOJP?=
 =?us-ascii?Q?OJ81jsUiRQKKZh73XMCBR73Vgy/VtzDKUb0Mgsa9ozQ3KB5pGPQjQETGxn4F?=
 =?us-ascii?Q?1USh/7+QbCbWV7A1SBcemvE68yr+PE1uQ51zAUPiivWI63BOq6oCQl9tu2hU?=
 =?us-ascii?Q?2XGLYOK8YKAO3p4cVjm7E/qaSGOfViU0kZnOcZqES8bCICUsZ4W94JoQiTII?=
 =?us-ascii?Q?D0V+WFq7yyJE3l3IaLt1glPtQaEYng5oJt0oq0UDhCkhab3cMLVDzsWL7Mnt?=
 =?us-ascii?Q?S9nuXyqJu3mPubxr04VWbz7MLBh4OJxF+AgB5DD/aVmPI6KGcEVQY6F/BWyt?=
 =?us-ascii?Q?hGqKgyW6DgFSa0si9l0FgcusZXw6/7HAXU4DZ/BUOqCyw1PirXxo2AwCIEF5?=
 =?us-ascii?Q?QiLQmd2sbgDHjy2yJUCV7bf3YRYONxQVDmeXXX5CsgNq9xdnnYWHo2fC+OdX?=
 =?us-ascii?Q?eghimKjiLvBVytG9nRusHBwLRhFX8CKg+3FZNvzPtfBGDHhw/aQ9g29i+Qv5?=
 =?us-ascii?Q?2joYbP2wNurcfD7S76EJ8BTjOtpWwktk/NuzzranVs8d4dM7rWCL3LWPy0yH?=
 =?us-ascii?Q?JbTLb+7yluJeUqmgZkGbQAC2Cy0GzcyMHlPi+8vOMUwEIqKcS9MQ0FQQ9JFq?=
 =?us-ascii?Q?C24I/gfVYbGvI/aE4yIFRtv2wod0rqq7lJaGa38uXNeSVWafQsnytNltHcjk?=
 =?us-ascii?Q?3Q=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: be0be272-9df7-4bc4-dd66-08dd392f402d
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 08:48:46.2407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wMVe+yc8M2L+4mPYmepcyZorkBNWiykSpbV+UwYnnWRKHQOsOtntJm/j4d23CIpQuvZEQnD2lpR0hXemaBwmbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4764
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-6.12__release/core94-22
head:   602e50d4b13bf636b54b213ed73465b95173dfd3
commit: 602e50d4b13bf636b54b213ed73465b95173dfd3 [1/1] CHROMIUM: iwl7000: mld: record the last signal average per station
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501200256.ruTQBqme-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/wireless/iwl7000/iwlwifi/mld/mac80211.c: iface.h is included more than once.
--
>> drivers/net/wireless/iwl7000/iwlwifi/mld/stats.c: mlo.h is included more than once.

vim +12 drivers/net/wireless/iwl7000/iwlwifi/mld/mac80211.c

     8	
     9	#include "mld.h"
    10	#include "mac80211.h"
    11	#include "phy.h"
  > 12	#include "iface.h"
    13	#include "power.h"
    14	#include "sta.h"
    15	#include "agg.h"
    16	#include "scan.h"
    17	#include "d3.h"
    18	#include "tlc.h"
    19	#include "key.h"
    20	#include "ap.h"
    21	#include "tx.h"
    22	#include "roc.h"
  > 23	#include "iface.h"
    24	#include "mlo.h"
    25	#include "stats.h"
    26	#include "low_latency.h"
    27	#include "fw/api/scan.h"
    28	#include "fw/api/context.h"
    29	#include "fw/api/filter.h"
    30	#include "fw/api/sta.h"
    31	#include "fw/api/tdls.h"
    32	#ifdef CPTCFG_IWLWIFI_SUPPORT_DEBUG_OVERRIDES
    33	#include "fw/api/dhc.h"
    34	#endif
    35	#ifdef CONFIG_PM_SLEEP
    36	#include "fw/api/d3.h"
    37	#endif /* CONFIG_PM_SLEEP */
    38	#ifdef CPTCFG_IWL_VENDOR_CMDS
    39	#include "vendor-cmd.h"
    40	#endif
    41	#include "iwl-trans.h"
    42	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

