Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A2033FB
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Jan 2023 09:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674119798; x=1705655798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=988xQcln5Xohd1R2Q8hqL3GWELHB0UrOxJWbXx3R0qo=;
  b=EMnWGH14sT57/u071mbGnyObWl/aOZzmrCVRFWg+k25eJ9m7EGkMOegu
   5LMpomunlcqYRf4dnovshWQnu8GXQL+bClbwNI50wde4sfkXe7nofqsHy
   aR6jO4c5N5oLxbvjcoxGZlXnO3YLcv1K7HfVXNJ7zPUYwvFj2wnYmZV8g
   hbtJ0Jnm/Iq0dnMwSf+xSLB6LjtCMwb/GHtfH7cVeZ6SW/o7ZuImYtIYM
   HsDUB1KslbSAG3g7gubh+Vei2GPKLmS9F8TRvVARvsGg7B9fmTz4PRfF+
   UQKcsxaQoCWKdnifyyxL2DErRC7X65f/OxloUKz9iym3WjD+1CH71mdum
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="322923545"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="322923545"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2023 01:16:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="802563007"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="802563007"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga001.fm.intel.com with ESMTP; 19 Jan 2023 01:16:35 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 01:16:35 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 19 Jan 2023 01:16:35 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Thu, 19 Jan 2023 01:16:35 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Thu, 19 Jan 2023 01:16:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFPAZNeR4cJjemmlKAqPk+RenT/jyUiObB5bgEh/o9U7jIP0keWU5hRALDEIiMZdVm2++yWpLEiw5GGDwQuzfLpFx7zVLxsmsijfJRExRdelQaMBRNtmS/rDDnt7MoD6PcwqlQnKRmgNKufe+/Ag8EpRULux1fMMg0yvnSK5wQR6yMAH27LskQ/dmJCinX37e/H9v127hkIi2b6LQET+PSt+ZU+onsMuoTPozggJ760W8fnS7VsrpTYQ7yfu0qksVtFIbyop0naJU2NkRIRdIFnn0uLnRQ/9qUyP4hBxRxXH3grN8+x1qsqNIuahB+qV12AeNk3G0L1LNpF7fk/dQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzpQug5F3i0S4Jaa3Z0Ct9qZ9Oite/aXkT9dX4Yv2Pk=;
 b=lUMi+BVqHiRZhFnsQ/pTS2HoFnv1NjnhmHuQh58BPOgMOiLcnjsoOB/cTLlv0zID+uf9jnfWuoBcvb5JpHm+/oQ4irXrKO3snKAduxM4jX1upCS5Zbgt7rXPuIF4RgLdkV4XzusUeGA6KUOr8CF1A0eSGqMM0lUmB/oGWbDpyy9us4L7PHVNZf8KJaLG/boki4vR1uP0Egri58aaxV5b0c3OrCyzeOqyXwq4GPrgP02GzIAMas2BQrve9hZSj/yhzw64XvAIFrtJGdI87YGPWKWN4ggtCwvMg5Ni8mttxDRqIbwaVIPhlUm4bvSqLLOAfkJgmQt+0ufuOL/+FRrVyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by MN2PR11MB4726.namprd11.prod.outlook.com (2603:10b6:208:269::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25; Thu, 19 Jan
 2023 09:16:30 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::30e3:a7ab:35ba:93bb%9]) with mapi id 15.20.6002.013; Thu, 19 Jan 2023
 09:16:30 +0000
Date: Thu, 19 Jan 2023 17:14:36 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Nhat Pham <nphamcs@gmail.com>
CC: <oe-kbuild-all@lists.linux.dev>, Andrew Morton
	<akpm@linux-foundation.org>, Linux Memory Management List
	<linux-mm@kvack.org>
Subject: [akpm-mm:mm-hotfixes-unstable 25/30] mm/zsmalloc.c:940:13: warning:
 unused function 'obj_allocated'
Message-ID: <Y8kJ/BhadFcTkSxr@yujie-X299>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SGBP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::32)
 To CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|MN2PR11MB4726:EE_
