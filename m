Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A648E63E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 09:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683710930; x=1715246930;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lRH3jmkDRBAhki64SNDYkEUr6yJN8Vh51n8dJv+zIEw=;
  b=QaYoPGjywhoVvgGY2rum6ebKtyEOtuKNV8yenH7HzEC/Yu6M6L22I+/V
   cDY2Y4tdbM5KAZGV4s9bXjGUPmJDA2UDNyQjkUsGsXR/7H3cht8LaPIGn
   2oeKwnxoC8MfRjYrGfZQWWOHQgRVCvdbIe92jSpqK3m26HHU7IVQqafMh
   J/xBvuQR+dKZGMoQwdmmKCR37FlKAL4IRFNWovgGNeoalubtLolCjN5Gi
   NPeB+bXPY+HbQ7vENzRepYlEDc0dnjrK51gWan5edvmhbG4pxifrlcarB
   rX/HQTT5szcQ9awBuKZA4PDDKiHRpM4a6N+XjRtbZNNI764UoH538powl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="413464466"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="413464466"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2023 02:28:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="764222721"
X-IronPort-AV: E=Sophos;i="5.99,264,1677571200"; 
   d="scan'208";a="764222721"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 10 May 2023 02:28:39 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 02:28:39 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 10 May 2023 02:28:39 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 10 May 2023 02:28:39 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.171)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 10 May 2023 02:28:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SfowmF4RedfU5eovJKMdRi69vV5MqKk9cZVkjEBwRxgyYVGjJ1VoUf4+wZOJc8SEsy0SG0HuE4HnCX+VGdiqf7Vy7Kni295poFrRT8At0fIL/yyGzgb8W0yElTU3rtN52ohav2FGGNDJZ9tPh1Ha/EfM/HP/xeYs9nBBSusU8QSYNuB6iPZQKjAdjj3xArbr7w4twtX9WTflUg8Fgm7AkMv3RFgDw3AcsIz+F92LOPdRnLJVGLEPbmvEwhPwPHxmyaBcyrr1zL1xkNk2X3P8MwTOVVRf79+t1nkCwCjY3YgUPbaONDIrf8hqmYb8hGk4mCbQBQ7H/XjpZboUY4hiRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yY7BgHkVOMPHoTJ2fvUTBuCp6ApNDRr71c3v/jefPD4=;
 b=Z4R690vlOySWoyK7MTqc3XnSUc2DYXHMmqEHIDYSAOaXR1f4BrQ2hGIBnO3ZYOYLN6HGgfy1RwMCWk7eeACjVpp8m62jsweEq12Y+YskbI14x/MLkNSegyKKXEfk+kpV2NjNqVA42or6e7ea/73c5SsW4PMljBx1xpRCzGifLYen2hqxK/OkYAdhQb7BfODvOpaJOsHwI1WtN7E0TEI5F7iWpOHGJ+cGiUtycgGwe03FbpkRrx92dXwVRB2nDb0wDzedk6BR4juv/kEGtT+gALTDv9enreQ+jfuzqbWUgF4LLmAkBU1ZhWJWHqbf4zYpkN5SSlRXaDkpq1MmThf4dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA0PR11MB7752.namprd11.prod.outlook.com (2603:10b6:208:442::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.32; Wed, 10 May
 2023 09:28:36 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::b14b:5c9c:fa0e:8e7c%7]) with mapi id 15.20.6363.033; Wed, 10 May 2023
 09:28:36 +0000
Date: Wed, 10 May 2023 17:25:17 +0800
From: kernel test robot <yujie.liu@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [djwong-xfs:xfile-page-caching 209/302] fs/xfs/scrub/trace.c:
 xfs_btree_mem.h is included more than once.
Message-ID: <202305070027.YOkXDoJP-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0204.apcprd04.prod.outlook.com
 (2603:1096:4:187::16) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|IA0PR11MB7752:EE_
