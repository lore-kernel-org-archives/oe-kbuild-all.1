Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3827326773C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Nov 2025 11:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764415182; cv=fail; b=RpNHhfWKJUl9ab4mY7sSoDc5CP0HJ23P8paCSmk8wCV3evtQVT0Hb9nKptyauHR7drU7FB+XSUY/tHhcly5ECSccmaGKfTkVAj33m5F+YgySW2fpOyCGiO0e3bNGE1cFj6lSFJFkstL6y2RlzTT9g/R7X9V+3I9f2xHklLqz8Rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764415182; c=relaxed/simple;
	bh=R637Ks31KweBukpuf0ImWriyf82bPbErNxgapjN9aow=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=DzqQd0E2s6EwS2lhfC6ZuUoXx6dAln77R+9z4QVv27cCjd5Ciuax13ApPGNXANZSUq3RXLRe4OFkwLp6fiI8l/6lJn8l7qfop82MCOvPfZzpDIbyqWo0fgRF+eq8o/a1aEnvXVsKTP0+UlxnB35oZ74RGX1jOOSdTJBvx7Oz5YU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WQgeCgZ3; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQgeCgZ3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764415181; x=1795951181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R637Ks31KweBukpuf0ImWriyf82bPbErNxgapjN9aow=;
  b=WQgeCgZ3culc4GlmJE+v+O03DTW73oT5v6Vpq51pBh9AWrZ9iZycdd7P
   px5gL8V3vDtS4og1jt++WL7sZcJsPv2Zh5Pv0NSHJ2isHkRoMy/BUSdGJ
   kJSr9yIv3AlamCzfQXQJ3hMtbstiipcRWIuga9ktAUIrMvlrjVRNMvRd3
   7rwg1UGudlunWu7IokgZ1wAgeAF1ahrO4StefES7CyvCOBVliohasytR9
   fm1byZmxMca2AiLRq9+yBlO4ol0L/6a0zDrZ1Et57AZBgdpqLr7r4eVzA
   bZJE7HdwvoL9aFBVGu5cqAVOCuoWSXpKiEsYSe2k2VGiEfuId+UUx/xxb
   A==;
