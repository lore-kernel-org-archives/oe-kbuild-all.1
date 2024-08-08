Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8279033E1
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 01:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723081239; cv=fail; b=iY8P7ydgWrPQQTucwYhM/3Zg4YK4cw0BEomYURHyh+QSn7ucaMTFsCbRW68vITXLT8QaaN9Q7zRnC0/r9alSjZk0VY7fBLTmwbZPHY4/oFrCoBeUhSriq8axMIH7uusVClD+Mcq6B+VH4LCosUEPzpf0WagexVmbdUJ/T6lQbIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723081239; c=relaxed/simple;
	bh=ZhPUhLuC61lR9V7NuHHM5iP1cQDoV+qMZQOk+o4GM9s=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=V+XF9AO3MLz8U3ANpSC+7HalbBANjUtuQL9M7M6dyLFN0rQI2jqEbcaO8ZavU5e1OTCagGlGLYwNWNtEDVNEsMIdTs0xwfN/Qy5OBeCpKnoWsBpJHImmX9dEpyHs6Pj+WP+2nn3fkjW6kCoTPIVzj6SCXU+gOjsI+FlG08tJNgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aq9KlEnP; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aq9KlEnP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723081237; x=1754617237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZhPUhLuC61lR9V7NuHHM5iP1cQDoV+qMZQOk+o4GM9s=;
  b=Aq9KlEnP40SJJp0woxZdbYU1v84/UXW9/hWoDDKhO5cPhK7ffZ5hLa4l
   g44TFK05iopWFsu68PRYTuzmXXi8xsgkWq+R2HwO7WOiDt9qpyzeAz0Eu
   ikE458W7tKjTQ/pgWnhb1oNZj/ifh9oWSEvmf1TC3OcdGylTvMDiWYA8Q
   czG7J+0+mIzLCnE4LjQlvnmAw+ODXJp2OzaSMfhcih2iW1K9dlG9Zgswi
   T2hqas6PbHIe/LT4Js9f6ncVCpiOkFxHFmzqdJNuTMv7dlTtX6uo/UnbB
   +JqweCX8BeZE9XiAYhVViGHRNwpwHqEY/UgSOXjNaDa+/S8AmfGLxAbLk
   g==;
X-CSE-ConnectionGUID: E/kaNRN6SjSLTXYR7kvP1w==
X-CSE-MsgGUID: XkvyWhJYSna5G+O0GHoz6g==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="21156850"
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="21156850"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 18:40:36 -0700
X-CSE-ConnectionGUID: uDiaVasCRGO1cY2tLKPL3Q==
X-CSE-MsgGUID: jnJ8MVWzRaCQQpQp4h0n1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,271,1716274800"; 
   d="scan'208";a="61162422"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 07 Aug 2024 18:40:36 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 7 Aug 2024 18:40:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 7 Aug 2024 18:40:35 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 7 Aug 2024 18:40:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CiNo7o6K2XlNmevQ42EA2WnYGxqM2WZ2VPW6sNqlwXLxSTDlCPQCCrddpR4nP9wUJelb7w9nZwv+qIibddzZ8d1A0xzAxo1JBlujjFZm03xOUU+DuEwos/Y+GDKq3KrlfUOpefi29W7DPi53u2ZskNkrS0E8w8HMMzFHGbFYczJKRY/FSCZWBvdV2bXo4R08vXbUCzZI6HJU9TGs8ePGhdPotID0wZHuaHYRLOSlZjViAG3dM5RHGXSaDDUw3kTCYWNMeEtZRlGQcyVafuVYTETQ832J0E7Db5PVqXzIRjUdWfu3g0UcmsH/PGg2OzbemZH0VeQF8k9lbD8xsFBz6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fPNqqX1Aa4HlZVoXv9qT+DPUm48KF7e9vHaZVlNlJmE=;
 b=Oj4FNu1EGdQP88yJv0h/h1CY9+LOBimZmbRHvmUw3ozAzYwZmnErLsiyekSVC5tD1tV4IUUJba14Al9qDB+oDWgJbuA6LWwT+SypJDWiKhj2sz0hu2c36grfzmVUjG9JL2mg3/Ns/BCtZpwgqLBMx5SRHrXS8TfjCi21pONDpEx1g43vuf1lm/HJWyV46Wzi9t9eza6BLdNaQGYA8JgRlKXtlgIysU7wLPuiZP9PBGuXHWx5DBV6iI3YEhcUS2+jAIb4AyKBkM9YP0P3h59UjZG7uu50qjggoZPDiQQbD9rdjKQoxAs3NT+1Mq/55lFotR+wNRrAmmWiJBM3xOfcLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
 by CY5PR11MB6185.namprd11.prod.outlook.com (2603:10b6:930:27::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.27; Thu, 8 Aug
 2024 01:40:32 +0000
Received: from DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e]) by DM4PR11MB5423.namprd11.prod.outlook.com
 ([fe80::dffa:e0c8:dbf1:c82e%5]) with mapi id 15.20.7828.029; Thu, 8 Aug 2024
 01:40:32 +0000
