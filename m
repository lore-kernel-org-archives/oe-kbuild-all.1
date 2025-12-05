Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED0E1DDC2C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 05:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764913492; cv=fail; b=iGR4eDZTMCrDCckPm3u8n+FaTUdBqg5YYyPryNG/QL+TpHx/NjUTfF9WBE8i0tSQisDb12CGbGXqClvl9Q4Yygwpj2XMIOHIzjnwnN29vP7G/vbajbq3XDnbfM40T9BM/aGDIF2nRyAahg+JH9fPPailjc1cvv+ywfXXDbjFJGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764913492; c=relaxed/simple;
	bh=LWmLyMkkJHLihVGXbuPOGJyI9VtkV2j9HxihSRCgI3M=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=ROJQ+zDb+7ZT88z1SuGSPxdMPp7lP9KMcpPCvtgzoKQp2Un7KqwBBRMhpuIjtG/LolmcpeoLqKCVXw5IOKiSjC6fII8aQ7Ry5m3CdioQbSsKBsp9uwoss8GQCsB/7NsrYn688DQO1cV4Yhaan98dqM/5lyfjDv6h4xcUkNRUqK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z6bAMnB2; arc=fail smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z6bAMnB2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764913490; x=1796449490;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LWmLyMkkJHLihVGXbuPOGJyI9VtkV2j9HxihSRCgI3M=;
  b=Z6bAMnB2Ot2hAQnndvMH3pcPiGt2TcffuLISuBzdXbUN+L5K7zNF1J7d
   cFFzJiqpQm0anvnMh2/Yx/MGQy1oJQ5Xb+yCxFeZcVZI5WcxcfKEdeBl6
   QtsWWE8hReYXtqIDzqgY1qgSvLOcTLARFV5VPk9zXfkGZ7ZHNPqN/hAby
   AO6niywKQNIvopLL7DswrPoAsDjM7E/QXk6RFR19ciZFBrS+5ncGAbvJ/
   aT4jZoBaFptvuiprv8LyYyaNNRE9D+WvwrWKqlgnKtRFrcXGHjhA+m5Au
   JbvwX/WMGsAk25GG7li+cCgU4TOp0BJsarGnsUFZeZdNQA755aiy4QUjQ
   A==;