X-MS-Office365-Filtering-Correlation-Id: f941fc21-202f-4c41-2823-08daf9fdd9bb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QvF53zLN7b79oMDpOzkxcSs1cJq4fZSx7s6zTfFT8y/IY8iybqQnVgUWmhoV51CfZ1bygs0hE9Y+khvd0FEF1gjox+c+JknSimO0trCy52HSrUj93I3+HbhhuvIK95t3Nh2b5KuuwHDwwsHTMIrB8TnEQqqziLAXBdrTaJGG14ECKtTuNagnd2JGQQchX341ShpT7S2U0jS5d/Xxbia3JRkNCAch+2OK+dYvJRLb6rv7xtp8ORJSgpiZkX0JkUWCKNgxkHZbfemgknNK44JNGNb6h2mstir2Xxq14/3TZ3HkOR5vRc66yZoI17F4CmEB236ZWbeXCa6HEJSiC33eRDwpOn6EGocoplQgFWVZOll9kq8KnCVYXHS62zmaKBZIAD/6QCcGk8U8iPlENUau9z3p1g5s68QjtDlGkEk/pdweHdPXS9823TUEdh/msBjSiAhyyP+IE4n83ZlarCoAkGVao5097jH/BcHEtwcM1Vya3yU6MTPZATsP3p9A6ZSDIq3l1ZCXL9pFdmHiwOfavYhvExdDf97hYMEQSFL98s8LykLfzIY9VWkShtRkp0vuE4FHFt5SUb0lvoRAF/TKGyZqXRQa9ejfFs78BsucvXPZcjBwExBINlKr/rgWsGt7UXa4jd1QK9BqPUANYeUxu7bFHREuxs/9i45ryH7HCCdk8d8MauCtlnsajZhI0w35ZymjLVdQsafqvVDq5NKExw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(366004)(376002)(346002)(396003)(39860400002)(136003)(451199015)(8936002)(33716001)(316002)(5660300002)(86362001)(966005)(6486002)(478600001)(6506007)(2906002)(54906003)(83380400001)(66556008)(66946007)(4326008)(6916009)(8676002)(66476007)(38100700002)(82960400001)(186003)(6512007)(26005)(9686003)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nT897sZRVNJHmoXX8CgovZgsyR1HvXPE8JdFCn61lrjH8gWLpvZK+ZYCXBwq?=
 =?us-ascii?Q?YN3DUVbwiIeX1Vswj3Q09BvebQvVY7Yc/b52QanzORqwPRCVEvZ5631z6GXG?=
 =?us-ascii?Q?3sjak0dFzcO76eQhVIu4/yU3zpD40QiKSGQqZV2o28ZED3cKwpD/DeOODl2/?=
 =?us-ascii?Q?4Cn1bHxvPQ6nZxhJb1GVO9U18oGaCbP2KKeqJdNSTisxTF9ZHnaqr0X53gSi?=
 =?us-ascii?Q?2EEmcdIoG1ofm1okvrea/2tt6in18DHXkuDEOtZNO7+cWa/LpEGr+RyG3nra?=
 =?us-ascii?Q?KbYCCcrCKAsWwVW3w3nSn63qAGZqRNDYr1x1djC6JYqFkZuuQfgM2m3ilnaD?=
 =?us-ascii?Q?Q8s4lO9W8XulSFl5YGspCV/OA7lO8X0dI+jdWTMPDXQWNaM7VeGk+ze0tPAB?=
 =?us-ascii?Q?d212VII4l6tcNZC/onMqCVoJAx0W08oKQ3VNwyVTNo+K5gDRiYOwFTSDiJ4h?=
 =?us-ascii?Q?FlF5KwDjZhWUuXzehS/YXP9vMza3R4W0SyCx/rGLCERY2Uyf4fw1z+Es+F4O?=
 =?us-ascii?Q?UY+Q7Cql9V6dH5YT84Djp8KwFJ0r/s5RAyT4CRPllTojQgwzBsM8HZeMR2V2?=
 =?us-ascii?Q?ZM7JZBV6yXawea7D2XKOMoPAx57oabKo3s0RWUenIZOJkUEIv/GKbP/yskFm?=
 =?us-ascii?Q?Xs2rSpAUDIkG9cZn59X0Rr1qg7K9B5rxQYcPDrDNIATicu9Y2XQUMND6IoHh?=
 =?us-ascii?Q?gT52fvOGvfdYFF2CmP0wkmTdBCfJymZMAJ8ylKiZud8MKbWOa4DpSBoKkip7?=
 =?us-ascii?Q?ZunntqGTwaudH1mnRzfwDmqcPAwPFqJixhotErVGCVzCqARCUzoYnugUeZlw?=
 =?us-ascii?Q?tyJNWxoq7rNtvyitph68m9ErdNO8QFzmYV/E92Ngx3zlnq4z3HsTGYSD528C?=
 =?us-ascii?Q?pox4STeKGrAYBO2uwKTj1ev98AEZNmZoQ3cjB9veu4IMMep8dBpj4/QUVNqM?=
 =?us-ascii?Q?zvCw11N8OMXMP4kh0aKNaFjFLN5sW0/pt58Ydk8DNLceEMbwbsT19RmEiUlu?=
 =?us-ascii?Q?V3n4YFhW8APF0BUfqJSSZWwi9w5PJbsgFj1g++DaQas6JUgMODe1dvSoKfzV?=
 =?us-ascii?Q?HehYYogdZD+ictvpw3bd+zrBoff0vkXEIcBA4Xa6jjGp+jJu0i+WbaSvlYl4?=
 =?us-ascii?Q?Of3N7imC30rvz1MLvPhqN8pjFEo8c7Qscc97UUst9KF0fbnuVUPV2Hac+zzW?=
 =?us-ascii?Q?S/vcunc2vsW4+MJE4euRhj2Znb837ul522u1AkZt8kKSPucVc28uv5tUFQ8n?=
 =?us-ascii?Q?KS8095421GLh/RAl2rOqtvELRiGzRlqReuoXzAORyxPt+V2P2+uFn7favSg2?=
 =?us-ascii?Q?SWA1Ymi4CkvOTitKyhLeKCByt0VzzIHVrx+BrWEr3pXg1/wWmEpZlgv4Jxsu?=
 =?us-ascii?Q?ViMVJO67Rn6ELP+E75ANYN/bh8Cmvx80gFO5n74Cl1wkCfMKo73SMc3JdZ0O?=
 =?us-ascii?Q?CZw069P82Q3itmKvBx7q/lAWtCtlU9Tw+n9hTzHfCWw0be5VQkjBaqA0o/oG?=
 =?us-ascii?Q?JHzKnXKf8wdrSL12E1Shfdgq3s1rQ02AnZmMC0+csgcck4/JXAeXP5WiQJQV?=
 =?us-ascii?Q?TaVPIqTx/AfdMbBrGVEPZy35eKhBxouJ99hn4OB0?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f941fc21-202f-4c41-2823-08daf9fdd9bb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 09:16:30.3028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LF0fcM54QWdHxa0yEO+7ZsB7eQJnUDIlzPCHxnZ/rSEEPiBbd2Xpy6YPFFsn30DbJS4B46a4KjQm/q9nQVJNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4726
