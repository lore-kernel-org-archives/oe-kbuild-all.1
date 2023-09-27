Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81811208A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 13:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695822608; x=1727358608;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eSMIeBMx+2is9ENUUiP7Depi56Mz4ioa6ZRdd5Toe9Y=;
  b=mh4qWtczsyDqAjj1msKzjym397XtmEpzCjiDLQrKvUJEl5uBj3lVk8wc
   lksJ78+i9yWXdrlJFdZ1yPlb6UOubCqezWQH/496J4AVQ2AdsqLpNOyc9
   5mVyHZ3q54lUFSyVJzzoHUF0oSNyBnEV8jThLnCqUjkDgE2kCcC6foA+r
   qYCbt8gZ9+ew9W8zwhn8hLrWoRmS45lO2nmxqX1YyQY9w3hYsclGkGZwN
   9e2s4uPhmkQ4BihWhxtRWpe2jprnRF0cDkdn/RRwwSHv8IuPXQ2p0/bA8
   usc2UeLTGfu3LHwLCjURXJ09MOwmuIp/jDyfSf2Ln1S2/y7cLYNghoCsp
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="362079343"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="362079343"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:49:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="864842937"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="864842937"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga002.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 27 Sep 2023 06:49:57 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:49:57 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 27 Sep 2023 06:49:56 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 27 Sep 2023 06:49:56 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.45) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 27 Sep 2023 06:49:56 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdKroDbC4ctsZhBbHwZQEFEhnYAA9z+tNR6g3XdlXNJOv00pqEdiPIOpHwBMnmEkBdqspZ2c6r8OgTVrd6aqRhK40yWmjTqZhbDdTFCalI76QSb88Mb8k/HXqXZqRiaLfCVZZy8zs9y7Ten5qbnO6uH7qlkhN6CyjDJZvKBpUHXBVqHizwKsEAI8ZreSpV/z9rXgYWaG4YR3+JtiNcJz+tdNqtv48nSadZRnSqm1n4SpyTrNy5duTOuNFawcN8Y0VQgpqervfdzEPensjFnYBh/LKKjFDPW5FM0aIxVUXs+FP/OGbFAoYFmMm2mF+qE3p22P6NaOVy1frZER8qW2xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lK9mICYZEX331YDXghJHZJXgSMWGJQyhD7AoPEbjmlE=;
 b=UBwpZUnJx3uHeWxrEew9qk2yKlja6xZ4Q7ekCqwZYntJHe26mgHjPOC9khhsHJ/y/3/dLo9E2RC5PX8Gmi87eQO8dWexZ/h3nt6M7x5NgWkOd5NFbAMnDjtZl55ZPt4Yny3AfFFUjFnXa6qkC0ykKbt+dz8Sq1cPIwR8/skb8y5sJb08j8K1mVoPWL4QvJhambAseNTeFKlmIaMzBMT0/RjiuUV4TvkxIbRcxFutNi/jEB15r9aVE8EeUjO5iQhwUA0DGQo3+YvEQ09MNNnw26F1Yjlg5ta3hsdbUUBltRgz3IgZzIpJdNPGtCFJ95zBVflFLoKnT2Z6d+eDNv0DqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
 by CH0PR11MB5505.namprd11.prod.outlook.com (2603:10b6:610:d4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.20; Wed, 27 Sep
 2023 13:49:54 +0000
Received: from SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d]) by SN6PR11MB3006.namprd11.prod.outlook.com
 ([fe80::b2f6:ff19:be0b:362d%7]) with mapi id 15.20.6813.027; Wed, 27 Sep 2023
 13:49:54 +0000
Date: Wed, 27 Sep 2023 21:49:44 +0800
From: kernel test robot <philip.li@intel.com>
To: Emil Renner Berthing <kernel@esmil.dk>
CC: <oe-kbuild-all@lists.linux.dev>, <linux-doc@vger.kernel.org>
Subject: [esmil:visionfive 20/46] dtbs_check:
 Documentation/devicetree/bindings/reset/starfive,jh7100-audrst.yaml: title:
 'StarFive JH7100 SoC Audio Reset Controller Device Tree Bindings' should not
 be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
