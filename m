Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115592F5313
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 02:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770775798; cv=fail; b=SOJof6wu/9MPiqd96I5SvWbeqP3dzq2hbfU7QnMqwu8iEeMrs5eZBxteB3Q5jxpbOa7zuva2Sosc0UNInBqaquE8cKcmN2zZKenEEX13vMEtuixm6GS506Eb3WuiiSNwxO/YkNNYxGPwwwWyBaGan7ceWtXbiCaeKZTd8oK36/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770775798; c=relaxed/simple;
	bh=BrrXb8OZV8n+DBzZAta+h4Cu2fs387myRtQPUD5nL8g=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=misSCeFEF/qfjQfEHD0AhaxjW3EX6uVmagPc4IVg7WzkS7FJyNvJR/0PFg/PtqgOozgKrgpYOv98ffqHKdK3CCSNnzoQzZWEkgvD8Xo6Whsm9D/LuEsrsu+iyW4lZ4SA3IAMgN8IhUzuJtarydLp1iopjS2KWy/111WSaFFwaAk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N4/fmheS; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N4/fmheS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770775797; x=1802311797;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BrrXb8OZV8n+DBzZAta+h4Cu2fs387myRtQPUD5nL8g=;
  b=N4/fmheSdRDW+0jlMhP4//6nYwL+KXGQtfLTdiF3+s64RaoWbYt9r85n
   2nIbGfzENfw8BAqRinu2Z/riMysXQtVNYOnuDx8hb0FWR6wCFEtvw69Gc
   BMkWwk7i6dC2x0/vYoff/6zZev2B/n0zbcE/D1SckT8kNRZWO2uRdDLgb
   /K0QXtnmrAk9sJYbjwPGKPBQlNBrZhbAdzS5iCwaZ5lB9ER4PEkKLI7Aj
   G56g1/PUyOkFwiMrRlcXltVYy1OeE+SbATtHzumOZvfJkBB9nDDIhG++D
   55ONx+Bx3fZGwt70oiWzvj2taeA6bJUWcHWGkjwSa3ps0cEl5p611V165
   A==;
X-CSE-ConnectionGUID: FKX4UAZcTYCzfoKfs5nw/g==
X-CSE-MsgGUID: VDwACNpIR8ekramSM6uSVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="83019595"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="83019595"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:09:56 -0800
X-CSE-ConnectionGUID: 3YY7XvIDT9CCIn/zLG3AfQ==
X-CSE-MsgGUID: +f8Pvq7kSuqNm5HN48+Hbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="217048736"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 18:09:57 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 18:09:56 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 10 Feb 2026 18:09:56 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 10 Feb 2026 18:09:56 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kM/b8pH+BzML+NZhOzi5vk2eFxpcgThhit53o96aKWco3Zw59K6JKYyfouZX/OfiUViXBiLuX16ZebPKlNYCLwutimpEMru8t0WSBr1K0QggFCtT1DkOI3xQJ3jWkldxRMVr89ObYc54d+C3V9uZ0H525qsBwxpbAR3V3TloFRJs1cmDiuMG4q4+eG7hppuIw/PXnBXrIpMMpNCDmM0NgqeybAd32+JFlgFdJkcSUt7rcOGMg9ri61p+wYncK9R7HGzKHlaTTaCVsEi8vE//VJlE8n2fGslBJqu0w5OHexss7qDuIFsbhnPz+0+weCVyJtHLhvzJ6kNTFFhINLOtIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iQpWviVTs7BIXKEedso+yunss/BCcmr2ILzxqLYQe0g=;
 b=GuWCBxOxgAwyx0JjYnYHjvBX8PKUyYrI8D++jXY/rPCbQvpWFrn0q5I1157rcJeHL22k0KqNS7Mx2gDk7PsvqjdIzplZabXUiGaARqX0KP0M2iFZaizRIP59sLbTvNYR9tBXuwoBsOxl6VRYatEr7blMBr86MLdGEvzIrl0KS1FGLPscvURyFWqubj84OK1khQwkiKmeDHr+6EhMO+seAFEkpkmjV8stYpYYs93M6H5Fu5YAqb5IgQYdU2BMAoVkQW5kegoUX7WhJP+sshsiYZVZ5t/48rvZNiWlYUqIuBaBzyl0CcXAwbN/fwR0BFzk7oiTo5zxReHMEYLZPqPmwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
 by PH0PR11MB9522.namprd11.prod.outlook.com (2603:10b6:510:3b0::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Wed, 11 Feb
 2026 02:09:54 +0000
Received: from CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394]) by CH3PR11MB8468.namprd11.prod.outlook.com
 ([fe80::8188:d688:bbca:2394%5]) with mapi id 15.20.9587.017; Wed, 11 Feb 2026
 02:09:54 +0000
