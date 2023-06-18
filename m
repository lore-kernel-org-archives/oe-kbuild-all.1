Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE16A21
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Jun 2023 06:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687070110; x=1718606110;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=UrYbLViMTJHJLlcDaoZ/cwTqwRV5g0cT3B3VpYDC130=;
  b=c3G+Nq+GwIRlEkKiPK+Gp7Ex30IX+843lcP+0kxf4VH8gjBtbQ6a/5lA
   J6HqJBh4/m10G08SakWkLE5yDg5JKm2IcXh9FSeZt2zf5fSuj41wgmdpo
   5gZ5yIvZpzqCUjrUMkXqHGKWsb3+Gtc+rRNTjFyj/DYL7eXJ2pjb9rDeb
   wTC5QYYPUi4Tkj+9sVx7iLBXWTJmWlxFHHcwHEDSA1DywtXMI0eOEbKoS
   cf77dqMMS26rYH0YgdXtbPxYx6vT8pIoKD225ysL2NMRYi7uyEFKRMJqg
   HfXfetoDMTABYtjJ2y4kvmRizy/cbVAPWHXQyOvkpArN2ZUAy0kEk0IS7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="359464163"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="359464163"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 23:35:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="857861255"
X-IronPort-AV: E=Sophos;i="6.00,252,1681196400"; 
   d="scan'208";a="857861255"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2023 23:35:10 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 17 Jun 2023 23:35:09 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sat, 17 Jun 2023 23:35:09 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sat, 17 Jun 2023 23:35:09 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.48) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sat, 17 Jun 2023 23:35:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLwc7bndocmyC54XpP99kNqXEnRqopCmUNXr27l6cTV0bUkTAL64YdrI55dxyuj/XXGw5hoQ51gQmT9wZbllyZovK9j2Ku/IHl1u6WTPjV6jpLF0YxsdZZ8hX69gQsfemXDkt1eDHQ066RZ5Qe1Yn4xl9PYzt/OHUcW99F6WlIAJxFpokQSV40EHy4M4Thk4lRm+2MBZowWBsaNabQrTfoI8ktCfn2DpXRJtg1C3Ts6ymoN2jE2L6ChtpQAmv6NjRphl+qc0jOPBA7qiOhtc85DZlYmM5QbNXMwKS2ts7UoM2YWIMCS7KcVJ/DGTuobSOO3JW7Bg5R8M//uui2LvvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=619gU/r3CC7FyiGz+3d4ucLMYSis0GjsJSDBjZfC6Ao=;
 b=X1h4UVHWqDBAO3jo35aNEU8f1mHTxD7KEhkNTVMKGI5C4yWXPPwol5CI/lKjl1v6pprtZA2Ki+NcbiRhXX5h3KljNXEqU1dYXFSz626ABsXg7pdLqu3Ha/gwl2PP5aGCqqG6Sa1PElALjEFjIgDz9vLXaJUg00DqziLS7IvM3dnR0vKgIE0MTEdihkey5PjOJoJmhTEgJ5/86v3NNI+s/f96TZER31SDFU5TN37CPqKsNg7DIHuFwD+rVeMatWQs4+KgqnG2wMUkbKwkNqfiIJFAWWteNvUnUzdKp3pmQHZZgw3EDG7zSThbhV2fwWcsN71oV7c8HiHXbuktPA243w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
 by SA2PR11MB4922.namprd11.prod.outlook.com (2603:10b6:806:111::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.29; Sun, 18 Jun
 2023 06:35:07 +0000
Received: from BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::d549:ec18:45ca:2786]) by BL0PR11MB2995.namprd11.prod.outlook.com
 ([fe80::d549:ec18:45ca:2786%5]) with mapi id 15.20.6500.031; Sun, 18 Jun 2023
 06:35:07 +0000
Date: Sun, 18 Jun 2023 14:34:57 +0800
From: Philip Li <philip.li@intel.com>
To: kernel test robot <lkp@intel.com>
CC: Hector Martin <marcan@marcan.st>, <oe-kbuild-all@lists.linux.dev>
Subject: Re: [asahilinux:bits/210-gpu 227/227] /bin/bash: line 1: rustc:
 command not found
