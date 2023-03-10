Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD7F1C96A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Mar 2023 09:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678439821; x=1709975821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uc4P3JzsrWV43ZpfgeJmhYoqz6MwbNzVrJ2aR3ikCZ4=;
  b=Bz372eU34Gpopi3z2psljV4R4Q+114g0oicWBetWRVJewtSiHrUGn5LA
   cl/uGzN20BrK7rI8s7L5wCRf7RNYEubLAAz+GEv9dzdAd/T7mJxB6Ai0I
   JeKOFonu33mKICbPGGsxFdCUhQQ9jHjqG1sMXqBIaB2G9Qo4PqwtXJj1S
   LhBQFM8jUoj5QcxVvJra5biaqZrg8oeERiprZH0kqg5GNqg90Rbx1jlLU
   rSglqaMqmJt+PCzd8CNDNZCMqFYTfigg8CX/ZicxN0eHSyeBrsJiIFp40
   bdyY51wy0NUV26AHHMNjXuzcFkE6Ka0a9bVoCoF4rL44rPHYCSitX4FBq
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="316339208"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="316339208"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 01:17:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="707945912"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; 
   d="scan'208";a="707945912"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga008.jf.intel.com with ESMTP; 10 Mar 2023 01:17:00 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 10 Mar 2023 01:16:59 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Fri, 10 Mar 2023 01:16:59 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Fri, 10 Mar 2023 01:16:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EuSZ4EWSq6LangvFRWrXDgNeoWG+apeEsJGhNFMpHUSvbjvluf7FDJfD68M6sCz7H/vu8qnkjhfP0rLbrk1p7tmkvvfSnGrYyVhBS2Go/46uVypdjuNnkoMZT7z8HamgyyhzY5noa/A1SPdX9bG2A9JMvLyD4HvQX55A+No81tTrRKQ1RUOMn6vdqQmkz8NBUWoPl2JwTBXFdmwiniXRHOGMc1mj14ymfpJGvwX5bwCdSljlt9T/C2IGu1zEPHsvggOC2lZ6mm49MM/t6jvgdxloiPdwaqWg8YqxsJv20FMaDEhGCSnf2y8l79HM16igE/Vz2xRNV+vuDmifznWGbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=btlBJZXHWJ1ppaqCPXtusoNTQ0/CTN/hAQBbYQSABEY=;
 b=CBZEDyl5fhl7dgaRkx2o9FHJpwZ8fCcOaddLqdCL3/UcgpbKDE1tCxV3iq787oHbu84I3v3f4FdU2uENuikDv9CALt5MxnknfMp3XtKjflhN/8Dsld7hzJ0+9pzLhB86cdkOPhupuL4rwZbdw/k/cvpaCeikQiGcQ0+5xOovmr8FCOkPlYSoWTtr59w7G8I3/UnYOMRUp3APpYuAf/6m6nR+5Nv1Bb42DGnhr1r2ixOeBxUvuU/NFkRVvfHDuBKBywIkHBtMkS6XOCy+iW/NKsgvtZv0UVaq90rGAP8k3+JF0vj8bgP7fM43HtGM5m9F901bN9bFYfyugL6JfgQmpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH8PR11MB7144.namprd11.prod.outlook.com (2603:10b6:510:22c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.19; Fri, 10 Mar
 2023 09:16:49 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::66b:243c:7f3d:db9e]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::66b:243c:7f3d:db9e%3]) with mapi id 15.20.6156.028; Fri, 10 Mar 2023
 09:16:49 +0000
Date: Fri, 10 Mar 2023 17:14:02 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Sunita Nadampalli <sunitan@ti.com>
CC: <oe-kbuild-all@lists.linux.dev>, <vigneshr@ti.com>, <nm@ti.com>, "Praneeth
 Bajjuri" <praneeth@ti.com>
Subject: [ti:ti-rt-linux-5.10.y 8460/9999]
 drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included
 more than once.