X-CSE-ConnectionGUID: qIrK2JN9RYOt/zeWffgTZg==
X-CSE-MsgGUID: 6R23ZPTrRu685ORqtddI2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="77774054"
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="77774054"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 03:19:40 -0800
X-CSE-ConnectionGUID: vq3OGhyrTPWDk/JAryo2vw==
X-CSE-MsgGUID: 4kCmgSBFRDiZ/xNHkQBTaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,236,1758610800"; 
   d="scan'208";a="198577224"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 03:19:40 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 03:19:39 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Sat, 29 Nov 2025 03:19:39 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.5) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Sat, 29 Nov 2025 03:19:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBR74a1fkkShCl3eOrvw8pIuxX3xokllYtYl7klVuRzt2rkpuWrvSL4FlQoNcHjWLFRqfhLnrRe0L7x+533cJSw/DlaKbY4MBhXgvjZzHmiaAbXTUrP9q8k2dgrSCwyfF8pdLf9vIg85HcmpLkSrX24BBnvm9+1u7hOO4XBAs4HsS1tC/awx4kGORjdsERnL6mJcdWWWMG3ADP1XsuQ4LNtzvuH1FkPB+8x06v5oLe7699C+e5PunzOKhpLHkjHDmQwCCepcAL06MeBvzvJRppuyCV8KVmJgmEiPdVjh0zU+JOQ//2121rf351B2eJ0+LFgMU6HO1BnT81Bn2cAOBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oe+SerKTDCz8iPRw09nA6BC1IBaeUHJjjmqxkykmJA=;
 b=VGoWrEJDvPVh0IzBgd6rQ9126MKo3EwAwQ0mIjH1sxeb987OIVsTiN6FQGmHXAP/4BzctEQp/v4JtEJJrmPGfYjj4B4fCC4sjWysnKb7Bfmvqtdma7eNF40OXSKvXBVkKACegSs+Lkju+/iU6oesT6slEez45nUaD5Ncd5/t7QH4hXFa/PRwF6JXA4djmzs+bbIq/Exd9ygp/pBlkaC+Kb2UMr7gWryQdE3q/N3FtTL5BYWJn1RjRrvQ73BrrU3AgLjeBALdF0KE2/dMgnPT1SFzoY8EEiEcel+JPXfjFMCM01eM8CyeD5ugXa1yBrjIKkUDO77FDaNI+glS3FpI2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SJ0PR11MB4894.namprd11.prod.outlook.com (2603:10b6:a03:2d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 11:19:30 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 11:19:30 +0000
Date: Sat, 29 Nov 2025 19:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: SeongJae Park <sj@kernel.org>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [sj:damon/next 101/102] checkpatch: WARNING:REPEATED_WORD: Possible
 repeated word: 'is'
Message-ID: <aSrWuUuXhjnUZu2W@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0169.apcprd04.prod.outlook.com (2603:1096:4::31)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SJ0PR11MB4894:EE_
X-MS-Office365-Filtering-Correlation-Id: ee2c8322-27e8-4fac-2ed5-08de2f392a55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ZXAERElp+1lFTJG4Lk+NoYEfmzqv1EqBoF7OBX603PxZQFJTnBGFNiV0TfDS?=
 =?us-ascii?Q?sjp7PZZ50pUdjo/6Z862T06mKqcc04PQZu5dcCp1RyZ23MC9j5ncictBAD6D?=
 =?us-ascii?Q?KYLquCkESNKXjOZPOARduqs57E/2jMM4/nCY2MYGOVUs5NoEhKu6ARFw7nJe?=
 =?us-ascii?Q?JdI49FmTgTXBig/9rLY+Ok84hsQjyIKZZRsK9ZhCyX447hepoXpHdehLrgfy?=
 =?us-ascii?Q?GIL4CV7Gu/QEJytbdQEmIIyrKRFJBiisw96Alhb3qEgAatkh94av6n/AziVe?=
 =?us-ascii?Q?zfPj/V+IAxDkFpLuehBGi0oQDfxgndQ1SXmEVy9p4sNE04DAhvmfYDNwHNtc?=
 =?us-ascii?Q?8RTSKw26yWkOG854MPykIgwUWWn9QYEfnox0gkaVWGPfDciUmHebaJlmOqQ+?=
 =?us-ascii?Q?rPt4pLqcNxyDTIA9cCQ62mwrtAMeixEgk3rtmyDb7FKMnVehqIi9Oc3pv2qz?=
 =?us-ascii?Q?fkn29y/sTtADXUPSM6fCJA3N1ghwj2gyufjWDGnYxSnQ30n/pnWQ3N7H8v6c?=
 =?us-ascii?Q?1HmOkEM2h4+OUL+TbT21hpPUv2liBa2tdfPIxpWkuG5IZkB6D08wI6N0wCgO?=
 =?us-ascii?Q?T1xaKcRA3zm5DzOjaHujuUdRn6xKYZza1MgQk9Sskb2+yVFz5RO6mHfPFkcW?=
 =?us-ascii?Q?ywb/9rDg3btgkbgGeU2R6oC/SSCkBkoDX4xpRJ7sDZwOLqQlv/tzYlkSDaG7?=
 =?us-ascii?Q?7RFs+wem2tKC5pNgTxcp2l39yOV9V9qq7QOIZbwl1RckNSdTu3ZFyS/cFWNS?=
 =?us-ascii?Q?Q7sKm7dSVoMGjo7L4lDkOJuK9IvukGqIH39oSoXN1SnrsF6mhB/icOVUxNMt?=
 =?us-ascii?Q?Up07z52FOroEf/+npWSMKBP9yE1SDhZEePqlH53xNZMOlBk8wJnaxV02fJVT?=
 =?us-ascii?Q?6l/VU3ourGUH/gZWzbn3hXAoTX0y0Mas4jChy2aYDhuE3ZxXbKd9YFu3383a?=
 =?us-ascii?Q?gMzRgM62HzR+NldOoChuYbS0AVlnsoulEwInxaJGdDActO+euPw9jesEwo13?=
 =?us-ascii?Q?9LwPlbOEcqRZgHl/2TyDyntgF+9oGwnzOmeWj1jtGh6ZkfcmVX0NgcFDf+py?=
 =?us-ascii?Q?JcS2sNQQdCGZK2z7ThyQ3e/u08O2HSxGzLpHRmhDB50s+ImCSmcYB3lPa3Vj?=
 =?us-ascii?Q?5/gdQRfATEgRU7qowCwmQ1eDEfxqqFYDk8V+X9WuGlpYDUjQYdIgXYADJsd7?=
 =?us-ascii?Q?zWAWrchvIToe1O4KgRQIQ/aOj0LV5ze2h62UxzKaEZqIHK3ubxElHZictt6h?=
 =?us-ascii?Q?LbmlwrF1sTXxNOdX95VThWa824vuHkrH4HEntS8OmxTh+b+43gM8PLofwqbv?=
 =?us-ascii?Q?bc5+RbyjWAtuGE3y7AzKsOe3v7IXyv7fiV+LfgG7Gfg9NfuBC4KkOSDN9mjc?=
 =?us-ascii?Q?bDZgdD19CTmIDKUvyEoAFYSs3sW9KwAjqYcZBG1tUTjRPnBfsLayEyIknAp9?=
 =?us-ascii?Q?rTwfxWBJzP5u0bpAEwoq6hwAhZBTICxSgeEwMcmEkA3QJqA+9IGSZQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M9NbSMegyo/LPtqy9nfVRH/DKy1L0hOBrGvxw9EKQRf5+0F/KwyriDKDi8vL?=
 =?us-ascii?Q?3pGJpL/xb9eLWLcqDjv3TK2ZUIDg24Mz5h/JxdUXlHiU9AP5Wg5N17WH3Exj?=
 =?us-ascii?Q?iAIhfLWmOaemmPAmVqblm9HDpn1olc/qQOv07R2LFj2tvdQSGQewNCuchiSB?=
 =?us-ascii?Q?QC98XEEAR8fd0CYRBPOneQOszPlGEd/3XtJjYbivemLcX0zNX2S6+2zDiZ0N?=
 =?us-ascii?Q?XNeJuwQoTnfhQD3XQ6zVXyt3nqxJxjv7rNlTdPOxKP7aaYsjO1G2dffYt4+y?=
 =?us-ascii?Q?SWyiDVZ0FRVgyJN85MgsdRmdtE1WJXCG5W8pr5x9M9t3ttDMF94LaaCRI7QB?=
 =?us-ascii?Q?a2gKO0pWl4qvvsWIvOaHGJdvvusQdipFneZyXx4irJlT1WELJ90F4eZ7ZNM4?=
 =?us-ascii?Q?KTBfrd7Wv0nXYt1VvZV2NBoePeGWJeY+5NMtM3au7v5FPrUC0MHldiZVQIQ5?=
 =?us-ascii?Q?MP5j3FbpiSKTC0kty3AOY+QW+owTb6Zbq1dvWIpnhpVQ2LNi8jCR1mICU1Ey?=
 =?us-ascii?Q?4cBVqfRmeiGg2YFLuTKHDXq8+7wnO5nJov/IackwgIcdr7nUsSWwL9pfpooX?=
 =?us-ascii?Q?6a2633VGt7w44SZgm7OSFd4kCBWTtEcz+zT1TVNGL9kzqw55Dj0RCGv2r+pc?=
 =?us-ascii?Q?jPduuh2prICS0VZ7crqT4kECdJqdSq1v/jY4lEtFn1MBfUWroMDNvT73jNrU?=
 =?us-ascii?Q?kNDCyCxxIwhVFit3FwR8hAuH5V2Iv/pk20maGE0siripgaKuVAgza+zsSAfJ?=
 =?us-ascii?Q?0nEoY1MPNbunNI2bOp8pyRi90rJTaFQcWQy7P6Fz6+R1W6OsEpZuTpZ7fIp9?=
 =?us-ascii?Q?Zp+0rBMq1RtRiPdYv1ngFe6ni7AwpO9bmyGMc0YGKu2iymquWWE/xGxYhq09?=
 =?us-ascii?Q?a/yGI18f2KC8AlYdVvKHYsWWZzZMQpFe+frIQTqxN7KtIS92VEJAMZNR66Lt?=
 =?us-ascii?Q?qzliALU0yklFVCOMG9NDe6cesfz0nUAY6LVupl20920e4cS/kgkiLp1VSOc7?=
 =?us-ascii?Q?tOluBMAdL0QH2P+VglTGURcnbqBqJzYHcrMrmG9zkTV/agJXCeQl9NZAKi+p?=
 =?us-ascii?Q?g/MHh/npMdIbhCOkKVO4ZmRE9b6rk9wjhMZRE5yhsfnfkwlMSpr9NRSBDu6d?=
 =?us-ascii?Q?N4mJptp8fDHrG6jOv4xleKO0+PU3dhsAXT+0FApEdtDgUqyDSZ323FaDdBv1?=
 =?us-ascii?Q?mP3xKmmJxXWGqro+3cjDp0EGU/hC8m5IZCwOfqdlJ5TuC9/U4quNw8iAWiBI?=
 =?us-ascii?Q?c+uimcllW2INltYi7TGRKtgBdm3ZlGnPM5ilHDDs971Qrr6FlLF5FiQTmI9m?=
 =?us-ascii?Q?raB8BmFBe6Hg+XzPt361ghBjHVF1veoJLkQv3Yl1VNjnIRE01Kr8VpcHdTVW?=
 =?us-ascii?Q?yn2iXYcUg5+u4AbKhHf4porKJLuIpyl8JmJqShiLhzF8Dap+1FcY7wDv2EV/?=
 =?us-ascii?Q?prKQFLj2nH07F+OoGs6zIuHuJSM4zvyg+obFW7HIzcqasVwqPsrXxs+ecRlJ?=
 =?us-ascii?Q?pmBZSKc7jgf3/yTe1uS2B98Sa1qBNncB1z/Gfaa+Xy39PG8Guitc3cqE8xbH?=
 =?us-ascii?Q?uzd8BT2sWin16Kr3kzZD/GQrrAWnhLtOhxyUVW7F?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ee2c8322-27e8-4fac-2ed5-08de2f392a55
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 11:19:30.5098
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgVlv5sKH3Ecrp3R3wyeX8SEbzfkfwFDJa48aKDybzLUCSisioWOjcPNmLgHfg1fWBgAQwGa1RKMNYTg5xTAOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4894
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sj/linux.git damon/next
head:   09441df640d26cf9228bc68c256ebf1f0e28669d
commit: 5e3fefed6d95bbe0b2505ad80309debcf09bc439 [101/102] mm/damon: add data structures for access check control
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511290619.LO76yGtH-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'is'
#45: FILE: include/linux/damon.h:862:
+ * @matching:	Whether is is for condition-matching reports.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

