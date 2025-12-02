Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B3B13C3F2
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Dec 2025 01:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764640714; cv=fail; b=rgkDd9ptD5/zR1NqeJ66AZEcdhKzPxnq6/4HNX4k9MmCAIsUEqxU/OPbb5w5UAM9KzqAUq7KdmYmbo+IFmS+8YwZkgSCHx23eomdQy/37YO1cfsVXjQ8EAn+V8c52tWqUyU9xc8i/HiilefKDTfqanGjEDkoNBUXm2dZ5Sha85k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764640714; c=relaxed/simple;
	bh=O+ljgHRo7NEa84s2e6WM9kVu1DZbObkhQTpx5KbkNaQ=;
	h=Date:From:To:CC:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=J7Wh1L07jbPmrKC/pg1WR9JXTTw9G+0vAlg+D9qQidyGymSG5G3EDfrVce0K/ZETe442CUTojChoW2GTjy7cOmNwILTwcnv7p7RJrrQnCznv0Y65X7MP63UI2C8d7V8PQcYNM2lT2JguP4wFX+k6GxkOFBO3GcOGO/WqQTPXNKA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbzeCwct; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbzeCwct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764640713; x=1796176713;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=O+ljgHRo7NEa84s2e6WM9kVu1DZbObkhQTpx5KbkNaQ=;
  b=FbzeCwctsSewm/0yX3bzVPRzdGL0PJDqZ/KhBSC7wRVibU16pO7QzQ9B
   USszY8UgPseKpLG2ao4LvVUnPwDgv22sEL5FscH9Un85dG78ziVhtJmqJ
   JRJyNbVhDbFNAq58z8RVMw4wgNxGVjrQid9MEHntW68uvfG5nx8SnblpN
   AJ49gRkRuJ6HF3Gn7R7EO7TzigT925gA74WmDhV/cu69dF3DBtoLVfkRC
   i5bPG8XE23FpdeukiP6mCM2ieNwGyfKBbe3a2YeLydSJrl9WMBvHv2PHK
   oGW0GGaOscCmhgIAYcoACIlsv0vQSJFmRo1p7uXT6Sn5Tt4+YpqnzvNJU
   Q==;
X-CSE-ConnectionGUID: hDcrH33cSKuUEwR+THQTQg==
X-CSE-MsgGUID: 4zqeltK6T66RaLfTX1I74w==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66762177"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66762177"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:58:33 -0800
X-CSE-ConnectionGUID: heznM7QKTdC7WY3qr90tdw==
X-CSE-MsgGUID: glTd0Kx/S1Oj/p1LdcWtfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="199354854"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:58:33 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 17:58:32 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 1 Dec 2025 17:58:32 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.8) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 1 Dec 2025 17:58:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E6rOcEK0aBlW04mKSinUxPy9sVOV+uhWCSZqndkSlMMRM4ICXnwdBaO5IlBVfTzrrburNdoD0jADXhfnwkfB1xvmKMcjyAxHW5jinuqhhoIp5Y1bazxJj5Z/dB1LoORbyFw4gagRs7rQDpwji9LfgKzavf5eCGlggHbfMqCbiXOMIPNXm3OfljiY3A3/0XHrZb7IIpRuuNC6vzkSsW0BmRL+2Q4npxzzGyiaNYDWEkIipBnouRvqdnB+7EM4hhHlnTCghvdIfaujxqEaXSGSf+Guiv0sA1YF3E2o7TQ/bh+D5+NqS7EETnh+nRjj3uw9gpNkH5YbqLui47/BL+W6kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFC2+kud4Wdquiyt1gzDcyzXyYb/3sDorgD1aDyzRKM=;
 b=D8pIRtMpSxIXHGjhsLsJcTfSQXSsX38M7TuxbjypWr3kQ5tH4+Ql5S/9baHJwr3MFDWgRJJwbykoQJRrUIsf0PsiLDMwH7/l35nhy5uOJC0RP8z3Fy+Xk3wNsvrMS4jjk67Pk5b3EMJX/0pFqAi3UFx+c6tCW69tTyyaBRatBPwLzTlPuhgEAJ9XBpqKt7nlY1lAf1jVSmwj0q6QHxkKIHfy6HxBin1NlmTGgog72iumL+QYxbcanewiuT08W52gBgRGyEdQqPxy6WtTUvHBR2uD9eKDwr2WvVukOLIcqk5HDlyvh9J1o6IDbQeLtBhEHjNYo1FBdy+nZBiroOV7JA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
 by SA2PR11MB5129.namprd11.prod.outlook.com (2603:10b6:806:11f::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Tue, 2 Dec
 2025 01:58:29 +0000
Received: from MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9]) by MN0PR11MB5963.namprd11.prod.outlook.com
 ([fe80::edb2:a242:e0b8:5ac9%5]) with mapi id 15.20.9366.012; Tue, 2 Dec 2025
 01:58:29 +0000