X-OriginatorOrg: intel.com

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-hotfixes-unstable
head:   4de77094279d6b179bab4314bdca80e6694cfcf0
commit: f950c3c5d55be15a74d250edde93e404c6ecd409 [25/30] zsmalloc: fix a race with deferred_handles storing
config: hexagon-buildonly-randconfig-r001-20230118 (https://download.01.org/0day-ci/archive/20230119/202301190830.4tstTsgZ-lkp@intel.com/config)
compiler: clang version 16.0.0 (https://github.com/llvm/llvm-project 4196ca3278f78c6e19246e54ab0ecb364e37d66a)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git/commit/?id=f950c3c5d55be15a74d250edde93e404c6ecd409
        git remote add akpm-mm https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git
        git fetch --no-tags akpm-mm mm-hotfixes-unstable
        git checkout f950c3c5d55be15a74d250edde93e404c6ecd409
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=hexagon SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <yujie.liu@intel.com>

All warnings (new ones prefixed by >>):

>> mm/zsmalloc.c:940:13: warning: unused function 'obj_allocated' [-Wunused-function]
   static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
               ^

Please check if it needs to be guarded with a config.


vim +/obj_allocated +940 mm/zsmalloc.c

312fcae22703761 Minchan Kim 2015-04-15  939  
f950c3c5d55be15 Nhat Pham   2023-01-10 @940  static bool obj_allocated(struct page *page, void *obj, unsigned long *phandle)
f950c3c5d55be15 Nhat Pham   2023-01-10  941  {
f950c3c5d55be15 Nhat Pham   2023-01-10  942  	return obj_tagged(page, obj, phandle, OBJ_ALLOCATED_TAG);
f950c3c5d55be15 Nhat Pham   2023-01-10  943  }
f950c3c5d55be15 Nhat Pham   2023-01-10  944  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