Date: Thu, 8 Aug 2024 09:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dikshita Agarwal <quic_dikshita@quicinc.com>
CC: <oe-kbuild-all@lists.linux.dev>, Abel Vesa <abel.vesa@linaro.org>, "Vikash
 Garodia" <quic_vgarodia@quicinc.com>
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 29885/30000]
 drivers/media/platform/qcom/iris/platform/common/src/msm_vidc_platform.c:
 msm_vidc_debug.h is included more than once.
Message-ID: <ZrQiBkx6P+U4DTS6@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0156.apcprd04.prod.outlook.com (2603:1096:4::18)
 To DM4PR11MB5423.namprd11.prod.outlook.com (2603:10b6:5:39b::20)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5423:EE_|CY5PR11MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: ac186cf4-f154-4e2c-8774-08dcb74b1749
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?y9/HRXJYBBBIsp1O/GbWiDlIXZiGrZBqgBqByDbHxRxkT5jvlg9QwRhN8qXb?=
 =?us-ascii?Q?CdIzeeDVmXXKRP9F/O5OUCcktdzh10V/7srscmp0E+WzCHY309gct5Q0v24X?=
 =?us-ascii?Q?kae8ImmiBcV57wIoTksD3hRrJ6dL9rB3DeEG80KvIKjBztbP/R206zD5GuRk?=
 =?us-ascii?Q?oKyn9kFmWX5dM0m77+FbzkB2aPmyi1Qx00gyvFMC+PxWgeC3R8imt1z8/YMs?=
 =?us-ascii?Q?9qpl24GtP/PzpKrwxbfz5vxtRbWy+fEnrW0yDwpzwXioD/yq/rbqRCUX76oP?=
 =?us-ascii?Q?jmEIcIeiBfbjuw6aXOFhwir6KGlFPxlRBSblfNNCq+SC++znVcqD5wsiIAQ2?=
 =?us-ascii?Q?AxtW24t+p3176tRQEfUXhT2bb0I6y4seqL0IYuKEBLshXq44pFEZ/bQQECeK?=
 =?us-ascii?Q?AH2MBzkvn+evGwjRZxgX4dtyUOWR1MjLNd49IE7RXkln+/H1HI8Od3qwuKfy?=
 =?us-ascii?Q?crDVQGiGx8B1pKkMJo5tCROxL+vWe7YxS8CmTp2RlZcZa26mBgBdrWaA4boM?=
 =?us-ascii?Q?J4eSjBgI9oeg6wg/GqOgL1yGyR8y40rt6T8SmiS0IkDJll+jH/jP4Qtwjo8k?=
 =?us-ascii?Q?2nTH3cIcT4OLAUadYrqBJwwyenm9+8P8m3elgoJ+y1+YjCIQBskgTHGB81ad?=
 =?us-ascii?Q?9giUS9Dsqk758SPUZpSGAA74l7AWSunLQMRQHHs/CQvCBEEOv/TTSTz5Hogb?=
 =?us-ascii?Q?T4+LwuU7rPcnFIvDKxEJ//pthzqvXO8RaYP8LqSCZnjhGlPIGrleVUcGN3Nm?=
 =?us-ascii?Q?7WcEYK8oSZJIbKHCZRyKwdpKR4tDZHY2uIPLCpOcQzA5a+PZPX6Hmpf2BZho?=
 =?us-ascii?Q?1EuiJs7wPV6DmQR2KNLMVyMtSh8NC4ZFObCG3Vxd2u0fXmrkox7XYKl7rte/?=
 =?us-ascii?Q?jdbLsoqLr3fAogL4OEdxdUZuncMyn0QEqkjg5vdesHihS2mcYJvT6e+r2vgM?=
 =?us-ascii?Q?cqYkMPesrBw26vt/VdbHwb2alVw88x3N+rp4COSu+qCF4Ax3OnvCWsrpPzeh?=
 =?us-ascii?Q?kRcrdUuQYXGqzvfcvBdk43uhl1oZNrk7DVv6dnBdDYLNMTfVdMpDUVgMD5X2?=
 =?us-ascii?Q?hqQ+B7PmcX3OuZEq14NY45MeU+6QRQxdms0xb+OIIVlEHflVw5iO1zX+UhjH?=
 =?us-ascii?Q?WElU4vOsRk4B8qFzihMRGRQkNKjnJkm0KRE6DnfWlabTVVGoS5jN3RSgK0dW?=
 =?us-ascii?Q?ahGsgRPIcqYKi7s2MB4Z5dtAPAbyVWsTs5SsCngljfpmitXJlnvq8YqDb52o?=
 =?us-ascii?Q?n+4Zt/TlrS0vz06pEDSJ6ffllFs3yuTrAhInfs/qjIY+FEpzDIWhuX1dV+TB?=
 =?us-ascii?Q?gJs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR11MB5423.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?swLG96+f8rcu8Rx0mgqrBFlZdG916YETfcmeCNA2q73RPmmpP6KjoQVaEAe+?=
 =?us-ascii?Q?ywtwz9KzbCSYcR2RygDnHUkUQc8wQ6o5vNPywzTMopcqdOQlFJI27phVlkVu?=
 =?us-ascii?Q?nI6KQ2qWImM80vuHltufBRpGdMVJGeCZtqtJyULiz8AZ8MN4xI3Qi/nH3+5n?=
 =?us-ascii?Q?aGJYSYyJeXJsPSaeOYR6hr5d9Mj6Ogop0yrR4Hpd1Q6nVxqxy2QI9PToCP5c?=
 =?us-ascii?Q?k7mIcgEbA1O6/ruZ/oUNwmrh6DCgH1Qn/TImZ+Dzg+tJRbjZ4iaf/V+w77AF?=
 =?us-ascii?Q?2AZuENFUoj9xbIBM64il27RNXxWdsqsfhwdmJbuPfE5Je0WUZB+vzZFUAhaX?=
 =?us-ascii?Q?XFjHvAbY4woKPlcmbQwEG2pROkN88IRcIeS5RsKC1mx07+gdtHzGjLjiRm0F?=
 =?us-ascii?Q?AzFn8ypC1LgtgaRHERSlxvlUpHxPJQdRp5Jjn53m3X/FDC+F+LtjtW8RKqhK?=
 =?us-ascii?Q?wcRBS+3crScg4GiTwl6DtaZjA37ajzP0O7zXITMmtm1mdcd8qG8PKiKrTTyQ?=
 =?us-ascii?Q?FJXmK9dFwpFTjgV/LdD5sWJLG9yQOEWs8Gzdudl4i/Ypf5MkQVBdJfU+dnIV?=
 =?us-ascii?Q?zckhq72EzL0yVA4I/kG/COmUZ8pHNmJtr+/4nGAEf6i+cxYpBYFBNHNZTvnG?=
 =?us-ascii?Q?0hoqQaJeRhx1av1rEtjiiliXXn1rrlHyPAqF8CvHvGs8kUEPgk1NCQEdw1+p?=
 =?us-ascii?Q?97oZLw88dLEfYmm91+9OVnYAxsMVhtyXrrY3wjudsDJ9ly66NOgiAmHBWSaY?=
 =?us-ascii?Q?eznUxwIeLzPNDjKmnNN5nG1TGnTMzcKv5ui6oFn6dr4S3FlvnwUJvhwSstQo?=
 =?us-ascii?Q?IG4d+u/SfQ9o0HjRwgqC2+EAz4kcr6Wq/WFeiXAMs+tNYAS5dHLKMGqOf1Z3?=
 =?us-ascii?Q?EeCEsDGk0aJA29Ps0LX/N+Xa+PUGz2zLPYC8QBftFrt8I5RlIb1cPv7TcKZ2?=
 =?us-ascii?Q?1BclyLOLHWHK2AA6uDsLIgoYfb23BBOL87VhNYY8/PxHsigZEhunUhD01fPT?=
 =?us-ascii?Q?9h/BcSaxyW/qnoUQNmhc4j9CPsnS7yELnTNfPWKuEBS3N+Wze4jz9BEmh43e?=
 =?us-ascii?Q?9zZyRE8ILFcLkFIn4nAnIdm8UDHi1NcH+qBa8WLMGqYT28NR9naTh/ntGmxa?=
 =?us-ascii?Q?cy1zAjX1G521LMVlDikDmuNMETtKCukgxZJY+5DyCqxxDdc62fTMSUUhUmYS?=
 =?us-ascii?Q?z31Po4XKGFl/J7uhTFzdH4qJYxnH2aIyJngBY81dEeu5CdHehjSORsAFHiN/?=
 =?us-ascii?Q?rNVgaWhoSyDrQwFOyHA6/qcP7gDubKPwIFknWqVGCz+gCxx9eUYZtVXSHkpi?=
 =?us-ascii?Q?wDVVlmKZdvPXV0Vgdn6qIH88yB+BehOjq2auQkYgdPOEtgzn6czyDfTskawY?=
 =?us-ascii?Q?a972EcH1mb5eG6q2PjwLRyp08ombd6NLkSsaQi+cuAcaevzxDeq1e12U4+7p?=
 =?us-ascii?Q?diRwXylo1kNvaoD4EU10DfqcPbTj9ZB56xUrYFK+/RaYkJlk0WKcf5/xGBED?=
 =?us-ascii?Q?4ekNe3HQpAhQPjEIb02QxKFplSwtebCCnhFuHDnj9Bbx8bpZFp2t87TpmYbi?=
 =?us-ascii?Q?nmnEgC/5mtWJnyNfJzvScARhH9ye4mA1Ox7z9bdx?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ac186cf4-f154-4e2c-8774-08dcb74b1749
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5423.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2024 01:40:32.4689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjlTiYM9M9gfRNvnolO1Vqo/VwBrOKD56bfB41a3KanJHVihjFt7gd+6UJhTCcBaKq27IIeHMNyHx/OryctN9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6185
X-OriginatorOrg: intel.com

tree:   https://github.com/krzk/linux wip/debug/soundwire-wsa884x-interrupts
head:   77aa965762ad9c8711d005628b5c471007e0df82
commit: a0588374098c498ccdcf05756c30a461fdc13442 [29885/30000] iris: platform: add platform files
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408080641.cAl7MiYA-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/qcom/iris/platform/common/src/msm_vidc_platform.c: msm_vidc_debug.h is included more than once.

vim +14 drivers/media/platform/qcom/iris/platform/common/src/msm_vidc_platform.c

     9	
    10	#include "hfi_packet.h"
    11	#include "hfi_property.h"
    12	#include "msm_vidc_control.h"
    13	#include "msm_vidc_core.h"
  > 14	#include "msm_vidc_debug.h"
  > 15	#include "msm_vidc_debug.h"
    16	#include "msm_vidc_driver.h"
    17	#include "msm_vidc_internal.h"
    18	#include "msm_vidc_iris3.h"
    19	#include "msm_vidc_sm8550.h"
    20	#include "msm_vidc_memory.h"
    21	#include "msm_vidc_platform.h"
    22	#include "msm_vidc_v4l2.h"
    23	#include "msm_vidc_vb2.h"
    24	#include "venus_hfi.h"
    25	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