Message-ID: <202303010448.DNdmOOVk-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR02CA0106.apcprd02.prod.outlook.com
 (2603:1096:4:92::22) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH8PR11MB7144:EE_
X-MS-Office365-Filtering-Correlation-Id: d162474c-f934-49a1-593a-08db21482db7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nVKE/BvtaGqxsPVHjBsdvSzKzh/GGFZOf3YHbU2ULEVuzKDDB7pzGChhtZXwENZJ6/uWzAwpfAh3uW3AcTAohUgqG20Bv/+v984EATifdHFUbMkdSo8qNSqNuQtyF/J4TM7OinaKU5nmpbC40mvDcS3iDEp0/2jaO3yysBjzJdx4FYAo8bSRW2SOANYl98Da3EfWvTIIdHgfbMNx5o6vmDp7T8nDRQXoXRJsdUxVoq+l2enU+yMjAE4AnnAJEVGK7YI66NW2egBG/NYWGLJGHrzTLQY9Lkacz7/S9zxBte7BYlLKJrl1kwgdbSN0VAejkULgm4SkNfyzfHZvCQ0N1SR0XABlLTdQ9oq6aADiijaJTe4OlQexYUbmfHeIubOsT6/UEGVb+/2jvos8SIrH4EbDJ+YLDE/cz1J3Prh4TIXYFboYoRR+tZEE1VsqHq1VIu3lBK17g83ouWWCG74E62S3NfXjNk227O5Pbw4ZapR7G2DMrl4q4kSZc3kWmpC1RIwP5yCO+FkP/om4eKAmAS528a2UEStYIxJipPAcsPyCiiZZlk6S5B6iYwMLctK3UDvV0NKgLm/xyjQzKkARwVckMY87UxVwqxJvQhf6dymfITLBJF9+goYxaeZ6gCKl6mvqGBmM4ovkTd9LaQMVOnmAruGiMwyZFMpLyJp5oM4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(39860400002)(346002)(366004)(136003)(376002)(451199018)(2616005)(478600001)(83380400001)(966005)(6486002)(26005)(186003)(6512007)(6506007)(6666004)(1076003)(66476007)(82960400001)(38100700002)(86362001)(66946007)(2906002)(4744005)(36756003)(5660300002)(8936002)(41300700001)(66556008)(6916009)(8676002)(4326008)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DWMUoSUQ6V/q0024yg9YmC4fMXmZ2zS2vB8b0RrUlsbDOgypwNb1a5iX5up5?=
 =?us-ascii?Q?ipmxxD3efALKM/QYLtJlQ13ViMQZUMq6c05PutjnUvOo/jz/6FzTRIfcwqUP?=
 =?us-ascii?Q?EypMuxXaph6ASp7bohMF5PJ7U+PtWzpfsneXIlkZW90lsBWqpAvAWvU4o+dz?=
 =?us-ascii?Q?nwd7EIiTJp4aHWXn2y399nbJNFRS75VKw1CeZaVpLAlgNH67AD2GJcRUave1?=
 =?us-ascii?Q?TNgOUoYuNQU8aM/rkbEcAkMIPtBcd+HVxxECrlAjVeiVg5EEMO1j1N4gSuHw?=
 =?us-ascii?Q?RcnyxR/2fRThQLQhhQShLf6kuRarEAbjpuUmClzxDyUuxuSBsXVvjaC0+sGH?=
 =?us-ascii?Q?gniH7QCrZlfRvVwh27Dfw4L0YS+qqYz2sNzdzW61IKkw9QiSZjZD1LeJg4pX?=
 =?us-ascii?Q?WAlLzq4CNHAZBFqKCmmDI90Ro9dwJI842Ua/kRnOdJ5Ztb5TYSBcMa9UTy4b?=
 =?us-ascii?Q?eBag1UeuCWDCSrfVBDd9Kn+KRbl0OLh1tJE9M3OLE1jt3JPqmuiBTbaBZZdk?=
 =?us-ascii?Q?W0QoZU/LEmHVXUqCCxOgCbPg/gWqkGjTaS53JLJz6N3wEqIXngHdTNjB6NKs?=
 =?us-ascii?Q?yVdBvBorruiqrP1eXO+ba8njK0rKGB0CkfK2eHHzeE1pyUzueSj5LyIEHfVP?=
 =?us-ascii?Q?1ElzpYSVoUYN+R3UW6A+9yQSHdScswldxRHKZR0wfj2aaRiwknj9QiqTw+z2?=
 =?us-ascii?Q?iTI5jeAjw/bF4nprQeSXIMJURbfslrWf4S/vA1R7XPXZ9x357b3Lm+Wo6umW?=
 =?us-ascii?Q?DLtofKVQy8WuwDdOFJuMDRvIWEsgC4u1X/a6fFTtD2T+OIsn0BAjP469QGRm?=
 =?us-ascii?Q?50eC2be2kbccqBkYKOdeeOrEczMoW9E0GvvyGqJCSpIUsZH7K3RqPRpOGe3l?=
 =?us-ascii?Q?Jc0pW6PCdW/VJnZJS0PbVduA5HozrQq+x0AzPXVBYGryzh216BivijolKLLv?=
 =?us-ascii?Q?HDAROgDVcsX7Qhkk4/EjuVWfMG+nFVWgPL4GWqzQdTnFHom5ldBj7DCS+wa+?=
 =?us-ascii?Q?8Yy8kmWrxpU9KclSp91a8d1VeS7mWZPOTPXdTVRKoTuIfVqqBowZmk9asU6Y?=
 =?us-ascii?Q?c27fK2GqR6GGBdrZ9I66XFZw/+63EWeBiD8n7xUNlGelRZ2w/y75AVp9kYA9?=
 =?us-ascii?Q?SWulo7zQOe7AVbSCWYxAp7R1v0YU2QSh1StDbqc99LqMdkn7g0BmSsEhueZU?=
 =?us-ascii?Q?vTJPNSHwlVRPct6Eu83M7mKQAALtBC3HUV8OBcfhIfkGtnpSXytydFQvuuWK?=
 =?us-ascii?Q?Sd8ID5aEh39A4Ops8pjy5Ktoxxr1UW6V2k9T41DxjZy0LIiZ8bpoDQjFoGxH?=
 =?us-ascii?Q?72ToIMxeUTs75XJKI6hqhbwRGc/XsmCUHqJdiPiYjjtkIVSmTvfGAfpmeapd?=
 =?us-ascii?Q?/8U3FXGgGd1M0P2hYLXpF9VhDBYaLP6yeVrw1v54BLJ825M+TI12nNuzhnBo?=
 =?us-ascii?Q?e+1ArwTFIN7zhgl4u+RYBxtjeHcb8P9DHkDKkgXpe/aps69qPhx08Ldq78sI?=
 =?us-ascii?Q?ON5yjliJ7uGBqOFhE4uvc0LDaO2iZfdASv7Xc3NB+RSpf4yNda87NeGW5aH+?=
 =?us-ascii?Q?jTNQ83e8DtYJW//M387HRAXhqVOHgOcI8xEaWRp0cK9tsPwbCYubdH/D86kK?=
 =?us-ascii?Q?lw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d162474c-f934-49a1-593a-08db21482db7
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2023 09:16:49.2971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vIuWg16A+/BLbUAXxJb/snEOXrbqL/8dk7a0EiPOl8aWdanfrchwo5dSy98pb3nfbAEVhF1+RQczMzGEswCfpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7144
X-OriginatorOrg: intel.com

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.10.y
head:   c1a12919117a6978f40e723d6e0c67c744e026b9
commit: f4b2488987a8152607348f34add9a6e858e18429 [8460/9999] v4l: vxe-enc: Add Device specific memory configuration
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Link: https://lore.kernel.org/r/202303010448.DNdmOOVk-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/media/platform/vxe-vxd/encoder/topaz_api.c: img_errors.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
