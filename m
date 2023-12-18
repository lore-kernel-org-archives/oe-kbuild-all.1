Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 894F320E6
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Dec 2023 01:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="abPXJJwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702864744; x=1734400744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SsnGKbe3jF4JIn/AmmmbCUZtiV35ZAP4XfLgkfFLMqM=;
  b=abPXJJwlndePUEe4RAJzf/7S+okOQrYE7V/4VmRI7RVjlsKyVy5LKI99
   r6hF9nEz1B3VxgqWhDEYwE4xx3eUSYmyXjax6TSoZqs0oGFLP1gZsA2on
   TX0Yc3XfNqTZ45whyEGmIt1w/kP14TPG5Zzj4fbgfGK7TNQpAOX/r59wC
   bHcIVjTbA1sHvUTtXokehtNZJ0PB0BN2DU4x5sO/9yxg/ECnHMLALLOuD
   556V/jDNRbVN52pcovmdrPTSBdZjwh36R8dPZ6ZoL5BiHDMYl94/5Sl8N
   UquDWi8qEJaZN7IZnJrvmx9lZ0imVLh/v0EtsWN8w2roGw/3t4ebuDzNe
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="14130149"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="14130149"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Dec 2023 17:59:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10927"; a="1106767667"
X-IronPort-AV: E=Sophos;i="6.04,284,1695711600"; 
   d="scan'208";a="1106767667"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 17 Dec 2023 17:59:02 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 17:59:02 -0800
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 17 Dec 2023 17:59:01 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 17 Dec 2023 17:59:01 -0800
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 17 Dec 2023 17:59:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jm69p3eRGKJ2gVa1UvMtqrche7psPHUiNRJdCctOVWKok35SRD3io7+nKgONKgBHGL/oViVY13pH20uPFXGcXlUO7WmbaGcplQ3yH2eXYg/qWoV3y3bgiOY6z2F+JN8W1IoRHK1MK/mT9qUZQWvAoT8VxXaS5Zbu+zV5r5bTzcidxCnYUQY4kLTRej/5boqU7LL8kpbp1zrUgZENAkMnl+BudSdEQIQnKD9h38Eux1ipKh+4AgILWTTdQiPPruDK1KhKzzj9iDJk6ObuvIa08zzA9iLcTX4vUJhmuu3pgnVme2W1NR74oaHhWHzJeu9Ic9cOyaQluGm4wWnWOr/STA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/zhjzPy88M2dV8XT+AHoj5mi5r0EkDvTW4rNjjcprck=;
 b=lRFjgqy3nCVrLIDBNCv5QyogGK+wyu+oWHWVBlvyM1jE3bX4odGSgz2o+1FVMA7bppKR/IXImjfekARPZzlaMAPq4scJc8cDK32RApe+xV9z2cZs9jAv+1qGrHx7Qn6xQsvbTvDLSPodixsrqUvHC44L4ohGbP8ZKWLNnpcPkiaAMsC3/r+eQSd9xqeREmJ4xzRvwP+xrF6Zmy3Y2Rxbpe3gE2rHQgvCSSF1CwNtPOoa7zoo76BDlHywcsSFDzrmHa6k0VNw8imgv6i9BwUHGAZ957kAtJF/nMLihV9yW+BENjRQSz/4zX3ja7yxXtOhOJKkOd5hrtCUdh/A5n7tNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by SA2PR11MB5051.namprd11.prod.outlook.com (2603:10b6:806:11f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.37; Mon, 18 Dec
 2023 01:58:58 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.7091.030; Mon, 18 Dec 2023
 01:58:58 +0000
Date: Mon, 18 Dec 2023 09:54:30 +0800
From: kernel test robot <yujie.liu@intel.com>
To: Christoph Hellwig <hch@lst.de>
CC: <oe-kbuild-all@lists.linux.dev>
Subject: [hch-xfs:xfs-zoned 62/62] fs/xfs/libxfs/xfs_sb.c: xfs_rtbitmap.h is
 included more than once.
Message-ID: <202312161220.XGWw0Crc-lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
X-ClientProxiedBy: SG2PR03CA0087.apcprd03.prod.outlook.com
 (2603:1096:4:7c::15) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|SA2PR11MB5051:EE_
X-MS-Office365-Filtering-Correlation-Id: 93a793f0-19c8-451d-baa6-08dbff6ce5c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KB/IlUm4EgxM3HNXIQv/03QD93hd98gK4lsur1Ilp/iXM1MhIT6A0b5J0qO9B9U16Uz+GtphdLWvRRXsCnV3OWp7RwBl1SHeiuDrfOsBaaAHdACb2cv8F+EgDeAd6NKMmi3+NZEtpCzxJDiD/kp2fuwnIw9Mv3baSqdYE6X6Vof20QjTqRZR0m+wQYEM/cVtnf38YMl/R1/N3wbhfnnjLAb2wfrQGmMbkxqfdhiIMV6y8y7Q9w7jiJvwmKw1rIUO+4rR7WHild1pFfMz+AX6aEEtQgpdajBTi+ysv8xvclDYr74KrohNj7LIQuU4zx7U7oaFatdzgFzvN6toPqtKs+eGR9pDDOWrj9W+ou9JC9QDLAg2BnT0UC9jOQppWUvM0XANOKTk5eNoI33WSmoia3XVtqoUP+VyqE7l+c7ga3b2k/BAneiXLoXeKhddOJ1AOhTZZCEC1yGDOvT78wkmuiqlIB1ZkGJSO8UNeezsiKiVNE8p04tn0Cy7npefnn1dDP77egHKeOCuboTqvY/VDtr5B/l9JKIGvevgqOrM6ZcatolWmXQ9ytPn74sjsRPkBklAcEwPiVf/aG8oNDRZCD32FIszam2HWcRUwcMyxQ/xg+1cOec1u1zcpfKLL9Cd4t9bvIBvlzTITfATrPYC1stZUpvJUwE2bpocfAVHw7k=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(136003)(39860400002)(346002)(366004)(396003)(230922051799003)(230173577357003)(230273577357003)(64100799003)(186009)(451199024)(1800799012)(1076003)(26005)(2616005)(82960400001)(38100700002)(36756003)(86362001)(83380400001)(5660300002)(6512007)(6506007)(6666004)(8676002)(4326008)(8936002)(66556008)(66946007)(316002)(6486002)(66476007)(6916009)(4744005)(966005)(2906002)(478600001)(41300700001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jEhyxXZ6jBG3z8TxhIiVBv/mkKv9xCswekfGLlaa3jAk8x7nUTtSu1Zw5d5z?=
 =?us-ascii?Q?m1McjERghnuyzo9T7ecamRybMo7NNBQszj+A6kpTFylu5JyXtqie5TwMYWzF?=
 =?us-ascii?Q?1Df1NgR395MPq5IstXi9GN5F8FrC2wFdQVtL/ymYwVGjeSKg+exQ+cLoToqX?=
 =?us-ascii?Q?OadPaDxurlpfFlFRPqULmRJGunCDPFDPzQgP4JORjF3rEb6KKu290eiSo/G9?=
 =?us-ascii?Q?SEEhekgFTh8MwJOyw8t0RHItLmcgTfZ9w8sFOYS1Y5lLuz6pwQLFagQ2WkkE?=
 =?us-ascii?Q?vbTBYDIkDFR2CBdiMm7LYm1/5demdnnq/yf05IhcMLwXstAzBWOESqTJb83s?=
 =?us-ascii?Q?DhnWPSJhGJhXqpoNNJzZgTmnDQeqwo/CHoUsd0UKSGV8ihtREMlpl4zY9ANf?=
 =?us-ascii?Q?Ai9SxaZEF4Gn8tOxjoaeNl7qsb+AwJ/aHAgl8FGR222+PpUNrvPyH0crfWi1?=
 =?us-ascii?Q?/zZxki7c3lBUiLLH14ohiM7hccfTTVVMiaDoQx9v+pJV3v7D3U9/k1A2H0j6?=
 =?us-ascii?Q?rh845+NvkM4PQP7rak62eCoOI6gGVHhpP3rCKzdOdUh63gfR+j6hBYhdOoeI?=
 =?us-ascii?Q?YGHfPhjuhqWmzAa/jyvW6p0sr5pwnQBt6L3LgMnXmJToMc41SpDfTZ8BvyIk?=
 =?us-ascii?Q?XhzH0Mbqo1TaKRYmQ98BQsazeV5DZxtBj3OGh2X6hbCtIHgnJNnGYtnuoijD?=
 =?us-ascii?Q?N/rqZk8bUWTVifC64GmdSPxIbEDkSPazEKqmKvRrSYHu5Jd2u8WdH1KZFO4Z?=
 =?us-ascii?Q?3c5C8WLJ8VnsoFXEUdsmW/h0F4IQIqXu6ZKH3uBATzzuydBugjCe8oHHgyzq?=
 =?us-ascii?Q?uIjAJthcRYK93TWb9MyaOKM2i+mGt0+1c9+t9KD7KbGGMa8fDTdaHXimepEE?=
 =?us-ascii?Q?D2G+KpesIomZ79xtRlWUN6kOsnLV9HKacBCBiOq5Dp1YfetZOgbm5d/o+460?=
 =?us-ascii?Q?OwaMglVTPrgVCfL4zgMg4q7LmOApOGehrLK766fzFM4JciksPcdmswLiQ2OG?=
 =?us-ascii?Q?8Onv8s1oDb3lhvrd5zc1ka8KQqP6RkxZeDRj9GOdsIx42OQmSfKWSyCpxh5O?=
 =?us-ascii?Q?aE3H416Rr7NOyOXI6XlyA3RwP5Wh3QzBSx6EwJrVWSPwx67i2/PGArwboalb?=
 =?us-ascii?Q?X13GtctGuc+xy/lkl02Y6BwdRx8M+TpT93Uy96aJfdNJP+yma6of7DE5gYeK?=
 =?us-ascii?Q?gguqM5Ks9CIfz/IsK6YjHJYi9BkEb+5mDjb433AACITZ/nRbg1Lr9vobj4LI?=
 =?us-ascii?Q?3mxq8KEjNtiuyiUxr9ZKnoVCM5Ey4GMw2qiMriPUtKjkhsZMpZ5R4W/oNA9G?=
 =?us-ascii?Q?w6cK4CocTuoomE7NzgIycgbZnMjKcv8NU/zhGk8qu7YXL3PhNSEBr0to8Fe0?=
 =?us-ascii?Q?khAI9cg+GMs+jeQK4KyMLmgMbOk26FM7uNstTxbb0AswfdmNSRW/8sulCYmO?=
 =?us-ascii?Q?Lm1XQ0K6kIDOc3uZPgRMO4Zy/8HC+D9urL45ApAfGW33zLjLkkITfSV0p9AK?=
 =?us-ascii?Q?NcKiFgZ6esVoz1pl5eruJoxcStDPOjrSsiJa8dNUsUZsaygZolxmOxLdynZL?=
 =?us-ascii?Q?4/nlvVs+9jHK8dWKHCP3ti8TnxU4tLRz8YWkGPeu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93a793f0-19c8-451d-baa6-08dbff6ce5c5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2023 01:58:58.0338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RlApBEYBSc+TmbM1iuoU0/srKTP0OVYIW6N7V/1q6digeJXvErKkf1GzYP6+1zP7qS3Lg1r51Oa8hF3Fevw7jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5051
X-OriginatorOrg: intel.com

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned
head:   60b5c8af1e240372d2e077071f06662efdccec3a
commit: 60b5c8af1e240372d2e077071f06662efdccec3a [62/62] xfs: support zoned RT devices
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <yujie.liu@intel.com>
| Closes: https://lore.kernel.org/r/202312161220.XGWw0Crc-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> fs/xfs/libxfs/xfs_sb.c: xfs_rtbitmap.h is included more than once.

vim +28 fs/xfs/libxfs/xfs_sb.c

  > 28	#include "xfs_rtbitmap.h"
    29	#include "xfs_swapext.h"
    30	#include "xfs_rtgroup.h"
    31	#include "xfs_rtrmap_btree.h"
    32	#include "xfs_rtrefcount_btree.h"
  > 33	#include "xfs_rtbitmap.h"
    34	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