X-MS-Office365-Filtering-Correlation-Id: 45e954e9-2794-493a-856e-08db5138ee5a
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: B4l3RKEeOPsQrXi6ZDqVXqJUBKH8yQ7lzr0rbgGVCmI+louGp7FVUGZgYiNo56jPAcs5Bo3K9lbN8VQzgkLSHVgbHPEDnMwut7+gWXNi9Vp09PIsM2rm73X0YFJAY+fmzY45w+rNYdObsqDF9tL6Y3/JkpHI0x2rdJtu26asq2yMGcYr4VR7z1ymlrZZk71QL8jVgt4lZeRsjWhHYIa/vVGDkfsKmXaV6mGdTWnfzgRiKAT+26WsjZoYS+Z0cdSQPJC+rOQsa8gjaFuOEZPe2E6hduR6a2O+khloaz21nOGXsdNHj9DAmAUfEv4vu4Y0GBrT7hZifln8y1KUb4LCPyz4CAQgOvZOsVdcNJMcvOkp5Siefe3oqImF625P/Fun1AHqDrxYPTiwD7fw9yDxbQKFqnHG2d2xKwUNOku62708x0DK1/7jstP5B0yuDQLcac1e3zpbhNHm3bY0ql598LD0kTvVIP9H3hzOGrXXY8Sz9brMIdYxMvDtYUyMvBtWlmV25KLGbDdpZMl6MPVhCd+4sXkdSUcY9r5oLwYGx11EbtNs7uAQ9W0vfPpgcEXSxjU2YsDFdsScapUixErIRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(4001150100001)(4326008)(2906002)(8936002)(478600001)(316002)(8676002)(66556008)(5660300002)(6916009)(66476007)(41300700001)(6666004)(66946007)(6486002)(966005)(1076003)(6512007)(6506007)(26005)(186003)(82960400001)(83380400001)(36756003)(2616005)(38100700002)(86362001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fDjXsjBIiOMflpctyVv1HPmbY6LqLciGMwx5mp5g9VDF/HhdsxaxCOwSVYSo?=
 =?us-ascii?Q?raJm0OLUxTXvTFuj+X4iqs4qCmYLhIvrRtKPuT4dgSroU8Rtmj4MWjXE7CzD?=
 =?us-ascii?Q?4f5cmEAmQXz4Fl45RdndJMuo6tI8/fULZS5aheuMIVZc7Fw+aE9oa3w9x2zh?=
 =?us-ascii?Q?gkFw/o6/K9JZ0XITTprfY6ppV41Sm+hFuoWHkQq+JAqkR2xDt6iPjw+ax1t1?=
 =?us-ascii?Q?zDgZn6Y3rFdrZPGKT38kjkJdtsSipslH8CHB8GWbuzNypc88Vze1R3eodI5c?=
 =?us-ascii?Q?1SUthXoVgld1yHvzgDsfEpquI1iFSc4ACVbF7LmobWaU2pp5Sbx99k7bcNoj?=
 =?us-ascii?Q?281bozaSJJcoIwHyBl1wAlG+Il0PPmjxvCSDOC6iZ/SwzbwYTujlsHhPS2Bu?=
 =?us-ascii?Q?6bVMR3yUUp3Eq3cYp2/aZa5Vb797nD4SUG1y4xAGTMdEwQ5lvd4RZxg4XcD4?=
 =?us-ascii?Q?Z4E3XGlD0FIl4QlVcZlxb81d/XMikOiJqzJG3VrAIO4oCX7rHzj0ReTQk62V?=
 =?us-ascii?Q?yt8OFGvEeLlm+DQbE9zKoCiyr33CxRPpER6HzmRGbiT3HQzgvBP7qW3RrtMT?=
 =?us-ascii?Q?2EOCRA0nOuWEUWsXEwpMLpWPd6Rxbg/rkj/ITaHzHN1ON4TaTChm/v8cMwB7?=
 =?us-ascii?Q?X0BX7SMjBF9098DD7rHRwU+BzdSYhL290rO5tcafVS6zN/EDZbqPYo9TQw9p?=
 =?us-ascii?Q?bNjJ0n0eE/1W87/kleMJ14wPf7YplgPg/sGtLsDDF4azYUq8KSa6QBvRuSul?=
 =?us-ascii?Q?Yyfp/4UfwjvchRJ9BskgAU9qrbXzm/tWKnfAOYMfwkUYK1dcTrp3IwoFaBZv?=
 =?us-ascii?Q?jKyZV3xamUc06hG1Ccp7fRV5JHe/ZghhGevLvK4MCwC87DDZkiMJMrx520Oe?=
 =?us-ascii?Q?17yRqurmGk30/3kUcpPSsOfPEWknvkvixQlD2Mxp0KuhZSwr7Z1keJjOXFec?=
 =?us-ascii?Q?j+dT5B89MgFefyOUzzkWpk+bcvp45erIj0/uih0q/OUYvtnD1PXxC+hnOrpX?=
 =?us-ascii?Q?KEBpgvZY4R85/pHTrXffap8dokw4cGy2qHxIPC3T/X/MAb3lkvQT3xVr2IJg?=
 =?us-ascii?Q?ZU68KdhRBTfonI9v5KxE+JO9qpiKu//Bz80DCVTm9RPH7EOXG8heXiq9D2dG?=
 =?us-ascii?Q?OF0H5crQsu+ucgsGRyn/+2LCiWJJGJD8su0rjUXnM8LeVy5XBRqRlIlHcM7I?=
 =?us-ascii?Q?RcF8UIfUHUtfcmfNM5e474rW6B4HyU5O5CK3nPv7uexGPcmmREvzrr8Rrxu0?=
 =?us-ascii?Q?Xwlm0WFVn/+SAHlo4l5bCpL2H1OyuurOUsy006L9jJ0m+khDh/jIn+x3ImL3?=
 =?us-ascii?Q?GtukbIu3Nn9vy0k364IE2/n3U0N0xao6zVBd96qQJodCKGKyFRqFKvnO2pQw?=
 =?us-ascii?Q?BMDcCsRZh+on5hWBTlQvB2baDUSi431r8vflzsOjFtOWWfaGBO9HOUOAA9/8?=
 =?us-ascii?Q?YDNEGGuDOIi0uTeCoywE0QoUEHgzp1GXbP6Q8iW0kmPSF0a+y7b47v0Duk1g?=
 =?us-ascii?Q?H1CXZ+DYzl8l/Z1ObDoQcCzfF4ceHwkErwhwGXSupXmNo58j7Gjgfi4mJ2Be?=
 =?us-ascii?Q?fjGLBLVj1PKGTi23wfQbNv57VjJk4kgilwFYYmRU?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 45e954e9-2794-493a-856e-08db5138ee5a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2023 09:28:36.3541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: L/sl2D3NeSXb/duH0GOBOI4SpkJ5rrK+bptdZCQG1pfLKfkP8hKIc27O4x7RfkNcUmm9VMHNOT5uV3yyEDkl1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7752
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git xfile-page-caching
head:   af24d980911deeeb7a23d49bd860e3364909822a
commit: 5c930b8dc64af51ca17e93e10e5cc79525c1847f [209/302] xfs: connect in-memory btrees to xfiles
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/r/202305070027.YOkXDoJP-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/scrub/trace.c: xfs_btree_mem.h is included more than once.


36fd6e863cb73 (Darrick J. Wong 2017-10-17 21:37:34 -0700 14) #include "xfs_btree.h"
5c930b8dc64af (Darrick J. Wong 2023-03-06 19:53:44 -0800@15) #include "xfs_btree_mem.h"
50f02fe3338d3 (Dave Chinner    2021-06-02 10:48:24 +1000 16) #include "xfs_ag.h"
2f8ef58242730 (Darrick J. Wong 2023-03-06 19:53:22 -0800 17) #include "xfs_quota_defs.h"
6b287e16d4918 (Darrick J. Wong 2023-03-06 19:53:29 -0800 18) #include "xfs_dir2.h"
5c930b8dc64af (Darrick J. Wong 2023-03-06 19:53:44 -0800 19) #include "xfs_da_format.h"
5c930b8dc64af (Darrick J. Wong 2023-03-06 19:53:44 -0800@20) #include "xfs_btree_mem.h"
036daad2a8bb5 (Darrick J. Wong 2023-03-06 19:53:47 -0800 21) #include "xfs_rmap.h"
aa5ce95410be0 (Darrick J. Wong 2023-03-06 19:53:03 -0800 22) #include "scrub/scrub.h"


-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