Date: Tue, 2 Dec 2025 09:58:20 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
CC: <oe-kbuild-all@lists.linux.dev>, Harry Yoo <harry.yoo@oracle.com>
Subject: [linux-next:master 6382/13171]
 tools/testing/selftests/hid/tools/include/vmlinux.h:68845:2: error:
 declaration does not declare anything
Message-ID: <aS5HvN7Y5noqlRrv@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB5963:EE_|SA2PR11MB5129:EE_
X-MS-Office365-Filtering-Correlation-Id: e7c0e433-f187-40bb-e80b-08de314649d0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9ceARXd/oOjfBHh2O+hsDmsEz9DUdTPRXKBdWJgrncg9NhJjq46lpckFxz1r?=
 =?us-ascii?Q?96Wep/JlLgCwJVZLzbRHQXbLgWkXpuRk8U/gZgZDmi1oKyDET3FFLitAS2a+?=
 =?us-ascii?Q?H92Gj2nJD5AErkCT0xVolQcNdZdoftakJDxZMAegsxLwUR3oHYmqfi1OwE6N?=
 =?us-ascii?Q?FIfyWG47yylX/ThtDoxI9RfJzwQhMvtWnNSWUo6crTBHdeA0r2grL70dlKVw?=
 =?us-ascii?Q?osiYnYMAU7xJloEiSzAsAWmqwBJ3bndTFGZH4809bXqb8p8K4UzLbByHtszR?=
 =?us-ascii?Q?JkAx+DFdU5vf70UuRVMZa/32q4qms/Ajb0eBSYTU3Ty7vbHkMlLsLoVta9a6?=
 =?us-ascii?Q?MflqMTlXVd6xROMi59KTPF6gRmzGDrmNCHz2o0x4Q4O2KDDtU1mr1nA4ua8w?=
 =?us-ascii?Q?CmCRoZeCAs7XNdnJScPWHc1AIRSqX1jjFTuqna/bQaIDA5XuzeM1JyWPfWDt?=
 =?us-ascii?Q?a8SHO7mpS61a4KG0sDRogEYzP6wzMMeyBDfaKBVVF9ZIKGYNRfWnPDxj/Jsd?=
 =?us-ascii?Q?8dIws167HF3P4AwZwLJPYvvigIqTf+pLLPZq++wfXE2JMw6yPlbTZ+CAW8cf?=
 =?us-ascii?Q?rbvAGJQlrC257aNVepPPIMd+/trYuzAjFm4EqlPgmY8xVZtEyDbO7YSlKMao?=
 =?us-ascii?Q?4epBL/NGsO1MKdgumb2jNWQlAuE/slF5Paji7J216g+Pj2etw437bboTEblY?=
 =?us-ascii?Q?ToKNf5LBQ6xo+JL8vMqCaiEsaiUP/eBZsW8gg6yx1tl2n+q7KfnKlB0F1gof?=
 =?us-ascii?Q?350FszpOe1dKcO5AUHf1wVMecWpDCi3+GFVd5sEFkIKVm276TKUzN8IaXwZp?=
 =?us-ascii?Q?fnBdBYO/ZPm6jYazKMuDk9qmFo5+zNUNiv/9VFFMJbmGMoMKHlHwvsF1/AuV?=
 =?us-ascii?Q?hypbGe8M/RLepsWRm2ePb8oycoaN4bL3jQc0tTSBT5H7BkJaDJY7rLdbiozm?=
 =?us-ascii?Q?VbiCMbrARQg6lLB/gfYUWREv6eQ1oVh0QBXD+IaBh+Fxn9sBQ8OgkMQv96MI?=
 =?us-ascii?Q?4lw7PkLEzWDJWm0MxPxKol/i3rKCsuenmBQyLXDKysel4lbpq3tWWdUGDW+B?=
 =?us-ascii?Q?y4F1/0xCWuYoTkct6P3GEsyIFEecrDNMZy3AiY8hD2nmqFhFe8GPTUZxPibw?=
 =?us-ascii?Q?oYRLVrIytdgciMIcYFx0q/LWWkLXVwuvjU3gZh/F6OsAtpd6LcXjOhXoGqqF?=
 =?us-ascii?Q?V2DbLAphZnL/MHJ6VqIn8ajqYCvsPYivU7MbNWdMJdZc5WEq6yks1PKk6dS8?=
 =?us-ascii?Q?O0qLvb81qOKP/TPC3ES1EkOHa+4I0ZiYhZfRXYIoqW4CdQ+IQhqpixj2VU4B?=
 =?us-ascii?Q?MHWeTcVsmAxg8GqNZb/Qqv1W0qPTVQiNpCaNSVZdM4cNK16dZozBBuGldxfL?=
 =?us-ascii?Q?mGu4SJQpkOYUY0JrHRnt+KKhZp0UFl3u/YXMYb9pmWtKfTF3jQEChPtdgzBN?=
 =?us-ascii?Q?x0hX7q8rqNJ0ayeYPc44iLpuFbT57QdheCsimTYBNzWiBEQoUBH9RA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN0PR11MB5963.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yWrImxDAzhxFSoELWcsAxc26ToSMsD6YhSsNRm1BzHBshcQjHhm3odWaubW4?=
 =?us-ascii?Q?PDOKI6mZgtNtxaC/MAYDJ71NJyLI5Ps2/rzpwp2t4Qi9omnXTCRA+f896ydM?=
 =?us-ascii?Q?9PcDMmJj1rNFe6Dtn6p5QPOb0PjCntUbbD1zEe8+S8430jrA9K06qCPvktJh?=
 =?us-ascii?Q?Zcej/xKOjXqyt1wkAWPTIVbxoD+2MgzyylPkq3rER09btHB9y22unA0rDfK+?=
 =?us-ascii?Q?2d4L6yfjhZImlLDSu0OqNzH1J5doBYpUvdWLJzBIVLDYTvXX2Pq1UCU/RFe1?=
 =?us-ascii?Q?H7NZbF7/zV0O21hmZhCLZnNhCLeqK4PVVuwazNhwYZULpwK5n2wViUwXQcu4?=
 =?us-ascii?Q?KbzF55xWjBzFE5cEgmDlxYgogSnobufI/iL5iKXqRV37u10GgI53Rr1gTfLj?=
 =?us-ascii?Q?xieg7KRs5xLV3K29xMUSUS4x5Z6wi6wg+3GeVIaxSVH1j26/j5teJWJVYx6/?=
 =?us-ascii?Q?KTr420VEwOl0xZQ2/62FRu6FeQ/QCu+Nr9lJUobVPLwO8UWCLACCjMe2rthy?=
 =?us-ascii?Q?MW0Gbi1EDP7PT7KfcNSaUF4482gSC+ETPFqsmEVPuhgZjOAMAXkhEkL//2wV?=
 =?us-ascii?Q?A3enHombSagLZYU0SF8GieU+BgKwKZBvqyn1jWW5I2tpNeDrADz/naVrZUqA?=
 =?us-ascii?Q?xZwS5fclTYqGKOKK3iTDehWmGpJ/715V+Mqwz2m3u+AlWQQxnyhImGSQph7k?=
 =?us-ascii?Q?XJ+3LhFJPK3ugrZNnJBVKxpo/28HGuUwiVh+rqEj1kGwqzzp5bx379zVRPSx?=
 =?us-ascii?Q?MIx1ul5U4A4Bjb6EFkcuLQJ9wfntCqpnanCEWyJONH8VKqFp2ZxJPILyleye?=
 =?us-ascii?Q?pFXXO9c/lL9rPeXNRn4OCCZb6Ae6BaTVZvWdWh+tiG7cFzd6KZGzDnjbrpZ2?=
 =?us-ascii?Q?T2shZRZrn5wyVK5nwbbBINBoc8n1qHsjX0Wc/rj8/VDfAtXYHteEkxAcB5Ho?=
 =?us-ascii?Q?4nfLQfHD/9be0NFUXF0Fs9YQF18pgU6XgfuA6pdbYQVWPygl2/yeczNGGWJy?=
 =?us-ascii?Q?OceOtagATTjuVeUkhpobRlcZt1/ApHWA8UUSur9zjNopuPWrMmX1u7otVQFe?=
 =?us-ascii?Q?4bcbSqauK7TjU+tPJggkNgrr6zVSVOs+iAzPgQ+GOzvjD+gosYc4MHJHY1Ui?=
 =?us-ascii?Q?r5i5DBjzKEZuZmUBkZzmty8GEfmBmC4gFMo/J6AC75z/4IgiJuRzOCbq5Fnf?=
 =?us-ascii?Q?M12R4enrZoVOkV7wErUeQdoHUi7HmV7jRlXJ4S4v8Q0U7Jnku0jJSKU/0zh7?=
 =?us-ascii?Q?KZoybwVEiXqeF2q/E7u7NbDZcf35u99vzxJ5aInVF2gEL0zhzwPg8bvajFJs?=
 =?us-ascii?Q?wEklfA9MWD76oYQUCX9yu9Gp9GkEFlVHuR5fIAVlbQQ4vw8vudRTyHvACRv/?=
 =?us-ascii?Q?PxySaRyl23HGmkt+RKRzSZCfpdV1WfWVhH2slxKNppcx9bPTtZne2xH6OIF6?=
 =?us-ascii?Q?QSPLV1B4aEdSAiOzC26aKjM31g71EOKrmwKITlh1M57bhKwXLIxWHx4qS491?=
 =?us-ascii?Q?E9NrdKa+V1qOyV9vLnkrzfyWL7d9q16Fbc7r0nCXe8C1oipuFIgqg7LNWA18?=
 =?us-ascii?Q?eGAZLbbTpzsjwPdWpetc8dc0xukFvMJKmB1zfR1Ww3wEMe1Zqgy+kOS9qka0?=
 =?us-ascii?Q?+A=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e7c0e433-f187-40bb-e80b-08de314649d0
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB5963.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 01:58:29.2443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gAU4YW0NGZV2FI+kMONkx4PtKZ/amb64E2OUmHH5mNdItnCdkwyNMA+qO5MPCMEZjWliwFKoN/CN1SD+o3kq4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5129
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: b244358e9a1cd61276b8785b1b4275f1f45a1dc2 [6382/13171] slab: separate struct freelist_tid from kmem_cache_cpu
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020216.mQmiCabn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020216.mQmiCabn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020216.mQmiCabn-lkp@intel.com/

Note: the linux-next/master HEAD 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from progs/hid.c:3:
   In file included from progs/hid_bpf_helpers.h:28:
>> tools/testing/selftests/hid/tools/include/vmlinux.h:68845:2: error: declaration does not declare anything [-Werror,-Wmissing-declarations]
    68845 |         struct freelist_tid;
          |         ^~~~~~~~~~~~~~~~~~~
   progs/hid.c:503:24: error: incomplete definition of type 'struct hid_device'
     503 |         int hid = hid_ctx->hid->id;
         |                   ~~~~~~~~~~~~^
   progs/hid_bpf_helpers.h:59:9: note: forward declaration of 'struct hid_device'
      59 |         struct hid_device *hid;
         |                ^
   2 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

