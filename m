Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F279182899
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Feb 2026 05:01:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771304520; cv=fail; b=bEVQRHg0ABSUf2ehxXmlzU6iYMaLf5w65R6kgyLBCgSQOB2BUu0DqiMEGhtEKYgUoQsYnvbCVTcPmZy7NuTim5eaM56Mb0OQT4ifcMTmAUaR7fWAa0JiIAElO6J0tIXoNVpEqsQhj6XQkYOrcoxqIcd3/cebuYDiwlnyKwDbzYo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771304520; c=relaxed/simple;
	bh=Itc89t7LkMRZebb5W0eL3CrDgn24ETzTQC7dzg0QenE=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=OJ5DKt5YsLcp8UFQwkXPKeF9X43kUo4oSMtsSc9oAIn/3lwWe/1V6KCh7NUBXWgNs73yGnyw7rQ2cXZqALzBKSOWb6IvBPFV1B9GzUSCjOLn4dFpUS+hBFGyDoZis1n3nbhPXrsDQkLZL0pNOeR9T1FF8NZpDV3AQKcOhhV6LNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efUh2knX; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efUh2knX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771304519; x=1802840519;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Itc89t7LkMRZebb5W0eL3CrDgn24ETzTQC7dzg0QenE=;
  b=efUh2knXCv+HgFl5mdtQtzDfLGWpMieJdLhdyZNJNdQQnOQyXrk9XWNQ
   /3gPqAdNyWrR6bo10ahzmttyDCxbhJLDM7Iis3PvTNacWMf5/CG1Pei8z
   PkjLo6/jB4NkzQcUMcVVGOu2n837OmaCvzLhSOP5JUoMLHBoK037Ht0FC
   dfJ+MTevX2cCaKJHXRMFxkC7bfrfoXok1eky0k/MjUaXj22oDdsaKO5S/
   7yOcnKcSlMG9IuKn80JlmJYxwFKTb6OUPtpN3pd8WoFffpbtW1BqTT5mX
   DOZUKsSpJiK2/tYMDz/XSeVTS/yroXEpdLZKGfEPSSv9FP70txsMV37+w
   A==;
