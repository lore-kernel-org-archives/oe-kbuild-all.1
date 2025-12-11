Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2BD295DAC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Dec 2025 02:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765418744; cv=fail; b=T+nrKMhHLSDXbcoDDPfhkbaE8B8SNbjqKokgcdIY/Bdfwc29s/9d5Lg9rker4tbYg9e/c0SotXWZmueEKbYdyHIGaAvphqURj+UyTcpZUsiQNYXCscGKJL5HsfhfxlgiHFqfvvNzmPqSQyFN9Rq3mhAOABpZN/3gBsmlOTSgGNc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765418744; c=relaxed/simple;
	bh=OujFI5UTYJZJzE8pc5YEyVrP/s5aqwXgFPL9MRQWlKw=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=DF+QuiJgfqms9kcaFyMpoZhyDHTzoP8whRnvqQTJMdX44T1Yn3bzNK9Gd4vbd6g2wQIkgJ1hR8KMNdsH9AOW9rz0rCYleksReKHsU9nh2T6qaV3/Nuoxk4RlQE3fS5kaFW0QK0MwFwzTqiHxt4Q8miVKTG9pVxCwqPGdFJGL+Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WVoEDLxU; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WVoEDLxU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765418744; x=1796954744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OujFI5UTYJZJzE8pc5YEyVrP/s5aqwXgFPL9MRQWlKw=;
  b=WVoEDLxUm7auy6u3q/kkEe85uowLWIWRHtXn06qFWKLj5vKAUTO8FrzE
   zcIcGSOJBHbMc1xKfPYySLJI+xt0Glm03LrbNAszitd47jZT59wvySZtE
   E0sKPycSak+jM3soP8whpBfrtVsIivC893U6EJVDUtF56/UohHNNbGkC2
   GCvU4Veguj3538VPD4m2vEvje2GGVKtzUnoxRFGlyxS8YGmsJQbw3+syP
   bh92kLWkCipy2NEF1vNlf0sUNPXMEW2C4alLKpFfXbFJbeZZEPDovaab0
   k7b9+DY31yLcPefbtmzxBwJ1nuKJN5edbtQ06P7UgT1dGwdaJg42PlI2e
   g==;
X-CSE-ConnectionGUID: J62LQHQXSuedtDvWG49aig==
X-CSE-MsgGUID: WTSUjR4jRKapABFf3Hof5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="67125249"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="67125249"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:05:43 -0800
X-CSE-ConnectionGUID: yXtLMjgJQKi6lbzgyo6u3g==
X-CSE-MsgGUID: uE2lEw71TfK+KiLH0Pk0jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; 
   d="scan'208";a="195757053"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2025 18:05:42 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 18:05:42 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 10 Dec 2025 18:05:42 -0800
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.42) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 10 Dec 2025 18:05:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P0Lf76NM8ZekREHmrB08+0t+27HuTVs3obfCF6XPE/7buwV9rlAlGYXyEYnNyihRcavrrEtEpkKGEDh27nrKmX/Uwb0sJv7DK+V6DvgJ0ebQGZJ+ZdJpa1ru9jCQRB7q6WS0YQzS1I2nyVYR0km+feSqPWNiEQT5XhuwT+VdjTLgFk+BHTIMD2hGAVwm+e6ISFwzhns5pxue8aE9n6wJOI8JTUaTapNRq5BwBmGL/rWe2O5T7tp60HUoIl7rpuXyXVh9SFpcYTWbD+QONHBBp/6gXZvFla+67/QA81o1m7n+iEkcItZXRb/VLPd1WxCp42O0FkoMnRarf0s+GLRY9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KkESLUuofmV1z1VaMRBG75XBpC4oGo1M9lRxkfy0ZDg=;
 b=P/Zm9CsqV/dKyo9QKUrp3lbwHlfV4snvQClwhJCCVQuvlFpKVHVKIf2amUvRLoAfThxbTFDKTmsp1PpILnwX2YsPMg/gJT3xvL9mul5PMLKmpSPsawG4ZtrNzIz2rjchyi4PiCe8hNI5pPKkvidxgHw8elhKd0PnGf6ePorBROsqv9Vt7GzadUHmewUluXrvf+yf/GA5/fyi/kk8OepZMEEd2T8sebRXW7D05Mzv1PoPOVcbxX9IGD2OBLDA8rKzZ0OdyBIFRaG3I7Me79KdvIAgs0H59MdPqIG2tx+4RkUX2/N1Xu76oiEviiHXtAu2/IVsmpgZu9MuBW8cGr/XlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA1PR11MB7085.namprd11.prod.outlook.com (2603:10b6:806:2ba::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Thu, 11 Dec
 2025 02:05:38 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%3]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 02:05:38 +0000
Date: Thu, 11 Dec 2025 10:05:31 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [dhowells-fs:keys-pqc 5/5] checkpatch: WARNING:BLOCK_COMMENT_STYLE:
 Block comments should align the * on each line