Date: Wed, 11 Feb 2026 10:09:47 +0800
From: kernel test robot <lkp@intel.com>
To: George Guo <guodongtai@kylinos.cn>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [chenhuacai-loongson:loongarch-next 3/20] checkpatch:
 WARNING:BAD_SIGN_OFF: Use a single space after Co-developed-by:
Message-ID: <aYvk65N31hEkW6K1@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0162.apcprd04.prod.outlook.com (2603:1096:4::24)
 To CH3PR11MB8468.namprd11.prod.outlook.com (2603:10b6:610:1ba::19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8468:EE_|PH0PR11MB9522:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a13e177-8e2a-4796-8112-08de6912a596
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tNuCg+hKEAFiOy4jx6GTqitrMdKNEj1x2I/FJ6G8sBkjO8YNPOFBgFmMvrxM?=
 =?us-ascii?Q?FeOFrmFrnVio8oB/XnLMGgfNpIAGdlvd+FzaeEArJNF7Eht6ABEbywMZ3D0Y?=
 =?us-ascii?Q?YSZoHPSPXnJ17LqRlffM8uTzxzfWkZjvw4gAACbYzg7MgYoKrh6qsrGH8+DB?=
 =?us-ascii?Q?pwpTKeZ5V39ZGx6hOlQCM6qPAXNfLNP0O7ytQCf+GIwlcnQpjwAu5m61euUf?=
 =?us-ascii?Q?2mnHfzffURCQ5pAxH6UeerrGGIyktg5Eom5scKmbKS8MIHmgYKTcTtMBKSvG?=
 =?us-ascii?Q?74vh0/ryDeRPLB51c2aiR1i1jQ3clTdz5C3WmRUbZM1ECCDYwmR3G/7n5dJi?=
 =?us-ascii?Q?UG2CTXAx+Nz4ZRkKfosMX2Yy994t56t4Ep7J2HDdAb7gABI7nXp6zRS52Xe3?=
 =?us-ascii?Q?QMvDiz/zofN2HKPVXFY13B9l2N90Q3oyhcNfEIBKUX8Yah1mdkubfRxX14eB?=
 =?us-ascii?Q?5urEVluEU1358WuF2CFEAmS6N/XHXlF4V3KjEYuc475qV9ulDtui+fdKKZIp?=
 =?us-ascii?Q?PPPU+6LXUTNyo3m59yihGvQ7TP3g5EC/0hGR6fEuZ7UkYY+n7x8DCI9paNj2?=
 =?us-ascii?Q?WGqcZ4VbxQdZ7HHRLUisJSLpQZ4pObEXF2AlzB3zM8D8/5O3s7iA1J6QlC6b?=
 =?us-ascii?Q?c5s1Z7P/j8/Hs6xAV0e2F6x1guPEJMLwn1cv9b2UWs8fsqGex/M8pL7w8bjj?=
 =?us-ascii?Q?Ecz/JNlHUR5Ofrfbn/rOAWw72RKTKnl+fssdhylQ7PpZM20rBjlW52Y2Gw8W?=
 =?us-ascii?Q?mojh3YzBJ64AOvJDUkxMpS9yzTW6OGkoKEmUky5s9hws8QPYK3iFONr11j9h?=
 =?us-ascii?Q?IMX+w4KDj6QTGfBKNj7cD+gO+gemKovl2f+WAuIFTLgDzosndK6vhZXFuBky?=
 =?us-ascii?Q?11Avqw2WeIdFBBgzzzi20v91kRfNeQw4cQ/vypsR4KHS4+/69W/rDHxiuH3D?=
 =?us-ascii?Q?zHZh5MrrwCuLEVFVZgrOJWxXVWKRfWlajrVmTk3NxKr7y4VeoNB4bs5OcEEu?=
 =?us-ascii?Q?tWZ9p2uhhDU5j77uqNN3NdEOtcu6b+fuE3C6IQSDK1BHHzEACKrn7Y5+9xa5?=
 =?us-ascii?Q?ENltyGSpwIBHhuqAwNfgfynsDd+H01HtmJZVUycqHgOfTn5MUyNDEpGogVW+?=
 =?us-ascii?Q?q48VPKU9FdttQ2N2MR+AEHcQOz2xX9wXeIow56mGvqS1bLIsjnMYGdXnRDgF?=
 =?us-ascii?Q?aRnYWg7BXm2YnRCyvgyDQiCo4PWGvIUasTfVgk70SAjmN7Kdum0krr6gheqB?=
 =?us-ascii?Q?F9pr2oHVECxxjPWmFWNKPnLV7pr/udgg4Kich5qOxKhDjOTkqDRympL+b8RL?=
 =?us-ascii?Q?JD3TyIR2LyUZhzFeCy2542JhFCFUcTVdkUVN/DoiDEJMRNQLVxs5/4vmCXiE?=
 =?us-ascii?Q?Ej274L+PsAHczZsgaGT/lM26fMKUDTN1XhDKr0AMXVM/vITosM6IzDuPRcmo?=
 =?us-ascii?Q?LkOUhPYPntKwHpH7dfJ/7cJaiDl/aMxPrQc8ooUoBK1payfFEorvIpdllv7H?=
 =?us-ascii?Q?ZgJAhcJ+iqhHqm+1w5L5AtfNWFiwoY+rhsjYoQufASe2iU5CJ59CquKwsx2H?=
 =?us-ascii?Q?/oVQBGNvlT5NW6IEkiBIPz/uVPynS5NUq+YfdbnS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH3PR11MB8468.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vYdYLXmKbbKkQXsaeTlh0L9itlrKzI/p/EaMaE1XK3cEdF98bMXekTCYGzdA?=
 =?us-ascii?Q?3mcSILPq30bN8B3ZWBWBUrh3oZ7T0OKBWHBwh2wWywe5yDBkyWnYLaI7hw6J?=
 =?us-ascii?Q?KpoxDZQsZPwsqb86255L10vP7+VXVQveruqE7ZDyLN5V+yj0sQ7ystOAf9BF?=
 =?us-ascii?Q?iV5FVRSeKytlr/NbuyBgYMGs18D4Lv5gDQBrTt8Hdoev3PqS7oW9ELfQxZL4?=
 =?us-ascii?Q?KCUDMs2WTN2Ne7389sDbkk2ddGBhUuC106gJyphc/I3+YqtJHp3LV3ssfwNY?=
 =?us-ascii?Q?bnKxIMR3SuSek3JgQwWVrZ4dQCo3/2Tjeo2gAMiU81f3Dqx8UNpWZKH4wSVD?=
 =?us-ascii?Q?fPLkwYEUB6zFolU8VOQ7SeSvitr+t6kTj7dSs6NMnvd2fXqdGu0nGFzkkjgE?=
 =?us-ascii?Q?AlES1v1XUBCUY473Y/p9YUbc3GB2a4/Ax7Wkh9xvVQ/SFH1erb21tkwYkX6Y?=
 =?us-ascii?Q?4RGqcdhCm1xUdVswDqVPueWoxlwmCzq55Q4zdSe+PKwm9QvtldtCaPxsCVEn?=
 =?us-ascii?Q?C6ImQ8QtmMqBdXt5aA3Z2tTOOHbWsOYedkY+qhWK5aXV9EYD9SoSIG7M9hdY?=
 =?us-ascii?Q?nGIzrD/uD3E9jmskJ+aIeb8V259TGb40Dup/VK7esCWUCPI17+QVAkRkMZ8l?=
 =?us-ascii?Q?KzPlHTXLbibI8I2aKyz7+/sjMWUQBx/Ev+1/aR5cOUG2J0M6f8cvOs+eHJWq?=
 =?us-ascii?Q?6320Rz4YrOWUbvpYwzq2M8Rpgt4PdUJqUlcCyjOxtoetGC7QdT9fDKKP3BnY?=
 =?us-ascii?Q?+nDVjENN5ZSP2sJtG2FeDvH4ACk1QhOgJUnD8YZQ9yIC+5MxcAb+kGuDe1eh?=
 =?us-ascii?Q?Lwubj6JUG/gQM1KeRlKRsYxEDMWh71AstPUZGX8kDm7wXpx/E404G3/GwE3H?=
 =?us-ascii?Q?4PEh6j1NJq7bZaZFZD3m6TAQ0Wbq0iBh3h1c7ZaFKjEFxNFshaNhvrMKwkOS?=
 =?us-ascii?Q?bYYDWWMsC4+7W+A9er+d5VNyVvvDGjofplaX2vg+jKZlVo8FiBDrZV59M3tq?=
 =?us-ascii?Q?VGA35KUvw7qbu1zu89CqKlDyQOahm+MXP+Wu+aqb1gYFAFONu0zjTXxFIKds?=
 =?us-ascii?Q?kw5pV6F1CLXo/JYBhh1wPTmShJZ0ZON0ganO9FqXm3HMHHdDP6Gy/u0S0Kq5?=
 =?us-ascii?Q?9d7wZ5VhysgBq9MSkucRZvYzWHRiQHKC6mF/occ1Ol3Qlr+6l9r8zImw3pvp?=
 =?us-ascii?Q?TgLClwp7d1YbnAaw3a7wwxCUx01xEPY5GRiiq0wc97LyFawI7nTc9xpaZo24?=
 =?us-ascii?Q?GbxzmeWhRG1rYpQKjYbeqg76VMJYDIueVCvcphu2gcyVLgjjavo/rf+0UIg6?=
 =?us-ascii?Q?si1SrvTIkP276tYTiAKXuCISpx1a8JcNpj37aZmUawoz0nYoZRQLDk4m+Nqw?=
 =?us-ascii?Q?8uq+sD2ZmCUWz8TNO/2o94poZ3dGmhZ6fQHCLF9GWvYGG/jx7V2M5x77gK9P?=
 =?us-ascii?Q?2nwmKlB67KPDUVC6rsH9HUIJS1Q+VlRCckrOUz/TJkli7OHt9HEUb3pLBjTI?=
 =?us-ascii?Q?QtGvMgm8fQpAHPtlkvA0DunYu7FddDmhZlc1tjmwbazIM2SlR5bx8lK7T1KT?=
 =?us-ascii?Q?0DC7DlELROzQHQ6eSaSB8O5EA/3FkgZk8OXQA2OzHb8apE9Wjio2oqioCD7X?=
 =?us-ascii?Q?zO6Bi4Oc4UV0U1kZtDByc2v4m0PKyRQLs4Bp/Ga5dTDoIMqXhyPMCOJojqvl?=
 =?us-ascii?Q?FBXsZdYAtdNVtTBtqmnNrVCiCZAWJlYLTz00rpsjXhxMPpUvXgto9cPwORRw?=
 =?us-ascii?Q?7FDZSQK5lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a13e177-8e2a-4796-8112-08de6912a596
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 02:09:54.2718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: feCTt69qBidU4H/7aSEHwATbalW64U98WbV/Y1jMV+m6b/vu4TcmBONZsG2bs5jVvOsgxrAKD3ob4ZzBp9kvDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB9522
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   92860256402cce9fa6268763365f5333a56c1428
commit: f0e4b1b6e295299f5c9c79ad546dedbdf7132f45 [3/20] LoongArch: Add 128-bit atomic cmpxchg support
reproduce: (https://download.01.org/0day-ci/archive/20260211/202602110052.ECCZnlGs-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Use a single space after Co-developed-by:
#22: 
Co-developed-by:: Xi Ruoyao <xry111@xry111.site>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

