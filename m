Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07B9115D1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jul 2023 01:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689730299; x=1721266299;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Aju92KGzIxWK60KtNdMmpoDLVu1XQwssYr2lRIlJheQ=;
  b=PaNI6jMipX1++RY/ZAPf+2q/KzqtTVQoR9nOysMWFLOhrK244SpWXMWi
   km0fqN2NVhCj8+k57E21nFOVwndJWUwHXVZaKdYUbY/MRmjweYurDQb6E
   +mTmbbJBzkhwHfVOXyuHOmv7s9mpbnMygULmuMZuPyR8AekCnR+zapbAk
   Y3PzmQMDwxToyItV+ipoHgfV+Z8737lBB6X1z5qW85UedtO2LpZ2zgo2z
   hkISf635HTolLLqJrgpQs6BymVIN4K24Ky54HHB5vlyq30ToGgkVdCE8O
   LsafVoPVtewLzMOvwxJwYIXCOsoba63gma2chlpcpsq/hNCL46u4vsBW5
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="430113248"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="430113248"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 18:31:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="717817857"
X-IronPort-AV: E=Sophos;i="6.01,215,1684825200"; 
   d="scan'208";a="717817857"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga007.jf.intel.com with ESMTP; 18 Jul 2023 18:31:38 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 18:31:37 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Tue, 18 Jul 2023 18:31:37 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Tue, 18 Jul 2023 18:31:37 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Tue, 18 Jul 2023 18:31:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4GpBzPA60R1Y2m5xas9+KeSFiTD23GPXwI212x7kd+gohBHhCV2hFmfm/bP+p/j58VfG+ghG6xIqgv6uKn0Q3uA9+P7l47RCzR49R+nhxwsp5h/yztg+oQ6uPgmaJgGURFX/2H+5J5nK5eUoVXHmcXHjh7uvWhF6iQwrmJH3gxzyb87j3WH+XefK536BMGwXDrdS6TelWkoh8ni1Ryc2rDxmssOBRt892uSTvgXE9rz10xrKuqbPdTTChXvj4zm4RngJpEHvteq2UtEElgRtgSXUJ6OeQewsi7HyPthlkEZUqi1rTdX8appofLy3lwg4ZRGlqdIeKrOR35f1FCIyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tVQUpMS4qCXvWJa1Q4BEYp0MPZXuPyPSZUNl9+8AxeQ=;
 b=n5oS04F41C++hSCh6qM6TgH7Cj7F/FANqn7KZENbjEbU3jGgBsF+OeAwlDLCJmBm2cEtx8GETwPVGI/3y1G1JB59WIy51z59bkndevz/8NnSFVjcBnt4BKqzWkV3/Ws0lKTsV/1hv1UJe3oV+oojD13Xfx08ldeamJE/HlH5Zw4UnrGQ4InkGLwfafb7oLxwT3KYyA8o2oFbGRCDzNEwH4Zjqqn9Px5mr602hI3NnntrOh0yXEeAEhXBssKZ/CNkFFhfNC37dI16wLvL3UeHWrzuZKPpvGCkhUicz1mwWUxNl1DGDYAjVYzDuP4htOAeKqPDlx8UBUwBgwtU4cMmHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by BL1PR11MB5285.namprd11.prod.outlook.com (2603:10b6:208:309::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Wed, 19 Jul
 2023 01:31:35 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::4a1d:c5ed:d344:4043]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::4a1d:c5ed:d344:4043%4]) with mapi id 15.20.6588.031; Wed, 19 Jul 2023
 01:31:35 +0000
Date: Wed, 19 Jul 2023 09:31:26 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Richard Weinberger <richard@nod.at>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [rw-misc:embedded_go_prog 1/1] /bin/bash: line 1: go: command
 not found