Message-ID: <ZI6lkdZQAf9gKFs2@rli9-mobl>
References: <202306180144.FTYHPLJn-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <202306180144.FTYHPLJn-lkp@intel.com>
X-ClientProxiedBy: SG2PR04CA0157.apcprd04.prod.outlook.com (2603:1096:4::19)
 To BL0PR11MB2995.namprd11.prod.outlook.com (2603:10b6:208:7a::28)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR11MB2995:EE_|SA2PR11MB4922:EE_
X-MS-Office365-Filtering-Correlation-Id: dfa0930e-85eb-4e4e-ed9f-08db6fc6279b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x1P5lexXtVrEwi4w8AAx3qQJUVGd7ASwrUc8Ixkwtc92Q+CPHwOm7xDlsIy0FgEaLa7tOX41IJ/F3WGNWDQ1IQQATixN5e2bE422dbW1ebz2fH+DMvXL/HPYJnIIrZNDHDoDcycfMub1xBkuo3xzNgiFLPiDB5jAMWQblxYxvk6KGd9REEzPWNRA2yByhYJCYPs1jXtiJA/E0cEeEM5psRvvONHF7nL9uYyiNzNSCRR60/cb/XO9JoaQMlUPG/nncevtf2R+Bs1WnPBNKsC81qAVDWke8qo18YFnzP6H09kePPgoTGHPUx+ZG6aa11QtwXJjJi6Ufjh1Qoupgf7r76GV6riyntQfDyACTOT+1bc4+g3to4JKrBoTu54FZ9CraQp1DgreOBpWVrrj+Su1m2Bh9DkJTU/VEU6NzHj2b72K7+RcNBnJ/FAiqd9k+HPZhZhivDTsIOrDka4jpLF0g/gKkuwRb5znQyhejeJ6VYpi00TNP3U+UQVBDyYW72cK/KIncqfMpgLEG21alfBTFhOjXd1djdrKmnyUr+18M6jJlCDvqUetWqjpy0bPApTPR0QNyz3Vb/IJeOTXwNvBtA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB2995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(7916004)(346002)(396003)(376002)(39860400002)(136003)(366004)(451199021)(9686003)(6512007)(6506007)(26005)(186003)(966005)(6486002)(6666004)(478600001)(83380400001)(82960400001)(6636002)(4326008)(66946007)(66556008)(66476007)(6862004)(8676002)(8936002)(5660300002)(44832011)(33716001)(2906002)(316002)(38100700002)(41300700001)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7vLXsOEqtSUu0hFCosLsPXioQ2n5DJPbjCPozOqG7YmIdpPtmPB0SpJIYxPU?=
 =?us-ascii?Q?pzKg2Dea8K/rkCy57yXXXD6nyxGevcp4h0M4Ydxfm4++B4a/X5UMUM+QIDce?=
 =?us-ascii?Q?rIlePpwBgEoG8EThjxnWbPL9IwpuvnbxC+vYzSoiuwGlaa1jq1UxnTYaH2Hn?=
 =?us-ascii?Q?SalmFq0q1GPgsI7lTCcvhL7qka05Yy3hhYyTHeD9YWS/A1KBQO8bsr+dw7ep?=
 =?us-ascii?Q?gwmXF7vnAq25CcPuJ83qa7zgxN4nyKDtV3DTGSbbTUznvwNbszKQpsYQHVDt?=
 =?us-ascii?Q?2WgKyoezm67FvP+S2v/RfwTvsejRRWZQQeydhqztV6vCbUi3sRKHE2n6ceOV?=
 =?us-ascii?Q?2N8aUKdtNyoqwhp0vcz1E+2/46XHzLbvkZmtPnh8B7M+4kSXy0Qol1yUPTb0?=
 =?us-ascii?Q?pYJa46E1pXsmMeuSDbd6RzzNlu35uAI9Al27FMrr7ztk68mvx4Bdvuw5x5ek?=
 =?us-ascii?Q?swD7A75mheO5875eNxRU/GJ47p5crIfV7xFsaW5VfygPgQmLAZbCkhDinpZN?=
 =?us-ascii?Q?AaAVrUAG0LuiBY9heROfzZbfzi4Mh93usaLAdENT0J7T+xdd7XYbrpX53oNc?=
 =?us-ascii?Q?VPpgPOOICPupAIa+5R7S5iQLBmT7fbxPT/GxptORV3ysRSJ4avKZlzX9ftbh?=
 =?us-ascii?Q?19ZWjvmAditc3rg1PQruv2XgWdYTyS/802hhZYKNu65ojFMJlxPqphT72ODY?=
 =?us-ascii?Q?Cf6xqiUbRq7KlP4yocWGACDgiNpWqLzdK6qE3klbiXR3Eygo4IuiDe+a0XmC?=
 =?us-ascii?Q?/HEnghnTFVPbLe5glY2t03TD9zLIYVAuqpi1hcgdmVQCA3pRoczbDOP67ljk?=
 =?us-ascii?Q?XQc3TjsAovjnTNVQUVvi0XIZ07I/6Y0COaLLvJIezI0uaW0s5IBrlqUNM3eZ?=
 =?us-ascii?Q?rlPymGG0Xc8J8amy8mHj5OqSYNQi+p/ZGnGVqK2hRz4bV+tCZ08JoydEEUeA?=
 =?us-ascii?Q?+Mb5zL/bngH9v7OxvY9Un6/Wj3+wC3rnTsr6OPHFlXtL618N65G+hYzFQURx?=
 =?us-ascii?Q?9f95IEPKXTJvdjYAlhzYLiMUiSQ4eeNX+LEh+dAXdYcLj5v7LC/dXpHLXZvS?=
 =?us-ascii?Q?4XXzaXyVlvBgjQNvysGhZScPZY9p64BVWoA4MtwQXgh4+SQq5DaP5WaWNkkP?=
 =?us-ascii?Q?vXOEvht1Jf0fZ3GrQrlyLh7kNop+zLEFe2Y3cC5WdnujNJIStdaY990ct9zP?=
 =?us-ascii?Q?RrIv9b2pTAtHBfwNfQLt13q932TxvyqiUoQE8Mu3P7rXmCo1CnsPJGfWtLRI?=
 =?us-ascii?Q?X6CwhkLNYXXutFtV0sp7ppYzh+Ryoes136f/fJIQxC99KGxOzR38t93dyOx3?=
 =?us-ascii?Q?IAgr6G+Db9RD6VTu0ODcOp8nd/LYyu0DtPuFj9r5KMgl9U4yQGKEbskUs9kK?=
 =?us-ascii?Q?ORku9rr703Osqfpno02ofMpYVOYrCkFwI9dN4DhgbH8OpxM1u6EQ/9kVNEqA?=
 =?us-ascii?Q?dUPVacBMzSrtmpP2PTcDi9i+k1kC79DMQA5E2rgtpPP4yb0iOadSwdSWiz9f?=
 =?us-ascii?Q?8H7Hc8OuX52GnoSnL5qaoxRvw50EZHrq0tqeHaBOh99nLnK+hIgaOYoJdPd8?=
 =?us-ascii?Q?wj1YALE7vAR8DEXUd36FQpFdKz+EYqg+QMDar8uH?=
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa0930e-85eb-4e4e-ed9f-08db6fc6279b
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB2995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2023 06:35:06.5065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: trQcHKgaUFcp3O1VsskVcfdF9AXOXHkeqtmqueCTD+QwcnRdTL2uKuckJYa0ohfQsKMcjdyhQTukfMuK1hoc3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4922
X-OriginatorOrg: intel.com

On Sun, Jun 18, 2023 at 01:08:13AM +0800, kernel test robot wrote:
> tree:   https://github.com/AsahiLinux/linux bits/210-gpu
> head:   496a1b061691f01602aa63d2a8027cf3020d4bb8
> commit: 496a1b061691f01602aa63d2a8027cf3020d4bb8 [227/227] rust: 1.70 compat hack
> config: sparc64-randconfig-r036-20230617 (https://download.01.org/0day-ci/archive/20230618/202306180144.FTYHPLJn-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 12.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180144.FTYHPLJn-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202306180144.FTYHPLJn-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
> >> /bin/bash: line 1: rustc: command not found
>    expr: syntax error: unexpected argument '1.69.0'

Kindly ignore this report, it's bug in bot side. Sorry for the false positive.

> 
> -- 
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 
