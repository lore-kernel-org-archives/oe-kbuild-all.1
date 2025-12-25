Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE007260A
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Dec 2025 15:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766677412; cv=fail; b=iMiVITptyuV3b4wH6NuZH3WuzD89TOJzy5PIMmrwtLk4BTc7W+CCK39pf4pMcnmrtpC4fwpTWXNb6yPwPEa+iqhy7WKY5WTCkOiPTExt5OIxSve7CzbcyP6bnVJ7oD7ayiaymavCmSbYcHxS2ZWv5pQunKtO6/wzITLw4eNEF5w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766677412; c=relaxed/simple;
	bh=0NEfAcJ3GuCm87BESpm6h4ui9xRnv9Iw5d5xYE4A11w=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=mNNfQebqjGO1RX9UmJbWNUeASIMhp2LFHh9ZzfcNhZRPrcWUlUWKkXRWJc23GL1jj1hloxPuC2Mwt+PfxTJ9O3nzX+hgduAutPJxIUD2CE4UYfGu/t10P88GmgSDMnWi9FFxH38B9Ws2h55NQV656/An4nN8bs0KuVvThYZTn0M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NbV4Xh6R; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NbV4Xh6R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766677410; x=1798213410;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0NEfAcJ3GuCm87BESpm6h4ui9xRnv9Iw5d5xYE4A11w=;
  b=NbV4Xh6R1j8Kgd7+gbryDiHTuvNGXJaG1xt8zgf7i6jYuOmFAVKSXmNp
   ONIUzluxN/erYCY8fZwwEjMMHBYDsABoB2L3i0RmZRnaPxWoQgn1AqjJs
   0GaNPMXhlCzlBta4SdG+I0ELQb+SWjn3P/p03ec4J6iE4t3DdkwJgvpu0
   xZHqSqI8XGoZI/uxa9hSi/Q9/ajvN/mUdKt36NV9OIIpFRlYnc250jWDP
   cZhWHSB3GDlDVuwHEBcRTu22jjYPPeq8nC2r+ze79Hbfig6X4ClDlsd4e
   s+GVHRpQ5CaJMfi9Ag/o8/V95qW+x5edJIfsQVghs0OJeNHx8+pHRm6Rw
   w==;