Message-ID: <ZRQy+OkfOTL2tukm@rli9-mobl>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0172.apcprd04.prod.outlook.com (2603:1096:4::34)
 To SN6PR11MB3006.namprd11.prod.outlook.com (2603:10b6:805:d1::24)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR11MB3006:EE_|CH0PR11MB5505:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fba8bf7-bf1d-44eb-f231-08dbbf60a0e6
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kyGW4o9myX6onerLV1eDcIVKM5TUY9aysIwv6qV1Sspd5UvQzl3JkT/rGMHi9gJeue5CgKN01s442riXUr+S4E6Ld3huVkIQLpvN+aIgtXVZFK+o0hTw9gC3paE0/9TEZ08r3ixQxWOrHHPs+zxguZPSUglsf7aJUD8H0VUyaaLs5mkRnD5kRUSkyU3BbmTqY84x4pxWFixZAKqiW2v2B9en2Q9VnwFCGGmug8RtBx4o/yVNqgeA04vgNotaj0ITZO52kw96uLfpnTGQnOxkDa7OIeEsljSPPFq4xaTFtnMcLlRWPfWxJ/gjmh12A01AP7/eQ0f48Wh2cgVuaqULfz6Wlm3zXi+mA4S5Sr0zM94D3ARvlwIxE/4GAYwYZR1yqx47oYG8c3Ypao5CFPjwingMbnwlUshnEaHKC9/FoCVcJeTRUV4e6XjyIGm1oH+nDf3iUAQV/1iPfHw6K1w7NQn2MExQ39R+f3ZuO258uFjSyid2ONbUDAzClRtcNNnNUvmsV+4cFbjy546xuNMvFOEdsgFdBnHwelEoQb/gYUsMYKnVfqIuI5mHxRafq3JWY6mniVtZ6zsR/R3EsKXjhXtf7fNH6CKbhEF7IFd29f8uB2UVoi6g/upvU+doEmkyQhrVdLD6zCOyaM6Lit7iLZ8NBFkO2v9rBEPNFwd/ndPUGN4njEA9LksN6PSDyR3K
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3006.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(396003)(366004)(39860400002)(136003)(346002)(230922051799003)(186009)(451199024)(1800799009)(86362001)(33716001)(9686003)(6506007)(6512007)(2013699003)(6486002)(6666004)(38100700002)(66476007)(83380400001)(2906002)(478600001)(316002)(66556008)(6916009)(66946007)(966005)(26005)(41300700001)(4326008)(8676002)(8936002)(82960400001)(5660300002)(219693005)(67856001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?s0WdiSHSV9IkhT9tYzWSn/4HVTpH02JevIfXhpVdAOrTfvBz8IiINgNJWkVV?=
 =?us-ascii?Q?Apy2SPi05Xd2wrovND+Dl9qQ9Cu2k/RzbmeCeuXlEs3NZTDcGqlqGUdVFa3o?=
 =?us-ascii?Q?/YyvChGSj+08+l8AcfPtiqpSEO5Lp8xx3YEkoD4UZUfpqTxL3erqKXxpauIk?=
 =?us-ascii?Q?wJc0PTL3ODHBmCXAqh16w2UgW1mOgcalT1yGFzpggS3yZ70tH4dCfPiWOOeD?=
 =?us-ascii?Q?ABeBGtstF0lJwtWiOXprxr63QyTYaJJ3Js70DtB3l2dtWgnPXlcNHFcLV9Zn?=
 =?us-ascii?Q?BIy5uH3cniPNab+/d9J5Dgd9tHeV9Xal0gR7nCCbMrlpPypjUQZYLua2nn6y?=
 =?us-ascii?Q?u+PHGUAhNQsAcPUEOZMX3TskjJCNUJv+vXLbIRCLjA4P+AROJdZmV/Bu0ijP?=
 =?us-ascii?Q?aB1JHfXeNjU27Lee90jgcRAPswPNCPxoZ0TKTGIpeV1Dq9A79oVyRqvs+8wa?=
 =?us-ascii?Q?dfMbiiOXwJzL4XZ7scNmcJCHzjPy70N0nBUcralEl/GjxoN03NIDbj35sn32?=
 =?us-ascii?Q?J3kdBbbt3yQ5Xxl9HlD1cXeVLYG5Z9L7g8obdeGmApi3/R7lmPAtJPbKKccw?=
 =?us-ascii?Q?dRaN03iJ6PaH7rdaslL6J/st4RtJmUlyhJEziuOVB8rQj47QUtiLZLIpg5Yj?=
 =?us-ascii?Q?tc/F+ZU3dmd+D/ve/Jjk0jUmIiHE4VPsdsrSFyy2JhFwpnn5yGf2whCOk4yA?=
 =?us-ascii?Q?K2PGc/mZIVyOu78fDRhyUOyTMBpoDpkwkwTZDxRNDxf+IxCRuJ0vwL9CHdZd?=
 =?us-ascii?Q?1SOPUS2tzJko0P1XSsN7BGx2mzmz/vHCmGVV1UYqlh0HW+2xwIkW8DtKzz0z?=
 =?us-ascii?Q?X8vnaY79gNGS1HChz8Anb00RI0uLg30Lby8FhZLkWy77zwVhKzhVZu7HABJj?=
 =?us-ascii?Q?DQTe6m6jRgpzZNQ3nZV5198UKgFG4YawkLp4ClTECD3uJF0CnAFnZqRdPnkl?=
 =?us-ascii?Q?VPSJM+a5VvfWViFZ5zgLgFxhgey0F0E0EAoPW0NvEUuJwR+cCZpEkHojoBj3?=
 =?us-ascii?Q?EcmdZCdR85cILipGdgFChuFMovY6AtbM6tEe+xogDQyWSBoI266LjLiODo5p?=
 =?us-ascii?Q?wquF6STUO3EasWK0UyBfELwcQu+9e5djolG1du2N8emuA/2COXKW45BjTSAv?=
 =?us-ascii?Q?iZT6qKvQbccfRnMCpULiooSKepCFMETvrpb83H6QBkXwUTxFaZcfXKZ+wYuq?=
 =?us-ascii?Q?ktym7d0BN6LV8KTTvix1JJyoKlDMzjonCQ7MhM2TsUR6hIq7mMVcMXfcFx6L?=
 =?us-ascii?Q?vwfzOPS6s46U76jHff8sLDTZD76lb0+fIO9bArEeo4eeY2Y8eVF7us5NAeyK?=
 =?us-ascii?Q?kA5JoUKygl3g88SYOI0qFMDrJ4/rnvMR8+y6sPuvVmP3Ngcfnkh6VM3xZ8Ne?=
 =?us-ascii?Q?T5TXATMVENuDSLxNKGYkyt+zA9T+6q78Xs05Gz7tZXVg/8Dee/J7XhC/T2i6?=
 =?us-ascii?Q?r8W3IPKawiDxd9zT1UFqPWGh0aNEjvYIdgnVeIkySyxl8eghmCP9TJIiwBC0?=
 =?us-ascii?Q?v3o2enp6XwVAH3NtdRwd8OSABdrMzbt00HaqqqLeLljyBaijXyr0lYCAJoQd?=
 =?us-ascii?Q?lhk3YXWtaM9V40soZWztUJjq18u4h4JQOkd0zhTh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fba8bf7-bf1d-44eb-f231-08dbbf60a0e6
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3006.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 13:49:54.1482
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cNrcYuGoCdvaPYRVICxHTuY9rV0NbwxJ4i1+9zNu5OgqHLD95DP9YRns9w7jSvSHZbqD4zZn73F10m3zE7z2QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5505
X-OriginatorOrg: intel.com

tree:   https://github.com/esmil/linux visionfive
head:   c727f594ac6d4d500eed929fe3bb1d6d90880662
commit: 15231f4e8cf50e957fc6e63586d34329f450ddcd [20/46] dt-bindings: reset: Add starfive,jh7100-audrst bindings
:::::: branch date: 2 days ago
:::::: commit date: 6 days ago
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230927/202309270130.Rq2jLCUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309270130.Rq2jLCUA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/reset/starfive,jh7100-audrst.yaml: title: 'StarFive JH7100 SoC Audio Reset Controller Device Tree Bindings' should not be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
   	hint: Everything is a binding/schema, no need to say it. Describe what hardware the binding is for.
   	from schema $id: http://devicetree.org/meta-schemas/base.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