X-CSE-ConnectionGUID: lxREVW7kQLCcOIWQwFxTNw==
X-CSE-MsgGUID: SvY2ZwzOSLm6NJFm9sdm9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="70794685"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="70794685"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 21:44:50 -0800
X-CSE-ConnectionGUID: hix0BR7wRoKWCN325KLkgA==
X-CSE-MsgGUID: TB8JgDLvSHywQfqaK/nhUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="195107258"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 21:44:50 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 21:44:49 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 4 Dec 2025 21:44:49 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.21) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 4 Dec 2025 21:44:48 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bd7xB7qM1GYwqLmeI9ttN6qc6lUX1xtMzPGlXlFSz16tclNcNOz1MWWvz5inS+mHcCY9cf2uAl/9i1tEGUOFc3aI9zt/gYmSVVaw9t3wy7Dy/xThk6re9Gt3JVS0qb3AhuDhyY/aq7kez1nJH/ZEP2RFxmZ/AJ7cbTka5OPxhAVJpXLrKmUnVKlkLy3BpmxlGQUfuCPKHjj2ct41t+1uHGOrYIAKWS0Qipx/3a12eIggpSfqpTxBRpg2xPio9Y3AUcEjad+OOwaAOmVZUl/CeGykI3VXJeGoqozJLuolM90qi7uaGCIjhja859lOmZtEfYgiDaXgD34WWzdI87QZiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6pxmIGlZdNxSfVS0pchwdrVC5p6p9/6VweiDZ3AAP0c=;
 b=oDVYWyYrmAEA5MtjkcYBLEwxJt3IWJ5GrMuHEGAnQWoWCt4mUycREkJi0eEWTvjm7igUbe0zHXc40nJuXEZc1g2ThV7GHRHWgm3lkZBoR02TXPAPNaTbuMpOl4ENsG3q6TAbaPWw8CyVNGvrgk40g7bnUaKNqtp7DIp36F0hZR7TuYVHXY8lXIUZCzZ+5nH+ARQN40khFjSvAGjYBTgUTwgDJL8w2rEexQbg8pBDfZRpN46jcqPKjQV1kiDr+UOb6SDRhzlAc74xIAEPfwfUdVOQ/4TbcOs915UGrUM3Iq/2GAcCS0Mp+HFvduzPtkjGIZS/WfY7wqYc0K6xLU6aZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA1PR11MB8491.namprd11.prod.outlook.com (2603:10b6:806:3ac::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.10; Fri, 5 Dec
 2025 05:44:46 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9388.003; Fri, 5 Dec 2025
 05:44:46 +0000
Date: Fri, 5 Dec 2025 13:44:38 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Brown <broonie@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [broonie-misc:regulator-fixed-fix-gpiod-leak 19/19] checkpatch:
 WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of
 sha1> ("<title line>")' - ie: 'Fixes: 636f4618b1cd ("regulator: fixed: fix
 GPIO descriptor leak on register failure")'
Message-ID: <aTJxRlAtABIfpHfl@rli9-mobl>
Content-Type: multipart/mixed; boundary="dk9hDc3MLZl9Plas"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0159.apcprd04.prod.outlook.com (2603:1096:4::21)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA1PR11MB8491:EE_
X-MS-Office365-Filtering-Correlation-Id: 7904c9be-2202-4f91-25d3-08de33c1659f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|4053099003;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZSpHpEGcd6XVwbAFrCKPuHKkMrB1SYrqvEoBGlJucF0/Xxu8XchOO6yInvZm?=
 =?us-ascii?Q?cA3pX+aoIFWjW7FRBaqt0Mogb7go/witP3Ue9WE3wpTKXMO7HScvbiswgpeO?=
 =?us-ascii?Q?AwVLRO8AG6cUr5Jkj9a42HFLP3CP4kAfXxeHCw+Mx4l2qmKUqkrxULvQ4sLu?=
 =?us-ascii?Q?q5VW6hi3UkSNGAl3BgojqmhP1/L4tDJLNAda900ZoDIw7SWGxshEKN2M0FHI?=
 =?us-ascii?Q?HhZtqiPJwvUmjgrNAPA1Vhl+zDaJFHD6woFjVrTlh8D7oxthq67LFB+LxQ7d?=
 =?us-ascii?Q?5kHd1l4PB8hgmVAjb8XS5houEhzm7ZNy3NtqM4FXZltY+Xj+gauUOLCXgbhL?=
 =?us-ascii?Q?4Oq9MuYsAwZkv8hw5LtW0Co8PNvlqMevHwcdsThEqaAQ+nfZbdaYDjDTt9bj?=
 =?us-ascii?Q?o/ytCN3Wi9Yft7UEJaFwkuWkzbMch5icgXEoODMoWHtnGYoLmuZnYE4e6iHs?=
 =?us-ascii?Q?VqgzYqabPM3GoLcnIaL5D0+3uoCiWbUJGKY7HMdpxYm8qfIgSt0OHTE1F5kk?=
 =?us-ascii?Q?qFfiRGwnUxB2CvCg+OzzArqgW92F5y9HxpqdkpABowmAP79aP+lBfUlmL1Ch?=
 =?us-ascii?Q?dGyqL1KHVAm6lLeGC0DsV5TUDYTx07FdF64ksbbD2dwpo5xJl8mRldd1ZVB9?=
 =?us-ascii?Q?40Ta3AzKKEkIW+iBWugUv9ify75IgcZhuLWQ9ILR7vgnvzjIzPciFZEGSHDg?=
 =?us-ascii?Q?jzrVTirpkeshAsXT+IRSreITVoh+DyERnoL8J1AmyfojVF247Y1lXukNob4m?=
 =?us-ascii?Q?s0u7xy94VoJmV2BSp24vixu9PLfodQkDXVHVJt3GzJqxcrs7kO/sAnEktBZU?=
 =?us-ascii?Q?Tgx0YIXqIyzYEVGKp/OmRc13feaQBr+k8wismmMDMCc5o1LERROZR+UGF5ng?=
 =?us-ascii?Q?5krdZulZ+Tx2w8K3C1XTOVVpgn7XLhf0y1ufd3PFFw+6p7Rh23H1VN1UhbHT?=
 =?us-ascii?Q?jei2T7+Nq+im/eQVyTRFAQ0jwWJb1hmVmr8yEMi4I55sCdbt0QpQQUGLV8DS?=
 =?us-ascii?Q?M10se1P5j+Nn7ECrSsjojdzkpjF5NFYec0fTCN5emwAJMF7dkbjJ+OzeOM8y?=
 =?us-ascii?Q?eUQEg6Ihxr5DCOcubgsB94mjNgZzLGmfjKiweSdAyPjbEeTycYDmrsJAIVfg?=
 =?us-ascii?Q?0KwWlbicjteRzlbNb3iTOGEkYSTcK2un1MBLaFysydnVUzDmZN/FkMZxx0G7?=
 =?us-ascii?Q?o/VLt71JHnM014aWKLRw4ghx5dgpC1UqmmC3q2AgG7qPtd5X5uh9ClKC46qa?=
 =?us-ascii?Q?fH/0OrG5wldbZVQg3VM3ai6b0b0fIzRTYA9obYvy6kSevJGQlErjsXST5arr?=
 =?us-ascii?Q?v1D3ow+hzLOaqrmOc85uFg8CMDOpm2y3rhFfWx1uKzGXTGSulnG8y7exBnG4?=
 =?us-ascii?Q?UNb6SmvswGa+x7dLa9AolmduPpAwgXj9viJGDf8M7ddsS4/C0iW4GZkn3rhD?=
 =?us-ascii?Q?TZ81U9Ruis0Adi85ikG1KTT1n0yxUhRwpcKUnt3XJ1AC72FAUB1N3A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rFNw+wti+FZnGb90TfOAp3Avm0yUFRCL13z78MdYvdiIp3JGBmLHqofi8Y2U?=
 =?us-ascii?Q?AKR1Nanu5HCTtr6xlMafRg28sf5TyXwcl6M84V2ATUz3E7kJA5vFkbATAk/Y?=
 =?us-ascii?Q?gwtJfwIkvFR+LBocWNLap7sxAeN0tBnIwPuibD5hahkZeVeJ+4JPTZnzddZa?=
 =?us-ascii?Q?TvlVz79L4cpQfyXThykwBjlwP3Lw+WYTWPQznDgppZHJPLgU5NNjvwl8xvZ5?=
 =?us-ascii?Q?T/vvV3D+aci57OBkZoaDt2xpL+KqYNbfLlI+MXp8NXVCVx5reMnoQG7otk/O?=
 =?us-ascii?Q?nt6yhWW2z9ixpG0pI10/SARkhmpkiPP9S2HIzHQo7UE8J222Yg2xf72iiPMY?=
 =?us-ascii?Q?gJQ5+8wnJJ5zfzVaEQ8l731/3eWjPpeUrGUPAcl35qWsfDZ6CyZshc71nByV?=
 =?us-ascii?Q?9Mn/OZiIrS/aU7OM6wIdesLMzxIK5nSe60LDs2kxjjrtz6LfImqpyG+pSmeA?=
 =?us-ascii?Q?r2ZNW2hkJngQ0amcDi9oiRGeBwSbQDCQIhaZlyIS4EyDwuA02Uc/ZHyEEjeM?=
 =?us-ascii?Q?y0QnHjnUX91CZCzbbyuu3ZBRx4iwks50ZwH7F8qLvzH//Wn48I1sQL2EK8Mc?=
 =?us-ascii?Q?EdxVLjRWqkqAaqiA++sstxQDq9RuKYVbHeUOh3SK78/+BHvbH0JrK9iYCkfb?=
 =?us-ascii?Q?/lqnm7GSTLKa6VHP4MOslsBiTBFtmAD6BMFUam6yr0qdse5B9at8lPGSnwBy?=
 =?us-ascii?Q?dmaTrWadewIbYuHp88PlwsnTOW6uJgAo7uLEe2gnlt/GbGRP0xGWcDSK/1hJ?=
 =?us-ascii?Q?k1FR1n5oNejal0dN95caXEfmda+QW2SqR9xjwmauBsftSsrUP4dYSEZxodSM?=
 =?us-ascii?Q?m8NTiKr7UTHBiRfRAdECD7Z7MCYbo2blA4hGzgW54zH8DqmFZ6ilktFNpOnZ?=
 =?us-ascii?Q?ZGz1/4gY5nWs0E82AiltTMrR497sXA8wVm3+ykOHD3Mx8vbvGXrYXkWHWrNg?=
 =?us-ascii?Q?iuCAi5VuY93urmr483giOB8YF1r7Pkm0IE/hJ9zeERteEG3zCvo9MWxLdYhe?=
 =?us-ascii?Q?4L4Zp1rTB5sBeRVPIrbfa2furaV4oXhqgBLTEVTwIl7AMBtU45ua40XsHm42?=
 =?us-ascii?Q?oAlwQ9IcsQ+vSZnqJs23poIRv1FLMTM+7srd9+7FOhNqrMzJsn+Ch2dZrhjy?=
 =?us-ascii?Q?GFEfchw9Oskln8hnJBPeYMgYpJOQmSZvHspXB0QuQlmTXs6iBB4nhcf8GX5l?=
 =?us-ascii?Q?b6qpnb9bc4ZLc8b+diTWLx+TapnAKNBqHk+b9X9UK6K6H6q3QgXFT/AzSl2l?=
 =?us-ascii?Q?tY1Ccsap7vPrvmWz6uvquScw2mVC7jDaDOB2Fqxt3l3OORPB/NkwMYmD/2ma?=
 =?us-ascii?Q?wnWkjSzVu+HzTsL3uGf3+UBBV3OR4zssREQQCAmI24wl0rPbo8+Cdo8lrZKR?=
 =?us-ascii?Q?43qFN/OxJB4EciPLWLt4jbRF1OszrjPNANkuIJLsY6p422BkKBoPaJCxL3nt?=
 =?us-ascii?Q?08pJWP3Va5i63JvAIV0vVfU7RIOpN3tzE0c1KyqXTuGOAglekiKXdn9l3jvV?=
 =?us-ascii?Q?EE5CqfNQdXy9ntAcftBqZAlGnrX1DRjwWGMtJveztM79qtbGJrViG81zUIue?=
 =?us-ascii?Q?CCE+R/pf3cCUuEYWi4eWhK4xCDboLUbKZFd0g0eC8cIudKpDg7qPvySXdfQp?=
 =?us-ascii?Q?KQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7904c9be-2202-4f91-25d3-08de33c1659f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 05:44:46.1891
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Iwf6QcE7ge2n6PT5D3ls4T2wgHEcITF1NWUN/tabkqlFYFWQ4LaT6T9+DyXkNHdXCZ5axdTwTJLoBbiUQJsFAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8491
X-OriginatorOrg: intel.com

--dk9hDc3MLZl9Plas
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/misc.git regulator-fixed-fix-gpiod-leak
head:   2b374b8f4c7ef00e881ff72f1a70f0d6d86757e6
commit: 2b374b8f4c7ef00e881ff72f1a70f0d6d86757e6 [19/19] regulator: fixed: Rely on the core freeing the enable GPIO
reproduce: (attached as reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_FIXES_TAG: Please use correct Fixes: style 'Fixes: <12+ chars of sha1> ("<title line>")' - ie: 'Fixes: 636f4618b1cd ("regulator: fixed: fix GPIO descriptor leak on register failure")'
#11: 
Fixes: 636f4618b1cd (regulator: fixed: fix GPIO descriptor leak on register failure)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

--dk9hDc3MLZl9Plas
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="reproduce"

reproduce:
        scripts/checkpatch.pl -q --strict --no-summary --show-types -g 2b374b8f4c7ef00e881ff72f1a70f0d6d86757e6

--dk9hDc3MLZl9Plas--