X-CSE-ConnectionGUID: YTOM5OmxSS+UtW4Djmknww==
X-CSE-MsgGUID: HijfXko/RTaKtJfn74mKGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68457074"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="68457074"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 07:43:30 -0800
X-CSE-ConnectionGUID: bUE3E6VtSfGygvwfXsRyZg==
X-CSE-MsgGUID: QDA/4LB0QGiosh7PipZrNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="205280775"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 07:43:29 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 25 Dec 2025 07:43:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 25 Dec 2025 07:43:29 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.24) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 25 Dec 2025 07:43:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GjHuJSljT1UYnbge/PHR1uR8Oal6UN8+sO3fRHL3KjAu/pneismERoT4vKwr+2zU9uHRJYe4s2ZjxR977SB2TvCpSiEu+q0c6waOEmaPHEmye7Ko/P0jGaQOPlHJsW1rnyTPGLNRleht39oVz0m2/qIKIXCMdjgUbx+kMjMYeHR2t3y/nJv/NcQbTFuPP5YkySkqSp1e7p56gN0ua9OfmxsDGjB9Vym0pm6ZLokzeDFPYSz0Q9PgNYRGjeWszE+zrgRk/MfJQ9hRQ1N2KCpzMdxgOGfFpydQyqaDv5A967XweOF66y92cncBathNVS/sNoA4CX3a5N1QVsN5c+HFUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5Pq51YVjgtdK5L6yzinyg3MVjSAdsUp0diX2PGREdqc=;
 b=Swv3WAltIKb+CXkBVpl1T0e1v/zP2jQDDq/57KF4RfKUZ/THhq9U+JAh0oQjDaBO1i4B7Lx0rScfFdD4oo0OeR/mhvtJd+qiVdgtTL9cnbe+LnbegNVRYUcXRLl5wrksBWY3EmhXFSLT/rr7EuFaU2TgTB8yeKg0pwztBUTINEAKXHU5XkbxXwswK3RXLClm3Ce6sWToqHoQ7kyAFDABUR8t+GYZ2l0gAd+HzeOwtsvRrEAbdN9VaAlhe8mzPRnMLok7OQbJkuMb/PZWKl8QPMDMuMcu1PQUMaEjoHmDBbj14jVJVqLKICyj6fAqtv37BqIcjkzRdfBtoCueqeY5Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by CY5PR11MB6188.namprd11.prod.outlook.com (2603:10b6:930:24::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9456.12; Thu, 25 Dec
 2025 15:43:21 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9456.008; Thu, 25 Dec 2025
 15:43:21 +0000
Date: Thu, 25 Dec 2025 23:43:12 +0800
From: kernel test robot <lkp@intel.com>
To: WanLi Niu <niuwl1@chinatelecom.cn>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [linux-review:WanLi-Niu/bpftool-add-missing-sign-option-to-help-output/20251225-172557
 1/1] checkpatch: ERROR:BAD_SIGN_OFF: Unrecognized email address: 'hlleng
 <a909204013@gmail.com'
Message-ID: <aU1bkEvJ+zMbbOZV@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0160.apcprd04.prod.outlook.com (2603:1096:4::22)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|CY5PR11MB6188:EE_
X-MS-Office365-Filtering-Correlation-Id: b998aa5f-1839-4f56-06c5-08de43cc5499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?VwbyV7laEhoglU/QrrDiqJYy3doKMItnHp0epseoip23R9GxPXRvc8lHyp7c?=
 =?us-ascii?Q?RPnyBGsUaNtc3fo9enRtIePclqv7wqlX6OGHBgkUuCWTV3HqEXobdzckH7wP?=
 =?us-ascii?Q?plRbK/fOKpWKCiL24MWYFNTf7pNVdeo3FqDgdKiRu2lBwHSDIDEtTNa7zLKK?=
 =?us-ascii?Q?1IkY8kGa63MVHQDVpXPkjkGay4HtWJaXUwbL5lzVTDvpJNlnzhKg//W9++TQ?=
 =?us-ascii?Q?LB0Hz4RL4YCrrOCIdvChdY7Jn1aeRzyGeZUO+AxAqOJ/i51nSIP5K/Vo1mYL?=
 =?us-ascii?Q?NJEIjspR88jOG9RGNmwEo2gPHZG9dhBbA8aQ80GQDco0Oi9syvL4tFdJ+Olr?=
 =?us-ascii?Q?GqzbTDEcjAYeSySXdKnvbXlc3z7AkIBAEHHkKaAyDZUL5QXGhKjrSA9rWPST?=
 =?us-ascii?Q?mt9vA9gT7dtGQQ1u2yDJZ1MpAQRLXdX0h6qIYwWZz1lDSHHg+V/UO22HentF?=
 =?us-ascii?Q?etorKy/+Mn1OnC7VYfzoXmM7VCMQ2oSzPhUTmtO8XjJvaMi+o66biRvQY+xI?=
 =?us-ascii?Q?R7ZzsKcFE7JVjXdsLpc0W2uD9WkAs1SthhB8MFVvaGAtGtpyeYGy64zVBteC?=
 =?us-ascii?Q?Oz5YMf4dhJJ3esyx1VV7uUcvqWjcWbZpXUgqBuvOK9InHqdik8t1AhyZd+9k?=
 =?us-ascii?Q?uIP/BHYXobzlX46frs2KDWgYz2Vb+9ChEKCVZrqvTSqeHbzAmLSWlMhchlvU?=
 =?us-ascii?Q?/EFJ3/5cI3mkDyJvL34RD4HKMlvFWCMWq0qR/+CPd9P4CNdxl8H+TtS6CNjP?=
 =?us-ascii?Q?VkQUESSPr/ejzaqi3uaEchvOV4UoJptay2laq+CCQUNKjzTOgc1grrjcwl7p?=
 =?us-ascii?Q?OHiXXkeeJh/WA7jxLrkvq2dy9ohQwcJY/QlF6qQcJvsizgxBs+iwnY8o0Q8H?=
 =?us-ascii?Q?2iMj1VitYwYe8hBoeo7xvGjOibNk4Jvl3ip2JykjwwMamsqB/lyDV32mxw+7?=
 =?us-ascii?Q?JShL2/CNFBFstgJUxxhBIOcuftimTdwxhS1NpWwSPg04r2hxtEHbNPCO48x/?=
 =?us-ascii?Q?5RMKXa7TtDOwxizXlTz79MCsuqX6cKFmzW3GYJNjCvnk8fYD3JC+W1yEiAqS?=
 =?us-ascii?Q?JdGRFxru1ywvbOBKRPek9MV9RhuhFxouY2RYGRj5H+NRyJ3V6lIKEd0W/MT2?=
 =?us-ascii?Q?8Ckz/873G8Qco5b2oFve6ojcSBoefTFYJqzFvyFHGHhYFUfEcc7UZ/LkgFrX?=
 =?us-ascii?Q?0MIMObx0ITwDmKoUjMe3x+2jjC4mtLPFg0xPVCL+f1Wal+hydhqT0BNJM8yz?=
 =?us-ascii?Q?bzJL7ja9w/hPnslhDNOW5X+jQx5P0w1DHhFUR59KwRJcFcATjeulKHAJapwb?=
 =?us-ascii?Q?NjOJJTw3qr8FEjB2Rh6MeeL4MDQc7jweT9mcvp9QxxthnfMxXc+lhRZbXTt8?=
 =?us-ascii?Q?RX/j4SisSzTf3efdVofDvwp9k8X8poMEN/Ab0xgtLyNgMG86tjaiPxMcZYtE?=
 =?us-ascii?Q?l05aJvElh66Fypot3AtEIP6VReMFaflcAnVOBt54km3oOlOlcenWWQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o70KUpl+5JH8VSaFXbN4vSiXZI6/bDuWbml3lrPdx9pGfWQgQ3mrBa3YoqqJ?=
 =?us-ascii?Q?jirSkdrYjEBXJ4J7XBNWSUrb6sMtQ1d5VRAWNzRW0FxekNlLZRHGSD5Y0lN+?=
 =?us-ascii?Q?6xhCKaGYm6wB2L2ahCCd6NvKD+uvrLSBbseFkh4ZimhwPI9FeV131GUqI0q+?=
 =?us-ascii?Q?gmOMVx7ssNtr0js4fDqKquL55xCdKHulHREoAzfup5hax5cAVAcu8qiKXcYn?=
 =?us-ascii?Q?Ui6BorEdwt2ljzII3WuC56VyRcixYlQ++rxb0OOrGSXJTQGxo2W1qFCp22sF?=
 =?us-ascii?Q?iGOmfr13g8g2Tt64SgAY/wszcx21MWnQ3idON5lOwkr5PkfRIQaHA7qes5mz?=
 =?us-ascii?Q?KbQa4OgKGsAtIkv8yGygywqA/OYiU7PVYMlhZSyCQpEdDw4qG3MgyV0FznG5?=
 =?us-ascii?Q?QQUOTsheExu1DsWOI7Iw4q8VJjmysoztcRCyXi0QIYkZkju6X0wu/xV6Cdpv?=
 =?us-ascii?Q?aOndJR+NW4ta8wuyvej9GGg2o2rdXGecIQd4oB5mWUjwXuQx+Hs9RzwI/q3r?=
 =?us-ascii?Q?kl2Zu6VR+LszAIZ3PNkyxZyIciO+SDTRqYN2/W0dSJMRQiHkwIcLus6/ivpc?=
 =?us-ascii?Q?6IbXH1yskvfyTCOaWJBMIk58hh6Ql5uQdTSglyFGm7ys1h70AtNlLpIXdQzH?=
 =?us-ascii?Q?zwTc4T2Cx8UGjUGuGwyiBYJPZcENgKWH3DeBP7psi671cUXWpzLO1nTBUCol?=
 =?us-ascii?Q?NW+AWDMHa9N8vMzPolO5a3MF/iBOeImubnyYNTAPG2Uc8LHYA5UCT9w7cvZC?=
 =?us-ascii?Q?Xq4rLzh7t0yfF2Z1y+xGConjIQnFUBG/CWyF+7oBDrGtcnVX/sC7Bw8iSqvn?=
 =?us-ascii?Q?+PkCGStCVRTPQVoPG8ITrxZ5b3547Xis1JBvFcEm/RqIrQF6J6017NlDWWcN?=
 =?us-ascii?Q?dzl6iJKfH1BqLEGky90c9k034vBTGoGqkHmQTldveDJ6QDqbRHLgs16dZems?=
 =?us-ascii?Q?+9QaXrXKUMS12o+aMstGAXIJKgMphU517S1rxP1dnksaVpK7+YKq2teIcBh7?=
 =?us-ascii?Q?eUBRdFxhlQ+0j8bsc9WJd40ODiKp0bGXWMIeFUM9afbhjLgzlvaudereccis?=
 =?us-ascii?Q?BOCtacOuC4bXjZvxCItRgUTljPdJawcgCeeWc+fAZoRnA846gHM9Xw1IfK4p?=
 =?us-ascii?Q?LNyIDc4x06kTbz8mEtqhbMtvAGvCHXeD/bkAV+wxTkxE2776//0nd39Zs0sO?=
 =?us-ascii?Q?HsA0ps1CYXdqiKjXBYKrlq/Mx0fFEtFChkrhn6sETSNJhQ8ArQJR/4WCPKdN?=
 =?us-ascii?Q?2FyWtgJduVOnCHWY3rDErUOXEmNThP0GpoMNyA779b03d7hmZWg7QnGsu60n?=
 =?us-ascii?Q?ptgEUBdAjEQ6sjbfU9DSgU/DhYunlyQ4i9qhaaD0FSN3bsm1QezQ0tRfFd/w?=
 =?us-ascii?Q?ggiHnT+LIcEfKW5HQIMGMi110A/SoZAiIXQ7Gk3+GGSTvGwfVr4thxq5JoHB?=
 =?us-ascii?Q?nN57u6dlHfZsJpIHI8izWSvhOO0zeEiGPfEuU3Xf2tkB4Ekt/yBZmV/SHznr?=
 =?us-ascii?Q?LzMAJ69iD2yw+pK++ewENAhooWyVVvAXqNXj0CqhxgNVaHQzFHhEy/uYMKIw?=
 =?us-ascii?Q?IdxIEVRAlftYR8wLliMAcUq9cQeeSaBFWh0AFe00FW27qjSY6NE8I5Sjog9j?=
 =?us-ascii?Q?3gp4028kko3qilZTlesCB+UKlQlsiENJRUvDD2zxyZ2KdPpn764b0qE2DVQr?=
 =?us-ascii?Q?SvyA9nKyml9gn3qtFyDe21AWWKuvoCPcAd/qpRW5ugq2flp0+86axyltt7C1?=
 =?us-ascii?Q?j/HOItzvbA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b998aa5f-1839-4f56-06c5-08de43cc5499
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Dec 2025 15:43:20.8886
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JDA28U6PWt+EQ7LmRJNIqwxefgDjrRFHcH4X3u+tHcqiABz22bFYNYFmP+GWcTMlgVbmQpNg02nFHJUe+jRIhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6188
X-OriginatorOrg: intel.com

tree:   https://github.com/intel-lab-lkp/linux/commits/WanLi-Niu/bpftool-add-missing-sign-option-to-help-output/20251225-172557
head:   c7599723a8e912df489f0c216bde211b79a78f7c
commit: c7599723a8e912df489f0c216bde211b79a78f7c [1/1] bpftool: add missing --sign option to help output
reproduce: (https://download.01.org/0day-ci/archive/20251225/202512251239.U61OV5ju-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'hlleng <a909204013@gmail.com'
#8: 
Signed-off-by: hlleng <a909204013@gmail.com

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