Message-ID: <ZLc87pVzmxZeNzGW@rli9-mobl>
References: <202307180806.prgq1hPx-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202307180806.prgq1hPx-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|BL1PR11MB5285:EE_
X-MS-Office365-Filtering-Correlation-Id: 14c74795-70ef-4d66-c205-08db87f7e41d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CZPuIi4PNVI6E9GLYGRApWhSWLCPDyIchmTN70QfZOFpDwhAQdkwlReGo68i0ecLWGy47xxKyiyfejjWXFiCcyOldzzpGycf6shh0/BVlBgGxZSnsr3E270W+Bw3nRllU4kS/G5r5hzrEmtpVbGe4VLZrX3vIHRD98uPH/5SAXgYcwBNV+jUf05Fabo8hL99iu9QScIT+jY2ry/tIfycVZakU5xVvlup/elsGDp1PWQm03nf01mCbKijbI7gqlJISOGkdPoTkLucNZhulurRUv+BNr/WwNrU5q/Gp2LYFWZhuQOuZ9dWKvZ3zYdxDOf9ddla+hkbduhS6HBVO5PYxmOKu/8ZqSAqlfCUwEL0eL1axUkv2j66pAgEi+3T1ZEuGeQKPVvmvYN8kw7KIUgdHvWY3qpPhhLyXQughyAASUD2zXMylMjtJoq71NjCLF04dcuvTGsTB2Q+UxVxtcIET3kXOT+QHsHa8mEKwqsmfknG7JvPjGr/ChV0RJyyghsMnlsWAAew/3B+JLj7d9P2rHwlVZvrNvQdiuivT/bGbOreMzsIS9QG6R/7ZdPIYKyMJqFqVIvqg82+c8jp7Ok7xg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(346002)(39860400002)(376002)(366004)(136003)(396003)(451199021)(6666004)(478600001)(6486002)(83380400001)(86362001)(2906002)(33716001)(26005)(6506007)(186003)(966005)(9686003)(6512007)(44832011)(38100700002)(82960400001)(66946007)(66556008)(6636002)(4326008)(316002)(41300700001)(66476007)(8936002)(8676002)(6862004)(5660300002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fnkEK6j8gkKF9ayLFcc9em7xnZ5k0yjOdhKZBdL4x7ZkPGojsc7avUnDZdCK?=
 =?us-ascii?Q?kzqSLv+YShZrUfUbkexiD21N6juXifEpybFD/jafQE/xXsZO/5D9Ds5yajF/?=
 =?us-ascii?Q?X3pCQEWtH1TceeldooMd5uRjG4xLqydHNNu9IK/dr75ObExUqKmVre28f09I?=
 =?us-ascii?Q?KlWxkNxcdnF50m2QVyiyd/w3donyNzlqRCu+rHlPYxj5JFlFs9H3vD75bFfk?=
 =?us-ascii?Q?3Od/4skNBuOcLsLp0riW3J22uvRETV1vKmlXHnZcSurqPVKH4ARbsIcagA/z?=
 =?us-ascii?Q?d9bHRH8yTT8pmfB1gWncUm/zGS/7GeXuni0V0/m8cwk0pFK9JMKSfn178A8f?=
 =?us-ascii?Q?ifKC/CMnsKt9iapagwo+Am4MSgseyw9g3ynKn4AWaxQjQ6+3FrkRLUxu5n6N?=
 =?us-ascii?Q?jgjqWLWjOBPZv4fQHpHEfCSNygofRqyQa23gn7++tcR7tjmtaYjQ49hUXnR0?=
 =?us-ascii?Q?bRxySWmWbtmijoAGjn1XSN2eoan900i/AfbF+gBdxvzU2c8x7sEWFS5XLReI?=
 =?us-ascii?Q?9XXkSKd8sjew5bjJy0X76wJbyHMEQSFcr15ql1N1jdmcLG73QY7qcZHY6MyO?=
 =?us-ascii?Q?fckH13mflpUwbazxRkOLiJWVA5neAoLblk+6FCcVwhJ+kyRrqaEyvtbeg8tH?=
 =?us-ascii?Q?2evPZ9O6IL9IpdwvaO+i1aph73ZQcGj2MxBfCBBmBbzhIOG1BknhW1gdW+iN?=
 =?us-ascii?Q?9gFTTuEEQ8tSG6ws3nrOW9Y4/P40kHJKrzlAL+UEHLkR9AoGZgYunt+SeHrI?=
 =?us-ascii?Q?YHlAl+dAi2OFhmAMHJk82HQdeIjMavxchkTpn2hu0YspXSY0lziy9QXxNagb?=
 =?us-ascii?Q?TBgpd1gL1zdhPe9peNbvHN7ObbM2LhJPLGn3R1G2ah2EWgU4tJvT/YEpyNy4?=
 =?us-ascii?Q?WsC+nHcn3MU6EttDHQOe2dS2wwcCqFiavnUdYphsUO6MKG6Oc15Cpds1BEIW?=
 =?us-ascii?Q?a418XcMVnLQji7qSfjSQ3XSck40gtlarzpYB13jHCZeRr0g0ys4J3m/ci92a?=
 =?us-ascii?Q?RyOvpf1WHQZYB8SnoBODiUlSPwUvsS9grHEWzBz+xMdwnUlLypfcjSw9GJ0r?=
 =?us-ascii?Q?Y2gmVmbmd32ikIC6L8+q7YPuMRUv64LI1xNoH4XujSWDXjmdEuxZXa+HVvQz?=
 =?us-ascii?Q?yAlbtGwO21fpCUVt/bg3rfizW+j+y/QHs/xGlnta6Tvqldp7cKiWopZ/1UEU?=
 =?us-ascii?Q?rPN3mefnxBNAebtD1Q2z8TE1SrZ6mrI+lQ3LCegVYoZ1Jy6X+/ppW+uyjdQE?=
 =?us-ascii?Q?OBpqVENX3vNwPBaJhpVLGWzvSHQ69oLAc5tTt5voemMF0iatknhnOHk/ZE47?=
 =?us-ascii?Q?H4+lVebNe6hhyjUN2QvC8l/v8NHqSDHh1+jOHPEDeA62C8WUD6H2mYHdy7GF?=
 =?us-ascii?Q?QqcudMU4M66tZ7oIpDE+ewCNCFbM29Z3W4hb9R+W/LqCAHB8Gw9NgGHQ0h3M?=
 =?us-ascii?Q?EiLMiJ3lGJi2V1eGoJI0Nqcy/BY4KMFFJiNMpNNZEhe352uzR9CQaenHo/R8?=
 =?us-ascii?Q?RQ54OZ7psdIXEjBZW1HVkwZyLBxHZfc+AolkU2r3F+2Na4QyPXAVMfOwa4cJ?=
 =?us-ascii?Q?dopDFgHeSIbAhV1rZZp6FWG4HmLo7p+NIZN+U/k2?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 14c74795-70ef-4d66-c205-08db87f7e41d
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2023 01:31:35.8119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNu8TsSjDpynel/z0Jo48buXJE+qLLRTB7fKbSSJeFTH/o9hH7oqL9Nx1EAB+CpGPNdChOT0loslJzQqizgRjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5285
X-OriginatorOrg: intel.com

On Tue, Jul 18, 2023 at 08:58:56AM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rw/misc.git embedded_go_prog
> head:   58a51666e0ed2b23253048b0616ee5879361cc4a
> commit: 58a51666e0ed2b23253048b0616ee5879361cc4a [1/1] misc: Add demo driver for user mode driver usage
> config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20230718/202307180806.prgq1hPx-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230718/202307180806.prgq1hPx-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202307180806.prgq1hPx-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> /bin/bash: line 1: go: command not found

Hi Richard, kindly ignore this report, it's our environment problem.

> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