Message-ID: <aTom634i4C9OnAA/@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA1PR11MB7085:EE_
X-MS-Office365-Filtering-Correlation-Id: f1901202-0631-457d-07ad-08de3859c771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PKBzc0fPE3bwg1Skj+gcFHFxDfJ2WXANivjpZKcS0TRh0RsqADZXJBKem9J1?=
 =?us-ascii?Q?pkWqgxWwO4NMmYRMAC44OMzS9AngEpCETBXHm6/C0gF8q8fVYmLEwYqyVxCi?=
 =?us-ascii?Q?Y7PrQ+t1IcdyE0NEU3IdlP9oqjO8rzD02MoRpbNUxvK6uPw97iVKkvjTq4cc?=
 =?us-ascii?Q?hhIGCQU+whSGgR/eJDIQGiwrligfu1S3Pu020jhurxZOpOJhtbDKkCeLAkuD?=
 =?us-ascii?Q?gtHXQ/g+LeGF0epq69Yh7sfrzkuH1jAilTQ3c6AxDA10u75yMRBzmNxfC7PM?=
 =?us-ascii?Q?fhInxTIPoFRy/576W5u37TLT3fl5FqZmal7ayjqq2AI4QUVtjddOFF5YrEFH?=
 =?us-ascii?Q?uz7wflhZ2hXrq956QZ7Xe/pXPHOkcQuImVRNEDHnAh1wE0cLK6auEQG4pDht?=
 =?us-ascii?Q?WTisLkTTPsBsqaaroemr4ykDaGXAh3Wt5dtQWJyOIzc9p8oJhbkHq1cOBM+1?=
 =?us-ascii?Q?jZPvLJ8Z7246RIWVTuOyBA+ywgUoiPyowVQZphrWQki55IPssGsyOs7reqKy?=
 =?us-ascii?Q?9+yyGUPbxiPmHyRxQe1+xq3qlrUk6Ghca2OOcToLkEtZFcavTRgy0OF1IZrn?=
 =?us-ascii?Q?uaqMUmxn1EkdS3q9n9SWRx0xTMzXe6sjMyvCi1z7mbupahRCKMGInNdDz9z+?=
 =?us-ascii?Q?aY11ZmEaPXxfZK5yUFCUU8W4VpdXnNs2MrD4q9gLDkVOvmN3AkQLvv7wNa/V?=
 =?us-ascii?Q?nrQqu4DpiSEaqyp0JVwvdr1b50bIrI655+XVS1yKjrMnfHlxt/KarEn1oCbH?=
 =?us-ascii?Q?b6yT5oU3cU5mRaGfc20ll+PN0nBdTqMjUfVzCpSi6MJ2KeWlB4XorB8VArrs?=
 =?us-ascii?Q?AQNLkT2UbZr/q4ul7e4EiI+cJQTML/HCbgHruWlB3Y+E2F9PzYBTEK/oeIHa?=
 =?us-ascii?Q?2PdNdtxT6lcVqQjZ0yWHfq3sYraTmtPl3PQFUGCD+olU3AvMpeBV9IwRnIo1?=
 =?us-ascii?Q?pA0Hw/gDihhhilrBPvJFYgpO+aFG3+ecla56NcXLSZoLV70eNcJ5VZgHYZZS?=
 =?us-ascii?Q?TmRn6giIFuU4WqQMvP/mRZgz0jAlNOtSaoTrfUfxMAxnA/NpByctjfTrq8Iy?=
 =?us-ascii?Q?X2BiRxzW58HWzTXl8m+AemNA2A7mLzFnwemQjdioaNlgiL1HNLBN8E27O5HZ?=
 =?us-ascii?Q?PPinJQMoqTD+dcic7/Nmu+jyj2gbf12t2sdts+I25mF2LbaaZHIMarkYOqBe?=
 =?us-ascii?Q?PUXqx463ZS0MoXktClrP68PVpi/0eeoYYZROcEbOK9aj0PUlWWNskaRmlOmi?=
 =?us-ascii?Q?Ixg4mSEU6HTausmnaPVpsUj57TitiY6OqF7TJMdXpXAKLPWSBsqBzrov3Dof?=
 =?us-ascii?Q?b5oPJU7oV6yCV6f5FN/hyLus048P3KoaALIg0pz2KTAsjABFDiKLMvObsfS0?=
 =?us-ascii?Q?weOzFWUO0HVwhuaVvKVEhFkDc910Ng3Poy17tmHIOiUbxwGNHtw0NXk/jE8t?=
 =?us-ascii?Q?VGLOsmqStls0Ka1R9P68ylyNUz6QSVZYaayNlOzrHKb0C3JsA7AsxQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hS6Eq0cSBY0A5GHnXrNNWFbbFhGKnXAbs+TYSKyq5yVtoF/HVDce3WuPYww1?=
 =?us-ascii?Q?qkwkJNjC03sxx3HasG/WrKAarxQlykItXVzfCDeY/u2DAaQ5vannBunNGDSh?=
 =?us-ascii?Q?mFYVSQioDpqBbYq+0u4+kIc7282IM7GKy8gBEynpjOvGhSmUiSK+RSLIMgkG?=
 =?us-ascii?Q?1nHgaue4PVJJ636/ou5O/QzKxscvSkbMKBXmKycbFG1l3KBaEwRwEIzPpOlj?=
 =?us-ascii?Q?h081VFo1xHIfs1KAS5IPBkSGEbexFWCg9R8I8+kWqc6EKVWtiC7+eOlvCSFr?=
 =?us-ascii?Q?UmNXd4DF6PMzKTGpt22ySPrWamzf2W4lqJOJ0s5nuUkleZnEZOE67dVQcsWk?=
 =?us-ascii?Q?JaFAv/s+nL/GABb3e0fgf2yKsckjVWH52cYEOb4IMFs52GOcHUzvVSGGzjSX?=
 =?us-ascii?Q?qHNMKYYRb4TM/AvEXdRKniRhKBEMzNlsGUlwDmAPWk6+XeMXVkUL4JAyVJqw?=
 =?us-ascii?Q?IeiZ63Dax4B1uw6K8pmDMl+wQ0v3J2A/eXsbpSiF/PmDKzqU1bXa3uA9H48z?=
 =?us-ascii?Q?NNplDH8LN027QAXzn3kv7asnKNCna8ADEYwsrfJVnVusflvFOqQeRkJHm5ls?=
 =?us-ascii?Q?b52WZ2AO7cXv3vdQrm7t+bCmsVDQ7XGaRh3jjka03IRFBeqydJhhkGbdUgnx?=
 =?us-ascii?Q?AwQp39v21frk27WTKdWIN64+V6SE17WVJeyh/MYuJVT1k6tD/M9HDqQkXtOC?=
 =?us-ascii?Q?vwFB8AHrbUMsxcEcU103dynRMzG5OomsNE7tYwMrUUsBL6qpAyNV9MEwf3kW?=
 =?us-ascii?Q?loeU4JkCBsJLyvzRp4Jn90DOwj/RMu5uOfyUczbbbE7KGOH7R163qewd/v4w?=
 =?us-ascii?Q?hdgTqHkMWpNdgXfsD6mPGZc2zQJ+61LOe4iZ9nTU+JsIjJkxdze1ogOZTLmU?=
 =?us-ascii?Q?eWfpTCmjHn+gJUG1v4mUgHU2I6U/tDh2J5bbdTw3efa2i0QHVcBJN3r3CPxB?=
 =?us-ascii?Q?aIZp7AOrEllk8MooU7UtiNx2KQhJGV3th2IKrSYlGz9AHbbH6Rh5CveoZzKj?=
 =?us-ascii?Q?Niqu/a1eMxuiKIC5vlWzo0WL9UKCv8fXMhAT3jy5KNojriER6pnSaaNLd9l5?=
 =?us-ascii?Q?irygz85ylU6/FUz97Jw0K8IgIo91JP6V4kDZmOPRvy1ZbAC2nP7pFkq9rDwN?=
 =?us-ascii?Q?+fCdvG3Ts+y1MoJtALNfrB81aayEyC63WOeYgtgfiHMKLBz+FFdE0RzRdcXG?=
 =?us-ascii?Q?6uwn/I9CieTk99ehEs+4UfmMAGj2vcXoEOUYmfH/1dCbK4iefa5Yui3G+mTA?=
 =?us-ascii?Q?bUNhB3BlXoj/bPXkSACNyFm+cvfiJk5ktCkhY9glDTWLUCVTj5QKL1Sfo9CO?=
 =?us-ascii?Q?KTcSbJUNVdvtx0Aas8M9bEPV7YlAaqe1/ezy8wdY98R5L15l6Pc5zxeprQLk?=
 =?us-ascii?Q?2yRuKrdAjas2zAb6GuTX6Ok2aLHI/vfC9jNwQLDjZpLPwBztvui1L5wqASL6?=
 =?us-ascii?Q?G+p6moa4YwCp5ACVqVp1xMl5F8YKoa+snyyQHlmvib7KgGDPzhAB95zx0A72?=
 =?us-ascii?Q?HSa4pXIHGckFwW6+l2GE6py5yv9mPgkM6Dn28i92l1pyAncM988cwqbD0Sus?=
 =?us-ascii?Q?eG/ZdPLMwc4OeX/fUFObcR98J8FRrdhtzMPP5uJiirdsp5wTr0wzMlP/i6Oy?=
 =?us-ascii?Q?CQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f1901202-0631-457d-07ad-08de3859c771
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 02:05:38.3214
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b57YTxP9ikQeJ1YcDZsc2Vo3RLT8gbtJ+8iuMCEosa16uC6KkV5c3ctShPtPxjUlH42ffFedfG23Y9f+WT3/gw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7085
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git keys-pqc
head:   36c9b1b46c63798cb54fac7ece3c85a1a02e0dc2
commit: 36c9b1b46c63798cb54fac7ece3c85a1a02e0dc2 [5/5] Add RSASSA-PSS support (RFC8017)
:::::: branch date: 78 minutes ago
:::::: commit date: 78 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251210/202512102338.D87rtR9a-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#485: FILE: crypto/asymmetric_keys/rsassa_parser.c:76:
+ * Parse trailerField.  We only accept trailerFieldBC.
+*/

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