X-CSE-ConnectionGUID: OjfzHW1HQFehsmXgkSUe2A==
X-CSE-MsgGUID: XiQvLFrCS72XV46PYlzROg==
X-IronPort-AV: E=McAfee;i="6800,10657,11703"; a="89957500"
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="89957500"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 21:01:58 -0800
X-CSE-ConnectionGUID: Ulpmp3ahRVe+Jigq3xPeHg==
X-CSE-MsgGUID: BKVz/QgZTvyd660YX1WV4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,295,1763452800"; 
   d="scan'208";a="244367020"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2026 21:01:58 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 21:01:57 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 16 Feb 2026 21:01:57 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 16 Feb 2026 21:01:57 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=deiOtb46D+eSqP+5Er8dOVO/WZm0JuORtlzrYGJCPnDwcOlL0PcbBWFt5ea9SRpG77oWhh8MyiOlY4b3mM0APojT92Adav1yUAMgTsJqg6XCeYn8nWeS6CN26dgiQlkd/dIlvlnCbFp4vpbMBPIQIw76iRmXCPCp4ZXgclz+b+jI06eeI3mECajx7YBmZ86vjNBSNO0Qf19Z0CUoPYmTMaGZqX9L8UpDl2HE79RG9mmy4tljUlDqnAOrq4mLlQq0JQ99bRTrAI2CVESQFUQONH7acYeJCbFHyJDV7mCTFCvL7/WA8SNap4I9OQxW9X+7ErSNHeVZ6Q4dsYIvDs/ujg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I0ZJ6gGq4OzUMM/lD+GX1zBKP5M9j52DFx2eaDJQHtY=;
 b=MrEBHBIaTWfRsUEBuyrxJ+vLmED1dE9J4yJ5zF6eGb920Oikx0IYq6ORF22/FLC1wf55ldpoyxcxkwcDiHHI3Dgae3Bsd0otSIasMz/RLkHX9YAry2jg0ItUsZSvUBtuF+0O6hdV3IE6IJV1bPg3luRYrWgvFYCoo488elSlGpssdMpd4ZaOEJB1yDWdOp8zhcWxSCb1mMHQ6jAm0w/5isBJ4bIRdN8TP8aNQ5uu8V1k4EXkZ5rhqdQbFGeNgoPFsgTiu8Mgv11cl8HTufj7E++kNVcpshNvI2Tl02P4lebPw0K9wMT7YA5jI6JsTNKVSIRc+8BLM4b9azDZYX+BOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by CY8PR11MB7033.namprd11.prod.outlook.com (2603:10b6:930:53::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Tue, 17 Feb
 2026 05:01:54 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 05:01:54 +0000
Date: Tue, 17 Feb 2026 13:01:44 +0800
From: kernel test robot <lkp@intel.com>
To: Richard Kuo <rkuo@quicinc.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [bcain:bcain/boot_qemu 27/41] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <aZP2OHkUH370zsmD@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|CY8PR11MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d13a8ab-220c-4902-a68c-08de6de1ab3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YbTLExn9XjogmOnlc7DxE+x7aGqmuUZgxG6VH+gSudvM8XF1RSUkUaWGkZo5?=
 =?us-ascii?Q?n2vtLWxki5+mAq7ktntNuCvQewWfONuroO6DvZ22Fz6RupWMPKHGGziLU+j0?=
 =?us-ascii?Q?7pE3XWkbR6leuvGCNTOZ5l7Zw89EY94GNMygYHlJg5gz4+8XEdcKJa1bwvSE?=
 =?us-ascii?Q?dvrXemVbJk+g6cpGQnLjZws49GZfvej2m8bFP0d3z35GVGD69MikkJJREyld?=
 =?us-ascii?Q?2Orvk9jLo1Jedu0rtpYcuhtoZxm6IDEZJObOT7vAFOIA52VW6o3Ri2TPhTN6?=
 =?us-ascii?Q?wqR39Ww00PMQdxJRLwJ/EwGk7iH1GsVOG0rIY66iNH20lHCN7UIHmwBFniAx?=
 =?us-ascii?Q?VBojU9HkqBM0bR9S0tSDHVuryAQEgLiJT6t/r3sJtBKieJ5ImhA6ndxHkHl6?=
 =?us-ascii?Q?uTtHfFiycllExXJmc3dc1RbAg9WWmNvbhEYuz3oEWofD+36yzV2ZCnSPEVfg?=
 =?us-ascii?Q?gNfhx0L/SbotpW/sTijyhRNIVgtlU/StBlbRmhNkfrGMaleveDA6z+xWZIYq?=
 =?us-ascii?Q?OCJtwOMcxUbKxNPCku2Nat9l627DrbvP+NvOZqEiMSCUb25P2JoJTqWCwlKR?=
 =?us-ascii?Q?7Qzndrxkjj7WQx46duBaNxBlUZh6nJR0CYo0kl5V+Mc+3WngBC6xHcjUrQsA?=
 =?us-ascii?Q?XT48QCEeuD6QY+fFPI/J+C8Snuxl+eWXXb5pKChQPUIXF5uwTQnI7aoN5AHM?=
 =?us-ascii?Q?rdwmyRZC4pzixgssxLIG7IwExpITdfag/T7LYOnEZOZotuCY1OG7XMcMF+1R?=
 =?us-ascii?Q?E7/gDNSeS7VH5nnZUg6Wece+QTxu5daWFgOG3qRUzIvKHrweS3acPh65wHP5?=
 =?us-ascii?Q?1Oh3YYlQ89nm/9h80cizb+VDSE7QGCvh/VVz7XjbPQEPTYEs+rgJTut4DlGr?=
 =?us-ascii?Q?UqKxJqgB+4hfEhT9O0Mez1dUK3itIhDjigr7h8WICkbkXXncw+TfGEABoiyD?=
 =?us-ascii?Q?mhGq4C8BDm7FKEWMFJ7St2I8hVAaFI06YJRcaoclVpU09B52I3yEngIMQC89?=
 =?us-ascii?Q?taRBtrwz0CmYcv9vOVnwkDCOMGT69UE38FPXiMkK4qvgETLfR7YI1bXiCOk4?=
 =?us-ascii?Q?wn62620bdgEUjdYo9wUQHbd4KrFIM5BrXn+glfO5NgbooaHxliYasS770flb?=
 =?us-ascii?Q?Xl26qLIyawJnlh6kGP6NSPETDu833lBaX7bEdbQ4CsLShU4sdybn7Vql6ZGu?=
 =?us-ascii?Q?lZqrImK5nith6v3oSwaRM0yX7ZmEC071jgM2SYTdRE0nITHWUZievJFbRJNg?=
 =?us-ascii?Q?fagfhAeG/5F3cjaAEnd6kj+4jMbxJPAJCG+AokPJ9nMysl3XEhuVrHnFcBB0?=
 =?us-ascii?Q?RqEWk9aIhySD4nrgK+vLsL/HmznbF26yr28GoXWCyvRJ8pOzIVNvRv5fHIwR?=
 =?us-ascii?Q?u0LIqETReD7OYRsEK79hoxpreLRVTqWl/tmdRh9REQjG4eZjQFEw97oVD/Yk?=
 =?us-ascii?Q?xdt+oxOusxyjK9XFfVwvrKuHbYuAFsQk1pkKwK26MTWJ3zBTwW8Rk7AjLkuZ?=
 =?us-ascii?Q?JMa1i3cbNuAtfgVpBG4uvngds6G3WlnObx20wX9e1K//+kxvSXXkxTx4+UE9?=
 =?us-ascii?Q?p9DhUai3C7HuvYwraNF4156zAlv1LU2dSJ6KiQtx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+ZSanr3O1VIRLIT8cvzEwJR0jn1FbIQqLaovYrR8FHtQrKGPnITN+qnUYu32?=
 =?us-ascii?Q?U+a3ef/oQx9Zigjc8K+v2O1ZERM8TOBA1iU8BbnXO3GDIA2+0a65Sp765KuQ?=
 =?us-ascii?Q?M0sMziDL2TO+D9XYu8GR7ej3P7DIuoIr58ncS6KsrH6wAoy3jdf6cFIO0J/G?=
 =?us-ascii?Q?kB2Qeqn10GrCrUw/gPx0wBD9XKaM+EUM1+zkjbbnRSle1szZElB/h6cHqo4n?=
 =?us-ascii?Q?3cuEV4PkqVPRJTie0u2SAVQGo43tni9iQS+eJ38xqL7IyqD9I0YwLtIo5rH2?=
 =?us-ascii?Q?nPHfNXVha4y0+U6ModQ2zzE3Otlccw0jN6AQfqUskCcPdjl7psUEOaC1Ux/s?=
 =?us-ascii?Q?hOBTv8Rrc2B+ZSlD8kpKzYoNJNuRyNoIG8OgG7zsWi/urrtFyl5+RH4vAqRL?=
 =?us-ascii?Q?JUwjZj3QZ/XEHC0oo2i9SLJvhSZ8FYogW8uFkBuB20XFl9muZ1CMzRVnT8A/?=
 =?us-ascii?Q?IetqiiNI26jT68FOhkQpIdlUAqxYMRPK7MJZekoUJXsB75l5+rV0scBfpCzq?=
 =?us-ascii?Q?cObi3RinHYs83e6GPq1JG1bKeyq56Izang65+0u7RHIMSO/cNmR3MDevcGxJ?=
 =?us-ascii?Q?TYeRAII89zTvEWoKKNtLhb+i/Xcchv6i+gqrc5N6OAPk0PxXf1srbxauIr7C?=
 =?us-ascii?Q?/S9bSWHQUZVRdR7uV8JIYGIXYA+4dn9efaORdhCQqz6oIJ3Mea8xEIhoRL8p?=
 =?us-ascii?Q?RUvRQws8dbchAGtYzVmESs9hmmqegRxwpYM/EwiHolG0s0M4wv20iHoDc5Y/?=
 =?us-ascii?Q?KqzJbcPrfHt1FjY4477FQSmraZ7wk6IvtAZMazNBEm9aKC8q6ZNsy+Xb3/o6?=
 =?us-ascii?Q?Y2JlHOuBG636mmQasD0qctg7o+ebfgttuqnulJRGPRbZDWxySgsuR1DqDjo3?=
 =?us-ascii?Q?Vm4ffqZ+ytxQu59l3IHd69XrVSAMdRkm6y9u//xTchhQJDxvJp7WxftgW5oz?=
 =?us-ascii?Q?4XOFyJFKQWrqKOpWydV5Hm80E3nbl84HBLLeNwNeSRyO6nw1bhOtKnd5Lage?=
 =?us-ascii?Q?y5DCfJTnBVbMYcFPAoecotyq+ULc9zXNf56hVYvkxgiVXwBb0cHNRV2eDuEC?=
 =?us-ascii?Q?E11xTnb2jQ2VA3B0Jy1wxMvuzwpXGK3gckXvjiYl7KxtVyOCggepW4ieqYOz?=
 =?us-ascii?Q?AIryjVeUuwxMFsTHxqcJ7fqqMpqxwPLUkaOerjbRickTXnfINA6kCsE4YUs0?=
 =?us-ascii?Q?La5gROD5hk0RtXD/u5dWeRfdAdyCINK4ZwW0KQ3Q2+Jr0cCtwG+eTBm6YbGQ?=
 =?us-ascii?Q?3Gc4yBTqLD6Og4BvqPOXQVwX6Yy8nAQAsR961Un4DKEMRhm1C+oWZWCjb+N3?=
 =?us-ascii?Q?20d9r9ScEwDnvkrl9QgyRl0nOq+p5bMXWOfE+W9iX+VULDCsKBFTmR0Waf+F?=
 =?us-ascii?Q?F7fAKls8DB1j1yL/9NpHiBx5QXG9rghCCzy4dRYsta3/AOtI+Cg8QZUM7hLW?=
 =?us-ascii?Q?c5WTf+Q1i+6LotlWsQPD0CHdaQkWEoFZUIMrmWI9cTvBvnv7qfYLdSEFV8Wg?=
 =?us-ascii?Q?FayN2cU0kzYVd2jX78u3QakyrbPF8yPBRdB77wXo2q7povj9G8h8uzGgDw4z?=
 =?us-ascii?Q?EmoPeknwr11WWs7AWMkt1mCDhLYjhJuF9DcjppiSnsDgEiHYYEgsX9CYrEjc?=
 =?us-ascii?Q?wdan8ju44uqsXtSKwURzSnYGEq7k/qwJkNQW2IAI4I0uSQYhiA/w5JvII7yH?=
 =?us-ascii?Q?9DuuFDAnociJWqHAnsqM/5bbzYTtiotOW/7GGfObkHc5PWEiNxirIWsh5Xir?=
 =?us-ascii?Q?ilswDkwiGw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d13a8ab-220c-4902-a68c-08de6de1ab3d
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 05:01:54.3699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qxssgwYvFHnHAHXZiB3wBRmi2xihq+jovPrYjSunDDLyB4ZmrglGZd7nMOoNiPRBNbElnMzdbf4yFUMoEpAW3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7033
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   62702f080dc2ac995b8515a4e564fac852471147
commit: dd59a24d47331a5c7830b9e105e7986be52b9b07 [27/41] hexagon: add SM8150 platform support
reproduce: (https://download.01.org/0day-ci/archive/20260216/202602162141.Vb91G046-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#164: FILE: arch/hexagon/boot/dts/sm8150.dts:126:
+ * each time we hit a key.
+*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

